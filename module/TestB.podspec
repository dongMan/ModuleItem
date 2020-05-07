Pod::Spec.new do |s|

s.name         = "TestB"
s.version      = "1.0.1"
s.summary      = "TestB SDK."
s.description  = "TestB SDK for iOS."

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
  "GCC_PREPROCESSOR_DEFINITIONS" => "$(inherited) TestB_NAME=#{s.name} TestB_VERSION=#{s.version}"
}

s.user_target_xcconfig = {
  "GCC_PREPROCESSOR_DEFINITIONS" => "PODTESTB=1",
  "OTHER_SWIFT_FLAGS" => "-D PODTESTB"
}

#TestB组件
   s.subspec 'B' do |b|
   b.source_files = 'TestB/TestB/B/*.{h,m,swift}',
   'TestB/TestB/B/**/*.{h,m,swift}'
   
   b.resource =
   "TestB/TestB/B/*.{xib}",
   "TestB/TestB/B/**/*.{xib}"
   
   b.resource_bundles = {
       'TestB' => [
           'TestB/TestB/Assets.xcassets'
       ]
   }
   b.dependency 'TestBasis'
   b.ios.framework  = 'UIKit'
   end
   
   end
