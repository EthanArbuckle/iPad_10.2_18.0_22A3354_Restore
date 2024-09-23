@implementation PGTitleSpecPool

- (PGTitleSpecPool)initWithSpecs:(id)a3
{
  id v5;
  PGTitleSpecPool *v6;
  PGTitleSpecPool *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGTitleSpecPool;
  v6 = -[PGTitleSpecPool init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_specs, a3);

  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)PGTitleSpecPool;
  -[PGTitleSpecPool description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ specs %@"), v4, self->_specs);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSArray)specs
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specs, 0);
}

+ (id)poolWithSpecs:(id)a3
{
  id v3;
  PGTitleSpecPool *v4;

  v3 = a3;
  v4 = -[PGTitleSpecPool initWithSpecs:]([PGTitleSpecPool alloc], "initWithSpecs:", v3);

  return v4;
}

@end
