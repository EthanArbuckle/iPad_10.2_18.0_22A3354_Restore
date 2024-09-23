@implementation PKProtobufPaymentSummaryItem

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

- (BOOL)hasRecurringPaymentSummaryItem
{
  return self->_recurringPaymentSummaryItem != 0;
}

- (BOOL)hasDeferredPaymentSummaryItem
{
  return self->_deferredPaymentSummaryItem != 0;
}

- (BOOL)hasCustomPrecisionAmount
{
  return self->_customPrecisionAmount != 0;
}

- (BOOL)hasDecimalAmount
{
  return self->_decimalAmount != 0;
}

- (BOOL)hasShippingMethodSummaryItem
{
  return self->_shippingMethodSummaryItem != 0;
}

- (BOOL)hasAutomaticReloadPaymentSummaryItem
{
  return self->_automaticReloadPaymentSummaryItem != 0;
}

- (BOOL)hasDisbursementSummaryItem
{
  return self->_disbursementSummaryItem != 0;
}

- (BOOL)hasInstantFundsOutFeeSummaryItem
{
  return self->_instantFundsOutFeeSummaryItem != 0;
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
  v8.super_class = (Class)PKProtobufPaymentSummaryItem;
  -[PKProtobufPaymentSummaryItem description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufPaymentSummaryItem dictionaryRepresentation](self, "dictionaryRepresentation");
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
  PKProtobufRecurringPaymentSummaryItem *recurringPaymentSummaryItem;
  void *v8;
  PKProtobufDeferredPaymentSummaryItem *deferredPaymentSummaryItem;
  void *v10;
  PKProtobufCustomPrecisionAmount *customPrecisionAmount;
  void *v12;
  PKProtobufNSDecimalNumber *decimalAmount;
  void *v14;
  PKProtobufShippingMethod *shippingMethodSummaryItem;
  void *v16;
  PKProtobufAutomaticReloadPaymentSummaryItem *automaticReloadPaymentSummaryItem;
  void *v18;
  PKProtobufDisbursementSummaryItem *disbursementSummaryItem;
  void *v20;
  PKProtobufInstantFundsOutFeeSummaryItem *instantFundsOutFeeSummaryItem;
  void *v22;

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
  recurringPaymentSummaryItem = self->_recurringPaymentSummaryItem;
  if (recurringPaymentSummaryItem)
  {
    -[PKProtobufRecurringPaymentSummaryItem dictionaryRepresentation](recurringPaymentSummaryItem, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("recurringPaymentSummaryItem"));

  }
  deferredPaymentSummaryItem = self->_deferredPaymentSummaryItem;
  if (deferredPaymentSummaryItem)
  {
    -[PKProtobufDeferredPaymentSummaryItem dictionaryRepresentation](deferredPaymentSummaryItem, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("deferredPaymentSummaryItem"));

  }
  customPrecisionAmount = self->_customPrecisionAmount;
  if (customPrecisionAmount)
  {
    -[PKProtobufCustomPrecisionAmount dictionaryRepresentation](customPrecisionAmount, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("custom_precision_amount"));

  }
  decimalAmount = self->_decimalAmount;
  if (decimalAmount)
  {
    -[PKProtobufNSDecimalNumber dictionaryRepresentation](decimalAmount, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("decimal_amount"));

  }
  shippingMethodSummaryItem = self->_shippingMethodSummaryItem;
  if (shippingMethodSummaryItem)
  {
    -[PKProtobufShippingMethod dictionaryRepresentation](shippingMethodSummaryItem, "dictionaryRepresentation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("shippingMethodSummaryItem"));

  }
  automaticReloadPaymentSummaryItem = self->_automaticReloadPaymentSummaryItem;
  if (automaticReloadPaymentSummaryItem)
  {
    -[PKProtobufAutomaticReloadPaymentSummaryItem dictionaryRepresentation](automaticReloadPaymentSummaryItem, "dictionaryRepresentation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("automaticReloadPaymentSummaryItem"));

  }
  disbursementSummaryItem = self->_disbursementSummaryItem;
  if (disbursementSummaryItem)
  {
    -[PKProtobufDisbursementSummaryItem dictionaryRepresentation](disbursementSummaryItem, "dictionaryRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("disbursementSummaryItem"));

  }
  instantFundsOutFeeSummaryItem = self->_instantFundsOutFeeSummaryItem;
  if (instantFundsOutFeeSummaryItem)
  {
    -[PKProtobufInstantFundsOutFeeSummaryItem dictionaryRepresentation](instantFundsOutFeeSummaryItem, "dictionaryRepresentation");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("instantFundsOutFeeSummaryItem"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PKProtobufPaymentSummaryItemReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_recurringPaymentSummaryItem)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_deferredPaymentSummaryItem)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_customPrecisionAmount)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_shippingMethodSummaryItem)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_automaticReloadPaymentSummaryItem)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_decimalAmount)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_disbursementSummaryItem)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_instantFundsOutFeeSummaryItem)
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
    *((_BYTE *)v4 + 92) |= 1u;
  }
  v5 = v4;
  if (self->_label)
  {
    objc_msgSend(v4, "setLabel:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v4 + 22) = self->_type;
    *((_BYTE *)v4 + 92) |= 2u;
  }
  if (self->_recurringPaymentSummaryItem)
  {
    objc_msgSend(v5, "setRecurringPaymentSummaryItem:");
    v4 = v5;
  }
  if (self->_deferredPaymentSummaryItem)
  {
    objc_msgSend(v5, "setDeferredPaymentSummaryItem:");
    v4 = v5;
  }
  if (self->_customPrecisionAmount)
  {
    objc_msgSend(v5, "setCustomPrecisionAmount:");
    v4 = v5;
  }
  if (self->_shippingMethodSummaryItem)
  {
    objc_msgSend(v5, "setShippingMethodSummaryItem:");
    v4 = v5;
  }
  if (self->_automaticReloadPaymentSummaryItem)
  {
    objc_msgSend(v5, "setAutomaticReloadPaymentSummaryItem:");
    v4 = v5;
  }
  if (self->_decimalAmount)
  {
    objc_msgSend(v5, "setDecimalAmount:");
    v4 = v5;
  }
  if (self->_disbursementSummaryItem)
  {
    objc_msgSend(v5, "setDisbursementSummaryItem:");
    v4 = v5;
  }
  if (self->_instantFundsOutFeeSummaryItem)
  {
    objc_msgSend(v5, "setInstantFundsOutFeeSummaryItem:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_amount;
    *(_BYTE *)(v5 + 92) |= 1u;
  }
  v7 = -[NSString copyWithZone:](self->_label, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 64);
  *(_QWORD *)(v6 + 64) = v7;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v6 + 88) = self->_type;
    *(_BYTE *)(v6 + 92) |= 2u;
  }
  v9 = -[PKProtobufRecurringPaymentSummaryItem copyWithZone:](self->_recurringPaymentSummaryItem, "copyWithZone:", a3);
  v10 = *(void **)(v6 + 72);
  *(_QWORD *)(v6 + 72) = v9;

  v11 = -[PKProtobufDeferredPaymentSummaryItem copyWithZone:](self->_deferredPaymentSummaryItem, "copyWithZone:", a3);
  v12 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v11;

  v13 = -[PKProtobufCustomPrecisionAmount copyWithZone:](self->_customPrecisionAmount, "copyWithZone:", a3);
  v14 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v13;

  v15 = -[PKProtobufShippingMethod copyWithZone:](self->_shippingMethodSummaryItem, "copyWithZone:", a3);
  v16 = *(void **)(v6 + 80);
  *(_QWORD *)(v6 + 80) = v15;

  v17 = -[PKProtobufAutomaticReloadPaymentSummaryItem copyWithZone:](self->_automaticReloadPaymentSummaryItem, "copyWithZone:", a3);
  v18 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = v17;

  v19 = -[PKProtobufNSDecimalNumber copyWithZone:](self->_decimalAmount, "copyWithZone:", a3);
  v20 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v19;

  v21 = -[PKProtobufDisbursementSummaryItem copyWithZone:](self->_disbursementSummaryItem, "copyWithZone:", a3);
  v22 = *(void **)(v6 + 48);
  *(_QWORD *)(v6 + 48) = v21;

  v23 = -[PKProtobufInstantFundsOutFeeSummaryItem copyWithZone:](self->_instantFundsOutFeeSummaryItem, "copyWithZone:", a3);
  v24 = *(void **)(v6 + 56);
  *(_QWORD *)(v6 + 56) = v23;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char has;
  char v6;
  NSString *label;
  PKProtobufRecurringPaymentSummaryItem *recurringPaymentSummaryItem;
  PKProtobufDeferredPaymentSummaryItem *deferredPaymentSummaryItem;
  PKProtobufCustomPrecisionAmount *customPrecisionAmount;
  PKProtobufShippingMethod *shippingMethodSummaryItem;
  PKProtobufAutomaticReloadPaymentSummaryItem *automaticReloadPaymentSummaryItem;
  PKProtobufNSDecimalNumber *decimalAmount;
  PKProtobufDisbursementSummaryItem *disbursementSummaryItem;
  PKProtobufInstantFundsOutFeeSummaryItem *instantFundsOutFeeSummaryItem;
  char v16;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_31;
  has = (char)self->_has;
  v6 = *((_BYTE *)v4 + 92);
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 92) & 1) == 0 || self->_amount != *((_QWORD *)v4 + 1))
      goto LABEL_31;
  }
  else if ((*((_BYTE *)v4 + 92) & 1) != 0)
  {
    goto LABEL_31;
  }
  label = self->_label;
  if ((unint64_t)label | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](label, "isEqual:"))
    {
LABEL_31:
      v16 = 0;
      goto LABEL_32;
    }
    has = (char)self->_has;
    v6 = *((_BYTE *)v4 + 92);
  }
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_type != *((_DWORD *)v4 + 22))
      goto LABEL_31;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_31;
  }
  recurringPaymentSummaryItem = self->_recurringPaymentSummaryItem;
  if ((unint64_t)recurringPaymentSummaryItem | *((_QWORD *)v4 + 9)
    && !-[PKProtobufRecurringPaymentSummaryItem isEqual:](recurringPaymentSummaryItem, "isEqual:"))
  {
    goto LABEL_31;
  }
  deferredPaymentSummaryItem = self->_deferredPaymentSummaryItem;
  if ((unint64_t)deferredPaymentSummaryItem | *((_QWORD *)v4 + 5))
  {
    if (!-[PKProtobufDeferredPaymentSummaryItem isEqual:](deferredPaymentSummaryItem, "isEqual:"))
      goto LABEL_31;
  }
  customPrecisionAmount = self->_customPrecisionAmount;
  if ((unint64_t)customPrecisionAmount | *((_QWORD *)v4 + 3))
  {
    if (!-[PKProtobufCustomPrecisionAmount isEqual:](customPrecisionAmount, "isEqual:"))
      goto LABEL_31;
  }
  shippingMethodSummaryItem = self->_shippingMethodSummaryItem;
  if ((unint64_t)shippingMethodSummaryItem | *((_QWORD *)v4 + 10))
  {
    if (!-[PKProtobufShippingMethod isEqual:](shippingMethodSummaryItem, "isEqual:"))
      goto LABEL_31;
  }
  automaticReloadPaymentSummaryItem = self->_automaticReloadPaymentSummaryItem;
  if ((unint64_t)automaticReloadPaymentSummaryItem | *((_QWORD *)v4 + 2))
  {
    if (!-[PKProtobufAutomaticReloadPaymentSummaryItem isEqual:](automaticReloadPaymentSummaryItem, "isEqual:"))
      goto LABEL_31;
  }
  decimalAmount = self->_decimalAmount;
  if ((unint64_t)decimalAmount | *((_QWORD *)v4 + 4))
  {
    if (!-[PKProtobufNSDecimalNumber isEqual:](decimalAmount, "isEqual:"))
      goto LABEL_31;
  }
  disbursementSummaryItem = self->_disbursementSummaryItem;
  if ((unint64_t)disbursementSummaryItem | *((_QWORD *)v4 + 6))
  {
    if (!-[PKProtobufDisbursementSummaryItem isEqual:](disbursementSummaryItem, "isEqual:"))
      goto LABEL_31;
  }
  instantFundsOutFeeSummaryItem = self->_instantFundsOutFeeSummaryItem;
  if ((unint64_t)instantFundsOutFeeSummaryItem | *((_QWORD *)v4 + 7))
    v16 = -[PKProtobufInstantFundsOutFeeSummaryItem isEqual:](instantFundsOutFeeSummaryItem, "isEqual:");
  else
    v16 = 1;
