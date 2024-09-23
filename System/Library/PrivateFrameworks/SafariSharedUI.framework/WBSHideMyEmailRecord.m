@implementation WBSHideMyEmailRecord

- (WBSHideMyEmailRecord)initWithDomain:(id)a3 state:(unint64_t)a4 privateEmailAddress:(id)a5
{
  id v8;
  id v9;
  WBSHideMyEmailRecord *v10;
  uint64_t v11;
  NSString *domain;
  uint64_t v13;
  NSString *privateEmailAddress;
  WBSHideMyEmailRecord *v15;
  objc_super v17;

  v8 = a3;
  v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)WBSHideMyEmailRecord;
  v10 = -[WBSHideMyEmailRecord init](&v17, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    domain = v10->_domain;
    v10->_domain = (NSString *)v11;

    v10->_state = a4;
    v13 = objc_msgSend(v9, "copy");
    privateEmailAddress = v10->_privateEmailAddress;
    v10->_privateEmailAddress = (NSString *)v13;

    v15 = v10;
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  WBSHideMyEmailRecord *v4;
  WBSHideMyEmailRecord *v5;
  char v6;

  v4 = (WBSHideMyEmailRecord *)a3;
  if (v4 == self)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      if (self->_state == v5->_state && WBSIsEqual())
        v6 = WBSIsEqual();
      else
        v6 = 0;

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  const __CFString *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = self->_state - 1;
  if (v5 > 2)
    v6 = CFSTR("PrivateEmailExists");
  else
    v6 = off_1E5443EC0[v5];
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, domain: %@, state: %@, privateEmailAddress: %@>"), v4, self, self->_domain, v6, self->_privateEmailAddress);
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
  objc_msgSend(v5, "encodeInteger:forKey:", self->_state, CFSTR("state"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_privateEmailAddress, CFSTR("privateEmailAddress"));

}

- (WBSHideMyEmailRecord)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  WBSHideMyEmailRecord *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("domain"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("state"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("privateEmailAddress"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[WBSHideMyEmailRecord initWithDomain:state:privateEmailAddress:](self, "initWithDomain:state:privateEmailAddress:", v5, v6, v7);
  return v8;
}

- (NSString)domain
{
  return self->_domain;
}

- (unint64_t)state
{
  return self->_state;
}

- (NSString)privateEmailAddress
{
  return self->_privateEmailAddress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateEmailAddress, 0);
  objc_storeStrong((id *)&self->_domain, 0);
}

@end
