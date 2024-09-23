@implementation NSObject(SystemApertureUIAdditions)

- (id)uniqueElementIdentifier
{
  id v1;
  void *v2;

  v1 = a1;
  objc_sync_enter(v1);
  objc_getAssociatedObject(v1, "com.apple.SystemAperture.elementUniqueIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v1);

  return v2;
}

@end
