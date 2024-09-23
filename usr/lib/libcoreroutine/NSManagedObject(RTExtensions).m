@implementation NSManagedObject(RTExtensions)

+ (id)entityName
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "entity");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
