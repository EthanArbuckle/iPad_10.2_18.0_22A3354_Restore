@implementation PKAutomaticReloadPaymentRequest

+ (PKAutomaticReloadPaymentRequest)automaticReloadPaymentRequestWithProtobuf:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  PKAutomaticReloadPaymentRequest *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = a3;
  objc_msgSend(v3, "paymentDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v3, "managementURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLWithString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "automaticPaymentBilling");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKPaymentSummaryItem itemWithProtobuf:](PKPaymentSummaryItem, "itemWithProtobuf:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[PKAutomaticReloadPaymentRequest initWithPaymentDescription:automaticReloadBilling:managementURL:]([PKAutomaticReloadPaymentRequest alloc], "initWithPaymentDescription:automaticReloadBilling:managementURL:", v4, v9, v7);
  if (objc_msgSend(v3, "hasBillingAgreement"))
  {
    objc_msgSend(v3, "billingAgreement");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAutomaticReloadPaymentRequest setBillingAgreement:](v10, "setBillingAgreement:", v11);

  }
  if (objc_msgSend(v3, "hasTokenNotificationURL"))
  {
    v12 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v3, "tokenNotificationURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "URLWithString:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAutomaticReloadPaymentRequest setTokenNotificationURL:](v10, "setTokenNotificationURL:", v14);

  }
  return v10;
}

- (id)protobuf
{
  PKProtobufAutomaticReloadPaymentRequest *v3;
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

  v3 = objc_alloc_init(PKProtobufAutomaticReloadPaymentRequest);
  -[PKAutomaticReloadPaymentRequest paymentDescription](self, "paymentDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufAutomaticReloadPaymentRequest setPaymentDescription:](v3, "setPaymentDescription:", v4);

  -[PKAutomaticReloadPaymentRequest automaticReloadBilling](self, "automaticReloadBilling");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "summaryItemProtobuf");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufAutomaticReloadPaymentRequest setAutomaticPaymentBilling:](v3, "setAutomaticPaymentBilling:", v6);

  -[PKAutomaticReloadPaymentRequest managementURL](self, "managementURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "absoluteString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufAutomaticReloadPaymentRequest setManagementURL:](v3, "setManagementURL:", v8);

  -[PKAutomaticReloadPaymentRequest billingAgreement](self, "billingAgreement");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[PKAutomaticReloadPaymentRequest billingAgreement](self, "billingAgreement");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKProtobufAutomaticReloadPaymentRequest setBillingAgreement:](v3, "setBillingAgreement:", v10);

  }
  -[PKAutomaticReloadPaymentRequest tokenNotificationURL](self, "tokenNotificationURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[PKAutomaticReloadPaymentRequest tokenNotificationURL](self, "tokenNotificationURL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "absoluteString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKProtobufAutomaticReloadPaymentRequest setManagementURL:](v3, "setManagementURL:", v13);

  }
  return v3;
}

- (PKAutomaticReloadPaymentRequest)initWithPaymentDescription:(NSString *)paymentDescription automaticReloadBilling:(PKAutomaticReloadPaymentSummaryItem *)automaticReloadBilling managementURL:(NSURL *)managementURL
{
  NSString *v8;
  PKAutomaticReloadPaymentSummaryItem *v9;
  NSURL *v10;
  PKAutomaticReloadPaymentRequest *v11;
  uint64_t v12;
  NSString *v13;
  uint64_t v14;
  PKAutomaticReloadPaymentSummaryItem *v15;
  uint64_t v16;
  NSURL *v17;
  objc_super v19;

  v8 = paymentDescription;
  v9 = automaticReloadBilling;
  v10 = managementURL;
  v19.receiver = self;
  v19.super_class = (Class)PKAutomaticReloadPaymentRequest;
  v11 = -[PKAutomaticReloadPaymentRequest init](&v19, sel_init);
  if (v11)
  {
    v12 = -[NSString copy](v8, "copy");
    v13 = v11->_paymentDescription;
    v11->_paymentDescription = (NSString *)v12;

    v14 = -[PKAutomaticReloadPaymentSummaryItem copy](v9, "copy");
    v15 = v11->_automaticReloadBilling;
    v11->_automaticReloadBilling = (PKAutomaticReloadPaymentSummaryItem *)v14;

    v16 = -[NSURL copy](v10, "copy");
    v17 = v11->_managementURL;
    v11->_managementURL = (NSURL *)v16;

  }
  return v11;
}

