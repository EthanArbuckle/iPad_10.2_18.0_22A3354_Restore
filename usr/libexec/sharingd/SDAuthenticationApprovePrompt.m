@implementation SDAuthenticationApprovePrompt

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

- (void)setType:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasType
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasSessionID
{
  return self->_sessionID != 0;
}

- (BOOL)hasAppName
{
  return self->_appName != 0;
}

- (BOOL)hasBundleID
{
  return self->_bundleID != 0;
}

- (void)setBiometricOnly:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_biometricOnly = a3;
}

- (void)setHasBiometricOnly:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasBiometricOnly
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
  v8.super_class = (Class)SDAuthenticationApprovePrompt;
  v3 = -[SDAuthenticationApprovePrompt description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAuthenticationApprovePrompt dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v6;
  NSString *sessionID;
  NSString *appName;
  NSString *bundleID;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_version));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("version"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_type));
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("type"));

  }
  sessionID = self->_sessionID;
  if (sessionID)
    objc_msgSend(v3, "setObject:forKey:", sessionID, CFSTR("sessionID"));
  appName = self->_appName;
  if (appName)
    objc_msgSend(v3, "setObject:forKey:", appName, CFSTR("appName"));
  bundleID = self->_bundleID;
  if (bundleID)
    objc_msgSend(v3, "setObject:forKey:", bundleID, CFSTR("bundleID"));
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_biometricOnly));
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("biometricOnly"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SDAuthenticationApprovePromptReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  NSString *sessionID;
  NSString *appName;
  NSString *bundleID;
  id v8;

  v8 = a3;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field(v8, self->_version, 1);
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
    PBDataWriterWriteUint32Field(v8, self->_type, 2);
  sessionID = self->_sessionID;
  if (sessionID)
    PBDataWriterWriteStringField(v8, sessionID, 3);
  appName = self->_appName;
  if (appName)
    PBDataWriterWriteStringField(v8, appName, 4);
  bundleID = self->_bundleID;
  if (bundleID)
    PBDataWriterWriteStringField(v8, bundleID, 5);
  if ((*(_BYTE *)&self->_has & 4) != 0)
    PBDataWriterWriteBOOLField(v8, self->_biometricOnly, 6);

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char has;
  _DWORD *v6;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[9] = self->_version;
    *((_BYTE *)v4 + 44) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    v4[8] = self->_type;
    *((_BYTE *)v4 + 44) |= 1u;
  }
  v6 = v4;
  if (self->_sessionID)
  {
    objc_msgSend(v4, "setSessionID:");
    v4 = v6;
  }
  if (self->_appName)
  {
    objc_msgSend(v6, "setAppName:");
    v4 = v6;
  }
  if (self->_bundleID)
  {
    objc_msgSend(v6, "setBundleID:");
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *((_BYTE *)v4 + 40) = self->_biometricOnly;
    *((_BYTE *)v4 + 44) |= 4u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _DWORD *v5;
  _QWORD *v6;
  char has;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5[9] = self->_version;
    *((_BYTE *)v5 + 44) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    v5[8] = self->_type;
    *((_BYTE *)v5 + 44) |= 1u;
  }
  v8 = -[NSString copyWithZone:](self->_sessionID, "copyWithZone:", a3);
  v9 = (void *)v6[3];
  v6[3] = v8;

  v10 = -[NSString copyWithZone:](self->_appName, "copyWithZone:", a3);
  v11 = (void *)v6[1];
  v6[1] = v10;

  v12 = -[NSString copyWithZone:](self->_bundleID, "copyWithZone:", a3);
  v13 = (void *)v6[2];
  v6[2] = v12;

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *((_BYTE *)v6 + 40) = self->_biometricOnly;
    *((_BYTE *)v6 + 44) |= 4u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  NSString *sessionID;
  NSString *appName;
  NSString *bundleID;
  BOOL v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
    goto LABEL_20;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 2) == 0 || self->_version != *((_DWORD *)v4 + 9))
      goto LABEL_20;
  }
  else if ((*((_BYTE *)v4 + 44) & 2) != 0)
  {
    goto LABEL_20;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 1) == 0 || self->_type != *((_DWORD *)v4 + 8))
      goto LABEL_20;
  }
  else if ((*((_BYTE *)v4 + 44) & 1) != 0)
  {
    goto LABEL_20;
  }
  sessionID = self->_sessionID;
  if ((unint64_t)sessionID | *((_QWORD *)v4 + 3) && !-[NSString isEqual:](sessionID, "isEqual:"))
    goto LABEL_20;
  appName = self->_appName;
  if ((unint64_t)appName | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](appName, "isEqual:"))
      goto LABEL_20;
  }
  bundleID = self->_bundleID;
  if ((unint64_t)bundleID | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](bundleID, "isEqual:"))
      goto LABEL_20;
  }
  v9 = (*((_BYTE *)v4 + 44) & 4) == 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 4) == 0)
    {
LABEL_20:
      v9 = 0;
      goto LABEL_21;
    }
    if (self->_biometricOnly)
    {
      if (!*((_BYTE *)v4 + 40))
        goto LABEL_20;
    }
    else if (*((_BYTE *)v4 + 40))
    {
      goto LABEL_20;
    }
    v9 = 1;
  }
LABEL_21:

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  uint64_t v8;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v3 = 2654435761 * self->_version;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_type;
      goto LABEL_6;
    }
  }
  v4 = 0;
LABEL_6:
  v5 = -[NSString hash](self->_sessionID, "hash");
  v6 = -[NSString hash](self->_appName, "hash");
  v7 = -[NSString hash](self->_bundleID, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
    v8 = 2654435761 * self->_biometricOnly;
  else
    v8 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 44);
  if ((v5 & 2) != 0)
  {
    self->_version = *((_DWORD *)v4 + 9);
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)v4 + 44);
  }
  if ((v5 & 1) != 0)
  {
    self->_type = *((_DWORD *)v4 + 8);
    *(_BYTE *)&self->_has |= 1u;
  }
  v6 = v4;
  if (*((_QWORD *)v4 + 3))
  {
    -[SDAuthenticationApprovePrompt setSessionID:](self, "setSessionID:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 1))
  {
    -[SDAuthenticationApprovePrompt setAppName:](self, "setAppName:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[SDAuthenticationApprovePrompt setBundleID:](self, "setBundleID:");
    v4 = v6;
  }
  if ((*((_BYTE *)v4 + 44) & 4) != 0)
  {
    self->_biometricOnly = *((_BYTE *)v4 + 40);
    *(_BYTE *)&self->_has |= 4u;
  }

}

- (unsigned)version
{
  return self->_version;
}

- (unsigned)type
{
  return self->_type;
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
  objc_storeStrong((id *)&self->_sessionID, a3);
}

- (NSString)appName
{
  return self->_appName;
}

- (void)setAppName:(id)a3
{
  objc_storeStrong((id *)&self->_appName, a3);
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_bundleID, a3);
}

- (BOOL)biometricOnly
{
  return self->_biometricOnly;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_appName, 0);
}

@end
