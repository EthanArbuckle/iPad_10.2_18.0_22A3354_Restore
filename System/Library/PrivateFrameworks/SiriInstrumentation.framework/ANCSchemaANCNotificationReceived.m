@implementation ANCSchemaANCNotificationReceived

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
  v19.super_class = (Class)ANCSchemaANCNotificationReceived;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v19, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ANCSchemaANCNotificationReceived connectedAudioDevice](self, "connectedAudioDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[ANCSchemaANCNotificationReceived deleteConnectedAudioDevice](self, "deleteConnectedAudioDevice");
  -[ANCSchemaANCNotificationReceived linkId](self, "linkId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[ANCSchemaANCNotificationReceived deleteLinkId](self, "deleteLinkId");
  -[ANCSchemaANCNotificationReceived backgroundContent](self, "backgroundContent");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[ANCSchemaANCNotificationReceived deleteBackgroundContent](self, "deleteBackgroundContent");
  -[ANCSchemaANCNotificationReceived notificationMetadata](self, "notificationMetadata");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applySensitiveConditionsPolicy:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "suppressMessage");

  if (v17)
    -[ANCSchemaANCNotificationReceived deleteNotificationMetadata](self, "deleteNotificationMetadata");

  return v5;
}

- (void)setAnnouncementCategory:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_announcementCategory = a3;
}

