@implementation PKPassBalanceModel

- (PKPassBalanceModel)initWithBalances:(id)a3
{
  id v4;
  PKPassBalanceModel *v5;
  void *v6;
  uint64_t v7;
  NSDictionary *balancesByID;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKPassBalanceModel;
  v5 = -[PKPassBalanceModel init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "allObjects");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pk_indexDictionaryByApplyingBlock:", &__block_literal_global_207);
    v7 = objc_claimAutoreleasedReturnValue();
    balancesByID = v5->_balancesByID;
    v5->_balancesByID = (NSDictionary *)v7;

  }
  return v5;
}

id __39__PKPassBalanceModel_initWithBalances___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "identifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "anyObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)balanceForIdentifier:(id)a3
{
  return -[NSDictionary objectForKeyedSubscript:](self->_balancesByID, "objectForKeyedSubscript:", a3);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary allValues](self->_balancesByID, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(", "));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("{%@}"), v5);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPassBalanceModel)initWithCoder:(id)a3
{
  id v4;
  PKPassBalanceModel *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSDictionary *balancesByID;

  v4 = a3;
  v5 = -[PKPassBalanceModel init](self, "init");
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0C99E60]);
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = (void *)objc_msgSend(v6, "initWithObjects:", v7, v8, objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("balances"));
    v10 = objc_claimAutoreleasedReturnValue();
    balancesByID = v5->_balancesByID;
    v5->_balancesByID = (NSDictionary *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_balancesByID, CFSTR("balances"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_balancesByID, 0);
}

@end
