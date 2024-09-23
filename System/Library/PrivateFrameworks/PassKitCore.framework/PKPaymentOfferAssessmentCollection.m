@implementation PKPaymentOfferAssessmentCollection

- (PKPaymentOfferAssessmentCollection)initWithDictionary:(id)a3
{
  id v4;
  PKPaymentOfferAssessmentCollection *v5;
  uint64_t v6;
  NSString *sessionIdentifier;
  void *v8;
  PKPaymentOfferInstallmentAssessment *v9;
  PKPaymentOfferInstallmentAssessment *installmentAssessment;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PKPaymentOfferAssessmentCollection;
  v5 = -[PKPaymentOfferAssessmentCollection init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("sessionIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    sessionIdentifier = v5->_sessionIdentifier;
    v5->_sessionIdentifier = (NSString *)v6;

    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("installmentAssessment"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count"))
    {
      v9 = -[PKPaymentOfferInstallmentAssessment initWithDictionary:sessionIdentifier:]([PKPaymentOfferInstallmentAssessment alloc], "initWithDictionary:sessionIdentifier:", v8, v5->_sessionIdentifier);
      installmentAssessment = v5->_installmentAssessment;
      v5->_installmentAssessment = v9;

    }
  }

  return v5;
}

- (id)dictionaryRepresentation
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_sessionIdentifier, CFSTR("sessionIdentifier"));
  -[PKPaymentOfferInstallmentAssessment dictionaryRepresentation](self->_installmentAssessment, "dictionaryRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("installmentAssessment"));

  v5 = (void *)objc_msgSend(v3, "copy");
  return v5;
}

- (id)selectedPaymentOfferWithCriteriaIdentifier:(id)a3 paymentPass:(id)a4 sessionIdentifier:(id)a5 previousSelectedOfferIdentifier:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  PKSelectedPaymentOfferInstallment *v14;
  PKPaymentOfferInstallmentAssessment *installmentAssessment;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = 0;
  if (v11)
  {
    installmentAssessment = self->_installmentAssessment;
    if (installmentAssessment)
    {
      -[PKPaymentOfferInstallmentAssessment selectedOfferIdentifier](installmentAssessment, "selectedOfferIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentOfferInstallmentAssessment installmentOfferWithIdentifier:](self->_installmentAssessment, "installmentOfferWithIdentifier:", v16);
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = (void *)v17;
      if (v13 && !v17)
      {
        -[PKPaymentOfferInstallmentAssessment installmentOfferWithIdentifier:](self->_installmentAssessment, "installmentOfferWithIdentifier:", v13);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v13;

        v16 = v19;
      }
      if (v18)
      {
        v14 = -[PKSelectedPaymentOfferInstallment initWithInstallmentAssessment:selectedOfferIdentifier:criteriaIdentifier:paymentPass:sessionIdentifier:]([PKSelectedPaymentOfferInstallment alloc], "initWithInstallmentAssessment:selectedOfferIdentifier:criteriaIdentifier:paymentPass:sessionIdentifier:", self->_installmentAssessment, v16, v10, v11, v12);

      }
      else
      {
        v14 = 0;
      }

    }
  }

  return v14;
}

- (void)populatePreferredLanguage:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[PKPaymentOfferInstallmentAssessment offers](self->_installmentAssessment, "offers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "setPreferredLanguage:", v4);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)populateChallenge:(id)a3 verifier:(id)a4
{
  PKPaymentOfferInstallmentAssessment *installmentAssessment;
  id v6;
  id v7;
  id v8;

  installmentAssessment = self->_installmentAssessment;
  v6 = a4;
  v7 = a3;
  -[PKPaymentOfferInstallmentAssessment action](installmentAssessment, "action");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "populateChallenge:verifier:", v7, v6);

}

- (BOOL)isEqual:(id)a3
{
  PKPaymentOfferAssessmentCollection *v4;
  PKPaymentOfferAssessmentCollection *v5;
  PKPaymentOfferAssessmentCollection *v6;
  NSString *sessionIdentifier;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  _BOOL4 v11;
  char v12;
  PKPaymentOfferInstallmentAssessment *installmentAssessment;
  PKPaymentOfferInstallmentAssessment *v14;

  v4 = (PKPaymentOfferAssessmentCollection *)a3;
  v5 = v4;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = v5;
        sessionIdentifier = v6->_sessionIdentifier;
        v8 = self->_sessionIdentifier;
        v9 = sessionIdentifier;
        if (v8 == v9)
        {

        }
        else
        {
          v10 = v9;
          if (!v8 || !v9)
          {

LABEL_16:
            v12 = 0;
LABEL_18:

            goto LABEL_19;
          }
          v11 = -[NSString isEqualToString:](v8, "isEqualToString:", v9);

          if (!v11)
            goto LABEL_16;
        }
        installmentAssessment = self->_installmentAssessment;
        v14 = v6->_installmentAssessment;
        if (installmentAssessment && v14)
          v12 = -[PKPaymentOfferInstallmentAssessment isEqual:](installmentAssessment, "isEqual:");
        else
          v12 = installmentAssessment == v14;
        goto LABEL_18;
      }
    }
    v12 = 0;
  }
