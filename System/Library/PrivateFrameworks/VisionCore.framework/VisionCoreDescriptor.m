@implementation VisionCoreDescriptor

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  id v2;
  objc_class *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc(MEMORY[0x24BDD17C8]);
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("%@"), v4);

  return v5;
}

@end
