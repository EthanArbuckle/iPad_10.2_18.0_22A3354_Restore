@implementation PKDeferredPaymentRequest

+ (PKDeferredPaymentRequest)deferredPaymentRequestWithProtobuf:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  PKDeferredPaymentRequest *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;

  v3 = a3;
  objc_msgSend(v3, "paymentDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v3, "managementURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLWithString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "deferredBilling");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKPaymentSummaryItem itemWithProtobuf:](PKPaymentSummaryItem, "itemWithProtobuf:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[PKDeferredPaymentRequest initWithPaymentDescription:deferredBilling:managementURL:]([PKDeferredPaymentRequest alloc], "initWithPaymentDescription:deferredBilling:managementURL:", v4, v9, v7);
  if (objc_msgSend(v3, "hasBillingAgreement"))
  {
    objc_msgSend(v3, "billingAgreement");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDeferredPaymentRequest setBillingAgreement:](v10, "setBillingAgreement:", v11);

  }
  if (objc_msgSend(v3, "hasTokenNotificationURL"))
  {
    v12 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v3, "tokenNotificationURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "URLWithString:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDeferredPaymentRequest setTokenNotificationURL:](v10, "setTokenNotificationURL:", v14);

  }
  if (objc_msgSend(v3, "hasFreeCancellationDate"))
  {
    v15 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v3, "freeCancellationDate");
    objc_msgSend(v15, "dateWithTimeIntervalSinceReferenceDate:");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDeferredPaymentRequest setFreeCancellationDate:](v10, "setFreeCancellationDate:", v16);

  }
  if (objc_msgSend(v3, "hasFreeCancellationDateTimeZone"))
  {
    v17 = objc_alloc(MEMORY[0x1E0C99E80]);
    objc_msgSend(v3, "freeCancellationDateTimeZone");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v17, "initWithName:", v18);
    -[PKDeferredPaymentRequest setFreeCancellationDateTimeZone:](v10, "setFreeCancellationDateTimeZone:", v19);

  }
  return v10;
}

- (id)protobuf
{
  PKProtobufDeferredPaymentRequest *v3;
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
  void *v17;
  void *v18;

  v3 = objc_alloc_init(PKProtobufDeferredPaymentRequest);
  -[PKDeferredPaymentRequest paymentDescription](self, "paymentDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufDeferredPaymentRequest setPaymentDescription:](v3, "setPaymentDescription:", v4);

  -[PKDeferredPaymentRequest deferredBilling](self, "deferredBilling");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "summaryItemProtobuf");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufDeferredPaymentRequest setDeferredBilling:](v3, "setDeferredBilling:", v6);

  -[PKDeferredPaymentRequest managementURL](self, "managementURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "absoluteString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufDeferredPaymentRequest setManagementURL:](v3, "setManagementURL:", v8);

  -[PKDeferredPaymentRequest billingAgreement](self, "billingAgreement");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[PKDeferredPaymentRequest billingAgreement](self, "billingAgreement");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKProtobufDeferredPaymentRequest setBillingAgreement:](v3, "setBillingAgreement:", v10);

  }
  -[PKDeferredPaymentRequest tokenNotificationURL](self, "tokenNotificationURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[PKDeferredPaymentRequest tokenNotificationURL](self, "tokenNotificationURL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "absoluteString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKProtobufDeferredPaymentRequest setManagementURL:](v3, "setManagementURL:", v13);

  }
  -[PKDeferredPaymentRequest freeCancellationDate](self, "freeCancellationDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[PKDeferredPaymentRequest freeCancellationDate](self, "freeCancellationDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "timeIntervalSinceReferenceDate");
    -[PKProtobufDeferredPaymentRequest setFreeCancellationDate:](v3, "setFreeCancellationDate:");

  }
  -[PKDeferredPaymentRequest freeCancellationDateTimeZone](self, "freeCancellationDateTimeZone");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[PKDeferredPaymentRequest freeCancellationDateTimeZone](self, "freeCancellationDateTimeZone");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "name");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKProtobufDeferredPaymentRequest setFreeCancellationDateTimeZone:](v3, "setFreeCancellationDateTimeZone:", v18);

  }
  return v3;
}

