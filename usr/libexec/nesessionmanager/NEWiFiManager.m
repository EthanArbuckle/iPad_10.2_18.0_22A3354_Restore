@implementation NEWiFiManager

- (NEWiFiManager)init
{
  NEWiFiManager *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NEWiFiManager;
  result = -[NEWiFiManager init](&v3, "init");
  if (result)
  {
    result->_wowRefCount = 0;
    result->_wifiManagerClient = 0;
  }
  return result;
}

@end
