@implementation SDAutoUnlockAWDLInfo

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

- (BOOL)hasAwdlInfo
{
  return self->_awdlInfo != 0;
}

- (void)setUseToken:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x80u;
  self->_useToken = a3;
}

- (void)setHasUseToken:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 0x80;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = v3 & 0x80 | *(_BYTE *)&self->_has & 0x7F;
}

- (BOOL)hasUseToken
{
  return *(_BYTE *)&self->_has >> 7;
}

- (BOOL)hasKeyData
{
  return self->_keyData != 0;
}

- (void)setErrorCode:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_errorCode = a3;
}

- (void)setHasErrorCode:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasErrorCode
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setAuthPrompt:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_authPrompt = a3;
}

- (void)setHasAuthPrompt:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasAuthPrompt
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setSupportsConfirmationACK:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_supportsConfirmationACK = a3;
}

- (void)setHasSupportsConfirmationACK:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasSupportsConfirmationACK
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (BOOL)hasAppName
{
  return self->_appName != 0;
}

- (void)setPhoneUnlockDate:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_phoneUnlockDate = a3;
}

- (void)setHasPhoneUnlockDate:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPhoneUnlockDate
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setSkipMotionCheck:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_skipMotionCheck = a3;
}

- (void)setHasSkipMotionCheck:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasSkipMotionCheck
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setIsAuthenticatingForSiri:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_isAuthenticatingForSiri = a3;
}

- (void)setHasIsAuthenticatingForSiri:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasIsAuthenticatingForSiri
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SDAutoUnlockAWDLInfo;
  v3 = -[SDAutoUnlockAWDLInfo description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAWDLInfo dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *awdlInfo;
  void *v6;
  NSData *keyData;
  char has;
  void *v9;
  NSString *appName;
  char v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_version));
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("version"));

  }
  awdlInfo = self->_awdlInfo;
  if (awdlInfo)
    objc_msgSend(v3, "setObject:forKey:", awdlInfo, CFSTR("awdlInfo"));
  if ((*(_BYTE *)&self->_has & 0x80000000) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_useToken));
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("useToken"));

  }
  keyData = self->_keyData;
  if (keyData)
    objc_msgSend(v3, "setObject:forKey:", keyData, CFSTR("keyData"));
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_errorCode));
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("errorCode"));

    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_11:
      if ((has & 0x40) == 0)
        goto LABEL_13;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_11;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_authPrompt));
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("authPrompt"));

  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
LABEL_12:
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_supportsConfirmationACK));
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("supportsConfirmationACK"));

  }
LABEL_13:
  appName = self->_appName;
  if (appName)
    objc_msgSend(v3, "setObject:forKey:", appName, CFSTR("appName"));
  v11 = (char)self->_has;
  if ((v11 & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 0x20) == 0)
      goto LABEL_17;
LABEL_24:
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_skipMotionCheck));
    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("skipMotionCheck"));

    if ((*(_BYTE *)&self->_has & 0x10) == 0)
      return v3;
    goto LABEL_18;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_phoneUnlockDate));
  objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("phoneUnlockDate"));

  v11 = (char)self->_has;
  if ((v11 & 0x20) != 0)
    goto LABEL_24;
LABEL_17:
  if ((v11 & 0x10) != 0)
  {
LABEL_18:
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_isAuthenticatingForSiri));
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("isAuthenticatingForSiri"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SDAutoUnlockAWDLInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  NSData *awdlInfo;
  NSData *keyData;
  char has;
  NSString *appName;
  char v8;
  id v9;

  v9 = a3;
  if ((*(_BYTE *)&self->_has & 4) != 0)
    PBDataWriterWriteUint32Field(v9, self->_version, 1);
  awdlInfo = self->_awdlInfo;
  if (awdlInfo)
    PBDataWriterWriteDataField(v9, awdlInfo, 2);
  if ((*(_BYTE *)&self->_has & 0x80000000) != 0)
    PBDataWriterWriteBOOLField(v9, self->_useToken, 3);
  keyData = self->_keyData;
  if (keyData)
    PBDataWriterWriteDataField(v9, keyData, 4);
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field(v9, self->_errorCode, 5);
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_11:
      if ((has & 0x40) == 0)
        goto LABEL_13;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_11;
  }
  PBDataWriterWriteBOOLField(v9, self->_authPrompt, 6);
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
LABEL_12:
    PBDataWriterWriteBOOLField(v9, self->_supportsConfirmationACK, 7);
