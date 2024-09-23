@implementation INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentSignals

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
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentSignals;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v16, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentSignals messageSignals](self, "messageSignals");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentSignals deleteMessageSignals](self, "deleteMessageSignals");
  -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentSignals phoneCallSignals](self, "phoneCallSignals");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentSignals deletePhoneCallSignals](self, "deletePhoneCallSignals");
  -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentSignals contactDependentSignals](self, "contactDependentSignals");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentSignals deleteContactDependentSignals](self, "deleteContactDependentSignals");

  return v5;
}

- (void)setIsResolvedApp:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_isResolvedApp = a3;
}

- (BOOL)hasIsResolvedApp
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasIsResolvedApp:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteIsResolvedApp
{
  -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentSignals setIsResolvedApp:](self, "setIsResolvedApp:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setIsResolvedContactInApp:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_isResolvedContactInApp = a3;
}

- (BOOL)hasIsResolvedContactInApp
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasIsResolvedContactInApp:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteIsResolvedContactInApp
{
  -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentSignals setIsResolvedContactInApp:](self, "setIsResolvedContactInApp:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setAppTimeSpentAffinityScore:(float)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_appTimeSpentAffinityScore = a3;
}

- (BOOL)hasAppTimeSpentAffinityScore
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasAppTimeSpentAffinityScore:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteAppTimeSpentAffinityScore
{
  double v2;

  LODWORD(v2) = 0;
  -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentSignals setAppTimeSpentAffinityScore:](self, "setAppTimeSpentAffinityScore:", v2);
  *(_BYTE *)&self->_has &= ~4u;
}

- (void)setIsForegroundApp:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_isForegroundApp = a3;
}

- (BOOL)hasIsForegroundApp
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasIsForegroundApp:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)deleteIsForegroundApp
{
  -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentSignals setIsForegroundApp:](self, "setIsForegroundApp:", 0);
  *(_BYTE *)&self->_has &= ~8u;
}

- (void)setTimeSinceAppLastLaunchedInSec:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_timeSinceAppLastLaunchedInSec = a3;
}

- (BOOL)hasTimeSinceAppLastLaunchedInSec
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setHasTimeSinceAppLastLaunchedInSec:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (void)deleteTimeSinceAppLastLaunchedInSec
{
  -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentSignals setTimeSinceAppLastLaunchedInSec:](self, "setTimeSinceAppLastLaunchedInSec:", 0);
  *(_BYTE *)&self->_has &= ~0x10u;
}

- (BOOL)hasMessageSignals
{
  return self->_messageSignals != 0;
}

- (void)deleteMessageSignals
{
  -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentSignals setMessageSignals:](self, "setMessageSignals:", 0);
}

- (BOOL)hasPhoneCallSignals
{
  return self->_phoneCallSignals != 0;
}

- (void)deletePhoneCallSignals
{
  -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentSignals setPhoneCallSignals:](self, "setPhoneCallSignals:", 0);
}

- (BOOL)hasContactDependentSignals
{
  return self->_contactDependentSignals != 0;
}

- (void)deleteContactDependentSignals
{
  -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentSignals setContactDependentSignals:](self, "setContactDependentSignals:", 0);
}

- (void)setIsFirstPartyApp:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_isFirstPartyApp = a3;
}

- (BOOL)hasIsFirstPartyApp
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setHasIsFirstPartyApp:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (void)deleteIsFirstPartyApp
{
  -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentSignals setIsFirstPartyApp:](self, "setIsFirstPartyApp:", 0);
  *(_BYTE *)&self->_has &= ~0x20u;
}

- (void)setAppTimeSpentInSec:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_appTimeSpentInSec = a3;
}

- (BOOL)hasAppTimeSpentInSec
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setHasAppTimeSpentInSec:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (void)deleteAppTimeSpentInSec
{
  -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentSignals setAppTimeSpentInSec:](self, "setAppTimeSpentInSec:", 0);
  *(_BYTE *)&self->_has &= ~0x40u;
}

- (void)setTimeSinceAppContactLastLaunchedInSec:(int)a3
{
  *(_BYTE *)&self->_has |= 0x80u;
  self->_timeSinceAppContactLastLaunchedInSec = a3;
}

- (BOOL)hasTimeSinceAppContactLastLaunchedInSec
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setHasTimeSinceAppContactLastLaunchedInSec:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 0x80;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = v3 & 0x80 | *(_BYTE *)&self->_has & 0x7F;
}

