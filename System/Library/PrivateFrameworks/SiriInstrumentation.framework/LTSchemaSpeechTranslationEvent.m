@implementation LTSchemaSpeechTranslationEvent

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
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)LTSchemaSpeechTranslationEvent;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v13, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LTSchemaSpeechTranslationEvent task](self, "task");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[LTSchemaSpeechTranslationEvent deleteTask](self, "deleteTask");
  -[LTSchemaSpeechTranslationEvent error](self, "error");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[LTSchemaSpeechTranslationEvent deleteError](self, "deleteError");

  return v5;
}

- (BOOL)hasTask
{
  return self->_task != 0;
}

- (void)deleteTask
{
  -[LTSchemaSpeechTranslationEvent setTask:](self, "setTask:", 0);
}

- (BOOL)hasSessionID
{
  return self->_sessionID != 0;
}

- (void)deleteSessionID
{
  -[LTSchemaSpeechTranslationEvent setSessionID:](self, "setSessionID:", 0);
}

- (BOOL)hasRequestID
{
  return self->_requestID != 0;
}

- (void)deleteRequestID
{
  -[LTSchemaSpeechTranslationEvent setRequestID:](self, "setRequestID:", 0);
}

- (void)setInRestrictedMode:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_inRestrictedMode = a3;
}

- (BOOL)hasInRestrictedMode
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasInRestrictedMode:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteInRestrictedMode
{
  -[LTSchemaSpeechTranslationEvent setInRestrictedMode:](self, "setInRestrictedMode:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setIsAutomaticLID:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_isAutomaticLID = a3;
}

- (BOOL)hasIsAutomaticLID
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasIsAutomaticLID:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteIsAutomaticLID
{
  -[LTSchemaSpeechTranslationEvent setIsAutomaticLID:](self, "setIsAutomaticLID:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)hasError
{
  return self->_error != 0;
}

- (void)deleteError
{
  -[LTSchemaSpeechTranslationEvent setError:](self, "setError:", 0);
}

- (void)setUiMode:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_uiMode = a3;
}

- (BOOL)hasUiMode
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasUiMode:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteUiMode
{
  -[LTSchemaSpeechTranslationEvent setUiMode:](self, "setUiMode:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (BOOL)hasMobileAssetConfigVersion
{
  return self->_mobileAssetConfigVersion != 0;
}

- (void)deleteMobileAssetConfigVersion
{
  -[LTSchemaSpeechTranslationEvent setMobileAssetConfigVersion:](self, "setMobileAssetConfigVersion:", 0);
}

- (void)setTimeToFirstPartialDisplayed:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_timeToFirstPartialDisplayed = a3;
}

- (BOOL)hasTimeToFirstPartialDisplayed
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasTimeToFirstPartialDisplayed:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)deleteTimeToFirstPartialDisplayed
{
  -[LTSchemaSpeechTranslationEvent setTimeToFirstPartialDisplayed:](self, "setTimeToFirstPartialDisplayed:", 0);
  *(_BYTE *)&self->_has &= ~8u;
}

- (void)setTimeToRecordingDialogDismissed:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_timeToRecordingDialogDismissed = a3;
}

- (BOOL)hasTimeToRecordingDialogDismissed
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setHasTimeToRecordingDialogDismissed:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (void)deleteTimeToRecordingDialogDismissed
{
  -[LTSchemaSpeechTranslationEvent setTimeToRecordingDialogDismissed:](self, "setTimeToRecordingDialogDismissed:", 0);
  *(_BYTE *)&self->_has &= ~0x10u;
}

- (void)setTimeToShowTranslationCard:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_timeToShowTranslationCard = a3;
}

- (BOOL)hasTimeToShowTranslationCard
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setHasTimeToShowTranslationCard:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (void)deleteTimeToShowTranslationCard
{
  -[LTSchemaSpeechTranslationEvent setTimeToShowTranslationCard:](self, "setTimeToShowTranslationCard:", 0);
  *(_BYTE *)&self->_has &= ~0x20u;
}

- (void)setTimeToCancel:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_timeToCancel = a3;
}

- (BOOL)hasTimeToCancel
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setHasTimeToCancel:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (void)deleteTimeToCancel
{
  -[LTSchemaSpeechTranslationEvent setTimeToCancel:](self, "setTimeToCancel:", 0);
  *(_BYTE *)&self->_has &= ~0x40u;
}

- (void)setStatus:(int)a3
{
  *(_BYTE *)&self->_has |= 0x80u;
  self->_status = a3;
}

