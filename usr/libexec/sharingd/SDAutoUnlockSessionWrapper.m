@implementation SDAutoUnlockSessionWrapper

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

- (BOOL)hasSessionID
{
  return self->_sessionID != 0;
}

- (BOOL)hasPayload
{
  return self->_payload != 0;
}

- (void)setMessageType:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_messageType = a3;
}

- (void)setHasMessageType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasMessageType
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasSenderID
{
  return self->_senderID != 0;
}

- (void)setUseProxy:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_useProxy = a3;
}

- (void)setHasUseProxy:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasUseProxy
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setAwdlCacheID:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_awdlCacheID = a3;
}

- (void)setHasAwdlCacheID:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasAwdlCacheID
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setAksSessionID:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_aksSessionID = a3;
}

- (void)setHasAksSessionID:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAksSessionID
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasEncryptedPayload
{
  return self->_encryptedPayload != 0;
}

- (BOOL)hasAuthTag
{
  return self->_authTag != 0;
}

- (BOOL)hasNonce
{
  return self->_nonce != 0;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SDAutoUnlockSessionWrapper;
  v3 = -[SDAutoUnlockSessionWrapper description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionWrapper dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *sessionID;
  NSData *payload;
  void *v7;
  NSData *senderID;
  char has;
  void *v10;
  NSData *encryptedPayload;
  NSData *authTag;
  NSData *nonce;
  void *v15;
  void *v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_version));
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("version"));

  }
  sessionID = self->_sessionID;
  if (sessionID)
    objc_msgSend(v3, "setObject:forKey:", sessionID, CFSTR("sessionID"));
  payload = self->_payload;
  if (payload)
    objc_msgSend(v3, "setObject:forKey:", payload, CFSTR("payload"));
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_messageType));
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("messageType"));

  }
  senderID = self->_senderID;
  if (senderID)
    objc_msgSend(v3, "setObject:forKey:", senderID, CFSTR("senderID"));
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_useProxy));
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("useProxy"));

    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_13:
      if ((has & 1) == 0)
        goto LABEL_15;
      goto LABEL_14;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_13;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_awdlCacheID));
  objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("awdlCacheID"));

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_14:
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_aksSessionID));
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("aksSessionID"));

  }
LABEL_15:
  encryptedPayload = self->_encryptedPayload;
  if (encryptedPayload)
    objc_msgSend(v3, "setObject:forKey:", encryptedPayload, CFSTR("encryptedPayload"));
  authTag = self->_authTag;
  if (authTag)
    objc_msgSend(v3, "setObject:forKey:", authTag, CFSTR("authTag"));
  nonce = self->_nonce;
  if (nonce)
    objc_msgSend(v3, "setObject:forKey:", nonce, CFSTR("nonce"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SDAutoUnlockSessionWrapperReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSData *sessionID;
  NSData *payload;
  NSData *senderID;
  char has;
  NSData *encryptedPayload;
  NSData *authTag;
  NSData *nonce;
  id v12;

  v4 = a3;
  v12 = v4;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    PBDataWriterWriteUint32Field(v4, self->_version, 1);
    v4 = v12;
  }
  sessionID = self->_sessionID;
  if (sessionID)
  {
    PBDataWriterWriteDataField(v12, sessionID, 2);
    v4 = v12;
  }
  payload = self->_payload;
  if (payload)
  {
    PBDataWriterWriteDataField(v12, payload, 3);
    v4 = v12;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    PBDataWriterWriteUint32Field(v12, self->_messageType, 4);
    v4 = v12;
  }
  senderID = self->_senderID;
  if (senderID)
  {
    PBDataWriterWriteDataField(v12, senderID, 5);
    v4 = v12;
  }
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteBOOLField(v12, self->_useProxy, 6);
    v4 = v12;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_13:
      if ((has & 1) == 0)
        goto LABEL_15;
      goto LABEL_14;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_13;
  }
  PBDataWriterWriteUint32Field(v12, self->_awdlCacheID, 7);
  v4 = v12;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_14:
    PBDataWriterWriteUint32Field(v12, self->_aksSessionID, 8);
    v4 = v12;
  }