+ (int64_t)version
{
  return 4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v5 = objc_alloc_init((Class)objc_opt_class());
  v6 = -[NSString copyWithZone:](self->_paymentDescription, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[PKAutomaticReloadPaymentSummaryItem copyWithZone:](self->_automaticReloadBilling, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  v10 = -[NSString copyWithZone:](self->_billingAgreement, "copyWithZone:", a3);
  v11 = (void *)v5[3];
  v5[3] = v10;

  v12 = -[NSURL copyWithZone:](self->_managementURL, "copyWithZone:", a3);
  v13 = (void *)v5[4];
  v5[4] = v12;

  v14 = -[NSURL copyWithZone:](self->_tokenNotificationURL, "copyWithZone:", a3);
  v15 = (void *)v5[5];
  v5[5] = v14;

  return v5;
}

- (PKAutomaticReloadPaymentRequest)initWithCoder:(id)a3
{
  id v4;
  PKAutomaticReloadPaymentRequest *v5;
  uint64_t v6;
  NSString *paymentDescription;
  uint64_t v8;
  PKAutomaticReloadPaymentSummaryItem *automaticReloadBilling;
  uint64_t v10;
  NSString *billingAgreement;
  uint64_t v12;
  NSURL *managementURL;
  uint64_t v14;
  NSURL *tokenNotificationURL;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PKAutomaticReloadPaymentRequest;
  v5 = -[PKAutomaticReloadPaymentRequest init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("paymentDescription"));
    v6 = objc_claimAutoreleasedReturnValue();
    paymentDescription = v5->_paymentDescription;
    v5->_paymentDescription = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("automaticReloadBilling"));
    v8 = objc_claimAutoreleasedReturnValue();
    automaticReloadBilling = v5->_automaticReloadBilling;
    v5->_automaticReloadBilling = (PKAutomaticReloadPaymentSummaryItem *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("billingAgreement"));
    v10 = objc_claimAutoreleasedReturnValue();
    billingAgreement = v5->_billingAgreement;
    v5->_billingAgreement = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("managementURL"));
    v12 = objc_claimAutoreleasedReturnValue();
    managementURL = v5->_managementURL;
    v5->_managementURL = (NSURL *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tokenNotificationURL"));
    v14 = objc_claimAutoreleasedReturnValue();
    tokenNotificationURL = v5->_tokenNotificationURL;
    v5->_tokenNotificationURL = (NSURL *)v14;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *paymentDescription;
  id v5;

  paymentDescription = self->_paymentDescription;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", paymentDescription, CFSTR("paymentDescription"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_automaticReloadBilling, CFSTR("automaticReloadBilling"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_billingAgreement, CFSTR("billingAgreement"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_managementURL, CFSTR("managementURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_tokenNotificationURL, CFSTR("tokenNotificationURL"));

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
  objc_msgSend(v3, "appendFormat:", CFSTR("paymentDescription: %@, "), self->_paymentDescription);
  objc_msgSend(v3, "appendFormat:", CFSTR("automaticReloadBilling: %@ "), self->_automaticReloadBilling);
  if (self->_billingAgreement)
    objc_msgSend(v3, "appendFormat:", CFSTR("billingAgreement: %@, "), self->_billingAgreement);
  objc_msgSend(v3, "appendFormat:", CFSTR("managementURL: %@, "), self->_managementURL);
  if (self->_tokenNotificationURL)
    objc_msgSend(v3, "appendFormat:", CFSTR("tokenNotificationURL: %@, "), self->_tokenNotificationURL);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (unint64_t)hash
{
  id v3;
  unint64_t v4;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_paymentDescription);
  objc_msgSend(v3, "safelyAddObject:", self->_automaticReloadBilling);
  objc_msgSend(v3, "safelyAddObject:", self->_billingAgreement);
  objc_msgSend(v3, "safelyAddObject:", self->_managementURL);
  objc_msgSend(v3, "safelyAddObject:", self->_tokenNotificationURL);
  v4 = PKCombinedHash(17, v3);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  PKAutomaticReloadPaymentRequest *v4;
  PKAutomaticReloadPaymentRequest *v5;
  BOOL v6;

  v4 = (PKAutomaticReloadPaymentRequest *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKAutomaticReloadPaymentRequest isEqualToAutomaticReloadPaymentRequest:](self, "isEqualToAutomaticReloadPaymentRequest:", v5);

  return v6;
}