- (void)deleteTimeSinceAppContactLastLaunchedInSec
{
  -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentSignals setTimeSinceAppContactLastLaunchedInSec:](self, "setTimeSinceAppContactLastLaunchedInSec:", 0);
  *(_BYTE *)&self->_has &= ~0x80u;
}

- (BOOL)readFrom:(id)a3
{
  double v3;

  return INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentSignalsReadFrom(self, (uint64_t)a3, v3);
}

- (void)writeTo:(id)a3
{
  char has;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  id v12;

  v12 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_19;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteFloatField();
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_20:
  PBDataWriterWriteBOOLField();
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
LABEL_6:
    PBDataWriterWriteInt32Field();
LABEL_7:
  -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentSignals messageSignals](self, "messageSignals");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentSignals messageSignals](self, "messageSignals");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentSignals phoneCallSignals](self, "phoneCallSignals");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentSignals phoneCallSignals](self, "phoneCallSignals");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentSignals contactDependentSignals](self, "contactDependentSignals");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentSignals contactDependentSignals](self, "contactDependentSignals");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v11 = (char)self->_has;
  if ((v11 & 0x20) == 0)
  {
    if ((*(_BYTE *)&self->_has & 0x40) == 0)
      goto LABEL_15;
LABEL_23:
    PBDataWriterWriteInt64Field();
    if ((*(_BYTE *)&self->_has & 0x80) == 0)
      goto LABEL_16;
LABEL_24:
    PBDataWriterWriteInt32Field();
    goto LABEL_16;
  }
  PBDataWriterWriteBOOLField();
  v11 = (char)self->_has;
  if ((v11 & 0x40) != 0)
    goto LABEL_23;
LABEL_15:
  if (v11 < 0)
    goto LABEL_24;
