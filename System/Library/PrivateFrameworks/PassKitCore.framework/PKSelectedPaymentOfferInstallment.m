@implementation PKSelectedPaymentOfferInstallment

- (PKSelectedPaymentOfferInstallment)initWithInstallmentAssessment:(id)a3 selectedOfferIdentifier:(id)a4 criteriaIdentifier:(id)a5 paymentPass:(id)a6 sessionIdentifier:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  PKSelectedPaymentOfferInstallment *v20;
  objc_super v22;

  v13 = a3;
  v14 = a7;
  v15 = a6;
  v16 = a5;
  v17 = a4;
  objc_msgSend(v13, "installmentOfferWithIdentifier:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "serviceProviderData");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v22.receiver = self;
  v22.super_class = (Class)PKSelectedPaymentOfferInstallment;
  v20 = -[PKSelectedPaymentOffer initWithType:selectedOfferIdentifier:paymentPass:criteriaIdentifier:sessionIdentifier:serviceProviderData:](&v22, sel_initWithType_selectedOfferIdentifier_paymentPass_criteriaIdentifier_sessionIdentifier_serviceProviderData_, 1, v17, v15, v16, v14, v19);

  if (v20)
    objc_storeStrong((id *)&v20->_installmentAssessment, a3);

  return v20;
}

- (id)selectedInstallmentOffer
{
  PKPaymentOfferInstallmentAssessment *installmentAssessment;
  void *v3;
  void *v4;

  installmentAssessment = self->_installmentAssessment;
  -[PKSelectedPaymentOffer selectedOfferIdentifier](self, "selectedOfferIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentOfferInstallmentAssessment installmentOfferWithIdentifier:](installmentAssessment, "installmentOfferWithIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  PKSelectedPaymentOfferInstallment *v4;
  PKSelectedPaymentOfferInstallment *v5;
  PKSelectedPaymentOfferInstallment *v6;
  PKPaymentOfferInstallmentAssessment *installmentAssessment;
  PKPaymentOfferInstallmentAssessment *v8;
  BOOL v9;
  char v10;
  objc_super v12;

  v4 = (PKSelectedPaymentOfferInstallment *)a3;
  v5 = v4;
  if (self == v4)
  {
    v10 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    v12.receiver = self;
    v12.super_class = (Class)PKSelectedPaymentOfferInstallment;
    if (-[PKSelectedPaymentOffer isEqual:](&v12, sel_isEqual_, v6))
    {
      installmentAssessment = self->_installmentAssessment;
      v8 = v6->_installmentAssessment;
      if (installmentAssessment)
        v9 = v8 == 0;
      else
        v9 = 1;
      if (v9)
        v10 = installmentAssessment == v8;
      else
        v10 = -[PKPaymentOfferInstallmentAssessment isEqual:](installmentAssessment, "isEqual:");
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  id v3;
  id v4;
  unint64_t v5;
  objc_super v7;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_installmentAssessment);
  v7.receiver = self;
  v7.super_class = (Class)PKSelectedPaymentOfferInstallment;
  v4 = -[PKSelectedPaymentOffer hash](&v7, sel_hash);
  v5 = PKCombinedHash((uint64_t)v4, v3);

  return v5;
}

- (id)description
{
  id v3;
  unint64_t v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v4 = -[PKSelectedPaymentOffer type](self, "type");
  v5 = CFSTR("unknown");
  if (v4 == 1)
    v5 = CFSTR("installment");
  if (v4 == 2)
    v5 = CFSTR("rewards");
  objc_msgSend(v3, "appendFormat:", CFSTR("type: '%@'; "), v5);
  -[PKSelectedPaymentOffer selectedOfferIdentifier](self, "selectedOfferIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("selectedOfferIdentifier: '%@'; "), v6);

  objc_msgSend(v3, "appendFormat:", CFSTR("installmentAssessment: '%@'; "), self->_installmentAssessment);
  -[PKSelectedPaymentOffer criteriaIdentifier](self, "criteriaIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("criteriaIdentifier: '%@'; "), v7);

  -[PKSelectedPaymentOffer passUniqueID](self, "passUniqueID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("passUniqueID: '%@'; "), v8);

  -[PKSelectedPaymentOffer sessionIdentifier](self, "sessionIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("sessionIdentifier: '%@'; "), v9);

  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKSelectedPaymentOfferInstallment)initWithCoder:(id)a3
{
  id v4;
  PKSelectedPaymentOfferInstallment *v5;
  uint64_t v6;
  PKPaymentOfferInstallmentAssessment *installmentAssessment;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKSelectedPaymentOfferInstallment;
  v5 = -[PKSelectedPaymentOffer initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("installmentAssessment"));
    v6 = objc_claimAutoreleasedReturnValue();
    installmentAssessment = v5->_installmentAssessment;
    v5->_installmentAssessment = (PKPaymentOfferInstallmentAssessment *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKSelectedPaymentOfferInstallment;
  v4 = a3;
  -[PKSelectedPaymentOffer encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_installmentAssessment, CFSTR("installmentAssessment"), v5.receiver, v5.super_class);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[PKPaymentOfferInstallmentAssessment copyWithZone:](self->_installmentAssessment, "copyWithZone:", a3);
  v7 = (void *)v5[7];
  v5[7] = v6;

  return v5;
}

- (PKPaymentOfferInstallmentAssessment)installmentAssessment
{
  return self->_installmentAssessment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_installmentAssessment, 0);
}

@end
