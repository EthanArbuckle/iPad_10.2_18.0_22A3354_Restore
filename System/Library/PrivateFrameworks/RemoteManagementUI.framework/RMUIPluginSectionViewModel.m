@implementation RMUIPluginSectionViewModel

+ (id)newPluginSectionViewModelWithHeading:(id)a3 viewModels:(id)a4
{
  id v5;
  id v6;
  RMUIPluginSectionViewModel *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[RMUIPluginSectionViewModel initWithHeading:viewModels:]([RMUIPluginSectionViewModel alloc], "initWithHeading:viewModels:", v6, v5);

  return v7;
}

- (RMUIPluginSectionViewModel)initWithHeading:(id)a3 viewModels:(id)a4
{
  id v7;
  id v8;
  RMUIPluginSectionViewModel *v9;
  RMUIPluginSectionViewModel *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)RMUIPluginSectionViewModel;
  v9 = -[RMUIPluginSectionViewModel init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_heading, a3);
    objc_storeStrong((id *)&v10->_viewModels, a4);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[RMUIPluginSectionViewModel heading](self, "heading");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("heading"));

  -[RMUIPluginSectionViewModel viewModels](self, "viewModels");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("viewModels"));

}

- (RMUIPluginSectionViewModel)initWithCoder:(id)a3
{
  id v4;
  RMUIPluginSectionViewModel *v5;
  void *v6;
  uint64_t v7;
  NSString *heading;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSArray *viewModels;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)RMUIPluginSectionViewModel;
  v5 = -[RMUIPluginSectionViewModel init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("heading"));
    v7 = objc_claimAutoreleasedReturnValue();
    heading = v5->_heading;
    v5->_heading = (NSString *)v7;

    v9 = (void *)MEMORY[0x24BDBCF20];
    v10 = objc_opt_class();
    objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("viewModels"));
    v12 = objc_claimAutoreleasedReturnValue();
    viewModels = v5->_viewModels;
    v5->_viewModels = (NSArray *)v12;

  }
  return v5;
}

- (NSString)heading
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setHeading:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSArray)viewModels
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setViewModels:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewModels, 0);
  objc_storeStrong((id *)&self->_heading, 0);
}

@end
