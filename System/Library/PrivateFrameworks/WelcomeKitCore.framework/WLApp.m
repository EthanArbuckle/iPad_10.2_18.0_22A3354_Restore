@implementation WLApp

- (WLApp)initWithBundleIdentifier:(id)a3 appStoreIdentifier:(id)a4 isFree:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  WLApp *v10;
  WLApp *v11;
  objc_super v13;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)WLApp;
  v10 = -[WLApp init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    -[WLApp setBundleIdentifier:](v10, "setBundleIdentifier:", v8);
    -[WLApp setAppStoreIdentifier:](v11, "setAppStoreIdentifier:", v9);
    -[WLApp setIsFree:](v11, "setIsFree:", v5);
  }

  return v11;
}

- (BOOL)isFree
{
  return self->_isFree;
}

- (void)setIsFree:(BOOL)a3
{
  self->_isFree = a3;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)appStoreIdentifier
{
  return self->_appStoreIdentifier;
}

- (void)setAppStoreIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_appStoreIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appStoreIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
