@implementation OTICDPRecordContext

- (BOOL)hasCdpInfo
{
  return self->_cdpInfo != 0;
}

- (BOOL)hasAuthInfo
{
  return self->_authInfo != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)OTICDPRecordContext;
  -[OTICDPRecordContext description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[OTICDPRecordContext dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  OTCDPRecoveryInformation *cdpInfo;
  void *v5;
  OTEscrowAuthenticationInformation *authInfo;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  cdpInfo = self->_cdpInfo;
  if (cdpInfo)
  {
    -[OTCDPRecoveryInformation dictionaryRepresentation](cdpInfo, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("cdpInfo"));

  }
  authInfo = self->_authInfo;
  if (authInfo)
  {
    -[OTEscrowAuthenticationInformation dictionaryRepresentation](authInfo, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("authInfo"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return OTICDPRecordContextReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_cdpInfo)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_authInfo)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_cdpInfo)
  {
    objc_msgSend(v4, "setCdpInfo:");
    v4 = v5;
  }
  if (self->_authInfo)
  {
    objc_msgSend(v5, "setAuthInfo:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[OTCDPRecoveryInformation copyWithZone:](self->_cdpInfo, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[OTEscrowAuthenticationInformation copyWithZone:](self->_authInfo, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  OTCDPRecoveryInformation *cdpInfo;
  OTEscrowAuthenticationInformation *authInfo;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((cdpInfo = self->_cdpInfo, !((unint64_t)cdpInfo | v4[2]))
     || -[OTCDPRecoveryInformation isEqual:](cdpInfo, "isEqual:")))
  {
    authInfo = self->_authInfo;
    if ((unint64_t)authInfo | v4[1])
      v7 = -[OTEscrowAuthenticationInformation isEqual:](authInfo, "isEqual:");
    else
      v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[OTCDPRecoveryInformation hash](self->_cdpInfo, "hash");
  return -[OTEscrowAuthenticationInformation hash](self->_authInfo, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  OTCDPRecoveryInformation *cdpInfo;
  uint64_t v6;
  OTEscrowAuthenticationInformation *authInfo;
  uint64_t v8;
  _QWORD *v9;

  v4 = a3;
  cdpInfo = self->_cdpInfo;
  v6 = v4[2];
  v9 = v4;
  if (cdpInfo)
  {
    if (!v6)
      goto LABEL_7;
    -[OTCDPRecoveryInformation mergeFrom:](cdpInfo, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[OTICDPRecordContext setCdpInfo:](self, "setCdpInfo:");
  }
  v4 = v9;
LABEL_7:
  authInfo = self->_authInfo;
  v8 = v4[1];
  if (authInfo)
  {
    if (v8)
    {
      -[OTEscrowAuthenticationInformation mergeFrom:](authInfo, "mergeFrom:");
LABEL_12:
      v4 = v9;
    }
  }
  else if (v8)
  {
    -[OTICDPRecordContext setAuthInfo:](self, "setAuthInfo:");
    goto LABEL_12;
  }

}

- (OTCDPRecoveryInformation)cdpInfo
{
  return self->_cdpInfo;
}

- (void)setCdpInfo:(id)a3
{
  objc_storeStrong((id *)&self->_cdpInfo, a3);
}

- (OTEscrowAuthenticationInformation)authInfo
{
  return self->_authInfo;
}

- (void)setAuthInfo:(id)a3
{
  objc_storeStrong((id *)&self->_authInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cdpInfo, 0);
  objc_storeStrong((id *)&self->_authInfo, 0);
}

@end
