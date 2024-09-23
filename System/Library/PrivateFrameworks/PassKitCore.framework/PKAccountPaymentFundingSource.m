@implementation PKAccountPaymentFundingSource

+ (Class)fundingDetailsClassForFundingSourceType:(int64_t)a3
{
  void *v4;

  v4 = (void *)objc_opt_class();
  if ((a3 & 0xFFFFFFFFFFFFFFFBLL) == 1 || a3 == 2)
    v4 = (void *)objc_opt_class();
  return (Class)v4;
}

- (PKAccountPaymentFundingSource)initWithType:(int64_t)a3
{
  void *v5;
  id v6;
  void *v7;
  PKAccountPaymentFundingSource *v8;
  PKAccountPaymentFundingSource *v9;
  PKAccountPaymentFundingSource *v10;
  objc_super v12;

  v5 = (void *)objc_msgSend((id)objc_opt_class(), "fundingDetailsClassForFundingSourceType:", a3);
  if (objc_msgSend(v5, "isSubclassOfClass:", objc_opt_class())
    && (v6 = objc_alloc_init((Class)v5)) != 0)
  {
    v7 = v6;
    v12.receiver = self;
    v12.super_class = (Class)PKAccountPaymentFundingSource;
    v8 = -[PKAccountPaymentFundingSource init](&v12, sel_init);
    v9 = v8;
    if (v8)
    {
      v8->_type = a3;
      objc_storeStrong((id *)&v8->_fundingDetails, v7);
    }
    self = v9;

    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (PKAccountPaymentFundingSource)initWithDictionary:(id)a3
{
  id v4;
  PKAccountPaymentFundingSource *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_class *v9;
  uint64_t v10;
  PKAccountPaymentFundingDetails *fundingDetails;
  uint64_t v12;
  NSString *identifier;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKAccountPaymentFundingSource;
  v5 = -[PKAccountPaymentFundingSource init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("accountSuffix"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "PKStringForKey:", CFSTR("type"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("fundingDetails"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      objc_storeStrong((id *)&v5->_accountSuffix, v6);
    if (v7)
      v5->_type = PKAccountPaymentFundingSourceTypeFromString(v7);
    if (v8)
    {
      v9 = (objc_class *)objc_msgSend((id)objc_opt_class(), "fundingDetailsClassForFundingSourceType:", v5->_type);
      if (-[objc_class isSubclassOfClass:](v9, "isSubclassOfClass:", objc_opt_class()))
      {
        v10 = objc_msgSend([v9 alloc], "initWithDictionary:", v8);
        fundingDetails = v5->_fundingDetails;
        v5->_fundingDetails = (PKAccountPaymentFundingDetails *)v10;

      }
    }
    objc_msgSend(v4, "PKStringForKey:", CFSTR("identifier"));
    v12 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v12;

  }
  return v5;
}

- (id)bankAccountRepresentation
{
  PKAccountPaymentFundingDetails *v3;
  PKBankAccountInformation *v4;
  void *v5;
  uint64_t v6;

  if ((self->_type | 4) == 5)
  {
    v3 = self->_fundingDetails;
    v4 = -[PKBankAccountInformation initWithType:]([PKBankAccountInformation alloc], "initWithType:", 1);
    -[PKBankAccountInformation setAccountNumber:](v4, "setAccountNumber:", self->_accountSuffix);
    -[PKBankAccountInformation setIdentifier:](v4, "setIdentifier:", self->_identifier);
    -[PKAccountPaymentFundingDetails name](v3, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKBankAccountInformation setBankName:](v4, "setBankName:", v5);

    v6 = -[PKAccountPaymentFundingDetails status](v3, "status");
    -[PKBankAccountInformation setStatus:](v4, "setStatus:", v6);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)displayDescription
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSString *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  __CFString *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v28;

  v7 = 0;
  switch(self->_type)
  {
    case 1:
    case 5:
      v9 = self->_accountSuffix;
      -[PKAccountPaymentFundingSource fundingDetails](self, "fundingDetails");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "name");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v11;
      if (v11)
      {
        v18 = v11;
      }
      else
      {
        PKLocalizedFeatureString(CFSTR("ACCOUNT_SERVICE_BANK_ACCOUNT_DEFAULT_NAME"), 2, 0, v12, v13, v14, v15, v16, v28);
        v18 = (id)objc_claimAutoreleasedReturnValue();
      }
      v20 = v18;

      if (v9)
      {
        PKLocalizedFeatureString(CFSTR("ACCOUNT_SERVICE_BANK_ACCOUNT_DISPLAY_DESCRIPTION_FORMAT"), 2, CFSTR("%1$@%2$@"), v21, v22, v23, v24, v25, (uint64_t)v20);
        v26 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v26 = v20;
      }
      v7 = v26;

      break;
    case 2:
      v19 = CFSTR("ACCOUNT_SERVICE_PAYMENT_INFORMATION_DISPLAY_DESCRIPTION_TYPE_APC");
      goto LABEL_6;
    case 3:
      v19 = CFSTR("ACCOUNT_SERVICE_PAYMENT_INFORMATION_DISPLAY_DESCRIPTION_TYPE_OFFLINE");
LABEL_6:
      PKLocalizedFeatureString(v19, 2, 0, v2, v3, v4, v5, v6, v28);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      return v7;
  }
  return v7;
}

- (id)jsonString
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB36D8];
  -[PKAccountPaymentFundingSource jsonDictionaryRepresentation](self, "jsonDictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  objc_msgSend(v2, "dataWithJSONObject:options:error:", v3, 2, &v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v9;

  if (v5)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v5;
      _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "Error forming json dictionary for CloudKit with error: %@", buf, 0xCu);
    }

    v7 = 0;
  }
  else
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v4, 4);
  }

  return v7;
}

