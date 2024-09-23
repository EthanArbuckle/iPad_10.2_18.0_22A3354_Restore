@implementation PKRecurringPaymentRequest

+ (PKRecurringPaymentRequest)recurringPaymentRequestWithProtobuf:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  PKRecurringPaymentRequest *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v3 = a3;
  objc_msgSend(v3, "paymentDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "regularBilling");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKPaymentSummaryItem itemWithProtobuf:](PKPaymentSummaryItem, "itemWithProtobuf:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v3, "managementURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLWithString:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[PKRecurringPaymentRequest initWithPaymentDescription:regularBilling:managementURL:]([PKRecurringPaymentRequest alloc], "initWithPaymentDescription:regularBilling:managementURL:", v4, v6, v9);
  if (objc_msgSend(v3, "hasTrialBilling"))
  {
    objc_msgSend(v3, "trialBilling");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKPaymentSummaryItem itemWithProtobuf:](PKPaymentSummaryItem, "itemWithProtobuf:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKRecurringPaymentRequest setTrialBilling:](v10, "setTrialBilling:", v12);
  }
  if (objc_msgSend(v3, "hasBillingAgreement"))
  {
    objc_msgSend(v3, "billingAgreement");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKRecurringPaymentRequest setBillingAgreement:](v10, "setBillingAgreement:", v13);

  }
  if (objc_msgSend(v3, "hasTokenNotificationURL"))
  {
    v14 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v3, "tokenNotificationURL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "URLWithString:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKRecurringPaymentRequest setTokenNotificationURL:](v10, "setTokenNotificationURL:", v16);

  }
  return v10;
}

- (id)protobuf
{
  PKProtobufRecurringPaymentRequest *v3;
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
  void *v16;

  v3 = objc_alloc_init(PKProtobufRecurringPaymentRequest);
  -[PKRecurringPaymentRequest paymentDescription](self, "paymentDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufRecurringPaymentRequest setPaymentDescription:](v3, "setPaymentDescription:", v4);

  -[PKRecurringPaymentRequest regularBilling](self, "regularBilling");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "summaryItemProtobuf");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufRecurringPaymentRequest setRegularBilling:](v3, "setRegularBilling:", v6);

  -[PKRecurringPaymentRequest managementURL](self, "managementURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "absoluteString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufRecurringPaymentRequest setManagementURL:](v3, "setManagementURL:", v8);

  -[PKRecurringPaymentRequest trialBilling](self, "trialBilling");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[PKRecurringPaymentRequest trialBilling](self, "trialBilling");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "summaryItemProtobuf");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKProtobufRecurringPaymentRequest setTrialBilling:](v3, "setTrialBilling:", v11);

  }
  -[PKRecurringPaymentRequest billingAgreement](self, "billingAgreement");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[PKRecurringPaymentRequest billingAgreement](self, "billingAgreement");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKProtobufRecurringPaymentRequest setBillingAgreement:](v3, "setBillingAgreement:", v13);

  }
  -[PKRecurringPaymentRequest tokenNotificationURL](self, "tokenNotificationURL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[PKRecurringPaymentRequest tokenNotificationURL](self, "tokenNotificationURL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "absoluteString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKProtobufRecurringPaymentRequest setManagementURL:](v3, "setManagementURL:", v16);

  }
  return v3;
}

