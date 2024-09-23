@implementation PKProtobufDeferredPaymentRequest

- (BOOL)hasPaymentDescription
{
  return self->_paymentDescription != 0;
}

- (BOOL)hasDeferredBilling
{
  return self->_deferredBilling != 0;
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

- (void)setFreeCancellationDate:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_freeCancellationDate = a3;
}

- (void)setHasFreeCancellationDate:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasFreeCancellationDate
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasFreeCancellationDateTimeZone
{
  return self->_freeCancellationDateTimeZone != 0;
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
  v8.super_class = (Class)PKProtobufDeferredPaymentRequest;
  -[PKProtobufDeferredPaymentRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufDeferredPaymentRequest dictionaryRepresentation](self, "dictionaryRepresentation");
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
  PKProtobufPaymentSummaryItem *deferredBilling;
  void *v7;
  NSString *billingAgreement;
  NSString *managementURL;
  NSString *tokenNotificationURL;
  void *v11;
  NSString *freeCancellationDateTimeZone;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  paymentDescription = self->_paymentDescription;
  if (paymentDescription)
    objc_msgSend(v3, "setObject:forKey:", paymentDescription, CFSTR("paymentDescription"));
  deferredBilling = self->_deferredBilling;
  if (deferredBilling)
  {
    -[PKProtobufPaymentSummaryItem dictionaryRepresentation](deferredBilling, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("deferredBilling"));

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
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_freeCancellationDate);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("freeCancellationDate"));

  }
  freeCancellationDateTimeZone = self->_freeCancellationDateTimeZone;
  if (freeCancellationDateTimeZone)
    objc_msgSend(v4, "setObject:forKey:", freeCancellationDateTimeZone, CFSTR("freeCancellationDateTimeZone"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return PKProtobufDeferredPaymentRequestReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_deferredBilling)
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
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_freeCancellationDateTimeZone)
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
  if (self->_deferredBilling)
  {
    objc_msgSend(v5, "setDeferredBilling:");
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
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_freeCancellationDate;
    *((_BYTE *)v4 + 64) |= 1u;
  }
  if (self->_freeCancellationDateTimeZone)
  {
    objc_msgSend(v5, "setFreeCancellationDateTimeZone:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
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

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_paymentDescription, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v6;

  v8 = -[PKProtobufPaymentSummaryItem copyWithZone:](self->_deferredBilling, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  v10 = -[NSString copyWithZone:](self->_billingAgreement, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v10;

  v12 = -[NSString copyWithZone:](self->_managementURL, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v12;

  v14 = -[NSString copyWithZone:](self->_tokenNotificationURL, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v14;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_freeCancellationDate;
    *(_BYTE *)(v5 + 64) |= 1u;
  }
  v16 = -[NSString copyWithZone:](self->_freeCancellationDateTimeZone, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v16;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *paymentDescription;
  PKProtobufPaymentSummaryItem *deferredBilling;
  NSString *billingAgreement;
  NSString *managementURL;
  NSString *tokenNotificationURL;
  NSString *freeCancellationDateTimeZone;
  char v11;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_19;
  paymentDescription = self->_paymentDescription;
  if ((unint64_t)paymentDescription | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](paymentDescription, "isEqual:"))
      goto LABEL_19;
  }
  deferredBilling = self->_deferredBilling;
  if ((unint64_t)deferredBilling | *((_QWORD *)v4 + 3))
  {
    if (!-[PKProtobufPaymentSummaryItem isEqual:](deferredBilling, "isEqual:"))
      goto LABEL_19;
  }
  billingAgreement = self->_billingAgreement;
  if ((unint64_t)billingAgreement | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](billingAgreement, "isEqual:"))
      goto LABEL_19;
  }
  managementURL = self->_managementURL;
  if ((unint64_t)managementURL | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](managementURL, "isEqual:"))
      goto LABEL_19;
  }
  tokenNotificationURL = self->_tokenNotificationURL;
  if ((unint64_t)tokenNotificationURL | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](tokenNotificationURL, "isEqual:"))
      goto LABEL_19;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 1) == 0 || self->_freeCancellationDate != *((double *)v4 + 1))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 64) & 1) != 0)
  {
LABEL_19:
    v11 = 0;
    goto LABEL_20;
  }
  freeCancellationDateTimeZone = self->_freeCancellationDateTimeZone;
  if ((unint64_t)freeCancellationDateTimeZone | *((_QWORD *)v4 + 4))
    v11 = -[NSString isEqual:](freeCancellationDateTimeZone, "isEqual:");
  else
    v11 = 1;
