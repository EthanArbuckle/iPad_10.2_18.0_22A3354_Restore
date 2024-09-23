@implementation SDAutoUnlockAuthPromptRequest

- (void)setVersion:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasVersion
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasIconHash
{
  return self->_iconHash != 0;
}

- (BOOL)hasAppName
{
  return self->_appName != 0;
}

- (BOOL)hasNavBarTitle
{
  return self->_navBarTitle != 0;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SDAutoUnlockAuthPromptRequest;
  v3 = -[SDAutoUnlockAuthPromptRequest description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthPromptRequest dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *iconHash;
  NSString *appName;
  NSString *navBarTitle;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_version));
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("version"));

  }
  iconHash = self->_iconHash;
  if (iconHash)
    objc_msgSend(v3, "setObject:forKey:", iconHash, CFSTR("iconHash"));
  appName = self->_appName;
  if (appName)
    objc_msgSend(v3, "setObject:forKey:", appName, CFSTR("appName"));
  navBarTitle = self->_navBarTitle;
  if (navBarTitle)
    objc_msgSend(v3, "setObject:forKey:", navBarTitle, CFSTR("navBarTitle"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SDAutoUnlockAuthPromptRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSData *iconHash;
  NSString *appName;
  NSString *navBarTitle;
  id v8;

  v4 = a3;
  v8 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteUint32Field(v4, self->_version, 1);
    v4 = v8;
  }
  iconHash = self->_iconHash;
  if (iconHash)
  {
    PBDataWriterWriteDataField(v8, iconHash, 2);
    v4 = v8;
  }
  appName = self->_appName;
  if (appName)
  {
    PBDataWriterWriteStringField(v8, appName, 3);
    v4 = v8;
  }
  navBarTitle = self->_navBarTitle;
  if (navBarTitle)
  {
    PBDataWriterWriteStringField(v8, navBarTitle, 4);
    v4 = v8;
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[8] = self->_version;
    *((_BYTE *)v4 + 36) |= 1u;
  }
  v5 = v4;
  if (self->_iconHash)
  {
    objc_msgSend(v4, "setIconHash:");
    v4 = v5;
  }
  if (self->_appName)
  {
    objc_msgSend(v5, "setAppName:");
    v4 = v5;
  }
  if (self->_navBarTitle)
  {
    objc_msgSend(v5, "setNavBarTitle:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  _QWORD *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v5 + 8) = self->_version;
    *((_BYTE *)v5 + 36) |= 1u;
  }
  v7 = -[NSData copyWithZone:](self->_iconHash, "copyWithZone:", a3);
  v8 = (void *)v6[2];
  v6[2] = v7;

  v9 = -[NSString copyWithZone:](self->_appName, "copyWithZone:", a3);
  v10 = (void *)v6[1];
  v6[1] = v9;

  v11 = -[NSString copyWithZone:](self->_navBarTitle, "copyWithZone:", a3);
  v12 = (void *)v6[3];
  v6[3] = v11;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *iconHash;
  NSString *appName;
  NSString *navBarTitle;
  unsigned __int8 v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self)))
    goto LABEL_13;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 1) == 0 || self->_version != *((_DWORD *)v4 + 8))
      goto LABEL_13;
  }
  else if ((*((_BYTE *)v4 + 36) & 1) != 0)
  {
LABEL_13:
    v8 = 0;
    goto LABEL_14;
  }
  iconHash = self->_iconHash;
  if ((unint64_t)iconHash | *((_QWORD *)v4 + 2) && !-[NSData isEqual:](iconHash, "isEqual:"))
    goto LABEL_13;
  appName = self->_appName;
  if ((unint64_t)appName | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](appName, "isEqual:"))
      goto LABEL_13;
  }
  navBarTitle = self->_navBarTitle;
  if ((unint64_t)navBarTitle | *((_QWORD *)v4 + 3))
    v8 = -[NSString isEqual:](navBarTitle, "isEqual:");
  else
    v8 = 1;
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  NSUInteger v5;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_version;
  else
    v3 = 0;
  v4 = (unint64_t)-[NSData hash](self->_iconHash, "hash") ^ v3;
  v5 = -[NSString hash](self->_appName, "hash");
  return v4 ^ v5 ^ -[NSString hash](self->_navBarTitle, "hash");
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v4 = a3;
  if ((v4[9] & 1) != 0)
  {
    self->_version = v4[8];
    *(_BYTE *)&self->_has |= 1u;
  }
  v5 = v4;
  if (*((_QWORD *)v4 + 2))
  {
    -[SDAutoUnlockAuthPromptRequest setIconHash:](self, "setIconHash:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 1))
  {
    -[SDAutoUnlockAuthPromptRequest setAppName:](self, "setAppName:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[SDAutoUnlockAuthPromptRequest setNavBarTitle:](self, "setNavBarTitle:");
    v4 = v5;
  }

}

- (unsigned)version
{
  return self->_version;
}

- (NSData)iconHash
{
  return self->_iconHash;
}

- (void)setIconHash:(id)a3
{
  objc_storeStrong((id *)&self->_iconHash, a3);
}

- (NSString)appName
{
  return self->_appName;
}

- (void)setAppName:(id)a3
{
  objc_storeStrong((id *)&self->_appName, a3);
}

- (NSString)navBarTitle
{
  return self->_navBarTitle;
}

- (void)setNavBarTitle:(id)a3
{
  objc_storeStrong((id *)&self->_navBarTitle, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navBarTitle, 0);
  objc_storeStrong((id *)&self->_iconHash, 0);
  objc_storeStrong((id *)&self->_appName, 0);
}

@end
