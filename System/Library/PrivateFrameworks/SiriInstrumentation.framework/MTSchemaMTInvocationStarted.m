@implementation MTSchemaMTInvocationStarted

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)MTSchemaMTInvocationStarted;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v19, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTSchemaMTInvocationStarted linkId](self, "linkId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[MTSchemaMTInvocationStarted deleteLinkId](self, "deleteLinkId");
  -[MTSchemaMTInvocationStarted qssSessionId](self, "qssSessionId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[MTSchemaMTInvocationStarted deleteQssSessionId](self, "deleteQssSessionId");
  -[MTSchemaMTInvocationStarted appInvocationMetadata](self, "appInvocationMetadata");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[MTSchemaMTInvocationStarted deleteAppInvocationMetadata](self, "deleteAppInvocationMetadata");
  -[MTSchemaMTInvocationStarted apiInvocationMetadata](self, "apiInvocationMetadata");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applySensitiveConditionsPolicy:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "suppressMessage");

  if (v17)
    -[MTSchemaMTInvocationStarted deleteApiInvocationMetadata](self, "deleteApiInvocationMetadata");

  return v5;
}

- (BOOL)hasLinkId
{
  return self->_linkId != 0;
}

- (void)deleteLinkId
{
  -[MTSchemaMTInvocationStarted setLinkId:](self, "setLinkId:", 0);
}

- (void)setIsOnDeviceTranslation:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_isOnDeviceTranslation = a3;
}

- (BOOL)hasIsOnDeviceTranslation
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasIsOnDeviceTranslation:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteIsOnDeviceTranslation
{
  -[MTSchemaMTInvocationStarted setIsOnDeviceTranslation:](self, "setIsOnDeviceTranslation:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setMobileAssetConfigVersion:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_mobileAssetConfigVersion = a3;
}

- (BOOL)hasMobileAssetConfigVersion
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasMobileAssetConfigVersion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteMobileAssetConfigVersion
{
  -[MTSchemaMTInvocationStarted setMobileAssetConfigVersion:](self, "setMobileAssetConfigVersion:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setTask:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_task = a3;
}

- (BOOL)hasTask
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasTask:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteTask
{
  -[MTSchemaMTInvocationStarted setTask:](self, "setTask:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (void)setInputSource:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_inputSource = a3;
}

- (BOOL)hasInputSource
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasInputSource:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)deleteInputSource
{
  -[MTSchemaMTInvocationStarted setInputSource:](self, "setInputSource:", 0);
  *(_BYTE *)&self->_has &= ~8u;
}

- (void)setIsExplicitLanguageFilterEnabled:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_isExplicitLanguageFilterEnabled = a3;
}

- (BOOL)hasIsExplicitLanguageFilterEnabled
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setHasIsExplicitLanguageFilterEnabled:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (void)deleteIsExplicitLanguageFilterEnabled
{
  -[MTSchemaMTInvocationStarted setIsExplicitLanguageFilterEnabled:](self, "setIsExplicitLanguageFilterEnabled:", 0);
  *(_BYTE *)&self->_has &= ~0x10u;
}

- (void)setIsLanguageIdentificationEnabled:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_isLanguageIdentificationEnabled = a3;
}

- (BOOL)hasIsLanguageIdentificationEnabled
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setHasIsLanguageIdentificationEnabled:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (void)deleteIsLanguageIdentificationEnabled
{
  -[MTSchemaMTInvocationStarted setIsLanguageIdentificationEnabled:](self, "setIsLanguageIdentificationEnabled:", 0);
  *(_BYTE *)&self->_has &= ~0x20u;
}

- (void)setDisplayMode:(int)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_displayMode = a3;
}

- (BOOL)hasDisplayMode
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setHasDisplayMode:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (void)deleteDisplayMode
{
  -[MTSchemaMTInvocationStarted setDisplayMode:](self, "setDisplayMode:", 0);
  *(_BYTE *)&self->_has &= ~0x40u;
}

- (BOOL)hasQssSessionId
{
  return self->_qssSessionId != 0;
}

- (void)deleteQssSessionId
{
  -[MTSchemaMTInvocationStarted setQssSessionId:](self, "setQssSessionId:", 0);
}

