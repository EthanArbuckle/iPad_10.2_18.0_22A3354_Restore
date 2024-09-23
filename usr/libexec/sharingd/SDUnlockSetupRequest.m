@implementation SDUnlockSetupRequest

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

- (BOOL)hasLongTermKey
{
  return self->_longTermKey != 0;
}

- (BOOL)hasLtkHash
{
  return self->_ltkHash != 0;
}

- (void)setRemoteNeedsLTK:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_remoteNeedsLTK = a3;
}

- (void)setHasRemoteNeedsLTK:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasRemoteNeedsLTK
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
  v8.super_class = (Class)SDUnlockSetupRequest;
  v3 = -[SDUnlockSetupRequest description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSetupRequest dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v6;
  NSData *longTermKey;
  NSData *ltkHash;
  void *v9;

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
  longTermKey = self->_longTermKey;
  if (longTermKey)
    objc_msgSend(v3, "setObject:forKey:", longTermKey, CFSTR("longTermKey"));
  ltkHash = self->_ltkHash;
  if (ltkHash)
    objc_msgSend(v3, "setObject:forKey:", ltkHash, CFSTR("ltkHash"));
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_remoteNeedsLTK));
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("remoteNeedsLTK"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SDUnlockSetupRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  NSData *longTermKey;
  NSData *ltkHash;
  id v7;

  v7 = a3;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field(v7, self->_version, 1);
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
    PBDataWriterWriteUint32Field(v7, self->_sessionID, 2);
  longTermKey = self->_longTermKey;
  if (longTermKey)
    PBDataWriterWriteDataField(v7, longTermKey, 3);
  ltkHash = self->_ltkHash;
  if (ltkHash)
    PBDataWriterWriteDataField(v7, ltkHash, 4);
  if ((*(_BYTE *)&self->_has & 4) != 0)
    PBDataWriterWriteBOOLField(v7, self->_remoteNeedsLTK, 5);

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
    v4[7] = self->_version;
    *((_BYTE *)v4 + 36) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    v4[6] = self->_sessionID;
    *((_BYTE *)v4 + 36) |= 1u;
  }
  v6 = v4;
  if (self->_longTermKey)
  {
    objc_msgSend(v4, "setLongTermKey:");
    v4 = v6;
  }
  if (self->_ltkHash)
  {
    objc_msgSend(v6, "setLtkHash:");
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *((_BYTE *)v4 + 32) = self->_remoteNeedsLTK;
    *((_BYTE *)v4 + 36) |= 4u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _DWORD *v5;
  _QWORD *v6;
  char has;
  id v8;
  void *v9;
  id v10;
  void *v11;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5[7] = self->_version;
    *((_BYTE *)v5 + 36) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    v5[6] = self->_sessionID;
    *((_BYTE *)v5 + 36) |= 1u;
  }
  v8 = -[NSData copyWithZone:](self->_longTermKey, "copyWithZone:", a3);
  v9 = (void *)v6[1];
  v6[1] = v8;

  v10 = -[NSData copyWithZone:](self->_ltkHash, "copyWithZone:", a3);
  v11 = (void *)v6[2];
  v6[2] = v10;

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *((_BYTE *)v6 + 32) = self->_remoteNeedsLTK;
    *((_BYTE *)v6 + 36) |= 4u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  NSData *longTermKey;
  NSData *ltkHash;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
    goto LABEL_18;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 2) == 0 || self->_version != *((_DWORD *)v4 + 7))
      goto LABEL_18;
  }
  else if ((*((_BYTE *)v4 + 36) & 2) != 0)
  {
    goto LABEL_18;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 1) == 0 || self->_sessionID != *((_DWORD *)v4 + 6))
      goto LABEL_18;
  }
  else if ((*((_BYTE *)v4 + 36) & 1) != 0)
  {
    goto LABEL_18;
  }
  longTermKey = self->_longTermKey;
  if ((unint64_t)longTermKey | *((_QWORD *)v4 + 1) && !-[NSData isEqual:](longTermKey, "isEqual:"))
    goto LABEL_18;
  ltkHash = self->_ltkHash;
  if ((unint64_t)ltkHash | *((_QWORD *)v4 + 2))
  {
    if (!-[NSData isEqual:](ltkHash, "isEqual:"))
      goto LABEL_18;
  }
  v8 = (*((_BYTE *)v4 + 36) & 4) == 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 4) == 0)
    {
LABEL_18:
      v8 = 0;
      goto LABEL_19;
    }
    if (self->_remoteNeedsLTK)
    {
      if (!*((_BYTE *)v4 + 32))
        goto LABEL_18;
    }
    else if (*((_BYTE *)v4 + 32))
    {
      goto LABEL_18;
    }
    v8 = 1;
  }
LABEL_19:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;

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
  v5 = (unint64_t)-[NSData hash](self->_longTermKey, "hash");
  v6 = (unint64_t)-[NSData hash](self->_ltkHash, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
    v7 = 2654435761 * self->_remoteNeedsLTK;
  else
    v7 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 36);
  if ((v5 & 2) != 0)
  {
    self->_version = *((_DWORD *)v4 + 7);
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)v4 + 36);
  }
  if ((v5 & 1) != 0)
  {
    self->_sessionID = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 1u;
  }
  v6 = v4;
  if (*((_QWORD *)v4 + 1))
  {
    -[SDUnlockSetupRequest setLongTermKey:](self, "setLongTermKey:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[SDUnlockSetupRequest setLtkHash:](self, "setLtkHash:");
    v4 = v6;
  }
  if ((*((_BYTE *)v4 + 36) & 4) != 0)
  {
    self->_remoteNeedsLTK = *((_BYTE *)v4 + 32);
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

- (NSData)longTermKey
{
  return self->_longTermKey;
}

- (void)setLongTermKey:(id)a3
{
  objc_storeStrong((id *)&self->_longTermKey, a3);
}

- (NSData)ltkHash
{
  return self->_ltkHash;
}

- (void)setLtkHash:(id)a3
{
  objc_storeStrong((id *)&self->_ltkHash, a3);
}

- (BOOL)remoteNeedsLTK
{
  return self->_remoteNeedsLTK;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ltkHash, 0);
  objc_storeStrong((id *)&self->_longTermKey, 0);
}

@end
