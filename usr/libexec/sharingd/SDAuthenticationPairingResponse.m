@implementation SDAuthenticationPairingResponse

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

- (void)setType:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasSessionID
{
  return self->_sessionID != 0;
}

- (BOOL)hasLongTermKey
{
  return self->_longTermKey != 0;
}

- (BOOL)hasToken
{
  return self->_token != 0;
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

- (void)setRequestArmingUI:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_requestArmingUI = a3;
}

- (void)setHasRequestArmingUI:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasRequestArmingUI
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SDAuthenticationPairingResponse;
  v3 = -[SDAuthenticationPairingResponse description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAuthenticationPairingResponse dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v6;
  NSString *sessionID;
  NSData *longTermKey;
  NSData *token;
  char v10;
  void *v11;
  void *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_version));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("version"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_type));
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("type"));

  }
  sessionID = self->_sessionID;
  if (sessionID)
    objc_msgSend(v3, "setObject:forKey:", sessionID, CFSTR("sessionID"));
  longTermKey = self->_longTermKey;
  if (longTermKey)
    objc_msgSend(v3, "setObject:forKey:", longTermKey, CFSTR("longTermKey"));
  token = self->_token;
  if (token)
    objc_msgSend(v3, "setObject:forKey:", token, CFSTR("token"));
  v10 = (char)self->_has;
  if ((v10 & 1) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_errorCode));
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("errorCode"));

    v10 = (char)self->_has;
  }
  if ((v10 & 8) != 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_requestArmingUI));
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("requestArmingUI"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SDAuthenticationPairingResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  NSString *sessionID;
  NSData *longTermKey;
  NSData *token;
  char v8;
  id v9;

  v9 = a3;
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint32Field(v9, self->_version, 1);
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteUint32Field(v9, self->_type, 2);
  sessionID = self->_sessionID;
  if (sessionID)
    PBDataWriterWriteStringField(v9, sessionID, 3);
  longTermKey = self->_longTermKey;
  if (longTermKey)
    PBDataWriterWriteDataField(v9, longTermKey, 4);
  token = self->_token;
  if (token)
    PBDataWriterWriteDataField(v9, token, 5);
  v8 = (char)self->_has;
  if ((v8 & 1) != 0)
  {
    PBDataWriterWriteUint32Field(v9, self->_errorCode, 6);
    v8 = (char)self->_has;
  }
  if ((v8 & 8) != 0)
    PBDataWriterWriteBOOLField(v9, self->_requestArmingUI, 7);

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char has;
  char v6;
  _DWORD *v7;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v4[11] = self->_version;
    *((_BYTE *)v4 + 52) |= 4u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v4[10] = self->_type;
    *((_BYTE *)v4 + 52) |= 2u;
  }
  v7 = v4;
  if (self->_sessionID)
  {
    objc_msgSend(v4, "setSessionID:");
    v4 = v7;
  }
  if (self->_longTermKey)
  {
    objc_msgSend(v7, "setLongTermKey:");
    v4 = v7;
  }
  if (self->_token)
  {
    objc_msgSend(v7, "setToken:");
    v4 = v7;
  }
  v6 = (char)self->_has;
  if ((v6 & 1) != 0)
  {
    v4[2] = self->_errorCode;
    *((_BYTE *)v4 + 52) |= 1u;
    v6 = (char)self->_has;
  }
  if ((v6 & 8) != 0)
  {
    *((_BYTE *)v4 + 48) = self->_requestArmingUI;
    *((_BYTE *)v4 + 52) |= 8u;
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
  id v12;
  void *v13;
  char v14;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v5[11] = self->_version;
    *((_BYTE *)v5 + 52) |= 4u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v5[10] = self->_type;
    *((_BYTE *)v5 + 52) |= 2u;
  }
  v8 = -[NSString copyWithZone:](self->_sessionID, "copyWithZone:", a3);
  v9 = (void *)v6[3];
  v6[3] = v8;

  v10 = -[NSData copyWithZone:](self->_longTermKey, "copyWithZone:", a3);
  v11 = (void *)v6[2];
  v6[2] = v10;

  v12 = -[NSData copyWithZone:](self->_token, "copyWithZone:", a3);
  v13 = (void *)v6[4];
  v6[4] = v12;

  v14 = (char)self->_has;
  if ((v14 & 1) != 0)
  {
    *((_DWORD *)v6 + 2) = self->_errorCode;
    *((_BYTE *)v6 + 52) |= 1u;
    v14 = (char)self->_has;
  }
  if ((v14 & 8) != 0)
  {
    *((_BYTE *)v6 + 48) = self->_requestArmingUI;
    *((_BYTE *)v6 + 52) |= 8u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  NSString *sessionID;
  NSData *longTermKey;
  NSData *token;
  BOOL v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
    goto LABEL_25;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 4) == 0 || self->_version != *((_DWORD *)v4 + 11))
      goto LABEL_25;
  }
  else if ((*((_BYTE *)v4 + 52) & 4) != 0)
  {
    goto LABEL_25;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 2) == 0 || self->_type != *((_DWORD *)v4 + 10))
      goto LABEL_25;
  }
  else if ((*((_BYTE *)v4 + 52) & 2) != 0)
  {
    goto LABEL_25;
  }
  sessionID = self->_sessionID;
  if ((unint64_t)sessionID | *((_QWORD *)v4 + 3) && !-[NSString isEqual:](sessionID, "isEqual:"))
    goto LABEL_25;
  longTermKey = self->_longTermKey;
  if ((unint64_t)longTermKey | *((_QWORD *)v4 + 2))
  {
    if (!-[NSData isEqual:](longTermKey, "isEqual:"))
      goto LABEL_25;
  }
  token = self->_token;
  if ((unint64_t)token | *((_QWORD *)v4 + 4))
  {
    if (!-[NSData isEqual:](token, "isEqual:"))
      goto LABEL_25;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 1) == 0 || self->_errorCode != *((_DWORD *)v4 + 2))
      goto LABEL_25;
  }
  else if ((*((_BYTE *)v4 + 52) & 1) != 0)
  {
    goto LABEL_25;
  }
  v9 = (*((_BYTE *)v4 + 52) & 8) == 0;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 8) == 0)
    {
LABEL_25:
      v9 = 0;
      goto LABEL_26;
    }
    if (self->_requestArmingUI)
    {
      if (!*((_BYTE *)v4 + 48))
        goto LABEL_25;
    }
    else if (*((_BYTE *)v4 + 48))
    {
      goto LABEL_25;
    }
    v9 = 1;
  }
