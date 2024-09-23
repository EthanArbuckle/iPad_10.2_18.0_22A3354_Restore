@implementation SXDefaultLayoutInstruction

+ (id)instruction
{
  return objc_alloc_init((Class)a1);
}

- (BOOL)isFulfilledForBlueprint:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "rootLayoutBlueprint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isComplete");

  return v4;
}

- (NSString)description
{
  return (NSString *)CFSTR("Require entire layout to be valid");
}

@end
