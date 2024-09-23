@implementation SDAuthenticationToken

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

- (BOOL)hasAksToken
{
  return self->_aksToken != 0;
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
  v8.super_class = (Class)SDAuthenticationToken;
  v3 = -[SDAuthenticationToken description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAuthenticationToken dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *sessionID;
  NSData *aksToken;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_version));
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("version"));

  }
  sessionID = self->_sessionID;
  if (sessionID)
    objc_msgSend(v3, "setObject:forKey:", sessionID, CFSTR("sessionID"));
  aksToken = self->_aksToken;
  if (aksToken)
    objc_msgSend(v3, "setObject:forKey:", aksToken, CFSTR("aksToken"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_errorCode));
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("errorCode"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SDAuthenticationTokenReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  NSString *sessionID;
  NSData *aksToken;
  id v6;

  v6 = a3;
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteUint32Field(v6, self->_version, 1);
  sessionID = self->_sessionID;
  if (sessionID)
    PBDataWriterWriteStringField(v6, sessionID, 2);
  aksToken = self->_aksToken;
  if (aksToken)
    PBDataWriterWriteDataField(v6, aksToken, 3);
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint32Field(v6, self->_errorCode, 4);

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v4[8] = self->_version;
    *((_BYTE *)v4 + 36) |= 2u;
  }
  v5 = v4;
  if (self->_sessionID)
  {
    objc_msgSend(v4, "setSessionID:");
    v4 = v5;
  }
  if (self->_aksToken)
  {
    objc_msgSend(v5, "setAksToken:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[4] = self->_errorCode;
    *((_BYTE *)v4 + 36) |= 1u;
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
    *((_BYTE *)v5 + 36) |= 2u;
  }
  v7 = -[NSString copyWithZone:](self->_sessionID, "copyWithZone:", a3);
  v8 = (void *)v6[3];
  v6[3] = v7;

  v9 = -[NSData copyWithZone:](self->_aksToken, "copyWithZone:", a3);
  v10 = (void *)v6[1];
  v6[1] = v9;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v6 + 4) = self->_errorCode;
    *((_BYTE *)v6 + 36) |= 1u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  NSString *sessionID;
  NSData *aksToken;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
    goto LABEL_15;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 2) == 0 || self->_version != *((_DWORD *)v4 + 8))
      goto LABEL_15;
  }
  else if ((*((_BYTE *)v4 + 36) & 2) != 0)
  {
LABEL_15:
    v8 = 0;
    goto LABEL_16;
  }
  sessionID = self->_sessionID;
  if ((unint64_t)sessionID | *((_QWORD *)v4 + 3) && !-[NSString isEqual:](sessionID, "isEqual:"))
    goto LABEL_15;
  aksToken = self->_aksToken;
  if ((unint64_t)aksToken | *((_QWORD *)v4 + 1))
  {
    if (!-[NSData isEqual:](aksToken, "isEqual:"))
      goto LABEL_15;
  }
  v8 = (*((_BYTE *)v4 + 36) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 1) == 0 || self->_errorCode != *((_DWORD *)v4 + 4))
      goto LABEL_15;
    v8 = 1;
  }
LABEL_16:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  unint64_t v5;
  uint64_t v6;

  if ((*(_BYTE *)&self->_has & 2) != 0)
    v3 = 2654435761 * self->_version;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_sessionID, "hash");
  v5 = (unint64_t)-[NSData hash](self->_aksToken, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v6 = 2654435761 * self->_errorCode;
  else
    v6 = 0;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v4 = a3;
  if ((v4[9] & 2) != 0)
  {
    self->_version = v4[8];
    *(_BYTE *)&self->_has |= 2u;
  }
  v5 = v4;
  if (*((_QWORD *)v4 + 3))
  {
    -[SDAuthenticationToken setSessionID:](self, "setSessionID:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 1))
  {
    -[SDAuthenticationToken setAksToken:](self, "setAksToken:");
    v4 = v5;
  }
  if ((v4[9] & 1) != 0)
  {
    self->_errorCode = v4[4];
    *(_BYTE *)&self->_has |= 1u;
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

- (NSData)aksToken
{
  return self->_aksToken;
}

- (void)setAksToken:(id)a3
{
  objc_storeStrong((id *)&self->_aksToken, a3);
}

- (unsigned)errorCode
{
  return self->_errorCode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_aksToken, 0);
}

@end