- (BOOL)hasAnnouncementCategory
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasAnnouncementCategory:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteAnnouncementCategory
{
  -[ANCSchemaANCNotificationReceived setAnnouncementCategory:](self, "setAnnouncementCategory:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setTargetPlatform:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_targetPlatform = a3;
}

- (BOOL)hasTargetPlatform
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasTargetPlatform:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteTargetPlatform
{
  -[ANCSchemaANCNotificationReceived setTargetPlatform:](self, "setTargetPlatform:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)hasConnectedAudioDevice
{
  return self->_connectedAudioDevice != 0;
}

- (void)deleteConnectedAudioDevice
{
  -[ANCSchemaANCNotificationReceived setConnectedAudioDevice:](self, "setConnectedAudioDevice:", 0);
}

- (void)setIsTimeSensitiveAnnouncement:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_isTimeSensitiveAnnouncement = a3;
}

- (BOOL)hasIsTimeSensitiveAnnouncement
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasIsTimeSensitiveAnnouncement:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteIsTimeSensitiveAnnouncement
{
  -[ANCSchemaANCNotificationReceived setIsTimeSensitiveAnnouncement:](self, "setIsTimeSensitiveAnnouncement:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (void)setAppCategory:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_appCategory = a3;
}

- (BOOL)hasAppCategory
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasAppCategory:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)deleteAppCategory
{
  -[ANCSchemaANCNotificationReceived setAppCategory:](self, "setAppCategory:", 0);
  *(_BYTE *)&self->_has &= ~8u;
}

- (BOOL)hasLinkId
{
  return self->_linkId != 0;
}

- (void)deleteLinkId
{
  -[ANCSchemaANCNotificationReceived setLinkId:](self, "setLinkId:", 0);
}

- (BOOL)hasBackgroundContent
{
  return self->_backgroundContent != 0;
}

- (void)deleteBackgroundContent
{
  -[ANCSchemaANCNotificationReceived setBackgroundContent:](self, "setBackgroundContent:", 0);
}

- (BOOL)hasNotificationMetadata
{
  return self->_notificationMetadata != 0;
}

- (void)deleteNotificationMetadata
{
  -[ANCSchemaANCNotificationReceived setNotificationMetadata:](self, "setNotificationMetadata:", 0);
}

- (void)setBobbleEnabled:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_bobbleEnabled = a3;
}

- (BOOL)hasBobbleEnabled
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setHasBobbleEnabled:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (void)deleteBobbleEnabled
{
  -[ANCSchemaANCNotificationReceived setBobbleEnabled:](self, "setBobbleEnabled:", 0);
  *(_BYTE *)&self->_has &= ~0x10u;
}

- (void)setBobbleSupported:(int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_bobbleSupported = a3;
}

- (BOOL)hasBobbleSupported
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setHasBobbleSupported:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (void)deleteBobbleSupported
{
  -[ANCSchemaANCNotificationReceived setBobbleSupported:](self, "setBobbleSupported:", 0);
  *(_BYTE *)&self->_has &= ~0x20u;
}

- (BOOL)readFrom:(id)a3
{
  return ANCSchemaANCNotificationReceivedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  id v15;

  v15 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteInt32Field();
  -[ANCSchemaANCNotificationReceived connectedAudioDevice](self, "connectedAudioDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[ANCSchemaANCNotificationReceived connectedAudioDevice](self, "connectedAudioDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v7 = (char)self->_has;
  if ((v7 & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    v7 = (char)self->_has;
  }
  if ((v7 & 8) != 0)
    PBDataWriterWriteInt32Field();
  -[ANCSchemaANCNotificationReceived linkId](self, "linkId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[ANCSchemaANCNotificationReceived linkId](self, "linkId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ANCSchemaANCNotificationReceived backgroundContent](self, "backgroundContent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[ANCSchemaANCNotificationReceived backgroundContent](self, "backgroundContent");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ANCSchemaANCNotificationReceived notificationMetadata](self, "notificationMetadata");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[ANCSchemaANCNotificationReceived notificationMetadata](self, "notificationMetadata");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v14 = (char)self->_has;
  if ((v14 & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field();
    v14 = (char)self->_has;
  }
  if ((v14 & 0x20) != 0)
    PBDataWriterWriteInt32Field();

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $6570D294FEFED79133EDD7D328F2C8CF has;
  unsigned int v6;
  int announcementCategory;
  int v8;
  int targetPlatform;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  $6570D294FEFED79133EDD7D328F2C8CF v17;
  int v18;
  unsigned int v19;
  int isTimeSensitiveAnnouncement;
  int v21;
  int appCategory;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  BOOL v38;
  $6570D294FEFED79133EDD7D328F2C8CF v40;
  int v41;
  unsigned int v42;
  int bobbleEnabled;
  int v44;
  int bobbleSupported;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_36;
  has = self->_has;
  v6 = v4[64];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_36;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    announcementCategory = self->_announcementCategory;
    if (announcementCategory != objc_msgSend(v4, "announcementCategory"))
      goto LABEL_36;
    has = self->_has;
    v6 = v4[64];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_36;
  if (v8)
  {
    targetPlatform = self->_targetPlatform;
    if (targetPlatform != objc_msgSend(v4, "targetPlatform"))
      goto LABEL_36;
  }
  -[ANCSchemaANCNotificationReceived connectedAudioDevice](self, "connectedAudioDevice");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "connectedAudioDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v10 == 0) == (v11 != 0))
    goto LABEL_35;
  -[ANCSchemaANCNotificationReceived connectedAudioDevice](self, "connectedAudioDevice");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[ANCSchemaANCNotificationReceived connectedAudioDevice](self, "connectedAudioDevice");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "connectedAudioDevice");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_36;
  }
  else
  {

  }
  v17 = self->_has;
  v18 = (*(unsigned int *)&v17 >> 2) & 1;
  v19 = v4[64];
  if (v18 != ((v19 >> 2) & 1))
    goto LABEL_36;
  if (v18)
  {
    isTimeSensitiveAnnouncement = self->_isTimeSensitiveAnnouncement;
    if (isTimeSensitiveAnnouncement != objc_msgSend(v4, "isTimeSensitiveAnnouncement"))
      goto LABEL_36;
    v17 = self->_has;
    v19 = v4[64];
  }
  v21 = (*(unsigned int *)&v17 >> 3) & 1;
  if (v21 != ((v19 >> 3) & 1))
    goto LABEL_36;
  if (v21)
  {
    appCategory = self->_appCategory;
    if (appCategory != objc_msgSend(v4, "appCategory"))
      goto LABEL_36;
  }
  -[ANCSchemaANCNotificationReceived linkId](self, "linkId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "linkId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v10 == 0) == (v11 != 0))
    goto LABEL_35;
  -[ANCSchemaANCNotificationReceived linkId](self, "linkId");
  v23 = objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v24 = (void *)v23;
    -[ANCSchemaANCNotificationReceived linkId](self, "linkId");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "linkId");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "isEqual:", v26);

    if (!v27)
      goto LABEL_36;
  }
  else
  {

  }
  -[ANCSchemaANCNotificationReceived backgroundContent](self, "backgroundContent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "backgroundContent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v10 == 0) == (v11 != 0))
    goto LABEL_35;
  -[ANCSchemaANCNotificationReceived backgroundContent](self, "backgroundContent");
  v28 = objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    v29 = (void *)v28;
    -[ANCSchemaANCNotificationReceived backgroundContent](self, "backgroundContent");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "backgroundContent");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v30, "isEqual:", v31);

    if (!v32)
      goto LABEL_36;
  }
  else
  {

  }
  -[ANCSchemaANCNotificationReceived notificationMetadata](self, "notificationMetadata");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "notificationMetadata");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v10 == 0) == (v11 != 0))
  {
LABEL_35:

    goto LABEL_36;
  }
  -[ANCSchemaANCNotificationReceived notificationMetadata](self, "notificationMetadata");
  v33 = objc_claimAutoreleasedReturnValue();
  if (v33)
  {
    v34 = (void *)v33;
    -[ANCSchemaANCNotificationReceived notificationMetadata](self, "notificationMetadata");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "notificationMetadata");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v35, "isEqual:", v36);

    if (!v37)
      goto LABEL_36;
  }
  else
  {

  }
  v40 = self->_has;
  v41 = (*(unsigned int *)&v40 >> 4) & 1;
  v42 = v4[64];
  if (v41 == ((v42 >> 4) & 1))
  {
    if (v41)
    {
      bobbleEnabled = self->_bobbleEnabled;
      if (bobbleEnabled != objc_msgSend(v4, "bobbleEnabled"))
        goto LABEL_36;
      v40 = self->_has;
      v42 = v4[64];
    }
    v44 = (*(unsigned int *)&v40 >> 5) & 1;
    if (v44 == ((v42 >> 5) & 1))
    {
      if (!v44
        || (bobbleSupported = self->_bobbleSupported,
            bobbleSupported == objc_msgSend(v4, "bobbleSupported")))
      {
        v38 = 1;
        goto LABEL_37;
      }
    }
  }