- (BOOL)hasStatus
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setHasStatus:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 0x80;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = v3 & 0x80 | *(_BYTE *)&self->_has & 0x7F;
}

- (void)deleteStatus
{
  -[LTSchemaSpeechTranslationEvent setStatus:](self, "setStatus:", 0);
  *(_BYTE *)&self->_has &= ~0x80u;
}

- (BOOL)readFrom:(id)a3
{
  return LTSchemaSpeechTranslationEventReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char has;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  id v14;

  v14 = a3;
  -[LTSchemaSpeechTranslationEvent task](self, "task");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[LTSchemaSpeechTranslationEvent task](self, "task");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[LTSchemaSpeechTranslationEvent sessionID](self, "sessionID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    PBDataWriterWriteStringField();
  -[LTSchemaSpeechTranslationEvent requestID](self, "requestID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteBOOLField();
  -[LTSchemaSpeechTranslationEvent error](self, "error");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[LTSchemaSpeechTranslationEvent error](self, "error");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
    PBDataWriterWriteInt32Field();
  -[LTSchemaSpeechTranslationEvent mobileAssetConfigVersion](self, "mobileAssetConfigVersion");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    PBDataWriterWriteStringField();
  v12 = (char)self->_has;
  v13 = v14;
  if ((v12 & 8) != 0)
  {
    PBDataWriterWriteUint32Field();
    v13 = v14;
    v12 = (char)self->_has;
    if ((v12 & 0x10) == 0)
    {
LABEL_19:
      if ((v12 & 0x20) == 0)
        goto LABEL_20;
      goto LABEL_25;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_19;
  }
  PBDataWriterWriteUint32Field();
  v13 = v14;
  v12 = (char)self->_has;
  if ((v12 & 0x20) == 0)
  {
LABEL_20:
    if ((v12 & 0x40) == 0)
      goto LABEL_21;
LABEL_26:
    PBDataWriterWriteUint32Field();
    v13 = v14;
    if ((*(_BYTE *)&self->_has & 0x80) == 0)
      goto LABEL_22;
LABEL_27:
    PBDataWriterWriteInt32Field();
    v13 = v14;
    goto LABEL_22;
  }
LABEL_25:
  PBDataWriterWriteUint32Field();
  v13 = v14;
  v12 = (char)self->_has;
  if ((v12 & 0x40) != 0)
    goto LABEL_26;
LABEL_21:
  if (v12 < 0)
    goto LABEL_27;
LABEL_22:

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  $A808366AEAC10ABA8EE62D4E47B60E4D has;
  unsigned int v23;
  int inRestrictedMode;
  int v25;
  int isAutomaticLID;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  int v32;
  int uiMode;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  BOOL v39;
  $A808366AEAC10ABA8EE62D4E47B60E4D v41;
  int v42;
  unsigned int v43;
  unsigned int timeToFirstPartialDisplayed;
  int v45;
  unsigned int timeToRecordingDialogDismissed;
  int v47;
  unsigned int timeToShowTranslationCard;
  int v49;
  unsigned int timeToCancel;
  int status;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_37;
  -[LTSchemaSpeechTranslationEvent task](self, "task");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "task");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_36;
  -[LTSchemaSpeechTranslationEvent task](self, "task");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[LTSchemaSpeechTranslationEvent task](self, "task");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "task");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_37;
  }
  else
  {

  }
  -[LTSchemaSpeechTranslationEvent sessionID](self, "sessionID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sessionID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_36;
  -[LTSchemaSpeechTranslationEvent sessionID](self, "sessionID");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[LTSchemaSpeechTranslationEvent sessionID](self, "sessionID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sessionID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_37;
  }
  else
  {

  }
  -[LTSchemaSpeechTranslationEvent requestID](self, "requestID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requestID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_36;
  -[LTSchemaSpeechTranslationEvent requestID](self, "requestID");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[LTSchemaSpeechTranslationEvent requestID](self, "requestID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "requestID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_37;
  }
  else
  {

  }
  has = self->_has;
  v23 = v4[84];
  if ((*(_BYTE *)&has & 1) != (v23 & 1))
    goto LABEL_37;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    inRestrictedMode = self->_inRestrictedMode;
    if (inRestrictedMode != objc_msgSend(v4, "inRestrictedMode"))
      goto LABEL_37;
    has = self->_has;
    v23 = v4[84];
  }
  v25 = (*(unsigned int *)&has >> 1) & 1;
  if (v25 != ((v23 >> 1) & 1))
    goto LABEL_37;
  if (v25)
  {
    isAutomaticLID = self->_isAutomaticLID;
    if (isAutomaticLID != objc_msgSend(v4, "isAutomaticLID"))
      goto LABEL_37;
  }
  -[LTSchemaSpeechTranslationEvent error](self, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "error");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_36;
  -[LTSchemaSpeechTranslationEvent error](self, "error");
  v27 = objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v28 = (void *)v27;
    -[LTSchemaSpeechTranslationEvent error](self, "error");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "error");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "isEqual:", v30);

    if (!v31)
      goto LABEL_37;
  }
  else
  {

  }
  v32 = (*(_BYTE *)&self->_has >> 2) & 1;
  if (v32 != ((v4[84] >> 2) & 1))
    goto LABEL_37;
  if (v32)
  {
    uiMode = self->_uiMode;
    if (uiMode != objc_msgSend(v4, "uiMode"))
      goto LABEL_37;
  }
  -[LTSchemaSpeechTranslationEvent mobileAssetConfigVersion](self, "mobileAssetConfigVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mobileAssetConfigVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_36:

    goto LABEL_37;
  }
  -[LTSchemaSpeechTranslationEvent mobileAssetConfigVersion](self, "mobileAssetConfigVersion");
  v34 = objc_claimAutoreleasedReturnValue();
  if (v34)
  {
    v35 = (void *)v34;
    -[LTSchemaSpeechTranslationEvent mobileAssetConfigVersion](self, "mobileAssetConfigVersion");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mobileAssetConfigVersion");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v36, "isEqual:", v37);

    if (!v38)
      goto LABEL_37;
  }
  else
  {

  }
  v41 = self->_has;
  v42 = (*(unsigned int *)&v41 >> 3) & 1;
  v43 = v4[84];
  if (v42 == ((v43 >> 3) & 1))
  {
    if (v42)
    {
      timeToFirstPartialDisplayed = self->_timeToFirstPartialDisplayed;
      if (timeToFirstPartialDisplayed != objc_msgSend(v4, "timeToFirstPartialDisplayed"))
        goto LABEL_37;
      v41 = self->_has;
      v43 = v4[84];
    }
    v45 = (*(unsigned int *)&v41 >> 4) & 1;
    if (v45 == ((v43 >> 4) & 1))
    {
      if (v45)
      {
        timeToRecordingDialogDismissed = self->_timeToRecordingDialogDismissed;
        if (timeToRecordingDialogDismissed != objc_msgSend(v4, "timeToRecordingDialogDismissed"))
          goto LABEL_37;
        v41 = self->_has;
        v43 = v4[84];
      }
      v47 = (*(unsigned int *)&v41 >> 5) & 1;
      if (v47 == ((v43 >> 5) & 1))
      {
        if (v47)
        {
          timeToShowTranslationCard = self->_timeToShowTranslationCard;
          if (timeToShowTranslationCard != objc_msgSend(v4, "timeToShowTranslationCard"))
            goto LABEL_37;
          v41 = self->_has;
          v43 = v4[84];
        }
        v49 = (*(unsigned int *)&v41 >> 6) & 1;
        if (v49 == ((v43 >> 6) & 1))
        {
          if (v49)
          {
            timeToCancel = self->_timeToCancel;
            if (timeToCancel != objc_msgSend(v4, "timeToCancel"))
              goto LABEL_37;
            v41 = self->_has;
            v43 = v4[84];
          }
          if (((v43 ^ *(_DWORD *)&v41) & 0x80) == 0)
          {
            if ((*(_BYTE *)&v41 & 0x80) == 0
              || (status = self->_status, status == objc_msgSend(v4, "status")))
            {
              v39 = 1;
              goto LABEL_38;
            }
          }
        }
      }
    }
  }
