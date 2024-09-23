@implementation TILanguageModelAdaptationContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recipientContext, 0);
  objc_storeStrong((id *)&self->_recipientNameDigest, 0);
  objc_storeStrong((id *)&self->_appContext, 0);
}

- (NSString)recipientNameDigest
{
  return self->_recipientNameDigest;
}

- (TILanguageModelAdaptationContext)initWithClientIdentifier:(id)a3 andRecipientRecord:(id)a4
{
  id v6;
  id v7;
  TILanguageModelAdaptationContext *v8;
  uint64_t v9;
  NSString *appContext;
  NSDictionary *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSString *recipientNameDigest;
  NSDictionary *recipientContext;
  objc_super v21;

  v6 = a3;
  v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)TILanguageModelAdaptationContext;
  v8 = -[TILanguageModelAdaptationContext init](&v21, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    appContext = v8->_appContext;
    v8->_appContext = (NSString *)v9;

    v8->_isOnline = 1;
    if (v7)
    {
      v11 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(v7, "objectForKey:", CFSTR("compositeName"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        +[TICryptographer sharedCryptographer](TICryptographer, "sharedCryptographer");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stringDigestForName:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v14 = 0;
      }
      objc_msgSend(v7, "objectForKey:", CFSTR("firstName"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
        -[NSDictionary setObject:forKey:](v11, "setObject:forKey:", v15, *MEMORY[0x1E0D43518]);
      objc_msgSend(v7, "objectForKey:", CFSTR("lastName"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
        -[NSDictionary setObject:forKey:](v11, "setObject:forKey:", v16, *MEMORY[0x1E0D43510]);
      if (v14)
        -[NSDictionary setObject:forKey:](v11, "setObject:forKey:", v14, *MEMORY[0x1E0D43520]);
      v17 = objc_msgSend(v14, "copy");
      recipientNameDigest = v8->_recipientNameDigest;
      v8->_recipientNameDigest = (NSString *)v17;

      recipientContext = v8->_recipientContext;
      v8->_recipientContext = v11;

    }
  }

  return v8;
}

- (NSDictionary)recipientContext
{
  return self->_recipientContext;
}

- (TILanguageModelAdaptationContext)initWithClientIdentifier:(id)a3 andRecipientContactInfo:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  TILanguageModelAdaptationContext *v11;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "length"))
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    TIAddressBookFindRecordsMatchingRecipients(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
  v11 = -[TILanguageModelAdaptationContext initWithClientIdentifier:andRecipientRecord:](self, "initWithClientIdentifier:andRecipientRecord:", v6, v10);

  return v11;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("appContext=%@ recipientContext=%@"), self->_appContext, self->_recipientContext);
}

- (NSString)identifier
{
  NSString *recipientNameDigest;
  NSString *v3;

  recipientNameDigest = self->_recipientNameDigest;
  if (recipientNameDigest)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@@%@"), self->_appContext, recipientNameDigest);
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = self->_appContext;
  }
  return v3;
}

- (NSString)identifierForResponseKit
{
  return self->_recipientNameDigest;
}

- (id)copyWithZone:(_NSZone *)a3
{
  TILanguageModelAdaptationContext *v4;
  uint64_t v5;
  NSString *appContext;
  uint64_t v7;
  NSString *recipientNameDigest;

  v4 = objc_alloc_init(TILanguageModelAdaptationContext);
  v5 = -[NSString copy](self->_appContext, "copy");
  appContext = v4->_appContext;
  v4->_appContext = (NSString *)v5;

  objc_storeStrong((id *)&v4->_recipientContext, self->_recipientContext);
  v7 = -[NSString copy](self->_recipientNameDigest, "copy");
  recipientNameDigest = v4->_recipientNameDigest;
  v4->_recipientNameDigest = (NSString *)v7;

  return v4;
}

- (NSString)appContext
{
  return self->_appContext;
}

- (BOOL)isOnline
{
  return self->_isOnline;
}

- (void)setIsOnline:(BOOL)a3
{
  self->_isOnline = a3;
}

@end
