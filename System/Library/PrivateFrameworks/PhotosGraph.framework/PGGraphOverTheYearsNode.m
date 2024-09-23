@implementation PGGraphOverTheYearsNode

- (PGGraphOverTheYearsNode)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PGGraphOverTheYearsNode;
  return -[PGGraphNode init](&v3, sel_init);
}

- (id)label
{
  __CFString *v2;

  v2 = CFSTR("OverTheYears");
  return CFSTR("OverTheYears");
}

- (unsigned)domain
{
  return 402;
}

- (unint64_t)featureType
{
  return 34;
}

- (NSString)featureIdentifier
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGGraphOverTheYearsNode label](self, "label");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@|%@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (id)collection
{
  return -[MANodeCollection initWithNode:]([PGGraphOverTheYearsNodeCollection alloc], "initWithNode:", self);
}

+ (id)filter
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A50]), "initWithLabel:domain:", CFSTR("OverTheYears"), 402);
}

@end