LABEL_37:
  v39 = 0;
LABEL_38:

  return v39;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  NSUInteger v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v3 = -[LTSchemaTask hash](self->_task, "hash");
  v4 = -[NSString hash](self->_sessionID, "hash");
  v5 = -[NSString hash](self->_requestID, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v6 = 2654435761 * self->_inRestrictedMode;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  else
  {
    v6 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v7 = 2654435761 * self->_isAutomaticLID;
      goto LABEL_6;
    }
  }
  v7 = 0;
LABEL_6:
  v8 = -[LTSchemaError hash](self->_error, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
    v9 = 2654435761 * self->_uiMode;
  else
    v9 = 0;
  v10 = -[NSString hash](self->_mobileAssetConfigVersion, "hash");
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    v11 = 2654435761 * self->_timeToFirstPartialDisplayed;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
    {
LABEL_11:
      v12 = 2654435761 * self->_timeToRecordingDialogDismissed;
      if ((*(_BYTE *)&self->_has & 0x20) != 0)
        goto LABEL_12;
      goto LABEL_17;
    }
  }
  else
  {
    v11 = 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_11;
  }
  v12 = 0;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
LABEL_12:
    v13 = 2654435761 * self->_timeToShowTranslationCard;
    if ((*(_BYTE *)&self->_has & 0x40) != 0)
      goto LABEL_13;
