@implementation NSObject(PLAdditions)

- (id)pl_briefDescription
{
  void *v2;
  objc_class *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("<%@: %p>"), v4, a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
