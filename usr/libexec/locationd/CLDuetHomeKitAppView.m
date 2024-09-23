@implementation CLDuetHomeKitAppView

- (CLDuetHomeKitAppView)initWithHomeUUID:(id)a3 viewUUID:(id)a4 viewName:(id)a5 viewInformation:(id)a6
{
  CLDuetHomeKitAppView *v10;
  CLDuetHomeKitAppView *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CLDuetHomeKitAppView;
  v10 = -[CLDuetHomeKitAppView init](&v13, "init");
  v11 = v10;
  if (v10)
  {
    -[CLDuetHomeKitAppView setHomeUUID:](v10, "setHomeUUID:", a3);
    -[CLDuetHomeKitAppView setViewUUID:](v11, "setViewUUID:", a4);
    -[CLDuetHomeKitAppView setViewName:](v11, "setViewName:", a5);
    -[CLDuetHomeKitAppView setViewInformation:](v11, "setViewInformation:", a6);
  }
  return v11;
}

- (void)dealloc
{
  objc_super v3;

  -[CLDuetHomeKitAppView setHomeUUID:](self, "setHomeUUID:", 0);
  -[CLDuetHomeKitAppView setViewUUID:](self, "setViewUUID:", 0);
  -[CLDuetHomeKitAppView setViewName:](self, "setViewName:", 0);
  -[CLDuetHomeKitAppView setViewInformation:](self, "setViewInformation:", 0);
  v3.receiver = self;
  v3.super_class = (Class)CLDuetHomeKitAppView;
  -[CLDuetHomeKitAppView dealloc](&v3, "dealloc");
}

- (NSString)homeUUID
{
  return self->_homeUUID;
}

- (void)setHomeUUID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (NSString)viewUUID
{
  return self->_viewUUID;
}

- (void)setViewUUID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (NSString)viewName
{
  return self->_viewName;
}

- (void)setViewName:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (NSString)viewInformation
{
  return self->_viewInformation;
}

- (void)setViewInformation:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

@end
