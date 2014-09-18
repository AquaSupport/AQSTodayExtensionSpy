Pod::Spec.new do |s|
  s.name         = "AQSTodayExtensionSpy"
  s.version      = "0.1.0"
  s.summary      = "Determine whether the Today Extension has been opened or not."
  s.homepage     = "https://github.com/AquaSupport/AQSTodayExtensionSpy"
  s.license      = "MIT"
  s.author       = { "kaiinui" => "lied.der.optik@gmail.com" }
  s.source       = { :git => "https://github.com/AquaSupport/AQSTodayExtensionSpy.git", :tag => "v0.1.0" }
  s.source_files  = ["TodayExtensionSpy/Classes/**/*.{h,m}", "testtoday/Classes/**/*.{h,m}"
  s.requires_arc = true
  s.platform = "ios", '8.0'
end