- (PKDeferredPaymentRequest)initWithPaymentDescription:(NSString *)paymentDescription deferredBilling:(PKDeferredPaymentSummaryItem *)deferredBilling managementURL:(NSURL *)managementURL
{
  NSString *v8;
  PKDeferredPaymentSummaryItem *v9;
  NSURL *v10;
  PKDeferredPaymentRequest *v11;
  uint64_t v12;
  NSString *v13;
  uint64_t v14;
  PKDeferredPaymentSummaryItem *v15;
  uint64_t v16;
  NSURL *v17;
  objc_super v19;

  v8 = paymentDescription;
  v9 = deferredBilling;
  v10 = managementURL;
  v19.receiver = self;
  v19.super_class = (Class)PKDeferredPaymentRequest;
  v11 = -[PKDeferredPaymentRequest init](&v19, sel_init);
  if (v11)
  {
    v12 = -[NSString copy](v8, "copy");
    v13 = v11->_paymentDescription;
    v11->_paymentDescription = (NSString *)v12;

    v14 = -[PKDeferredPaymentSummaryItem copy](v9, "copy");
    v15 = v11->_deferredBilling;
    v11->_deferredBilling = (PKDeferredPaymentSummaryItem *)v14;

    v16 = -[NSURL copy](v10, "copy");
    v17 = v11->_managementURL;
    v11->_managementURL = (NSURL *)v16;

  }
  return v11;
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
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;

  v5 = objc_alloc_init((Class)objc_opt_class());
  v6 = -[NSString copyWithZone:](self->_paymentDescription, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[PKDeferredPaymentSummaryItem copyWithZone:](self->_deferredBilling, "copyWithZone:", a3);
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

  v16 = -[NSDate copyWithZone:](self->_freeCancellationDate, "copyWithZone:", a3);
  v17 = (void *)v5[6];
  v5[6] = v16;

  v18 = -[NSTimeZone copyWithZone:](self->_freeCancellationDateTimeZone, "copyWithZone:", a3);
  v19 = (void *)v5[7];
  v5[7] = v18;

  return v5;
}

- (PKDeferredPaymentRequest)initWithCoder:(id)a3
{
  id v4;
  PKDeferredPaymentRequest *v5;
  uint64_t v6;
  NSString *paymentDescription;
  uint64_t v8;
  PKDeferredPaymentSummaryItem *deferredBilling;
  uint64_t v10;
  NSString *billingAgreement;
  uint64_t v12;
  NSURL *managementURL;
  uint64_t v14;
  NSURL *tokenNotificationURL;
  uint64_t v16;
  NSDate *freeCancellationDate;
  uint64_t v18;
  NSTimeZone *freeCancellationDateTimeZone;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PKDeferredPaymentRequest;
  v5 = -[PKDeferredPaymentRequest init](&v21, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("paymentDescription"));
    v6 = objc_claimAutoreleasedReturnValue();
    paymentDescription = v5->_paymentDescription;
    v5->_paymentDescription = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deferredBilling"));
    v8 = objc_claimAutoreleasedReturnValue();
    deferredBilling = v5->_deferredBilling;
    v5->_deferredBilling = (PKDeferredPaymentSummaryItem *)v8;

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

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("freeCancellationDate"));
    v16 = objc_claimAutoreleasedReturnValue();
    freeCancellationDate = v5->_freeCancellationDate;
    v5->_freeCancellationDate = (NSDate *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("freeCancellationDateTimeZone"));
    v18 = objc_claimAutoreleasedReturnValue();
    freeCancellationDateTimeZone = v5->_freeCancellationDateTimeZone;
    v5->_freeCancellationDateTimeZone = (NSTimeZone *)v18;

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
  objc_msgSend(v5, "encodeObject:forKey:", self->_deferredBilling, CFSTR("deferredBilling"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_billingAgreement, CFSTR("billingAgreement"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_managementURL, CFSTR("managementURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_tokenNotificationURL, CFSTR("tokenNotificationURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_freeCancellationDate, CFSTR("freeCancellationDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_freeCancellationDateTimeZone, CFSTR("freeCancellationDateTimeZone"));

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
  objc_msgSend(v3, "appendFormat:", CFSTR("deferredBilling: %@ "), self->_deferredBilling);
  if (self->_billingAgreement)
    objc_msgSend(v3, "appendFormat:", CFSTR("billingAgreement: %@, "), self->_billingAgreement);
  objc_msgSend(v3, "appendFormat:", CFSTR("managementURL: %@, "), self->_managementURL);
  if (self->_tokenNotificationURL)
    objc_msgSend(v3, "appendFormat:", CFSTR("tokenNotificationURL: %@, "), self->_tokenNotificationURL);
  if (self->_freeCancellationDate)
    objc_msgSend(v3, "appendFormat:", CFSTR("freeCancellationDate: %@, "), self->_freeCancellationDate);
  if (self->_freeCancellationDateTimeZone)
    objc_msgSend(v3, "appendFormat:", CFSTR("freeCancellationDateTimeZone: %@, "), self->_freeCancellationDateTimeZone);
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
  objc_msgSend(v3, "safelyAddObject:", self->_deferredBilling);
  objc_msgSend(v3, "safelyAddObject:", self->_billingAgreement);
  objc_msgSend(v3, "safelyAddObject:", self->_managementURL);
  objc_msgSend(v3, "safelyAddObject:", self->_tokenNotificationURL);
  objc_msgSend(v3, "safelyAddObject:", self->_freeCancellationDate);
  objc_msgSend(v3, "safelyAddObject:", self->_freeCancellationDateTimeZone);
  v4 = PKCombinedHash(17, v3);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  PKDeferredPaymentRequest *v4;
  PKDeferredPaymentRequest *v5;
  BOOL v6;

  v4 = (PKDeferredPaymentRequest *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKDeferredPaymentRequest isEqualToDeferredPaymentRequest:](self, "isEqualToDeferredPaymentRequest:", v5);

  return v6;
}

- (BOOL)isEqualToDeferredPaymentRequest:(id)a3
{
  _QWORD *v4;
  void *v5;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  BOOL v9;
  _BOOL4 v10;
  PKDeferredPaymentSummaryItem *deferredBilling;
  PKDeferredPaymentSummaryItem *v12;
  char v13;
  void *v15;
  NSString *v16;
  _BOOL4 v17;
  NSURL *managementURL;
  NSURL *v19;
  NSURL *tokenNotificationURL;
  NSURL *v21;
  NSDate *freeCancellationDate;
  NSDate *v23;
  NSTimeZone *freeCancellationDateTimeZone;
  NSTimeZone *v25;

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
  deferredBilling = self->_deferredBilling;
  v12 = (PKDeferredPaymentSummaryItem *)v4[2];
  if (deferredBilling && v12)
  {
    if (!-[PKDeferredPaymentSummaryItem isEqual:](deferredBilling, "isEqual:"))
      goto LABEL_15;
  }
  else if (deferredBilling != v12)
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
    if ((-[NSURL isEqual:](managementURL, "isEqual:") & 1) == 0)
      goto LABEL_15;
  }
  else if (managementURL != v19)
  {
    goto LABEL_15;
  }
  tokenNotificationURL = self->_tokenNotificationURL;
  v21 = (NSURL *)v4[5];
  if (tokenNotificationURL && v21)
  {
    if ((-[NSURL isEqual:](tokenNotificationURL, "isEqual:") & 1) == 0)
      goto LABEL_15;
  }
  else if (tokenNotificationURL != v21)
  {
    goto LABEL_15;
  }
  freeCancellationDate = self->_freeCancellationDate;
  v23 = (NSDate *)v4[6];
  if (freeCancellationDate && v23)
  {
    if ((-[NSDate isEqual:](freeCancellationDate, "isEqual:") & 1) != 0)
      goto LABEL_38;
LABEL_15:
    v13 = 0;
    goto LABEL_16;
  }
  if (freeCancellationDate != v23)
    goto LABEL_15;
LABEL_38:
  freeCancellationDateTimeZone = self->_freeCancellationDateTimeZone;
  v25 = (NSTimeZone *)v4[7];
  if (freeCancellationDateTimeZone && v25)
    v13 = -[NSTimeZone isEqual:](freeCancellationDateTimeZone, "isEqual:");
  else
    v13 = freeCancellationDateTimeZone == v25;
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

- (NSString)paymentDescription
{
  return self->_paymentDescription;
}

- (void)setPaymentDescription:(NSString *)paymentDescription
{
  objc_setProperty_nonatomic_copy(self, a2, paymentDescription, 8);
}

- (PKDeferredPaymentSummaryItem)deferredBilling
{
  return self->_deferredBilling;
}

- (void)setDeferredBilling:(PKDeferredPaymentSummaryItem *)deferredBilling
{
  objc_storeStrong((id *)&self->_deferredBilling, deferredBilling);
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

- (NSDate)freeCancellationDate
{
  return self->_freeCancellationDate;
}

- (void)setFreeCancellationDate:(NSDate *)freeCancellationDate
{
  objc_storeStrong((id *)&self->_freeCancellationDate, freeCancellationDate);
}

- (NSTimeZone)freeCancellationDateTimeZone
{
  return self->_freeCancellationDateTimeZone;
}

- (void)setFreeCancellationDateTimeZone:(NSTimeZone *)freeCancellationDateTimeZone
{
  objc_storeStrong((id *)&self->_freeCancellationDateTimeZone, freeCancellationDateTimeZone);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_freeCancellationDateTimeZone, 0);
  objc_storeStrong((id *)&self->_freeCancellationDate, 0);
  objc_storeStrong((id *)&self->_tokenNotificationURL, 0);
  objc_storeStrong((id *)&self->_managementURL, 0);
  objc_storeStrong((id *)&self->_billingAgreement, 0);
  objc_storeStrong((id *)&self->_deferredBilling, 0);
  objc_storeStrong((id *)&self->_paymentDescription, 0);
}

@end
