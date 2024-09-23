@implementation CXCommon

+ (void)initialize
{
  CXUnqualifiedNamespace *v2;
  void *v3;

  if ((id)objc_opt_class() == a1)
  {
    v2 = objc_alloc_init(CXUnqualifiedNamespace);
    v3 = (void *)CXNoNamespace;
    CXNoNamespace = (uint64_t)v2;

    pDefaultExternalEntityLoader = xmlGetExternalEntityLoader();
  }
}

+ (void)ignoreExternalEntityLoader
{
  return xmlIgnoreExternalEntity;
}

+ (void)defaultExternalEntityLoader
{
  return pDefaultExternalEntityLoader;
}

@end
