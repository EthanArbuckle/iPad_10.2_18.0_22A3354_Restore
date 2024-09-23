@implementation OTEscrowAuthenticationInformation

- (BOOL)hasAuthenticationPassword
{
  return self->_authenticationPassword != 0;
}

- (BOOL)hasAuthenticationDsid
{
  return self->_authenticationDsid != 0;
}

- (BOOL)hasAuthenticationAppleid
{
  return self->_authenticationAppleid != 0;
}

- (BOOL)hasFmipUuid
{
  return self->_fmipUuid != 0;
}

- (void)setFmipRecovery:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_fmipRecovery = a3;
}

- (void)setHasFmipRecovery:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasFmipRecovery
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setIdmsRecovery:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_idmsRecovery = a3;
}

- (void)setHasIdmsRecovery:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIdmsRecovery
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasAuthenticationAuthToken
{
  return self->_authenticationAuthToken != 0;
}

- (BOOL)hasAuthenticationEscrowproxyUrl
{
  return self->_authenticationEscrowproxyUrl != 0;
}

- (BOOL)hasAuthenticationIcloudEnvironment
{
  return self->_authenticationIcloudEnvironment != 0;
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
  v8.super_class = (Class)OTEscrowAuthenticationInformation;
  -[OTEscrowAuthenticationInformation description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[OTEscrowAuthenticationInformation dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *authenticationPassword;
  NSString *authenticationDsid;
  NSString *authenticationAppleid;
  NSString *fmipUuid;
  char has;
  void *v10;
  void *v11;
  NSString *authenticationAuthToken;
  NSString *authenticationEscrowproxyUrl;
  NSString *authenticationIcloudEnvironment;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  authenticationPassword = self->_authenticationPassword;
  if (authenticationPassword)
    objc_msgSend(v3, "setObject:forKey:", authenticationPassword, CFSTR("authentication_password"));
  authenticationDsid = self->_authenticationDsid;
  if (authenticationDsid)
    objc_msgSend(v4, "setObject:forKey:", authenticationDsid, CFSTR("authentication_dsid"));
  authenticationAppleid = self->_authenticationAppleid;
  if (authenticationAppleid)
    objc_msgSend(v4, "setObject:forKey:", authenticationAppleid, CFSTR("authentication_appleid"));
  fmipUuid = self->_fmipUuid;
  if (fmipUuid)
    objc_msgSend(v4, "setObject:forKey:", fmipUuid, CFSTR("fmip_uuid"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_fmipRecovery);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("fmip_recovery"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_idmsRecovery);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("idms_recovery"));

  }
  authenticationAuthToken = self->_authenticationAuthToken;
  if (authenticationAuthToken)
    objc_msgSend(v4, "setObject:forKey:", authenticationAuthToken, CFSTR("authentication_auth_token"));
  authenticationEscrowproxyUrl = self->_authenticationEscrowproxyUrl;
  if (authenticationEscrowproxyUrl)
    objc_msgSend(v4, "setObject:forKey:", authenticationEscrowproxyUrl, CFSTR("authentication_escrowproxy_url"));
  authenticationIcloudEnvironment = self->_authenticationIcloudEnvironment;
  if (authenticationIcloudEnvironment)
    objc_msgSend(v4, "setObject:forKey:", authenticationIcloudEnvironment, CFSTR("authentication_icloud_environment"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return OTEscrowAuthenticationInformationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_authenticationPassword)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_authenticationDsid)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_authenticationAppleid)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_fmipUuid)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v6;
  }
  if (self->_authenticationAuthToken)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_authenticationEscrowproxyUrl)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_authenticationIcloudEnvironment)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  char has;
  _BYTE *v6;

  v4 = a3;
  v6 = v4;
  if (self->_authenticationPassword)
  {
    objc_msgSend(v4, "setAuthenticationPassword:");
    v4 = v6;
  }
  if (self->_authenticationDsid)
  {
    objc_msgSend(v6, "setAuthenticationDsid:");
    v4 = v6;
  }
  if (self->_authenticationAppleid)
  {
    objc_msgSend(v6, "setAuthenticationAppleid:");
    v4 = v6;
  }
  if (self->_fmipUuid)
  {
    objc_msgSend(v6, "setFmipUuid:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v4[64] = self->_fmipRecovery;
    v4[68] |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v4[65] = self->_idmsRecovery;
    v4[68] |= 2u;
  }
  if (self->_authenticationAuthToken)
  {
    objc_msgSend(v6, "setAuthenticationAuthToken:");
    v4 = v6;
  }
  if (self->_authenticationEscrowproxyUrl)
  {
    objc_msgSend(v6, "setAuthenticationEscrowproxyUrl:");
    v4 = v6;
  }
  if (self->_authenticationIcloudEnvironment)
  {
    objc_msgSend(v6, "setAuthenticationIcloudEnvironment:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  char has;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_authenticationPassword, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v6;

  v8 = -[NSString copyWithZone:](self->_authenticationDsid, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  v10 = -[NSString copyWithZone:](self->_authenticationAppleid, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v10;

  v12 = -[NSString copyWithZone:](self->_fmipUuid, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v12;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_BYTE *)(v5 + 64) = self->_fmipRecovery;
    *(_BYTE *)(v5 + 68) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_BYTE *)(v5 + 65) = self->_idmsRecovery;
    *(_BYTE *)(v5 + 68) |= 2u;
  }
  v15 = -[NSString copyWithZone:](self->_authenticationAuthToken, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v15;

  v17 = -[NSString copyWithZone:](self->_authenticationEscrowproxyUrl, "copyWithZone:", a3);
  v18 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v17;

  v19 = -[NSString copyWithZone:](self->_authenticationIcloudEnvironment, "copyWithZone:", a3);
  v20 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v19;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *authenticationPassword;
  NSString *authenticationDsid;
  NSString *authenticationAppleid;
  NSString *fmipUuid;
  NSString *authenticationAuthToken;
  NSString *authenticationEscrowproxyUrl;
  NSString *authenticationIcloudEnvironment;
  char v12;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_32;
  authenticationPassword = self->_authenticationPassword;
  if ((unint64_t)authenticationPassword | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](authenticationPassword, "isEqual:"))
      goto LABEL_32;
  }
  authenticationDsid = self->_authenticationDsid;
  if ((unint64_t)authenticationDsid | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](authenticationDsid, "isEqual:"))
      goto LABEL_32;
  }
  authenticationAppleid = self->_authenticationAppleid;
  if ((unint64_t)authenticationAppleid | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](authenticationAppleid, "isEqual:"))
      goto LABEL_32;
  }
  fmipUuid = self->_fmipUuid;
  if ((unint64_t)fmipUuid | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](fmipUuid, "isEqual:"))
      goto LABEL_32;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 1) == 0)
      goto LABEL_32;
    if (self->_fmipRecovery)
    {
      if (!*((_BYTE *)v4 + 64))
        goto LABEL_32;
    }
    else if (*((_BYTE *)v4 + 64))
    {
      goto LABEL_32;
    }
  }
  else if ((*((_BYTE *)v4 + 68) & 1) != 0)
  {
    goto LABEL_32;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 2) != 0)
    {
      if (self->_idmsRecovery)
      {
        if (!*((_BYTE *)v4 + 65))
          goto LABEL_32;
        goto LABEL_26;
      }
      if (!*((_BYTE *)v4 + 65))
        goto LABEL_26;
    }
