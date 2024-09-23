@implementation SECC2MPGenericEventMetricValue

- (BOOL)hasStringValue
{
  return self->_stringValue != 0;
}

- (void)setDoubleValue:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_doubleValue = a3;
}

- (void)setHasDoubleValue:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDoubleValue
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setDateValue:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_dateValue = a3;
}

- (void)setHasDateValue:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDateValue
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasErrorValue
{
  return self->_errorValue != 0;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SECC2MPGenericEventMetricValue;
  v3 = -[SECC2MPGenericEventMetricValue description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SECC2MPGenericEventMetricValue dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *stringValue;
  char has;
  void *v7;
  void *v8;
  SECC2MPError *errorValue;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = v3;
  stringValue = self->_stringValue;
  if (stringValue)
    objc_msgSend(v3, "setObject:forKey:", stringValue, CFSTR("string_value"));
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_doubleValue));
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("double_value"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_dateValue));
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("date_value"));

  }
  errorValue = self->_errorValue;
  if (errorValue)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SECC2MPError dictionaryRepresentation](errorValue, "dictionaryRepresentation"));
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("error_value"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10008BEA4((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSString *stringValue;
  char has;
  SECC2MPError *errorValue;
  id v8;

  v4 = a3;
  stringValue = self->_stringValue;
  v8 = v4;
  if (stringValue)
  {
    PBDataWriterWriteStringField(v4, stringValue, 101);
    v4 = v8;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteDoubleField(v8, 102, self->_doubleValue);
    v4 = v8;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field(v8, self->_dateValue, 103);
    v4 = v8;
  }
  errorValue = self->_errorValue;
  if (errorValue)
  {
    PBDataWriterWriteSubmessage(v8, errorValue, 201);
    v4 = v8;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_stringValue)
  {
    objc_msgSend(v4, "setStringValue:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_QWORD *)v4 + 2) = *(_QWORD *)&self->_doubleValue;
    *((_BYTE *)v4 + 40) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = self->_dateValue;
    *((_BYTE *)v4 + 40) |= 1u;
  }
  if (self->_errorValue)
  {
    objc_msgSend(v6, "setErrorValue:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  char has;
  id v9;
  void *v10;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_stringValue, "copyWithZone:", a3);
  v7 = (void *)v5[4];
  v5[4] = v6;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5[2] = *(_QWORD *)&self->_doubleValue;
    *((_BYTE *)v5 + 40) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    v5[1] = self->_dateValue;
    *((_BYTE *)v5 + 40) |= 1u;
  }
  v9 = -[SECC2MPError copyWithZone:](self->_errorValue, "copyWithZone:", a3);
  v10 = (void *)v5[3];
  v5[3] = v9;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *stringValue;
  SECC2MPError *errorValue;
  unsigned __int8 v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self)))
    goto LABEL_16;
  stringValue = self->_stringValue;
  if ((unint64_t)stringValue | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](stringValue, "isEqual:"))
      goto LABEL_16;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 2) == 0 || self->_doubleValue != *((double *)v4 + 2))
      goto LABEL_16;
  }
  else if ((*((_BYTE *)v4 + 40) & 2) != 0)
  {
LABEL_16:
    v7 = 0;
    goto LABEL_17;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) == 0 || self->_dateValue != *((_QWORD *)v4 + 1))
      goto LABEL_16;
  }
  else if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
    goto LABEL_16;
  }
  errorValue = self->_errorValue;
  if ((unint64_t)errorValue | *((_QWORD *)v4 + 3))
    v7 = -[SECC2MPError isEqual:](errorValue, "isEqual:");
  else
    v7 = 1;
LABEL_17:

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3;
  char has;
  unint64_t v5;
  double doubleValue;
  double v7;
  long double v8;
  double v9;
  unint64_t v10;

  v3 = -[NSString hash](self->_stringValue, "hash");
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    doubleValue = self->_doubleValue;
    v7 = -doubleValue;
    if (doubleValue >= 0.0)
      v7 = self->_doubleValue;
    v8 = floor(v7 + 0.5);
    v9 = (v7 - v8) * 1.84467441e19;
    v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0)
        v5 += (unint64_t)v9;
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    v5 = 0;
  }
  if ((has & 1) != 0)
    v10 = 2654435761u * self->_dateValue;
  else
    v10 = 0;
  return v5 ^ v3 ^ v10 ^ -[SECC2MPError hash](self->_errorValue, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  SECC2MPError *errorValue;
  uint64_t v7;
  id v8;

  v4 = a3;
  v8 = v4;
  if (*((_QWORD *)v4 + 4))
  {
    -[SECC2MPGenericEventMetricValue setStringValue:](self, "setStringValue:");
    v4 = v8;
  }
  v5 = *((_BYTE *)v4 + 40);
  if ((v5 & 2) != 0)
  {
    self->_doubleValue = *((double *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)v4 + 40);
  }
  if ((v5 & 1) != 0)
  {
    self->_dateValue = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  errorValue = self->_errorValue;
  v7 = *((_QWORD *)v4 + 3);
  if (errorValue)
  {
    if (v7)
    {
      -[SECC2MPError mergeFrom:](errorValue, "mergeFrom:");
LABEL_12:
      v4 = v8;
    }
  }
  else if (v7)
  {
    -[SECC2MPGenericEventMetricValue setErrorValue:](self, "setErrorValue:");
    goto LABEL_12;
  }

}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (void)setStringValue:(id)a3
{
  objc_storeStrong((id *)&self->_stringValue, a3);
}

- (double)doubleValue
{
  return self->_doubleValue;
}

- (unint64_t)dateValue
{
  return self->_dateValue;
}

- (SECC2MPError)errorValue
{
  return self->_errorValue;
}

- (void)setErrorValue:(id)a3
{
  objc_storeStrong((id *)&self->_errorValue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringValue, 0);
  objc_storeStrong((id *)&self->_errorValue, 0);
}

@end
