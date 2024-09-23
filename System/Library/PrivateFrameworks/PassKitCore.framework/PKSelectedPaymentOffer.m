@implementation PKSelectedPaymentOffer

- (PKSelectedPaymentOffer)initWithType:(unint64_t)a3 selectedOfferIdentifier:(id)a4 paymentPass:(id)a5 criteriaIdentifier:(id)a6 sessionIdentifier:(id)a7 serviceProviderData:(id)a8
{
  id v15;
  id v16;
  id v17;
  PKSelectedPaymentOffer *v18;
  PKSelectedPaymentOffer *v19;
  id v21;
  id v22;
  objc_super v23;

  v22 = a4;
  v21 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v23.receiver = self;
  v23.super_class = (Class)PKSelectedPaymentOffer;
  v18 = -[PKSelectedPaymentOffer init](&v23, sel_init);
  v19 = v18;
  if (v18)
  {
    v18->_type = a3;
    objc_storeStrong((id *)&v18->_selectedOfferIdentifier, a4);
    objc_storeStrong((id *)&v19->_paymentPass, a5);
    objc_storeStrong((id *)&v19->_criteriaIdentifier, a6);
    objc_storeStrong((id *)&v19->_sessionIdentifier, a7);
    objc_storeStrong((id *)&v19->_serviceProviderData, a8);
  }

  return v19;
}

- (id)passUniqueID
{
  return -[PKObject uniqueID](self->_paymentPass, "uniqueID");
}

- (BOOL)isEqual:(id)a3
{
  PKSelectedPaymentOffer *v4;
  PKSelectedPaymentOffer *v5;
  PKSelectedPaymentOffer *v6;
  NSString *selectedOfferIdentifier;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  _BOOL4 v11;
  BOOL v12;
  NSString *criteriaIdentifier;
  NSString *v14;
  _BOOL4 v15;
  PKPaymentPass *paymentPass;
  PKPaymentPass *v17;
  NSString *sessionIdentifier;
  NSString *v19;
  _BOOL4 v20;
  NSDictionary *serviceProviderData;
  NSDictionary *v23;

  v4 = (PKSelectedPaymentOffer *)a3;
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
        selectedOfferIdentifier = v6->_selectedOfferIdentifier;
        v8 = self->_selectedOfferIdentifier;
        v9 = selectedOfferIdentifier;
        if (v8 == v9)
        {

        }
        else
        {
          v10 = v9;
          if (!v8 || !v9)
            goto LABEL_28;
          v11 = -[NSString isEqualToString:](v8, "isEqualToString:", v9);

          if (!v11)
            goto LABEL_29;
        }
        criteriaIdentifier = v6->_criteriaIdentifier;
        v8 = self->_criteriaIdentifier;
        v14 = criteriaIdentifier;
        if (v8 == v14)
        {

        }
        else
        {
          v10 = v14;
          if (!v8 || !v14)
            goto LABEL_28;
          v15 = -[NSString isEqualToString:](v8, "isEqualToString:", v14);

          if (!v15)
            goto LABEL_29;
        }
        paymentPass = self->_paymentPass;
        v17 = v6->_paymentPass;
        if (paymentPass && v17)
        {
          if ((-[PKPaymentPass isEqual:](paymentPass, "isEqual:") & 1) == 0)
            goto LABEL_29;
        }
        else if (paymentPass != v17)
        {
          goto LABEL_29;
        }
        sessionIdentifier = v6->_sessionIdentifier;
        v8 = self->_sessionIdentifier;
        v19 = sessionIdentifier;
        if (v8 == v19)
        {

LABEL_33:
          serviceProviderData = self->_serviceProviderData;
          v23 = v6->_serviceProviderData;
          if (serviceProviderData && v23)
          {
            if ((-[NSDictionary isEqual:](serviceProviderData, "isEqual:") & 1) != 0)
              goto LABEL_38;
          }
          else if (serviceProviderData == v23)
          {
LABEL_38:
            v12 = self->_type == v6->_type;
            goto LABEL_30;
          }
LABEL_29:
          v12 = 0;
LABEL_30:

          goto LABEL_31;
        }
        v10 = v19;
        if (v8 && v19)
        {
          v20 = -[NSString isEqualToString:](v8, "isEqualToString:", v19);

          if (!v20)
            goto LABEL_29;
          goto LABEL_33;
        }
LABEL_28:

        goto LABEL_29;
      }
    }
    v12 = 0;
  }