LABEL_19:

  return v12;
}

- (unint64_t)hash
{
  id v3;
  unint64_t v4;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_sessionIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_installmentAssessment);
  v4 = PKCombinedHash(17, v3);

  return v4;
}

- (id)description
{
  id v3;
  void *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  objc_msgSend(v3, "appendFormat:", CFSTR("sessionIdentifier: '%@'; "), self->_sessionIdentifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("installmentAssessment: '%@'; "), self->_installmentAssessment);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaymentOfferAssessmentCollection)initWithCoder:(id)a3
{
  id v4;
  PKPaymentOfferAssessmentCollection *v5;
  uint64_t v6;
  NSString *sessionIdentifier;
  uint64_t v8;
  PKPaymentOfferInstallmentAssessment *installmentAssessment;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPaymentOfferAssessmentCollection;
  v5 = -[PKPaymentOfferAssessmentCollection init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sessionIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    sessionIdentifier = v5->_sessionIdentifier;
    v5->_sessionIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("installmentAssessment"));
    v8 = objc_claimAutoreleasedReturnValue();
    installmentAssessment = v5->_installmentAssessment;
    v5->_installmentAssessment = (PKPaymentOfferInstallmentAssessment *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *sessionIdentifier;
  id v5;

  sessionIdentifier = self->_sessionIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", sessionIdentifier, CFSTR("sessionIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_installmentAssessment, CFSTR("installmentAssessment"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  PKPaymentOfferAssessmentCollection *v5;
  uint64_t v6;
  NSString *sessionIdentifier;
  PKPaymentOfferInstallmentAssessment *v8;
  PKPaymentOfferInstallmentAssessment *installmentAssessment;

  v5 = -[PKPaymentOfferAssessmentCollection init](+[PKPaymentOfferAssessmentCollection allocWithZone:](PKPaymentOfferAssessmentCollection, "allocWithZone:"), "init");
  v6 = -[NSString copyWithZone:](self->_sessionIdentifier, "copyWithZone:", a3);
  sessionIdentifier = v5->_sessionIdentifier;
  v5->_sessionIdentifier = (NSString *)v6;

  v8 = -[PKPaymentOfferInstallmentAssessment copyWithZone:](self->_installmentAssessment, "copyWithZone:", a3);
  installmentAssessment = v5->_installmentAssessment;
  v5->_installmentAssessment = v8;

  return v5;
}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void)setSessionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (PKPaymentOfferInstallmentAssessment)installmentAssessment
{
  return self->_installmentAssessment;
}

- (void)setInstallmentAssessment:(id)a3
{
  objc_storeStrong((id *)&self->_installmentAssessment, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_installmentAssessment, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
}

@end