LABEL_16:

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $629F197D9C6E6A37295ABA71DDD7F7A9 has;
  unsigned int v6;
  int isResolvedApp;
  int v8;
  int isResolvedContactInApp;
  int v10;
  float appTimeSpentAffinityScore;
  float v12;
  int v13;
  int isForegroundApp;
  int v15;
  int timeSinceAppLastLaunchedInSec;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  BOOL v34;
  $629F197D9C6E6A37295ABA71DDD7F7A9 v36;
  int v37;
  unsigned int v38;
  int isFirstPartyApp;
  int v40;
  int64_t appTimeSpentInSec;
  int timeSinceAppContactLastLaunchedInSec;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_36;
  has = self->_has;
  v6 = v4[68];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_36;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    isResolvedApp = self->_isResolvedApp;
    if (isResolvedApp != objc_msgSend(v4, "isResolvedApp"))
      goto LABEL_36;
    has = self->_has;
    v6 = v4[68];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 == ((v6 >> 1) & 1))
  {
    if (v8)
    {
      isResolvedContactInApp = self->_isResolvedContactInApp;
      if (isResolvedContactInApp != objc_msgSend(v4, "isResolvedContactInApp"))
        goto LABEL_36;
      has = self->_has;
      v6 = v4[68];
    }
    v10 = (*(unsigned int *)&has >> 2) & 1;
    if (v10 == ((v6 >> 2) & 1))
    {
      if (v10)
      {
        appTimeSpentAffinityScore = self->_appTimeSpentAffinityScore;
        objc_msgSend(v4, "appTimeSpentAffinityScore");
        if (appTimeSpentAffinityScore != v12)
          goto LABEL_36;
        has = self->_has;
        v6 = v4[68];
      }
      v13 = (*(unsigned int *)&has >> 3) & 1;
      if (v13 == ((v6 >> 3) & 1))
      {
        if (v13)
        {
          isForegroundApp = self->_isForegroundApp;
          if (isForegroundApp != objc_msgSend(v4, "isForegroundApp"))
            goto LABEL_36;
          has = self->_has;
          v6 = v4[68];
        }
        v15 = (*(unsigned int *)&has >> 4) & 1;
        if (v15 != ((v6 >> 4) & 1))
          goto LABEL_36;
        if (v15)
        {
          timeSinceAppLastLaunchedInSec = self->_timeSinceAppLastLaunchedInSec;
          if (timeSinceAppLastLaunchedInSec != objc_msgSend(v4, "timeSinceAppLastLaunchedInSec"))
            goto LABEL_36;
        }
        -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentSignals messageSignals](self, "messageSignals");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "messageSignals");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v17 == 0) == (v18 != 0))
          goto LABEL_35;
        -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentSignals messageSignals](self, "messageSignals");
        v19 = objc_claimAutoreleasedReturnValue();
        if (v19)
        {
          v20 = (void *)v19;
          -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentSignals messageSignals](self, "messageSignals");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "messageSignals");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v21, "isEqual:", v22);

          if (!v23)
            goto LABEL_36;
        }
        else
        {

        }
        -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentSignals phoneCallSignals](self, "phoneCallSignals");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "phoneCallSignals");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v17 == 0) == (v18 != 0))
          goto LABEL_35;
        -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentSignals phoneCallSignals](self, "phoneCallSignals");
        v24 = objc_claimAutoreleasedReturnValue();
        if (v24)
        {
          v25 = (void *)v24;
          -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentSignals phoneCallSignals](self, "phoneCallSignals");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "phoneCallSignals");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v26, "isEqual:", v27);

          if (!v28)
            goto LABEL_36;
        }
        else
        {

        }
        -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentSignals contactDependentSignals](self, "contactDependentSignals");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "contactDependentSignals");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v17 == 0) == (v18 != 0))
        {
LABEL_35:

          goto LABEL_36;
        }
        -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentSignals contactDependentSignals](self, "contactDependentSignals");
        v29 = objc_claimAutoreleasedReturnValue();
        if (v29)
        {
          v30 = (void *)v29;
          -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentSignals contactDependentSignals](self, "contactDependentSignals");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "contactDependentSignals");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend(v31, "isEqual:", v32);

          if (!v33)
            goto LABEL_36;
        }
        else
        {

        }
        v36 = self->_has;
        v37 = (*(unsigned int *)&v36 >> 5) & 1;
        v38 = v4[68];
        if (v37 == ((v38 >> 5) & 1))
        {
          if (v37)
          {
            isFirstPartyApp = self->_isFirstPartyApp;
            if (isFirstPartyApp != objc_msgSend(v4, "isFirstPartyApp"))
              goto LABEL_36;
            v36 = self->_has;
            v38 = v4[68];
          }
          v40 = (*(unsigned int *)&v36 >> 6) & 1;
          if (v40 == ((v38 >> 6) & 1))
          {
            if (v40)
            {
              appTimeSpentInSec = self->_appTimeSpentInSec;
              if (appTimeSpentInSec != objc_msgSend(v4, "appTimeSpentInSec"))
                goto LABEL_36;
              v36 = self->_has;
              v38 = v4[68];
            }
            if (((v38 ^ *(_DWORD *)&v36) & 0x80) == 0)
            {
              if ((*(_BYTE *)&v36 & 0x80) == 0
                || (timeSinceAppContactLastLaunchedInSec = self->_timeSinceAppContactLastLaunchedInSec,
                    timeSinceAppContactLastLaunchedInSec == objc_msgSend(v4, "timeSinceAppContactLastLaunchedInSec")))
              {
                v34 = 1;
                goto LABEL_37;
              }
            }
          }
        }
      }
    }
  }
LABEL_36:
  v34 = 0;
LABEL_37:

  return v34;
}

- (unint64_t)hash
{
  char has;
  uint64_t v4;
  uint64_t v5;
  float appTimeSpentAffinityScore;
  double v7;
  long double v8;
  double v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_9:
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_4;
LABEL_10:
    v10 = 0;
    goto LABEL_13;
  }
  v4 = 2654435761 * self->_isResolvedApp;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_9;
LABEL_3:
  v5 = 2654435761 * self->_isResolvedContactInApp;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_10;
LABEL_4:
  appTimeSpentAffinityScore = self->_appTimeSpentAffinityScore;
  v7 = appTimeSpentAffinityScore;
  if (appTimeSpentAffinityScore < 0.0)
    v7 = -appTimeSpentAffinityScore;
  v8 = floor(v7 + 0.5);
  v9 = (v7 - v8) * 1.84467441e19;
  v10 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
  if (v9 >= 0.0)
  {
    if (v9 > 0.0)
      v10 += (unint64_t)v9;
  }
  else
  {
    v10 -= (unint64_t)fabs(v9);
  }
