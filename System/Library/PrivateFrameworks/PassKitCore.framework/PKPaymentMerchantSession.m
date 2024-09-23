@implementation PKPaymentMerchantSession

+ (int64_t)version
{
  return 4;
}

- (PKPaymentMerchantSession)init
{
  void *v3;
  PKPaymentMerchantSession *v4;

  objc_msgSend(MEMORY[0x1E0C99D50], "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PKPaymentMerchantSession initWithMerchantIdentifier:merchantSessionIdentifier:nonce:epochTimestamp:domain:displayName:signature:](self, "initWithMerchantIdentifier:merchantSessionIdentifier:nonce:epochTimestamp:domain:displayName:signature:", &stru_1E2ADF4C0, &stru_1E2ADF4C0, &stru_1E2ADF4C0, 0, &stru_1E2ADF4C0, &stru_1E2ADF4C0, v3);

  return v4;
}

- (PKPaymentMerchantSession)initWithMerchantIdentifier:(id)a3 merchantSessionIdentifier:(id)a4 nonce:(id)a5 epochTimestamp:(unint64_t)a6 domain:(id)a7 displayName:(id)a8 signature:(id)a9
{
  return -[PKPaymentMerchantSession initWithMerchantIdentifier:merchantSessionIdentifier:nonce:epochTimestamp:expiresAt:domain:displayName:operationalAnalyticsIdentifier:signature:](self, "initWithMerchantIdentifier:merchantSessionIdentifier:nonce:epochTimestamp:expiresAt:domain:displayName:operationalAnalyticsIdentifier:signature:", a3, a4, a5, a6, 0, a7, a8, 0, a9);
}

- (PKPaymentMerchantSession)initWithMerchantIdentifier:(id)a3 merchantSessionIdentifier:(id)a4 nonce:(id)a5 epochTimestamp:(unint64_t)a6 expiresAt:(unint64_t)a7 domain:(id)a8 displayName:(id)a9 operationalAnalyticsIdentifier:(id)a10 signature:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  PKPaymentMerchantSession *v24;
  uint64_t v25;
  NSString *merchantIdentifier;
  uint64_t v27;
  NSString *merchantSessionIdentifier;
  uint64_t v29;
  NSString *nonce;
  uint64_t v31;
  NSString *domain;
  uint64_t v33;
  NSString *displayName;
  uint64_t v35;
  NSString *operationalAnalyticsIdentifier;
  uint64_t v37;
  NSData *signature;
  objc_super v40;

  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a8;
  v21 = a9;
  v22 = a10;
  v23 = a11;
  v40.receiver = self;
  v40.super_class = (Class)PKPaymentMerchantSession;
  v24 = -[PKPaymentMerchantSession init](&v40, sel_init);
  if (v24)
  {
    v25 = objc_msgSend(v17, "copy");
    merchantIdentifier = v24->_merchantIdentifier;
    v24->_merchantIdentifier = (NSString *)v25;

    v27 = objc_msgSend(v18, "copy");
    merchantSessionIdentifier = v24->_merchantSessionIdentifier;
    v24->_merchantSessionIdentifier = (NSString *)v27;

    v29 = objc_msgSend(v19, "copy");
    nonce = v24->_nonce;
    v24->_nonce = (NSString *)v29;

    v24->_epochTimestamp = a6;
    v24->_expiresAt = a7;
    v31 = objc_msgSend(v20, "copy");
    domain = v24->_domain;
    v24->_domain = (NSString *)v31;

    v33 = objc_msgSend(v21, "copy");
    displayName = v24->_displayName;
    v24->_displayName = (NSString *)v33;

    v35 = objc_msgSend(v22, "copy");
    operationalAnalyticsIdentifier = v24->_operationalAnalyticsIdentifier;
    v24->_operationalAnalyticsIdentifier = (NSString *)v35;

    v37 = objc_msgSend(v23, "copy");
    signature = v24->_signature;
    v24->_signature = (NSData *)v37;

  }
  return v24;
}

- (PKPaymentMerchantSession)initWithMerchantIdentifier:(id)a3 merchantSessionIdentifier:(id)a4 nonce:(id)a5 epochTimestamp:(unint64_t)a6 expiresAt:(unint64_t)a7 displayName:(id)a8 initiativeContext:(id)a9 initiative:(id)a10 signedFields:(id)a11 signature:(id)a12
{
  return -[PKPaymentMerchantSession initWithMerchantIdentifier:merchantSessionIdentifier:nonce:epochTimestamp:expiresAt:displayName:initiativeContext:initiative:ampEnrollmentPinning:operationalAnalyticsIdentifier:signedFields:signature:](self, "initWithMerchantIdentifier:merchantSessionIdentifier:nonce:epochTimestamp:expiresAt:displayName:initiativeContext:initiative:ampEnrollmentPinning:operationalAnalyticsIdentifier:signedFields:signature:", a3, a4, a5, a6, a7, a8, a9, a10, 0, 0, a11, a12);
}

