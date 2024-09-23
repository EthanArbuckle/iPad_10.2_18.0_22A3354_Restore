@implementation APPBConfiguration

- (BOOL)hasBundleId
{
  return self->_bundleId != 0;
}

- (void)setRequestType:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_requestType = a3;
}

- (void)setHasRequestType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasRequestType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setIsTest:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_isTest = a3;
}

- (void)setHasIsTest:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasIsTest
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasBaseUrl
{
  return self->_baseUrl != 0;
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

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)APPBConfiguration;
  v3 = -[APPBConfiguration description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APPBConfiguration dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *bundleId;
  char has;
  void *v7;
  void *v8;
  NSString *baseUrl;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = v3;
  bundleId = self->_bundleId;
  if (bundleId)
    objc_msgSend(v3, "setObject:forKey:", bundleId, CFSTR("bundleId"));
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_requestType));
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("requestType"));

    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_isTest));
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("isTest"));

  }
  baseUrl = self->_baseUrl;
  if (baseUrl)
    objc_msgSend(v4, "setObject:forKey:", baseUrl, CFSTR("baseUrl"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_expirationDate));
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("expirationDate"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return APPBConfigurationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSString *bundleId;
  char has;
  NSString *baseUrl;
  id v8;

  v4 = a3;
  bundleId = self->_bundleId;
  v8 = v4;
  if (bundleId)
  {
    PBDataWriterWriteStringField(v4, bundleId, 1);
    v4 = v8;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field(v8, self->_requestType, 2);
    v4 = v8;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    PBDataWriterWriteBOOLField(v8, self->_isTest, 3);
    v4 = v8;
  }
  baseUrl = self->_baseUrl;
  if (baseUrl)
  {
    PBDataWriterWriteStringField(v8, baseUrl, 4);
    v4 = v8;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteDoubleField(v8, 7, self->_expirationDate);
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
  if (self->_bundleId)
  {
    objc_msgSend(v4, "setBundleId:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 8) = self->_requestType;
    *((_BYTE *)v4 + 40) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *((_BYTE *)v4 + 36) = self->_isTest;
    *((_BYTE *)v4 + 40) |= 4u;
  }
  if (self->_baseUrl)
  {
    objc_msgSend(v6, "setBaseUrl:");
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_expirationDate;
    *((_BYTE *)v4 + 40) |= 1u;
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
  v6 = -[NSString copyWithZone:](self->_bundleId, "copyWithZone:", a3);
  v7 = (void *)v5[3];
  v5[3] = v6;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v5 + 8) = self->_requestType;
    *((_BYTE *)v5 + 40) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *((_BYTE *)v5 + 36) = self->_isTest;
    *((_BYTE *)v5 + 40) |= 4u;
  }
  v9 = -[NSString copyWithZone:](self->_baseUrl, "copyWithZone:", a3);
  v10 = (void *)v5[2];
  v5[2] = v9;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v5[1] = *(_QWORD *)&self->_expirationDate;
    *((_BYTE *)v5 + 40) |= 1u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *bundleId;
  char has;
  NSString *baseUrl;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self)))
    goto LABEL_24;
  bundleId = self->_bundleId;
  if ((unint64_t)bundleId | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](bundleId, "isEqual:"))
      goto LABEL_24;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 2) == 0 || self->_requestType != *((_DWORD *)v4 + 8))
      goto LABEL_24;
  }
  else if ((*((_BYTE *)v4 + 40) & 2) != 0)
  {
    goto LABEL_24;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 4) == 0)
      goto LABEL_24;
    if (self->_isTest)
    {
      if (!*((_BYTE *)v4 + 36))
        goto LABEL_24;
    }
    else if (*((_BYTE *)v4 + 36))
    {
      goto LABEL_24;
    }
  }
  else if ((*((_BYTE *)v4 + 40) & 4) != 0)
  {
    goto LABEL_24;
  }
  baseUrl = self->_baseUrl;
  if (!((unint64_t)baseUrl | *((_QWORD *)v4 + 2)))
    goto LABEL_20;
  if (!-[NSString isEqual:](baseUrl, "isEqual:"))
  {
LABEL_24:
    v8 = 0;
    goto LABEL_25;
  }
  has = (char)self->_has;
LABEL_20:
  v8 = (*((_BYTE *)v4 + 40) & 1) == 0;
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) == 0 || self->_expirationDate != *((double *)v4 + 1))
      goto LABEL_24;
    v8 = 1;
  }
LABEL_25:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;
  NSUInteger v6;
  unint64_t v7;
  double expirationDate;
  double v9;
  long double v10;
  double v11;

  v3 = -[NSString hash](self->_bundleId, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v4 = 2654435761 * self->_requestType;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_3;
  }
  else
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
LABEL_3:
      v5 = 2654435761 * self->_isTest;
      goto LABEL_6;
    }
  }
  v5 = 0;
LABEL_6:
  v6 = -[NSString hash](self->_baseUrl, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    expirationDate = self->_expirationDate;
    v9 = -expirationDate;
    if (expirationDate >= 0.0)
      v9 = self->_expirationDate;
    v10 = floor(v9 + 0.5);
    v11 = (v9 - v10) * 1.84467441e19;
    v7 = 2654435761u * (unint64_t)fmod(v10, 1.84467441e19);
    if (v11 >= 0.0)
    {
      if (v11 > 0.0)
        v7 += (unint64_t)v11;
    }
    else
    {
      v7 -= (unint64_t)fabs(v11);
    }
  }
  else
  {
    v7 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  v6 = v4;
  if (*((_QWORD *)v4 + 3))
  {
    -[APPBConfiguration setBundleId:](self, "setBundleId:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 40);
  if ((v5 & 2) != 0)
  {
    self->_requestType = *((_DWORD *)v4 + 8);
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)v4 + 40);
  }
  if ((v5 & 4) != 0)
  {
    self->_isTest = *((_BYTE *)v4 + 36);
    *(_BYTE *)&self->_has |= 4u;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[APPBConfiguration setBaseUrl:](self, "setBaseUrl:");
    v4 = v6;
  }
  if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
    self->_expirationDate = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
  objc_storeStrong((id *)&self->_bundleId, a3);
}

- (int)requestType
{
  return self->_requestType;
}

- (BOOL)isTest
{
  return self->_isTest;
}

- (NSString)baseUrl
{
  return self->_baseUrl;
}

- (void)setBaseUrl:(id)a3
{
  objc_storeStrong((id *)&self->_baseUrl, a3);
}

- (double)expirationDate
{
  return self->_expirationDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_baseUrl, 0);
}

@end
