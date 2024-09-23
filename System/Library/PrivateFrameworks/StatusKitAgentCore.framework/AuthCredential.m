@implementation AuthCredential

- (BOOL)hasSimpleJwt
{
  return self->_simpleJwt != 0;
}

- (void)setSimpleJwt:(id)a3
{
  NSString *v4;
  NSString *simpleJwt;

  v4 = (NSString *)a3;
  -[AuthCredential clearOneofValuesForAuthCredentialOneof](self, "clearOneofValuesForAuthCredentialOneof");
  *(_BYTE *)&self->_has |= 1u;
  self->_authCredentialOneof = 1;
  simpleJwt = self->_simpleJwt;
  self->_simpleJwt = v4;

}

- (BOOL)hasSharedOwnershipAuth
{
  return self->_sharedOwnershipAuth != 0;
}

- (void)setSharedOwnershipAuth:(id)a3
{
  SharedOwnershipAuth *v4;
  SharedOwnershipAuth *sharedOwnershipAuth;

  v4 = (SharedOwnershipAuth *)a3;
  -[AuthCredential clearOneofValuesForAuthCredentialOneof](self, "clearOneofValuesForAuthCredentialOneof");
  *(_BYTE *)&self->_has |= 1u;
  self->_authCredentialOneof = 2;
  sharedOwnershipAuth = self->_sharedOwnershipAuth;
  self->_sharedOwnershipAuth = v4;

}

- (int)authCredentialOneof
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_authCredentialOneof;
  else
    return 0;
}

- (void)setAuthCredentialOneof:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_authCredentialOneof = a3;
}

- (void)setHasAuthCredentialOneof:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAuthCredentialOneof
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)authCredentialOneofAsString:(int)a3
{
  if (a3 < 3)
    return off_24D977788[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsAuthCredentialOneof:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PBUNSET")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("simple_jwt")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("shared_ownership_auth")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)clearOneofValuesForAuthCredentialOneof
{
  NSString *simpleJwt;
  SharedOwnershipAuth *sharedOwnershipAuth;

  *(_BYTE *)&self->_has &= ~1u;
  self->_authCredentialOneof = 0;
  simpleJwt = self->_simpleJwt;
  self->_simpleJwt = 0;

  sharedOwnershipAuth = self->_sharedOwnershipAuth;
  self->_sharedOwnershipAuth = 0;

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)AuthCredential;
  -[AuthCredential description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AuthCredential dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *simpleJwt;
  SharedOwnershipAuth *sharedOwnershipAuth;
  void *v7;
  uint64_t authCredentialOneof;
  __CFString *v9;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  simpleJwt = self->_simpleJwt;
  if (simpleJwt)
    objc_msgSend(v3, "setObject:forKey:", simpleJwt, CFSTR("simple_jwt"));
  sharedOwnershipAuth = self->_sharedOwnershipAuth;
  if (sharedOwnershipAuth)
  {
    -[SharedOwnershipAuth dictionaryRepresentation](sharedOwnershipAuth, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("shared_ownership_auth"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    authCredentialOneof = self->_authCredentialOneof;
    if (authCredentialOneof >= 3)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_authCredentialOneof);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = off_24D977788[authCredentialOneof];
    }
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("auth_credential_oneof"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return AuthCredentialReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_simpleJwt)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_sharedOwnershipAuth)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[2] = self->_authCredentialOneof;
    *((_BYTE *)v4 + 32) |= 1u;
  }
  v5 = v4;
  if (self->_simpleJwt)
  {
    objc_msgSend(v4, "setSimpleJwt:");
    v4 = v5;
  }
  if (self->_sharedOwnershipAuth)
  {
    objc_msgSend(v5, "setSharedOwnershipAuth:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 8) = self->_authCredentialOneof;
    *(_BYTE *)(v5 + 32) |= 1u;
  }
  v7 = -[NSString copyWithZone:](self->_simpleJwt, "copyWithZone:", a3);
  v8 = (void *)v6[3];
  v6[3] = v7;

  v9 = -[SharedOwnershipAuth copyWithZone:](self->_sharedOwnershipAuth, "copyWithZone:", a3);
  v10 = (void *)v6[2];
  v6[2] = v9;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *simpleJwt;
  SharedOwnershipAuth *sharedOwnershipAuth;
  char v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_11;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) == 0 || self->_authCredentialOneof != *((_DWORD *)v4 + 2))
      goto LABEL_11;
  }
  else if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
LABEL_11:
    v7 = 0;
    goto LABEL_12;
  }
  simpleJwt = self->_simpleJwt;
  if ((unint64_t)simpleJwt | *((_QWORD *)v4 + 3) && !-[NSString isEqual:](simpleJwt, "isEqual:"))
    goto LABEL_11;
  sharedOwnershipAuth = self->_sharedOwnershipAuth;
  if ((unint64_t)sharedOwnershipAuth | *((_QWORD *)v4 + 2))
    v7 = -[SharedOwnershipAuth isEqual:](sharedOwnershipAuth, "isEqual:");
  else
    v7 = 1;
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_authCredentialOneof;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_simpleJwt, "hash") ^ v3;
  return v4 ^ -[SharedOwnershipAuth hash](self->_sharedOwnershipAuth, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  _QWORD *v5;
  SharedOwnershipAuth *sharedOwnershipAuth;
  uint64_t v7;
  _QWORD *v8;

  v4 = a3;
  v5 = v4;
  if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
    self->_authCredentialOneof = *((_DWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
  }
  v8 = v4;
  if (*((_QWORD *)v4 + 3))
  {
    -[AuthCredential setSimpleJwt:](self, "setSimpleJwt:");
    v5 = v8;
  }
  sharedOwnershipAuth = self->_sharedOwnershipAuth;
  v7 = v5[2];
  if (sharedOwnershipAuth)
  {
    if (v7)
    {
      -[SharedOwnershipAuth mergeFrom:](sharedOwnershipAuth, "mergeFrom:");
LABEL_10:
      v5 = v8;
    }
  }
  else if (v7)
  {
    -[AuthCredential setSharedOwnershipAuth:](self, "setSharedOwnershipAuth:");
    goto LABEL_10;
  }

}

- (NSString)simpleJwt
{
  return self->_simpleJwt;
}

- (SharedOwnershipAuth)sharedOwnershipAuth
{
  return self->_sharedOwnershipAuth;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_simpleJwt, 0);
  objc_storeStrong((id *)&self->_sharedOwnershipAuth, 0);
}

@end
