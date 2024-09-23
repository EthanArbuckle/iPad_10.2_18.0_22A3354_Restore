@implementation TSClockManagerTest

+ (BOOL)mangled
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (void *)objc_opt_class();
  if (!objc_msgSend(v2, "isSubclassOfClass:", objc_opt_class()))
    return 0;
  v3 = (void *)objc_opt_class();
  if (!objc_msgSend(v3, "isSubclassOfClass:", objc_opt_class()))
    return 0;
  v4 = (void *)objc_opt_class();
  if (!objc_msgSend(v4, "isSubclassOfClass:", objc_opt_class()))
    return 0;
  v5 = (void *)objc_opt_class();
  if (!objc_msgSend(v5, "isSubclassOfClass:", objc_opt_class()))
    return 0;
  v6 = (void *)objc_opt_class();
  if (!objc_msgSend(v6, "isSubclassOfClass:", objc_opt_class()))
    return 0;
  v7 = (void *)objc_opt_class();
  return objc_msgSend(v7, "isSubclassOfClass:", objc_opt_class());
}

@end