LABEL_13:
  if ((has & 8) != 0)
  {
    v11 = 2654435761 * self->_isForegroundApp;
    if ((has & 0x10) != 0)
      goto LABEL_15;
  }
  else
  {
    v11 = 0;
    if ((has & 0x10) != 0)
    {
LABEL_15:
      v12 = 2654435761 * self->_timeSinceAppLastLaunchedInSec;
      goto LABEL_18;
    }
  }
  v12 = 0;
LABEL_18:
  v13 = -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentMessageSignals hash](self->_messageSignals, "hash");
  v14 = -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentPhoneCallSignals hash](self->_phoneCallSignals, "hash");
  v15 = -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentSignals hash](self->_contactDependentSignals, "hash");
  if ((*(_BYTE *)&self->_has & 0x20) == 0)
  {
    v16 = 0;
    if ((*(_BYTE *)&self->_has & 0x40) != 0)
      goto LABEL_20;
LABEL_23:
    v17 = 0;
    if ((*(_BYTE *)&self->_has & 0x80) != 0)
      goto LABEL_21;
LABEL_24:
    v18 = 0;
    return v5 ^ v4 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18;
  }
  v16 = 2654435761 * self->_isFirstPartyApp;
  if ((*(_BYTE *)&self->_has & 0x40) == 0)
    goto LABEL_23;
LABEL_20:
  v17 = 2654435761 * self->_appTimeSpentInSec;
  if ((*(_BYTE *)&self->_has & 0x80) == 0)
    goto LABEL_24;
LABEL_21:
  v18 = 2654435761 * self->_timeSinceAppContactLastLaunchedInSec;
  return v5 ^ v4 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  $629F197D9C6E6A37295ABA71DDD7F7A9 v22;
  void *v23;
  void *v25;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v5 = (void *)MEMORY[0x1E0CB37E8];
    -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentSignals appTimeSpentAffinityScore](self, "appTimeSpentAffinityScore");
    objc_msgSend(v5, "numberWithFloat:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("appTimeSpentAffinityScore"));

    has = (char)self->_has;
  }
  if ((has & 0x40) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentSignals appTimeSpentInSec](self, "appTimeSpentInSec"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("appTimeSpentInSec"));

  }
  if (self->_contactDependentSignals)
  {
    -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentSignals contactDependentSignals](self, "contactDependentSignals");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("contactDependentSignals"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("contactDependentSignals"));

    }
  }
  v11 = (char)self->_has;
  if ((v11 & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentSignals isFirstPartyApp](self, "isFirstPartyApp"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("isFirstPartyApp"));

    v11 = (char)self->_has;
    if ((v11 & 8) == 0)
    {
LABEL_12:
      if ((v11 & 1) == 0)
        goto LABEL_13;
      goto LABEL_20;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentSignals isForegroundApp](self, "isForegroundApp"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("isForegroundApp"));

  v11 = (char)self->_has;
  if ((v11 & 1) == 0)
  {
LABEL_13:
    if ((v11 & 2) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
LABEL_20:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentSignals isResolvedApp](self, "isResolvedApp"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("isResolvedApp"));

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_14:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentSignals isResolvedContactInApp](self, "isResolvedContactInApp"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("isResolvedContactInApp"));

  }
LABEL_15:
  if (self->_messageSignals)
  {
    -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentSignals messageSignals](self, "messageSignals");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("messageSignals"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("messageSignals"));

    }
  }
  if (self->_phoneCallSignals)
  {
    -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentSignals phoneCallSignals](self, "phoneCallSignals");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "dictionaryRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("phoneCallSignals"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("phoneCallSignals"));

    }
  }
  v22 = self->_has;
  if ((*(_DWORD *)&v22 & 0x80000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentSignals timeSinceAppContactLastLaunchedInSec](self, "timeSinceAppContactLastLaunchedInSec"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("timeSinceAppContactLastLaunchedInSec"));

    if ((*(_BYTE *)&self->_has & 0x10) == 0)
      goto LABEL_32;
    goto LABEL_31;
  }
  if ((*(_BYTE *)&v22 & 0x10) != 0)
  {
LABEL_31:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentSignals timeSinceAppLastLaunchedInSec](self, "timeSinceAppLastLaunchedInSec"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("timeSinceAppLastLaunchedInSec"));

  }