- (PKPaymentMerchantSession)initWithMerchantIdentifier:(id)a3 merchantSessionIdentifier:(id)a4 nonce:(id)a5 epochTimestamp:(unint64_t)a6 expiresAt:(unint64_t)a7 displayName:(id)a8 initiativeContext:(id)a9 initiative:(id)a10 ampEnrollmentPinning:(id)a11 operationalAnalyticsIdentifier:(id)a12 signedFields:(id)a13 signature:(id)a14
{
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  PKPaymentMerchantSession *v27;
  PKPaymentMerchantSession *v28;
  uint64_t v29;
  NSString *merchantSessionIdentifier;
  uint64_t v31;
  NSString *nonce;
  uint64_t v33;
  NSString *merchantIdentifier;
  uint64_t v35;
  NSString *displayName;
  uint64_t v37;
  NSString *initiativeContext;
  uint64_t v39;
  NSString *initiative;
  uint64_t v41;
  NSData *ampEnrollmentPinning;
  uint64_t v43;
  NSString *operationalAnalyticsIdentifier;
  uint64_t v45;
  NSArray *signedFields;
  uint64_t v47;
  NSData *signature;
  id v53;
  objc_super v54;

  v17 = a3;
  v18 = a4;
  v19 = a5;
  v53 = a8;
  v20 = v18;
  v21 = a9;
  v22 = a10;
  v23 = a11;
  v24 = a12;
  v25 = a13;
  v26 = a14;
  v54.receiver = self;
  v54.super_class = (Class)PKPaymentMerchantSession;
  v27 = -[PKPaymentMerchantSession init](&v54, sel_init);
  v28 = v27;
  if (v27)
  {
    v27->_epochTimestamp = a6;
    v27->_expiresAt = a7;
    v29 = objc_msgSend(v20, "copy");
    merchantSessionIdentifier = v28->_merchantSessionIdentifier;
    v28->_merchantSessionIdentifier = (NSString *)v29;

    v31 = objc_msgSend(v19, "copy");
    nonce = v28->_nonce;
    v28->_nonce = (NSString *)v31;

    v33 = objc_msgSend(v17, "copy");
    merchantIdentifier = v28->_merchantIdentifier;
    v28->_merchantIdentifier = (NSString *)v33;

    v35 = objc_msgSend(v53, "copy");
    displayName = v28->_displayName;
    v28->_displayName = (NSString *)v35;

    v37 = objc_msgSend(v21, "copy");
    initiativeContext = v28->_initiativeContext;
    v28->_initiativeContext = (NSString *)v37;

    v39 = objc_msgSend(v22, "copy");
    initiative = v28->_initiative;
    v28->_initiative = (NSString *)v39;

    v41 = objc_msgSend(v23, "copy");
    ampEnrollmentPinning = v28->_ampEnrollmentPinning;
    v28->_ampEnrollmentPinning = (NSData *)v41;

    v43 = objc_msgSend(v24, "copy");
    operationalAnalyticsIdentifier = v28->_operationalAnalyticsIdentifier;
    v28->_operationalAnalyticsIdentifier = (NSString *)v43;

    v45 = objc_msgSend(v25, "copy");
    signedFields = v28->_signedFields;
    v28->_signedFields = (NSArray *)v45;

    v47 = objc_msgSend(v26, "copy");
    signature = v28->_signature;
    v28->_signature = (NSData *)v47;

  }
  return v28;
}