LABEL_18:
    v14 = 0;
    if ((*(_BYTE *)&self->_has & 0x80) != 0)
      goto LABEL_14;
LABEL_19:
    v15 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15;
  }
LABEL_17:
  v13 = 0;
  if ((*(_BYTE *)&self->_has & 0x40) == 0)
    goto LABEL_18;
LABEL_13:
  v14 = 2654435761 * self->_timeToCancel;
  if ((*(_BYTE *)&self->_has & 0x80) == 0)
    goto LABEL_19;
LABEL_14:
  v15 = 2654435761 * self->_status;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char has;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  unsigned int v26;
  const __CFString *v27;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_error)
  {
    -[LTSchemaSpeechTranslationEvent error](self, "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("error"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("error"));

    }
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[LTSchemaSpeechTranslationEvent inRestrictedMode](self, "inRestrictedMode"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("inRestrictedMode"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[LTSchemaSpeechTranslationEvent isAutomaticLID](self, "isAutomaticLID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("isAutomaticLID"));

  }
  if (self->_mobileAssetConfigVersion)
  {
    -[LTSchemaSpeechTranslationEvent mobileAssetConfigVersion](self, "mobileAssetConfigVersion");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("mobileAssetConfigVersion"));

  }
  if (self->_requestID)
  {
    -[LTSchemaSpeechTranslationEvent requestID](self, "requestID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("requestID"));

  }
  if (self->_sessionID)
  {
    -[LTSchemaSpeechTranslationEvent sessionID](self, "sessionID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("sessionID"));

  }
  if ((*(_BYTE *)&self->_has & 0x80000000) != 0)
  {
    v16 = -[LTSchemaSpeechTranslationEvent status](self, "status") - 1;
    if (v16 > 2)
      v17 = CFSTR("SPEECHTRANSLATIONSTATUS_UNKNOWN");
    else
      v17 = off_1E562FE78[v16];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("status"));
  }
  if (self->_task)
  {
    -[LTSchemaSpeechTranslationEvent task](self, "task");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "dictionaryRepresentation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("task"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("task"));

    }
  }
  v21 = (char)self->_has;
  if ((v21 & 0x40) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[LTSchemaSpeechTranslationEvent timeToCancel](self, "timeToCancel"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("timeToCancel"));

    v21 = (char)self->_has;
    if ((v21 & 8) == 0)
    {
LABEL_28:
      if ((v21 & 0x10) == 0)
        goto LABEL_29;
      goto LABEL_34;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_28;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[LTSchemaSpeechTranslationEvent timeToFirstPartialDisplayed](self, "timeToFirstPartialDisplayed"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("timeToFirstPartialDisplayed"));

  v21 = (char)self->_has;
  if ((v21 & 0x10) == 0)
  {
LABEL_29:
    if ((v21 & 0x20) == 0)
      goto LABEL_30;
LABEL_35:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[LTSchemaSpeechTranslationEvent timeToShowTranslationCard](self, "timeToShowTranslationCard"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("timeToShowTranslationCard"));

    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_40;
    goto LABEL_36;
  }
LABEL_34:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[LTSchemaSpeechTranslationEvent timeToRecordingDialogDismissed](self, "timeToRecordingDialogDismissed"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("timeToRecordingDialogDismissed"));

  v21 = (char)self->_has;
  if ((v21 & 0x20) != 0)
    goto LABEL_35;
LABEL_30:
  if ((v21 & 4) == 0)
    goto LABEL_40;
LABEL_36:
  v26 = -[LTSchemaSpeechTranslationEvent uiMode](self, "uiMode") - 1;
  if (v26 > 2)
    v27 = CFSTR("UI_MODE_UNKNOWN");
  else
    v27 = off_1E562FE90[v26];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("uiMode"));
LABEL_40:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[LTSchemaSpeechTranslationEvent dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (LTSchemaSpeechTranslationEvent)initWithJSON:(id)a3
{
  void *v4;
  LTSchemaSpeechTranslationEvent *v5;
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
    self = -[LTSchemaSpeechTranslationEvent initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (LTSchemaSpeechTranslationEvent)initWithDictionary:(id)a3
{
  id v4;
  LTSchemaSpeechTranslationEvent *v5;
  uint64_t v6;
  LTSchemaTask *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  LTSchemaError *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  LTSchemaSpeechTranslationEvent *v25;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  objc_super v33;

  v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)LTSchemaSpeechTranslationEvent;
  v5 = -[LTSchemaSpeechTranslationEvent init](&v33, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("task"));
    v6 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[LTSchemaTask initWithDictionary:]([LTSchemaTask alloc], "initWithDictionary:", v6);
      -[LTSchemaSpeechTranslationEvent setTask:](v5, "setTask:", v7);

    }
    v32 = (void *)v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sessionID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[LTSchemaSpeechTranslationEvent setSessionID:](v5, "setSessionID:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("requestID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = (void *)objc_msgSend(v10, "copy");
      -[LTSchemaSpeechTranslationEvent setRequestID:](v5, "setRequestID:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("inRestrictedMode"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[LTSchemaSpeechTranslationEvent setInRestrictedMode:](v5, "setInRestrictedMode:", objc_msgSend(v12, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isAutomaticLID"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[LTSchemaSpeechTranslationEvent setIsAutomaticLID:](v5, "setIsAutomaticLID:", objc_msgSend(v13, "BOOLValue"));
    v30 = v12;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("error"));
    v14 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = -[LTSchemaError initWithDictionary:]([LTSchemaError alloc], "initWithDictionary:", v14);
      -[LTSchemaSpeechTranslationEvent setError:](v5, "setError:", v15);

    }
    v28 = (void *)v14;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("uiMode"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[LTSchemaSpeechTranslationEvent setUiMode:](v5, "setUiMode:", objc_msgSend(v16, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mobileAssetConfigVersion"), v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v18 = (void *)objc_msgSend(v17, "copy");
      -[LTSchemaSpeechTranslationEvent setMobileAssetConfigVersion:](v5, "setMobileAssetConfigVersion:", v18);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timeToFirstPartialDisplayed"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[LTSchemaSpeechTranslationEvent setTimeToFirstPartialDisplayed:](v5, "setTimeToFirstPartialDisplayed:", objc_msgSend(v19, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timeToRecordingDialogDismissed"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[LTSchemaSpeechTranslationEvent setTimeToRecordingDialogDismissed:](v5, "setTimeToRecordingDialogDismissed:", objc_msgSend(v20, "unsignedIntValue"));
    v29 = v13;
    v31 = v8;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timeToShowTranslationCard"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[LTSchemaSpeechTranslationEvent setTimeToShowTranslationCard:](v5, "setTimeToShowTranslationCard:", objc_msgSend(v21, "unsignedIntValue"));
    v22 = v10;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timeToCancel"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[LTSchemaSpeechTranslationEvent setTimeToCancel:](v5, "setTimeToCancel:", objc_msgSend(v23, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("status"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[LTSchemaSpeechTranslationEvent setStatus:](v5, "setStatus:", objc_msgSend(v24, "intValue"));
    v25 = v5;

  }
  return v5;
}

- (LTSchemaTask)task
{
  return self->_task;
}

- (void)setTask:(id)a3
{
  objc_storeStrong((id *)&self->_task, a3);
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)requestID
{
  return self->_requestID;
}

- (void)setRequestID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)inRestrictedMode
{
  return self->_inRestrictedMode;
}

- (BOOL)isAutomaticLID
{
  return self->_isAutomaticLID;
}

- (LTSchemaError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (int)uiMode
{
  return self->_uiMode;
}

- (NSString)mobileAssetConfigVersion
{
  return self->_mobileAssetConfigVersion;
}

- (void)setMobileAssetConfigVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (unsigned)timeToFirstPartialDisplayed
{
  return self->_timeToFirstPartialDisplayed;
}

- (unsigned)timeToRecordingDialogDismissed
{
  return self->_timeToRecordingDialogDismissed;
}

- (unsigned)timeToShowTranslationCard
{
  return self->_timeToShowTranslationCard;
}

- (unsigned)timeToCancel
{
  return self->_timeToCancel;
}

- (int)status
{
  return self->_status;
}

- (void)setHasTask:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasSessionID:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void)setHasRequestID:(BOOL)a3
{
  *((_BYTE *)&self->_has + 3) = a3;
}

- (void)setHasError:(BOOL)a3
{
  self->_hasTask = a3;
}

- (void)setHasMobileAssetConfigVersion:(BOOL)a3
{
  self->_hasSessionID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mobileAssetConfigVersion, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_requestID, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_task, 0);
}

@end
