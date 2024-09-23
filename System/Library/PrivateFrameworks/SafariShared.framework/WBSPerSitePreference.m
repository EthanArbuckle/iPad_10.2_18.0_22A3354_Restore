@implementation WBSPerSitePreference

- (WBSPerSitePreference)initWithIdentifier:(id)a3
{
  id v4;
  WBSPerSitePreference *v5;
  uint64_t v6;
  NSString *identifier;
  WBSPerSitePreference *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WBSPerSitePreference;
  v5 = -[WBSPerSitePreference init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

+ (id)localizedStringForBinaryPreferenceValue:(id)a3
{
  objc_msgSend(a3, "BOOLValue");
  _WBSLocalizedString();
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p; identifier: %@>"),
               objc_opt_class(),
               self,
               self->_identifier);
}

- (BOOL)isEqual:(id)a3
{
  WBSPerSitePreference *v4;
  NSString *identifier;
  void *v6;
  char v7;

  v4 = (WBSPerSitePreference *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      identifier = self->_identifier;
      -[WBSPerSitePreference identifier](v4, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[NSString isEqualToString:](identifier, "isEqualToString:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_identifier, "hash");
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
