@implementation PKProtobufAutomaticReloadPaymentRequest

- (BOOL)hasPaymentDescription
{
  return self->_paymentDescription != 0;
}

- (BOOL)hasAutomaticPaymentBilling
{
  return self->_automaticPaymentBilling != 0;
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
  v8.super_class = (Class)PKProtobufAutomaticReloadPaymentRequest;
  -[PKProtobufAutomaticReloadPaymentRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufAutomaticReloadPaymentRequest dictionaryRepresentation](self, "dictionaryRepresentation");
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
  PKProtobufPaymentSummaryItem *automaticPaymentBilling;
  void *v7;
  NSString *billingAgreement;
  NSString *managementURL;
  NSString *tokenNotificationURL;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  paymentDescription = self->_paymentDescription;
  if (paymentDescription)
    objc_msgSend(v3, "setObject:forKey:", paymentDescription, CFSTR("paymentDescription"));
  automaticPaymentBilling = self->_automaticPaymentBilling;
  if (automaticPaymentBilling)
  {
    -[PKProtobufPaymentSummaryItem dictionaryRepresentation](automaticPaymentBilling, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("automaticPaymentBilling"));

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
  return PKProtobufAutomaticReloadPaymentRequestReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_automaticPaymentBilling)
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
  if (self->_automaticPaymentBilling)
  {
    objc_msgSend(v5, "setAutomaticPaymentBilling:");
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
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_paymentDescription, "copyWithZone:", a3);
  v7 = (void *)v5[4];
  v5[4] = v6;

  v8 = -[PKProtobufPaymentSummaryItem copyWithZone:](self->_automaticPaymentBilling, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  v10 = -[NSString copyWithZone:](self->_billingAgreement, "copyWithZone:", a3);
  v11 = (void *)v5[2];
  v5[2] = v10;

  v12 = -[NSString copyWithZone:](self->_managementURL, "copyWithZone:", a3);
  v13 = (void *)v5[3];
  v5[3] = v12;

  v14 = -[NSString copyWithZone:](self->_tokenNotificationURL, "copyWithZone:", a3);
  v15 = (void *)v5[5];
  v5[5] = v14;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *paymentDescription;
  PKProtobufPaymentSummaryItem *automaticPaymentBilling;
  NSString *billingAgreement;
  NSString *managementURL;
  NSString *tokenNotificationURL;
  char v10;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((paymentDescription = self->_paymentDescription, !((unint64_t)paymentDescription | v4[4]))
     || -[NSString isEqual:](paymentDescription, "isEqual:"))
    && ((automaticPaymentBilling = self->_automaticPaymentBilling, !((unint64_t)automaticPaymentBilling | v4[1]))
     || -[PKProtobufPaymentSummaryItem isEqual:](automaticPaymentBilling, "isEqual:"))
    && ((billingAgreement = self->_billingAgreement, !((unint64_t)billingAgreement | v4[2]))
     || -[NSString isEqual:](billingAgreement, "isEqual:"))
    && ((managementURL = self->_managementURL, !((unint64_t)managementURL | v4[3]))
     || -[NSString isEqual:](managementURL, "isEqual:")))
  {
    tokenNotificationURL = self->_tokenNotificationURL;
    if ((unint64_t)tokenNotificationURL | v4[5])
      v10 = -[NSString isEqual:](tokenNotificationURL, "isEqual:");
    else
      v10 = 1;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  NSUInteger v5;
  NSUInteger v6;

  v3 = -[NSString hash](self->_paymentDescription, "hash");
  v4 = -[PKProtobufPaymentSummaryItem hash](self->_automaticPaymentBilling, "hash") ^ v3;
  v5 = -[NSString hash](self->_billingAgreement, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_managementURL, "hash");
  return v6 ^ -[NSString hash](self->_tokenNotificationURL, "hash");
}

- (void)mergeFrom:(id)a3
{
  PKProtobufPaymentSummaryItem *automaticPaymentBilling;
  uint64_t v5;
  _QWORD *v6;

  v6 = a3;
  if (v6[4])
    -[PKProtobufAutomaticReloadPaymentRequest setPaymentDescription:](self, "setPaymentDescription:");
  automaticPaymentBilling = self->_automaticPaymentBilling;
  v5 = v6[1];
  if (automaticPaymentBilling)
  {
    if (v5)
      -[PKProtobufPaymentSummaryItem mergeFrom:](automaticPaymentBilling, "mergeFrom:");
  }
  else if (v5)
  {
    -[PKProtobufAutomaticReloadPaymentRequest setAutomaticPaymentBilling:](self, "setAutomaticPaymentBilling:");
  }
  if (v6[2])
    -[PKProtobufAutomaticReloadPaymentRequest setBillingAgreement:](self, "setBillingAgreement:");
  if (v6[3])
    -[PKProtobufAutomaticReloadPaymentRequest setManagementURL:](self, "setManagementURL:");
  if (v6[5])
    -[PKProtobufAutomaticReloadPaymentRequest setTokenNotificationURL:](self, "setTokenNotificationURL:");

}

- (NSString)paymentDescription
{
  return self->_paymentDescription;
}

- (void)setPaymentDescription:(id)a3
{
  objc_storeStrong((id *)&self->_paymentDescription, a3);
}

- (PKProtobufPaymentSummaryItem)automaticPaymentBilling
{
  return self->_automaticPaymentBilling;
}

- (void)setAutomaticPaymentBilling:(id)a3
{
  objc_storeStrong((id *)&self->_automaticPaymentBilling, a3);
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
  objc_storeStrong((id *)&self->_tokenNotificationURL, 0);
  objc_storeStrong((id *)&self->_paymentDescription, 0);
  objc_storeStrong((id *)&self->_managementURL, 0);
  objc_storeStrong((id *)&self->_billingAgreement, 0);
  objc_storeStrong((id *)&self->_automaticPaymentBilling, 0);
}

@end
