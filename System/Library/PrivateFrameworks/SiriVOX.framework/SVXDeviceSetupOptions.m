@implementation SVXDeviceSetupOptions

- (SVXDeviceSetupOptions)initWithLanguageCode:(id)a3 gender:(int64_t)a4 hasActiveAccount:(int64_t)a5 isNewsRestricted:(int64_t)a6
{
  id v10;
  SVXDeviceSetupOptions *v11;
  uint64_t v12;
  NSString *languageCode;
  objc_super v15;

  v10 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SVXDeviceSetupOptions;
  v11 = -[SVXDeviceSetupOptions init](&v15, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v10, "copy");
    languageCode = v11->_languageCode;
    v11->_languageCode = (NSString *)v12;

    v11->_gender = a4;
    v11->_hasActiveAccount = a5;
    v11->_isNewsRestricted = a6;
  }

  return v11;
}

- (id)description
{
  return -[SVXDeviceSetupOptions _descriptionWithIndent:](self, "_descriptionWithIndent:", 0);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4;
  void *v5;
  unint64_t gender;
  __CFString *v7;
  NSString *languageCode;
  __CFString *v9;
  unint64_t hasActiveAccount;
  __CFString *v11;
  __CFString *v12;
  unint64_t isNewsRestricted;
  __CFString *v14;
  __CFString *v15;
  void *v16;
  objc_super v18;

  v4 = objc_alloc(MEMORY[0x24BDD17C8]);
  v18.receiver = self;
  v18.super_class = (Class)SVXDeviceSetupOptions;
  -[SVXDeviceSetupOptions description](&v18, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  gender = self->_gender;
  if (gender > 3)
    v7 = CFSTR("(unknown)");
  else
    v7 = off_24D24C478[gender];
  languageCode = self->_languageCode;
  v9 = v7;
  hasActiveAccount = self->_hasActiveAccount;
  if (hasActiveAccount > 2)
    v11 = CFSTR("(unknown)");
  else
    v11 = off_24D24BE28[hasActiveAccount];
  v12 = v11;
  isNewsRestricted = self->_isNewsRestricted;
  if (isNewsRestricted > 2)
    v14 = CFSTR("(unknown)");
  else
    v14 = off_24D24BE28[isNewsRestricted];
  v15 = v14;
  v16 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@ {languageCode = %@, gender = %@, hasActiveAccount = %@, isNewsRestricted = %@}"), v5, languageCode, v9, v12, v15);

  return v16;
}

- (unint64_t)hash
{
  NSUInteger v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;

  v3 = -[NSString hash](self->_languageCode, "hash");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_gender);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_hasActiveAccount);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_isNewsRestricted);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v5 ^ v7 ^ objc_msgSend(v8, "hash");

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  SVXDeviceSetupOptions *v4;
  SVXDeviceSetupOptions *v5;
  int64_t gender;
  int64_t hasActiveAccount;
  int64_t isNewsRestricted;
  NSString *v9;
  NSString *languageCode;
  BOOL v11;

  v4 = (SVXDeviceSetupOptions *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      gender = self->_gender;
      if (gender == -[SVXDeviceSetupOptions gender](v5, "gender")
        && (hasActiveAccount = self->_hasActiveAccount,
            hasActiveAccount == -[SVXDeviceSetupOptions hasActiveAccount](v5, "hasActiveAccount"))
        && (isNewsRestricted = self->_isNewsRestricted,
            isNewsRestricted == -[SVXDeviceSetupOptions isNewsRestricted](v5, "isNewsRestricted")))
      {
        -[SVXDeviceSetupOptions languageCode](v5, "languageCode");
        v9 = (NSString *)objc_claimAutoreleasedReturnValue();
        languageCode = self->_languageCode;
        v11 = languageCode == v9 || -[NSString isEqual:](languageCode, "isEqual:", v9);

      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (SVXDeviceSetupOptions)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  SVXDeviceSetupOptions *v12;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SVXDeviceSetupOptions::languageCode"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SVXDeviceSetupOptions::gender"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SVXDeviceSetupOptions::hasActiveAccount"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "integerValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SVXDeviceSetupOptions::isNewsRestricted"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "integerValue");
  v12 = -[SVXDeviceSetupOptions initWithLanguageCode:gender:hasActiveAccount:isNewsRestricted:](self, "initWithLanguageCode:gender:hasActiveAccount:isNewsRestricted:", v5, v7, v9, v11);

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *languageCode;
  id v5;
  void *v6;
  void *v7;
  id v8;

  languageCode = self->_languageCode;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", languageCode, CFSTR("SVXDeviceSetupOptions::languageCode"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_gender);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("SVXDeviceSetupOptions::gender"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_hasActiveAccount);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("SVXDeviceSetupOptions::hasActiveAccount"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_isNewsRestricted);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v8, CFSTR("SVXDeviceSetupOptions::isNewsRestricted"));

}

- (NSString)languageCode
{
  return self->_languageCode;
}

- (int64_t)gender
{
  return self->_gender;
}

- (int64_t)hasActiveAccount
{
  return self->_hasActiveAccount;
}

- (int64_t)isNewsRestricted
{
  return self->_isNewsRestricted;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_languageCode, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  void (**v4)(id, _SVXDeviceSetupOptionsMutation *);
  _SVXDeviceSetupOptionsMutation *v5;
  void *v6;

  v4 = (void (**)(id, _SVXDeviceSetupOptionsMutation *))a3;
  if (v4)
  {
    v5 = -[_SVXDeviceSetupOptionsMutation initWithBaseModel:]([_SVXDeviceSetupOptionsMutation alloc], "initWithBaseModel:", self);
    v4[2](v4, v5);
    -[_SVXDeviceSetupOptionsMutation generate](v5, "generate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = (void *)-[SVXDeviceSetupOptions copy](self, "copy");
  }

  return v6;
}

+ (id)newWithBuilder:(id)a3
{
  void (**v3)(id, _SVXDeviceSetupOptionsMutation *);
  _SVXDeviceSetupOptionsMutation *v4;
  void *v5;

  v3 = (void (**)(id, _SVXDeviceSetupOptionsMutation *))a3;
  v4 = objc_alloc_init(_SVXDeviceSetupOptionsMutation);
  if (v3)
    v3[2](v3, v4);
  -[_SVXDeviceSetupOptionsMutation generate](v4, "generate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
