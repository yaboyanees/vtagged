Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '430735060366684', '3cb186cfaa1579eb88bf903e9e34ccc1', 
           :scope => 'email', :display => 'popup'
end