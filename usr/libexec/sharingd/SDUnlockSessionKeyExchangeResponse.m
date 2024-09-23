@implementation SDUnlockSessionKeyExchangeResponse

- (void)setVersion:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasVersion
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setSessionID:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_sessionID = a3;
}

- (void)setHasSessionID:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSessionID
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasKey
{
  return self->_key != 0;
}

- (void)setKeyFailed:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_keyFailed = a3;
}

- (void)setHasKeyFailed:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasKeyFailed
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
  v8.super_class = (Class)SDUnlockSessionKeyExchangeResponse;
  v3 = -[SDUnlockSessionKeyExchangeResponse description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionKeyExchangeResponse dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v6;
  NSData *key;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_version));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("version"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_sessionID));
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("sessionID"));

  }
  key = self->_key;
  if (key)
    objc_msgSend(v3, "setObject:forKey:", key, CFSTR("key"));
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_keyFailed));
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("keyFailed"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SDUnlockSessionKeyExchangeResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  NSData *key;
  id v6;

  v6 = a3;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field(v6, self->_version, 1);
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
    PBDataWriterWriteUint32Field(v6, self->_sessionID, 2);
  key = self->_key;
  if (key)
    PBDataWriterWriteDataField(v6, key, 3);
  if ((*(_BYTE *)&self->_has & 4) != 0)
    PBDataWriterWriteBOOLField(v6, self->_keyFailed, 4);

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char has;
  _DWORD *v6;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[5] = self->_version;
    *((_BYTE *)v4 + 28) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    v4[4] = self->_sessionID;
    *((_BYTE *)v4 + 28) |= 1u;
  }
  if (self->_key)
  {
    v6 = v4;
    objc_msgSend(v4, "setKey:");
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *((_BYTE *)v4 + 24) = self->_keyFailed;
    *((_BYTE *)v4 + 28) |= 4u;
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
  if ((has & 2) != 0)
  {
    v5[5] = self->_version;
    *((_BYTE *)v5 + 28) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    v5[4] = self->_sessionID;
    *((_BYTE *)v5 + 28) |= 1u;
  }
  v8 = -[NSData copyWithZone:](self->_key, "copyWithZone:", a3);
  v9 = (void *)v6[1];
  v6[1] = v8;

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *((_BYTE *)v6 + 24) = self->_keyFailed;
    *((_BYTE *)v6 + 28) |= 4u;
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
    goto LABEL_17;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 2) == 0 || self->_version != *((_DWORD *)v4 + 5))
      goto LABEL_17;
  }
  else if ((*((_BYTE *)v4 + 28) & 2) != 0)
  {
    goto LABEL_17;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) == 0 || self->_sessionID != *((_DWORD *)v4 + 4))
      goto LABEL_17;
  }
  else if ((*((_BYTE *)v4 + 28) & 1) != 0)
  {
    goto LABEL_17;
  }
  key = self->_key;
  if ((unint64_t)key | *((_QWORD *)v4 + 1))
  {
    if (!-[NSData isEqual:](key, "isEqual:"))
      goto LABEL_17;
    has = (char)self->_has;
  }
  v8 = (*((_BYTE *)v4 + 28) & 4) == 0;
  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 4) != 0)
    {
      if (self->_keyFailed)
      {
        if (!*((_BYTE *)v4 + 24))
          goto LABEL_17;
      }
      else if (*((_BYTE *)v4 + 24))
      {
        goto LABEL_17;
      }
      v8 = 1;
      goto LABEL_18;
    }
LABEL_17:
    v8 = 0;
  }
LABEL_18:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v3 = 2654435761 * self->_version;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_sessionID;
      goto LABEL_6;
    }
  }
  v4 = 0;
LABEL_6:
  v5 = (unint64_t)-[NSData hash](self->_key, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
    v6 = 2654435761 * self->_keyFailed;
  else
    v6 = 0;
  return v4 ^ v3 ^ v6 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 28);
  if ((v5 & 2) != 0)
  {
    self->_version = *((_DWORD *)v4 + 5);
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)v4 + 28);
  }
  if ((v5 & 1) != 0)
  {
    self->_sessionID = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 1))
  {
    v6 = v4;
    -[SDUnlockSessionKeyExchangeResponse setKey:](self, "setKey:");
    v4 = v6;
  }
  if ((*((_BYTE *)v4 + 28) & 4) != 0)
  {
    self->_keyFailed = *((_BYTE *)v4 + 24);
    *(_BYTE *)&self->_has |= 4u;
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

- (NSData)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
  objc_storeStrong((id *)&self->_key, a3);
}

- (BOOL)keyFailed
{
  return self->_keyFailed;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
}

@end
