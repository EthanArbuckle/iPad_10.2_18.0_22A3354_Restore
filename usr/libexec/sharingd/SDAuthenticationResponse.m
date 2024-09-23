@implementation SDAuthenticationResponse

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

- (BOOL)hasAwdlInfo
{
  return self->_awdlInfo != 0;
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

- (BOOL)hasAksToken
{
  return self->_aksToken != 0;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SDAuthenticationResponse;
  v3 = -[SDAuthenticationResponse description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAuthenticationResponse dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *sessionID;
  NSData *awdlInfo;
  void *v7;
  NSData *aksToken;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_version));
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("version"));

  }
  sessionID = self->_sessionID;
  if (sessionID)
    objc_msgSend(v3, "setObject:forKey:", sessionID, CFSTR("sessionID"));
  awdlInfo = self->_awdlInfo;
  if (awdlInfo)
    objc_msgSend(v3, "setObject:forKey:", awdlInfo, CFSTR("awdlInfo"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_errorCode));
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("errorCode"));

  }
  aksToken = self->_aksToken;
  if (aksToken)
    objc_msgSend(v3, "setObject:forKey:", aksToken, CFSTR("aksToken"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SDAuthenticationResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSString *sessionID;
  NSData *awdlInfo;
  NSData *aksToken;
  id v8;

  v4 = a3;
  v8 = v4;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteUint32Field(v4, self->_version, 1);
    v4 = v8;
  }
  sessionID = self->_sessionID;
  if (sessionID)
  {
    PBDataWriterWriteStringField(v8, sessionID, 2);
    v4 = v8;
  }
  awdlInfo = self->_awdlInfo;
  if (awdlInfo)
  {
    PBDataWriterWriteDataField(v8, awdlInfo, 3);
    v4 = v8;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteUint32Field(v8, self->_errorCode, 4);
    v4 = v8;
  }
  aksToken = self->_aksToken;
  if (aksToken)
  {
    PBDataWriterWriteDataField(v8, aksToken, 5);
    v4 = v8;
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v4[10] = self->_version;
    *((_BYTE *)v4 + 44) |= 2u;
  }
  v5 = v4;
  if (self->_sessionID)
  {
    objc_msgSend(v4, "setSessionID:");
    v4 = v5;
  }
  if (self->_awdlInfo)
  {
    objc_msgSend(v5, "setAwdlInfo:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[6] = self->_errorCode;
    *((_BYTE *)v4 + 44) |= 1u;
  }
  if (self->_aksToken)
  {
    objc_msgSend(v5, "setAksToken:");
    v4 = v5;
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

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v5[10] = self->_version;
    *((_BYTE *)v5 + 44) |= 2u;
  }
  v7 = -[NSString copyWithZone:](self->_sessionID, "copyWithZone:", a3);
  v8 = (void *)v6[4];
  v6[4] = v7;

  v9 = -[NSData copyWithZone:](self->_awdlInfo, "copyWithZone:", a3);
  v10 = (void *)v6[2];
  v6[2] = v9;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v6 + 6) = self->_errorCode;
    *((_BYTE *)v6 + 44) |= 1u;
  }
  v11 = -[NSData copyWithZone:](self->_aksToken, "copyWithZone:", a3);
  v12 = (void *)v6[1];
  v6[1] = v11;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  NSString *sessionID;
  NSData *awdlInfo;
  NSData *aksToken;
  unsigned __int8 v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
    goto LABEL_18;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 2) == 0 || self->_version != *((_DWORD *)v4 + 10))
      goto LABEL_18;
  }
  else if ((*((_BYTE *)v4 + 44) & 2) != 0)
  {
LABEL_18:
    v9 = 0;
    goto LABEL_19;
  }
  sessionID = self->_sessionID;
  if ((unint64_t)sessionID | *((_QWORD *)v4 + 4) && !-[NSString isEqual:](sessionID, "isEqual:"))
    goto LABEL_18;
  awdlInfo = self->_awdlInfo;
  if ((unint64_t)awdlInfo | *((_QWORD *)v4 + 2))
  {
    if (!-[NSData isEqual:](awdlInfo, "isEqual:"))
      goto LABEL_18;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 1) == 0 || self->_errorCode != *((_DWORD *)v4 + 6))
      goto LABEL_18;
  }
  else if ((*((_BYTE *)v4 + 44) & 1) != 0)
  {
    goto LABEL_18;
  }
  aksToken = self->_aksToken;
  if ((unint64_t)aksToken | *((_QWORD *)v4 + 1))
    v9 = -[NSData isEqual:](aksToken, "isEqual:");
  else
    v9 = 1;
LABEL_19:

  return v9;
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
  v5 = (unint64_t)-[NSData hash](self->_awdlInfo, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v6 = 2654435761 * self->_errorCode;
  else
    v6 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ (unint64_t)-[NSData hash](self->_aksToken, "hash");
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v4 = a3;
  if ((v4[11] & 2) != 0)
  {
    self->_version = v4[10];
    *(_BYTE *)&self->_has |= 2u;
  }
  v5 = v4;
  if (*((_QWORD *)v4 + 4))
  {
    -[SDAuthenticationResponse setSessionID:](self, "setSessionID:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[SDAuthenticationResponse setAwdlInfo:](self, "setAwdlInfo:");
    v4 = v5;
  }
  if ((v4[11] & 1) != 0)
  {
    self->_errorCode = v4[6];
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 1))
  {
    -[SDAuthenticationResponse setAksToken:](self, "setAksToken:");
    v4 = v5;
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

- (NSData)awdlInfo
{
  return self->_awdlInfo;
}

- (void)setAwdlInfo:(id)a3
{
  objc_storeStrong((id *)&self->_awdlInfo, a3);
}

- (unsigned)errorCode
{
  return self->_errorCode;
}

- (NSData)aksToken
{
  return self->_aksToken;
}

- (void)setAksToken:(id)a3
{
  objc_storeStrong((id *)&self->_aksToken, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_awdlInfo, 0);
  objc_storeStrong((id *)&self->_aksToken, 0);
}

@end