- (BOOL)isEqualToAutomaticReloadPaymentRequest:(id)a3
{
  _QWORD *v4;
  void *v5;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  BOOL v9;
  _BOOL4 v10;
  PKAutomaticReloadPaymentSummaryItem *automaticReloadBilling;
  PKAutomaticReloadPaymentSummaryItem *v12;
  char v13;
  void *v15;
  NSString *v16;
  _BOOL4 v17;
  NSURL *managementURL;
  NSURL *v19;
  NSURL *tokenNotificationURL;
  NSURL *v21;

  v4 = a3;
  v5 = (void *)v4[1];
  v6 = self->_paymentDescription;
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
      goto LABEL_7;
    v10 = -[NSString isEqualToString:](v6, "isEqualToString:", v7);

    if (!v10)
      goto LABEL_15;
  }
  automaticReloadBilling = self->_automaticReloadBilling;
  v12 = (PKAutomaticReloadPaymentSummaryItem *)v4[2];
  if (automaticReloadBilling && v12)
  {
    if (!-[PKAutomaticReloadPaymentSummaryItem isEqual:](automaticReloadBilling, "isEqual:"))
      goto LABEL_15;
  }
  else if (automaticReloadBilling != v12)
  {
    goto LABEL_15;
  }
  v15 = (void *)v4[3];
  v6 = self->_billingAgreement;
  v16 = v15;
  if (v6 == v16)
  {

    goto LABEL_23;
  }
  v8 = v16;
  if (!v6 || !v16)
  {
LABEL_7:

    goto LABEL_15;
  }
  v17 = -[NSString isEqualToString:](v6, "isEqualToString:", v16);

  if (!v17)
    goto LABEL_15;
LABEL_23:
  managementURL = self->_managementURL;
  v19 = (NSURL *)v4[4];
  if (managementURL && v19)
  {
    if ((-[NSURL isEqual:](managementURL, "isEqual:") & 1) != 0)
      goto LABEL_28;
LABEL_15:
    v13 = 0;
    goto LABEL_16;
  }
  if (managementURL != v19)
    goto LABEL_15;
LABEL_28:
  tokenNotificationURL = self->_tokenNotificationURL;
  v21 = (NSURL *)v4[5];
  if (tokenNotificationURL && v21)
    v13 = -[NSURL isEqual:](tokenNotificationURL, "isEqual:");
  else
    v13 = tokenNotificationURL == v21;
LABEL_16:

  return v13;
}

- (void)sanitize
{
  NSString *v3;
  NSString *billingAgreement;

  -[NSString pk_merchantTokensSanitizedBillingAgreement](self->_billingAgreement, "pk_merchantTokensSanitizedBillingAgreement");
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  billingAgreement = self->_billingAgreement;
  self->_billingAgreement = v3;

}

