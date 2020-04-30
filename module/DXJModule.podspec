Pod::Spec.new do |s|
  
  s.name         = "DXJModule"
  s.version      = "1.0.0"
  s.summary      = "DXJModule SDK."
  s.description  = "DXJModule SDK for iOS."
  
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
    "GCC_PREPROCESSOR_DEFINITIONS" => "$(inherited) DXJModule_NAME=#{s.name} DXJModule_VERSION=#{s.version}"
  }
  
  
  #TestBasis组件
  s.subspec 'TestBasis' do |ss|
  
  
  ss.subspec "Base" do |sss|
    sss.source_files = ["Foundation/**/*.{h,m}", "UIKit/**/*.{h,m}"]
    sss.public_header_files = [ "Foundation/**/*.h", "UIKit/**/*.h"]
    sss.frameworks = ["Foundation", "UIKit"]
    sss.libraries = ['icucore', 'c++']
    
  end
  
  ss.subspec "BaseSDK" do |sss|
      sss.public_header_files =
      "TestBasis/BaseSDK/*.h",
      "TestBasis/BaseSDK/**/*.h"
      
      sss.source_files =
      "TestBasis/BaseSDK/*.h",
      "TestBasis/BaseSDK/*.swift",
      "TestBasis/BaseSDK/**/*.{h,m}"
      
      sss.frameworks = "OpenAL", "GLKit"
      sss.libraries = "iconv", "z", "sqlite3"
      
      sss.dependency 'FFToast', '1.2.0'
      sss.dependency 'MBProgressHUD'
      sss.dependency 'LKDBHelper', '2.5.1'
    end
    
    ### Config
    ss.subspec "Config" do |sss|
      sss.source_files  = "TestBasis/Config/*.swift"
      
    end
    
    ### Protocol
    ss.subspec "Protocol" do |sss|
      sss.source_files  = "TestBasis/Protocol/*.swift"
    end
    
    ### CTMediatorFile
    ss.subspec "CTMediatorFile" do |sss|
      sss.public_header_files = "TestBasis/CTMediatorFile/*.h"
      sss.source_files = "TestBasis/CTMediatorFile/*.{h,m,swift}"
      
      sss.dependency 'CTMediator'

    end
    
    ### Color
    ss.subspec "Color" do |sss|
      sss.source_files  = "TestBasis/Color/*.swift"
    end
    
    ### Network
    ss.subspec "Network" do |sss|
      sss.public_header_files =
      "TestBasis/Network/HttpSession/*.h",
      "TestBasis/Network/ReachabilityExt/*.h"
      
      sss.source_files =
      "TestBasis/Network/BaseNet/*.swift",
      "TestBasis/Network/BaseSocket/*.swift",
      "TestBasis/Network/HttpSession/*.{h,m,swift}",
      "TestBasis/Network/ReachabilityExt/*.{h,m}"
      
      ### 网络 解析
      sss.dependency 'HandyJSON', '~> 5.0.0'
      sss.dependency 'Alamofire', '~> 4.8.2'
      
      ### socket
      sss.dependency 'Socket.IO-Client-Swift', '13.2.1'
      
      sss.dependency 'Reachability'
      sss.dependency 'DXJModule/TestBasis/BaseSDK'
      
    end

    ### SSL
    ss.subspec "SSL" do |sss|
      sss.public_header_files = "TestBasis/SSL/*.h"
      sss.source_files = "TestBasis/SSL/*.{h,m}"
    end
    
  end
  
  
  #TestA组件
  s.subspec 'TestA' do |a|
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
  
  
  #a.prefix_header_file = 'TestA/TestA/A/TestA.pch'

  a.dependency 'DXJModule/TestBasis'

  a.ios.framework  = 'UIKit'
  end


    #TestB组件
    s.subspec 'TestB' do |b|
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
    b.dependency 'DXJModule/TestBasis'
    b.ios.framework  = 'UIKit'
    end

    #TestC组件
    s.subspec 'TestC' do |c|
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
    c.dependency 'DXJModule/TestBasis'
    c.ios.framework  = 'UIKit'
    end
  
  
end