LABEL_32:

  return v16;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  uint64_t v5;
  NSUInteger v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;

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
  v7 = -[PKProtobufRecurringPaymentSummaryItem hash](self->_recurringPaymentSummaryItem, "hash");
  v8 = v6 ^ v7 ^ -[PKProtobufDeferredPaymentSummaryItem hash](self->_deferredPaymentSummaryItem, "hash");
  v9 = -[PKProtobufCustomPrecisionAmount hash](self->_customPrecisionAmount, "hash");
  v10 = v9 ^ -[PKProtobufShippingMethod hash](self->_shippingMethodSummaryItem, "hash");
  v11 = v8 ^ v10 ^ -[PKProtobufAutomaticReloadPaymentSummaryItem hash](self->_automaticReloadPaymentSummaryItem, "hash");
  v12 = -[PKProtobufNSDecimalNumber hash](self->_decimalAmount, "hash");
  v13 = v12 ^ -[PKProtobufDisbursementSummaryItem hash](self->_disbursementSummaryItem, "hash");
  return v11 ^ v13 ^ -[PKProtobufInstantFundsOutFeeSummaryItem hash](self->_instantFundsOutFeeSummaryItem, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  _DWORD *v5;
  PKProtobufRecurringPaymentSummaryItem *recurringPaymentSummaryItem;
  uint64_t v7;
  PKProtobufDeferredPaymentSummaryItem *deferredPaymentSummaryItem;
  uint64_t v9;
  PKProtobufCustomPrecisionAmount *customPrecisionAmount;
  uint64_t v11;
  PKProtobufShippingMethod *shippingMethodSummaryItem;
  uint64_t v13;
  PKProtobufAutomaticReloadPaymentSummaryItem *automaticReloadPaymentSummaryItem;
  uint64_t v15;
  PKProtobufNSDecimalNumber *decimalAmount;
  uint64_t v17;
  PKProtobufDisbursementSummaryItem *disbursementSummaryItem;
  uint64_t v19;
  PKProtobufInstantFundsOutFeeSummaryItem *instantFundsOutFeeSummaryItem;
  uint64_t v21;
  _QWORD *v22;

  v4 = a3;
  v5 = v4;
  if ((*((_BYTE *)v4 + 92) & 1) != 0)
  {
    self->_amount = v4[1];
    *(_BYTE *)&self->_has |= 1u;
  }
  v22 = v4;
  if (v4[8])
  {
    -[PKProtobufPaymentSummaryItem setLabel:](self, "setLabel:");
    v5 = v22;
  }
  if ((v5[23] & 2) != 0)
  {
    self->_type = v5[22];
    *(_BYTE *)&self->_has |= 2u;
  }
  recurringPaymentSummaryItem = self->_recurringPaymentSummaryItem;
  v7 = *((_QWORD *)v5 + 9);
  if (recurringPaymentSummaryItem)
  {
    if (!v7)
      goto LABEL_13;
    -[PKProtobufRecurringPaymentSummaryItem mergeFrom:](recurringPaymentSummaryItem, "mergeFrom:");
  }
  else
  {
    if (!v7)
      goto LABEL_13;
    -[PKProtobufPaymentSummaryItem setRecurringPaymentSummaryItem:](self, "setRecurringPaymentSummaryItem:");
  }
  v5 = v22;
LABEL_13:
  deferredPaymentSummaryItem = self->_deferredPaymentSummaryItem;
  v9 = *((_QWORD *)v5 + 5);
  if (deferredPaymentSummaryItem)
  {
    if (!v9)
      goto LABEL_19;
    -[PKProtobufDeferredPaymentSummaryItem mergeFrom:](deferredPaymentSummaryItem, "mergeFrom:");
  }
  else
  {
    if (!v9)
      goto LABEL_19;
    -[PKProtobufPaymentSummaryItem setDeferredPaymentSummaryItem:](self, "setDeferredPaymentSummaryItem:");
  }
  v5 = v22;
LABEL_19:
  customPrecisionAmount = self->_customPrecisionAmount;
  v11 = *((_QWORD *)v5 + 3);
  if (customPrecisionAmount)
  {
    if (!v11)
      goto LABEL_25;
    -[PKProtobufCustomPrecisionAmount mergeFrom:](customPrecisionAmount, "mergeFrom:");
  }
  else
  {
    if (!v11)
      goto LABEL_25;
    -[PKProtobufPaymentSummaryItem setCustomPrecisionAmount:](self, "setCustomPrecisionAmount:");
  }
  v5 = v22;
LABEL_25:
  shippingMethodSummaryItem = self->_shippingMethodSummaryItem;
  v13 = *((_QWORD *)v5 + 10);
  if (shippingMethodSummaryItem)
  {
    if (!v13)
      goto LABEL_31;
    -[PKProtobufShippingMethod mergeFrom:](shippingMethodSummaryItem, "mergeFrom:");
  }
  else
  {
    if (!v13)
      goto LABEL_31;
    -[PKProtobufPaymentSummaryItem setShippingMethodSummaryItem:](self, "setShippingMethodSummaryItem:");
  }
  v5 = v22;
LABEL_31:
  automaticReloadPaymentSummaryItem = self->_automaticReloadPaymentSummaryItem;
  v15 = *((_QWORD *)v5 + 2);
  if (automaticReloadPaymentSummaryItem)
  {
    if (!v15)
      goto LABEL_37;
    -[PKProtobufAutomaticReloadPaymentSummaryItem mergeFrom:](automaticReloadPaymentSummaryItem, "mergeFrom:");
  }
  else
  {
    if (!v15)
      goto LABEL_37;
    -[PKProtobufPaymentSummaryItem setAutomaticReloadPaymentSummaryItem:](self, "setAutomaticReloadPaymentSummaryItem:");
  }
  v5 = v22;
LABEL_37:
  decimalAmount = self->_decimalAmount;
  v17 = *((_QWORD *)v5 + 4);
  if (decimalAmount)
  {
    if (!v17)
      goto LABEL_43;
    -[PKProtobufNSDecimalNumber mergeFrom:](decimalAmount, "mergeFrom:");
  }
  else
  {
    if (!v17)
      goto LABEL_43;
    -[PKProtobufPaymentSummaryItem setDecimalAmount:](self, "setDecimalAmount:");
  }
  v5 = v22;
LABEL_43:
  disbursementSummaryItem = self->_disbursementSummaryItem;
  v19 = *((_QWORD *)v5 + 6);
  if (disbursementSummaryItem)
  {
    if (!v19)
      goto LABEL_49;
    -[PKProtobufDisbursementSummaryItem mergeFrom:](disbursementSummaryItem, "mergeFrom:");
  }
  else
  {
    if (!v19)
      goto LABEL_49;
    -[PKProtobufPaymentSummaryItem setDisbursementSummaryItem:](self, "setDisbursementSummaryItem:");
  }
  v5 = v22;
LABEL_49:
  instantFundsOutFeeSummaryItem = self->_instantFundsOutFeeSummaryItem;
  v21 = *((_QWORD *)v5 + 7);
  if (instantFundsOutFeeSummaryItem)
  {
    if (v21)
    {
      -[PKProtobufInstantFundsOutFeeSummaryItem mergeFrom:](instantFundsOutFeeSummaryItem, "mergeFrom:");
LABEL_54:
      v5 = v22;
    }
  }
  else if (v21)
  {
    -[PKProtobufPaymentSummaryItem setInstantFundsOutFeeSummaryItem:](self, "setInstantFundsOutFeeSummaryItem:");
    goto LABEL_54;
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

- (PKProtobufRecurringPaymentSummaryItem)recurringPaymentSummaryItem
{
  return self->_recurringPaymentSummaryItem;
}

- (void)setRecurringPaymentSummaryItem:(id)a3
{
  objc_storeStrong((id *)&self->_recurringPaymentSummaryItem, a3);
}

- (PKProtobufDeferredPaymentSummaryItem)deferredPaymentSummaryItem
{
  return self->_deferredPaymentSummaryItem;
}

- (void)setDeferredPaymentSummaryItem:(id)a3
{
  objc_storeStrong((id *)&self->_deferredPaymentSummaryItem, a3);
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

- (PKProtobufShippingMethod)shippingMethodSummaryItem
{
  return self->_shippingMethodSummaryItem;
}

- (void)setShippingMethodSummaryItem:(id)a3
{
  objc_storeStrong((id *)&self->_shippingMethodSummaryItem, a3);
}

- (PKProtobufAutomaticReloadPaymentSummaryItem)automaticReloadPaymentSummaryItem
{
  return self->_automaticReloadPaymentSummaryItem;
}

- (void)setAutomaticReloadPaymentSummaryItem:(id)a3
{
  objc_storeStrong((id *)&self->_automaticReloadPaymentSummaryItem, a3);
}

- (PKProtobufDisbursementSummaryItem)disbursementSummaryItem
{
  return self->_disbursementSummaryItem;
}

- (void)setDisbursementSummaryItem:(id)a3
{
  objc_storeStrong((id *)&self->_disbursementSummaryItem, a3);
}

- (PKProtobufInstantFundsOutFeeSummaryItem)instantFundsOutFeeSummaryItem
{
  return self->_instantFundsOutFeeSummaryItem;
}

- (void)setInstantFundsOutFeeSummaryItem:(id)a3
{
  objc_storeStrong((id *)&self->_instantFundsOutFeeSummaryItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shippingMethodSummaryItem, 0);
  objc_storeStrong((id *)&self->_recurringPaymentSummaryItem, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_instantFundsOutFeeSummaryItem, 0);
  objc_storeStrong((id *)&self->_disbursementSummaryItem, 0);
  objc_storeStrong((id *)&self->_deferredPaymentSummaryItem, 0);
  objc_storeStrong((id *)&self->_decimalAmount, 0);
  objc_storeStrong((id *)&self->_customPrecisionAmount, 0);
  objc_storeStrong((id *)&self->_automaticReloadPaymentSummaryItem, 0);
}

@end