LABEL_32:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentSignals dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentSignals)initWithJSON:(id)a3
{
  void *v4;
  INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentSignals *v5;
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
    self = -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentSignals initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentSignals)initWithDictionary:(id)a3
{
  id v4;
  INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentSignals *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentMessageSignals *v12;
  void *v13;
  INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentPhoneCallSignals *v14;
  void *v15;
  INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentSignals *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentSignals *v22;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  objc_super v28;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentSignals;
  v5 = -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentSignals init](&v28, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isResolvedApp"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentSignals setIsResolvedApp:](v5, "setIsResolvedApp:", objc_msgSend(v6, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isResolvedContactInApp"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentSignals setIsResolvedContactInApp:](v5, "setIsResolvedContactInApp:", objc_msgSend(v7, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appTimeSpentAffinityScore"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v8, "floatValue");
      -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentSignals setAppTimeSpentAffinityScore:](v5, "setAppTimeSpentAffinityScore:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isForegroundApp"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentSignals setIsForegroundApp:](v5, "setIsForegroundApp:", objc_msgSend(v9, "BOOLValue"));
    v26 = v7;
    v27 = v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timeSinceAppLastLaunchedInSec"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentSignals setTimeSinceAppLastLaunchedInSec:](v5, "setTimeSinceAppLastLaunchedInSec:", objc_msgSend(v10, "intValue"));
    v25 = v10;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("messageSignals"));
    v11 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentMessageSignals initWithDictionary:]([INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentMessageSignals alloc], "initWithDictionary:", v11);
      -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentSignals setMessageSignals:](v5, "setMessageSignals:", v12);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("phoneCallSignals"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentPhoneCallSignals initWithDictionary:]([INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentPhoneCallSignals alloc], "initWithDictionary:", v13);
      -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentSignals setPhoneCallSignals:](v5, "setPhoneCallSignals:", v14);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("contactDependentSignals"), v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16 = -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentSignals initWithDictionary:]([INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentSignals alloc], "initWithDictionary:", v15);
      -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentSignals setContactDependentSignals:](v5, "setContactDependentSignals:", v16);

    }
    v17 = v9;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isFirstPartyApp"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentSignals setIsFirstPartyApp:](v5, "setIsFirstPartyApp:", objc_msgSend(v18, "BOOLValue"));
    v19 = v8;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appTimeSpentInSec"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentSignals setAppTimeSpentInSec:](v5, "setAppTimeSpentInSec:", objc_msgSend(v20, "longLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timeSinceAppContactLastLaunchedInSec"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentSignals setTimeSinceAppContactLastLaunchedInSec:](v5, "setTimeSinceAppContactLastLaunchedInSec:", objc_msgSend(v21, "intValue"));
    v22 = v5;

  }
  return v5;
}

- (BOOL)isResolvedApp
{
  return self->_isResolvedApp;
}

- (BOOL)isResolvedContactInApp
{
  return self->_isResolvedContactInApp;
}

- (float)appTimeSpentAffinityScore
{
  return self->_appTimeSpentAffinityScore;
}

- (BOOL)isForegroundApp
{
  return self->_isForegroundApp;
}

- (int)timeSinceAppLastLaunchedInSec
{
  return self->_timeSinceAppLastLaunchedInSec;
}

- (INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentMessageSignals)messageSignals
{
  return self->_messageSignals;
}

- (void)setMessageSignals:(id)a3
{
  objc_storeStrong((id *)&self->_messageSignals, a3);
}

- (INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentPhoneCallSignals)phoneCallSignals
{
  return self->_phoneCallSignals;
}

- (void)setPhoneCallSignals:(id)a3
{
  objc_storeStrong((id *)&self->_phoneCallSignals, a3);
}

- (INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentSignals)contactDependentSignals
{
  return self->_contactDependentSignals;
}

- (void)setContactDependentSignals:(id)a3
{
  objc_storeStrong((id *)&self->_contactDependentSignals, a3);
}

- (BOOL)isFirstPartyApp
{
  return self->_isFirstPartyApp;
}

- (int64_t)appTimeSpentInSec
{
  return self->_appTimeSpentInSec;
}

- (int)timeSinceAppContactLastLaunchedInSec
{
  return self->_timeSinceAppContactLastLaunchedInSec;
}

- (void)setHasMessageSignals:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasPhoneCallSignals:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void)setHasContactDependentSignals:(BOOL)a3
{
  *((_BYTE *)&self->_has + 3) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactDependentSignals, 0);
  objc_storeStrong((id *)&self->_phoneCallSignals, 0);
  objc_storeStrong((id *)&self->_messageSignals, 0);
}

@end
