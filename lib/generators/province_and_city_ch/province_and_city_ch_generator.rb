class ProvinceAndCityChGenerator < ::Rails::Generators::Base
  source_root File.expand_path("../../../../", __FILE__)

  def create_province_and_city_file
    run "rails generate model base/province name:string"
    run "rails generate model base/city name:string province_id:integer city_type:integer"

    inject_into_class "app/models/base/province.rb", ::Base::Province do
      "  has_many :cities\n"
    end

    inject_into_class "app/models/base/city.rb", ::Base::City do
      "  belongs_to :province\n"
    end

    template "db/province.json", "db/province.json"
    template "db/city.json", "db/city.json"

    append_to_file "db/seeds.rb" , <<-CODE
STDOUT.puts " [Province City] start"
provinces = JSON.parse(IO.read('db/province.json'))
Base::Province.delete_all
provinces.each do |pro|
  p = Base::Province.new(name: pro['name'])
  p.id = pro['id']
  p.save
end
cities =JSON.parse(IO.read('db/city.json'))
Base::City.delete_all
cities.each do |city|
  c = Base::City.new(name: city['name'],province_id: city['province_id'])
  c.id = city['id']
  c.save
end
STDOUT.puts " [ImportBase] end"
    CODE

  end
end