LABEL_13:
  appName = self->_appName;
  if (appName)
    PBDataWriterWriteStringField(v9, appName, 8);
  v8 = (char)self->_has;
  if ((v8 & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 0x20) == 0)
      goto LABEL_17;
LABEL_24:
    PBDataWriterWriteBOOLField(v9, self->_skipMotionCheck, 10);
    if ((*(_BYTE *)&self->_has & 0x10) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
  PBDataWriterWriteDoubleField(v9, 9, self->_phoneUnlockDate);
  v8 = (char)self->_has;
  if ((v8 & 0x20) != 0)
    goto LABEL_24;
LABEL_17:
  if ((v8 & 0x10) != 0)
LABEL_18:
    PBDataWriterWriteBOOLField(v9, self->_isAuthenticatingForSiri, 11);
LABEL_19:

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char has;
  char v6;
  _DWORD *v7;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v4[12] = self->_version;
    *((_BYTE *)v4 + 60) |= 4u;
  }
  v7 = v4;
  if (self->_awdlInfo)
  {
    objc_msgSend(v4, "setAwdlInfo:");
    v4 = v7;
  }
  if ((*(_BYTE *)&self->_has & 0x80000000) != 0)
  {
    *((_BYTE *)v4 + 56) = self->_useToken;
    *((_BYTE *)v4 + 60) |= 0x80u;
  }
  if (self->_keyData)
  {
    objc_msgSend(v7, "setKeyData:");
    v4 = v7;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[8] = self->_errorCode;
    *((_BYTE *)v4 + 60) |= 2u;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_11:
      if ((has & 0x40) == 0)
        goto LABEL_13;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_11;
  }
  *((_BYTE *)v4 + 52) = self->_authPrompt;
  *((_BYTE *)v4 + 60) |= 8u;
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
LABEL_12:
    *((_BYTE *)v4 + 55) = self->_supportsConfirmationACK;
    *((_BYTE *)v4 + 60) |= 0x40u;
  }
LABEL_13:
  if (self->_appName)
  {
    objc_msgSend(v7, "setAppName:");
    v4 = v7;
  }
  v6 = (char)self->_has;
  if ((v6 & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 0x20) == 0)
      goto LABEL_17;
LABEL_24:
    *((_BYTE *)v4 + 54) = self->_skipMotionCheck;
    *((_BYTE *)v4 + 60) |= 0x20u;
    if ((*(_BYTE *)&self->_has & 0x10) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
  *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_phoneUnlockDate;
  *((_BYTE *)v4 + 60) |= 1u;
  v6 = (char)self->_has;
  if ((v6 & 0x20) != 0)
    goto LABEL_24;
LABEL_17:
  if ((v6 & 0x10) != 0)
  {
LABEL_18:
    *((_BYTE *)v4 + 53) = self->_isAuthenticatingForSiri;
    *((_BYTE *)v4 + 60) |= 0x10u;
  }
LABEL_19:

}

