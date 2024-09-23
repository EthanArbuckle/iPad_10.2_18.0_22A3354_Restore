@implementation IPAImageIdentityTransform

- (BOOL)canAlignToPixelsExactly
{
  return 1;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@.%p>"), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
