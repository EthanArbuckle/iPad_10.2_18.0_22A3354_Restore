@implementation SDUnlockSessionKeyExchangeRequest

- (void)setVersion:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasVersion
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setSessionID:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_sessionID = a3;
}

- (void)setHasSessionID:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSessionID
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setUsingRecord:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_usingRecord = a3;
}

- (void)setHasUsingRecord:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasUsingRecord
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (BOOL)hasKey
{
  return self->_key != 0;
}

- (void)setErrorCode:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_errorCode = a3;
}

- (void)setHasErrorCode:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasErrorCode
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
  v8.super_class = (Class)SDUnlockSessionKeyExchangeRequest;
  v3 = -[SDUnlockSessionKeyExchangeRequest description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionKeyExchangeRequest dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  NSData *key;
  void *v7;
  void *v9;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_version));
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("version"));

    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_sessionID));
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("sessionID"));

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_4:
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_usingRecord));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("usingRecord"));

  }
LABEL_5:
  key = self->_key;
  if (key)
    objc_msgSend(v3, "setObject:forKey:", key, CFSTR("key"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_errorCode));
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("errorCode"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SDUnlockSessionKeyExchangeRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  NSData *key;
  id v6;

  v6 = a3;
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint32Field(v6, self->_version, 1);
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field(v6, self->_sessionID, 2);
  if ((*(_BYTE *)&self->_has & 8) != 0)
LABEL_4:
    PBDataWriterWriteBOOLField(v6, self->_usingRecord, 3);
LABEL_5:
  key = self->_key;
  if (key)
    PBDataWriterWriteDataField(v6, key, 4);
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint32Field(v6, self->_errorCode, 5);

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char has;
  _DWORD *v6;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v4[7] = self->_version;
    *((_BYTE *)v4 + 36) |= 4u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  v4[6] = self->_sessionID;
  *((_BYTE *)v4 + 36) |= 2u;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_4:
    *((_BYTE *)v4 + 32) = self->_usingRecord;
    *((_BYTE *)v4 + 36) |= 8u;
  }
LABEL_5:
  if (self->_key)
  {
    v6 = v4;
    objc_msgSend(v4, "setKey:");
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[2] = self->_errorCode;
    *((_BYTE *)v4 + 36) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _DWORD *v5;
  _QWORD *v6;
  char has;
  id v8;
  void *v9;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v5[7] = self->_version;
    *((_BYTE *)v5 + 36) |= 4u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  v5[6] = self->_sessionID;
  *((_BYTE *)v5 + 36) |= 2u;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_4:
    *((_BYTE *)v5 + 32) = self->_usingRecord;
    *((_BYTE *)v5 + 36) |= 8u;
  }
LABEL_5:
  v8 = -[NSData copyWithZone:](self->_key, "copyWithZone:", a3);
  v9 = (void *)v6[2];
  v6[2] = v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v6 + 2) = self->_errorCode;
    *((_BYTE *)v6 + 36) |= 1u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  char has;
  NSData *key;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
    goto LABEL_27;
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 4) == 0 || self->_version != *((_DWORD *)v4 + 7))
      goto LABEL_27;
  }
  else if ((*((_BYTE *)v4 + 36) & 4) != 0)
  {
    goto LABEL_27;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 2) == 0 || self->_sessionID != *((_DWORD *)v4 + 6))
      goto LABEL_27;
  }
  else if ((*((_BYTE *)v4 + 36) & 2) != 0)
  {
    goto LABEL_27;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 8) == 0)
      goto LABEL_27;
    if (self->_usingRecord)
    {
      if (!*((_BYTE *)v4 + 32))
        goto LABEL_27;
    }
    else if (*((_BYTE *)v4 + 32))
    {
      goto LABEL_27;
    }
  }
  else if ((*((_BYTE *)v4 + 36) & 8) != 0)
  {
    goto LABEL_27;
  }
  key = self->_key;
  if (!((unint64_t)key | *((_QWORD *)v4 + 2)))
    goto LABEL_23;
  if (!-[NSData isEqual:](key, "isEqual:"))
  {
LABEL_27:
    v8 = 0;
    goto LABEL_28;
  }
  has = (char)self->_has;
LABEL_23:
  v8 = (*((_BYTE *)v4 + 36) & 1) == 0;
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 1) == 0 || self->_errorCode != *((_DWORD *)v4 + 2))
      goto LABEL_27;
    v8 = 1;
  }
LABEL_28:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;

  if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_6:
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_4;
    goto LABEL_7;
  }
  v3 = 2654435761 * self->_version;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v4 = 2654435761 * self->_sessionID;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_4:
    v5 = 2654435761 * self->_usingRecord;
    goto LABEL_8;
  }
LABEL_7:
  v5 = 0;
LABEL_8:
  v6 = (unint64_t)-[NSData hash](self->_key, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v7 = 2654435761 * self->_errorCode;
  else
    v7 = 0;
  return v4 ^ v3 ^ v5 ^ v7 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 36);
  if ((v5 & 4) != 0)
  {
    self->_version = *((_DWORD *)v4 + 7);
    *(_BYTE *)&self->_has |= 4u;
    v5 = *((_BYTE *)v4 + 36);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 8) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*((_BYTE *)v4 + 36) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_sessionID = *((_DWORD *)v4 + 6);
  *(_BYTE *)&self->_has |= 2u;
  if ((*((_BYTE *)v4 + 36) & 8) != 0)
  {
LABEL_4:
    self->_usingRecord = *((_BYTE *)v4 + 32);
    *(_BYTE *)&self->_has |= 8u;
  }
LABEL_5:
  if (*((_QWORD *)v4 + 2))
  {
    v6 = v4;
    -[SDUnlockSessionKeyExchangeRequest setKey:](self, "setKey:");
    v4 = v6;
  }
  if ((*((_BYTE *)v4 + 36) & 1) != 0)
  {
    self->_errorCode = *((_DWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (unsigned)version
{
  return self->_version;
}

- (unsigned)sessionID
{
  return self->_sessionID;
}

- (BOOL)usingRecord
{
  return self->_usingRecord;
}

- (NSData)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
  objc_storeStrong((id *)&self->_key, a3);
}

- (unsigned)errorCode
{
  return self->_errorCode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
}

@end
