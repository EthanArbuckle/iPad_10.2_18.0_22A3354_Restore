@implementation ICDelegationProviderServiceAssertion

- (ICDelegationProviderServiceAssertion)initWithName:(id)a3
{
  id v4;
  ICDelegationProviderServiceAssertion *v5;
  uint64_t v6;
  NSString *name;
  uint64_t v8;
  NSUUID *uniqueIdentifier;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ICDelegationProviderServiceAssertion;
  v5 = -[ICDelegationProviderServiceAssertion init](&v11, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    name = v5->_name;
    v5->_name = (NSString *)v6;

    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v8 = objc_claimAutoreleasedReturnValue();
    uniqueIdentifier = v5->_uniqueIdentifier;
    v5->_uniqueIdentifier = (NSUUID *)v8;

  }
  return v5;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  NSDate *expirationDate;
  NSString *name;
  __CFString *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  expirationDate = self->_expirationDate;
  name = self->_name;
  if (expirationDate)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" expirationDate:'%@"), self->_expirationDate);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = &stru_1E4391778;
  }
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p name:'%@'%@ uniqueIdentifier:%@>"), v5, self, name, v8, self->_uniqueIdentifier);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (expirationDate)

  return v9;
}

- (unint64_t)hash
{
  return ~-[NSUUID hash](self->_uniqueIdentifier, "hash");
}

- (BOOL)isEqual:(id)a3
{
  ICDelegationProviderServiceAssertion *v4;
  NSUUID *uniqueIdentifier;
  NSUUID *v6;
  char v7;
  NSDate *expirationDate;
  NSDate *v9;

  v4 = (ICDelegationProviderServiceAssertion *)a3;
  if (v4 == self)
    goto LABEL_11;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_12;
  uniqueIdentifier = self->_uniqueIdentifier;
  v6 = v4->_uniqueIdentifier;
  if (uniqueIdentifier != v6)
  {
    v7 = 0;
    if (!uniqueIdentifier || !v6)
      goto LABEL_13;
    if (!-[NSUUID isEqual:](uniqueIdentifier, "isEqual:"))
    {
LABEL_12:
      v7 = 0;
      goto LABEL_13;
    }
  }
  expirationDate = self->_expirationDate;
  v9 = v4->_expirationDate;
  if (expirationDate == v9)
  {
LABEL_11:
    v7 = 1;
    goto LABEL_13;
  }
  v7 = 0;
  if (expirationDate && v9)
    v7 = -[NSDate isEqualToDate:](expirationDate, "isEqualToDate:");
LABEL_13:

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *name;
  id v5;

  name = self->_name;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", name, CFSTR("name"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_uniqueIdentifier, CFSTR("uniqueIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_expirationDate, CFSTR("expirationDate"));

}

- (ICDelegationProviderServiceAssertion)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  ICDelegationProviderServiceAssertion *v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  uint64_t v10;
  NSDate *expirationDate;
  objc_super v13;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uniqueIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v13.receiver = self;
    v13.super_class = (Class)ICDelegationProviderServiceAssertion;
    v6 = -[ICDelegationProviderServiceAssertion init](&v13, sel_init);
    if (v6)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = (void *)v7;
      if (v7)
        v9 = (__CFString *)v7;
      else
        v9 = CFSTR("(unknown)");
      objc_storeStrong((id *)&v6->_name, v9);

      objc_storeStrong((id *)&v6->_uniqueIdentifier, v5);
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("expirationDate"));
      v10 = objc_claimAutoreleasedReturnValue();
      expirationDate = v6->_expirationDate;
      v6->_expirationDate = (NSDate *)v10;

    }
  }
  else
  {

    v6 = 0;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v5)
  {
    v6 = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
    v7 = (void *)v5[2];
    v5[2] = v6;

    v8 = -[NSUUID copyWithZone:](self->_uniqueIdentifier, "copyWithZone:", a3);
    v9 = (void *)v5[3];
    v5[3] = v8;

    v10 = -[NSDate copyWithZone:](self->_expirationDate, "copyWithZone:", a3);
    v11 = (void *)v5[1];
    v5[1] = v10;

  }
  return v5;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)name
{
  return self->_name;
}

- (NSUUID)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
