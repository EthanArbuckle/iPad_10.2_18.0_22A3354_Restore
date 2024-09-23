@implementation SDUnlockSetupSessionCreated

- (void)setVersion:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasVersion
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setSessionID:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_sessionID = a3;
}

- (void)setHasSessionID:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSessionID
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasToken
{
  return self->_token != 0;
}

- (BOOL)hasLongTermKey
{
  return self->_longTermKey != 0;
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

- (void)setFailureReasons:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_failureReasons = a3;
}

- (void)setHasFailureReasons:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasFailureReasons
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setLtkSyncing:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_ltkSyncing = a3;
}

- (void)setHasLtkSyncing:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasLtkSyncing
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setWatchOldLTKSyncStatus:(int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_watchOldLTKSyncStatus = a3;
}

- (void)setHasWatchOldLTKSyncStatus:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasWatchOldLTKSyncStatus
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setWatchNewLTKSyncStatus:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_watchNewLTKSyncStatus = a3;
}

- (void)setHasWatchNewLTKSyncStatus:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasWatchNewLTKSyncStatus
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (BOOL)hasLtkHash
{
  return self->_ltkHash != 0;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SDUnlockSetupSessionCreated;
  v3 = -[SDUnlockSetupSessionCreated description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSetupSessionCreated dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v6;
  NSData *token;
  NSData *longTermKey;
  char v9;
  void *v10;
  NSData *ltkHash;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_version));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("version"));

    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_sessionID));
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("sessionID"));

  }
  token = self->_token;
  if (token)
    objc_msgSend(v3, "setObject:forKey:", token, CFSTR("token"));
  longTermKey = self->_longTermKey;
  if (longTermKey)
    objc_msgSend(v3, "setObject:forKey:", longTermKey, CFSTR("longTermKey"));
  v9 = (char)self->_has;
  if ((v9 & 1) != 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_errorCode));
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("errorCode"));

    v9 = (char)self->_has;
    if ((v9 & 2) == 0)
    {
LABEL_11:
      if ((v9 & 0x40) == 0)
        goto LABEL_12;
      goto LABEL_20;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_11;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_failureReasons));
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("failureReasons"));

  v9 = (char)self->_has;
  if ((v9 & 0x40) == 0)
  {
LABEL_12:
    if ((v9 & 0x20) == 0)
      goto LABEL_13;
    goto LABEL_21;
  }
LABEL_20:
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_ltkSyncing));
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("ltkSyncing"));

  v9 = (char)self->_has;
  if ((v9 & 0x20) == 0)
  {
LABEL_13:
    if ((v9 & 0x10) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
LABEL_21:
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_watchOldLTKSyncStatus));
  objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("watchOldLTKSyncStatus"));

  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_14:
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_watchNewLTKSyncStatus));
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("watchNewLTKSyncStatus"));

  }
