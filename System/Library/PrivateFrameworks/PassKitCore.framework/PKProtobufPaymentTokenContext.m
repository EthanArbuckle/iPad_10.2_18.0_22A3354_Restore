@implementation PKProtobufPaymentTokenContext

- (BOOL)hasMerchantIdentifier
{
  return self->_merchantIdentifier != 0;
}

- (BOOL)hasExternalIdentifier
{
  return self->_externalIdentifier != 0;
}

- (BOOL)hasMerchantName
{
  return self->_merchantName != 0;
}

- (BOOL)hasMerchantDomain
{
  return self->_merchantDomain != 0;
}

- (void)setAmount:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_amount = a3;
}

- (void)setHasAmount:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAmount
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasCustomPrecisionAmount
{
  return self->_customPrecisionAmount != 0;
}

- (BOOL)hasDecimalAmount
{
  return self->_decimalAmount != 0;
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
  v8.super_class = (Class)PKProtobufPaymentTokenContext;
  -[PKProtobufPaymentTokenContext description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufPaymentTokenContext dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *merchantIdentifier;
  NSString *externalIdentifier;
  NSString *merchantName;
  NSString *merchantDomain;
  void *v9;
  PKProtobufCustomPrecisionAmount *customPrecisionAmount;
  void *v11;
  PKProtobufNSDecimalNumber *decimalAmount;
  void *v13;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  merchantIdentifier = self->_merchantIdentifier;
  if (merchantIdentifier)
    objc_msgSend(v3, "setObject:forKey:", merchantIdentifier, CFSTR("merchantIdentifier"));
  externalIdentifier = self->_externalIdentifier;
  if (externalIdentifier)
    objc_msgSend(v4, "setObject:forKey:", externalIdentifier, CFSTR("externalIdentifier"));
  merchantName = self->_merchantName;
  if (merchantName)
    objc_msgSend(v4, "setObject:forKey:", merchantName, CFSTR("merchantName"));
  merchantDomain = self->_merchantDomain;
  if (merchantDomain)
    objc_msgSend(v4, "setObject:forKey:", merchantDomain, CFSTR("merchantDomain"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_amount);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("amount"));

  }
  customPrecisionAmount = self->_customPrecisionAmount;
  if (customPrecisionAmount)
  {
    -[PKProtobufCustomPrecisionAmount dictionaryRepresentation](customPrecisionAmount, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("custom_precision_amount"));

  }
  decimalAmount = self->_decimalAmount;
  if (decimalAmount)
  {
    -[PKProtobufNSDecimalNumber dictionaryRepresentation](decimalAmount, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("decimal_amount"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return PKProtobufPaymentTokenContextReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_merchantIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_externalIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_merchantName)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_merchantDomain)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteSint64Field();
    v4 = v5;
  }
  if (self->_customPrecisionAmount)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_decimalAmount)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_merchantIdentifier)
  {
    objc_msgSend(v4, "setMerchantIdentifier:");
    v4 = v5;
  }
  if (self->_externalIdentifier)
  {
    objc_msgSend(v5, "setExternalIdentifier:");
    v4 = v5;
  }
  if (self->_merchantName)
  {
    objc_msgSend(v5, "setMerchantName:");
    v4 = v5;
  }
  if (self->_merchantDomain)
  {
    objc_msgSend(v5, "setMerchantDomain:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = self->_amount;
    *((_BYTE *)v4 + 64) |= 1u;
  }
  if (self->_customPrecisionAmount)
  {
    objc_msgSend(v5, "setCustomPrecisionAmount:");
    v4 = v5;
  }
  if (self->_decimalAmount)
  {
    objc_msgSend(v5, "setDecimalAmount:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_merchantIdentifier, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v6;

  v8 = -[NSString copyWithZone:](self->_externalIdentifier, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v8;

  v10 = -[NSString copyWithZone:](self->_merchantName, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v10;

  v12 = -[NSString copyWithZone:](self->_merchantDomain, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v12;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_amount;
    *(_BYTE *)(v5 + 64) |= 1u;
  }
  v14 = -[PKProtobufCustomPrecisionAmount copyWithZone:](self->_customPrecisionAmount, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v14;

  v16 = -[PKProtobufNSDecimalNumber copyWithZone:](self->_decimalAmount, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v16;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *merchantIdentifier;
  NSString *externalIdentifier;
  NSString *merchantName;
  NSString *merchantDomain;
  PKProtobufCustomPrecisionAmount *customPrecisionAmount;
  PKProtobufNSDecimalNumber *decimalAmount;
  char v11;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_19;
  merchantIdentifier = self->_merchantIdentifier;
  if ((unint64_t)merchantIdentifier | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](merchantIdentifier, "isEqual:"))
      goto LABEL_19;
  }
  externalIdentifier = self->_externalIdentifier;
  if ((unint64_t)externalIdentifier | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](externalIdentifier, "isEqual:"))
      goto LABEL_19;
  }
  merchantName = self->_merchantName;
  if ((unint64_t)merchantName | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](merchantName, "isEqual:"))
      goto LABEL_19;
  }
  merchantDomain = self->_merchantDomain;
  if ((unint64_t)merchantDomain | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](merchantDomain, "isEqual:"))
      goto LABEL_19;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 1) == 0 || self->_amount != *((_QWORD *)v4 + 1))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 64) & 1) != 0)
  {
LABEL_19:
    v11 = 0;
    goto LABEL_20;
  }
  customPrecisionAmount = self->_customPrecisionAmount;
  if ((unint64_t)customPrecisionAmount | *((_QWORD *)v4 + 2)
    && !-[PKProtobufCustomPrecisionAmount isEqual:](customPrecisionAmount, "isEqual:"))
  {
    goto LABEL_19;
  }
  decimalAmount = self->_decimalAmount;
  if ((unint64_t)decimalAmount | *((_QWORD *)v4 + 3))
    v11 = -[PKProtobufNSDecimalNumber isEqual:](decimalAmount, "isEqual:");
  else
    v11 = 1;
