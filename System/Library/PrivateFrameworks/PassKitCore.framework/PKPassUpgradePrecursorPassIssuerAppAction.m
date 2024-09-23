@implementation PKPassUpgradePrecursorPassIssuerAppAction

- (PKPassUpgradePrecursorPassIssuerAppAction)initWithDictionary:(id)a3
{
  id v4;
  PKPassUpgradePrecursorPassIssuerAppAction *v5;
  uint64_t v6;
  NSString *appUrl;
  uint64_t v8;
  NSString *appIdentifier;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPassUpgradePrecursorPassIssuerAppAction;
  v5 = -[PKPassUpgradePrecursorPassAction initWithDictionary:](&v11, sel_initWithDictionary_, v4);
  if (v5)
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("app_url"));
    v6 = objc_claimAutoreleasedReturnValue();
    appUrl = v5->_appUrl;
    v5->_appUrl = (NSString *)v6;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("app_identifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    appIdentifier = v5->_appIdentifier;
    v5->_appIdentifier = (NSString *)v8;

    if (!v5->_appUrl && !v5->_appIdentifier)
    {

      v5 = 0;
    }
  }

  return v5;
}

- (id)asDictionary
{
  void *v3;
  void *v4;
  NSString *appUrl;
  void *v6;
  NSString *appIdentifier;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PKPassUpgradePrecursorPassIssuerAppAction;
  -[PKPassUpgradePrecursorPassAction asDictionary](&v11, sel_asDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  appUrl = self->_appUrl;
  if (appUrl)
  {
    v6 = (void *)-[NSString copy](appUrl, "copy");
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("app_url"));

  }
  appIdentifier = self->_appIdentifier;
  if (appIdentifier)
  {
    v8 = (void *)-[NSString copy](appIdentifier, "copy");
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("app_identifier"));

  }
  v9 = (void *)objc_msgSend(v4, "copy");

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPassUpgradePrecursorPassIssuerAppAction;
  v4 = a3;
  -[PKPassUpgradePrecursorPassAction encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_appUrl, CFSTR("app_url"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_appIdentifier, CFSTR("app_identifier"));

}

- (PKPassUpgradePrecursorPassIssuerAppAction)initWithCoder:(id)a3
{
  id v4;
  PKPassUpgradePrecursorPassIssuerAppAction *v5;
  uint64_t v6;
  NSString *appUrl;
  uint64_t v8;
  NSString *appIdentifier;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPassUpgradePrecursorPassIssuerAppAction;
  v5 = -[PKPassUpgradePrecursorPassAction initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("app_url"));
    v6 = objc_claimAutoreleasedReturnValue();
    appUrl = v5->_appUrl;
    v5->_appUrl = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("app_identifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    appIdentifier = v5->_appIdentifier;
    v5->_appIdentifier = (NSString *)v8;

  }
  return v5;
}

- (NSString)appUrl
{
  return self->_appUrl;
}

- (NSString)appIdentifier
{
  return self->_appIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appIdentifier, 0);
  objc_storeStrong((id *)&self->_appUrl, 0);
}

@end