LABEL_32:
    v12 = 0;
    goto LABEL_33;
  }
  if ((*((_BYTE *)v4 + 68) & 2) != 0)
    goto LABEL_32;
LABEL_26:
  authenticationAuthToken = self->_authenticationAuthToken;
  if ((unint64_t)authenticationAuthToken | *((_QWORD *)v4 + 2)
    && !-[NSString isEqual:](authenticationAuthToken, "isEqual:"))
  {
    goto LABEL_32;
  }
  authenticationEscrowproxyUrl = self->_authenticationEscrowproxyUrl;
  if ((unint64_t)authenticationEscrowproxyUrl | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](authenticationEscrowproxyUrl, "isEqual:"))
      goto LABEL_32;
  }
  authenticationIcloudEnvironment = self->_authenticationIcloudEnvironment;
  if ((unint64_t)authenticationIcloudEnvironment | *((_QWORD *)v4 + 5))
    v12 = -[NSString isEqual:](authenticationIcloudEnvironment, "isEqual:");
  else
    v12 = 1;
LABEL_33:

  return v12;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  uint64_t v7;
  uint64_t v8;
  NSUInteger v9;
  NSUInteger v10;
  NSUInteger v11;

  v3 = -[NSString hash](self->_authenticationPassword, "hash");
  v4 = -[NSString hash](self->_authenticationDsid, "hash");
  v5 = -[NSString hash](self->_authenticationAppleid, "hash");
  v6 = -[NSString hash](self->_fmipUuid, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v7 = 2654435761 * self->_fmipRecovery;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v8 = 0;
    goto LABEL_6;
  }
  v7 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v8 = 2654435761 * self->_idmsRecovery;
