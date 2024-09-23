@implementation LSBundleRecord

- (BOOL)mb_isContainerized
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[LSBundleRecord dataContainerURL](self, "dataContainerURL"));
  v3 = v2 != 0;

  return v3;
}

- (id)mb_entitlements
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[LSBundleRecord compatibilityObject](self, "compatibilityObject"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "entitlements"));

  return v3;
}

@end
