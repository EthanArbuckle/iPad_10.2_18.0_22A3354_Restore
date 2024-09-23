@implementation APPBAdJourneyStartRelayValue

- (BOOL)hasKey
{
  return self->_key != 0;
}

- (void)setValueBool:(BOOL)a3
{
  -[APPBAdJourneyStartRelayValue clearOneofValuesForValue](self, "clearOneofValuesForValue");
  *(_BYTE *)&self->_has |= 4u;
  self->_value = 1;
  *(_BYTE *)&self->_has |= 8u;
  self->_valueBool = a3;
}

- (void)setHasValueBool:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasValueBool
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setValueInt:(int64_t)a3
{
  -[APPBAdJourneyStartRelayValue clearOneofValuesForValue](self, "clearOneofValuesForValue");
  *(_BYTE *)&self->_has |= 4u;
  self->_value = 2;
  *(_BYTE *)&self->_has |= 2u;
  self->_valueInt = a3;
}

- (void)setHasValueInt:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasValueInt
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setValueDouble:(double)a3
{
  -[APPBAdJourneyStartRelayValue clearOneofValuesForValue](self, "clearOneofValuesForValue");
  *(_BYTE *)&self->_has |= 4u;
  self->_value = 3;
  *(_BYTE *)&self->_has |= 1u;
  self->_valueDouble = a3;
}

- (void)setHasValueDouble:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasValueDouble
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasValueString
{
  return self->_valueString != 0;
}

- (void)setValueString:(id)a3
{
  NSString *v4;
  NSString *valueString;

  v4 = (NSString *)a3;
  -[APPBAdJourneyStartRelayValue clearOneofValuesForValue](self, "clearOneofValuesForValue");
  *(_BYTE *)&self->_has |= 4u;
  self->_value = 4;
  valueString = self->_valueString;
  self->_valueString = v4;

}

- (int)value
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_value;
  else
    return 0;
}

- (void)setValue:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_value = a3;
}

- (void)setHasValue:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasValue
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)valueAsString:(int)a3
{
  if (a3 >= 5)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  else
    return *(&off_1002141F8 + a3);
}

- (int)StringAsValue:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PBUNSET")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("value_BOOL")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("value_int")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("value_double")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("value_string")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)clearOneofValuesForValue
{
  NSString *valueString;

  *(_BYTE *)&self->_has &= ~4u;
  self->_value = 0;
  *(_BYTE *)&self->_has &= ~8u;
  self->_valueBool = 0;
  *(_BYTE *)&self->_has &= ~2u;
  self->_valueInt = 0;
  *(_BYTE *)&self->_has &= ~1u;
  self->_valueDouble = 0.0;
  valueString = self->_valueString;
  self->_valueString = 0;

}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)APPBAdJourneyStartRelayValue;
  v3 = -[APPBAdJourneyStartRelayValue description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APPBAdJourneyStartRelayValue dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *key;
  char has;
  void *v7;
  NSString *valueString;
  uint64_t value;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = v3;
  key = self->_key;
  if (key)
    objc_msgSend(v3, "setObject:forKey:", key, CFSTR("key"));
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_valueBool));
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("value_BOOL"));

    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 1) == 0)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", self->_valueInt));
  objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("value_int"));

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_6:
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_valueDouble));
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("value_double"));

  }
LABEL_7:
  valueString = self->_valueString;
  if (valueString)
    objc_msgSend(v4, "setObject:forKey:", valueString, CFSTR("value_string"));
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    value = self->_value;
    if (value >= 5)
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_value));
    else
      v10 = *(&off_1002141F8 + value);
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("value"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return APPBAdJourneyStartRelayValueReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSString *key;
  char has;
  NSString *valueString;
  id v8;

  v4 = a3;
  key = self->_key;
  v8 = v4;
  if (key)
  {
    PBDataWriterWriteStringField(v4, key, 1);
    v4 = v8;
  }
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteBOOLField(v8, self->_valueBool, 2);
    v4 = v8;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 1) == 0)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteInt64Field(v8, self->_valueInt, 3);
  v4 = v8;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_6:
    PBDataWriterWriteDoubleField(v8, 4, self->_valueDouble);
    v4 = v8;
  }
LABEL_7:
  valueString = self->_valueString;
  if (valueString)
  {
    PBDataWriterWriteStringField(v8, valueString, 5);
    v4 = v8;
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char has;
  _DWORD *v6;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v4[8] = self->_value;
    *((_BYTE *)v4 + 52) |= 4u;
  }
  v6 = v4;
  if (self->_key)
  {
    objc_msgSend(v4, "setKey:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((_BYTE *)v4 + 48) = self->_valueBool;
    *((_BYTE *)v4 + 52) |= 8u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 1) == 0)
        goto LABEL_9;
      goto LABEL_8;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }
  *((_QWORD *)v4 + 2) = self->_valueInt;
  *((_BYTE *)v4 + 52) |= 2u;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_8:
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_valueDouble;
    *((_BYTE *)v4 + 52) |= 1u;
  }