LABEL_15:
  ltkHash = self->_ltkHash;
  if (ltkHash)
    objc_msgSend(v3, "setObject:forKey:", ltkHash, CFSTR("ltkHash"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SDUnlockSetupSessionCreatedReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  NSData *token;
  NSData *longTermKey;
  char v8;
  NSData *ltkHash;
  id v10;

  v4 = a3;
  has = (char)self->_has;
  v10 = v4;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteUint32Field(v4, self->_version, 1);
    v4 = v10;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint32Field(v10, self->_sessionID, 2);
    v4 = v10;
  }
  token = self->_token;
  if (token)
  {
    PBDataWriterWriteDataField(v10, token, 3);
    v4 = v10;
  }
  longTermKey = self->_longTermKey;
  if (longTermKey)
  {
    PBDataWriterWriteDataField(v10, longTermKey, 4);
    v4 = v10;
  }
  v8 = (char)self->_has;
  if ((v8 & 1) != 0)
  {
    PBDataWriterWriteUint32Field(v10, self->_errorCode, 5);
    v4 = v10;
    v8 = (char)self->_has;
    if ((v8 & 2) == 0)
    {
LABEL_11:
      if ((v8 & 0x40) == 0)
        goto LABEL_12;
      goto LABEL_20;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_11;
  }
  PBDataWriterWriteUint32Field(v10, self->_failureReasons, 6);
  v4 = v10;
  v8 = (char)self->_has;
  if ((v8 & 0x40) == 0)
  {
LABEL_12:
    if ((v8 & 0x20) == 0)
      goto LABEL_13;
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteBOOLField(v10, self->_ltkSyncing, 7);
  v4 = v10;
  v8 = (char)self->_has;
  if ((v8 & 0x20) == 0)
  {
LABEL_13:
    if ((v8 & 0x10) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
LABEL_21:
  PBDataWriterWriteInt32Field(v10, self->_watchOldLTKSyncStatus, 8);
  v4 = v10;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_14:
    PBDataWriterWriteInt32Field(v10, self->_watchNewLTKSyncStatus, 9);
    v4 = v10;
  }
LABEL_15:
  ltkHash = self->_ltkHash;
  if (ltkHash)
  {
    PBDataWriterWriteDataField(v10, ltkHash, 10);
    v4 = v10;
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char has;
  char v6;
  _DWORD *v7;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v4[12] = self->_version;
    *((_BYTE *)v4 + 64) |= 8u;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    v4[8] = self->_sessionID;
    *((_BYTE *)v4 + 64) |= 4u;
  }
  v7 = v4;
  if (self->_token)
  {
    objc_msgSend(v4, "setToken:");
    v4 = v7;
  }
  if (self->_longTermKey)
  {
    objc_msgSend(v7, "setLongTermKey:");
    v4 = v7;
  }
  v6 = (char)self->_has;
  if ((v6 & 1) != 0)
  {
    v4[2] = self->_errorCode;
    *((_BYTE *)v4 + 64) |= 1u;
    v6 = (char)self->_has;
    if ((v6 & 2) == 0)
    {
LABEL_11:
      if ((v6 & 0x40) == 0)
        goto LABEL_12;
      goto LABEL_20;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_11;
  }
  v4[3] = self->_failureReasons;
  *((_BYTE *)v4 + 64) |= 2u;
  v6 = (char)self->_has;
  if ((v6 & 0x40) == 0)
  {
LABEL_12:
    if ((v6 & 0x20) == 0)
      goto LABEL_13;
    goto LABEL_21;
  }
LABEL_20:
  *((_BYTE *)v4 + 60) = self->_ltkSyncing;
  *((_BYTE *)v4 + 64) |= 0x40u;
  v6 = (char)self->_has;
  if ((v6 & 0x20) == 0)
  {
LABEL_13:
    if ((v6 & 0x10) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
LABEL_21:
  v4[14] = self->_watchOldLTKSyncStatus;
  *((_BYTE *)v4 + 64) |= 0x20u;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_14:
    v4[13] = self->_watchNewLTKSyncStatus;
    *((_BYTE *)v4 + 64) |= 0x10u;
  }
LABEL_15:
  if (self->_ltkHash)
  {
    objc_msgSend(v7, "setLtkHash:");
    v4 = v7;
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
  char v12;
  id v13;
  void *v14;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v5[12] = self->_version;
    *((_BYTE *)v5 + 64) |= 8u;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    v5[8] = self->_sessionID;
    *((_BYTE *)v5 + 64) |= 4u;
  }
  v8 = -[NSData copyWithZone:](self->_token, "copyWithZone:", a3);
  v9 = (void *)v6[5];
  v6[5] = v8;

  v10 = -[NSData copyWithZone:](self->_longTermKey, "copyWithZone:", a3);
  v11 = (void *)v6[2];
  v6[2] = v10;

  v12 = (char)self->_has;
  if ((v12 & 1) != 0)
  {
    *((_DWORD *)v6 + 2) = self->_errorCode;
    *((_BYTE *)v6 + 64) |= 1u;
    v12 = (char)self->_has;
    if ((v12 & 2) == 0)
    {
LABEL_7:
      if ((v12 & 0x40) == 0)
        goto LABEL_8;
      goto LABEL_14;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }
  *((_DWORD *)v6 + 3) = self->_failureReasons;
  *((_BYTE *)v6 + 64) |= 2u;
  v12 = (char)self->_has;
  if ((v12 & 0x40) == 0)
  {
LABEL_8:
    if ((v12 & 0x20) == 0)
      goto LABEL_9;
LABEL_15:
    *((_DWORD *)v6 + 14) = self->_watchOldLTKSyncStatus;
    *((_BYTE *)v6 + 64) |= 0x20u;
    if ((*(_BYTE *)&self->_has & 0x10) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_14:
  *((_BYTE *)v6 + 60) = self->_ltkSyncing;
  *((_BYTE *)v6 + 64) |= 0x40u;
  v12 = (char)self->_has;
  if ((v12 & 0x20) != 0)
    goto LABEL_15;
LABEL_9:
  if ((v12 & 0x10) != 0)
  {
LABEL_10:
    *((_DWORD *)v6 + 13) = self->_watchNewLTKSyncStatus;
    *((_BYTE *)v6 + 64) |= 0x10u;
  }
LABEL_11:
  v13 = -[NSData copyWithZone:](self->_ltkHash, "copyWithZone:", a3);
  v14 = (void *)v6[3];
  v6[3] = v13;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  NSData *token;
  NSData *longTermKey;
  NSData *ltkHash;
  unsigned __int8 v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
    goto LABEL_46;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 8) == 0 || self->_version != *((_DWORD *)v4 + 12))
      goto LABEL_46;
  }
  else if ((*((_BYTE *)v4 + 64) & 8) != 0)
  {
    goto LABEL_46;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 4) == 0 || self->_sessionID != *((_DWORD *)v4 + 8))
      goto LABEL_46;
  }
  else if ((*((_BYTE *)v4 + 64) & 4) != 0)
  {
    goto LABEL_46;
  }
  token = self->_token;
  if ((unint64_t)token | *((_QWORD *)v4 + 5) && !-[NSData isEqual:](token, "isEqual:"))
    goto LABEL_46;
  longTermKey = self->_longTermKey;
  if ((unint64_t)longTermKey | *((_QWORD *)v4 + 2))
  {
    if (!-[NSData isEqual:](longTermKey, "isEqual:"))
      goto LABEL_46;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 1) == 0 || self->_errorCode != *((_DWORD *)v4 + 2))
      goto LABEL_46;
  }
  else if ((*((_BYTE *)v4 + 64) & 1) != 0)
  {
    goto LABEL_46;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 2) == 0 || self->_failureReasons != *((_DWORD *)v4 + 3))
      goto LABEL_46;
  }
  else if ((*((_BYTE *)v4 + 64) & 2) != 0)
  {
    goto LABEL_46;
  }
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 0x40) != 0)
    {
      if (self->_ltkSyncing)
      {
        if (!*((_BYTE *)v4 + 60))
          goto LABEL_46;
        goto LABEL_34;
      }
      if (!*((_BYTE *)v4 + 60))
        goto LABEL_34;
    }
