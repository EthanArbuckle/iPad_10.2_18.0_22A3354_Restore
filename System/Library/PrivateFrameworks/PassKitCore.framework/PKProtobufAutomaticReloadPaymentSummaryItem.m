@implementation PKProtobufAutomaticReloadPaymentSummaryItem

- (BOOL)hasThresholdAmount
{
  return self->_thresholdAmount != 0;
}

- (BOOL)hasThresholdDecimalAmount
{
  return self->_thresholdDecimalAmount != 0;
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
  v8.super_class = (Class)PKProtobufAutomaticReloadPaymentSummaryItem;
  -[PKProtobufAutomaticReloadPaymentSummaryItem description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufAutomaticReloadPaymentSummaryItem dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  PKProtobufCustomPrecisionAmount *thresholdAmount;
  void *v5;
  PKProtobufNSDecimalNumber *thresholdDecimalAmount;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  thresholdAmount = self->_thresholdAmount;
  if (thresholdAmount)
  {
    -[PKProtobufCustomPrecisionAmount dictionaryRepresentation](thresholdAmount, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("thresholdAmount"));

  }
  thresholdDecimalAmount = self->_thresholdDecimalAmount;
  if (thresholdDecimalAmount)
  {
    -[PKProtobufNSDecimalNumber dictionaryRepresentation](thresholdDecimalAmount, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("threshold_decimal_amount"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PKProtobufAutomaticReloadPaymentSummaryItemReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_thresholdAmount)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_thresholdDecimalAmount)
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
  if (self->_thresholdAmount)
  {
    objc_msgSend(v4, "setThresholdAmount:");
    v4 = v5;
  }
  if (self->_thresholdDecimalAmount)
  {
    objc_msgSend(v5, "setThresholdDecimalAmount:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[PKProtobufCustomPrecisionAmount copyWithZone:](self->_thresholdAmount, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[PKProtobufNSDecimalNumber copyWithZone:](self->_thresholdDecimalAmount, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  PKProtobufCustomPrecisionAmount *thresholdAmount;
  PKProtobufNSDecimalNumber *thresholdDecimalAmount;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((thresholdAmount = self->_thresholdAmount, !((unint64_t)thresholdAmount | v4[1]))
     || -[PKProtobufCustomPrecisionAmount isEqual:](thresholdAmount, "isEqual:")))
  {
    thresholdDecimalAmount = self->_thresholdDecimalAmount;
    if ((unint64_t)thresholdDecimalAmount | v4[2])
      v7 = -[PKProtobufNSDecimalNumber isEqual:](thresholdDecimalAmount, "isEqual:");
    else
      v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[PKProtobufCustomPrecisionAmount hash](self->_thresholdAmount, "hash");
  return -[PKProtobufNSDecimalNumber hash](self->_thresholdDecimalAmount, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  PKProtobufCustomPrecisionAmount *thresholdAmount;
  uint64_t v6;
  PKProtobufNSDecimalNumber *thresholdDecimalAmount;
  uint64_t v8;
  _QWORD *v9;

  v4 = a3;
  thresholdAmount = self->_thresholdAmount;
  v6 = v4[1];
  v9 = v4;
  if (thresholdAmount)
  {
    if (!v6)
      goto LABEL_7;
    -[PKProtobufCustomPrecisionAmount mergeFrom:](thresholdAmount, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[PKProtobufAutomaticReloadPaymentSummaryItem setThresholdAmount:](self, "setThresholdAmount:");
  }
  v4 = v9;
LABEL_7:
  thresholdDecimalAmount = self->_thresholdDecimalAmount;
  v8 = v4[2];
  if (thresholdDecimalAmount)
  {
    if (v8)
    {
      -[PKProtobufNSDecimalNumber mergeFrom:](thresholdDecimalAmount, "mergeFrom:");
LABEL_12:
      v4 = v9;
    }
  }
  else if (v8)
  {
    -[PKProtobufAutomaticReloadPaymentSummaryItem setThresholdDecimalAmount:](self, "setThresholdDecimalAmount:");
    goto LABEL_12;
  }

}

- (PKProtobufCustomPrecisionAmount)thresholdAmount
{
  return self->_thresholdAmount;
}

- (void)setThresholdAmount:(id)a3
{
  objc_storeStrong((id *)&self->_thresholdAmount, a3);
}

- (PKProtobufNSDecimalNumber)thresholdDecimalAmount
{
  return self->_thresholdDecimalAmount;
}

- (void)setThresholdDecimalAmount:(id)a3
{
  objc_storeStrong((id *)&self->_thresholdDecimalAmount, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thresholdDecimalAmount, 0);
  objc_storeStrong((id *)&self->_thresholdAmount, 0);
}

@end