- (id)copyWithZone:(_NSZone *)a3
{
  _DWORD *v5;
  _QWORD *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  char has;
  id v12;
  void *v13;
  char v14;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v5[12] = self->_version;
    *((_BYTE *)v5 + 60) |= 4u;
  }
  v7 = -[NSData copyWithZone:](self->_awdlInfo, "copyWithZone:", a3);
  v8 = (void *)v6[3];
  v6[3] = v7;

  if ((*(_BYTE *)&self->_has & 0x80000000) != 0)
  {
    *((_BYTE *)v6 + 56) = self->_useToken;
    *((_BYTE *)v6 + 60) |= 0x80u;
  }
  v9 = -[NSData copyWithZone:](self->_keyData, "copyWithZone:", a3);
  v10 = (void *)v6[5];
  v6[5] = v9;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v6 + 8) = self->_errorCode;
    *((_BYTE *)v6 + 60) |= 2u;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_7:
      if ((has & 0x40) == 0)
        goto LABEL_9;
      goto LABEL_8;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_7;
  }
  *((_BYTE *)v6 + 52) = self->_authPrompt;
  *((_BYTE *)v6 + 60) |= 8u;
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
LABEL_8:
    *((_BYTE *)v6 + 55) = self->_supportsConfirmationACK;
    *((_BYTE *)v6 + 60) |= 0x40u;
  }
LABEL_9:
  v12 = -[NSString copyWithZone:](self->_appName, "copyWithZone:", a3);
  v13 = (void *)v6[2];
  v6[2] = v12;

  v14 = (char)self->_has;
  if ((v14 & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 0x20) == 0)
      goto LABEL_11;
LABEL_18:
    *((_BYTE *)v6 + 54) = self->_skipMotionCheck;
    *((_BYTE *)v6 + 60) |= 0x20u;
    if ((*(_BYTE *)&self->_has & 0x10) == 0)
      return v6;
    goto LABEL_12;
  }
  v6[1] = *(_QWORD *)&self->_phoneUnlockDate;
  *((_BYTE *)v6 + 60) |= 1u;
  v14 = (char)self->_has;
  if ((v14 & 0x20) != 0)
    goto LABEL_18;
LABEL_11:
  if ((v14 & 0x10) != 0)
  {
LABEL_12:
    *((_BYTE *)v6 + 53) = self->_isAuthenticatingForSiri;
    *((_BYTE *)v6 + 60) |= 0x10u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  char *v4;
  uint64_t v5;
  char has;
  NSData *awdlInfo;
  int v8;
  NSData *keyData;
  NSString *appName;
  BOOL v11;

  v4 = (char *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
    goto LABEL_60;
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    if ((v4[60] & 4) == 0 || self->_version != *((_DWORD *)v4 + 12))
      goto LABEL_60;
  }
  else if ((v4[60] & 4) != 0)
  {
    goto LABEL_60;
  }
  awdlInfo = self->_awdlInfo;
  if ((unint64_t)awdlInfo | *((_QWORD *)v4 + 3))
  {
    if (!-[NSData isEqual:](awdlInfo, "isEqual:"))
      goto LABEL_60;
    has = (char)self->_has;
  }
  v8 = v4[60];
  if (has < 0)
  {
    if ((v8 & 0x80000000) == 0)
      goto LABEL_60;
    if (self->_useToken)
    {
      if (!v4[56])
        goto LABEL_60;
    }
    else if (v4[56])
    {
      goto LABEL_60;
    }
  }
  else if (v8 < 0)
  {
    goto LABEL_60;
  }
  keyData = self->_keyData;
  if ((unint64_t)keyData | *((_QWORD *)v4 + 5))
  {
    if (!-[NSData isEqual:](keyData, "isEqual:"))
      goto LABEL_60;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    if ((v4[60] & 2) == 0 || self->_errorCode != *((_DWORD *)v4 + 8))
      goto LABEL_60;
  }
  else if ((v4[60] & 2) != 0)
  {
    goto LABEL_60;
  }
  if ((has & 8) != 0)
  {
    if ((v4[60] & 8) == 0)
      goto LABEL_60;
    if (self->_authPrompt)
    {
      if (!v4[52])
        goto LABEL_60;
    }
    else if (v4[52])
    {
      goto LABEL_60;
    }
  }
  else if ((v4[60] & 8) != 0)
  {
    goto LABEL_60;
  }
  if ((has & 0x40) != 0)
  {
    if ((v4[60] & 0x40) == 0)
      goto LABEL_60;
    if (self->_supportsConfirmationACK)
    {
      if (!v4[55])
        goto LABEL_60;
    }
    else if (v4[55])
    {
      goto LABEL_60;
    }
  }
  else if ((v4[60] & 0x40) != 0)
  {
    goto LABEL_60;
  }
  appName = self->_appName;
  if ((unint64_t)appName | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](appName, "isEqual:"))
      goto LABEL_60;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    if ((v4[60] & 1) == 0 || self->_phoneUnlockDate != *((double *)v4 + 1))
      goto LABEL_60;
  }
  else if ((v4[60] & 1) != 0)
  {
    goto LABEL_60;
  }
  if ((has & 0x20) != 0)
  {
    if ((v4[60] & 0x20) == 0)
      goto LABEL_60;
    if (self->_skipMotionCheck)
    {
      if (!v4[54])
        goto LABEL_60;
    }
    else if (v4[54])
    {
      goto LABEL_60;
    }
  }
  else if ((v4[60] & 0x20) != 0)
  {
    goto LABEL_60;
  }
  v11 = (v4[60] & 0x10) == 0;
  if ((has & 0x10) != 0)
  {
    if ((v4[60] & 0x10) != 0)
    {
      if (self->_isAuthenticatingForSiri)
      {
        if (!v4[53])
          goto LABEL_60;
      }
      else if (v4[53])
      {
        goto LABEL_60;
      }
      v11 = 1;
      goto LABEL_61;
    }
LABEL_60:
    v11 = 0;
  }
