@implementation UMDProviderSideEffects

+ (id)sideEffects
{
  if (qword_1000E0028 != -1)
    dispatch_once(&qword_1000E0028, &stru_1000D1360);
  return (id)qword_1000E0020;
}

- (UMDProviderSideEffects)init
{
  UMDProviderSideEffects *v2;
  id v3;
  UMCommPageProvider *v4;
  UMDarwinDirectoryProvider *v5;
  id v6;
  UMMobileKeyBagProvider *v7;
  UMKPersonaProvider *v8;
  UMLibNotifyProvider *v9;
  UMProcessProvider *v10;
  UMSecurityProvider *v11;
  UMDProviderSideEffects *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)UMDProviderSideEffects;
  v2 = -[UMDProviderSideEffects init](&v14, "init");
  if (v2)
  {
    v3 = objc_alloc_init((Class)UMAppleKeyStoreProvider);
    sub_100084C08((uint64_t)v2, v3);

    v4 = objc_alloc_init(UMCommPageProvider);
    sub_10001C828((uint64_t)v2, v4);

    v5 = objc_alloc_init(UMDarwinDirectoryProvider);
    sub_10001C838((uint64_t)v2, v5);

    v6 = objc_alloc_init((Class)UMFilesystemProvider);
    sub_10001C848((uint64_t)v2, v6);

    v7 = objc_alloc_init(UMMobileKeyBagProvider);
    sub_10001C858((uint64_t)v2, v7);

    v8 = objc_alloc_init(UMKPersonaProvider);
    sub_10001C868((uint64_t)v2, v8);

    v9 = objc_alloc_init(UMLibNotifyProvider);
    sub_10001C878((uint64_t)v2, v9);

    v10 = objc_alloc_init(UMProcessProvider);
    sub_10001C888((uint64_t)v2, v10);

    v11 = objc_alloc_init(UMSecurityProvider);
    sub_10001C898((uint64_t)v2, v11);

    v12 = v2;
  }

  return v2;
}

@end
