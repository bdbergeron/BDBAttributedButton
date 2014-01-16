Pod::Spec.new do |s|
  s.name      = 'BTButton'
  s.version   = '1.0.0'
  s.license   = 'MIT'
  s.summary   = 'A UIButton subclass with easy button styling!'
  s.homepage  = 'https://github.com/bdbergeron/BTButton'
  s.authors   = { 'Bradley David Bergeron' => 'brad@bradbergeron.com' }
  s.source    = { :git => 'https://github.com/bdbergeron/BTButton.git', :tag => s.version.to_s }
  s.requires_arc = true
  
  s.platform = :ios, '7.0'
  
  s.source_files        = 'BTButton/*.{h,m}'  
  s.public_header_files = 'BTButton/*.h'
end
