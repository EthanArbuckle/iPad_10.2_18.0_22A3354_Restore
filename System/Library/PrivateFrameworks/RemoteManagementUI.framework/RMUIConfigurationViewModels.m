@implementation RMUIConfigurationViewModels

- (RMUIConfigurationViewModels)initWithProfileViewModels:(id)a3 pluginSectionViewModels:(id)a4 pluginViewModels:(id)a5
{
  id v9;
  id v10;
  id v11;
  RMUIConfigurationViewModels *v12;
  RMUIConfigurationViewModels *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)RMUIConfigurationViewModels;
  v12 = -[RMUIConfigurationViewModels init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_profileViewModels, a3);
    objc_storeStrong((id *)&v13->_pluginSectionViewModels, a4);
    objc_storeStrong((id *)&v13->_pluginViewModels, a5);
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[RMUIConfigurationViewModels profileViewModels](self, "profileViewModels");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("profileViewModels"));

  -[RMUIConfigurationViewModels pluginSectionViewModels](self, "pluginSectionViewModels");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("pluginSectionViewModels"));

  -[RMUIConfigurationViewModels pluginViewModels](self, "pluginViewModels");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("pluginViewModels"));

}

- (RMUIConfigurationViewModels)initWithCoder:(id)a3
{
  id v4;
  RMUIConfigurationViewModels *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *profileViewModels;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSArray *pluginSectionViewModels;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSArray *pluginViewModels;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)RMUIConfigurationViewModels;
  v5 = -[RMUIConfigurationViewModels init](&v22, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("profileViewModels"));
    v9 = objc_claimAutoreleasedReturnValue();
    profileViewModels = v5->_profileViewModels;
    v5->_profileViewModels = (NSArray *)v9;

    v11 = (void *)MEMORY[0x24BDBCF20];
    v12 = objc_opt_class();
    objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("pluginSectionViewModels"));
    v14 = objc_claimAutoreleasedReturnValue();
    pluginSectionViewModels = v5->_pluginSectionViewModels;
    v5->_pluginSectionViewModels = (NSArray *)v14;

    v16 = (void *)MEMORY[0x24BDBCF20];
    v17 = objc_opt_class();
    objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("pluginViewModels"));
    v19 = objc_claimAutoreleasedReturnValue();
    pluginViewModels = v5->_pluginViewModels;
    v5->_pluginViewModels = (NSArray *)v19;

  }
  return v5;
}

- (NSArray)profileViewModels
{
  return self->_profileViewModels;
}

- (NSArray)pluginSectionViewModels
{
  return self->_pluginSectionViewModels;
}

- (NSArray)pluginViewModels
{
  return self->_pluginViewModels;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pluginViewModels, 0);
  objc_storeStrong((id *)&self->_pluginSectionViewModels, 0);
  objc_storeStrong((id *)&self->_profileViewModels, 0);
}

@end
