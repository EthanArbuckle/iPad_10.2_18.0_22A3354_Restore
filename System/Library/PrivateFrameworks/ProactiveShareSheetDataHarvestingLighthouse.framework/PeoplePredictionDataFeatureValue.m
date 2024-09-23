@implementation PeoplePredictionDataFeatureValue

- (void)setIntValue:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_intValue = a3;
}

- (void)setHasIntValue:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIntValue
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setDoubleValue:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_doubleValue = a3;
}

- (void)setHasDoubleValue:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDoubleValue
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasStringValue
{
  return self->_stringValue != 0;
}

- (void)setBoolValue:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_BOOLValue = a3;
}

- (void)setHasBoolValue:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasBoolValue
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (int)timeBucketValue
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_timeBucketValue;
  else
    return 0;
}

- (void)setTimeBucketValue:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_timeBucketValue = a3;
}

- (void)setHasTimeBucketValue:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTimeBucketValue
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)timeBucketValueAsString:(int)a3
{
  if (a3 < 0x17)
    return off_2515B8F00[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsTimeBucketValue:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TimeBucketUnknown")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LessThan2Mins")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LessThan5Mins")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LessThan10Mins")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LessThan30Mins")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LessThan1Hr")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LessThan2Hrs")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LessThan4Hrs")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LessThan6Hrs")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LessThan12Hrs")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LessThan24Hrs")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LessThan2Days")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LessThan3Days")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LessThan4Days")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LessThan5Days")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LessThan6Days")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LessThan1Week")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LessThan1Month")) & 1) != 0)
  {
    v4 = 17;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LessThan3Month")) & 1) != 0)
  {
    v4 = 18;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LessThan6Month")) & 1) != 0)
  {
    v4 = 19;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LessThan1Year")) & 1) != 0)
  {
    v4 = 20;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LessThan5Years")) & 1) != 0)
  {
    v4 = 21;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Other")))
  {
    v4 = 22;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)PeoplePredictionDataFeatureValue;
  -[PeoplePredictionDataFeatureValue description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PeoplePredictionDataFeatureValue dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v6;
  NSString *stringValue;
  char v8;
  void *v9;
  uint64_t timeBucketValue;
  __CFString *v11;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_intValue);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("intValue"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_doubleValue);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("doubleValue"));

  }
  stringValue = self->_stringValue;
  if (stringValue)
    objc_msgSend(v3, "setObject:forKey:", stringValue, CFSTR("stringValue"));
  v8 = (char)self->_has;
  if ((v8 & 8) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_BOOLValue);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("BOOLValue"));

    v8 = (char)self->_has;
  }
  if ((v8 & 4) != 0)
  {
    timeBucketValue = self->_timeBucketValue;
    if (timeBucketValue >= 0x17)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_timeBucketValue);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = off_2515B8F00[timeBucketValue];
    }
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("timeBucketValue"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PeoplePredictionDataFeatureValueReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  char v5;
  id v6;

  v6 = a3;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
    PBDataWriterWriteDoubleField();
  if (self->_stringValue)
    PBDataWriterWriteStringField();
  v5 = (char)self->_has;
  if ((v5 & 8) != 0)
  {
    PBDataWriterWriteBOOLField();
    v5 = (char)self->_has;
  }
  if ((v5 & 4) != 0)
    PBDataWriterWriteInt32Field();

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char has;
  char v6;
  _DWORD *v7;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[4] = self->_intValue;
    *((_BYTE *)v4 + 40) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_doubleValue;
    *((_BYTE *)v4 + 40) |= 1u;
  }
  if (self->_stringValue)
  {
    v7 = v4;
    objc_msgSend(v4, "setStringValue:");
    v4 = v7;
  }
  v6 = (char)self->_has;
  if ((v6 & 8) != 0)
  {
    *((_BYTE *)v4 + 36) = self->_BOOLValue;
    *((_BYTE *)v4 + 40) |= 8u;
    v6 = (char)self->_has;
  }
  if ((v6 & 4) != 0)
  {
    v4[8] = self->_timeBucketValue;
    *((_BYTE *)v4 + 40) |= 4u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char has;
  uint64_t v8;
  void *v9;
  char v10;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_intValue;
    *(_BYTE *)(v5 + 40) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_doubleValue;
    *(_BYTE *)(v5 + 40) |= 1u;
  }
  v8 = -[NSString copyWithZone:](self->_stringValue, "copyWithZone:", a3);
  v9 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v8;

  v10 = (char)self->_has;
  if ((v10 & 8) != 0)
  {
    *(_BYTE *)(v6 + 36) = self->_BOOLValue;
    *(_BYTE *)(v6 + 40) |= 8u;
    v10 = (char)self->_has;
  }
  if ((v10 & 4) != 0)
  {
    *(_DWORD *)(v6 + 32) = self->_timeBucketValue;
    *(_BYTE *)(v6 + 40) |= 4u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char has;
  NSString *stringValue;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_27;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 2) == 0 || self->_intValue != *((_DWORD *)v4 + 4))
      goto LABEL_27;
  }
  else if ((*((_BYTE *)v4 + 40) & 2) != 0)
  {
    goto LABEL_27;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) == 0 || self->_doubleValue != *((double *)v4 + 1))
      goto LABEL_27;
  }
  else if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
    goto LABEL_27;
  }
  stringValue = self->_stringValue;
  if ((unint64_t)stringValue | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](stringValue, "isEqual:"))
      goto LABEL_27;
    has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 8) != 0)
    {
      if (self->_BOOLValue)
      {
        if (!*((_BYTE *)v4 + 36))
          goto LABEL_27;
        goto LABEL_23;
      }
      if (!*((_BYTE *)v4 + 36))
        goto LABEL_23;
    }
