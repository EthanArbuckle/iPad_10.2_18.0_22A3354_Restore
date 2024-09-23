@implementation WRM_WiFiCallingController

- (WRM_WiFiCallingController)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WRM_WiFiCallingController;
  return -[WRM_AVConferenceController init](&v3, "init");
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)WRM_WiFiCallingController;
  -[WRM_AVConferenceController dealloc](&v2, "dealloc");
}

- (id)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("WiFi Calling iRAT Manager Controller"));
}

@end
