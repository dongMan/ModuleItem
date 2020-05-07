Pod::Spec.new do |s|

s.name         = "TestC"
s.version      = "1.0.1"
s.summary      = "TestC SDK."
s.description  = "TestC SDK for iOS."

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
"GCC_PREPROCESSOR_DEFINITIONS" => "$(inherited) TestC_NAME=#{s.name} TestC_VERSION=#{s.version}"
}

s.user_target_xcconfig = {
  "GCC_PREPROCESSOR_DEFINITIONS" => "PODTESTC=1",
  "OTHER_SWIFT_FLAGS" => "-D PODTESTC"
}

#TestC组件
s.subspec 'C' do |c|
c.source_files = 'TestC/TestC/C/*.{h,m,swift}',
'TestC/TestC/C/**/*.{h,m,swift}'

c.resource =
"TestC/TestC/C/*.{xib}",
"TestC/TestC/C/**/*.{xib}"

c.resource_bundles = {
'TestC' => [
'TestC/TestC/Assets.xcassets'
]
}
c.dependency 'TestBasis'
c.ios.framework  = 'UIKit'
end


end
