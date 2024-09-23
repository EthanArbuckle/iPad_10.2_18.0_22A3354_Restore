@implementation REMTTHashtag

- (REMTTHashtag)initWithObjectIdentifier:(id)a3
{
  id v5;
  REMTTHashtag *v6;
  REMTTHashtag *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMTTHashtag;
  v6 = -[REMTTHashtag init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_objectIdentifier, a3);

  return v7;
}

+ (id)attributeName
{
  return CFSTR("_TTREMHashtag");
}

+ (id)attributeFromHashtag:(id)a3
{
  id v3;
  REMTTHashtag *v4;
  void *v5;
  REMTTHashtag *v6;

  v3 = a3;
  v4 = [REMTTHashtag alloc];
  objc_msgSend(v3, "objectIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[REMTTHashtag initWithObjectIdentifier:](v4, "initWithObjectIdentifier:", v5);
  return v6;
}

+ (BOOL)attributeValue:(id)a3 hasEqualHashtagObjectIdentifierIn:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;

  v5 = a4;
  v6 = a3;
  v7 = objc_opt_class();
  REMDynamicCast(v7, (uint64_t)v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "objectIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v5, "containsObject:", v9);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[REMTTHashtag objectIdentifier](self, "objectIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p objectIdentifier: %@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)objectIdentifier
{
  return self->_objectIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectIdentifier, 0);
}

@end
