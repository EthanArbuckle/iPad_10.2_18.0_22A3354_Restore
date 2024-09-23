@implementation SBHStackConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  SBHStackConfiguration *v4;
  void *v5;
  void *v6;

  v4 = objc_alloc_init(SBHStackConfiguration);
  -[SBHStackConfiguration setAllowsSuggestions:](v4, "setAllowsSuggestions:", -[SBHStackConfiguration allowsSuggestions](self, "allowsSuggestions"));
  -[SBHStackConfiguration setAllowsExternalSuggestions:](v4, "setAllowsExternalSuggestions:", -[SBHStackConfiguration allowsExternalSuggestions](self, "allowsExternalSuggestions"));
  -[SBHStackConfiguration dataSources](self, "dataSources");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHStackConfiguration setDataSources:](v4, "setDataSources:", v5);

  -[SBHStackConfiguration sizeClass](self, "sizeClass");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHStackConfiguration setSizeClass:](v4, "setSizeClass:", v6);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SBHStackConfiguration)initWithCoder:(id)a3
{
  id v4;
  SBHStackConfiguration *v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *dataSources;
  void *v11;
  uint64_t v12;
  NSString *sizeClass;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SBHStackConfiguration;
  v5 = -[SBHStackConfiguration init](&v15, sel_init);
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0C99E60]);
    v7 = objc_opt_class();
    v8 = (void *)objc_msgSend(v6, "initWithObjects:", v7, objc_opt_class(), 0);
    v5->_allowsSuggestions = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("allowsSuggestions"));
    v5->_allowsExternalSuggestions = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("allowsExternalSuggestions"));
    objc_msgSend(v4, "decodeArrayOfObjectsOfClasses:forKey:", v8, CFSTR("dataSources"));
    v9 = objc_claimAutoreleasedReturnValue();
    dataSources = v5->_dataSources;
    v5->_dataSources = (NSArray *)v9;

    objc_opt_self();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v11, CFSTR("sizeClass"));
    v12 = objc_claimAutoreleasedReturnValue();
    sizeClass = v5->_sizeClass;
    v5->_sizeClass = (NSString *)v12;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[SBHStackConfiguration allowsSuggestions](self, "allowsSuggestions"), CFSTR("allowsSuggestions"));
  objc_msgSend(v4, "encodeBool:forKey:", -[SBHStackConfiguration allowsExternalSuggestions](self, "allowsExternalSuggestions"), CFSTR("allowsExternalSuggestions"));
  -[SBHStackConfiguration dataSources](self, "dataSources");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("dataSources"));

  -[SBHStackConfiguration sizeClass](self, "sizeClass");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("sizeClass"));

}

- (BOOL)allowsSuggestions
{
  return self->_allowsSuggestions;
}

- (void)setAllowsSuggestions:(BOOL)a3
{
  self->_allowsSuggestions = a3;
}

- (BOOL)allowsExternalSuggestions
{
  return self->_allowsExternalSuggestions;
}

- (void)setAllowsExternalSuggestions:(BOOL)a3
{
  self->_allowsExternalSuggestions = a3;
}

- (NSArray)dataSources
{
  return self->_dataSources;
}

- (void)setDataSources:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)sizeClass
{
  return self->_sizeClass;
}

- (void)setSizeClass:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sizeClass, 0);
  objc_storeStrong((id *)&self->_dataSources, 0);
}

@end
