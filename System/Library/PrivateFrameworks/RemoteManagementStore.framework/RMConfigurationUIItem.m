@implementation RMConfigurationUIItem

+ (id)configurationUIItemWithConfiguration:(id)a3 details:(id)a4
{
  id v5;
  id v6;
  RMConfigurationUIItem *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[RMConfigurationUIItem initWithConfiguration:details:]([RMConfigurationUIItem alloc], "initWithConfiguration:details:", v6, v5);

  return v7;
}

+ (id)configurationUIItemWithIdentifier:(id)a3 serverToken:(id)a4 type:(id)a5 details:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  RMConfigurationUIItem *v13;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = -[RMConfigurationUIItem initWithIdentifier:serverToken:type:details:]([RMConfigurationUIItem alloc], "initWithIdentifier:serverToken:type:details:", v12, v11, v10, v9);

  return v13;
}

- (RMConfigurationUIItem)initWithConfiguration:(id)a3 details:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  RMConfigurationUIItem *v11;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "declarationIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "declarationServerToken");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "declarationType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[RMConfigurationUIItem initWithIdentifier:serverToken:type:details:](self, "initWithIdentifier:serverToken:type:details:", v8, v9, v10, v6);
  return v11;
}

- (RMConfigurationUIItem)initWithIdentifier:(id)a3 serverToken:(id)a4 type:(id)a5 details:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  RMConfigurationUIItem *v15;
  RMConfigurationUIItem *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)RMConfigurationUIItem;
  v15 = -[RMConfigurationUIItem init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_declarationIdentifier, a3);
    objc_storeStrong((id *)&v16->_declarationServerToken, a4);
    objc_storeStrong((id *)&v16->_declarationType, a5);
    objc_storeStrong((id *)&v16->_declarationDetails, a6);
  }

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RMConfigurationUIItem)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  RMConfigurationUIItem *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("server-token"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("type"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("details"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[RMConfigurationUIItem initWithIdentifier:serverToken:type:details:](self, "initWithIdentifier:serverToken:type:details:", v5, v6, v7, v8);
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[RMConfigurationUIItem declarationIdentifier](self, "declarationIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("identifier"));

  -[RMConfigurationUIItem declarationServerToken](self, "declarationServerToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("server-token"));

  -[RMConfigurationUIItem declarationType](self, "declarationType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("type"));

  -[RMConfigurationUIItem declarationDetails](self, "declarationDetails");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("details"));

}

- (BOOL)isEqual:(id)a3
{
  RMConfigurationUIItem *v4;
  BOOL v5;

  v4 = (RMConfigurationUIItem *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[RMConfigurationUIItem isEqualToConfigurationUI:](self, "isEqualToConfigurationUI:", v4);
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
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;

  v4 = a3;
  -[RMConfigurationUIItem declarationIdentifier](self, "declarationIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "declarationIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", v6))
  {
    -[RMConfigurationUIItem declarationServerToken](self, "declarationServerToken");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "declarationServerToken");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToString:", v8))
    {
      -[RMConfigurationUIItem declarationType](self, "declarationType");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "declarationType");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "isEqualToString:", v10))
      {
        -[RMConfigurationUIItem declarationDetails](self, "declarationDetails");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "declarationDetails");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "isEqual:", v12);

      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (NSString)declarationIdentifier
{
  return self->_declarationIdentifier;
}

- (NSString)declarationServerToken
{
  return self->_declarationServerToken;
}

- (NSString)declarationType
{
  return self->_declarationType;
}

- (RMConfigurationUIDetails)declarationDetails
{
  return self->_declarationDetails;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_declarationDetails, 0);
  objc_storeStrong((id *)&self->_declarationType, 0);
  objc_storeStrong((id *)&self->_declarationServerToken, 0);
  objc_storeStrong((id *)&self->_declarationIdentifier, 0);
}

@end
