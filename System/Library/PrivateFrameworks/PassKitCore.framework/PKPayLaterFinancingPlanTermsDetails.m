@implementation PKPayLaterFinancingPlanTermsDetails

- (PKPayLaterFinancingPlanTermsDetails)initWithDictionary:(id)a3
{
  id v4;
  PKPayLaterFinancingPlanTermsDetails *v5;
  uint64_t v6;
  NSString *installmentAgreementIdentifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPayLaterFinancingPlanTermsDetails;
  v5 = -[PKPayLaterFinancingPlanTermsDetails init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("installmentAgreementIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    installmentAgreementIdentifier = v5->_installmentAgreementIdentifier;
    v5->_installmentAgreementIdentifier = (NSString *)v6;

  }
  return v5;
}

- (id)dictionaryRepresentation
{
  id v3;
  void *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_installmentAgreementIdentifier, CFSTR("installmentAgreementIdentifier"));
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (unint64_t)hash
{
  id v3;
  unint64_t v4;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_installmentAgreementIdentifier);
  v4 = PKCombinedHash(17, v3);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  PKPayLaterFinancingPlanTermsDetails *v4;
  PKPayLaterFinancingPlanTermsDetails *v5;
  NSString *installmentAgreementIdentifier;
  NSString *v7;
  char v8;

  v4 = (PKPayLaterFinancingPlanTermsDetails *)a3;
  v5 = v4;
  if (self == v4)
  {
    v8 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    installmentAgreementIdentifier = self->_installmentAgreementIdentifier;
    v7 = v5->_installmentAgreementIdentifier;
    if (installmentAgreementIdentifier && v7)
      v8 = -[NSString isEqual:](installmentAgreementIdentifier, "isEqual:");
    else
      v8 = installmentAgreementIdentifier == v7;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPayLaterFinancingPlanTermsDetails)initWithCoder:(id)a3
{
  id v4;
  PKPayLaterFinancingPlanTermsDetails *v5;
  uint64_t v6;
  NSString *installmentAgreementIdentifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPayLaterFinancingPlanTermsDetails;
  v5 = -[PKPayLaterFinancingPlanTermsDetails init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("installmentAgreementIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    installmentAgreementIdentifier = v5->_installmentAgreementIdentifier;
    v5->_installmentAgreementIdentifier = (NSString *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_installmentAgreementIdentifier, CFSTR("installmentAgreementIdentifier"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;

  v5 = (_QWORD *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v6 = -[NSString copyWithZone:](self->_installmentAgreementIdentifier, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("installmentAgreementIdentifier: '%@'; "),
    self->_installmentAgreementIdentifier);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (NSString)installmentAgreementIdentifier
{
  return self->_installmentAgreementIdentifier;
}

- (void)setInstallmentAgreementIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_installmentAgreementIdentifier, 0);
}

@end
