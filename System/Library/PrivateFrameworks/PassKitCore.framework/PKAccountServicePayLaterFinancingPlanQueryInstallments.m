@implementation PKAccountServicePayLaterFinancingPlanQueryInstallments

- (PKAccountServicePayLaterFinancingPlanQueryInstallments)initWithInstallment:(id)a3 installmentIdentifierToFinancingPlan:(id)a4
{
  id v7;
  id v8;
  PKAccountServicePayLaterFinancingPlanQueryInstallments *v9;
  PKAccountServicePayLaterFinancingPlanQueryInstallments *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKAccountServicePayLaterFinancingPlanQueryInstallments;
  v9 = -[PKAccountServicePayLaterFinancingPlanQueryInstallments init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_installments, a3);
    objc_storeStrong((id *)&v10->_installmentIdentifierToFinancingPlan, a4);
  }

  return v10;
}

- (id)dictionaryRepresentation
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[PKAccountServicePayLaterFinancingPlanQueryInstallments _installmentIdentifiers](self, "_installmentIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("installments"));

  -[PKAccountServicePayLaterFinancingPlanQueryInstallments _installmentIdentifierToFinancingPlanDictionaryRepresentation](self, "_installmentIdentifierToFinancingPlanDictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("installmentIdentifierToFinancingPlan"));

  v6 = (void *)objc_msgSend(v3, "copy");
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAccountServicePayLaterFinancingPlanQueryInstallments)initWithCoder:(id)a3
{
  id v4;
  PKAccountServicePayLaterFinancingPlanQueryInstallments *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *installments;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSDictionary *installmentIdentifierToFinancingPlan;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PKAccountServicePayLaterFinancingPlanQueryInstallments;
  v5 = -[PKAccountServicePayLaterFinancingPlanQueryInstallments init](&v18, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("installments"));
    v9 = objc_claimAutoreleasedReturnValue();
    installments = v5->_installments;
    v5->_installments = (NSArray *)v9;

    v11 = (void *)MEMORY[0x1E0C99E60];
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    objc_msgSend(v11, "setWithObjects:", v12, v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("installmentIdentifierToFinancingPlan"));
    v15 = objc_claimAutoreleasedReturnValue();
    installmentIdentifierToFinancingPlan = v5->_installmentIdentifierToFinancingPlan;
    v5->_installmentIdentifierToFinancingPlan = (NSDictionary *)v15;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *installments;
  id v5;

  installments = self->_installments;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", installments, CFSTR("installments"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_installmentIdentifierToFinancingPlan, CFSTR("installmentIdentifierToFinancingPlan"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  PKAccountServicePayLaterFinancingPlanQueryInstallments *v5;
  uint64_t v6;
  NSArray *installments;
  uint64_t v8;
  NSDictionary *installmentIdentifierToFinancingPlan;

  v5 = -[PKAccountServicePayLaterFinancingPlanQueryInstallments init](+[PKAccountServicePayLaterFinancingPlanQueryInstallments allocWithZone:](PKAccountServicePayLaterFinancingPlanQueryInstallments, "allocWithZone:"), "init");
  v6 = -[NSArray copyWithZone:](self->_installments, "copyWithZone:", a3);
  installments = v5->_installments;
  v5->_installments = (NSArray *)v6;

  v8 = -[NSDictionary copyWithZone:](self->_installmentIdentifierToFinancingPlan, "copyWithZone:", a3);
  installmentIdentifierToFinancingPlan = v5->_installmentIdentifierToFinancingPlan;
  v5->_installmentIdentifierToFinancingPlan = (NSDictionary *)v8;

  return v5;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; "), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKAccountServicePayLaterFinancingPlanQueryInstallments _installmentIdentifiers](self, "_installmentIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("installment IDs: '%@'; "), v7);

  -[PKAccountServicePayLaterFinancingPlanQueryInstallments _installmentIdentifierToFinancingPlanDictionaryRepresentation](self, "_installmentIdentifierToFinancingPlanDictionaryRepresentation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("installmentID to financingPlanID: '%@'; "), v8);

  objc_msgSend(v6, "appendFormat:", CFSTR(">"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_installments);
  objc_msgSend(v3, "safelyAddObject:", self->_installmentIdentifierToFinancingPlan);
  v4 = PKCombinedHash(17, v3);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  PKAccountServicePayLaterFinancingPlanQueryInstallments *v4;
  PKAccountServicePayLaterFinancingPlanQueryInstallments *v5;
  BOOL v6;

  v4 = (PKAccountServicePayLaterFinancingPlanQueryInstallments *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKAccountServicePayLaterFinancingPlanQueryInstallments _isEqualToPayLaterFinancingPlanQueryInstallments:](self, "_isEqualToPayLaterFinancingPlanQueryInstallments:", v5);

  return v6;
}

- (BOOL)_isEqualToPayLaterFinancingPlanQueryInstallments:(id)a3
{
  _QWORD *v4;
  NSArray *installments;
  NSArray *v6;
  BOOL v7;
  char v8;
  NSDictionary *installmentIdentifierToFinancingPlan;
  NSDictionary *v11;

  v4 = a3;
  if (!v4)
    goto LABEL_8;
  installments = self->_installments;
  v6 = (NSArray *)v4[1];
  if (installments)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (!v7)
  {
    if ((-[NSArray isEqual:](installments, "isEqual:") & 1) != 0)
      goto LABEL_11;
LABEL_8:
    v8 = 0;
    goto LABEL_9;
  }
  if (installments != v6)
    goto LABEL_8;
LABEL_11:
  installmentIdentifierToFinancingPlan = self->_installmentIdentifierToFinancingPlan;
  v11 = (NSDictionary *)v4[2];
  if (installmentIdentifierToFinancingPlan && v11)
    v8 = -[NSDictionary isEqual:](installmentIdentifierToFinancingPlan, "isEqual:");
  else
    v8 = installmentIdentifierToFinancingPlan == v11;
LABEL_9:

  return v8;
}

- (id)_installmentIdentifiers
{
  return -[NSArray pk_arrayByApplyingBlock:](self->_installments, "pk_arrayByApplyingBlock:", &__block_literal_global_247_0);
}

uint64_t __81__PKAccountServicePayLaterFinancingPlanQueryInstallments__installmentIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "installmentIdentifier");
}

- (id)_installmentIdentifierToFinancingPlanDictionaryRepresentation
{
  id v3;
  NSDictionary *installmentIdentifierToFinancingPlan;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  installmentIdentifierToFinancingPlan = self->_installmentIdentifierToFinancingPlan;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __119__PKAccountServicePayLaterFinancingPlanQueryInstallments__installmentIdentifierToFinancingPlanDictionaryRepresentation__block_invoke;
  v8[3] = &unk_1E2ADB760;
  v9 = v3;
  v5 = v3;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](installmentIdentifierToFinancingPlan, "enumerateKeysAndObjectsUsingBlock:", v8);
  v6 = (void *)objc_msgSend(v5, "copy");

  return v6;
}

void __119__PKAccountServicePayLaterFinancingPlanQueryInstallments__installmentIdentifierToFinancingPlanDictionaryRepresentation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(a3, "planIdentifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v6, v5);

}

- (NSArray)installments
{
  return self->_installments;
}

- (NSDictionary)installmentIdentifierToFinancingPlan
{
  return self->_installmentIdentifierToFinancingPlan;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_installmentIdentifierToFinancingPlan, 0);
  objc_storeStrong((id *)&self->_installments, 0);
}

@end
