@implementation SDAuthenticationPairingCreateRecord

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

- (BOOL)hasSessionID
{
  return self->_sessionID != 0;
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

- (BOOL)hasToken
{
  return self->_token != 0;
}

- (void)setRequestArmingUI:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_requestArmingUI = a3;
}

- (void)setHasRequestArmingUI:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasRequestArmingUI
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
  v8.super_class = (Class)SDAuthenticationPairingCreateRecord;
  v3 = -[SDAuthenticationPairingCreateRecord description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAuthenticationPairingCreateRecord dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *sessionID;
  void *v6;
  NSData *token;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_version));
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("version"));

  }
  sessionID = self->_sessionID;
  if (sessionID)
    objc_msgSend(v3, "setObject:forKey:", sessionID, CFSTR("sessionID"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_errorCode));
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("errorCode"));

  }
  token = self->_token;
  if (token)
    objc_msgSend(v3, "setObject:forKey:", token, CFSTR("token"));
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_requestArmingUI));
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("requestArmingUI"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SDAuthenticationPairingCreateRecordReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  NSString *sessionID;
  NSData *token;
  id v6;

  v6 = a3;
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteUint32Field(v6, self->_version, 1);
  sessionID = self->_sessionID;
  if (sessionID)
    PBDataWriterWriteStringField(v6, sessionID, 2);
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint32Field(v6, self->_errorCode, 3);
  token = self->_token;
  if (token)
    PBDataWriterWriteDataField(v6, token, 4);
  if ((*(_BYTE *)&self->_has & 4) != 0)
    PBDataWriterWriteBOOLField(v6, self->_requestArmingUI, 5);

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v4[8] = self->_version;
    *((_BYTE *)v4 + 40) |= 2u;
  }
  v5 = v4;
  if (self->_sessionID)
  {
    objc_msgSend(v4, "setSessionID:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[2] = self->_errorCode;
    *((_BYTE *)v4 + 40) |= 1u;
  }
  if (self->_token)
  {
    objc_msgSend(v5, "setToken:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *((_BYTE *)v4 + 36) = self->_requestArmingUI;
    *((_BYTE *)v4 + 40) |= 4u;
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

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v5[8] = self->_version;
    *((_BYTE *)v5 + 40) |= 2u;
  }
  v7 = -[NSString copyWithZone:](self->_sessionID, "copyWithZone:", a3);
  v8 = (void *)v6[2];
  v6[2] = v7;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v6 + 2) = self->_errorCode;
    *((_BYTE *)v6 + 40) |= 1u;
  }
  v9 = -[NSData copyWithZone:](self->_token, "copyWithZone:", a3);
  v10 = (void *)v6[3];
  v6[3] = v9;

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *((_BYTE *)v6 + 36) = self->_requestArmingUI;
    *((_BYTE *)v6 + 40) |= 4u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  char has;
  NSString *sessionID;
  NSData *token;
  BOOL v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
    goto LABEL_20;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 2) == 0 || self->_version != *((_DWORD *)v4 + 8))
      goto LABEL_20;
  }
  else if ((*((_BYTE *)v4 + 40) & 2) != 0)
  {
    goto LABEL_20;
  }
  sessionID = self->_sessionID;
  if ((unint64_t)sessionID | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](sessionID, "isEqual:"))
      goto LABEL_20;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) == 0 || self->_errorCode != *((_DWORD *)v4 + 2))
      goto LABEL_20;
  }
  else if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
    goto LABEL_20;
  }
  token = self->_token;
  if ((unint64_t)token | *((_QWORD *)v4 + 3))
  {
    if (!-[NSData isEqual:](token, "isEqual:"))
      goto LABEL_20;
    has = (char)self->_has;
  }
  v9 = (*((_BYTE *)v4 + 40) & 4) == 0;
  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 4) != 0)
    {
      if (self->_requestArmingUI)
      {
        if (!*((_BYTE *)v4 + 36))
          goto LABEL_20;
      }
      else if (*((_BYTE *)v4 + 36))
      {
        goto LABEL_20;
      }
      v9 = 1;
      goto LABEL_21;
    }
LABEL_20:
    v9 = 0;
  }
LABEL_21:

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;

  if ((*(_BYTE *)&self->_has & 2) != 0)
    v3 = 2654435761 * self->_version;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_sessionID, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v5 = 2654435761 * self->_errorCode;
  else
    v5 = 0;
  v6 = (unint64_t)-[NSData hash](self->_token, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
    v7 = 2654435761 * self->_requestArmingUI;
  else
    v7 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if ((*((_BYTE *)v4 + 40) & 2) != 0)
  {
    self->_version = *((_DWORD *)v4 + 8);
    *(_BYTE *)&self->_has |= 2u;
  }
  v5 = v4;
  if (*((_QWORD *)v4 + 2))
  {
    -[SDAuthenticationPairingCreateRecord setSessionID:](self, "setSessionID:");
    v4 = v5;
  }
  if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
    self->_errorCode = *((_DWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[SDAuthenticationPairingCreateRecord setToken:](self, "setToken:");
    v4 = v5;
  }
  if ((*((_BYTE *)v4 + 40) & 4) != 0)
  {
    self->_requestArmingUI = *((_BYTE *)v4 + 36);
    *(_BYTE *)&self->_has |= 4u;
  }

}

- (unsigned)version
{
  return self->_version;
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
  objc_storeStrong((id *)&self->_sessionID, a3);
}

- (unsigned)errorCode
{
  return self->_errorCode;
}

- (NSData)token
{
  return self->_token;
}

- (void)setToken:(id)a3
{
  objc_storeStrong((id *)&self->_token, a3);
}

- (BOOL)requestArmingUI
{
  return self->_requestArmingUI;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
}

@end