LABEL_15:
  encryptedPayload = self->_encryptedPayload;
  if (encryptedPayload)
  {
    PBDataWriterWriteDataField(v12, encryptedPayload, 9);
    v4 = v12;
  }
  authTag = self->_authTag;
  if (authTag)
  {
    PBDataWriterWriteDataField(v12, authTag, 10);
    v4 = v12;
  }
  nonce = self->_nonce;
  if (nonce)
  {
    PBDataWriterWriteDataField(v12, nonce, 11);
    v4 = v12;
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char has;
  _DWORD *v6;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    v4[20] = self->_version;
    *((_BYTE *)v4 + 88) |= 8u;
  }
  v6 = v4;
  if (self->_sessionID)
  {
    objc_msgSend(v4, "setSessionID:");
    v4 = v6;
  }
  if (self->_payload)
  {
    objc_msgSend(v6, "setPayload:");
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v4[10] = self->_messageType;
    *((_BYTE *)v4 + 88) |= 4u;
  }
  if (self->_senderID)
  {
    objc_msgSend(v6, "setSenderID:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *((_BYTE *)v4 + 84) = self->_useProxy;
    *((_BYTE *)v4 + 88) |= 0x10u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_13:
      if ((has & 1) == 0)
        goto LABEL_15;
      goto LABEL_14;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_13;
  }
  v4[6] = self->_awdlCacheID;
  *((_BYTE *)v4 + 88) |= 2u;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_14:
    v4[2] = self->_aksSessionID;
    *((_BYTE *)v4 + 88) |= 1u;
  }
LABEL_15:
  if (self->_encryptedPayload)
  {
    objc_msgSend(v6, "setEncryptedPayload:");
    v4 = v6;
  }
  if (self->_authTag)
  {
    objc_msgSend(v6, "setAuthTag:");
    v4 = v6;
  }
  if (self->_nonce)
  {
    objc_msgSend(v6, "setNonce:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _DWORD *v5;
  _QWORD *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  char has;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    v5[20] = self->_version;
    *((_BYTE *)v5 + 88) |= 8u;
  }
  v7 = -[NSData copyWithZone:](self->_sessionID, "copyWithZone:", a3);
  v8 = (void *)v6[9];
  v6[9] = v7;

  v9 = -[NSData copyWithZone:](self->_payload, "copyWithZone:", a3);
  v10 = (void *)v6[7];
  v6[7] = v9;

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *((_DWORD *)v6 + 10) = self->_messageType;
    *((_BYTE *)v6 + 88) |= 4u;
  }
  v11 = -[NSData copyWithZone:](self->_senderID, "copyWithZone:", a3);
  v12 = (void *)v6[8];
  v6[8] = v11;

  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_7;
LABEL_11:
    *((_DWORD *)v6 + 6) = self->_awdlCacheID;
    *((_BYTE *)v6 + 88) |= 2u;
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
  *((_BYTE *)v6 + 84) = self->_useProxy;
  *((_BYTE *)v6 + 88) |= 0x10u;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_11;
LABEL_7:
  if ((has & 1) != 0)
  {
LABEL_8:
    *((_DWORD *)v6 + 2) = self->_aksSessionID;
    *((_BYTE *)v6 + 88) |= 1u;
  }
