@implementation APPBAdFrequencyCapData

- (int)relevantIdentifier
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_relevantIdentifier;
  else
    return 15001;
}

- (void)setRelevantIdentifier:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_relevantIdentifier = a3;
}

- (void)setHasRelevantIdentifier:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasRelevantIdentifier
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)relevantIdentifierAsString:(int)a3
{
  if ((a3 - 15001) >= 5)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  else
    return *(&off_100215008 + a3 - 15001);
}

- (int)StringAsRelevantIdentifier:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UniqueAd")) & 1) != 0)
  {
    v4 = 15001;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Line")) & 1) != 0)
  {
    v4 = 15002;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Campaign")) & 1) != 0)
  {
    v4 = 15003;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Creative")) & 1) != 0)
  {
    v4 = 15004;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("AdamId")))
  {
    v4 = 15005;
  }
  else
  {
    v4 = 15001;
  }

  return v4;
}

- (void)setAdFrequencyValue:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_adFrequencyValue = a3;
}

- (void)setHasAdFrequencyValue:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasAdFrequencyValue
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setAdFrequencyDuration:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_adFrequencyDuration = a3;
}

- (void)setHasAdFrequencyDuration:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAdFrequencyDuration
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)APPBAdFrequencyCapData;
  v3 = -[APPBAdFrequencyCapData description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APPBAdFrequencyCapData dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  int v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v5 = self->_relevantIdentifier - 15001;
    if (v5 >= 5)
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_relevantIdentifier));
    else
      v6 = *(&off_100215008 + v5);
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("relevantIdentifier"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_adFrequencyValue));
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("adFrequencyValue"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_adFrequencyDuration));
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("adFrequencyDuration"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return APPBAdFrequencyCapDataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  has = (char)self->_has;
  v6 = v4;
  if ((has & 4) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_3;
LABEL_7:
    PBDataWriterWriteInt32Field(v6, self->_adFrequencyValue, 2);
    v4 = v6;
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  PBDataWriterWriteInt32Field(v4, self->_relevantIdentifier, 1);
  v4 = v6;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 1) != 0)
  {
LABEL_4:
    PBDataWriterWriteUint64Field(v6, self->_adFrequencyDuration, 3);
    v4 = v6;
  }
LABEL_5:

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char has;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_3;
LABEL_7:
    v4[4] = self->_adFrequencyValue;
    *((_BYTE *)v4 + 24) |= 2u;
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  v4[5] = self->_relevantIdentifier;
  *((_BYTE *)v4 + 24) |= 4u;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 1) != 0)
  {
LABEL_4:
    *((_QWORD *)v4 + 1) = self->_adFrequencyDuration;
    *((_BYTE *)v4 + 24) |= 1u;
  }
LABEL_5:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)result + 5) = self->_relevantIdentifier;
    *((_BYTE *)result + 24) |= 4u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        return result;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 4) = self->_adFrequencyValue;
  *((_BYTE *)result + 24) |= 2u;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    return result;
LABEL_4:
  *((_QWORD *)result + 1) = self->_adFrequencyDuration;
  *((_BYTE *)result + 24) |= 1u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self)))
    goto LABEL_16;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 4) == 0 || self->_relevantIdentifier != *((_DWORD *)v4 + 5))
      goto LABEL_16;
  }
  else if ((*((_BYTE *)v4 + 24) & 4) != 0)
  {
LABEL_16:
    v5 = 0;
    goto LABEL_17;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 2) == 0 || self->_adFrequencyValue != *((_DWORD *)v4 + 4))
      goto LABEL_16;
  }
  else if ((*((_BYTE *)v4 + 24) & 2) != 0)
  {
    goto LABEL_16;
  }
  v5 = (*((_BYTE *)v4 + 24) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 1) == 0 || self->_adFrequencyDuration != *((_QWORD *)v4 + 1))
      goto LABEL_16;
    v5 = 1;
  }
LABEL_17:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;

  if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_6:
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_4;
LABEL_7:
    v4 = 0;
    return v3 ^ v2 ^ v4;
  }
  v2 = 2654435761 * self->_relevantIdentifier;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v3 = 2654435761 * self->_adFrequencyValue;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_7;
LABEL_4:
  v4 = 2654435761u * self->_adFrequencyDuration;
  return v3 ^ v2 ^ v4;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 24);
  if ((v5 & 4) == 0)
  {
    if ((*((_BYTE *)v4 + 24) & 2) == 0)
      goto LABEL_3;
LABEL_7:
    self->_adFrequencyValue = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 2u;
    if ((*((_BYTE *)v4 + 24) & 1) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  self->_relevantIdentifier = *((_DWORD *)v4 + 5);
  *(_BYTE *)&self->_has |= 4u;
  v5 = *((_BYTE *)v4 + 24);
  if ((v5 & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((v5 & 1) != 0)
  {
LABEL_4:
    self->_adFrequencyDuration = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
LABEL_5:

}

- (int)adFrequencyValue
{
  return self->_adFrequencyValue;
}

- (unint64_t)adFrequencyDuration
{
  return self->_adFrequencyDuration;
}

@end
