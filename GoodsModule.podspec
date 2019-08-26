Pod::Spec.new do |s|

  s.name         = "GoodsModule"
  s.version      = "1.0.0"
  s.summary      = "GoodsModule."

  s.description  = <<-DESC
                    this is GoodsModule
                   DESC

  s.homepage     = "https://github.com/iOSShop/GoodsModule"

  s.license      = { :type => "MIT", :file => "FILE_LICENSE" }

  s.author             = { "cctomato" => "cctomato@outlook.com" }

  s.platform     = :ios, "8.0"

  s.source       = { :git => "https://github.com/iOSShop/GoodsModule.git", :tag => s.version }

  s.source_files  = "GoodsModule/GoodsModule/**/*.{h,m}"

  s.requires_arc = true

end
