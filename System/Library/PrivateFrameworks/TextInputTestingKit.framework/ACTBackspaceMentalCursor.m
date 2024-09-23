@implementation ACTBackspaceMentalCursor

- (ACTBackspaceMentalCursor)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ACTBackspaceMentalCursor;
  return -[ACTBackspaceMentalCursor init](&v3, sel_init);
}

- (id)description
{
  void *v2;
  objc_class *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD17C8];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("<%@>"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