LABEL_6:
  v9 = v4 ^ v3 ^ v5 ^ v6;
  v10 = v7 ^ v8 ^ -[NSString hash](self->_authenticationAuthToken, "hash");
  v11 = v9 ^ v10 ^ -[NSString hash](self->_authenticationEscrowproxyUrl, "hash");
  return v11 ^ -[NSString hash](self->_authenticationIcloudEnvironment, "hash");
}

- (void)mergeFrom:(id)a3
{
  BOOL *v4;
  BOOL v5;
  BOOL *v6;

  v4 = (BOOL *)a3;
  v6 = v4;
  if (*((_QWORD *)v4 + 6))
  {
    -[OTEscrowAuthenticationInformation setAuthenticationPassword:](self, "setAuthenticationPassword:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[OTEscrowAuthenticationInformation setAuthenticationDsid:](self, "setAuthenticationDsid:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 1))
  {
    -[OTEscrowAuthenticationInformation setAuthenticationAppleid:](self, "setAuthenticationAppleid:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 7))
  {
    -[OTEscrowAuthenticationInformation setFmipUuid:](self, "setFmipUuid:");
    v4 = v6;
  }
  v5 = v4[68];
  if (v5)
  {
    self->_fmipRecovery = v4[64];
    *(_BYTE *)&self->_has |= 1u;
    v5 = v4[68];
  }
  if ((v5 & 2) != 0)
  {
    self->_idmsRecovery = v4[65];
    *(_BYTE *)&self->_has |= 2u;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[OTEscrowAuthenticationInformation setAuthenticationAuthToken:](self, "setAuthenticationAuthToken:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[OTEscrowAuthenticationInformation setAuthenticationEscrowproxyUrl:](self, "setAuthenticationEscrowproxyUrl:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 5))
  {
    -[OTEscrowAuthenticationInformation setAuthenticationIcloudEnvironment:](self, "setAuthenticationIcloudEnvironment:");
    v4 = v6;
  }

}

- (NSString)authenticationPassword
{
  return self->_authenticationPassword;
}

- (void)setAuthenticationPassword:(id)a3
{
  objc_storeStrong((id *)&self->_authenticationPassword, a3);
}

- (NSString)authenticationDsid
{
  return self->_authenticationDsid;
}

- (void)setAuthenticationDsid:(id)a3
{
  objc_storeStrong((id *)&self->_authenticationDsid, a3);
}

- (NSString)authenticationAppleid
{
  return self->_authenticationAppleid;
}

- (void)setAuthenticationAppleid:(id)a3
{
  objc_storeStrong((id *)&self->_authenticationAppleid, a3);
}

- (NSString)fmipUuid
{
  return self->_fmipUuid;
}

- (void)setFmipUuid:(id)a3
{
  objc_storeStrong((id *)&self->_fmipUuid, a3);
}

- (BOOL)fmipRecovery
{
  return self->_fmipRecovery;
}

- (BOOL)idmsRecovery
{
  return self->_idmsRecovery;
}

- (NSString)authenticationAuthToken
{
  return self->_authenticationAuthToken;
}

- (void)setAuthenticationAuthToken:(id)a3
{
  objc_storeStrong((id *)&self->_authenticationAuthToken, a3);
}

- (NSString)authenticationEscrowproxyUrl
{
  return self->_authenticationEscrowproxyUrl;
}

- (void)setAuthenticationEscrowproxyUrl:(id)a3
{
  objc_storeStrong((id *)&self->_authenticationEscrowproxyUrl, a3);
}

- (NSString)authenticationIcloudEnvironment
{
  return self->_authenticationIcloudEnvironment;
}

- (void)setAuthenticationIcloudEnvironment:(id)a3
{
  objc_storeStrong((id *)&self->_authenticationIcloudEnvironment, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fmipUuid, 0);
  objc_storeStrong((id *)&self->_authenticationPassword, 0);
  objc_storeStrong((id *)&self->_authenticationIcloudEnvironment, 0);
  objc_storeStrong((id *)&self->_authenticationEscrowproxyUrl, 0);
  objc_storeStrong((id *)&self->_authenticationDsid, 0);
  objc_storeStrong((id *)&self->_authenticationAuthToken, 0);
  objc_storeStrong((id *)&self->_authenticationAppleid, 0);
}

@end
