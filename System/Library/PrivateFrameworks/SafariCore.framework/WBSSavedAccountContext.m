@implementation WBSSavedAccountContext

+ (WBSSavedAccountContext)defaultContext
{
  if (defaultContext_onceToken != -1)
    dispatch_once(&defaultContext_onceToken, &__block_literal_global_53);
  return (WBSSavedAccountContext *)(id)defaultContext_defaultContext;
}

void __40__WBSSavedAccountContext_defaultContext__block_invoke()
{
  WBSSavedAccountContext *v0;
  void *v1;

  v0 = -[WBSSavedAccountContext initWithName:]([WBSSavedAccountContext alloc], "initWithName:", &stru_1E64A2498);
  v1 = (void *)defaultContext_defaultContext;
  defaultContext_defaultContext = (uint64_t)v0;

}

+ (id)_nameForDefaultSafariProfile
{
  return (id)objc_msgSend(CFSTR("SafariProfile-"), "stringByAppendingString:", CFSTR("DefaultProfile"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WBSSavedAccountContext)initWithName:(id)a3
{
  id v4;
  WBSSavedAccountContext *v5;
  void *v6;
  NSString *nameForPersistence;
  uint64_t v8;
  WBSSavedAccountContext *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)WBSSavedAccountContext;
  v5 = -[WBSSavedAccountContext init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend((id)objc_opt_class(), "_nameForDefaultSafariProfile");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isEqualToString:", v6))
    {
      nameForPersistence = v5->_nameForPersistence;
      v5->_nameForPersistence = (NSString *)&stru_1E64A2498;
    }
    else
    {
      v8 = objc_msgSend(v4, "copy");
      nameForPersistence = v5->_nameForPersistence;
      v5->_nameForPersistence = (NSString *)v8;
    }

    v9 = v5;
  }

  return v5;
}

- (WBSSavedAccountContext)initWithCoder:(id)a3
{
  id v4;
  WBSSavedAccountContext *v5;
  uint64_t v6;
  NSString *nameForPersistence;
  WBSSavedAccountContext *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WBSSavedAccountContext;
  v5 = -[WBSSavedAccountContext init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v6 = objc_claimAutoreleasedReturnValue();
    nameForPersistence = v5->_nameForPersistence;
    v5->_nameForPersistence = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[WBSSavedAccountContext initWithName:](+[WBSSavedAccountContext allocWithZone:](WBSSavedAccountContext, "allocWithZone:", a3), "initWithName:", self->_nameForPersistence);
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_nameForPersistence, CFSTR("name"));
}

- (WBSSavedAccountContext)initWithSafariProfileIdentifier:(id)a3
{
  id v4;
  WBSSavedAccountContext *v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(v4, "length") && (objc_msgSend(v4, "isEqualToString:", CFSTR("DefaultProfile")) & 1) == 0)
  {
    objc_msgSend(CFSTR("SafariProfile-"), "stringByAppendingString:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[WBSSavedAccountContext initWithName:](self, "initWithName:", v6);

  }
  else
  {
    v5 = -[WBSSavedAccountContext initWithName:](self, "initWithName:", &stru_1E64A2498);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  WBSSavedAccountContext *v4;
  char v5;

  v4 = (WBSSavedAccountContext *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = WBSIsEqual(self->_nameForPersistence, v4->_nameForPersistence);
    else
      v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_nameForPersistence, "hash");
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)WBSSavedAccountContext;
  -[WBSSavedAccountContext description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ name='%@'>"), v4, self->_nameForPersistence);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSString)nameForPersistence
{
  return self->_nameForPersistence;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nameForPersistence, 0);
}

@end