LABEL_46:
    v9 = 0;
    goto LABEL_47;
  }
  if ((*((_BYTE *)v4 + 64) & 0x40) != 0)
    goto LABEL_46;
LABEL_34:
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 0x20) == 0 || self->_watchOldLTKSyncStatus != *((_DWORD *)v4 + 14))
      goto LABEL_46;
  }
  else if ((*((_BYTE *)v4 + 64) & 0x20) != 0)
  {
    goto LABEL_46;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 0x10) == 0 || self->_watchNewLTKSyncStatus != *((_DWORD *)v4 + 13))
      goto LABEL_46;
  }
  else if ((*((_BYTE *)v4 + 64) & 0x10) != 0)
  {
    goto LABEL_46;
  }
  ltkHash = self->_ltkHash;
  if ((unint64_t)ltkHash | *((_QWORD *)v4 + 3))
    v9 = -[NSData isEqual:](ltkHash, "isEqual:");
  else
    v9 = 1;
LABEL_47:

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    v3 = 2654435761 * self->_version;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_3;
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_sessionID;
      goto LABEL_6;
    }
  }
  v4 = 0;
LABEL_6:
  v5 = (unint64_t)-[NSData hash](self->_token, "hash");
  v6 = (unint64_t)-[NSData hash](self->_longTermKey, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v7 = 2654435761 * self->_errorCode;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_8:
      v8 = 2654435761 * self->_failureReasons;
      if ((*(_BYTE *)&self->_has & 0x40) != 0)
        goto LABEL_9;
      goto LABEL_14;
    }
  }
  else
  {
    v7 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_8;
  }
  v8 = 0;
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
LABEL_9:
    v9 = 2654435761 * self->_ltkSyncing;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
      goto LABEL_10;
