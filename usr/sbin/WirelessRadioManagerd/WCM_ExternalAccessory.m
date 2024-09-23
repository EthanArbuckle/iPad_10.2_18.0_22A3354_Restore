@implementation WCM_ExternalAccessory

+ (id)create
{
  return objc_alloc_init(WCM_ExternalAccessoryIOS);
}

- (WCM_ExternalAccessory)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WCM_ExternalAccessory;
  return -[WCM_ExternalAccessory init](&v3, "init");
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)WCM_ExternalAccessory;
  -[WCM_ExternalAccessory dealloc](&v2, "dealloc");
}

- (int)eaConnection
{
  return self->_eaConnection;
}

- (void)setEaConnection:(int)a3
{
  self->_eaConnection = a3;
}

@end