- (id)jsonDictionaryRepresentation
{
  return -[PKAccountPaymentFundingSource jsonDictionaryRepresentationWithCertificatesResponse:](self, "jsonDictionaryRepresentationWithCertificatesResponse:", 0);
}

- (id)jsonDictionaryRepresentationWithCertificatesResponse:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSString *identifier;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  identifier = self->_identifier;
  if (identifier)
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", identifier, CFSTR("identifier"));
  }
  else
  {
    -[PKAccountPaymentFundingDetails jsonDictionaryRepresentationWithCertificatesResponse:](self->_fundingDetails, "jsonDictionaryRepresentationWithCertificatesResponse:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count"))
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("fundingDetails"));

  }
  objc_msgSend(v6, "setObject:forKeyedSubscript:", self->_accountSuffix, CFSTR("accountSuffix"));
  PKAccountPaymentFundingSourceTypeToString(self->_type);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("type"));

  v10 = (void *)objc_msgSend(v6, "copy");
  return v10;
}

- (id)hashComponentWithCertificatesResponse:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t type;
  const __CFString *identifier;
  void *v9;
  void *v10;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  type = self->_type;
  if (type == 2)
  {
    identifier = CFSTR("APC");
    goto LABEL_8;
  }
  if (type != 1)
    goto LABEL_9;
  objc_msgSend(v5, "appendString:", CFSTR("ACH"));
  identifier = (const __CFString *)self->_identifier;
  if (identifier)
  {
LABEL_8:
    objc_msgSend(v6, "appendString:", identifier);
    goto LABEL_9;
  }
  -[PKAccountPaymentFundingDetails hashComponentWithCertificatesResponse:](self->_fundingDetails, "hashComponentWithCertificatesResponse:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    objc_msgSend(v6, "appendString:", v9);

LABEL_9:
  v10 = (void *)objc_msgSend(v6, "copy");

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAccountPaymentFundingSource)initWithCoder:(id)a3
{
  id v4;
  PKAccountPaymentFundingSource *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSString *accountSuffix;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  PKAccountPaymentFundingDetails *fundingDetails;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PKAccountPaymentFundingSource;
  v5 = -[PKAccountPaymentFundingSource init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountSuffix"));
    v8 = objc_claimAutoreleasedReturnValue();
    accountSuffix = v5->_accountSuffix;
    v5->_accountSuffix = (NSString *)v8;

    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
    v10 = (void *)MEMORY[0x1E0C99E60];
    v11 = objc_opt_class();
    objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("fundingDetails"));
    v13 = objc_claimAutoreleasedReturnValue();
    fundingDetails = v5->_fundingDetails;
    v5->_fundingDetails = (PKAccountPaymentFundingDetails *)v13;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_accountSuffix, CFSTR("accountSuffix"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_type, CFSTR("type"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_fundingDetails, CFSTR("fundingDetails"));

}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *identifier;
  NSString *v6;
  NSString *accountSuffix;
  NSString *v8;
  PKAccountPaymentFundingDetails *fundingDetails;
  PKAccountPaymentFundingDetails *v10;
  BOOL v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_17;
  identifier = self->_identifier;
  v6 = (NSString *)v4[1];
  if (identifier && v6)
  {
    if ((-[NSString isEqual:](identifier, "isEqual:") & 1) == 0)
      goto LABEL_17;
  }
  else if (identifier != v6)
  {
    goto LABEL_17;
  }
  accountSuffix = self->_accountSuffix;
  v8 = (NSString *)v4[3];
  if (accountSuffix && v8)
  {
    if ((-[NSString isEqual:](accountSuffix, "isEqual:") & 1) == 0)
      goto LABEL_17;
  }
  else if (accountSuffix != v8)
  {
    goto LABEL_17;
  }
  fundingDetails = self->_fundingDetails;
  v10 = (PKAccountPaymentFundingDetails *)v4[4];
  if (!fundingDetails || !v10)
  {
    if (fundingDetails == v10)
      goto LABEL_15;
LABEL_17:
    v11 = 0;
    goto LABEL_18;
  }
  if (!-[PKAccountPaymentFundingDetails isEqual:](fundingDetails, "isEqual:"))
    goto LABEL_17;
LABEL_15:
  v11 = self->_type == v4[2];
LABEL_18:

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_identifier);
  objc_msgSend(v3, "safelyAddObject:", self->_accountSuffix);
  objc_msgSend(v3, "safelyAddObject:", self->_fundingDetails);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_type - v4 + 32 * v4;

  return v5;
}

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("identifier: '%@'; "), self->_identifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("accountSuffix: '%@'; "), self->_accountSuffix);
  PKAccountPaymentFundingSourceTypeToString(self->_type);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("type: '%@'; "), v4);

  objc_msgSend(v3, "appendFormat:", CFSTR("fundingDetails: '%@'; "), self->_fundingDetails);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSString)accountSuffix
{
  return self->_accountSuffix;
}

- (void)setAccountSuffix:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (PKAccountPaymentFundingDetails)fundingDetails
{
  return self->_fundingDetails;
}

- (void)setFundingDetails:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fundingDetails, 0);
  objc_storeStrong((id *)&self->_accountSuffix, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