LABEL_9:
  if (self->_valueString)
  {
    objc_msgSend(v6, "setValueString:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _DWORD *v5;
  _QWORD *v6;
  id v7;
  void *v8;
  char has;
  id v10;
  void *v11;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v5[8] = self->_value;
    *((_BYTE *)v5 + 52) |= 4u;
  }
  v7 = -[NSString copyWithZone:](self->_key, "copyWithZone:", a3);
  v8 = (void *)v6[3];
  v6[3] = v7;

  has = (char)self->_has;
  if ((has & 8) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_5;
LABEL_9:
    v6[2] = self->_valueInt;
    *((_BYTE *)v6 + 52) |= 2u;
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
  *((_BYTE *)v6 + 48) = self->_valueBool;
  *((_BYTE *)v6 + 52) |= 8u;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_9;
LABEL_5:
  if ((has & 1) != 0)
  {
LABEL_6:
    v6[1] = *(_QWORD *)&self->_valueDouble;
    *((_BYTE *)v6 + 52) |= 1u;
  }
LABEL_7:
  v10 = -[NSString copyWithZone:](self->_valueString, "copyWithZone:", a3);
  v11 = (void *)v6[5];
  v6[5] = v10;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char has;
  NSString *key;
  NSString *valueString;
  unsigned __int8 v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self)))
    goto LABEL_30;
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 4) == 0 || self->_value != *((_DWORD *)v4 + 8))
      goto LABEL_30;
  }
  else if ((*((_BYTE *)v4 + 52) & 4) != 0)
  {
    goto LABEL_30;
  }
  key = self->_key;
  if ((unint64_t)key | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](key, "isEqual:"))
      goto LABEL_30;
    has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 8) != 0)
    {
      if (self->_valueBool)
      {
        if (!*((_BYTE *)v4 + 48))
          goto LABEL_30;
        goto LABEL_18;
      }
      if (!*((_BYTE *)v4 + 48))
        goto LABEL_18;
    }
LABEL_30:
    v8 = 0;
    goto LABEL_31;
  }
  if ((*((_BYTE *)v4 + 52) & 8) != 0)
    goto LABEL_30;
LABEL_18:
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 2) == 0 || self->_valueInt != *((_QWORD *)v4 + 2))
      goto LABEL_30;
  }
  else if ((*((_BYTE *)v4 + 52) & 2) != 0)
  {
    goto LABEL_30;
  }
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 1) == 0 || self->_valueDouble != *((double *)v4 + 1))
      goto LABEL_30;
  }
  else if ((*((_BYTE *)v4 + 52) & 1) != 0)
  {
    goto LABEL_30;
  }
  valueString = self->_valueString;
  if ((unint64_t)valueString | *((_QWORD *)v4 + 5))
    v8 = -[NSString isEqual:](valueString, "isEqual:");
  else
    v8 = 1;
LABEL_31:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  uint64_t v5;
  uint64_t v6;
  double valueDouble;
  double v8;
  long double v9;
  double v10;
  unint64_t v11;

  if ((*(_BYTE *)&self->_has & 4) != 0)
    v3 = 2654435761 * self->_value;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_key, "hash");
  if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_6;
LABEL_12:
    v6 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_7;
LABEL_13:
    v11 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v11 ^ -[NSString hash](self->_valueString, "hash");
  }
  v5 = 2654435761 * self->_valueBool;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_12;
LABEL_6:
  v6 = 2654435761 * self->_valueInt;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_13;
LABEL_7:
  valueDouble = self->_valueDouble;
  v8 = -valueDouble;
  if (valueDouble >= 0.0)
    v8 = self->_valueDouble;
  v9 = floor(v8 + 0.5);
  v10 = (v8 - v9) * 1.84467441e19;
  v11 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
  if (v10 >= 0.0)
  {
    if (v10 > 0.0)
      v11 += (unint64_t)v10;
  }
  else
  {
    v11 -= (unint64_t)fabs(v10);
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v11 ^ -[NSString hash](self->_valueString, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  if ((*((_BYTE *)v4 + 52) & 4) != 0)
  {
    self->_value = *((_DWORD *)v4 + 8);
    *(_BYTE *)&self->_has |= 4u;
  }
  v6 = v4;
  if (*((_QWORD *)v4 + 3))
  {
    -[APPBAdJourneyStartRelayValue setKey:](self, "setKey:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 52);
  if ((v5 & 8) != 0)
  {
    self->_valueBool = *((_BYTE *)v4 + 48);
    *(_BYTE *)&self->_has |= 8u;
    v5 = *((_BYTE *)v4 + 52);
    if ((v5 & 2) == 0)
    {
LABEL_7:
      if ((v5 & 1) == 0)
        goto LABEL_9;
      goto LABEL_8;
    }
  }
  else if ((*((_BYTE *)v4 + 52) & 2) == 0)
  {
    goto LABEL_7;
  }
  self->_valueInt = *((_QWORD *)v4 + 2);
  *(_BYTE *)&self->_has |= 2u;
  if ((*((_BYTE *)v4 + 52) & 1) != 0)
  {
LABEL_8:
    self->_valueDouble = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
LABEL_9:
  if (*((_QWORD *)v4 + 5))
  {
    -[APPBAdJourneyStartRelayValue setValueString:](self, "setValueString:");
    v4 = v6;
  }

}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
  objc_storeStrong((id *)&self->_key, a3);
}

- (BOOL)valueBool
{
  return self->_valueBool;
}

- (int64_t)valueInt
{
  return self->_valueInt;
}

- (double)valueDouble
{
  return self->_valueDouble;
}

- (NSString)valueString
{
  return self->_valueString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueString, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end
