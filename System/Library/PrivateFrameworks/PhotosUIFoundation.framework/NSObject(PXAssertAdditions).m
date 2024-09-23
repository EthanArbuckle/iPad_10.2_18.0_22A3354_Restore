@implementation NSObject(PXAssertAdditions)

- (id)px_descriptionForAssertionMessage
{
  void *v2;
  objc_class *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD17C8];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("<%@: %p>"), v4, a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)px_descriptionForAssertionMessage
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromClass(a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("<%@>"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
