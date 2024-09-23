@implementation CNVCardParsedParameter

+ (id)parameterWithName:(id)a3 values:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithName:values:", v7, v6);

  return v8;
}

- (CNVCardParsedParameter)initWithName:(id)a3 values:(id)a4
{
  id v6;
  id v7;
  CNVCardParsedParameter *v8;
  uint64_t v9;
  NSString *name;
  uint64_t v11;
  NSArray *values;
  CNVCardParsedParameter *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CNVCardParsedParameter;
  v8 = -[CNVCardParsedParameter init](&v15, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    name = v8->_name;
    v8->_name = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    values = v8->_values;
    v8->_values = (NSArray *)v11;

    v13 = v8;
  }

  return v8;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVCardParsedParameter name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVCardParsedParameter values](self, "values");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "componentsJoinedByString:", CFSTR(","));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p name='%@' values='%@'>"), v5, self, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSArray)values
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_values, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
