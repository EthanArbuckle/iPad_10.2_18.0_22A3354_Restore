@implementation PBBProtoDemoWirelessCredentials

- (BOOL)hasSsid
{
  return self->_ssid != 0;
}

- (BOOL)hasPassword
{
  return self->_password != 0;
}

- (void)setCompanionDemoConfig:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_companionDemoConfig = a3;
}

- (void)setHasCompanionDemoConfig:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCompanionDemoConfig
{
  return *(_BYTE *)&self->_has & 1;
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
  v8.super_class = (Class)PBBProtoDemoWirelessCredentials;
  -[PBBProtoDemoWirelessCredentials description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBBProtoDemoWirelessCredentials dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *ssid;
  NSString *password;
  void *v7;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  ssid = self->_ssid;
  if (ssid)
    objc_msgSend(v3, "setObject:forKey:", ssid, CFSTR("ssid"));
  password = self->_password;
  if (password)
    objc_msgSend(v4, "setObject:forKey:", password, CFSTR("password"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_companionDemoConfig);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("companionDemoConfig"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return PBBProtoDemoWirelessCredentialsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_ssid)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_password)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_ssid)
  {
    objc_msgSend(v4, "setSsid:");
    v4 = v5;
  }
  if (self->_password)
  {
    objc_msgSend(v5, "setPassword:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v4 + 2) = self->_companionDemoConfig;
    *((_BYTE *)v4 + 32) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_ssid, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v6;

  v8 = -[NSString copyWithZone:](self->_password, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 8) = self->_companionDemoConfig;
    *(_BYTE *)(v5 + 32) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *ssid;
  NSString *password;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_10;
  ssid = self->_ssid;
  if ((unint64_t)ssid | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](ssid, "isEqual:"))
      goto LABEL_10;
  }
  password = self->_password;
  if ((unint64_t)password | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](password, "isEqual:"))
      goto LABEL_10;
  }
  v7 = (*((_BYTE *)v4 + 32) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) != 0 && self->_companionDemoConfig == *((_DWORD *)v4 + 2))
    {
      v7 = 1;
      goto LABEL_11;
    }
LABEL_10:
    v7 = 0;
  }
LABEL_11:

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  uint64_t v5;

  v3 = -[NSString hash](self->_ssid, "hash");
  v4 = -[NSString hash](self->_password, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v5 = 2654435761 * self->_companionDemoConfig;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  unsigned int *v4;
  unsigned int *v5;

  v4 = (unsigned int *)a3;
  v5 = v4;
  if (*((_QWORD *)v4 + 3))
  {
    -[PBBProtoDemoWirelessCredentials setSsid:](self, "setSsid:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[PBBProtoDemoWirelessCredentials setPassword:](self, "setPassword:");
    v4 = v5;
  }
  if ((v4[8] & 1) != 0)
  {
    self->_companionDemoConfig = v4[2];
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (NSString)ssid
{
  return self->_ssid;
}

- (void)setSsid:(id)a3
{
  objc_storeStrong((id *)&self->_ssid, a3);
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
  objc_storeStrong((id *)&self->_password, a3);
}

- (unsigned)companionDemoConfig
{
  return self->_companionDemoConfig;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ssid, 0);
  objc_storeStrong((id *)&self->_password, 0);
}

@end
