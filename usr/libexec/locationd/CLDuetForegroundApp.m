@implementation CLDuetForegroundApp

- (CLDuetForegroundApp)initWithBundleId:(id)a3 launchReason:(id)a4
{
  CLDuetForegroundApp *v6;
  CLDuetForegroundApp *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CLDuetForegroundApp;
  v6 = -[CLDuetForegroundApp init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    -[CLDuetForegroundApp setBundleId:](v6, "setBundleId:", a3);
    -[CLDuetForegroundApp setLaunchReason:](v7, "setLaunchReason:", a4);
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[CLDuetForegroundApp setBundleId:](self, "setBundleId:", 0);
  -[CLDuetForegroundApp setLaunchReason:](self, "setLaunchReason:", 0);
  v3.receiver = self;
  v3.super_class = (Class)CLDuetForegroundApp;
  -[CLDuetForegroundApp dealloc](&v3, "dealloc");
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (NSString)launchReason
{
  return self->_launchReason;
}

- (void)setLaunchReason:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

@end