LABEL_9:
  v14 = -[NSData copyWithZone:](self->_encryptedPayload, "copyWithZone:", a3);
  v15 = (void *)v6[4];
  v6[4] = v14;

  v16 = -[NSData copyWithZone:](self->_authTag, "copyWithZone:", a3);
  v17 = (void *)v6[2];
  v6[2] = v16;

  v18 = -[NSData copyWithZone:](self->_nonce, "copyWithZone:", a3);
  v19 = (void *)v6[6];
  v6[6] = v18;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  NSData *sessionID;
  NSData *payload;
  char has;
  NSData *senderID;
  NSData *encryptedPayload;
  NSData *authTag;
  NSData *nonce;
  unsigned __int8 v13;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
    goto LABEL_43;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 88) & 8) == 0 || self->_version != *((_DWORD *)v4 + 20))
      goto LABEL_43;
  }
  else if ((*((_BYTE *)v4 + 88) & 8) != 0)
  {
    goto LABEL_43;
  }
  sessionID = self->_sessionID;
  if ((unint64_t)sessionID | *((_QWORD *)v4 + 9) && !-[NSData isEqual:](sessionID, "isEqual:"))
    goto LABEL_43;
  payload = self->_payload;
  if ((unint64_t)payload | *((_QWORD *)v4 + 7))
  {
    if (!-[NSData isEqual:](payload, "isEqual:"))
      goto LABEL_43;
  }
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 88) & 4) == 0 || self->_messageType != *((_DWORD *)v4 + 10))
      goto LABEL_43;
  }
  else if ((*((_BYTE *)v4 + 88) & 4) != 0)
  {
    goto LABEL_43;
  }
  senderID = self->_senderID;
  if ((unint64_t)senderID | *((_QWORD *)v4 + 8))
  {
    if (!-[NSData isEqual:](senderID, "isEqual:"))
      goto LABEL_43;
    has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 88) & 0x10) != 0)
    {
      if (self->_useProxy)
      {
        if (!*((_BYTE *)v4 + 84))
          goto LABEL_43;
        goto LABEL_27;
      }
      if (!*((_BYTE *)v4 + 84))
        goto LABEL_27;
    }
LABEL_43:
    v13 = 0;
    goto LABEL_44;
  }
  if ((*((_BYTE *)v4 + 88) & 0x10) != 0)
    goto LABEL_43;
LABEL_27:
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 88) & 2) == 0 || self->_awdlCacheID != *((_DWORD *)v4 + 6))
      goto LABEL_43;
  }
  else if ((*((_BYTE *)v4 + 88) & 2) != 0)
  {
    goto LABEL_43;
  }
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 88) & 1) == 0 || self->_aksSessionID != *((_DWORD *)v4 + 2))
      goto LABEL_43;
  }
  else if ((*((_BYTE *)v4 + 88) & 1) != 0)
  {
    goto LABEL_43;
  }
  encryptedPayload = self->_encryptedPayload;
  if ((unint64_t)encryptedPayload | *((_QWORD *)v4 + 4)
    && !-[NSData isEqual:](encryptedPayload, "isEqual:"))
  {
    goto LABEL_43;
  }
  authTag = self->_authTag;
  if ((unint64_t)authTag | *((_QWORD *)v4 + 2))
  {
    if (!-[NSData isEqual:](authTag, "isEqual:"))
      goto LABEL_43;
  }
  nonce = self->_nonce;
  if ((unint64_t)nonce | *((_QWORD *)v4 + 6))
    v13 = -[NSData isEqual:](nonce, "isEqual:");
  else
    v13 = 1;
LABEL_44:

  return v13;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;

  if ((*(_BYTE *)&self->_has & 8) != 0)
    v3 = 2654435761 * self->_version;
  else
    v3 = 0;
  v4 = (unint64_t)-[NSData hash](self->_sessionID, "hash");
  v5 = (unint64_t)-[NSData hash](self->_payload, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
    v6 = 2654435761 * self->_messageType;
  else
    v6 = 0;
  v7 = (unint64_t)-[NSData hash](self->_senderID, "hash");
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    v8 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_9;
LABEL_12:
    v9 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_10;
LABEL_13:
    v10 = 0;
    goto LABEL_14;
  }
  v8 = 2654435761 * self->_useProxy;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_12;
LABEL_9:
  v9 = 2654435761 * self->_awdlCacheID;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_13;
LABEL_10:
  v10 = 2654435761 * self->_aksSessionID;