- (void)setInvocationType:(int)a3
{
  *(_BYTE *)&self->_has |= 0x80u;
  self->_invocationType = a3;
}

- (BOOL)hasInvocationType
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setHasInvocationType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 0x80;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = v3 & 0x80 | *(_BYTE *)&self->_has & 0x7F;
}

- (void)deleteInvocationType
{
  -[MTSchemaMTInvocationStarted setInvocationType:](self, "setInvocationType:", 0);
  *(_BYTE *)&self->_has &= ~0x80u;
}

- (void)setAppInvocationMetadata:(id)a3
{
  MTSchemaMTAppInvocationMetadata *v4;
  MTSchemaMTApiInvocationMetadata *apiInvocationMetadata;
  unint64_t v6;
  MTSchemaMTAppInvocationMetadata *appInvocationMetadata;

  v4 = (MTSchemaMTAppInvocationMetadata *)a3;
  apiInvocationMetadata = self->_apiInvocationMetadata;
  self->_apiInvocationMetadata = 0;

  v6 = 11;
  if (!v4)
    v6 = 0;
  self->_whichInvocationmetadata = v6;
  appInvocationMetadata = self->_appInvocationMetadata;
  self->_appInvocationMetadata = v4;

}

- (MTSchemaMTAppInvocationMetadata)appInvocationMetadata
{
  if (self->_whichInvocationmetadata == 11)
    return self->_appInvocationMetadata;
  else
    return (MTSchemaMTAppInvocationMetadata *)0;
}

- (void)deleteAppInvocationMetadata
{
  MTSchemaMTAppInvocationMetadata *appInvocationMetadata;

  if (self->_whichInvocationmetadata == 11)
  {
    self->_whichInvocationmetadata = 0;
    appInvocationMetadata = self->_appInvocationMetadata;
    self->_appInvocationMetadata = 0;

  }
}

- (void)setApiInvocationMetadata:(id)a3
{
  MTSchemaMTApiInvocationMetadata *v4;
  MTSchemaMTAppInvocationMetadata *appInvocationMetadata;
  unint64_t v6;
  MTSchemaMTApiInvocationMetadata *apiInvocationMetadata;

  v4 = (MTSchemaMTApiInvocationMetadata *)a3;
  appInvocationMetadata = self->_appInvocationMetadata;
  self->_appInvocationMetadata = 0;

  v6 = 12;
  if (!v4)
    v6 = 0;
  self->_whichInvocationmetadata = v6;
  apiInvocationMetadata = self->_apiInvocationMetadata;
  self->_apiInvocationMetadata = v4;

}

- (MTSchemaMTApiInvocationMetadata)apiInvocationMetadata
{
  if (self->_whichInvocationmetadata == 12)
    return self->_apiInvocationMetadata;
  else
    return (MTSchemaMTApiInvocationMetadata *)0;
}

- (void)deleteApiInvocationMetadata
{
  MTSchemaMTApiInvocationMetadata *apiInvocationMetadata;

  if (self->_whichInvocationmetadata == 12)
  {
    self->_whichInvocationmetadata = 0;
    apiInvocationMetadata = self->_apiInvocationMetadata;
    self->_apiInvocationMetadata = 0;

  }
}

