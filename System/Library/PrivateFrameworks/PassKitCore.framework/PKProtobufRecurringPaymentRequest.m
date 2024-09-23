@implementation PKProtobufRecurringPaymentRequest

- (BOOL)hasPaymentDescription
{
  return self->_paymentDescription != 0;
}

- (BOOL)hasRegularBilling
{
  return self->_regularBilling != 0;
}

- (BOOL)hasTrialBilling
{
  return self->_trialBilling != 0;
}

- (BOOL)hasBillingAgreement
{
  return self->_billingAgreement != 0;
}

- (BOOL)hasManagementURL
{
  return self->_managementURL != 0;
}

- (BOOL)hasTokenNotificationURL
{
  return self->_tokenNotificationURL != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)PKProtobufRecurringPaymentRequest;
  -[PKProtobufRecurringPaymentRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufRecurringPaymentRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *paymentDescription;
  PKProtobufPaymentSummaryItem *regularBilling;
  void *v7;
  PKProtobufPaymentSummaryItem *trialBilling;
  void *v9;
  NSString *billingAgreement;
  NSString *managementURL;
  NSString *tokenNotificationURL;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  paymentDescription = self->_paymentDescription;
  if (paymentDescription)
    objc_msgSend(v3, "setObject:forKey:", paymentDescription, CFSTR("paymentDescription"));
  regularBilling = self->_regularBilling;
  if (regularBilling)
  {
    -[PKProtobufPaymentSummaryItem dictionaryRepresentation](regularBilling, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("regularBilling"));

  }
  trialBilling = self->_trialBilling;
  if (trialBilling)
  {
    -[PKProtobufPaymentSummaryItem dictionaryRepresentation](trialBilling, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("trialBilling"));

  }
  billingAgreement = self->_billingAgreement;
  if (billingAgreement)
    objc_msgSend(v4, "setObject:forKey:", billingAgreement, CFSTR("billingAgreement"));
  managementURL = self->_managementURL;
  if (managementURL)
    objc_msgSend(v4, "setObject:forKey:", managementURL, CFSTR("managementURL"));
  tokenNotificationURL = self->_tokenNotificationURL;
  if (tokenNotificationURL)
    objc_msgSend(v4, "setObject:forKey:", tokenNotificationURL, CFSTR("tokenNotificationURL"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return PKProtobufRecurringPaymentRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_paymentDescription)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_regularBilling)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_trialBilling)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_billingAgreement)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_managementURL)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_tokenNotificationURL)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_paymentDescription)
  {
    objc_msgSend(v4, "setPaymentDescription:");
    v4 = v5;
  }
  if (self->_regularBilling)
  {
    objc_msgSend(v5, "setRegularBilling:");
    v4 = v5;
  }
  if (self->_trialBilling)
  {
    objc_msgSend(v5, "setTrialBilling:");
    v4 = v5;
  }
  if (self->_billingAgreement)
  {
    objc_msgSend(v5, "setBillingAgreement:");
    v4 = v5;
  }
  if (self->_managementURL)
  {
    objc_msgSend(v5, "setManagementURL:");
    v4 = v5;
  }
  if (self->_tokenNotificationURL)
  {
    objc_msgSend(v5, "setTokenNotificationURL:");
    v4 = v5;
  }

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

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_paymentDescription, "copyWithZone:", a3);
  v7 = (void *)v5[3];
  v5[3] = v6;

  v8 = -[PKProtobufPaymentSummaryItem copyWithZone:](self->_regularBilling, "copyWithZone:", a3);
  v9 = (void *)v5[4];
  v5[4] = v8;

  v10 = -[PKProtobufPaymentSummaryItem copyWithZone:](self->_trialBilling, "copyWithZone:", a3);
  v11 = (void *)v5[6];
  v5[6] = v10;

  v12 = -[NSString copyWithZone:](self->_billingAgreement, "copyWithZone:", a3);
  v13 = (void *)v5[1];
  v5[1] = v12;

  v14 = -[NSString copyWithZone:](self->_managementURL, "copyWithZone:", a3);
  v15 = (void *)v5[2];
  v5[2] = v14;

  v16 = -[NSString copyWithZone:](self->_tokenNotificationURL, "copyWithZone:", a3);
  v17 = (void *)v5[5];
  v5[5] = v16;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *paymentDescription;
  PKProtobufPaymentSummaryItem *regularBilling;
  PKProtobufPaymentSummaryItem *trialBilling;
  NSString *billingAgreement;
  NSString *managementURL;
  NSString *tokenNotificationURL;
  char v11;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((paymentDescription = self->_paymentDescription, !((unint64_t)paymentDescription | v4[3]))
     || -[NSString isEqual:](paymentDescription, "isEqual:"))
    && ((regularBilling = self->_regularBilling, !((unint64_t)regularBilling | v4[4]))
     || -[PKProtobufPaymentSummaryItem isEqual:](regularBilling, "isEqual:"))
    && ((trialBilling = self->_trialBilling, !((unint64_t)trialBilling | v4[6]))
     || -[PKProtobufPaymentSummaryItem isEqual:](trialBilling, "isEqual:"))
    && ((billingAgreement = self->_billingAgreement, !((unint64_t)billingAgreement | v4[1]))
     || -[NSString isEqual:](billingAgreement, "isEqual:"))
    && ((managementURL = self->_managementURL, !((unint64_t)managementURL | v4[2]))
     || -[NSString isEqual:](managementURL, "isEqual:")))
  {
    tokenNotificationURL = self->_tokenNotificationURL;
    if ((unint64_t)tokenNotificationURL | v4[5])
      v11 = -[NSString isEqual:](tokenNotificationURL, "isEqual:");
    else
      v11 = 1;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  unint64_t v5;
  NSUInteger v6;
  NSUInteger v7;

  v3 = -[NSString hash](self->_paymentDescription, "hash");
  v4 = -[PKProtobufPaymentSummaryItem hash](self->_regularBilling, "hash") ^ v3;
  v5 = -[PKProtobufPaymentSummaryItem hash](self->_trialBilling, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_billingAgreement, "hash");
  v7 = -[NSString hash](self->_managementURL, "hash");
  return v6 ^ v7 ^ -[NSString hash](self->_tokenNotificationURL, "hash");
}

