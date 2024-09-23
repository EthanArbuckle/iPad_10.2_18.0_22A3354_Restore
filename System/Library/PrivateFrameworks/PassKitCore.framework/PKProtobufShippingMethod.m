@implementation PKProtobufShippingMethod

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

- (BOOL)hasLabel
{
  return self->_label != 0;
}

- (void)setType:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (BOOL)hasDetail
{
  return self->_detail != 0;
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
  v8.super_class = (Class)PKProtobufShippingMethod;
  -[PKProtobufShippingMethod description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufShippingMethod dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *label;
  void *v6;
  NSString *identifier;
  NSString *detail;
  PKProtobufCustomPrecisionAmount *customPrecisionAmount;
  void *v10;
  PKProtobufNSDecimalNumber *decimalAmount;
  void *v12;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_amount);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("amount"));

  }
  label = self->_label;
  if (label)
    objc_msgSend(v3, "setObject:forKey:", label, CFSTR("label"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_type);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("type"));

  }
  identifier = self->_identifier;
  if (identifier)
    objc_msgSend(v3, "setObject:forKey:", identifier, CFSTR("identifier"));
  detail = self->_detail;
  if (detail)
    objc_msgSend(v3, "setObject:forKey:", detail, CFSTR("detail"));
  customPrecisionAmount = self->_customPrecisionAmount;
  if (customPrecisionAmount)
  {
    -[PKProtobufCustomPrecisionAmount dictionaryRepresentation](customPrecisionAmount, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("custom_precision_amount"));

  }
  decimalAmount = self->_decimalAmount;
  if (decimalAmount)
  {
    -[PKProtobufNSDecimalNumber dictionaryRepresentation](decimalAmount, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("decimal_amount"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PKProtobufShippingMethodReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteSint64Field();
    v4 = v5;
  }
  if (self->_label)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v5;
  }
  if (self->_identifier)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_detail)
  {
    PBDataWriterWriteStringField();
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
  _QWORD *v4;
  _QWORD *v5;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[1] = self->_amount;
    *((_BYTE *)v4 + 60) |= 1u;
  }
  v5 = v4;
  if (self->_label)
  {
    objc_msgSend(v4, "setLabel:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v4 + 14) = self->_type;
    *((_BYTE *)v4 + 60) |= 2u;
  }
  if (self->_identifier)
  {
    objc_msgSend(v5, "setIdentifier:");
    v4 = v5;
  }
  if (self->_detail)
  {
    objc_msgSend(v5, "setDetail:");
    v4 = v5;
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
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_amount;
    *(_BYTE *)(v5 + 60) |= 1u;
  }
  v7 = -[NSString copyWithZone:](self->_label, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 48);
  *(_QWORD *)(v6 + 48) = v7;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v6 + 56) = self->_type;
    *(_BYTE *)(v6 + 60) |= 2u;
  }
  v9 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v10 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v9;

  v11 = -[NSString copyWithZone:](self->_detail, "copyWithZone:", a3);
  v12 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v11;

  v13 = -[PKProtobufCustomPrecisionAmount copyWithZone:](self->_customPrecisionAmount, "copyWithZone:", a3);
  v14 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = v13;

  v15 = -[PKProtobufNSDecimalNumber copyWithZone:](self->_decimalAmount, "copyWithZone:", a3);
  v16 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v15;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char has;
  char v6;
  NSString *label;
  NSString *identifier;
  NSString *detail;
  PKProtobufCustomPrecisionAmount *customPrecisionAmount;
  PKProtobufNSDecimalNumber *decimalAmount;
  char v12;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_23;
  has = (char)self->_has;
  v6 = *((_BYTE *)v4 + 60);
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 1) == 0 || self->_amount != *((_QWORD *)v4 + 1))
      goto LABEL_23;
  }
  else if ((*((_BYTE *)v4 + 60) & 1) != 0)
  {
    goto LABEL_23;
  }
  label = self->_label;
  if ((unint64_t)label | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](label, "isEqual:"))
    {
LABEL_23:
      v12 = 0;
      goto LABEL_24;
    }
    has = (char)self->_has;
    v6 = *((_BYTE *)v4 + 60);
  }
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_type != *((_DWORD *)v4 + 14))
      goto LABEL_23;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_23;
  }
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((_QWORD *)v4 + 5) && !-[NSString isEqual:](identifier, "isEqual:"))
    goto LABEL_23;
  detail = self->_detail;
  if ((unint64_t)detail | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](detail, "isEqual:"))
      goto LABEL_23;
  }
  customPrecisionAmount = self->_customPrecisionAmount;
  if ((unint64_t)customPrecisionAmount | *((_QWORD *)v4 + 2))
  {
    if (!-[PKProtobufCustomPrecisionAmount isEqual:](customPrecisionAmount, "isEqual:"))
      goto LABEL_23;
  }
  decimalAmount = self->_decimalAmount;
  if ((unint64_t)decimalAmount | *((_QWORD *)v4 + 3))
    v12 = -[PKProtobufNSDecimalNumber isEqual:](decimalAmount, "isEqual:");
  else
    v12 = 1;