LABEL_26:

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  NSUInteger v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v3 = 2654435761 * self->_version;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_type;
      goto LABEL_6;
    }
  }
  v4 = 0;
LABEL_6:
  v5 = -[NSString hash](self->_sessionID, "hash");
  v6 = (unint64_t)-[NSData hash](self->_longTermKey, "hash");
  v7 = (unint64_t)-[NSData hash](self->_token, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v8 = 2654435761 * self->_errorCode;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_8;
LABEL_10:
    v9 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  }
  v8 = 0;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_10;
LABEL_8:
  v9 = 2654435761 * self->_requestArmingUI;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  char v6;
  id v7;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 52);
  if ((v5 & 4) != 0)
  {
    self->_version = *((_DWORD *)v4 + 11);
    *(_BYTE *)&self->_has |= 4u;
    v5 = *((_BYTE *)v4 + 52);
  }
  if ((v5 & 2) != 0)
  {
    self->_type = *((_DWORD *)v4 + 10);
    *(_BYTE *)&self->_has |= 2u;
  }
  v7 = v4;
  if (*((_QWORD *)v4 + 3))
  {
    -[SDAuthenticationPairingResponse setSessionID:](self, "setSessionID:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[SDAuthenticationPairingResponse setLongTermKey:](self, "setLongTermKey:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[SDAuthenticationPairingResponse setToken:](self, "setToken:");
    v4 = v7;
  }
  v6 = *((_BYTE *)v4 + 52);
  if ((v6 & 1) != 0)
  {
    self->_errorCode = *((_DWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
    v6 = *((_BYTE *)v4 + 52);
  }
  if ((v6 & 8) != 0)
  {
    self->_requestArmingUI = *((_BYTE *)v4 + 48);
    *(_BYTE *)&self->_has |= 8u;
  }

}

- (unsigned)version
{
  return self->_version;
}

- (unsigned)type
{
  return self->_type;
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
  objc_storeStrong((id *)&self->_sessionID, a3);
}

- (NSData)longTermKey
{
  return self->_longTermKey;
}

- (void)setLongTermKey:(id)a3
{
  objc_storeStrong((id *)&self->_longTermKey, a3);
}

- (NSData)token
{
  return self->_token;
}

- (void)setToken:(id)a3
{
  objc_storeStrong((id *)&self->_token, a3);
}

- (unsigned)errorCode
{
  return self->_errorCode;
}

- (BOOL)requestArmingUI
{
  return self->_requestArmingUI;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_longTermKey, 0);
}

@end
