@implementation CLBundleLocationProviderContext

- (CLSilo)silo
{
  return self->_silo;
}

- (void)provider
{
  return self->_provider;
}

- (BOOL)isValid
{
  return self->_provider != 0;
}

- (CLBundleLocationProviderContext)initWithBundleLocationProvider:(void *)a3 inSilo:(id)a4
{
  CLBundleLocationProviderContext *v6;
  CLBundleLocationProviderContext *v7;
  id v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CLBundleLocationProviderContext;
  v6 = -[CLBundleLocationProviderContext init](&v10, "init");
  v7 = v6;
  if (v6)
  {
    v6->_provider = a3;
    v6->_silo = (CLSilo *)a4;
    v8 = a4;
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  self->_provider = 0;
  self->_silo = 0;
  v3.receiver = self;
  v3.super_class = (Class)CLBundleLocationProviderContext;
  -[CLBundleLocationProviderContext dealloc](&v3, "dealloc");
}

- (void)invalidate
{
  self->_provider = 0;
}

@end
