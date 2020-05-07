
Pod::Spec.new do |s|

s.name         = "TestA"
s.version      = "1.0.1"
s.summary      = "TestA SDK."
s.description  = "TestA SDK for iOS."

s.homepage     = "http://www.yunduoketang.com"
s.license      = "MIT"
s.author       = { 'dxj' => 'qq@163.com' }

s.platform     = :ios, "11.0"
s.ios.deployment_target = "11.0"


s.source       = { :git => 'https://github.com/dongMan/dxjRouter.git', :tag => s.version.to_s }

s.requires_arc = true
s.static_framework = true
s.swift_version = '5.0'
s.prefix_header_contents = <<-DESC
  
  DESC
  
s.pod_target_xcconfig = {
  "GCC_PREPROCESSOR_DEFINITIONS" => "$(inherited) TestA_NAME=#{s.name} TestA_VERSION=#{s.version}"
}

#TestA组件
 s.subspec 'A' do |a|
 a.source_files = 'TestA/TestA/A/*.{h,m,swift}',
 'TestA/TestA/A/**/*.{h,m,swift}',
 'TestA/TestA/A/**/**/*.{h,m,swift}'
 
 a.resource =
 "TestA/TestA/A/*.{xib}",
 "TestA/TestA/A/**/*.{xib}",
 "TestA/TestA/A/**/**/*.{xib}"
 
 a.resource_bundles = {
   'TestA' => [
       'TestA/TestA/Assets.xcassets'
   ]
 }
 
 a.user_target_xcconfig = {
   "GCC_PREPROCESSOR_DEFINITIONS" => "PODTESTA=1",
   "OTHER_SWIFT_FLAGS" => "-D PODTESTA"
 }
 
 #a.prefix_header_file = 'TestA/TestA/A/TestA.pch'

 a.dependency 'TestBasis'

 a.ios.framework  = 'UIKit'
 end

end

