@implementation PDSProtoUserAuth

- (BOOL)hasGsAuthToken
{
  return self->_gsAuthToken != 0;
}

- (void)setGsAuthToken:(id)a3
{
  PDSProtoGSTokenAuth *v4;
  PDSProtoGSTokenAuth *gsAuthToken;

  v4 = (PDSProtoGSTokenAuth *)a3;
  -[PDSProtoUserAuth clearOneofValuesForUserauthOneof](self, "clearOneofValuesForUserauthOneof");
  *(_BYTE *)&self->_has |= 1u;
  self->_userauthOneof = 1;
  gsAuthToken = self->_gsAuthToken;
  self->_gsAuthToken = v4;

}

- (int)userauthOneof
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_userauthOneof;
  else
    return 0;
}

- (void)setUserauthOneof:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_userauthOneof = a3;
}

- (void)setHasUserauthOneof:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasUserauthOneof
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)userauthOneofAsString:(int)a3
{
  __CFString *v3;

  if (!a3)
    return CFSTR("PBUNSET");
  if (a3 == 1)
  {
    v3 = CFSTR("gsAuthToken");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsUserauthOneof:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PBUNSET")) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("gsAuthToken"));

  return v4;
}

- (void)clearOneofValuesForUserauthOneof
{
  PDSProtoGSTokenAuth *gsAuthToken;

  *(_BYTE *)&self->_has &= ~1u;
  self->_userauthOneof = 0;
  gsAuthToken = self->_gsAuthToken;
  self->_gsAuthToken = 0;

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
  v8.super_class = (Class)PDSProtoUserAuth;
  -[PDSProtoUserAuth description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDSProtoUserAuth dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  PDSProtoGSTokenAuth *gsAuthToken;
  void *v5;
  int userauthOneof;
  __CFString *v7;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  gsAuthToken = self->_gsAuthToken;
  if (gsAuthToken)
  {
    -[PDSProtoGSTokenAuth dictionaryRepresentation](gsAuthToken, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("gsAuthToken"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    userauthOneof = self->_userauthOneof;
    if (userauthOneof)
    {
      if (userauthOneof == 1)
      {
        v7 = CFSTR("gsAuthToken");
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_userauthOneof);
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v7 = CFSTR("PBUNSET");
    }
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("userauth_oneof"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PDSProtoUserAuthReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_gsAuthToken)
    PBDataWriterWriteSubmessage();
}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[4] = self->_userauthOneof;
    *((_BYTE *)v4 + 20) |= 1u;
  }
  if (self->_gsAuthToken)
  {
    v5 = v4;
    objc_msgSend(v4, "setGsAuthToken:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  id v7;
  void *v8;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_userauthOneof;
    *(_BYTE *)(v5 + 20) |= 1u;
  }
  v7 = -[PDSProtoGSTokenAuth copyWithZone:](self->_gsAuthToken, "copyWithZone:", a3);
  v8 = (void *)v6[1];
  v6[1] = v7;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  PDSProtoGSTokenAuth *gsAuthToken;
  char v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_9;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 1) == 0 || self->_userauthOneof != *((_DWORD *)v4 + 4))
      goto LABEL_9;
  }
  else if ((*((_BYTE *)v4 + 20) & 1) != 0)
  {
LABEL_9:
    v6 = 0;
    goto LABEL_10;
  }
  gsAuthToken = self->_gsAuthToken;
  if ((unint64_t)gsAuthToken | *((_QWORD *)v4 + 1))
    v6 = -[PDSProtoGSTokenAuth isEqual:](gsAuthToken, "isEqual:");
  else
    v6 = 1;
LABEL_10:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v2;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v2 = 2654435761 * self->_userauthOneof;
  else
    v2 = 0;
  return -[PDSProtoGSTokenAuth hash](self->_gsAuthToken, "hash") ^ v2;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  _QWORD *v5;
  PDSProtoGSTokenAuth *gsAuthToken;
  uint64_t v7;
  _QWORD *v8;

  v4 = a3;
  v5 = v4;
  if ((*((_BYTE *)v4 + 20) & 1) != 0)
  {
    self->_userauthOneof = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 1u;
  }
  gsAuthToken = self->_gsAuthToken;
  v7 = v5[1];
  if (gsAuthToken)
  {
    if (v7)
    {
      v8 = v5;
      -[PDSProtoGSTokenAuth mergeFrom:](gsAuthToken, "mergeFrom:");
LABEL_8:
      v5 = v8;
    }
  }
  else if (v7)
  {
    v8 = v5;
    -[PDSProtoUserAuth setGsAuthToken:](self, "setGsAuthToken:");
    goto LABEL_8;
  }

}

- (PDSProtoGSTokenAuth)gsAuthToken
{
  return self->_gsAuthToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gsAuthToken, 0);
}

@end