- (PKAutomaticReloadPaymentRequest)initWithDictionary:(id)a3 error:(id *)a4
{
  id v5;
  PKAutomaticReloadPaymentRequest *v6;
  uint64_t v7;
  NSString *paymentDescription;
  void *v9;
  PKAutomaticReloadPaymentSummaryItem *v10;
  PKAutomaticReloadPaymentSummaryItem *automaticReloadBilling;
  uint64_t v12;
  NSString *billingAgreement;
  uint64_t v14;
  NSURL *managementURL;
  uint64_t v16;
  NSURL *tokenNotificationURL;

  v5 = a3;
  v6 = -[PKAutomaticReloadPaymentRequest init](self, "init");
  if (v6)
  {
    objc_msgSend(v5, "PKStringForKey:", CFSTR("paymentDescription"));
    v7 = objc_claimAutoreleasedReturnValue();
    paymentDescription = v6->_paymentDescription;
    v6->_paymentDescription = (NSString *)v7;

    objc_msgSend(v5, "PKDictionaryForKey:", CFSTR("automaticReloadBilling"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = -[PKAutomaticReloadPaymentSummaryItem initWithDictionary:error:]([PKAutomaticReloadPaymentSummaryItem alloc], "initWithDictionary:error:", v9, 0);
      automaticReloadBilling = v6->_automaticReloadBilling;
      v6->_automaticReloadBilling = v10;

    }
    objc_msgSend(v5, "PKStringForKey:", CFSTR("billingAgreement"));
    v12 = objc_claimAutoreleasedReturnValue();
    billingAgreement = v6->_billingAgreement;
    v6->_billingAgreement = (NSString *)v12;

    objc_msgSend(v5, "PKURLForKey:", CFSTR("managementURL"));
    v14 = objc_claimAutoreleasedReturnValue();
    managementURL = v6->_managementURL;
    v6->_managementURL = (NSURL *)v14;

    objc_msgSend(v5, "PKURLForKey:", CFSTR("tokenNotificationURL"));
    v16 = objc_claimAutoreleasedReturnValue();
    tokenNotificationURL = v6->_tokenNotificationURL;
    v6->_tokenNotificationURL = (NSURL *)v16;

  }
  return v6;
}

- (id)dictionaryRepresentation
{
  id v3;
  void *v4;
  NSString *paymentDescription;
  PKAutomaticReloadPaymentSummaryItem *automaticReloadBilling;
  void *v7;
  NSString *billingAgreement;
  NSURL *managementURL;
  void *v10;
  NSURL *tokenNotificationURL;
  void *v12;
  void *v13;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = v3;
  paymentDescription = self->_paymentDescription;
  if (paymentDescription)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", paymentDescription, CFSTR("paymentDescription"));
  automaticReloadBilling = self->_automaticReloadBilling;
  if (automaticReloadBilling)
  {
    -[PKAutomaticReloadPaymentSummaryItem dictionaryRepresentation](automaticReloadBilling, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("automaticReloadBilling"));

  }
  billingAgreement = self->_billingAgreement;
  if (billingAgreement)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", billingAgreement, CFSTR("billingAgreement"));
  managementURL = self->_managementURL;
  if (managementURL)
  {
    -[NSURL absoluteString](managementURL, "absoluteString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("managementURL"));

  }
  tokenNotificationURL = self->_tokenNotificationURL;
  if (tokenNotificationURL)
  {
    -[NSURL absoluteString](tokenNotificationURL, "absoluteString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("tokenNotificationURL"));

  }
  v13 = (void *)objc_msgSend(v4, "copy");

  return v13;
}

- (NSString)paymentDescription
{
  return self->_paymentDescription;
}

- (void)setPaymentDescription:(NSString *)paymentDescription
{
  objc_setProperty_nonatomic_copy(self, a2, paymentDescription, 8);
}

- (PKAutomaticReloadPaymentSummaryItem)automaticReloadBilling
{
  return self->_automaticReloadBilling;
}

- (void)setAutomaticReloadBilling:(PKAutomaticReloadPaymentSummaryItem *)automaticReloadBilling
{
  objc_storeStrong((id *)&self->_automaticReloadBilling, automaticReloadBilling);
}

- (NSString)billingAgreement
{
  return self->_billingAgreement;
}

- (void)setBillingAgreement:(NSString *)billingAgreement
{
  objc_setProperty_nonatomic_copy(self, a2, billingAgreement, 24);
}

- (NSURL)managementURL
{
  return self->_managementURL;
}

- (void)setManagementURL:(NSURL *)managementURL
{
  objc_storeStrong((id *)&self->_managementURL, managementURL);
}

- (NSURL)tokenNotificationURL
{
  return self->_tokenNotificationURL;
}

- (void)setTokenNotificationURL:(NSURL *)tokenNotificationURL
{
  objc_storeStrong((id *)&self->_tokenNotificationURL, tokenNotificationURL);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenNotificationURL, 0);
  objc_storeStrong((id *)&self->_managementURL, 0);
  objc_storeStrong((id *)&self->_billingAgreement, 0);
  objc_storeStrong((id *)&self->_automaticReloadBilling, 0);
  objc_storeStrong((id *)&self->_paymentDescription, 0);
}

@end
