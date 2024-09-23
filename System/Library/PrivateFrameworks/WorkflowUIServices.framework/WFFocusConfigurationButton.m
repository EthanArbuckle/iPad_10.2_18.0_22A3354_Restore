@implementation WFFocusConfigurationButton

- (WFFocusConfigurationButton)initWithIdentifier:(id)a3 localizedTitle:(id)a4 isDestructive:(BOOL)a5
{
  id v9;
  id v10;
  WFFocusConfigurationButton *v11;
  WFFocusConfigurationButton *v12;
  WFFocusConfigurationButton *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)WFFocusConfigurationButton;
  v11 = -[WFFocusConfigurationButton init](&v15, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_identifier, a3);
    objc_storeStrong((id *)&v12->_localizedTitle, a4);
    v12->_isDestructive = a5;
    v13 = v12;
  }

  return v12;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[WFFocusConfigurationButton identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    -[WFFocusConfigurationButton identifier](self, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToString:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[WFFocusConfigurationButton identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("identifier"));

  -[WFFocusConfigurationButton localizedTitle](self, "localizedTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("localizedTitle"));

  objc_msgSend(v6, "encodeBool:forKey:", -[WFFocusConfigurationButton isDestructive](self, "isDestructive"), CFSTR("isDestructive"));
}

- (WFFocusConfigurationButton)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  WFFocusConfigurationButton *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedTitle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isDestructive"));

  v8 = -[WFFocusConfigurationButton initWithIdentifier:localizedTitle:isDestructive:](self, "initWithIdentifier:localizedTitle:isDestructive:", v5, v6, v7);
  return v8;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (BOOL)isDestructive
{
  return self->_isDestructive;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
