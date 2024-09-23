@implementation SDUnlockSetupCreateRecord

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

- (BOOL)hasPairedDeviceID
{
  return self->_pairedDeviceID != 0;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SDUnlockSetupCreateRecord;
  v3 = -[SDUnlockSetupCreateRecord description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSetupCreateRecord dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  NSData *token;
  NSString *pairedDeviceID;
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
      if ((has & 1) == 0)
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

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_4:
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_errorCode));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("errorCode"));

  }
LABEL_5:
  token = self->_token;
  if (token)
    objc_msgSend(v3, "setObject:forKey:", token, CFSTR("token"));
  pairedDeviceID = self->_pairedDeviceID;
  if (pairedDeviceID)
    objc_msgSend(v3, "setObject:forKey:", pairedDeviceID, CFSTR("pairedDeviceID"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SDUnlockSetupCreateRecordReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  NSData *token;
  NSString *pairedDeviceID;
  id v8;

  v4 = a3;
  has = (char)self->_has;
  v8 = v4;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint32Field(v4, self->_version, 1);
    v4 = v8;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field(v8, self->_sessionID, 2);
  v4 = v8;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_4:
    PBDataWriterWriteUint32Field(v8, self->_errorCode, 3);
    v4 = v8;
  }
LABEL_5:
  token = self->_token;
  if (token)
  {
    PBDataWriterWriteDataField(v8, token, 4);
    v4 = v8;
  }
  pairedDeviceID = self->_pairedDeviceID;
  if (pairedDeviceID)
  {
    PBDataWriterWriteStringField(v8, pairedDeviceID, 5);
    v4 = v8;
  }

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
    v4[10] = self->_version;
    *((_BYTE *)v4 + 44) |= 4u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  v4[6] = self->_sessionID;
  *((_BYTE *)v4 + 44) |= 2u;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_4:
    v4[2] = self->_errorCode;
    *((_BYTE *)v4 + 44) |= 1u;
  }
LABEL_5:
  v6 = v4;
  if (self->_token)
  {
    objc_msgSend(v4, "setToken:");
    v4 = v6;
  }
  if (self->_pairedDeviceID)
  {
    objc_msgSend(v6, "setPairedDeviceID:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  _QWORD *v6;
  char has;
  id v8;
  void *v9;
  id v10;
  void *v11;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_3;
LABEL_7:
    *((_DWORD *)v5 + 6) = self->_sessionID;
    *((_BYTE *)v5 + 44) |= 2u;
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  *((_DWORD *)v5 + 10) = self->_version;
  *((_BYTE *)v5 + 44) |= 4u;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 1) != 0)
  {
LABEL_4:
    *((_DWORD *)v5 + 2) = self->_errorCode;
    *((_BYTE *)v5 + 44) |= 1u;
  }
LABEL_5:
  v8 = -[NSData copyWithZone:](self->_token, "copyWithZone:", a3);
  v9 = (void *)v6[4];
  v6[4] = v8;

  v10 = -[NSString copyWithZone:](self->_pairedDeviceID, "copyWithZone:", a3);
  v11 = (void *)v6[2];
  v6[2] = v10;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  NSData *token;
  NSString *pairedDeviceID;
  unsigned __int8 v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
    goto LABEL_21;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 4) == 0 || self->_version != *((_DWORD *)v4 + 10))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 44) & 4) != 0)
  {
LABEL_21:
    v8 = 0;
    goto LABEL_22;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 2) == 0 || self->_sessionID != *((_DWORD *)v4 + 6))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 44) & 2) != 0)
  {
    goto LABEL_21;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 1) == 0 || self->_errorCode != *((_DWORD *)v4 + 2))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 44) & 1) != 0)
  {
    goto LABEL_21;
  }
  token = self->_token;
  if ((unint64_t)token | *((_QWORD *)v4 + 4) && !-[NSData isEqual:](token, "isEqual:"))
    goto LABEL_21;
  pairedDeviceID = self->_pairedDeviceID;
  if ((unint64_t)pairedDeviceID | *((_QWORD *)v4 + 2))
    v8 = -[NSString isEqual:](pairedDeviceID, "isEqual:");
  else
    v8 = 1;
LABEL_22:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;

  if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_6:
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_4;
LABEL_7:
    v5 = 0;
    goto LABEL_8;
  }
  v3 = 2654435761 * self->_version;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v4 = 2654435761 * self->_sessionID;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_7;
LABEL_4:
  v5 = 2654435761 * self->_errorCode;
LABEL_8:
  v6 = v4 ^ v3 ^ v5 ^ (unint64_t)-[NSData hash](self->_token, "hash");
  return v6 ^ -[NSString hash](self->_pairedDeviceID, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 44);
  if ((v5 & 4) != 0)
  {
    self->_version = *((_DWORD *)v4 + 10);
    *(_BYTE *)&self->_has |= 4u;
    v5 = *((_BYTE *)v4 + 44);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 1) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*((_BYTE *)v4 + 44) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_sessionID = *((_DWORD *)v4 + 6);
  *(_BYTE *)&self->_has |= 2u;
  if ((*((_BYTE *)v4 + 44) & 1) != 0)
  {
LABEL_4:
    self->_errorCode = *((_DWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
  }
LABEL_5:
  v6 = v4;
  if (*((_QWORD *)v4 + 4))
  {
    -[SDUnlockSetupCreateRecord setToken:](self, "setToken:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[SDUnlockSetupCreateRecord setPairedDeviceID:](self, "setPairedDeviceID:");
    v4 = v6;
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

- (NSString)pairedDeviceID
{
  return self->_pairedDeviceID;
}

- (void)setPairedDeviceID:(id)a3
{
  objc_storeStrong((id *)&self->_pairedDeviceID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_pairedDeviceID, 0);
}

@end