LABEL_31:

  return v12;
}

- (unint64_t)hash
{
  id v3;
  uint64_t v4;
  unint64_t v5;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_selectedOfferIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_criteriaIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_paymentPass);
  objc_msgSend(v3, "safelyAddObject:", self->_sessionIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_serviceProviderData);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_type - v4 + 32 * v4;

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

- (PKSelectedPaymentOffer)initWithCoder:(id)a3
{
  id v4;
  PKSelectedPaymentOffer *v5;
  uint64_t v6;
  NSString *selectedOfferIdentifier;
  uint64_t v8;
  NSString *criteriaIdentifier;
  uint64_t v10;
  PKPaymentPass *paymentPass;
  uint64_t v12;
  NSString *sessionIdentifier;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSDictionary *serviceProviderData;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)PKSelectedPaymentOffer;
  v5 = -[PKSelectedPaymentOffer init](&v22, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("selectedOfferIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    selectedOfferIdentifier = v5->_selectedOfferIdentifier;
    v5->_selectedOfferIdentifier = (NSString *)v6;

    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("criteriaIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    criteriaIdentifier = v5->_criteriaIdentifier;
    v5->_criteriaIdentifier = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("paymentPass"));
    v10 = objc_claimAutoreleasedReturnValue();
    paymentPass = v5->_paymentPass;
    v5->_paymentPass = (PKPaymentPass *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sessionIdentifier"));
    v12 = objc_claimAutoreleasedReturnValue();
    sessionIdentifier = v5->_sessionIdentifier;
    v5->_sessionIdentifier = (NSString *)v12;

    v14 = (void *)MEMORY[0x1E0C99E60];
    v15 = objc_opt_class();
    v16 = objc_opt_class();
    v17 = objc_opt_class();
    objc_msgSend(v14, "setWithObjects:", v15, v16, v17, objc_opt_class(), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("serviceProviderData"));
    v19 = objc_claimAutoreleasedReturnValue();
    serviceProviderData = v5->_serviceProviderData;
    v5->_serviceProviderData = (NSDictionary *)v19;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *selectedOfferIdentifier;
  id v5;

  selectedOfferIdentifier = self->_selectedOfferIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", selectedOfferIdentifier, CFSTR("selectedOfferIdentifier"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_type, CFSTR("type"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_criteriaIdentifier, CFSTR("criteriaIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_paymentPass, CFSTR("paymentPass"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sessionIdentifier, CFSTR("sessionIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_serviceProviderData, CFSTR("serviceProviderData"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_selectedOfferIdentifier, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v5[1] = self->_type;
  v8 = -[NSString copyWithZone:](self->_criteriaIdentifier, "copyWithZone:", a3);
  v9 = (void *)v5[4];
  v5[4] = v8;

  v10 = -[PKSecureElementPass copyWithZone:](self->_paymentPass, "copyWithZone:", a3);
  v11 = (void *)v5[3];
  v5[3] = v10;

  v12 = -[NSString copyWithZone:](self->_sessionIdentifier, "copyWithZone:", a3);
  v13 = (void *)v5[5];
  v5[5] = v12;

  v14 = -[NSDictionary copyWithZone:](self->_serviceProviderData, "copyWithZone:", a3);
  v15 = (void *)v5[6];
  v5[6] = v14;

  return v5;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSString)selectedOfferIdentifier
{
  return self->_selectedOfferIdentifier;
}

- (PKPaymentPass)paymentPass
{
  return self->_paymentPass;
}

- (NSString)criteriaIdentifier
{
  return self->_criteriaIdentifier;
}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (NSDictionary)serviceProviderData
{
  return self->_serviceProviderData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceProviderData, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong((id *)&self->_criteriaIdentifier, 0);
  objc_storeStrong((id *)&self->_paymentPass, 0);
  objc_storeStrong((id *)&self->_selectedOfferIdentifier, 0);
}

@end
