@implementation TLSystemApplication

+ (TLSystemApplication)defaultSystemApplication
{
  if (defaultSystemApplication__TLSystemApplicationSharedInstanceOnceToken != -1)
    dispatch_once(&defaultSystemApplication__TLSystemApplicationSharedInstanceOnceToken, &__block_literal_global_0);
  return (TLSystemApplication *)(id)defaultSystemApplication__TLSystemApplicationSharedInstance;
}

void __47__TLSystemApplication_defaultSystemApplication__block_invoke()
{
  TLSystemApplication *v0;
  void *v1;

  v0 = -[TLSystemApplication initWithBundleIdentifier:name:]([TLSystemApplication alloc], "initWithBundleIdentifier:name:", CFSTR("com.apple.springboard"), CFSTR("SpringBoard"));
  v1 = (void *)defaultSystemApplication__TLSystemApplicationSharedInstance;
  defaultSystemApplication__TLSystemApplicationSharedInstance = (uint64_t)v0;

}

- (TLSystemApplication)initWithBundleIdentifier:(id)a3 name:(id)a4
{
  id v6;
  id v7;
  TLSystemApplication *v8;
  uint64_t v9;
  NSString *bundleIdentifier;
  uint64_t v11;
  NSString *name;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)TLSystemApplication;
  v8 = -[TLSystemApplication init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    bundleIdentifier = v8->_bundleIdentifier;
    v8->_bundleIdentifier = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    name = v8->_name;
    v8->_name = (NSString *)v11;

  }
  return v8;
}

- (NSString)bundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
