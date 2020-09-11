Pod::Spec.new do |s|

s.name         = "BiometricAuthentication"
s.version      = "3.1.2"

s.summary      = "Use Apple FaceID or TouchID authentication in your app using BiometricAuthentication."

s.description  = <<-DESC
BiometricAuthentication is very simple and easy to use that handles Touch ID and Face ID authentication based on the device.
                DESC

s.homepage     = ""
s.screenshots  = "", "", ""

s.license      = { :type => "MIT", :file => "LICENSE" }

s.author       = { "lautaro buson" => "busonlautaro@gmail.com" }
s.source       = { :git => "", :tag => "v#{s.version}" }

s.ios.deployment_target = '8.0'
s.source_files = "BiometricAuthentication/**/*.swift"

s.requires_arc = true
s.swift_version = "5.0"

end