- (PKRecurringPaymentRequest)initWithPaymentDescription:(NSString *)paymentDescription regularBilling:(PKRecurringPaymentSummaryItem *)regularBilling managementURL:(NSURL *)managementURL
{
  NSString *v8;
  PKRecurringPaymentSummaryItem *v9;
  NSURL *v10;
  PKRecurringPaymentRequest *v11;
  uint64_t v12;
  NSString *v13;
  uint64_t v14;
  PKRecurringPaymentSummaryItem *v15;
  uint64_t v16;
  NSURL *v17;
  objc_super v19;

  v8 = paymentDescription;
  v9 = regularBilling;
  v10 = managementURL;
  v19.receiver = self;
  v19.super_class = (Class)PKRecurringPaymentRequest;
  v11 = -[PKRecurringPaymentRequest init](&v19, sel_init);
  if (v11)
  {
    v12 = -[NSString copy](v8, "copy");
    v13 = v11->_paymentDescription;
    v11->_paymentDescription = (NSString *)v12;

    v14 = -[PKRecurringPaymentSummaryItem copy](v9, "copy");
    v15 = v11->_regularBilling;
    v11->_regularBilling = (PKRecurringPaymentSummaryItem *)v14;

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
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;

  v5 = objc_alloc_init((Class)objc_opt_class());
  v6 = -[NSString copyWithZone:](self->_paymentDescription, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[PKRecurringPaymentSummaryItem copyWithZone:](self->_regularBilling, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  v10 = -[PKRecurringPaymentSummaryItem copyWithZone:](self->_trialBilling, "copyWithZone:", a3);
  v11 = (void *)v5[3];
  v5[3] = v10;

  v12 = -[NSString copyWithZone:](self->_billingAgreement, "copyWithZone:", a3);
  v13 = (void *)v5[4];
  v5[4] = v12;

  v14 = -[NSURL copyWithZone:](self->_managementURL, "copyWithZone:", a3);
  v15 = (void *)v5[5];
  v5[5] = v14;

  v16 = -[NSURL copyWithZone:](self->_tokenNotificationURL, "copyWithZone:", a3);
  v17 = (void *)v5[6];
  v5[6] = v16;

  return v5;
}

- (PKRecurringPaymentRequest)initWithCoder:(id)a3
{
  id v4;
  PKRecurringPaymentRequest *v5;
  uint64_t v6;
  NSString *paymentDescription;
  uint64_t v8;
  PKRecurringPaymentSummaryItem *regularBilling;
  uint64_t v10;
  PKRecurringPaymentSummaryItem *trialBilling;
  uint64_t v12;
  NSString *billingAgreement;
  uint64_t v14;
  NSURL *managementURL;
  uint64_t v16;
  NSURL *tokenNotificationURL;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PKRecurringPaymentRequest;
  v5 = -[PKRecurringPaymentRequest init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("paymentDescription"));
    v6 = objc_claimAutoreleasedReturnValue();
    paymentDescription = v5->_paymentDescription;
    v5->_paymentDescription = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("regularBilling"));
    v8 = objc_claimAutoreleasedReturnValue();
    regularBilling = v5->_regularBilling;
    v5->_regularBilling = (PKRecurringPaymentSummaryItem *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("trialBilling"));
    v10 = objc_claimAutoreleasedReturnValue();
    trialBilling = v5->_trialBilling;
    v5->_trialBilling = (PKRecurringPaymentSummaryItem *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("billingAgreement"));
    v12 = objc_claimAutoreleasedReturnValue();
    billingAgreement = v5->_billingAgreement;
    v5->_billingAgreement = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("managementURL"));
    v14 = objc_claimAutoreleasedReturnValue();
    managementURL = v5->_managementURL;
    v5->_managementURL = (NSURL *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tokenNotificationURL"));
    v16 = objc_claimAutoreleasedReturnValue();
    tokenNotificationURL = v5->_tokenNotificationURL;
    v5->_tokenNotificationURL = (NSURL *)v16;

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
  objc_msgSend(v5, "encodeObject:forKey:", self->_regularBilling, CFSTR("regularBilling"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_trialBilling, CFSTR("trialBilling"));
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
  objc_msgSend(v3, "appendFormat:", CFSTR("regularBilling: %@, "), self->_regularBilling);
  if (self->_trialBilling)
    objc_msgSend(v3, "appendFormat:", CFSTR("trialBilling: %@, "), self->_trialBilling);
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
  objc_msgSend(v3, "safelyAddObject:", self->_regularBilling);
  objc_msgSend(v3, "safelyAddObject:", self->_trialBilling);
  objc_msgSend(v3, "safelyAddObject:", self->_billingAgreement);
  objc_msgSend(v3, "safelyAddObject:", self->_managementURL);
  objc_msgSend(v3, "safelyAddObject:", self->_tokenNotificationURL);
  v4 = PKCombinedHash(17, v3);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  PKRecurringPaymentRequest *v4;
  PKRecurringPaymentRequest *v5;
  BOOL v6;

  v4 = (PKRecurringPaymentRequest *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKRecurringPaymentRequest isEqualToRecurringPaymentRequest:](self, "isEqualToRecurringPaymentRequest:", v5);

  return v6;
}

- (BOOL)isEqualToRecurringPaymentRequest:(id)a3
{
  _QWORD *v4;
  void *v5;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  BOOL v9;
  _BOOL4 v10;
  PKRecurringPaymentSummaryItem *regularBilling;
  PKRecurringPaymentSummaryItem *v12;
  PKRecurringPaymentSummaryItem *trialBilling;
  PKRecurringPaymentSummaryItem *v14;
  char v15;
  void *v17;
  NSString *v18;
  _BOOL4 v19;
  NSURL *managementURL;
  NSURL *v21;
  NSURL *tokenNotificationURL;
  NSURL *v23;

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
      goto LABEL_20;
  }
  regularBilling = self->_regularBilling;
  v12 = (PKRecurringPaymentSummaryItem *)v4[2];
  if (regularBilling && v12)
  {
    if (!-[PKRecurringPaymentSummaryItem isEqual:](regularBilling, "isEqual:"))
      goto LABEL_20;
  }
  else if (regularBilling != v12)
  {
    goto LABEL_20;
  }
  trialBilling = self->_trialBilling;
  v14 = (PKRecurringPaymentSummaryItem *)v4[3];
  if (trialBilling && v14)
  {
    if (!-[PKRecurringPaymentSummaryItem isEqual:](trialBilling, "isEqual:"))
      goto LABEL_20;
  }
  else if (trialBilling != v14)
  {
    goto LABEL_20;
  }
  v17 = (void *)v4[4];
  v6 = self->_billingAgreement;
  v18 = v17;
  if (v6 == v18)
  {

    goto LABEL_28;
  }
  v8 = v18;
  if (!v6 || !v18)
  {
LABEL_7:

    goto LABEL_20;
  }
  v19 = -[NSString isEqualToString:](v6, "isEqualToString:", v18);

  if (!v19)
    goto LABEL_20;
LABEL_28:
  managementURL = self->_managementURL;
  v21 = (NSURL *)v4[5];
  if (managementURL && v21)
  {
    if ((-[NSURL isEqual:](managementURL, "isEqual:") & 1) != 0)
      goto LABEL_33;
LABEL_20:
    v15 = 0;
    goto LABEL_21;
  }
  if (managementURL != v21)
    goto LABEL_20;
LABEL_33:
  tokenNotificationURL = self->_tokenNotificationURL;
  v23 = (NSURL *)v4[6];
  if (tokenNotificationURL && v23)
    v15 = -[NSURL isEqual:](tokenNotificationURL, "isEqual:");
  else
    v15 = tokenNotificationURL == v23;
LABEL_21:

  return v15;
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

- (PKRecurringPaymentRequest)initWithDictionary:(id)a3 error:(id *)a4
{
  id v5;
  PKRecurringPaymentRequest *v6;
  uint64_t v7;
  NSString *paymentDescription;
  void *v9;
  PKRecurringPaymentSummaryItem *v10;
  PKRecurringPaymentSummaryItem *regularBilling;
  void *v12;
  PKRecurringPaymentSummaryItem *v13;
  PKRecurringPaymentSummaryItem *trialBilling;
  uint64_t v15;
  NSString *billingAgreement;
  uint64_t v17;
  NSURL *managementURL;
  uint64_t v19;
  NSURL *tokenNotificationURL;

  v5 = a3;
  v6 = -[PKRecurringPaymentRequest init](self, "init");
  if (v6)
  {
    objc_msgSend(v5, "PKStringForKey:", CFSTR("paymentDescription"));
    v7 = objc_claimAutoreleasedReturnValue();
    paymentDescription = v6->_paymentDescription;
    v6->_paymentDescription = (NSString *)v7;

    objc_msgSend(v5, "PKDictionaryForKey:", CFSTR("regularBilling"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = -[PKRecurringPaymentSummaryItem initWithDictionary:error:]([PKRecurringPaymentSummaryItem alloc], "initWithDictionary:error:", v9, 0);
      regularBilling = v6->_regularBilling;
      v6->_regularBilling = v10;

    }
    objc_msgSend(v5, "PKDictionaryForKey:", CFSTR("trialBilling"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = -[PKRecurringPaymentSummaryItem initWithDictionary:error:]([PKRecurringPaymentSummaryItem alloc], "initWithDictionary:error:", v12, 0);
      trialBilling = v6->_trialBilling;
      v6->_trialBilling = v13;

    }
    objc_msgSend(v5, "PKStringForKey:", CFSTR("billingAgreement"));
    v15 = objc_claimAutoreleasedReturnValue();
    billingAgreement = v6->_billingAgreement;
    v6->_billingAgreement = (NSString *)v15;

    objc_msgSend(v5, "PKURLForKey:", CFSTR("managementURL"));
    v17 = objc_claimAutoreleasedReturnValue();
    managementURL = v6->_managementURL;
    v6->_managementURL = (NSURL *)v17;

    objc_msgSend(v5, "PKURLForKey:", CFSTR("tokenNotificationURL"));
    v19 = objc_claimAutoreleasedReturnValue();
    tokenNotificationURL = v6->_tokenNotificationURL;
    v6->_tokenNotificationURL = (NSURL *)v19;

  }
  return v6;
}

- (id)dictionaryRepresentation
{
  id v3;
  void *v4;
  NSString *paymentDescription;
  PKRecurringPaymentSummaryItem *regularBilling;
  void *v7;
  PKRecurringPaymentSummaryItem *trialBilling;
  void *v9;
  NSString *billingAgreement;
  NSURL *managementURL;
  void *v12;
  NSURL *tokenNotificationURL;
  void *v14;
  void *v15;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = v3;
  paymentDescription = self->_paymentDescription;
  if (paymentDescription)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", paymentDescription, CFSTR("paymentDescription"));
  regularBilling = self->_regularBilling;
  if (regularBilling)
  {
    -[PKRecurringPaymentSummaryItem dictionaryRepresentation](regularBilling, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("regularBilling"));

  }
  trialBilling = self->_trialBilling;
  if (trialBilling)
  {
    -[PKRecurringPaymentSummaryItem dictionaryRepresentation](trialBilling, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("trialBilling"));

  }
  billingAgreement = self->_billingAgreement;
  if (billingAgreement)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", billingAgreement, CFSTR("billingAgreement"));
  managementURL = self->_managementURL;
  if (managementURL)
  {
    -[NSURL absoluteString](managementURL, "absoluteString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("managementURL"));

  }
  tokenNotificationURL = self->_tokenNotificationURL;
  if (tokenNotificationURL)
  {
    -[NSURL absoluteString](tokenNotificationURL, "absoluteString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, CFSTR("tokenNotificationURL"));

  }
  v15 = (void *)objc_msgSend(v4, "copy");

  return v15;
}

- (NSString)paymentDescription
{
  return self->_paymentDescription;
}

- (void)setPaymentDescription:(NSString *)paymentDescription
{
  objc_setProperty_nonatomic_copy(self, a2, paymentDescription, 8);
}

- (PKRecurringPaymentSummaryItem)regularBilling
{
  return self->_regularBilling;
}

- (void)setRegularBilling:(PKRecurringPaymentSummaryItem *)regularBilling
{
  objc_storeStrong((id *)&self->_regularBilling, regularBilling);
}

- (PKRecurringPaymentSummaryItem)trialBilling
{
  return self->_trialBilling;
}

- (void)setTrialBilling:(PKRecurringPaymentSummaryItem *)trialBilling
{
  objc_storeStrong((id *)&self->_trialBilling, trialBilling);
}

- (NSString)billingAgreement
{
  return self->_billingAgreement;
}

- (void)setBillingAgreement:(NSString *)billingAgreement
{
  objc_setProperty_nonatomic_copy(self, a2, billingAgreement, 32);
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
  objc_storeStrong((id *)&self->_trialBilling, 0);
  objc_storeStrong((id *)&self->_regularBilling, 0);
  objc_storeStrong((id *)&self->_paymentDescription, 0);
}

@end