- (BOOL)readFrom:(id)a3
{
  return MTSchemaMTInvocationStartedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  char has;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  -[MTSchemaMTInvocationStarted linkId](self, "linkId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[MTSchemaMTInvocationStarted linkId](self, "linkId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 4) == 0)
        goto LABEL_6;
      goto LABEL_22;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 8) == 0)
      goto LABEL_7;
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0)
      goto LABEL_8;
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteBOOLField();
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_9:
    if ((has & 0x40) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_25:
  PBDataWriterWriteBOOLField();
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
LABEL_10:
    PBDataWriterWriteInt32Field();
LABEL_11:
  -[MTSchemaMTInvocationStarted qssSessionId](self, "qssSessionId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[MTSchemaMTInvocationStarted qssSessionId](self, "qssSessionId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if ((*(_BYTE *)&self->_has & 0x80000000) != 0)
    PBDataWriterWriteInt32Field();
  -[MTSchemaMTInvocationStarted appInvocationMetadata](self, "appInvocationMetadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[MTSchemaMTInvocationStarted appInvocationMetadata](self, "appInvocationMetadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[MTSchemaMTInvocationStarted apiInvocationMetadata](self, "apiInvocationMetadata");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = v14;
  if (v11)
  {
    -[MTSchemaMTInvocationStarted apiInvocationMetadata](self, "apiInvocationMetadata");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v12 = v14;
  }

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  unint64_t whichInvocationmetadata;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  $FD8C404CD88DEFFF107DCA083DE2BCA6 has;
  unsigned int v14;
  int isOnDeviceTranslation;
  int v16;
  unsigned int mobileAssetConfigVersion;
  int v18;
  int task;
  int v20;
  int inputSource;
  int v22;
  int isExplicitLanguageFilterEnabled;
  int v24;
  int isLanguageIdentificationEnabled;
  int v26;
  int displayMode;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  $FD8C404CD88DEFFF107DCA083DE2BCA6 v33;
  int invocationType;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  char v44;
  BOOL v45;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_53;
  whichInvocationmetadata = self->_whichInvocationmetadata;
  if (whichInvocationmetadata != objc_msgSend(v4, "whichInvocationmetadata"))
    goto LABEL_53;
  -[MTSchemaMTInvocationStarted linkId](self, "linkId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "linkId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_52;
  -[MTSchemaMTInvocationStarted linkId](self, "linkId");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[MTSchemaMTInvocationStarted linkId](self, "linkId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "linkId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_53;
  }
  else
  {

  }
  has = self->_has;
  v14 = v4[72];
  if ((*(_BYTE *)&has & 1) != (v14 & 1))
    goto LABEL_53;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    isOnDeviceTranslation = self->_isOnDeviceTranslation;
    if (isOnDeviceTranslation != objc_msgSend(v4, "isOnDeviceTranslation"))
      goto LABEL_53;
    has = self->_has;
    v14 = v4[72];
  }
  v16 = (*(unsigned int *)&has >> 1) & 1;
  if (v16 != ((v14 >> 1) & 1))
    goto LABEL_53;
  if (v16)
  {
    mobileAssetConfigVersion = self->_mobileAssetConfigVersion;
    if (mobileAssetConfigVersion != objc_msgSend(v4, "mobileAssetConfigVersion"))
      goto LABEL_53;
    has = self->_has;
    v14 = v4[72];
  }
  v18 = (*(unsigned int *)&has >> 2) & 1;
  if (v18 != ((v14 >> 2) & 1))
    goto LABEL_53;
  if (v18)
  {
    task = self->_task;
    if (task != objc_msgSend(v4, "task"))
      goto LABEL_53;
    has = self->_has;
    v14 = v4[72];
  }
  v20 = (*(unsigned int *)&has >> 3) & 1;
  if (v20 != ((v14 >> 3) & 1))
    goto LABEL_53;
  if (v20)
  {
    inputSource = self->_inputSource;
    if (inputSource != objc_msgSend(v4, "inputSource"))
      goto LABEL_53;
    has = self->_has;
    v14 = v4[72];
  }
  v22 = (*(unsigned int *)&has >> 4) & 1;
  if (v22 != ((v14 >> 4) & 1))
    goto LABEL_53;
  if (v22)
  {
    isExplicitLanguageFilterEnabled = self->_isExplicitLanguageFilterEnabled;
    if (isExplicitLanguageFilterEnabled != objc_msgSend(v4, "isExplicitLanguageFilterEnabled"))
      goto LABEL_53;
    has = self->_has;
    v14 = v4[72];
  }
  v24 = (*(unsigned int *)&has >> 5) & 1;
  if (v24 != ((v14 >> 5) & 1))
    goto LABEL_53;
  if (v24)
  {
    isLanguageIdentificationEnabled = self->_isLanguageIdentificationEnabled;
    if (isLanguageIdentificationEnabled != objc_msgSend(v4, "isLanguageIdentificationEnabled"))
      goto LABEL_53;
    has = self->_has;
    v14 = v4[72];
  }
  v26 = (*(unsigned int *)&has >> 6) & 1;
  if (v26 != ((v14 >> 6) & 1))
    goto LABEL_53;
  if (v26)
  {
    displayMode = self->_displayMode;
    if (displayMode != objc_msgSend(v4, "displayMode"))
      goto LABEL_53;
  }
  -[MTSchemaMTInvocationStarted qssSessionId](self, "qssSessionId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "qssSessionId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_52;
  -[MTSchemaMTInvocationStarted qssSessionId](self, "qssSessionId");
  v28 = objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    v29 = (void *)v28;
    -[MTSchemaMTInvocationStarted qssSessionId](self, "qssSessionId");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "qssSessionId");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v30, "isEqual:", v31);

    if (!v32)
      goto LABEL_53;
  }
  else
  {

  }
  v33 = self->_has;
  if (((v4[72] ^ *(unsigned int *)&v33) & 0x80) != 0)
    goto LABEL_53;
  if ((*(_DWORD *)&v33 & 0x80000000) != 0)
  {
    invocationType = self->_invocationType;
    if (invocationType != objc_msgSend(v4, "invocationType"))
      goto LABEL_53;
  }
  -[MTSchemaMTInvocationStarted appInvocationMetadata](self, "appInvocationMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appInvocationMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_52;
  -[MTSchemaMTInvocationStarted appInvocationMetadata](self, "appInvocationMetadata");
  v35 = objc_claimAutoreleasedReturnValue();
  if (v35)
  {
    v36 = (void *)v35;
    -[MTSchemaMTInvocationStarted appInvocationMetadata](self, "appInvocationMetadata");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appInvocationMetadata");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v37, "isEqual:", v38);

    if (!v39)
      goto LABEL_53;
  }
  else
  {

  }
  -[MTSchemaMTInvocationStarted apiInvocationMetadata](self, "apiInvocationMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "apiInvocationMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
  {
LABEL_52:

    goto LABEL_53;
  }
  -[MTSchemaMTInvocationStarted apiInvocationMetadata](self, "apiInvocationMetadata");
  v40 = objc_claimAutoreleasedReturnValue();
  if (!v40)
  {

LABEL_56:
    v45 = 1;
    goto LABEL_54;
  }
  v41 = (void *)v40;
  -[MTSchemaMTInvocationStarted apiInvocationMetadata](self, "apiInvocationMetadata");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "apiInvocationMetadata");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v42, "isEqual:", v43);

  if ((v44 & 1) != 0)
    goto LABEL_56;
LABEL_53:
  v45 = 0;
LABEL_54:

  return v45;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v16;

  v3 = -[SISchemaUUID hash](self->_linkId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v16 = 2654435761 * self->_isOnDeviceTranslation;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_mobileAssetConfigVersion;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else
  {
    v16 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_4:
    v5 = 2654435761 * self->_task;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_5:
    v6 = 2654435761 * self->_inputSource;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_6;
LABEL_12:
    v7 = 0;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
      goto LABEL_7;
    goto LABEL_13;
  }
LABEL_11:
  v6 = 0;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    goto LABEL_12;
LABEL_6:
  v7 = 2654435761 * self->_isExplicitLanguageFilterEnabled;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
LABEL_7:
    v8 = 2654435761 * self->_isLanguageIdentificationEnabled;
    goto LABEL_14;
  }
LABEL_13:
  v8 = 0;
LABEL_14:
  v9 = v3;
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
    v10 = 2654435761 * self->_displayMode;
  else
    v10 = 0;
  v11 = -[SISchemaUUID hash](self->_qssSessionId, "hash");
  if ((*(_BYTE *)&self->_has & 0x80000000) != 0)
    v12 = 2654435761 * self->_invocationType;
  else
    v12 = 0;
  v13 = v16 ^ v9 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v10 ^ v11;
  v14 = v12 ^ -[MTSchemaMTAppInvocationMetadata hash](self->_appInvocationMetadata, "hash");
  return v13 ^ v14 ^ -[MTSchemaMTApiInvocationMetadata hash](self->_apiInvocationMetadata, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char has;
  unsigned int v11;
  const __CFString *v12;
  unsigned int v13;
  const __CFString *v14;
  unsigned int v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  unsigned int v27;
  const __CFString *v28;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_apiInvocationMetadata)
  {
    -[MTSchemaMTInvocationStarted apiInvocationMetadata](self, "apiInvocationMetadata");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("apiInvocationMetadata"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("apiInvocationMetadata"));

    }
  }
  if (self->_appInvocationMetadata)
  {
    -[MTSchemaMTInvocationStarted appInvocationMetadata](self, "appInvocationMetadata");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("appInvocationMetadata"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("appInvocationMetadata"));

    }
  }
  has = (char)self->_has;
  if ((has & 0x40) != 0)
  {
    v11 = -[MTSchemaMTInvocationStarted displayMode](self, "displayMode") - 1;
    if (v11 > 2)
      v12 = CFSTR("MTAPPDISPLAYMODE_UNKNOWN");
    else
      v12 = off_1E56308E8[v11];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("displayMode"));
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_13:
      if ((has & 0x80) == 0)
        goto LABEL_27;
      goto LABEL_23;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_13;
  }
  v13 = -[MTSchemaMTInvocationStarted inputSource](self, "inputSource") - 1;
  if (v13 > 3)
    v14 = CFSTR("MTINPUTSOURCE_UNKNOWN");
  else
    v14 = off_1E5630900[v13];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("inputSource"));
  has = (char)self->_has;
  if (has < 0)
  {
LABEL_23:
    v15 = -[MTSchemaMTInvocationStarted invocationType](self, "invocationType") - 1;
    if (v15 > 0xE)
      v16 = CFSTR("MTINVOCATIONTYPE_UNKNOWN");
    else
      v16 = off_1E5630920[v15];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("invocationType"));
    has = (char)self->_has;
  }
