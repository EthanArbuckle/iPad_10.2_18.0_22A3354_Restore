@implementation PKProtobufCustomPrecisionAmount

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)PKProtobufCustomPrecisionAmount;
  -[PKProtobufCustomPrecisionAmount description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufCustomPrecisionAmount dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_amount);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("amount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_decimalDigitsMultiplier);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("decimal_digits_multiplier"));

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PKProtobufCustomPrecisionAmountReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v3;

  v3 = a3;
  PBDataWriterWriteSint64Field();
  PBDataWriterWriteUint32Field();

}

- (void)copyTo:(id)a3
{
  *((_QWORD *)a3 + 1) = self->_amount;
  *((_DWORD *)a3 + 4) = self->_decimalDigitsMultiplier;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((_QWORD *)result + 1) = self->_amount;
  *((_DWORD *)result + 4) = self->_decimalDigitsMultiplier;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && self->_amount == *((_QWORD *)v4 + 1)
    && self->_decimalDigitsMultiplier == *((_DWORD *)v4 + 4);

  return v5;
}

- (unint64_t)hash
{
  return (2654435761 * self->_decimalDigitsMultiplier) ^ (2654435761 * self->_amount);
}

- (void)mergeFrom:(id)a3
{
  self->_amount = *((_QWORD *)a3 + 1);
  self->_decimalDigitsMultiplier = *((_DWORD *)a3 + 4);
}

- (int64_t)amount
{
  return self->_amount;
}

- (void)setAmount:(int64_t)a3
{
  self->_amount = a3;
}

- (unsigned)decimalDigitsMultiplier
{
  return self->_decimalDigitsMultiplier;
}

- (void)setDecimalDigitsMultiplier:(unsigned int)a3
{
  self->_decimalDigitsMultiplier = a3;
}

@end
