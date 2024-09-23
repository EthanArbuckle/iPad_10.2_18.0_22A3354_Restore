@implementation SFAutoFillOneTimeCodeEmbeddedDomainPair

- (BOOL)isEqual:(id)a3
{
  SFAutoFillOneTimeCodeEmbeddedDomainPair *v4;
  SFAutoFillOneTimeCodeEmbeddedDomainPair *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  int v9;

  v4 = (SFAutoFillOneTimeCodeEmbeddedDomainPair *)a3;
  if (self == v4)
  {
    LOBYTE(v9) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[SFAutoFillOneTimeCodeEmbeddedDomainPair domain](v5, "domain");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFAutoFillOneTimeCodeEmbeddedDomainPair domain](self, "domain");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isEqualToString:", v7))
      {
        v8 = -[SFAutoFillOneTimeCodeEmbeddedDomainPair strict](v5, "strict");
        v9 = v8 ^ -[SFAutoFillOneTimeCodeEmbeddedDomainPair strict](self, "strict") ^ 1;
      }
      else
      {
        LOBYTE(v9) = 0;
      }

    }
    else
    {
      LOBYTE(v9) = 0;
    }
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *domain;
  id v5;

  domain = self->_domain;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", domain, CFSTR("domain"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_strict, CFSTR("embeddedDomains"));

}

- (SFAutoFillOneTimeCodeEmbeddedDomainPair)initWithCoder:(id)a3
{
  id v4;
  SFAutoFillOneTimeCodeEmbeddedDomainPair *v5;
  uint64_t v6;
  NSString *domain;
  SFAutoFillOneTimeCodeEmbeddedDomainPair *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SFAutoFillOneTimeCodeEmbeddedDomainPair;
  v5 = -[SFAutoFillOneTimeCodeEmbeddedDomainPair init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("domain"));
    v6 = objc_claimAutoreleasedReturnValue();
    domain = v5->_domain;
    v5->_domain = (NSString *)v6;

    v5->_strict = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("embeddedDomains"));
    v8 = v5;
  }

  return v5;
}

- (NSString)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)strict
{
  return self->_strict;
}

- (void)setStrict:(BOOL)a3
{
  self->_strict = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domain, 0);
}

@end