- (void)mergeFrom:(id)a3
{
  PKProtobufPaymentSummaryItem *regularBilling;
  uint64_t v5;
  PKProtobufPaymentSummaryItem *trialBilling;
  uint64_t v7;
  _QWORD *v8;

  v8 = a3;
  if (v8[3])
    -[PKProtobufRecurringPaymentRequest setPaymentDescription:](self, "setPaymentDescription:");
  regularBilling = self->_regularBilling;
  v5 = v8[4];
  if (regularBilling)
  {
    if (v5)
      -[PKProtobufPaymentSummaryItem mergeFrom:](regularBilling, "mergeFrom:");
  }
  else if (v5)
  {
    -[PKProtobufRecurringPaymentRequest setRegularBilling:](self, "setRegularBilling:");
  }
  trialBilling = self->_trialBilling;
  v7 = v8[6];
  if (trialBilling)
  {
    if (v7)
      -[PKProtobufPaymentSummaryItem mergeFrom:](trialBilling, "mergeFrom:");
  }
  else if (v7)
  {
    -[PKProtobufRecurringPaymentRequest setTrialBilling:](self, "setTrialBilling:");
  }
  if (v8[1])
    -[PKProtobufRecurringPaymentRequest setBillingAgreement:](self, "setBillingAgreement:");
  if (v8[2])
    -[PKProtobufRecurringPaymentRequest setManagementURL:](self, "setManagementURL:");
  if (v8[5])
    -[PKProtobufRecurringPaymentRequest setTokenNotificationURL:](self, "setTokenNotificationURL:");

}

- (NSString)paymentDescription
{
  return self->_paymentDescription;
}

- (void)setPaymentDescription:(id)a3
{
  objc_storeStrong((id *)&self->_paymentDescription, a3);
}

- (PKProtobufPaymentSummaryItem)regularBilling
{
  return self->_regularBilling;
}

- (void)setRegularBilling:(id)a3
{
  objc_storeStrong((id *)&self->_regularBilling, a3);
}

- (PKProtobufPaymentSummaryItem)trialBilling
{
  return self->_trialBilling;
}

- (void)setTrialBilling:(id)a3
{
  objc_storeStrong((id *)&self->_trialBilling, a3);
}

- (NSString)billingAgreement
{
  return self->_billingAgreement;
}

- (void)setBillingAgreement:(id)a3
{
  objc_storeStrong((id *)&self->_billingAgreement, a3);
}

- (NSString)managementURL
{
  return self->_managementURL;
}

- (void)setManagementURL:(id)a3
{
  objc_storeStrong((id *)&self->_managementURL, a3);
}

- (NSString)tokenNotificationURL
{
  return self->_tokenNotificationURL;
}

- (void)setTokenNotificationURL:(id)a3
{
  objc_storeStrong((id *)&self->_tokenNotificationURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trialBilling, 0);
  objc_storeStrong((id *)&self->_tokenNotificationURL, 0);
  objc_storeStrong((id *)&self->_regularBilling, 0);
  objc_storeStrong((id *)&self->_paymentDescription, 0);
  objc_storeStrong((id *)&self->_managementURL, 0);
  objc_storeStrong((id *)&self->_billingAgreement, 0);
}

@end