LABEL_36:
  v38 = 0;
LABEL_37:

  return v38;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v3 = 2654435761 * self->_announcementCategory;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_targetPlatform;
      goto LABEL_6;
    }
  }
  v4 = 0;
LABEL_6:
  v5 = -[ANCSchemaANCAudioDevice hash](self->_connectedAudioDevice, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v6 = 2654435761 * self->_isTimeSensitiveAnnouncement;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_8;
  }
  else
  {
    v6 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
LABEL_8:
      v7 = 2654435761 * self->_appCategory;
      goto LABEL_11;
    }
  }
  v7 = 0;
LABEL_11:
  v8 = -[SISchemaUUID hash](self->_linkId, "hash");
  v9 = -[ANCSchemaANCBackgroundContent hash](self->_backgroundContent, "hash");
  v10 = -[ANCSchemaANCAppNotificationMetadata hash](self->_notificationMetadata, "hash");
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    v11 = 2654435761 * self->_bobbleEnabled;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
      goto LABEL_13;
LABEL_15:
    v12 = 0;
    return v4 ^ v3 ^ v6 ^ v7 ^ v5 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
  }
  v11 = 0;
  if ((*(_BYTE *)&self->_has & 0x20) == 0)
    goto LABEL_15;
LABEL_13:
  v12 = 2654435761 * self->_bobbleSupported;
  return v4 ^ v3 ^ v6 ^ v7 ^ v5 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  unsigned int v5;
  const __CFString *v6;
  int v7;
  const __CFString *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  int v14;
  const __CFString *v15;
  const __CFString *v16;
  int v17;
  const __CFString *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  unsigned int v30;
  const __CFString *v31;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v5 = -[ANCSchemaANCNotificationReceived announcementCategory](self, "announcementCategory") - 1;
    if (v5 > 6)
      v6 = CFSTR("ANCCATEGORY_UNKNOWN");
    else
      v6 = off_1E562B0C8[v5];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("announcementCategory"));
    has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    v7 = -[ANCSchemaANCNotificationReceived appCategory](self, "appCategory");
    v8 = CFSTR("ANCAPPCATEGORY_UNKNOWN");
    if (v7 == 1)
      v8 = CFSTR("ANCAPPCATEGORY_FIRST_PARTY");
    if (v7 == 2)
      v9 = CFSTR("ANCAPPCATEGORY_THIRD_PARTY");
    else
      v9 = v8;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("appCategory"));
  }
  if (self->_backgroundContent)
  {
    -[ANCSchemaANCNotificationReceived backgroundContent](self, "backgroundContent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("backgroundContent"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("backgroundContent"));

    }
  }
  v13 = (char)self->_has;
  if ((v13 & 0x10) != 0)
  {
    v14 = -[ANCSchemaANCNotificationReceived bobbleEnabled](self, "bobbleEnabled");
    v15 = CFSTR("ANCFEATUREENABLEMENTSTATUS_UNKNOWN");
    if (v14 == 1)
      v15 = CFSTR("ANCFEATUREENABLEMENTSTATUS_ENABLED");
    if (v14 == 2)
      v16 = CFSTR("ANCFEATUREENABLEMENTSTATUS_DISABLED");
    else
      v16 = v15;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("bobbleEnabled"));
    v13 = (char)self->_has;
  }
  if ((v13 & 0x20) != 0)
  {
    v17 = -[ANCSchemaANCNotificationReceived bobbleSupported](self, "bobbleSupported");
    v18 = CFSTR("ANCFEATURESUPPORTSTATUS_UNKNOWN");
    if (v17 == 1)
      v18 = CFSTR("ANCFEATURESUPPORTSTATUS_SUPPORTED");
    if (v17 == 2)
      v19 = CFSTR("ANCFEATURESUPPORTSTATUS_UNSUPPORTED");
    else
      v19 = v18;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("bobbleSupported"));
  }
  if (self->_connectedAudioDevice)
  {
    -[ANCSchemaANCNotificationReceived connectedAudioDevice](self, "connectedAudioDevice");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "dictionaryRepresentation");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("connectedAudioDevice"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("connectedAudioDevice"));

    }
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ANCSchemaANCNotificationReceived isTimeSensitiveAnnouncement](self, "isTimeSensitiveAnnouncement"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("isTimeSensitiveAnnouncement"));

  }
  if (self->_linkId)
  {
    -[ANCSchemaANCNotificationReceived linkId](self, "linkId");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "dictionaryRepresentation");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("linkId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("linkId"));

    }
  }
  if (self->_notificationMetadata)
  {
    -[ANCSchemaANCNotificationReceived notificationMetadata](self, "notificationMetadata");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "dictionaryRepresentation");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v28)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v28, CFSTR("notificationMetadata"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("notificationMetadata"));

    }
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v30 = -[ANCSchemaANCNotificationReceived targetPlatform](self, "targetPlatform") - 1;
    if (v30 > 3)
      v31 = CFSTR("ANCTARGETPLATFORM_UNKNOWN");
    else
      v31 = off_1E562B100[v30];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v31, CFSTR("targetPlatform"));
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[ANCSchemaANCNotificationReceived dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (ANCSchemaANCNotificationReceived)initWithJSON:(id)a3
{
  void *v4;
  ANCSchemaANCNotificationReceived *v5;
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
    self = -[ANCSchemaANCNotificationReceived initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (ANCSchemaANCNotificationReceived)initWithDictionary:(id)a3
{
  id v4;
  ANCSchemaANCNotificationReceived *v5;
  void *v6;
  void *v7;
  void *v8;
  ANCSchemaANCAudioDevice *v9;
  void *v10;
  void *v11;
  void *v12;
  SISchemaUUID *v13;
  void *v14;
  ANCSchemaANCBackgroundContent *v15;
  void *v16;
  ANCSchemaANCAppNotificationMetadata *v17;
  void *v18;
  void *v19;
  ANCSchemaANCNotificationReceived *v20;
  void *v22;
  void *v23;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)ANCSchemaANCNotificationReceived;
  v5 = -[ANCSchemaANCNotificationReceived init](&v24, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("announcementCategory"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ANCSchemaANCNotificationReceived setAnnouncementCategory:](v5, "setAnnouncementCategory:", objc_msgSend(v6, "intValue"));
    v23 = v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("targetPlatform"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ANCSchemaANCNotificationReceived setTargetPlatform:](v5, "setTargetPlatform:", objc_msgSend(v7, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("connectedAudioDevice"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[ANCSchemaANCAudioDevice initWithDictionary:]([ANCSchemaANCAudioDevice alloc], "initWithDictionary:", v8);
      -[ANCSchemaANCNotificationReceived setConnectedAudioDevice:](v5, "setConnectedAudioDevice:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isTimeSensitiveAnnouncement"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ANCSchemaANCNotificationReceived setIsTimeSensitiveAnnouncement:](v5, "setIsTimeSensitiveAnnouncement:", objc_msgSend(v10, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appCategory"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ANCSchemaANCNotificationReceived setAppCategory:](v5, "setAppCategory:", objc_msgSend(v11, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("linkId"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v12);
      -[ANCSchemaANCNotificationReceived setLinkId:](v5, "setLinkId:", v13);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("backgroundContent"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = -[ANCSchemaANCBackgroundContent initWithDictionary:]([ANCSchemaANCBackgroundContent alloc], "initWithDictionary:", v14);
      -[ANCSchemaANCNotificationReceived setBackgroundContent:](v5, "setBackgroundContent:", v15);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("notificationMetadata"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = -[ANCSchemaANCAppNotificationMetadata initWithDictionary:]([ANCSchemaANCAppNotificationMetadata alloc], "initWithDictionary:", v16);
      -[ANCSchemaANCNotificationReceived setNotificationMetadata:](v5, "setNotificationMetadata:", v17);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("bobbleEnabled"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ANCSchemaANCNotificationReceived setBobbleEnabled:](v5, "setBobbleEnabled:", objc_msgSend(v18, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("bobbleSupported"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ANCSchemaANCNotificationReceived setBobbleSupported:](v5, "setBobbleSupported:", objc_msgSend(v19, "intValue"));
    v20 = v5;

  }
  return v5;
}

- (int)announcementCategory
{
  return self->_announcementCategory;
}

- (int)targetPlatform
{
  return self->_targetPlatform;
}

- (ANCSchemaANCAudioDevice)connectedAudioDevice
{
  return self->_connectedAudioDevice;
}

- (void)setConnectedAudioDevice:(id)a3
{
  objc_storeStrong((id *)&self->_connectedAudioDevice, a3);
}

- (BOOL)isTimeSensitiveAnnouncement
{
  return self->_isTimeSensitiveAnnouncement;
}

- (int)appCategory
{
  return self->_appCategory;
}

- (SISchemaUUID)linkId
{
  return self->_linkId;
}

- (void)setLinkId:(id)a3
{
  objc_storeStrong((id *)&self->_linkId, a3);
}

- (ANCSchemaANCBackgroundContent)backgroundContent
{
  return self->_backgroundContent;
}

- (void)setBackgroundContent:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundContent, a3);
}

- (ANCSchemaANCAppNotificationMetadata)notificationMetadata
{
  return self->_notificationMetadata;
}

- (void)setNotificationMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_notificationMetadata, a3);
}

- (int)bobbleEnabled
{
  return self->_bobbleEnabled;
}

- (int)bobbleSupported
{
  return self->_bobbleSupported;
}

- (void)setHasConnectedAudioDevice:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasLinkId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void)setHasBackgroundContent:(BOOL)a3
{
  *((_BYTE *)&self->_has + 3) = a3;
}

- (void)setHasNotificationMetadata:(BOOL)a3
{
  self->_hasConnectedAudioDevice = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationMetadata, 0);
  objc_storeStrong((id *)&self->_backgroundContent, 0);
  objc_storeStrong((id *)&self->_linkId, 0);
  objc_storeStrong((id *)&self->_connectedAudioDevice, 0);
}

@end