LABEL_27:
  if ((has & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MTSchemaMTInvocationStarted isExplicitLanguageFilterEnabled](self, "isExplicitLanguageFilterEnabled"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("isExplicitLanguageFilterEnabled"));

    has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_29:
      if ((has & 1) == 0)
        goto LABEL_31;
      goto LABEL_30;
    }
  }
  else if ((has & 0x20) == 0)
  {
    goto LABEL_29;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MTSchemaMTInvocationStarted isLanguageIdentificationEnabled](self, "isLanguageIdentificationEnabled"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("isLanguageIdentificationEnabled"));

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_30:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MTSchemaMTInvocationStarted isOnDeviceTranslation](self, "isOnDeviceTranslation"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("isOnDeviceTranslation"));

  }
LABEL_31:
  if (self->_linkId)
  {
    -[MTSchemaMTInvocationStarted linkId](self, "linkId");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "dictionaryRepresentation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("linkId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("linkId"));

    }
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[MTSchemaMTInvocationStarted mobileAssetConfigVersion](self, "mobileAssetConfigVersion"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("mobileAssetConfigVersion"));

  }
  if (self->_qssSessionId)
  {
    -[MTSchemaMTInvocationStarted qssSessionId](self, "qssSessionId");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "dictionaryRepresentation");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("qssSessionId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("qssSessionId"));

    }
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v27 = -[MTSchemaMTInvocationStarted task](self, "task") - 1;
    if (v27 > 3)
      v28 = CFSTR("MTTASK_UNKNOWN");
    else
      v28 = off_1E5630998[v27];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v28, CFSTR("task"));
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[MTSchemaMTInvocationStarted dictionaryRepresentation](self, "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", v2))
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v2, 0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (MTSchemaMTInvocationStarted)initWithJSON:(id)a3
{
  void *v4;
  MTSchemaMTInvocationStarted *v5;
  uint64_t v7;

  v7 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", a3, 0, &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = -[MTSchemaMTInvocationStarted initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (MTSchemaMTInvocationStarted)initWithDictionary:(id)a3
{
  id v4;
  MTSchemaMTInvocationStarted *v5;
  uint64_t v6;
  SISchemaUUID *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  SISchemaUUID *v16;
  void *v17;
  void *v18;
  MTSchemaMTAppInvocationMetadata *v19;
  void *v20;
  MTSchemaMTApiInvocationMetadata *v21;
  MTSchemaMTInvocationStarted *v22;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  objc_super v29;

  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)MTSchemaMTInvocationStarted;
  v5 = -[MTSchemaMTInvocationStarted init](&v29, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("linkId"));
    v6 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v6);
      -[MTSchemaMTInvocationStarted setLinkId:](v5, "setLinkId:", v7);

    }
    v28 = (void *)v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isOnDeviceTranslation"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MTSchemaMTInvocationStarted setIsOnDeviceTranslation:](v5, "setIsOnDeviceTranslation:", objc_msgSend(v8, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mobileAssetConfigVersion"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MTSchemaMTInvocationStarted setMobileAssetConfigVersion:](v5, "setMobileAssetConfigVersion:", objc_msgSend(v9, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("task"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MTSchemaMTInvocationStarted setTask:](v5, "setTask:", objc_msgSend(v10, "intValue"));
    v25 = v10;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("inputSource"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MTSchemaMTInvocationStarted setInputSource:](v5, "setInputSource:", objc_msgSend(v11, "intValue"));
    v24 = v11;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isExplicitLanguageFilterEnabled"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MTSchemaMTInvocationStarted setIsExplicitLanguageFilterEnabled:](v5, "setIsExplicitLanguageFilterEnabled:", objc_msgSend(v12, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isLanguageIdentificationEnabled"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MTSchemaMTInvocationStarted setIsLanguageIdentificationEnabled:](v5, "setIsLanguageIdentificationEnabled:", objc_msgSend(v13, "BOOLValue"));
    v27 = v8;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("displayMode"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MTSchemaMTInvocationStarted setDisplayMode:](v5, "setDisplayMode:", objc_msgSend(v14, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("qssSessionId"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v15);
      -[MTSchemaMTInvocationStarted setQssSessionId:](v5, "setQssSessionId:", v16);

    }
    v26 = v9;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("invocationType"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MTSchemaMTInvocationStarted setInvocationType:](v5, "setInvocationType:", objc_msgSend(v17, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appInvocationMetadata"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = -[MTSchemaMTAppInvocationMetadata initWithDictionary:]([MTSchemaMTAppInvocationMetadata alloc], "initWithDictionary:", v18);
      -[MTSchemaMTInvocationStarted setAppInvocationMetadata:](v5, "setAppInvocationMetadata:", v19);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("apiInvocationMetadata"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v21 = -[MTSchemaMTApiInvocationMetadata initWithDictionary:]([MTSchemaMTApiInvocationMetadata alloc], "initWithDictionary:", v20);
      -[MTSchemaMTInvocationStarted setApiInvocationMetadata:](v5, "setApiInvocationMetadata:", v21);

    }
    v22 = v5;

  }
  return v5;
}

- (unint64_t)whichInvocationmetadata
{
  return self->_whichInvocationmetadata;
}

- (SISchemaUUID)linkId
{
  return self->_linkId;
}

- (void)setLinkId:(id)a3
{
  objc_storeStrong((id *)&self->_linkId, a3);
}

- (BOOL)isOnDeviceTranslation
{
  return self->_isOnDeviceTranslation;
}

- (unsigned)mobileAssetConfigVersion
{
  return self->_mobileAssetConfigVersion;
}

- (int)task
{
  return self->_task;
}

- (int)inputSource
{
  return self->_inputSource;
}

- (BOOL)isExplicitLanguageFilterEnabled
{
  return self->_isExplicitLanguageFilterEnabled;
}

- (BOOL)isLanguageIdentificationEnabled
{
  return self->_isLanguageIdentificationEnabled;
}

- (int)displayMode
{
  return self->_displayMode;
}

- (SISchemaUUID)qssSessionId
{
  return self->_qssSessionId;
}

- (void)setQssSessionId:(id)a3
{
  objc_storeStrong((id *)&self->_qssSessionId, a3);
}

- (int)invocationType
{
  return self->_invocationType;
}

- (void)setHasLinkId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasQssSessionId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (BOOL)hasAppInvocationMetadata
{
  return *((_BYTE *)&self->_has + 3);
}

- (void)setHasAppInvocationMetadata:(BOOL)a3
{
  *((_BYTE *)&self->_has + 3) = a3;
}

- (BOOL)hasApiInvocationMetadata
{
  return self->_hasLinkId;
}

- (void)setHasApiInvocationMetadata:(BOOL)a3
{
  self->_hasLinkId = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_apiInvocationMetadata, 0);
  objc_storeStrong((id *)&self->_appInvocationMetadata, 0);
  objc_storeStrong((id *)&self->_qssSessionId, 0);
  objc_storeStrong((id *)&self->_linkId, 0);
}

@end
