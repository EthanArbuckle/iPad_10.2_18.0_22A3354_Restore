@implementation SignpostSupportSubsystemCategoryFilterEntry

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_subsystem, 0);
}

- (SignpostSupportSubsystemCategoryFilterEntry)initWithSubsystem:(id)a3 category:(id)a4
{
  id v7;
  id v8;
  void *v9;
  SignpostSupportSubsystemCategoryFilterEntry *v10;
  SignpostSupportSubsystemCategoryFilterEntry *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  if (!v7)
    -[SignpostSupportSubsystemCategoryFilterEntry initWithSubsystem:category:].cold.1();
  v9 = v8;
  v13.receiver = self;
  v13.super_class = (Class)SignpostSupportSubsystemCategoryFilterEntry;
  v10 = -[SignpostSupportSubsystemCategoryFilterEntry init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_subsystem, a3);
    objc_storeStrong((id *)&v11->_category, a4);
  }

  return v11;
}

- (NSString)category
{
  return self->_category;
}

- (NSString)subsystem
{
  return self->_subsystem;
}

- (void)initWithSubsystem:category:.cold.1()
{
  __assert_rtn("-[SignpostSupportSubsystemCategoryFilterEntry initWithSubsystem:category:]", "SignpostFilter.m", 16, "subsystem");
}

@end
