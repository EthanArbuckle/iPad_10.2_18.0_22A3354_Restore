@implementation TTREMHashtag

+ (BOOL)isHashtag:(id)a3 equalToModelComparable:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  char v9;

  v5 = a4;
  objc_msgSend(a3, "objectIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "objectIdentifier");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    v9 = 0;
    if (v6 && v7)
      v9 = objc_msgSend(v6, "isEqualToString:", v7);
  }
  else
  {
    v8 = 0;
    v9 = 0;
  }

  return v9;
}

- (BOOL)isEqualToModelComparable:(id)a3
{
  return +[TTREMHashtag isHashtag:equalToModelComparable:](TTREMHashtag, "isHashtag:equalToModelComparable:", self, a3);
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[TTREMHashtag objectIdentifier](self, "objectIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  TTREMHashtag *v4;
  BOOL v5;

  v4 = (TTREMHashtag *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && +[TTREMHashtag isHashtag:equalToModelComparable:](TTREMHashtag, "isHashtag:equalToModelComparable:", self, v4);
  }

  return v5;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[TTREMHashtag objectIdentifier](self, "objectIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p objectIdentifier: %@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (TTREMHashtag)initWithCoder:(id)a3
{
  id v4;
  TTREMHashtag *v5;
  uint64_t v6;
  NSString *objectIdentifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TTREMHashtag;
  v5 = -[TTREMHashtag init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("objectIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    objectIdentifier = v5->_objectIdentifier;
    v5->_objectIdentifier = (NSString *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TTREMHashtag objectIdentifier](self, "objectIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("objectIdentifier"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)objectIdentifier
{
  return self->_objectIdentifier;
}

- (void)setObjectIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectIdentifier, 0);
}

@end