LABEL_20:

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  unint64_t v8;
  double freeCancellationDate;
  double v10;
  long double v11;
  double v12;

  v3 = -[NSString hash](self->_paymentDescription, "hash");
  v4 = -[PKProtobufPaymentSummaryItem hash](self->_deferredBilling, "hash");
  v5 = -[NSString hash](self->_billingAgreement, "hash");
  v6 = -[NSString hash](self->_managementURL, "hash");
  v7 = -[NSString hash](self->_tokenNotificationURL, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    freeCancellationDate = self->_freeCancellationDate;
    v10 = -freeCancellationDate;
    if (freeCancellationDate >= 0.0)
      v10 = self->_freeCancellationDate;
    v11 = floor(v10 + 0.5);
    v12 = (v10 - v11) * 1.84467441e19;
    v8 = 2654435761u * (unint64_t)fmod(v11, 1.84467441e19);
    if (v12 >= 0.0)
    {
      if (v12 > 0.0)
        v8 += (unint64_t)v12;
    }
    else
    {
      v8 -= (unint64_t)fabs(v12);
    }
  }
  else
  {
    v8 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ -[NSString hash](self->_freeCancellationDateTimeZone, "hash");
}

- (void)mergeFrom:(id)a3
{
  double *v4;
  PKProtobufPaymentSummaryItem *deferredBilling;
  uint64_t v6;
  double *v7;

  v4 = (double *)a3;
  v7 = v4;
  if (*((_QWORD *)v4 + 6))
  {
    -[PKProtobufDeferredPaymentRequest setPaymentDescription:](self, "setPaymentDescription:");
    v4 = v7;
  }
  deferredBilling = self->_deferredBilling;
  v6 = *((_QWORD *)v4 + 3);
  if (deferredBilling)
  {
    if (!v6)
      goto LABEL_9;
    -[PKProtobufPaymentSummaryItem mergeFrom:](deferredBilling, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_9;
    -[PKProtobufDeferredPaymentRequest setDeferredBilling:](self, "setDeferredBilling:");
  }
  v4 = v7;
LABEL_9:
  if (*((_QWORD *)v4 + 2))
  {
    -[PKProtobufDeferredPaymentRequest setBillingAgreement:](self, "setBillingAgreement:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 5))
  {
    -[PKProtobufDeferredPaymentRequest setManagementURL:](self, "setManagementURL:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 7))
  {
    -[PKProtobufDeferredPaymentRequest setTokenNotificationURL:](self, "setTokenNotificationURL:");
    v4 = v7;
  }
  if (((_BYTE)v4[8] & 1) != 0)
  {
    self->_freeCancellationDate = v4[1];
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[PKProtobufDeferredPaymentRequest setFreeCancellationDateTimeZone:](self, "setFreeCancellationDateTimeZone:");
    v4 = v7;
  }

}

- (NSString)paymentDescription
{
  return self->_paymentDescription;
}

- (void)setPaymentDescription:(id)a3
{
  objc_storeStrong((id *)&self->_paymentDescription, a3);
}

- (PKProtobufPaymentSummaryItem)deferredBilling
{
  return self->_deferredBilling;
}

- (void)setDeferredBilling:(id)a3
{
  objc_storeStrong((id *)&self->_deferredBilling, a3);
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

- (double)freeCancellationDate
{
  return self->_freeCancellationDate;
}

- (NSString)freeCancellationDateTimeZone
{
  return self->_freeCancellationDateTimeZone;
}

- (void)setFreeCancellationDateTimeZone:(id)a3
{
  objc_storeStrong((id *)&self->_freeCancellationDateTimeZone, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenNotificationURL, 0);
  objc_storeStrong((id *)&self->_paymentDescription, 0);
  objc_storeStrong((id *)&self->_managementURL, 0);
  objc_storeStrong((id *)&self->_freeCancellationDateTimeZone, 0);
  objc_storeStrong((id *)&self->_deferredBilling, 0);
  objc_storeStrong((id *)&self->_billingAgreement, 0);
}

@end
