#
# Be sure to run `pod lib lint TextFieldWrapper.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'TextFieldWrapper'
  s.version          = '0.1.0'
  s.summary          = 'A wrapper of UITextField.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Limit character input in TextField, trim string when character limit exit, get the character change event, validate inputed character range, modify placeholder color and font, all these functionality you will get with this Wrapper.
Also you will have eye catchy Zoom In/Out focus animation while editing and end of editing SMTextField. All you have to do is:
yourTextField.zoomScale = 1.4 // some value > 1
yourTextField.addBlurToView = self.view // In which view you want to add transparent blur effect.

This wrapper also gives you SMHoshiTextField which have the same effect of HoshiTextField form TextFieldEffects by Raúl Riera. It also has all the funtionality of SMTextField.
                       DESC

  s.homepage         = 'https://github.com/s1Moinuddin/TextFieldWrapper'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'S.M.Moinuddin' => 'shuvn.eee@gmail.com' }
  s.source           = { :git => 'https://github.com/s1Moinuddin/TextFieldWrapper.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'TextFieldWrapper/Classes/**/*'
  
  # s.resource_bundles = {
  #   'TextFieldWrapper' => ['TextFieldWrapper/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
