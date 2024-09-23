@implementation PKPayLaterFinancingOptionTermsDetails

- (PKPayLaterFinancingOptionTermsDetails)initWithDictionary:(id)a3
{
  id v4;
  PKPayLaterFinancingOptionTermsDetails *v5;
  uint64_t v6;
  NSString *termsIdentifier;
  uint64_t v8;
  NSURL *termsURL;
  uint64_t v10;
  NSString *installmentAgreementIdentifier;
  uint64_t v12;
  NSString *riskPricingAgreementIdentifier;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKPayLaterFinancingOptionTermsDetails;
  v5 = -[PKPayLaterFinancingOptionTermsDetails init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("termsIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    termsIdentifier = v5->_termsIdentifier;
    v5->_termsIdentifier = (NSString *)v6;

    objc_msgSend(v4, "PKURLForKey:", CFSTR("termsURL"));
    v8 = objc_claimAutoreleasedReturnValue();
    termsURL = v5->_termsURL;
    v5->_termsURL = (NSURL *)v8;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("installmentAgreementIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    installmentAgreementIdentifier = v5->_installmentAgreementIdentifier;
    v5->_installmentAgreementIdentifier = (NSString *)v10;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("riskPricingAgreementIdentifier"));
    v12 = objc_claimAutoreleasedReturnValue();
    riskPricingAgreementIdentifier = v5->_riskPricingAgreementIdentifier;
    v5->_riskPricingAgreementIdentifier = (NSString *)v12;

  }
  return v5;
}

- (unint64_t)hash
{
  id v3;
  unint64_t v4;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_termsIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_termsURL);
  objc_msgSend(v3, "safelyAddObject:", self->_installmentAgreementIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_riskPricingAgreementIdentifier);
  v4 = PKCombinedHash(17, v3);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  PKPayLaterFinancingOptionTermsDetails *v4;
  PKPayLaterFinancingOptionTermsDetails *v5;
  PKPayLaterFinancingOptionTermsDetails *v6;
  NSString *termsIdentifier;
  NSString *v8;
  char v9;
  NSURL *termsURL;
  NSURL *v11;
  NSString *installmentAgreementIdentifier;
  NSString *v13;
  NSString *riskPricingAgreementIdentifier;
  NSString *v15;

  v4 = (PKPayLaterFinancingOptionTermsDetails *)a3;
  v5 = v4;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = v5;
        termsIdentifier = self->_termsIdentifier;
        v8 = v6->_termsIdentifier;
        if (termsIdentifier && v8)
        {
          if ((-[NSString isEqual:](termsIdentifier, "isEqual:") & 1) == 0)
            goto LABEL_23;
        }
        else if (termsIdentifier != v8)
        {
          goto LABEL_23;
        }
        termsURL = self->_termsURL;
        v11 = v6->_termsURL;
        if (termsURL && v11)
        {
          if ((-[NSURL isEqual:](termsURL, "isEqual:") & 1) == 0)
            goto LABEL_23;
        }
        else if (termsURL != v11)
        {
          goto LABEL_23;
        }
        installmentAgreementIdentifier = self->_installmentAgreementIdentifier;
        v13 = v6->_installmentAgreementIdentifier;
        if (installmentAgreementIdentifier && v13)
        {
          if ((-[NSString isEqual:](installmentAgreementIdentifier, "isEqual:") & 1) != 0)
          {
LABEL_19:
            riskPricingAgreementIdentifier = self->_riskPricingAgreementIdentifier;
            v15 = v6->_riskPricingAgreementIdentifier;
            if (riskPricingAgreementIdentifier && v15)
              v9 = -[NSString isEqual:](riskPricingAgreementIdentifier, "isEqual:");
            else
              v9 = riskPricingAgreementIdentifier == v15;
            goto LABEL_24;
          }
        }
        else if (installmentAgreementIdentifier == v13)
        {
          goto LABEL_19;
        }
LABEL_23:
        v9 = 0;
LABEL_24:

        goto LABEL_25;
      }
    }
    v9 = 0;
  }
LABEL_25:

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPayLaterFinancingOptionTermsDetails)initWithCoder:(id)a3
{
  id v4;
  PKPayLaterFinancingOptionTermsDetails *v5;
  uint64_t v6;
  NSString *termsIdentifier;
  uint64_t v8;
  NSURL *termsURL;
  uint64_t v10;
  NSString *installmentAgreementIdentifier;
  uint64_t v12;
  NSString *riskPricingAgreementIdentifier;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKPayLaterFinancingOptionTermsDetails;
  v5 = -[PKPayLaterFinancingOptionTermsDetails init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("termsIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    termsIdentifier = v5->_termsIdentifier;
    v5->_termsIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("termsURL"));
    v8 = objc_claimAutoreleasedReturnValue();
    termsURL = v5->_termsURL;
    v5->_termsURL = (NSURL *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("installmentAgreementIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    installmentAgreementIdentifier = v5->_installmentAgreementIdentifier;
    v5->_installmentAgreementIdentifier = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("riskPricingAgreementIdentifier"));
    v12 = objc_claimAutoreleasedReturnValue();
    riskPricingAgreementIdentifier = v5->_riskPricingAgreementIdentifier;
    v5->_riskPricingAgreementIdentifier = (NSString *)v12;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *termsIdentifier;
  id v5;

  termsIdentifier = self->_termsIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", termsIdentifier, CFSTR("termsIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_termsURL, CFSTR("termsURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_installmentAgreementIdentifier, CFSTR("installmentAgreementIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_riskPricingAgreementIdentifier, CFSTR("riskPricingAgreementIdentifier"));

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
  uint64_t v12;
  void *v13;

  v5 = (_QWORD *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v6 = -[NSString copyWithZone:](self->_termsIdentifier, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[NSURL copyWithZone:](self->_termsURL, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  v10 = -[NSString copyWithZone:](self->_installmentAgreementIdentifier, "copyWithZone:", a3);
  v11 = (void *)v5[3];
  v5[3] = v10;

  v12 = -[NSString copyWithZone:](self->_riskPricingAgreementIdentifier, "copyWithZone:", a3);
  v13 = (void *)v5[4];
  v5[4] = v12;

  return v5;
}

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("termsIdentifier: '%@'; "), self->_termsIdentifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("termsURL: '%@'; "), self->_termsURL);
  objc_msgSend(v3, "appendFormat:", CFSTR("installmentAgreementIdentifier: '%@'; "),
    self->_installmentAgreementIdentifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("riskPricingAgreementIdentifier: '%@'; "),
    self->_riskPricingAgreementIdentifier);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (NSURL)termsURL
{
  return self->_termsURL;
}

- (void)setTermsURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)termsIdentifier
{
  return self->_termsIdentifier;
}

- (void)setTermsIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)installmentAgreementIdentifier
{
  return self->_installmentAgreementIdentifier;
}

- (void)setInstallmentAgreementIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)riskPricingAgreementIdentifier
{
  return self->_riskPricingAgreementIdentifier;
}

- (void)setRiskPricingAgreementIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_riskPricingAgreementIdentifier, 0);
  objc_storeStrong((id *)&self->_installmentAgreementIdentifier, 0);
  objc_storeStrong((id *)&self->_termsIdentifier, 0);
  objc_storeStrong((id *)&self->_termsURL, 0);
}

@end