LABEL_14:
  v11 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  v12 = v10 ^ (unint64_t)-[NSData hash](self->_encryptedPayload, "hash");
  v13 = v12 ^ (unint64_t)-[NSData hash](self->_authTag, "hash");
  return v11 ^ v13 ^ (unint64_t)-[NSData hash](self->_nonce, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  if ((*((_BYTE *)v4 + 88) & 8) != 0)
  {
    self->_version = *((_DWORD *)v4 + 20);
    *(_BYTE *)&self->_has |= 8u;
  }
  v6 = v4;
  if (*((_QWORD *)v4 + 9))
  {
    -[SDAutoUnlockSessionWrapper setSessionID:](self, "setSessionID:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 7))
  {
    -[SDAutoUnlockSessionWrapper setPayload:](self, "setPayload:");
    v4 = v6;
  }
  if ((*((_BYTE *)v4 + 88) & 4) != 0)
  {
    self->_messageType = *((_DWORD *)v4 + 10);
    *(_BYTE *)&self->_has |= 4u;
  }
  if (*((_QWORD *)v4 + 8))
  {
    -[SDAutoUnlockSessionWrapper setSenderID:](self, "setSenderID:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 88);
  if ((v5 & 0x10) != 0)
  {
    self->_useProxy = *((_BYTE *)v4 + 84);
    *(_BYTE *)&self->_has |= 0x10u;
    v5 = *((_BYTE *)v4 + 88);
    if ((v5 & 2) == 0)
    {
LABEL_13:
      if ((v5 & 1) == 0)
        goto LABEL_15;
      goto LABEL_14;
    }
  }
  else if ((*((_BYTE *)v4 + 88) & 2) == 0)
  {
    goto LABEL_13;
  }
  self->_awdlCacheID = *((_DWORD *)v4 + 6);
  *(_BYTE *)&self->_has |= 2u;
  if ((*((_BYTE *)v4 + 88) & 1) != 0)
  {
LABEL_14:
    self->_aksSessionID = *((_DWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
  }
LABEL_15:
  if (*((_QWORD *)v4 + 4))
  {
    -[SDAutoUnlockSessionWrapper setEncryptedPayload:](self, "setEncryptedPayload:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[SDAutoUnlockSessionWrapper setAuthTag:](self, "setAuthTag:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 6))
  {
    -[SDAutoUnlockSessionWrapper setNonce:](self, "setNonce:");
    v4 = v6;
  }

}

- (unsigned)version
{
  return self->_version;
}

- (NSData)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
  objc_storeStrong((id *)&self->_sessionID, a3);
}

- (NSData)payload
{
  return self->_payload;
}

- (void)setPayload:(id)a3
{
  objc_storeStrong((id *)&self->_payload, a3);
}

- (unsigned)messageType
{
  return self->_messageType;
}

- (NSData)senderID
{
  return self->_senderID;
}

- (void)setSenderID:(id)a3
{
  objc_storeStrong((id *)&self->_senderID, a3);
}

- (BOOL)useProxy
{
  return self->_useProxy;
}

- (unsigned)awdlCacheID
{
  return self->_awdlCacheID;
}

- (unsigned)aksSessionID
{
  return self->_aksSessionID;
}

- (NSData)encryptedPayload
{
  return self->_encryptedPayload;
}

- (void)setEncryptedPayload:(id)a3
{
  objc_storeStrong((id *)&self->_encryptedPayload, a3);
}

- (NSData)authTag
{
  return self->_authTag;
}

- (void)setAuthTag:(id)a3
{
  objc_storeStrong((id *)&self->_authTag, a3);
}

- (NSData)nonce
{
  return self->_nonce;
}

- (void)setNonce:(id)a3
{
  objc_storeStrong((id *)&self->_nonce, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_senderID, 0);
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_nonce, 0);
  objc_storeStrong((id *)&self->_encryptedPayload, 0);
  objc_storeStrong((id *)&self->_authTag, 0);
}

@end
