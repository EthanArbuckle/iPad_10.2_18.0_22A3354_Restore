@implementation STUModelPropertyProvider_iOS

- (STUModelPropertyProvider_iOS)init
{
  STUModelPropertyProvider_iOS *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)STUModelPropertyProvider_iOS;
  v2 = -[STUModelPropertyProvider_iOS init](&v6, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "model"));
    -[STUDevicePropertyProvider setValue:](v2, "setValue:", v4);

  }
  return v2;
}

- (id)key
{
  return CRKDeviceModelKey;
}

@end
