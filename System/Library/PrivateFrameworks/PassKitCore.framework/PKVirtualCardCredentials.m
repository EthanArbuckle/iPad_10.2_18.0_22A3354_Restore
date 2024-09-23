@implementation PKVirtualCardCredentials

+ (id)demoVPANCredentials
{
  PKVirtualCardCredentials *v2;

  if (os_variant_has_internal_ui())
  {
    v2 = objc_alloc_init(PKVirtualCardCredentials);
    -[PKVirtualCardCredentials setPrimaryAccountNumber:](v2, "setPrimaryAccountNumber:", CFSTR("4761120010000492"));
    -[PKVirtualCardCredentials setCardSecurityCode:](v2, "setCardSecurityCode:", CFSTR("123"));
    -[PKVirtualCardCredentials setExpiration:](v2, "setExpiration:", CFSTR("11/2022"));
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (PKVirtualCardCredentials)initWithDictionary:(id)a3
{
  id v4;
  PKVirtualCardCredentials *v5;
  void *v6;
  uint64_t v7;
  NSString *primaryAccountNumber;
  void *v9;
  uint64_t v10;
  NSString *cardSecurityCode;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKVirtualCardCredentials;
  v5 = -[PKVirtualCardCredentials init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("primaryAccountNumber"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pk_zString");
    v7 = objc_claimAutoreleasedReturnValue();
    primaryAccountNumber = v5->_primaryAccountNumber;
    v5->_primaryAccountNumber = (NSString *)v7;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("cardSecurityCode"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pk_zString");
    v10 = objc_claimAutoreleasedReturnValue();
    cardSecurityCode = v5->_cardSecurityCode;
    v5->_cardSecurityCode = (NSString *)v10;

    v5->_cardType = objc_msgSend(v4, "PKIntegerForKey:", CFSTR("cardType"));
  }

  return v5;
}

- (PKVirtualCardCredentials)initWithEncryptedCardData:(id)a3 ephemeralPublicKey:(id)a4 privateKey:(__SecKey *)a5 error:(id *)a6
{
  void *v8;
  void *v9;
  PKVirtualCardCredentials *v10;

  PKECDHDecryptDataWithEphemeralPublicKey(a4, a3, a5, (CFErrorRef *)a6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v8, 0, a6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      self = -[PKVirtualCardCredentials initWithDictionary:](self, "initWithDictionary:", v9);
      v10 = self;
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

+ (id)formattedDateStringFromServerDateString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;

  v3 = a3;
  objc_msgSend(v3, "componentsSeparatedByString:", CFSTR("/"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count") == 2)
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "length") == 2)
    {
      v7 = v6;
    }
    else
    {
      if (objc_msgSend(v6, "length") != 4)
      {
        v8 = v3;
        goto LABEL_9;
      }
      objc_msgSend(v6, "substringFromIndex:", 2);
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    v9 = v7;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%@"), v5, v7);
    v8 = (id)objc_claimAutoreleasedReturnValue();

LABEL_9:
    goto LABEL_10;
  }
  v8 = v3;
LABEL_10:

  return v8;
}

- (PKVirtualCardCredentials)initWithVPANPaymentCredentialResponse:(id)a3 privateKey:(__SecKey *)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  PKVirtualCardCredentials *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSString *expiration;
  uint64_t v18;
  NSString *formattedExpiration;

  v8 = a3;
  objc_msgSend(v8, "credentials");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encryptedCardData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "credentials");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "ephemeralPublicKey");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[PKVirtualCardCredentials initWithEncryptedCardData:ephemeralPublicKey:privateKey:error:](self, "initWithEncryptedCardData:ephemeralPublicKey:privateKey:error:", v10, v12, a4, a5);

  if (v13)
  {
    objc_msgSend(v8, "expiration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "formattedDateStringFromServerDateString:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "copy");
    expiration = v13->_expiration;
    v13->_expiration = (NSString *)v16;

    v18 = objc_msgSend(v15, "copy");
    formattedExpiration = v13->_formattedExpiration;
    v13->_formattedExpiration = (NSString *)v18;

  }
  return v13;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_primaryAccountNumber);
  objc_msgSend(v3, "safelyAddObject:", self->_cardSecurityCode);
  objc_msgSend(v3, "safelyAddObject:", self->_expiration);
  objc_msgSend(v3, "safelyAddObject:", self->_formattedExpiration);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_cardType - v4 + 32 * v4;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  void *v5;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  _BOOL4 v9;
  void *v10;
  NSString *v11;
  _BOOL4 v12;
  void *v13;
  NSString *v14;
  _BOOL4 v15;
  void *v16;
  NSString *v17;
  _BOOL4 v18;
  BOOL v19;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_26;
  v5 = (void *)v4[1];
  v6 = self->_primaryAccountNumber;
  v7 = v5;
  if (v6 == v7)
  {

  }
  else
  {
    v8 = v7;
    if (!v6 || !v7)
      goto LABEL_25;
    v9 = -[NSString isEqualToString:](v6, "isEqualToString:", v7);

    if (!v9)
      goto LABEL_26;
  }
  v10 = (void *)v4[2];
  v6 = self->_cardSecurityCode;
  v11 = v10;
  if (v6 == v11)
  {

  }
  else
  {
    v8 = v11;
    if (!v6 || !v11)
      goto LABEL_25;
    v12 = -[NSString isEqualToString:](v6, "isEqualToString:", v11);

    if (!v12)
      goto LABEL_26;
  }
  v13 = (void *)v4[4];
  v6 = self->_expiration;
  v14 = v13;
  if (v6 == v14)
  {

    goto LABEL_20;
  }
  v8 = v14;
  if (!v6 || !v14)
  {
LABEL_25:

    goto LABEL_26;
  }
  v15 = -[NSString isEqualToString:](v6, "isEqualToString:", v14);

  if (!v15)
    goto LABEL_26;
LABEL_20:
  v16 = (void *)v4[5];
  v6 = self->_formattedExpiration;
  v17 = v16;
  if (v6 == v17)
  {

LABEL_29:
    v19 = self->_cardType == v4[3];
    goto LABEL_27;
  }
  v8 = v17;
  if (!v6 || !v17)
    goto LABEL_25;
  v18 = -[NSString isEqualToString:](v6, "isEqualToString:", v17);

  if (v18)
    goto LABEL_29;
LABEL_26:
  v19 = 0;
LABEL_27:

  return v19;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PKVirtualCardCredentials *v5;
  uint64_t v6;
  NSString *primaryAccountNumber;
  uint64_t v8;
  NSString *cardSecurityCode;
  uint64_t v10;
  NSString *expiration;
  uint64_t v12;
  NSString *formattedExpiration;

  v5 = -[PKVirtualCardCredentials init](+[PKVirtualCardCredentials allocWithZone:](PKVirtualCardCredentials, "allocWithZone:"), "init");
  v6 = -[NSString copyWithZone:](self->_primaryAccountNumber, "copyWithZone:", a3);
  primaryAccountNumber = v5->_primaryAccountNumber;
  v5->_primaryAccountNumber = (NSString *)v6;

  v8 = -[NSString copyWithZone:](self->_cardSecurityCode, "copyWithZone:", a3);
  cardSecurityCode = v5->_cardSecurityCode;
  v5->_cardSecurityCode = (NSString *)v8;

  v5->_cardType = self->_cardType;
  v10 = -[NSString copyWithZone:](self->_expiration, "copyWithZone:", a3);
  expiration = v5->_expiration;
  v5->_expiration = (NSString *)v10;

  v12 = -[NSString copyWithZone:](self->_formattedExpiration, "copyWithZone:", a3);
  formattedExpiration = v5->_formattedExpiration;
  v5->_formattedExpiration = (NSString *)v12;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKVirtualCardCredentials)initWithCoder:(id)a3
{
  id v4;
  PKVirtualCardCredentials *v5;
  void *v6;
  uint64_t v7;
  NSString *primaryAccountNumber;
  void *v9;
  uint64_t v10;
  NSString *cardSecurityCode;
  uint64_t v12;
  NSString *expiration;
  uint64_t v14;
  NSString *formattedExpiration;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PKVirtualCardCredentials;
  v5 = -[PKVirtualCardCredentials init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("primaryAccountNumber"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pk_zString");
    v7 = objc_claimAutoreleasedReturnValue();
    primaryAccountNumber = v5->_primaryAccountNumber;
    v5->_primaryAccountNumber = (NSString *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cardSecurityCode"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pk_zString");
    v10 = objc_claimAutoreleasedReturnValue();
    cardSecurityCode = v5->_cardSecurityCode;
    v5->_cardSecurityCode = (NSString *)v10;

    v5->_cardType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("cardType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("expiration"));
    v12 = objc_claimAutoreleasedReturnValue();
    expiration = v5->_expiration;
    v5->_expiration = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("formattedExpiration"));
    v14 = objc_claimAutoreleasedReturnValue();
    formattedExpiration = v5->_formattedExpiration;
    v5->_formattedExpiration = (NSString *)v14;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *primaryAccountNumber;
  id v5;

  primaryAccountNumber = self->_primaryAccountNumber;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", primaryAccountNumber, CFSTR("primaryAccountNumber"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_cardSecurityCode, CFSTR("cardSecurityCode"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_cardType, CFSTR("cardType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_expiration, CFSTR("expiration"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_formattedExpiration, CFSTR("formattedExpiration"));

}

- (NSString)primaryAccountNumber
{
  return self->_primaryAccountNumber;
}

- (void)setPrimaryAccountNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)cardSecurityCode
{
  return self->_cardSecurityCode;
}

- (void)setCardSecurityCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int64_t)cardType
{
  return self->_cardType;
}

- (void)setCardType:(int64_t)a3
{
  self->_cardType = a3;
}

- (NSString)expiration
{
  return self->_expiration;
}

- (void)setExpiration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)formattedExpiration
{
  return self->_formattedExpiration;
}

- (void)setFormattedExpiration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_formattedExpiration, 0);
  objc_storeStrong((id *)&self->_expiration, 0);
  objc_storeStrong((id *)&self->_cardSecurityCode, 0);
  objc_storeStrong((id *)&self->_primaryAccountNumber, 0);
}

@end
