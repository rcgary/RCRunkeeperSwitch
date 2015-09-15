#
#  Be sure to run `pod spec lint RCRunkeeperSwitch.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "RCRunkeeperSwitch"
  s.version      = "0.0.1"
  s.summary      = "A Objective C impltation for Runkeeper design switch control, it is a clone from DGRunkeeperSwitch"
  s.description  = <<-DESC
                  A Objective C impltation for Runkeeper design switch control, it is a clone from [DGRunkeeperSwitch](https://github.com/gontovnik/DGRunkeeperSwitch) 
                   DESC
  s.homepage     = "https://github.com/rcgary/RCRunkeeperSwitch"
  s.screenshots  = "https://raw.githubusercontent.com/rcgary/RCRunkeeperSwitch/master/RCRunkeeperSwitch.png", "https://raw.githubusercontent.com/rcgary/RCRunkeeperSwitch/master/RCRunkeeperSwitch.gif"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Chao Ruan" => "chaoruan818@gmail.com" }
  s.social_media_url   = "http://twitter.com/chaoruan"
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/rcgary/RCRunkeeperSwitch.git", :tag => "0.0.1" }
  s.source_files  = "RCRunkeeperSwitch/**/*.{h,m}"
  s.ios.frameworks = ['UIKit', 'Foundation']
  s.ios.deployment_target = '7.0'
  s.requires_arc = true

end