LABEL_61:

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSUInteger v9;
  char has;
  unint64_t v11;
  double phoneUnlockDate;
  double v13;
  long double v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;

  if ((*(_BYTE *)&self->_has & 4) != 0)
    v19 = 2654435761 * self->_version;
  else
    v19 = 0;
  v3 = (unint64_t)-[NSData hash](self->_awdlInfo, "hash");
  if ((*(_BYTE *)&self->_has & 0x80000000) != 0)
    v4 = 2654435761 * self->_useToken;
  else
    v4 = 0;
  v5 = (unint64_t)-[NSData hash](self->_keyData, "hash");
  if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    v6 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_9;
LABEL_12:
    v7 = 0;
    if ((*(_BYTE *)&self->_has & 0x40) != 0)
      goto LABEL_10;
    goto LABEL_13;
  }
  v6 = 2654435761 * self->_errorCode;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_12;
LABEL_9:
  v7 = 2654435761 * self->_authPrompt;
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
LABEL_10:
    v8 = 2654435761 * self->_supportsConfirmationACK;
    goto LABEL_14;
  }
LABEL_13:
  v8 = 0;
LABEL_14:
  v9 = -[NSString hash](self->_appName, "hash");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    phoneUnlockDate = self->_phoneUnlockDate;
    v13 = -phoneUnlockDate;
    if (phoneUnlockDate >= 0.0)
      v13 = self->_phoneUnlockDate;
    v14 = floor(v13 + 0.5);
    v15 = (v13 - v14) * 1.84467441e19;
    v11 = 2654435761u * (unint64_t)fmod(v14, 1.84467441e19);
    if (v15 >= 0.0)
    {
      if (v15 > 0.0)
        v11 += (unint64_t)v15;
    }
    else
    {
      v11 -= (unint64_t)fabs(v15);
    }
  }
  else
  {
    v11 = 0;
  }
  if ((has & 0x20) != 0)
  {
    v16 = 2654435761 * self->_skipMotionCheck;
    if ((has & 0x10) != 0)
      goto LABEL_24;
LABEL_26:
    v17 = 0;
    return v3 ^ v19 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v11 ^ v16 ^ v17;
  }
  v16 = 0;
  if ((has & 0x10) == 0)
    goto LABEL_26;
LABEL_24:
  v17 = 2654435761 * self->_isAuthenticatingForSiri;
  return v3 ^ v19 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v11 ^ v16 ^ v17;
}

