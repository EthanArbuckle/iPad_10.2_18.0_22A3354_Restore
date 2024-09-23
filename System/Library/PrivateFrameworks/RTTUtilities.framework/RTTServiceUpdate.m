@implementation RTTServiceUpdate

- (RTTServiceUpdate)initWithServiceUpdateType:(id)a3 options:(id)a4
{
  id v7;
  id v8;
  RTTServiceUpdate *v9;
  RTTServiceUpdate *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)RTTServiceUpdate;
  v9 = -[RTTServiceUpdate init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_serviceUpdateType, a3);
    objc_storeStrong((id *)&v10->_options, a4);
  }

  return v10;
}

- (id)optionValueForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[RTTServiceUpdate options](self, "options");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[RTTServiceUpdate options](self, "options");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "serviceUpdateType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", self->_serviceUpdateType);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v7.receiver = self;
  v7.super_class = (Class)RTTServiceUpdate;
  -[RTTServiceUpdate description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, self->_serviceUpdateType);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSString)serviceUpdateType
{
  return self->_serviceUpdateType;
}

- (void)setServiceUpdateType:(id)a3
{
  objc_storeStrong((id *)&self->_serviceUpdateType, a3);
}

- (NSDictionary)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  objc_storeStrong((id *)&self->_options, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_serviceUpdateType, 0);
}

@end
