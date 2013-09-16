Pod::Spec.new do |s|
  s.name         = "CUSequenceAnimation"
  s.version      = "1.0"
  s.summary      = "序列图部分的动画封装，从plist中读取配置"

  s.description  = <<-DESC
                   序列图部分的动画封装，从plist中读取配置
                   DESC

  s.homepage     = "https://github.com/studentdeng/CUSequenceAnimation"
  s.license      = 'MIT'
  s.author       = { "curer" => "studentdeng@hotmail.com" }
  s.platform     = :ios, '5.0'

  s.source       = { :git => "https://github.com/studentdeng/CUSequenceAnimation", :tag => s.version.to_s }
  s.source_files  = 'source', 'source/**/*.{h,m}'
  s.requires_arc = true

  s.frameworks   = 'QuartzCore'

end