- (PKPaymentMerchantSession)initWithDictionary:(NSDictionary *)dictionary
{
  NSDictionary *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  PKPaymentMerchantSession *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;

  v3 = dictionary;
  -[NSDictionary PKStringForKey:](v3, "PKStringForKey:", CFSTR("initiative"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSDictionary PKStringForKey:](v3, "PKStringForKey:", CFSTR("merchantIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary PKStringForKey:](v3, "PKStringForKey:", CFSTR("merchantSessionIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary PKStringForKey:](v3, "PKStringForKey:", CFSTR("nonce"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary PKNumberForKey:](v3, "PKNumberForKey:", CFSTR("epochTimestamp"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "unsignedIntegerValue");
  -[NSDictionary PKNumberForKey:](v3, "PKNumberForKey:", CFSTR("expiresAt"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v10, "unsignedIntegerValue");
  if (v4)
  {
    -[NSDictionary PKStringForKey:](v3, "PKStringForKey:", CFSTR("displayName"));
    v28 = objc_claimAutoreleasedReturnValue();
    -[NSDictionary PKStringForKey:](v3, "PKStringForKey:", CFSTR("initiativeContext"));
    v27 = objc_claimAutoreleasedReturnValue();
    -[NSDictionary PKStringForKey:](v3, "PKStringForKey:", CFSTR("initiative"));
    v11 = objc_claimAutoreleasedReturnValue();
    -[NSDictionary PKStringForKey:](v3, "PKStringForKey:", CFSTR("ampEnrollmentPinning"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "pk_decodeHexadecimal");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary PKStringForKey:](v3, "PKStringForKey:", CFSTR("operationalAnalyticsIdentifier"));
    v31 = v7;
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary PKArrayContaining:forKey:](v3, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("signedFields"));
    v30 = v8;
    v14 = v5;
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary PKStringForKey:](v3, "PKStringForKey:", CFSTR("signature"));
    v29 = v10;
    v16 = v6;
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "pk_decodeHexadecimal");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = (void *)v11;
    v19 = (void *)v27;
    v26 = v11;
    v20 = (void *)v28;
    v21 = -[PKPaymentMerchantSession initWithMerchantIdentifier:merchantSessionIdentifier:nonce:epochTimestamp:expiresAt:displayName:initiativeContext:initiative:ampEnrollmentPinning:operationalAnalyticsIdentifier:signedFields:signature:](self, "initWithMerchantIdentifier:merchantSessionIdentifier:nonce:epochTimestamp:expiresAt:displayName:initiativeContext:initiative:ampEnrollmentPinning:operationalAnalyticsIdentifier:signedFields:signature:", v14, v16, v31, v9, v34, v28, v27, v26, v12, v13, v15, v18);

    v6 = v16;
    v10 = v29;

    v5 = v14;
    v8 = v30;

    v7 = v31;
  }
  else
  {
    -[NSDictionary PKStringForKey:](v3, "PKStringForKey:", CFSTR("domainName"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary PKStringForKey:](v3, "PKStringForKey:", CFSTR("displayName"));
    v32 = v9;
    v22 = objc_claimAutoreleasedReturnValue();
    -[NSDictionary PKStringForKey:](v3, "PKStringForKey:", CFSTR("operationalAnalyticsIdentifier"));
    v23 = objc_claimAutoreleasedReturnValue();
    -[NSDictionary PKStringForKey:](v3, "PKStringForKey:", CFSTR("signature"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = (void *)v22;
    v33 = v24;
    objc_msgSend(v24, "pk_decodeHexadecimal");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = (void *)v23;
    v21 = -[PKPaymentMerchantSession initWithMerchantIdentifier:merchantSessionIdentifier:nonce:epochTimestamp:expiresAt:domain:displayName:operationalAnalyticsIdentifier:signature:](self, "initWithMerchantIdentifier:merchantSessionIdentifier:nonce:epochTimestamp:expiresAt:domain:displayName:operationalAnalyticsIdentifier:signature:", v5, v6, v7, v32, v34, v20, v22, v23, v12);
  }

  return v21;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *merchantIdentifier;
  void *v5;
  void *v6;
  id v7;

  merchantIdentifier = self->_merchantIdentifier;
  v7 = a3;
  objc_msgSend(v7, "encodeObject:forKey:", merchantIdentifier, CFSTR("merchantIdentifier"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_merchantSessionIdentifier, CFSTR("merchantSessionIdentifier"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_nonce, CFSTR("nonce"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_epochTimestamp);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("epochTimestamp"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_expiresAt);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("expiresAt"));

  objc_msgSend(v7, "encodeObject:forKey:", self->_domain, CFSTR("domainName"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_displayName, CFSTR("displayName"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_signature, CFSTR("signature"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_retryNonce, CFSTR("retryNonce"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_initiativeContext, CFSTR("initiativeContext"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_initiative, CFSTR("initiative"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_ampEnrollmentPinning, CFSTR("ampEnrollmentPinning"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_operationalAnalyticsIdentifier, CFSTR("operationalAnalyticsIdentifier"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_signedFields, CFSTR("signedFields"));

}

- (PKPaymentMerchantSession)initWithCoder:(id)a3
{
  id v4;
  PKPaymentMerchantSession *v5;
  uint64_t v6;
  NSString *merchantIdentifier;
  uint64_t v8;
  NSString *merchantSessionIdentifier;
  uint64_t v10;
  NSString *nonce;
  void *v12;
  void *v13;
  uint64_t v14;
  NSString *domain;
  uint64_t v16;
  NSString *displayName;
  uint64_t v18;
  NSData *signature;
  uint64_t v20;
  NSString *retryNonce;
  uint64_t v22;
  NSString *initiative;
  uint64_t v24;
  NSString *initiativeContext;
  uint64_t v26;
  NSData *ampEnrollmentPinning;
  uint64_t v28;
  NSString *operationalAnalyticsIdentifier;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  NSArray *signedFields;
  objc_super v36;

  v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)PKPaymentMerchantSession;
  v5 = -[PKPaymentMerchantSession init](&v36, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("merchantIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    merchantIdentifier = v5->_merchantIdentifier;
    v5->_merchantIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("merchantSessionIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    merchantSessionIdentifier = v5->_merchantSessionIdentifier;
    v5->_merchantSessionIdentifier = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("nonce"));
    v10 = objc_claimAutoreleasedReturnValue();
    nonce = v5->_nonce;
    v5->_nonce = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("epochTimestamp"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_epochTimestamp = objc_msgSend(v12, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("expiresAt"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_expiresAt = objc_msgSend(v13, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("domainName"));
    v14 = objc_claimAutoreleasedReturnValue();
    domain = v5->_domain;
    v5->_domain = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayName"));
    v16 = objc_claimAutoreleasedReturnValue();
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("signature"));
    v18 = objc_claimAutoreleasedReturnValue();
    signature = v5->_signature;
    v5->_signature = (NSData *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("retryNonce"));
    v20 = objc_claimAutoreleasedReturnValue();
    retryNonce = v5->_retryNonce;
    v5->_retryNonce = (NSString *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("initiative"));
    v22 = objc_claimAutoreleasedReturnValue();
    initiative = v5->_initiative;
    v5->_initiative = (NSString *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("initiativeContext"));
    v24 = objc_claimAutoreleasedReturnValue();
    initiativeContext = v5->_initiativeContext;
    v5->_initiativeContext = (NSString *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ampEnrollmentPinning"));
    v26 = objc_claimAutoreleasedReturnValue();
    ampEnrollmentPinning = v5->_ampEnrollmentPinning;
    v5->_ampEnrollmentPinning = (NSData *)v26;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("operationalAnalyticsIdentifier"));
    v28 = objc_claimAutoreleasedReturnValue();
    operationalAnalyticsIdentifier = v5->_operationalAnalyticsIdentifier;
    v5->_operationalAnalyticsIdentifier = (NSString *)v28;

    v30 = (void *)MEMORY[0x1E0C99E60];
    v31 = objc_opt_class();
    objc_msgSend(v30, "setWithObjects:", v31, objc_opt_class(), 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v32, CFSTR("signedFields"));
    v33 = objc_claimAutoreleasedReturnValue();
    signedFields = v5->_signedFields;
    v5->_signedFields = (NSArray *)v33;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("merchantSessionIdentifier: %@"), self->_merchantSessionIdentifier);
  if (self->_initiative)
    objc_msgSend(v3, "appendFormat:", CFSTR(", initiative: %@"), self->_initiative);
  if (self->_ampEnrollmentPinning)
    objc_msgSend(v3, "appendFormat:", CFSTR(", ampEnrollmentPinning: %@"), self->_ampEnrollmentPinning);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PKPaymentMerchantSession *v5;
  uint64_t v6;
  NSString *merchantIdentifier;
  uint64_t v8;
  NSString *merchantSessionIdentifier;
  uint64_t v10;
  NSString *nonce;
  uint64_t v12;
  NSString *domain;
  uint64_t v14;
  NSString *displayName;
  uint64_t v16;
  NSData *signature;
  uint64_t v18;
  NSString *retryNonce;
  uint64_t v20;
  NSString *initiative;
  uint64_t v22;
  NSString *initiativeContext;
  uint64_t v24;
  NSData *ampEnrollmentPinning;
  uint64_t v26;
  NSString *operationalAnalyticsIdentifier;
  uint64_t v28;
  NSArray *signedFields;

  v5 = -[PKPaymentMerchantSession init](+[PKPaymentMerchantSession allocWithZone:](PKPaymentMerchantSession, "allocWithZone:"), "init");
  v6 = -[NSString copyWithZone:](self->_merchantIdentifier, "copyWithZone:", a3);
  merchantIdentifier = v5->_merchantIdentifier;
  v5->_merchantIdentifier = (NSString *)v6;

  v8 = -[NSString copyWithZone:](self->_merchantSessionIdentifier, "copyWithZone:", a3);
  merchantSessionIdentifier = v5->_merchantSessionIdentifier;
  v5->_merchantSessionIdentifier = (NSString *)v8;

  v10 = -[NSString copyWithZone:](self->_nonce, "copyWithZone:", a3);
  nonce = v5->_nonce;
  v5->_nonce = (NSString *)v10;

  v12 = -[NSString copyWithZone:](self->_domain, "copyWithZone:", a3);
  domain = v5->_domain;
  v5->_domain = (NSString *)v12;

  v5->_epochTimestamp = self->_epochTimestamp;
  v5->_expiresAt = self->_expiresAt;
  v14 = -[NSString copyWithZone:](self->_displayName, "copyWithZone:", a3);
  displayName = v5->_displayName;
  v5->_displayName = (NSString *)v14;

  v16 = -[NSData copyWithZone:](self->_signature, "copyWithZone:", a3);
  signature = v5->_signature;
  v5->_signature = (NSData *)v16;

  v18 = -[NSString copyWithZone:](self->_retryNonce, "copyWithZone:", a3);
  retryNonce = v5->_retryNonce;
  v5->_retryNonce = (NSString *)v18;

  v20 = -[NSString copyWithZone:](self->_initiative, "copyWithZone:", a3);
  initiative = v5->_initiative;
  v5->_initiative = (NSString *)v20;

  v22 = -[NSString copyWithZone:](self->_initiativeContext, "copyWithZone:", a3);
  initiativeContext = v5->_initiativeContext;
  v5->_initiativeContext = (NSString *)v22;

  v24 = -[NSData copyWithZone:](self->_ampEnrollmentPinning, "copyWithZone:", a3);
  ampEnrollmentPinning = v5->_ampEnrollmentPinning;
  v5->_ampEnrollmentPinning = (NSData *)v24;

  v26 = -[NSString copyWithZone:](self->_operationalAnalyticsIdentifier, "copyWithZone:", a3);
  operationalAnalyticsIdentifier = v5->_operationalAnalyticsIdentifier;
  v5->_operationalAnalyticsIdentifier = (NSString *)v26;

  v28 = -[NSArray copyWithZone:](self->_signedFields, "copyWithZone:", a3);
  signedFields = v5->_signedFields;
  v5->_signedFields = (NSArray *)v28;

  return v5;
}

- (unint64_t)hash
{
  NSData *signature;
  void *v4;
  void *v5;
  void *v6;
  NSData *ampEnrollmentPinning;
  NSString *initiativeContext;
  NSArray *signedFields;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSString *v15;
  void *v16;
  unint64_t v17;
  _QWORD v19[3];
  _QWORD v20[4];
  NSString *merchantIdentifier;
  __int128 v22;
  NSString *displayName;
  NSData *v24;
  void *v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  merchantIdentifier = self->_merchantIdentifier;
  v22 = *(_OWORD *)&self->_merchantSessionIdentifier;
  signature = self->_signature;
  displayName = self->_displayName;
  v24 = signature;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_epochTimestamp);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_expiresAt);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &merchantIdentifier, 7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!-[PKPaymentMerchantSession _isModern](self, "_isModern"))
  {
    objc_msgSend(v6, "arrayByAddingObject:", self->_domain);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v6;
LABEL_8:

    v14 = (void *)v13;
    goto LABEL_9;
  }
  ampEnrollmentPinning = self->_ampEnrollmentPinning;
  if (ampEnrollmentPinning)
  {
    initiativeContext = self->_initiativeContext;
    v20[0] = self->_initiative;
    v20[1] = initiativeContext;
    signedFields = self->_signedFields;
    v20[2] = ampEnrollmentPinning;
    v20[3] = signedFields;
    v10 = (void *)MEMORY[0x1E0C99D20];
    v11 = v20;
    v12 = 4;
  }
  else
  {
    v15 = self->_initiativeContext;
    v19[0] = self->_initiative;
    v19[1] = v15;
    v19[2] = self->_signedFields;
    v10 = (void *)MEMORY[0x1E0C99D20];
    v11 = v19;
    v12 = 3;
  }
  objc_msgSend(v10, "arrayWithObjects:count:", v11, v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "arrayByAddingObjectsFromArray:", v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_operationalAnalyticsIdentifier)
  {
    objc_msgSend(v14, "arrayByAddingObject:");
    v13 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
LABEL_9:
  v17 = PKCombinedHash(17, v14);

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  PKPaymentMerchantSession *v4;
  PKPaymentMerchantSession *v5;
  BOOL v6;

  v4 = (PKPaymentMerchantSession *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKPaymentMerchantSession isEqualToPaymentMerchantSession:](self, "isEqualToPaymentMerchantSession:", v5);

  return v6;
}

- (BOOL)isEqualToPaymentMerchantSession:(id)a3
{
  _QWORD *v4;
  void *v5;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  BOOL v9;
  _BOOL4 v10;
  void *v11;
  NSString *v12;
  _BOOL4 v13;
  void *v14;
  NSString *v15;
  _BOOL4 v16;
  void *v17;
  NSString *v18;
  _BOOL4 v19;
  void *v20;
  NSString *v21;
  _BOOL4 v22;
  char v23;
  NSData *signature;
  NSData *v26;
  NSString *initiative;
  NSString *v28;
  NSString *initiativeContext;
  NSString *v30;
  NSData *ampEnrollmentPinning;
  NSData *v32;
  NSString *operationalAnalyticsIdentifier;
  NSString *v34;
  NSArray *signedFields;
  NSArray *v36;

  v4 = a3;
  v5 = (void *)v4[5];
  v6 = self->_merchantIdentifier;
  v7 = v5;
  if (v6 == v7)
  {

  }
  else
  {
    v8 = v7;
    if (v6)
      v9 = v7 == 0;
    else
      v9 = 1;
    if (v9)
      goto LABEL_32;
    v10 = -[NSString isEqualToString:](v6, "isEqualToString:", v7);

    if (!v10)
      goto LABEL_33;
  }
  v11 = (void *)v4[3];
  v6 = self->_merchantSessionIdentifier;
  v12 = v11;
  if (v6 == v12)
  {

  }
  else
  {
    v8 = v12;
    if (!v6 || !v12)
      goto LABEL_32;
    v13 = -[NSString isEqualToString:](v6, "isEqualToString:", v12);

    if (!v13)
      goto LABEL_33;
  }
  v14 = (void *)v4[4];
  v6 = self->_nonce;
  v15 = v14;
  if (v6 == v15)
  {

  }
  else
  {
    v8 = v15;
    if (!v6 || !v15)
      goto LABEL_32;
    v16 = -[NSString isEqualToString:](v6, "isEqualToString:", v15);

    if (!v16)
      goto LABEL_33;
  }
  v17 = (void *)v4[7];
  v6 = self->_domain;
  v18 = v17;
  if (v6 == v18)
  {

  }
  else
  {
    v8 = v18;
    if (!v6 || !v18)
      goto LABEL_32;
    v19 = -[NSString isEqualToString:](v6, "isEqualToString:", v18);

    if (!v19)
      goto LABEL_33;
  }
  v20 = (void *)v4[8];
  v6 = self->_displayName;
  v21 = v20;
  if (v6 == v21)
  {

    goto LABEL_36;
  }
  v8 = v21;
  if (!v6 || !v21)
  {
LABEL_32:

    goto LABEL_33;
  }
  v22 = -[NSString isEqualToString:](v6, "isEqualToString:", v21);

  if (!v22)
    goto LABEL_33;
LABEL_36:
  signature = self->_signature;
  v26 = (NSData *)v4[13];
  if (signature && v26)
  {
    if ((-[NSData isEqual:](signature, "isEqual:") & 1) == 0)
      goto LABEL_33;
  }
  else if (signature != v26)
  {
    goto LABEL_33;
  }
  if (self->_epochTimestamp != v4[1] || self->_expiresAt != v4[2])
    goto LABEL_33;
  initiative = self->_initiative;
  v28 = (NSString *)v4[10];
  if (initiative && v28)
  {
    if ((-[NSString isEqual:](initiative, "isEqual:") & 1) == 0)
      goto LABEL_33;
  }
  else if (initiative != v28)
  {
    goto LABEL_33;
  }
  initiativeContext = self->_initiativeContext;
  v30 = (NSString *)v4[9];
  if (initiativeContext && v30)
  {
    if ((-[NSString isEqual:](initiativeContext, "isEqual:") & 1) == 0)
      goto LABEL_33;
  }
  else if (initiativeContext != v30)
  {
    goto LABEL_33;
  }
  ampEnrollmentPinning = self->_ampEnrollmentPinning;
  v32 = (NSData *)v4[11];
  if (ampEnrollmentPinning && v32)
  {
    if ((-[NSData isEqual:](ampEnrollmentPinning, "isEqual:") & 1) == 0)
      goto LABEL_33;
  }
  else if (ampEnrollmentPinning != v32)
  {
    goto LABEL_33;
  }
  operationalAnalyticsIdentifier = self->_operationalAnalyticsIdentifier;
  v34 = (NSString *)v4[6];
  if (operationalAnalyticsIdentifier && v34)
  {
    if ((-[NSString isEqual:](operationalAnalyticsIdentifier, "isEqual:") & 1) != 0)
      goto LABEL_63;
LABEL_33:
    v23 = 0;
    goto LABEL_34;
  }
  if (operationalAnalyticsIdentifier != v34)
    goto LABEL_33;
LABEL_63:
  signedFields = self->_signedFields;
  v36 = (NSArray *)v4[12];
  if (signedFields && v36)
    v23 = -[NSArray isEqual:](signedFields, "isEqual:");
  else
    v23 = signedFields == v36;
LABEL_34:

  return v23;
}

- (BOOL)supportsURL:(id)a3
{
  id v4;
  _BOOL4 v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  BOOL v12;
  char v13;

  v4 = a3;
  v5 = -[PKPaymentMerchantSession _isModern](self, "_isModern");
  v6 = 56;
  if (v5)
    v6 = 72;
  v7 = *(id *)((char *)&self->super.isa + v6);
  objc_msgSend(v4, "host");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v8;
  v10 = v7;
  v11 = v10;
  if (v9 == v10)
  {
    v13 = 1;
  }
  else
  {
    if (v10)
      v12 = v9 == 0;
    else
      v12 = 1;
    if (v12)
      v13 = 0;
    else
      v13 = objc_msgSend(v9, "isEqualToString:", v10);
  }

  return v13;
}

- (BOOL)_isModern
{
  return self->_initiative != 0;
}

- (id)signedData
{
  id v3;
  void *v4;
  void *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSData *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
  if (!-[PKPaymentMerchantSession _isModern](self, "_isModern"))
  {
    -[NSString dataUsingEncoding:](self->_merchantIdentifier, "dataUsingEncoding:", 4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendData:", v15);

    -[NSString dataUsingEncoding:](self->_merchantSessionIdentifier, "dataUsingEncoding:", 4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendData:", v16);

    -[NSString dataUsingEncoding:](self->_domain, "dataUsingEncoding:", 4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendData:", v17);

    -[NSString dataUsingEncoding:](self->_displayName, "dataUsingEncoding:", 4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendData:", v18);

    -[NSString pk_decodeHexadecimal](self->_nonce, "pk_decodeHexadecimal");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendData:", v19);

    goto LABEL_17;
  }
  -[NSArray componentsJoinedByString:](self->_signedFields, "componentsJoinedByString:", &stru_1E2ADF4C0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataUsingEncoding:", 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendData:", v5);

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v6 = self->_signedFields;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (!v7)
    goto LABEL_15;
  v8 = v7;
  v9 = *(_QWORD *)v23;
  do
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v23 != v9)
        objc_enumerationMutation(v6);
      v11 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
      if (objc_msgSend(v11, "isEqualToString:", CFSTR("nonce"), (_QWORD)v22))
      {
        -[NSString pk_decodeHexadecimal](self->_nonce, "pk_decodeHexadecimal");
        v12 = (NSData *)objc_claimAutoreleasedReturnValue();
LABEL_11:
        v13 = v12;
        goto LABEL_13;
      }
      if (objc_msgSend(v11, "isEqualToString:", CFSTR("ampEnrollmentPinning")))
      {
        v12 = self->_ampEnrollmentPinning;
        goto LABEL_11;
      }
      -[PKPaymentMerchantSession valueForKey:](self, "valueForKey:", v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "dataUsingEncoding:", 4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_13:
      objc_msgSend(v3, "appendData:", v13);

    }
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  }
  while (v8);
LABEL_15:

LABEL_17:
  v20 = (void *)objc_msgSend(v3, "copy", (_QWORD)v22);

  return v20;
}

- (unint64_t)epochTimestamp
{
  return self->_epochTimestamp;
}

- (unint64_t)expiresAt
{
  return self->_expiresAt;
}

- (NSString)merchantSessionIdentifier
{
  return self->_merchantSessionIdentifier;
}

- (NSString)nonce
{
  return self->_nonce;
}

- (NSString)merchantIdentifier
{
  return self->_merchantIdentifier;
}

- (NSString)operationalAnalyticsIdentifier
{
  return self->_operationalAnalyticsIdentifier;
}

- (NSString)domain
{
  return self->_domain;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSString)initiativeContext
{
  return self->_initiativeContext;
}

- (NSString)initiative
{
  return self->_initiative;
}

- (NSData)ampEnrollmentPinning
{
  return self->_ampEnrollmentPinning;
}

- (NSArray)signedFields
{
  return self->_signedFields;
}

- (NSData)signature
{
  return self->_signature;
}

- (NSString)retryNonce
{
  return self->_retryNonce;
}

- (void)setRetryNonce:(id)a3
{
  objc_storeStrong((id *)&self->_retryNonce, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_retryNonce, 0);
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_signedFields, 0);
  objc_storeStrong((id *)&self->_ampEnrollmentPinning, 0);
  objc_storeStrong((id *)&self->_initiative, 0);
  objc_storeStrong((id *)&self->_initiativeContext, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_operationalAnalyticsIdentifier, 0);
  objc_storeStrong((id *)&self->_merchantIdentifier, 0);
  objc_storeStrong((id *)&self->_nonce, 0);
  objc_storeStrong((id *)&self->_merchantSessionIdentifier, 0);
}

+ (PKPaymentMerchantSession)paymentMerchantSessionWithProtobuf:(id)a3
{
  id v3;
  int v4;
  PKPaymentMerchantSession *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  PKPaymentMerchantSession *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  PKPaymentMerchantSession *v18;
  void *v19;
  PKPaymentMerchantSession *v20;
  void *v21;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;

  v3 = a3;
  v4 = objc_msgSend(v3, "hasInitiative");
  v5 = [PKPaymentMerchantSession alloc];
  objc_msgSend(v3, "merchantIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sessionIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nonce");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v3, "epochTimestamp");
  v26 = objc_msgSend(v3, "expiresAt");
  if (v4)
  {
    objc_msgSend(v3, "displayName");
    v24 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "initiativeContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "initiative");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "ampEnrollmentPinning");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "operationalAnalyticsIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v5;
    v25 = v6;
    objc_msgSend(v3, "signedFields");
    v14 = v8;
    v15 = v7;
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "signature");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v13;
    v19 = (void *)v24;
    v20 = -[PKPaymentMerchantSession initWithMerchantIdentifier:merchantSessionIdentifier:nonce:epochTimestamp:expiresAt:displayName:initiativeContext:initiative:ampEnrollmentPinning:operationalAnalyticsIdentifier:signedFields:signature:](v18, "initWithMerchantIdentifier:merchantSessionIdentifier:nonce:epochTimestamp:expiresAt:displayName:initiativeContext:initiative:ampEnrollmentPinning:operationalAnalyticsIdentifier:signedFields:signature:", v25, v15, v14, v9, v26, v24, v10, v11, v12, v23, v16, v17);

    v7 = v15;
    v8 = v14;

    v6 = v25;
  }
  else
  {
    objc_msgSend(v3, "domain");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "displayName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "operationalAnalyticsIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "signature");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[PKPaymentMerchantSession initWithMerchantIdentifier:merchantSessionIdentifier:nonce:epochTimestamp:expiresAt:domain:displayName:operationalAnalyticsIdentifier:signature:](v5, "initWithMerchantIdentifier:merchantSessionIdentifier:nonce:epochTimestamp:expiresAt:domain:displayName:operationalAnalyticsIdentifier:signature:", v6, v7, v8, v9, v26, v19, v10, v11, v12);
  }

  if (objc_msgSend(v3, "hasRetryNonce"))
  {
    objc_msgSend(v3, "retryNonce");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentMerchantSession setRetryNonce:](v20, "setRetryNonce:", v21);

  }
  return v20;
}

- (id)protobuf
{
  PKProtobufPaymentMerchantSession *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = objc_alloc_init(PKProtobufPaymentMerchantSession);
  -[PKPaymentMerchantSession merchantIdentifier](self, "merchantIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufPaymentMerchantSession setMerchantIdentifier:](v3, "setMerchantIdentifier:", v4);

  -[PKPaymentMerchantSession merchantSessionIdentifier](self, "merchantSessionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufPaymentMerchantSession setSessionIdentifier:](v3, "setSessionIdentifier:", v5);

  -[PKPaymentMerchantSession nonce](self, "nonce");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufPaymentMerchantSession setNonce:](v3, "setNonce:", v6);

  -[PKProtobufPaymentMerchantSession setEpochTimestamp:](v3, "setEpochTimestamp:", -[PKPaymentMerchantSession epochTimestamp](self, "epochTimestamp"));
  -[PKProtobufPaymentMerchantSession setExpiresAt:](v3, "setExpiresAt:", -[PKPaymentMerchantSession expiresAt](self, "expiresAt"));
  -[PKPaymentMerchantSession displayName](self, "displayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufPaymentMerchantSession setDisplayName:](v3, "setDisplayName:", v7);

  -[PKPaymentMerchantSession signature](self, "signature");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufPaymentMerchantSession setSignature:](v3, "setSignature:", v8);

  -[PKPaymentMerchantSession retryNonce](self, "retryNonce");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufPaymentMerchantSession setRetryNonce:](v3, "setRetryNonce:", v9);

  -[PKPaymentMerchantSession operationalAnalyticsIdentifier](self, "operationalAnalyticsIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufPaymentMerchantSession setOperationalAnalyticsIdentifier:](v3, "setOperationalAnalyticsIdentifier:", v10);

  -[PKPaymentMerchantSession initiative](self, "initiative");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[PKPaymentMerchantSession initiative](self, "initiative");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKProtobufPaymentMerchantSession setInitiative:](v3, "setInitiative:", v12);

    -[PKPaymentMerchantSession initiativeContext](self, "initiativeContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKProtobufPaymentMerchantSession setInitiativeContext:](v3, "setInitiativeContext:", v13);

    -[PKPaymentMerchantSession signedFields](self, "signedFields");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "mutableCopy");
    -[PKProtobufPaymentMerchantSession setSignedFields:](v3, "setSignedFields:", v15);

  }
  else
  {
    -[PKPaymentMerchantSession domain](self, "domain");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKProtobufPaymentMerchantSession setDomain:](v3, "setDomain:", v14);
  }

  return v3;
}

@end
