Pod::Spec.new do |s|

  s.name         = "Test"
  s.version      = "0.0.2"
  s.summary      = "This is a test."
  s.homepage     = "https://github.com/yhquan/test-git"
  s.license      = "Private"
  s.author       = { "yanghq" => "yanghq@fenbi.com" }
  s.source       = { :git => "git@github.com:yhquan/test-git.git", :tag => "#{s.version}" }
  s.source_files  = "Classes", "Classes/**/*.{h,m}"

end
