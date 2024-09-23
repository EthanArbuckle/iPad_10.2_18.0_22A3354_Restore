@implementation PKProtobufDeferredPaymentSummaryItem

- (void)setDeferredDate:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_deferredDate = a3;
}

- (void)setHasDeferredDate:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDeferredDate
{
  return *(_BYTE *)&self->_has & 1;
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
  v8.super_class = (Class)PKProtobufDeferredPaymentSummaryItem;
  -[PKProtobufDeferredPaymentSummaryItem description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufDeferredPaymentSummaryItem dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_deferredDate);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("deferredDate"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PKProtobufDeferredPaymentSummaryItemReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteDoubleField();
}

- (void)copyTo:(id)a3
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)a3 + 1) = *(_QWORD *)&self->_deferredDate;
    *((_BYTE *)a3 + 16) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)result + 1) = *(_QWORD *)&self->_deferredDate;
    *((_BYTE *)result + 16) |= 1u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_6;
  v5 = (*((_BYTE *)v4 + 16) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 16) & 1) != 0 && self->_deferredDate == *((double *)v4 + 1))
    {
      v5 = 1;
      goto LABEL_7;
    }
LABEL_6:
    v5 = 0;
  }
LABEL_7:

  return v5;
}

- (unint64_t)hash
{
  unint64_t result;
  double deferredDate;
  double v4;
  long double v5;
  double v6;

  if ((*(_BYTE *)&self->_has & 1) == 0)
    return 0;
  deferredDate = self->_deferredDate;
  v4 = -deferredDate;
  if (deferredDate >= 0.0)
    v4 = self->_deferredDate;
  v5 = floor(v4 + 0.5);
  v6 = (v4 - v5) * 1.84467441e19;
  result = 2654435761u * (unint64_t)fmod(v5, 1.84467441e19);
  if (v6 >= 0.0)
  {
    if (v6 > 0.0)
      result += (unint64_t)v6;
  }
  else
  {
    result -= (unint64_t)fabs(v6);
  }
  return result;
}

- (void)mergeFrom:(id)a3
{
  if ((*((_BYTE *)a3 + 16) & 1) != 0)
  {
    self->_deferredDate = *((double *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
}

- (double)deferredDate
{
  return self->_deferredDate;
}

@end
