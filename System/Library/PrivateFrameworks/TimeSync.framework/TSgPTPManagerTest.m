@implementation TSgPTPManagerTest

+ (BOOL)mangled
{
  void *v2;

  v2 = (void *)objc_opt_class();
  return objc_msgSend(v2, "isSubclassOfClass:", objc_opt_class());
}

@end
