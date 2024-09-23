@implementation PKAccountUserInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  CNContact *creditPrimaryUser;
  id v5;

  creditPrimaryUser = self->_creditPrimaryUser;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", creditPrimaryUser, CFSTR("creditPrimaryUser"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_savingsUserInfo, CFSTR("savingsUserInfo"));

}

- (PKAccountUserInfo)initWithCoder:(id)a3
{
  id v4;
  PKAccountUserInfo *v5;
  uint64_t v6;
  CNContact *creditPrimaryUser;
  uint64_t v8;
  PKSavingsAccountUserInfo *savingsUserInfo;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKAccountUserInfo;
  v5 = -[PKAccountUserInfo init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("creditPrimaryUser"));
    v6 = objc_claimAutoreleasedReturnValue();
    creditPrimaryUser = v5->_creditPrimaryUser;
    v5->_creditPrimaryUser = (CNContact *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("savingsUserInfo"));
    v8 = objc_claimAutoreleasedReturnValue();
    savingsUserInfo = v5->_savingsUserInfo;
    v5->_savingsUserInfo = (PKSavingsAccountUserInfo *)v8;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[CNContact copyWithZone:](self->_creditPrimaryUser, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[PKSavingsAccountUserInfo copyWithZone:](self->_savingsUserInfo, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("creditPrimaryUser"), self->_creditPrimaryUser);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("savingsUserInfo"), self->_savingsUserInfo);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (CNContact)creditPrimaryUser
{
  return self->_creditPrimaryUser;
}

- (void)setCreditPrimaryUser:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (PKSavingsAccountUserInfo)savingsUserInfo
{
  return self->_savingsUserInfo;
}

- (void)setSavingsUserInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_savingsUserInfo, 0);
  objc_storeStrong((id *)&self->_creditPrimaryUser, 0);
}

@end
