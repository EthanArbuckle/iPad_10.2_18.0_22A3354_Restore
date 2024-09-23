@implementation WTUIBSCompatibleAttributedString

+ (id)allowedClasses
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___WTUIBSCompatibleAttributedString;
  objc_msgSendSuper2(&v9, sel_allowedClasses);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDBCF20];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, v5, objc_opt_class(), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setByAddingObjectsFromSet:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
