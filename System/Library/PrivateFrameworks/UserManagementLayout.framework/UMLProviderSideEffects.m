@implementation UMLProviderSideEffects

- (UMLProviderSideEffects)init
{
  UMLProviderSideEffects *v2;
  UMLProviderSideEffects *v3;
  UMAppleKeyStoreProvider *v4;
  UMFilesystemProvider *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UMLProviderSideEffects;
  v2 = -[UMLProviderSideEffects init](&v7, sel_init);
  if (!v2)
    sub_24999EF50();
  v3 = v2;
  v4 = objc_alloc_init(UMAppleKeyStoreProvider);
  sub_249994DA8((uint64_t)v3, v4);

  v5 = objc_alloc_init(UMFilesystemProvider);
  sub_249994DC4((uint64_t)v3, v5);

  return v3;
}

@end