LABEL_27:
    v7 = 0;
    goto LABEL_28;
  }
  if ((*((_BYTE *)v4 + 40) & 8) != 0)
    goto LABEL_27;
LABEL_23:
  v7 = (*((_BYTE *)v4 + 40) & 4) == 0;
  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 4) == 0 || self->_timeBucketValue != *((_DWORD *)v4 + 8))
      goto LABEL_27;
    v7 = 1;
  }
LABEL_28:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  double doubleValue;
  double v5;
  long double v6;
  double v7;
  unint64_t v8;
  NSUInteger v9;
  uint64_t v10;
  uint64_t v11;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v3 = 2654435761 * self->_intValue;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
LABEL_8:
    v8 = 0;
    goto LABEL_11;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_8;
LABEL_3:
  doubleValue = self->_doubleValue;
  v5 = -doubleValue;
  if (doubleValue >= 0.0)
    v5 = self->_doubleValue;
  v6 = floor(v5 + 0.5);
  v7 = (v5 - v6) * 1.84467441e19;
  v8 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
  if (v7 >= 0.0)
  {
    if (v7 > 0.0)
      v8 += (unint64_t)v7;
  }
  else
  {
    v8 -= (unint64_t)fabs(v7);
  }
LABEL_11:
  v9 = -[NSString hash](self->_stringValue, "hash");
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    v10 = 2654435761 * self->_BOOLValue;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_13;
LABEL_15:
    v11 = 0;
    return v8 ^ v3 ^ v10 ^ v11 ^ v9;
  }
  v10 = 0;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_15;
LABEL_13:
  v11 = 2654435761 * self->_timeBucketValue;
  return v8 ^ v3 ^ v10 ^ v11 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  char v6;
  id v7;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 40);
  if ((v5 & 2) != 0)
  {
    self->_intValue = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)v4 + 40);
  }
  if ((v5 & 1) != 0)
  {
    self->_doubleValue = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 3))
  {
    v7 = v4;
    -[PeoplePredictionDataFeatureValue setStringValue:](self, "setStringValue:");
    v4 = v7;
  }
  v6 = *((_BYTE *)v4 + 40);
  if ((v6 & 8) != 0)
  {
    self->_BOOLValue = *((_BYTE *)v4 + 36);
    *(_BYTE *)&self->_has |= 8u;
    v6 = *((_BYTE *)v4 + 40);
  }
  if ((v6 & 4) != 0)
  {
    self->_timeBucketValue = *((_DWORD *)v4 + 8);
    *(_BYTE *)&self->_has |= 4u;
  }

}

- (unsigned)intValue
{
  return self->_intValue;
}

- (double)doubleValue
{
  return self->_doubleValue;
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (void)setStringValue:(id)a3
{
  objc_storeStrong((id *)&self->_stringValue, a3);
}

- (BOOL)BOOLValue
{
  return self->_BOOLValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringValue, 0);
}

@end
