@implementation TSPortTest

+ (BOOL)mangled
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

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
  if (!objc_msgSend(v7, "isSubclassOfClass:", objc_opt_class()))
    return 0;
  v8 = (void *)objc_opt_class();
  if (!objc_msgSend(v8, "isSubclassOfClass:", objc_opt_class()))
    return 0;
  v9 = (void *)objc_opt_class();
  if (!objc_msgSend(v9, "isSubclassOfClass:", objc_opt_class()))
    return 0;
  v10 = (void *)objc_opt_class();
  if (!objc_msgSend(v10, "isSubclassOfClass:", objc_opt_class()))
    return 0;
  v11 = (void *)objc_opt_class();
  if (!objc_msgSend(v11, "isSubclassOfClass:", objc_opt_class()))
    return 0;
  v12 = (void *)objc_opt_class();
  if (!objc_msgSend(v12, "isSubclassOfClass:", objc_opt_class()))
    return 0;
  v13 = (void *)objc_opt_class();
  return objc_msgSend(v13, "isSubclassOfClass:", objc_opt_class());
}

@end
