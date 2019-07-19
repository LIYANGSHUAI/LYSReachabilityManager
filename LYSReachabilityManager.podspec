Pod::Spec.new do |s|
s.name         = "LYSReachabilityManager"
s.version      = "0.0.1"
s.summary      = "一句代码就能实现网络监听,解决每次新建项目都要重写网络监听逻辑"
s.description  = <<-DESC
一句代码就能实现网络监听,解决每次新建项目都要重写网络监听逻辑
一句代码就能实现网络监听,解决每次新建项目都要重写网络监听逻辑
DESC
s.homepage     = "https://github.com/LIYANGSHUAI/LYSReachabilityManager"
s.platform       = :ios
s.license      = "MIT"
s.author             = { "LIYANGSHUAI" => "liyangshuai163@163.com" }
s.source       = { :git => "https://github.com/LIYANGSHUAI/LYSReachabilityManager.git", :tag => "0.0.1" }
s.source_files  = "LYSGPasswordLoginKit/*.{h,m}"
s.dependency "AFNetworking", "~> 3.2.1"
end