- (void)mergeFrom:(id)a3
{
  char *v4;
  char v5;
  char v6;
  char *v7;

  v4 = (char *)a3;
  if ((v4[60] & 4) != 0)
  {
    self->_version = *((_DWORD *)v4 + 12);
    *(_BYTE *)&self->_has |= 4u;
  }
  v7 = v4;
  if (*((_QWORD *)v4 + 3))
  {
    -[SDAutoUnlockAWDLInfo setAwdlInfo:](self, "setAwdlInfo:");
    v4 = v7;
  }
  if (v4[60] < 0)
  {
    self->_useToken = v4[56];
    *(_BYTE *)&self->_has |= 0x80u;
  }
  if (*((_QWORD *)v4 + 5))
  {
    -[SDAutoUnlockAWDLInfo setKeyData:](self, "setKeyData:");
    v4 = v7;
  }
  v5 = v4[60];
  if ((v5 & 2) != 0)
  {
    self->_errorCode = *((_DWORD *)v4 + 8);
    *(_BYTE *)&self->_has |= 2u;
    v5 = v4[60];
    if ((v5 & 8) == 0)
    {
LABEL_11:
      if ((v5 & 0x40) == 0)
        goto LABEL_13;
      goto LABEL_12;
    }
  }
  else if ((v4[60] & 8) == 0)
  {
    goto LABEL_11;
  }
  self->_authPrompt = v4[52];
  *(_BYTE *)&self->_has |= 8u;
  if ((v4[60] & 0x40) != 0)
  {
LABEL_12:
    self->_supportsConfirmationACK = v4[55];
    *(_BYTE *)&self->_has |= 0x40u;
  }
LABEL_13:
  if (*((_QWORD *)v4 + 2))
  {
    -[SDAutoUnlockAWDLInfo setAppName:](self, "setAppName:");
    v4 = v7;
  }
  v6 = v4[60];
  if ((v6 & 1) == 0)
  {
    if ((v4[60] & 0x20) == 0)
      goto LABEL_17;
LABEL_24:
    self->_skipMotionCheck = v4[54];
    *(_BYTE *)&self->_has |= 0x20u;
    if ((v4[60] & 0x10) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
  self->_phoneUnlockDate = *((double *)v4 + 1);
  *(_BYTE *)&self->_has |= 1u;
  v6 = v4[60];
  if ((v6 & 0x20) != 0)
    goto LABEL_24;
LABEL_17:
  if ((v6 & 0x10) != 0)
  {
LABEL_18:
    self->_isAuthenticatingForSiri = v4[53];
    *(_BYTE *)&self->_has |= 0x10u;
  }
LABEL_19:

}

- (unsigned)version
{
  return self->_version;
}

- (NSData)awdlInfo
{
  return self->_awdlInfo;
}

- (void)setAwdlInfo:(id)a3
{
  objc_storeStrong((id *)&self->_awdlInfo, a3);
}

- (BOOL)useToken
{
  return self->_useToken;
}

- (NSData)keyData
{
  return self->_keyData;
}

- (void)setKeyData:(id)a3
{
  objc_storeStrong((id *)&self->_keyData, a3);
}

- (unsigned)errorCode
{
  return self->_errorCode;
}

- (BOOL)authPrompt
{
  return self->_authPrompt;
}

- (BOOL)supportsConfirmationACK
{
  return self->_supportsConfirmationACK;
}

- (NSString)appName
{
  return self->_appName;
}

- (void)setAppName:(id)a3
{
  objc_storeStrong((id *)&self->_appName, a3);
}

- (double)phoneUnlockDate
{
  return self->_phoneUnlockDate;
}

- (BOOL)skipMotionCheck
{
  return self->_skipMotionCheck;
}

- (BOOL)isAuthenticatingForSiri
{
  return self->_isAuthenticatingForSiri;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyData, 0);
  objc_storeStrong((id *)&self->_awdlInfo, 0);
  objc_storeStrong((id *)&self->_appName, 0);
}

@end