LABEL_24:

  return v12;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  uint64_t v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  unint64_t v9;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_amount;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_label, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v5 = 2654435761 * self->_type;
  else
    v5 = 0;
  v6 = v4 ^ v3 ^ v5;
  v7 = -[NSString hash](self->_identifier, "hash");
  v8 = v6 ^ v7 ^ -[NSString hash](self->_detail, "hash");
  v9 = -[PKProtobufCustomPrecisionAmount hash](self->_customPrecisionAmount, "hash");
  return v8 ^ v9 ^ -[PKProtobufNSDecimalNumber hash](self->_decimalAmount, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  _DWORD *v5;
  PKProtobufCustomPrecisionAmount *customPrecisionAmount;
  uint64_t v7;
  PKProtobufNSDecimalNumber *decimalAmount;
  uint64_t v9;
  _QWORD *v10;

  v4 = a3;
  v5 = v4;
  if ((*((_BYTE *)v4 + 60) & 1) != 0)
  {
    self->_amount = v4[1];
    *(_BYTE *)&self->_has |= 1u;
  }
  v10 = v4;
  if (v4[6])
  {
    -[PKProtobufShippingMethod setLabel:](self, "setLabel:");
    v5 = v10;
  }
  if ((v5[15] & 2) != 0)
  {
    self->_type = v5[14];
    *(_BYTE *)&self->_has |= 2u;
  }
  if (*((_QWORD *)v5 + 5))
  {
    -[PKProtobufShippingMethod setIdentifier:](self, "setIdentifier:");
    v5 = v10;
  }
  if (*((_QWORD *)v5 + 4))
  {
    -[PKProtobufShippingMethod setDetail:](self, "setDetail:");
    v5 = v10;
  }
  customPrecisionAmount = self->_customPrecisionAmount;
  v7 = *((_QWORD *)v5 + 2);
  if (customPrecisionAmount)
  {
    if (!v7)
      goto LABEL_17;
    -[PKProtobufCustomPrecisionAmount mergeFrom:](customPrecisionAmount, "mergeFrom:");
  }
  else
  {
    if (!v7)
      goto LABEL_17;
    -[PKProtobufShippingMethod setCustomPrecisionAmount:](self, "setCustomPrecisionAmount:");
  }
  v5 = v10;
LABEL_17:
  decimalAmount = self->_decimalAmount;
  v9 = *((_QWORD *)v5 + 3);
  if (decimalAmount)
  {
    if (v9)
    {
      -[PKProtobufNSDecimalNumber mergeFrom:](decimalAmount, "mergeFrom:");
LABEL_22:
      v5 = v10;
    }
  }
  else if (v9)
  {
    -[PKProtobufShippingMethod setDecimalAmount:](self, "setDecimalAmount:");
    goto LABEL_22;
  }

}

- (int64_t)amount
{
  return self->_amount;
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (unsigned)type
{
  return self->_type;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSString)detail
{
  return self->_detail;
}

- (void)setDetail:(id)a3
{
  objc_storeStrong((id *)&self->_detail, a3);
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
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_detail, 0);
  objc_storeStrong((id *)&self->_decimalAmount, 0);
  objc_storeStrong((id *)&self->_customPrecisionAmount, 0);
}

@end