LABEL_20:

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  uint64_t v7;
  NSUInteger v8;
  unint64_t v9;

  v3 = -[NSString hash](self->_merchantIdentifier, "hash");
  v4 = -[NSString hash](self->_externalIdentifier, "hash");
  v5 = -[NSString hash](self->_merchantName, "hash");
  v6 = -[NSString hash](self->_merchantDomain, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v7 = 2654435761 * self->_amount;
  else
    v7 = 0;
  v8 = v4 ^ v3 ^ v5 ^ v6;
  v9 = v7 ^ -[PKProtobufCustomPrecisionAmount hash](self->_customPrecisionAmount, "hash");
  return v8 ^ v9 ^ -[PKProtobufNSDecimalNumber hash](self->_decimalAmount, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  PKProtobufCustomPrecisionAmount *customPrecisionAmount;
  uint64_t v6;
  PKProtobufNSDecimalNumber *decimalAmount;
  uint64_t v8;
  _QWORD *v9;

  v4 = a3;
  v9 = v4;
  if (v4[6])
  {
    -[PKProtobufPaymentTokenContext setMerchantIdentifier:](self, "setMerchantIdentifier:");
    v4 = v9;
  }
  if (v4[4])
  {
    -[PKProtobufPaymentTokenContext setExternalIdentifier:](self, "setExternalIdentifier:");
    v4 = v9;
  }
  if (v4[7])
  {
    -[PKProtobufPaymentTokenContext setMerchantName:](self, "setMerchantName:");
    v4 = v9;
  }
  if (v4[5])
  {
    -[PKProtobufPaymentTokenContext setMerchantDomain:](self, "setMerchantDomain:");
    v4 = v9;
  }
  if ((v4[8] & 1) != 0)
  {
    self->_amount = v4[1];
    *(_BYTE *)&self->_has |= 1u;
  }
  customPrecisionAmount = self->_customPrecisionAmount;
  v6 = v4[2];
  if (customPrecisionAmount)
  {
    if (!v6)
      goto LABEL_17;
    -[PKProtobufCustomPrecisionAmount mergeFrom:](customPrecisionAmount, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_17;
    -[PKProtobufPaymentTokenContext setCustomPrecisionAmount:](self, "setCustomPrecisionAmount:");
  }
  v4 = v9;
LABEL_17:
  decimalAmount = self->_decimalAmount;
  v8 = v4[3];
  if (decimalAmount)
  {
    if (v8)
    {
      -[PKProtobufNSDecimalNumber mergeFrom:](decimalAmount, "mergeFrom:");
LABEL_22:
      v4 = v9;
    }
  }
  else if (v8)
  {
    -[PKProtobufPaymentTokenContext setDecimalAmount:](self, "setDecimalAmount:");
    goto LABEL_22;
  }

}

- (NSString)merchantIdentifier
{
  return self->_merchantIdentifier;
}

- (void)setMerchantIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_merchantIdentifier, a3);
}

- (NSString)externalIdentifier
{
  return self->_externalIdentifier;
}

- (void)setExternalIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_externalIdentifier, a3);
}

- (NSString)merchantName
{
  return self->_merchantName;
}

- (void)setMerchantName:(id)a3
{
  objc_storeStrong((id *)&self->_merchantName, a3);
}

- (NSString)merchantDomain
{
  return self->_merchantDomain;
}

- (void)setMerchantDomain:(id)a3
{
  objc_storeStrong((id *)&self->_merchantDomain, a3);
}

- (int64_t)amount
{
  return self->_amount;
}

- (PKProtobufCustomPrecisionAmount)customPrecisionAmount
{
  return self->_customPrecisionAmount;
}

- (void)setCustomPrecisionAmount:(id)a3
{
  objc_storeStrong((id *)&self->_customPrecisionAmount, a3);
}

- (PKProtobufNSDecimalNumber)decimalAmount
{
  return self->_decimalAmount;
}

- (void)setDecimalAmount:(id)a3
{
  objc_storeStrong((id *)&self->_decimalAmount, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_merchantName, 0);
  objc_storeStrong((id *)&self->_merchantIdentifier, 0);
  objc_storeStrong((id *)&self->_merchantDomain, 0);
  objc_storeStrong((id *)&self->_externalIdentifier, 0);
  objc_storeStrong((id *)&self->_decimalAmount, 0);
  objc_storeStrong((id *)&self->_customPrecisionAmount, 0);
}

@end
