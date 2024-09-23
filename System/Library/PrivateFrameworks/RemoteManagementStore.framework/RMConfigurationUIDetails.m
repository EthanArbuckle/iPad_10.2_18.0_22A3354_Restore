@implementation RMConfigurationUIDetails

+ (id)configurationUIWithTitle:(id)a3 description:(id)a4 details:(id)a5
{
  id v7;
  id v8;
  id v9;
  RMConfigurationUIDetails *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[RMConfigurationUIDetails initWithTitle:description:details:]([RMConfigurationUIDetails alloc], "initWithTitle:description:details:", v9, v8, v7);

  return v10;
}

- (RMConfigurationUIDetails)initWithTitle:(id)a3 description:(id)a4 details:(id)a5
{
  id v8;
  id v9;
  id v10;
  RMConfigurationUIDetails *v11;
  uint64_t v12;
  NSString *titleUI;
  uint64_t v14;
  NSString *descriptionUI;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)RMConfigurationUIDetails;
  v11 = -[RMConfigurationUIDetails init](&v17, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    titleUI = v11->_titleUI;
    v11->_titleUI = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    descriptionUI = v11->_descriptionUI;
    v11->_descriptionUI = (NSString *)v14;

    objc_storeStrong((id *)&v11->_detailsUI, a5);
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RMConfigurationUIDetails)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  RMConfigurationUIDetails *v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("description"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDBCF20];
  v8 = objc_opt_class();
  objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("details"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[RMConfigurationUIDetails initWithTitle:description:details:](self, "initWithTitle:description:details:", v5, v6, v10);
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[RMConfigurationUIDetails titleUI](self, "titleUI");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("title"));

  -[RMConfigurationUIDetails descriptionUI](self, "descriptionUI");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("description"));

  -[RMConfigurationUIDetails detailsUI](self, "detailsUI");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("details"));

}

- (BOOL)isEqual:(id)a3
{
  RMConfigurationUIDetails *v4;
  BOOL v5;

  v4 = (RMConfigurationUIDetails *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[RMConfigurationUIDetails isEqualToConfigurationUI:](self, "isEqualToConfigurationUI:", v4);
  }

  return v5;
}

- (BOOL)isEqualToConfigurationUI:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;

  v4 = a3;
  -[RMConfigurationUIDetails titleUI](self, "titleUI");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "titleUI");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", v6))
  {
    -[RMConfigurationUIDetails descriptionUI](self, "descriptionUI");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "descriptionUI");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v7;
    v10 = v8;
    v11 = v10;
    if (v9 == v10)
    {

    }
    else
    {
      LOBYTE(v12) = 0;
      v13 = v10;
      v14 = v9;
      if (!v9 || !v10)
        goto LABEL_10;
      v12 = objc_msgSend(v9, "isEqual:", v10);

      if (!v12)
        goto LABEL_11;
    }
    -[RMConfigurationUIDetails detailsUI](self, "detailsUI");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "detailsUI");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v12) = objc_msgSend(v14, "isEqualToArray:", v13);
LABEL_10:

LABEL_11:
    goto LABEL_12;
  }
  LOBYTE(v12) = 0;
LABEL_12:

  return v12;
}

- (NSString)titleUI
{
  return self->_titleUI;
}

- (NSString)descriptionUI
{
  return self->_descriptionUI;
}

- (NSArray)detailsUI
{
  return self->_detailsUI;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detailsUI, 0);
  objc_storeStrong((id *)&self->_descriptionUI, 0);
  objc_storeStrong((id *)&self->_titleUI, 0);
}

@end