LABEL_15:
    v10 = 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_11;
LABEL_16:
    v11 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ (unint64_t)-[NSData hash](self->_ltkHash, "hash");
  }
LABEL_14:
  v9 = 0;
  if ((*(_BYTE *)&self->_has & 0x20) == 0)
    goto LABEL_15;
LABEL_10:
  v10 = 2654435761 * self->_watchOldLTKSyncStatus;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    goto LABEL_16;
LABEL_11:
  v11 = 2654435761 * self->_watchNewLTKSyncStatus;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ (unint64_t)-[NSData hash](self->_ltkHash, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  char v6;
  id v7;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 64);
  if ((v5 & 8) != 0)
  {
    self->_version = *((_DWORD *)v4 + 12);
    *(_BYTE *)&self->_has |= 8u;
    v5 = *((_BYTE *)v4 + 64);
  }
  if ((v5 & 4) != 0)
  {
    self->_sessionID = *((_DWORD *)v4 + 8);
    *(_BYTE *)&self->_has |= 4u;
  }
  v7 = v4;
  if (*((_QWORD *)v4 + 5))
  {
    -[SDUnlockSetupSessionCreated setToken:](self, "setToken:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[SDUnlockSetupSessionCreated setLongTermKey:](self, "setLongTermKey:");
    v4 = v7;
  }
  v6 = *((_BYTE *)v4 + 64);
  if ((v6 & 1) != 0)
  {
    self->_errorCode = *((_DWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
    v6 = *((_BYTE *)v4 + 64);
    if ((v6 & 2) == 0)
    {
LABEL_11:
      if ((v6 & 0x40) == 0)
        goto LABEL_12;
      goto LABEL_20;
    }
  }
  else if ((*((_BYTE *)v4 + 64) & 2) == 0)
  {
    goto LABEL_11;
  }
  self->_failureReasons = *((_DWORD *)v4 + 3);
  *(_BYTE *)&self->_has |= 2u;
  v6 = *((_BYTE *)v4 + 64);
  if ((v6 & 0x40) == 0)
  {
LABEL_12:
    if ((v6 & 0x20) == 0)
      goto LABEL_13;
    goto LABEL_21;
  }
LABEL_20:
  self->_ltkSyncing = *((_BYTE *)v4 + 60);
  *(_BYTE *)&self->_has |= 0x40u;
  v6 = *((_BYTE *)v4 + 64);
  if ((v6 & 0x20) == 0)
  {
LABEL_13:
    if ((v6 & 0x10) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
LABEL_21:
  self->_watchOldLTKSyncStatus = *((_DWORD *)v4 + 14);
  *(_BYTE *)&self->_has |= 0x20u;
  if ((*((_BYTE *)v4 + 64) & 0x10) != 0)
  {
LABEL_14:
    self->_watchNewLTKSyncStatus = *((_DWORD *)v4 + 13);
    *(_BYTE *)&self->_has |= 0x10u;
  }
LABEL_15:
  if (*((_QWORD *)v4 + 3))
  {
    -[SDUnlockSetupSessionCreated setLtkHash:](self, "setLtkHash:");
    v4 = v7;
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

- (NSData)token
{
  return self->_token;
}

- (void)setToken:(id)a3
{
  objc_storeStrong((id *)&self->_token, a3);
}

- (NSData)longTermKey
{
  return self->_longTermKey;
}

- (void)setLongTermKey:(id)a3
{
  objc_storeStrong((id *)&self->_longTermKey, a3);
}

- (unsigned)errorCode
{
  return self->_errorCode;
}

- (unsigned)failureReasons
{
  return self->_failureReasons;
}

- (BOOL)ltkSyncing
{
  return self->_ltkSyncing;
}

- (int)watchOldLTKSyncStatus
{
  return self->_watchOldLTKSyncStatus;
}

- (int)watchNewLTKSyncStatus
{
  return self->_watchNewLTKSyncStatus;
}

- (NSData)ltkHash
{
  return self->_ltkHash;
}

- (void)setLtkHash:(id)a3
{
  objc_storeStrong((id *)&self->_ltkHash, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_ltkHash, 0);
  objc_storeStrong((id *)&self->_longTermKey, 0);
}

@end
