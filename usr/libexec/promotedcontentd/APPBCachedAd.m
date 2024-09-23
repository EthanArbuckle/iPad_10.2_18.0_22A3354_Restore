@implementation APPBCachedAd

+ (id)options
{
  if (qword_100269618 != -1)
    dispatch_once(&qword_100269618, &stru_1002140F8);
  return (id)qword_100269610;
}

- (BOOL)hasUniqueIdentifier
{
  return self->_uniqueIdentifier != 0;
}

- (void)setExpirationDate:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_expirationDate = a3;
}

- (void)setHasExpirationDate:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasExpirationDate
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setPriority:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_priority = a3;
}

- (void)setHasPriority:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPriority
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setRemainingImpressionCount:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_remainingImpressionCount = a3;
}

- (void)setHasRemainingImpressionCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasRemainingImpressionCount
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)APPBCachedAd;
  v3 = -[APPBCachedAd description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APPBCachedAd dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *uniqueIdentifier;
  char has;
  void *v7;
  void *v9;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = v3;
  uniqueIdentifier = self->_uniqueIdentifier;
  if (uniqueIdentifier)
    objc_msgSend(v3, "setObject:forKey:", uniqueIdentifier, CFSTR("uniqueIdentifier"));
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_5;
LABEL_9:
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_priority));
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("priority"));

    if ((*(_BYTE *)&self->_has & 4) == 0)
      return v4;
    goto LABEL_6;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_expirationDate));
  objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("expirationDate"));

  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_9;
LABEL_5:
  if ((has & 4) != 0)
  {
LABEL_6:
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_remainingImpressionCount));
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("remainingImpressionCount"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return APPBCachedAdReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSString *uniqueIdentifier;
  char has;
  id v7;

  v4 = a3;
  uniqueIdentifier = self->_uniqueIdentifier;
  v7 = v4;
  if (uniqueIdentifier)
  {
    PBDataWriterWriteStringField(v4, uniqueIdentifier, 1);
    v4 = v7;
  }
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_5;
LABEL_9:
    PBDataWriterWriteFixed32Field(v7, self->_remainingImpressionCount, 4);
    v4 = v7;
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
  PBDataWriterWriteDoubleField(v7, 2, self->_expirationDate);
  v4 = v7;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_9;
LABEL_5:
  if ((has & 2) != 0)
  {
LABEL_6:
    PBDataWriterWriteFixed64Field(v7, self->_priority, 5);
    v4 = v7;
  }
LABEL_7:

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  if (self->_uniqueIdentifier)
  {
    v6 = v4;
    objc_msgSend(v4, "setUniqueIdentifier:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_5;
LABEL_9:
    *((_DWORD *)v4 + 6) = self->_remainingImpressionCount;
    *((_BYTE *)v4 + 40) |= 4u;
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
  *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_expirationDate;
  *((_BYTE *)v4 + 40) |= 1u;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_9;
LABEL_5:
  if ((has & 2) != 0)
  {
LABEL_6:
    *((_QWORD *)v4 + 2) = self->_priority;
    *((_BYTE *)v4 + 40) |= 2u;
  }
LABEL_7:

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  char has;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_uniqueIdentifier, "copyWithZone:", a3);
  v7 = (void *)v5[4];
  v5[4] = v6;

  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_3;
LABEL_7:
    *((_DWORD *)v5 + 6) = self->_remainingImpressionCount;
    *((_BYTE *)v5 + 40) |= 4u;
    if ((*(_BYTE *)&self->_has & 2) == 0)
      return v5;
    goto LABEL_4;
  }
  v5[1] = *(_QWORD *)&self->_expirationDate;
  *((_BYTE *)v5 + 40) |= 1u;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 2) != 0)
  {
LABEL_4:
    v5[2] = self->_priority;
    *((_BYTE *)v5 + 40) |= 2u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *uniqueIdentifier;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self)))
    goto LABEL_18;
  uniqueIdentifier = self->_uniqueIdentifier;
  if ((unint64_t)uniqueIdentifier | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](uniqueIdentifier, "isEqual:"))
      goto LABEL_18;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) == 0 || self->_expirationDate != *((double *)v4 + 1))
      goto LABEL_18;
  }
  else if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
LABEL_18:
    v6 = 0;
    goto LABEL_19;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 4) == 0 || self->_remainingImpressionCount != *((_DWORD *)v4 + 6))
      goto LABEL_18;
  }
  else if ((*((_BYTE *)v4 + 40) & 4) != 0)
  {
    goto LABEL_18;
  }
  v6 = (*((_BYTE *)v4 + 40) & 2) == 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 2) == 0 || self->_priority != *((_QWORD *)v4 + 2))
      goto LABEL_18;
    v6 = 1;
  }
LABEL_19:

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;
  char has;
  unint64_t v5;
  double expirationDate;
  double v7;
  long double v8;
  double v9;
  uint64_t v10;
  unint64_t v11;

  v3 = -[NSString hash](self->_uniqueIdentifier, "hash");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    expirationDate = self->_expirationDate;
    v7 = -expirationDate;
    if (expirationDate >= 0.0)
      v7 = self->_expirationDate;
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
  if ((has & 4) != 0)
  {
    v10 = 2654435761 * self->_remainingImpressionCount;
    if ((has & 2) != 0)
      goto LABEL_11;
LABEL_13:
    v11 = 0;
    return v5 ^ v3 ^ v10 ^ v11;
  }
  v10 = 0;
  if ((has & 2) == 0)
    goto LABEL_13;
LABEL_11:
  v11 = 2654435761u * self->_priority;
  return v5 ^ v3 ^ v10 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  if (*((_QWORD *)v4 + 4))
  {
    v6 = v4;
    -[APPBCachedAd setUniqueIdentifier:](self, "setUniqueIdentifier:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 40);
  if ((v5 & 1) == 0)
  {
    if ((*((_BYTE *)v4 + 40) & 4) == 0)
      goto LABEL_5;
LABEL_9:
    self->_remainingImpressionCount = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 4u;
    if ((*((_BYTE *)v4 + 40) & 2) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
  self->_expirationDate = *((double *)v4 + 1);
  *(_BYTE *)&self->_has |= 1u;
  v5 = *((_BYTE *)v4 + 40);
  if ((v5 & 4) != 0)
    goto LABEL_9;
LABEL_5:
  if ((v5 & 2) != 0)
  {
LABEL_6:
    self->_priority = *((_QWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
  }
LABEL_7:

}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void)setUniqueIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_uniqueIdentifier, a3);
}

- (double)expirationDate
{
  return self->_expirationDate;
}

- (unint64_t)priority
{
  return self->_priority;
}

- (unsigned)remainingImpressionCount
{
  return self->_remainingImpressionCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

@end
