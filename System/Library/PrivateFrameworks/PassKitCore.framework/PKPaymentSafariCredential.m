@implementation PKPaymentSafariCredential

- (PKPaymentSafariCredential)initWithSafariDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  PKPaymentSafariCredential *v9;
  PKPaymentSafariCredential *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSString *securityCode;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSString *cardholderName;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  PKPaymentSafariCredential *v29;
  objc_super v31;

  v4 = a3;
  _MergedGlobals_30[0]();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pk_stringIfNotEmpty");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pk_zString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v31.receiver = self;
    v31.super_class = (Class)PKPaymentSafariCredential;
    v9 = -[PKPaymentCredential init](&v31, sel_init);
    v10 = v9;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_cardNumber, v8);
      off_1EE1BCC88[0]();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "pk_stringIfNotEmpty");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "pk_zString");
      v14 = objc_claimAutoreleasedReturnValue();
      securityCode = v10->_securityCode;
      v10->_securityCode = (NSString *)v14;

      off_1EE1BCC90[0]();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "pk_stringIfNotEmpty");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "pk_zString");
      v19 = objc_claimAutoreleasedReturnValue();
      cardholderName = v10->_cardholderName;
      v10->_cardholderName = (NSString *)v19;

      off_1EE1BCC98[0]();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "pk_stringIfNotEmpty");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "pk_zString");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentCredential setLongDescription:](v10, "setLongDescription:", v24);

      -[PKPaymentCredential setCardType:](v10, "setCardType:", 1);
      off_1EE1BCCA0[0]();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (v26)
      {
        if (qword_1EE1DB570 != -1)
          dispatch_once(&qword_1EE1DB570, &__block_literal_global_656);
        objc_storeStrong((id *)&v10->_expirationDate, v26);
        objc_msgSend((id)_MergedGlobals_31, "stringFromDate:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "pk_zString");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPaymentCredential setExpiration:](v10, "setExpiration:", v28);

      }
    }
    self = v10;
    v29 = self;
  }
  else
  {
    v29 = 0;
  }

  return v29;
}

uint64_t __54__PKPaymentSafariCredential_initWithSafariDictionary___block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)_MergedGlobals_31;
  _MergedGlobals_31 = (uint64_t)v0;

  v2 = (void *)_MergedGlobals_31;
  objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCalendar:", v3);

  v4 = (void *)_MergedGlobals_31;
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLocale:", v5);

  return objc_msgSend((id)_MergedGlobals_31, "setDateFormat:", CFSTR("MM/yy"));
}

- (id)sanitizedPrimaryAccountNumber
{
  void *v3;
  void *v4;
  void *v5;

  -[PKPaymentCredential state](self, "state");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "eligibilityResponse");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sanitizedPrimaryAccountNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    PKFPANSuffixFromFPAN(self->_cardNumber);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (int64_t)credentialType
{
  void *v3;
  void *v4;
  id v5;
  objc_super v7;

  -[PKPaymentCredential state](self, "state");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "eligibilityResponse");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "cardType");
  if (!v5)
  {
    v7.receiver = self;
    v7.super_class = (Class)PKPaymentSafariCredential;
    v5 = -[PKPaymentCredential credentialType](&v7, sel_credentialType);
  }

  return (int64_t)v5;
}

- (id)longDescription
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKPaymentSafariCredential;
  -[PKPaymentCredential longDescription](&v8, sel_longDescription);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    PKDisplayablePaymentNetworkNameForPaymentCredentialType(-[PKPaymentSafariCredential credentialType](self, "credentialType"));
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (id)detailDescriptionWithEnvironment:(unint64_t)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[PKPaymentSafariCredential sanitizedPrimaryAccountNumber](self, "sanitizedPrimaryAccountNumber", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PKMaskedPaymentPAN((uint64_t)v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedVirtualCardString(CFSTR("PROVISIONING_DETAIL_DESCRIPTION_FORMAT"), CFSTR("%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)canCheckEligibility
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  BOOL v7;

  if (!-[NSString length](self->_cardNumber, "length"))
    return 0;
  -[PKPaymentCredential expiration](self, "expiration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (!v4)
    return 0;
  -[PKPaymentSafariCredential expirationDate](self, "expirationDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "compare:", v5) == -1;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (PKPaymentSafariCredential)initWithCoder:(id)a3
{
  id v4;
  PKPaymentSafariCredential *v5;
  uint64_t v6;
  NSString *cardNumber;
  uint64_t v8;
  NSString *securityCode;
  uint64_t v10;
  NSString *cardholderName;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKPaymentSafariCredential;
  v5 = -[PKPaymentCredential initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cardNumber"));
    v6 = objc_claimAutoreleasedReturnValue();
    cardNumber = v5->_cardNumber;
    v5->_cardNumber = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("securityCode"));
    v8 = objc_claimAutoreleasedReturnValue();
    securityCode = v5->_securityCode;
    v5->_securityCode = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cardholderName"));
    v10 = objc_claimAutoreleasedReturnValue();
    cardholderName = v5->_cardholderName;
    v5->_cardholderName = (NSString *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPaymentSafariCredential;
  v4 = a3;
  -[PKPaymentCredential encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_cardNumber, CFSTR("cardNumber"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_securityCode, CFSTR("securityCode"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_cardholderName, CFSTR("cardholderName"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)_isEqualToCredential:(id)a3
{
  id v4;
  NSString *cardNumber;
  void *v6;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  BOOL v10;
  char v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    cardNumber = self->_cardNumber;
    objc_msgSend(v4, "cardNumber");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = cardNumber;
    v8 = v6;
    v9 = v8;
    if (v7 == v8)
    {
      v11 = 1;
    }
    else
    {
      if (v7)
        v10 = v8 == 0;
      else
        v10 = 1;
      if (v10)
        v11 = 0;
      else
        v11 = -[NSString isEqualToString:](v7, "isEqualToString:", v8);
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_cardNumber, "hash");
}

- (NSString)cardholderName
{
  return self->_cardholderName;
}

- (NSString)cardNumber
{
  return self->_cardNumber;
}

- (NSString)securityCode
{
  return self->_securityCode;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
  objc_storeStrong((id *)&self->_expirationDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_securityCode, 0);
  objc_storeStrong((id *)&self->_cardNumber, 0);
  objc_storeStrong((id *)&self->_cardholderName, 0);
}

@end
