@implementation INFERENCESchemaINFERENCECommonAppDependentSignals

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
  v13.super_class = (Class)INFERENCESchemaINFERENCECommonAppDependentSignals;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v13, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[INFERENCESchemaINFERENCECommonAppDependentSignals appDependentFrequencyAndRecencySignals](self, "appDependentFrequencyAndRecencySignals");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[INFERENCESchemaINFERENCECommonAppDependentSignals deleteAppDependentFrequencyAndRecencySignals](self, "deleteAppDependentFrequencyAndRecencySignals");
  -[INFERENCESchemaINFERENCECommonAppDependentSignals appDependentEntityFrequencyAndRecencySignals](self, "appDependentEntityFrequencyAndRecencySignals");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[INFERENCESchemaINFERENCECommonAppDependentSignals deleteAppDependentEntityFrequencyAndRecencySignals](self, "deleteAppDependentEntityFrequencyAndRecencySignals");

  return v5;
}

- (BOOL)hasAppBundleId
{
  return self->_appBundleId != 0;
}

- (void)deleteAppBundleId
{
  -[INFERENCESchemaINFERENCECommonAppDependentSignals setAppBundleId:](self, "setAppBundleId:", 0);
}

- (void)setIsFirstPartyBundle:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_isFirstPartyBundle = a3;
}

- (BOOL)hasIsFirstPartyBundle
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasIsFirstPartyBundle:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteIsFirstPartyBundle
{
  -[INFERENCESchemaINFERENCECommonAppDependentSignals setIsFirstPartyBundle:](self, "setIsFirstPartyBundle:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setIsForegroundApp:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_isForegroundApp = a3;
}

- (BOOL)hasIsForegroundApp
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasIsForegroundApp:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteIsForegroundApp
{
  -[INFERENCESchemaINFERENCECommonAppDependentSignals setIsForegroundApp:](self, "setIsForegroundApp:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setIsResolvedApp:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_isResolvedApp = a3;
}

- (BOOL)hasIsResolvedApp
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasIsResolvedApp:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteIsResolvedApp
{
  -[INFERENCESchemaINFERENCECommonAppDependentSignals setIsResolvedApp:](self, "setIsResolvedApp:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (void)setAppScoreFromModel:(float)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_appScoreFromModel = a3;
}

- (BOOL)hasAppScoreFromModel
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasAppScoreFromModel:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)deleteAppScoreFromModel
{
  double v2;

  LODWORD(v2) = 0;
  -[INFERENCESchemaINFERENCECommonAppDependentSignals setAppScoreFromModel:](self, "setAppScoreFromModel:", v2);
  *(_BYTE *)&self->_has &= ~8u;
}

- (void)setCompoundActiveBundleScore:(double)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_compoundActiveBundleScore = a3;
}

- (BOOL)hasCompoundActiveBundleScore
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setHasCompoundActiveBundleScore:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (void)deleteCompoundActiveBundleScore
{
  -[INFERENCESchemaINFERENCECommonAppDependentSignals setCompoundActiveBundleScore:](self, "setCompoundActiveBundleScore:", 0.0);
  *(_BYTE *)&self->_has &= ~0x10u;
}

- (void)setTotalTimeSpentByUserInAppPerDay:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_totalTimeSpentByUserInAppPerDay = a3;
}

- (BOOL)hasTotalTimeSpentByUserInAppPerDay
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setHasTotalTimeSpentByUserInAppPerDay:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (void)deleteTotalTimeSpentByUserInAppPerDay
{
  -[INFERENCESchemaINFERENCECommonAppDependentSignals setTotalTimeSpentByUserInAppPerDay:](self, "setTotalTimeSpentByUserInAppPerDay:", 0);
  *(_BYTE *)&self->_has &= ~0x20u;
}

- (void)setTimeSpentByUserInAppToday:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_timeSpentByUserInAppToday = a3;
}

- (BOOL)hasTimeSpentByUserInAppToday
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setHasTimeSpentByUserInAppToday:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (void)deleteTimeSpentByUserInAppToday
{
  -[INFERENCESchemaINFERENCECommonAppDependentSignals setTimeSpentByUserInAppToday:](self, "setTimeSpentByUserInAppToday:", 0);
  *(_BYTE *)&self->_has &= ~0x40u;
}

- (void)setTimeSinceAppLastLaunchedInSec:(int)a3
{
  *(_BYTE *)&self->_has |= 0x80u;
  self->_timeSinceAppLastLaunchedInSec = a3;
}

- (BOOL)hasTimeSinceAppLastLaunchedInSec
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setHasTimeSinceAppLastLaunchedInSec:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 0x80;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = v3 & 0x80 | *(_BYTE *)&self->_has & 0x7F;
}

- (void)deleteTimeSinceAppLastLaunchedInSec
{
  -[INFERENCESchemaINFERENCECommonAppDependentSignals setTimeSinceAppLastLaunchedInSec:](self, "setTimeSinceAppLastLaunchedInSec:", 0);
  *(_BYTE *)&self->_has &= ~0x80u;
}

- (BOOL)hasAppDependentFrequencyAndRecencySignals
{
  return self->_appDependentFrequencyAndRecencySignals != 0;
}

- (void)deleteAppDependentFrequencyAndRecencySignals
{
  -[INFERENCESchemaINFERENCECommonAppDependentSignals setAppDependentFrequencyAndRecencySignals:](self, "setAppDependentFrequencyAndRecencySignals:", 0);
}

- (BOOL)hasAppDependentEntityFrequencyAndRecencySignals
{
  return self->_appDependentEntityFrequencyAndRecencySignals != 0;
}

- (void)deleteAppDependentEntityFrequencyAndRecencySignals
{
  -[INFERENCESchemaINFERENCECommonAppDependentSignals setAppDependentEntityFrequencyAndRecencySignals:](self, "setAppDependentEntityFrequencyAndRecencySignals:", 0);
}

- (BOOL)readFrom:(id)a3
{
  double v3;

  return INFERENCESchemaINFERENCECommonAppDependentSignalsReadFrom(self, (uint64_t)a3, v3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  char has;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[INFERENCESchemaINFERENCECommonAppDependentSignals appBundleId](self, "appBundleId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
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
      goto LABEL_18;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteBOOLField();
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 8) == 0)
      goto LABEL_7;
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteBOOLField();
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0)
      goto LABEL_8;
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteFloatField();
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteDoubleField();
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_9:
    if ((has & 0x40) == 0)
      goto LABEL_10;
LABEL_22:
    PBDataWriterWriteUint32Field();
    if ((*(_BYTE *)&self->_has & 0x80) == 0)
      goto LABEL_11;
    goto LABEL_23;
  }
LABEL_21:
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 0x40) != 0)
    goto LABEL_22;
LABEL_10:
  if ((has & 0x80) == 0)
    goto LABEL_11;
LABEL_23:
  PBDataWriterWriteInt32Field();
LABEL_11:
  -[INFERENCESchemaINFERENCECommonAppDependentSignals appDependentFrequencyAndRecencySignals](self, "appDependentFrequencyAndRecencySignals");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[INFERENCESchemaINFERENCECommonAppDependentSignals appDependentFrequencyAndRecencySignals](self, "appDependentFrequencyAndRecencySignals");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[INFERENCESchemaINFERENCECommonAppDependentSignals appDependentEntityFrequencyAndRecencySignals](self, "appDependentEntityFrequencyAndRecencySignals");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v11;
  if (v8)
  {
    -[INFERENCESchemaINFERENCECommonAppDependentSignals appDependentEntityFrequencyAndRecencySignals](self, "appDependentEntityFrequencyAndRecencySignals");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v9 = v11;
  }

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
  $EDD110F34301AB61D693967E36C3E96A has;
  unsigned int v13;
  int isFirstPartyBundle;
  int v15;
  int isForegroundApp;
  int v17;
  int isResolvedApp;
  int v19;
  float appScoreFromModel;
  float v21;
  int v22;
  double compoundActiveBundleScore;
  double v24;
  int v25;
  unsigned int totalTimeSpentByUserInAppPerDay;
  int v27;
  unsigned int timeSpentByUserInAppToday;
  int timeSinceAppLastLaunchedInSec;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  char v39;
  BOOL v40;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_48;
  -[INFERENCESchemaINFERENCECommonAppDependentSignals appBundleId](self, "appBundleId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appBundleId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_47;
  -[INFERENCESchemaINFERENCECommonAppDependentSignals appBundleId](self, "appBundleId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[INFERENCESchemaINFERENCECommonAppDependentSignals appBundleId](self, "appBundleId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appBundleId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_48;
  }
  else
  {

  }
  has = self->_has;
  v13 = v4[64];
  if ((*(_BYTE *)&has & 1) != (v13 & 1))
    goto LABEL_48;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    isFirstPartyBundle = self->_isFirstPartyBundle;
    if (isFirstPartyBundle != objc_msgSend(v4, "isFirstPartyBundle"))
      goto LABEL_48;
    has = self->_has;
    v13 = v4[64];
  }
  v15 = (*(unsigned int *)&has >> 1) & 1;
  if (v15 != ((v13 >> 1) & 1))
    goto LABEL_48;
  if (v15)
  {
    isForegroundApp = self->_isForegroundApp;
    if (isForegroundApp != objc_msgSend(v4, "isForegroundApp"))
      goto LABEL_48;
    has = self->_has;
    v13 = v4[64];
  }
  v17 = (*(unsigned int *)&has >> 2) & 1;
  if (v17 != ((v13 >> 2) & 1))
    goto LABEL_48;
  if (v17)
  {
    isResolvedApp = self->_isResolvedApp;
    if (isResolvedApp != objc_msgSend(v4, "isResolvedApp"))
      goto LABEL_48;
    has = self->_has;
    v13 = v4[64];
  }
  v19 = (*(unsigned int *)&has >> 3) & 1;
  if (v19 != ((v13 >> 3) & 1))
    goto LABEL_48;
  if (v19)
  {
    appScoreFromModel = self->_appScoreFromModel;
    objc_msgSend(v4, "appScoreFromModel");
    if (appScoreFromModel != v21)
      goto LABEL_48;
    has = self->_has;
    v13 = v4[64];
  }
  v22 = (*(unsigned int *)&has >> 4) & 1;
  if (v22 != ((v13 >> 4) & 1))
    goto LABEL_48;
  if (v22)
  {
    compoundActiveBundleScore = self->_compoundActiveBundleScore;
    objc_msgSend(v4, "compoundActiveBundleScore");
    if (compoundActiveBundleScore != v24)
      goto LABEL_48;
    has = self->_has;
    v13 = v4[64];
  }
  v25 = (*(unsigned int *)&has >> 5) & 1;
  if (v25 != ((v13 >> 5) & 1))
    goto LABEL_48;
  if (v25)
  {
    totalTimeSpentByUserInAppPerDay = self->_totalTimeSpentByUserInAppPerDay;
    if (totalTimeSpentByUserInAppPerDay != objc_msgSend(v4, "totalTimeSpentByUserInAppPerDay"))
      goto LABEL_48;
    has = self->_has;
    v13 = v4[64];
  }
  v27 = (*(unsigned int *)&has >> 6) & 1;
  if (v27 != ((v13 >> 6) & 1))
    goto LABEL_48;
  if (v27)
  {
    timeSpentByUserInAppToday = self->_timeSpentByUserInAppToday;
    if (timeSpentByUserInAppToday != objc_msgSend(v4, "timeSpentByUserInAppToday"))
      goto LABEL_48;
    has = self->_has;
    v13 = v4[64];
  }
  if (((v13 ^ *(_DWORD *)&has) & 0x80) != 0)
    goto LABEL_48;
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    timeSinceAppLastLaunchedInSec = self->_timeSinceAppLastLaunchedInSec;
    if (timeSinceAppLastLaunchedInSec != objc_msgSend(v4, "timeSinceAppLastLaunchedInSec"))
      goto LABEL_48;
  }
  -[INFERENCESchemaINFERENCECommonAppDependentSignals appDependentFrequencyAndRecencySignals](self, "appDependentFrequencyAndRecencySignals");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appDependentFrequencyAndRecencySignals");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_47;
  -[INFERENCESchemaINFERENCECommonAppDependentSignals appDependentFrequencyAndRecencySignals](self, "appDependentFrequencyAndRecencySignals");
  v30 = objc_claimAutoreleasedReturnValue();
  if (v30)
  {
    v31 = (void *)v30;
    -[INFERENCESchemaINFERENCECommonAppDependentSignals appDependentFrequencyAndRecencySignals](self, "appDependentFrequencyAndRecencySignals");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appDependentFrequencyAndRecencySignals");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v32, "isEqual:", v33);

    if (!v34)
      goto LABEL_48;
  }
  else
  {

  }
  -[INFERENCESchemaINFERENCECommonAppDependentSignals appDependentEntityFrequencyAndRecencySignals](self, "appDependentEntityFrequencyAndRecencySignals");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appDependentEntityFrequencyAndRecencySignals");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_47:

    goto LABEL_48;
  }
  -[INFERENCESchemaINFERENCECommonAppDependentSignals appDependentEntityFrequencyAndRecencySignals](self, "appDependentEntityFrequencyAndRecencySignals");
  v35 = objc_claimAutoreleasedReturnValue();
  if (!v35)
  {

LABEL_51:
    v40 = 1;
    goto LABEL_49;
  }
  v36 = (void *)v35;
  -[INFERENCESchemaINFERENCECommonAppDependentSignals appDependentEntityFrequencyAndRecencySignals](self, "appDependentEntityFrequencyAndRecencySignals");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appDependentEntityFrequencyAndRecencySignals");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v37, "isEqual:", v38);

  if ((v39 & 1) != 0)
    goto LABEL_51;
LABEL_48:
  v40 = 0;
LABEL_49:

  return v40;
}

- (unint64_t)hash
{
  NSUInteger v3;
  char has;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  float appScoreFromModel;
  double v9;
  long double v10;
  double v11;
  unint64_t v12;
  unint64_t v13;
  double compoundActiveBundleScore;
  double v15;
  long double v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;

  v3 = -[NSString hash](self->_appBundleId, "hash");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v5 = 2654435761 * self->_isFirstPartyBundle;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v6 = 2654435761 * self->_isForegroundApp;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_4;
LABEL_11:
      v7 = 0;
      if ((*(_BYTE *)&self->_has & 8) != 0)
        goto LABEL_5;
LABEL_12:
      v12 = 0;
      goto LABEL_15;
    }
  }
  else
  {
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  v6 = 0;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_11;
LABEL_4:
  v7 = 2654435761 * self->_isResolvedApp;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_12;
LABEL_5:
  appScoreFromModel = self->_appScoreFromModel;
  v9 = appScoreFromModel;
  if (appScoreFromModel < 0.0)
    v9 = -appScoreFromModel;
  v10 = floor(v9 + 0.5);
  v11 = (v9 - v10) * 1.84467441e19;
  v12 = 2654435761u * (unint64_t)fmod(v10, 1.84467441e19);
  if (v11 >= 0.0)
  {
    if (v11 > 0.0)
      v12 += (unint64_t)v11;
  }
  else
  {
    v12 -= (unint64_t)fabs(v11);
  }
LABEL_15:
  if ((has & 0x10) != 0)
  {
    compoundActiveBundleScore = self->_compoundActiveBundleScore;
    v15 = -compoundActiveBundleScore;
    if (compoundActiveBundleScore >= 0.0)
      v15 = self->_compoundActiveBundleScore;
    v16 = floor(v15 + 0.5);
    v17 = (v15 - v16) * 1.84467441e19;
    v13 = 2654435761u * (unint64_t)fmod(v16, 1.84467441e19);
    if (v17 >= 0.0)
    {
      if (v17 > 0.0)
        v13 += (unint64_t)v17;
    }
    else
    {
      v13 -= (unint64_t)fabs(v17);
    }
  }
  else
  {
    v13 = 0;
  }
  if ((has & 0x20) == 0)
  {
    v18 = 0;
    if ((has & 0x40) != 0)
      goto LABEL_25;
LABEL_28:
    v19 = 0;
    if (has < 0)
      goto LABEL_26;
LABEL_29:
    v20 = 0;
    goto LABEL_30;
  }
  v18 = 2654435761 * self->_totalTimeSpentByUserInAppPerDay;
  if ((has & 0x40) == 0)
    goto LABEL_28;
LABEL_25:
  v19 = 2654435761 * self->_timeSpentByUserInAppToday;
  if ((has & 0x80) == 0)
    goto LABEL_29;
LABEL_26:
  v20 = 2654435761 * self->_timeSinceAppLastLaunchedInSec;
LABEL_30:
  v21 = v5 ^ v3 ^ v6 ^ v7 ^ v12 ^ v13 ^ v18 ^ v19 ^ v20 ^ -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals hash](self->_appDependentFrequencyAndRecencySignals, "hash");
  return v21 ^ -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals hash](self->_appDependentEntityFrequencyAndRecencySignals, "hash");
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
  void *v10;
  void *v11;
  char has;
  void *v13;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_appBundleId)
  {
    -[INFERENCESchemaINFERENCECommonAppDependentSignals appBundleId](self, "appBundleId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("appBundleId"));

  }
  if (self->_appDependentEntityFrequencyAndRecencySignals)
  {
    -[INFERENCESchemaINFERENCECommonAppDependentSignals appDependentEntityFrequencyAndRecencySignals](self, "appDependentEntityFrequencyAndRecencySignals");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("appDependentEntityFrequencyAndRecencySignals"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("appDependentEntityFrequencyAndRecencySignals"));

    }
  }
  if (self->_appDependentFrequencyAndRecencySignals)
  {
    -[INFERENCESchemaINFERENCECommonAppDependentSignals appDependentFrequencyAndRecencySignals](self, "appDependentFrequencyAndRecencySignals");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("appDependentFrequencyAndRecencySignals"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("appDependentFrequencyAndRecencySignals"));

    }
  }
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v15 = (void *)MEMORY[0x1E0CB37E8];
    -[INFERENCESchemaINFERENCECommonAppDependentSignals appScoreFromModel](self, "appScoreFromModel");
    objc_msgSend(v15, "numberWithFloat:");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("appScoreFromModel"));

    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_15:
      if ((has & 1) == 0)
        goto LABEL_16;
      goto LABEL_25;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_15;
  }
  v17 = (void *)MEMORY[0x1E0CB37E8];
  -[INFERENCESchemaINFERENCECommonAppDependentSignals compoundActiveBundleScore](self, "compoundActiveBundleScore");
  objc_msgSend(v17, "numberWithDouble:");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("compoundActiveBundleScore"));

  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_16:
    if ((has & 2) == 0)
      goto LABEL_17;
    goto LABEL_26;
  }
LABEL_25:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCECommonAppDependentSignals isFirstPartyBundle](self, "isFirstPartyBundle"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("isFirstPartyBundle"));

  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_17:
    if ((has & 4) == 0)
      goto LABEL_18;
    goto LABEL_27;
  }
LABEL_26:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCECommonAppDependentSignals isForegroundApp](self, "isForegroundApp"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("isForegroundApp"));

  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_18:
    if ((has & 0x80) == 0)
      goto LABEL_19;
    goto LABEL_28;
  }
LABEL_27:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCECommonAppDependentSignals isResolvedApp](self, "isResolvedApp"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("isResolvedApp"));

  has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_19:
    if ((has & 0x40) == 0)
      goto LABEL_20;
LABEL_29:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[INFERENCESchemaINFERENCECommonAppDependentSignals timeSpentByUserInAppToday](self, "timeSpentByUserInAppToday"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("timeSpentByUserInAppToday"));

    if ((*(_BYTE *)&self->_has & 0x20) == 0)
      goto LABEL_22;
    goto LABEL_21;
  }
LABEL_28:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppDependentSignals timeSinceAppLastLaunchedInSec](self, "timeSinceAppLastLaunchedInSec"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("timeSinceAppLastLaunchedInSec"));

  has = (char)self->_has;
  if ((has & 0x40) != 0)
    goto LABEL_29;
LABEL_20:
  if ((has & 0x20) != 0)
  {
LABEL_21:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[INFERENCESchemaINFERENCECommonAppDependentSignals totalTimeSpentByUserInAppPerDay](self, "totalTimeSpentByUserInAppPerDay"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("totalTimeSpentByUserInAppPerDay"));

  }
LABEL_22:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[INFERENCESchemaINFERENCECommonAppDependentSignals dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (INFERENCESchemaINFERENCECommonAppDependentSignals)initWithJSON:(id)a3
{
  void *v4;
  INFERENCESchemaINFERENCECommonAppDependentSignals *v5;
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
    self = -[INFERENCESchemaINFERENCECommonAppDependentSignals initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (INFERENCESchemaINFERENCECommonAppDependentSignals)initWithDictionary:(id)a3
{
  id v4;
  INFERENCESchemaINFERENCECommonAppDependentSignals *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals *v17;
  void *v18;
  INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals *v19;
  INFERENCESchemaINFERENCECommonAppDependentSignals *v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)INFERENCESchemaINFERENCECommonAppDependentSignals;
  v5 = -[INFERENCESchemaINFERENCECommonAppDependentSignals init](&v26, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appBundleId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[INFERENCESchemaINFERENCECommonAppDependentSignals setAppBundleId:](v5, "setAppBundleId:", v7);

    }
    v25 = v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isFirstPartyBundle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECommonAppDependentSignals setIsFirstPartyBundle:](v5, "setIsFirstPartyBundle:", objc_msgSend(v8, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isForegroundApp"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECommonAppDependentSignals setIsForegroundApp:](v5, "setIsForegroundApp:", objc_msgSend(v9, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isResolvedApp"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECommonAppDependentSignals setIsResolvedApp:](v5, "setIsResolvedApp:", objc_msgSend(v10, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appScoreFromModel"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v11, "floatValue");
      -[INFERENCESchemaINFERENCECommonAppDependentSignals setAppScoreFromModel:](v5, "setAppScoreFromModel:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("compoundActiveBundleScore"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v12, "doubleValue");
      -[INFERENCESchemaINFERENCECommonAppDependentSignals setCompoundActiveBundleScore:](v5, "setCompoundActiveBundleScore:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("totalTimeSpentByUserInAppPerDay"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECommonAppDependentSignals setTotalTimeSpentByUserInAppPerDay:](v5, "setTotalTimeSpentByUserInAppPerDay:", objc_msgSend(v13, "unsignedIntValue"));
    v24 = v8;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timeSpentByUserInAppToday"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECommonAppDependentSignals setTimeSpentByUserInAppToday:](v5, "setTimeSpentByUserInAppToday:", objc_msgSend(v14, "unsignedIntValue"));
    v23 = v9;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timeSinceAppLastLaunchedInSec"), v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECommonAppDependentSignals setTimeSinceAppLastLaunchedInSec:](v5, "setTimeSinceAppLastLaunchedInSec:", objc_msgSend(v15, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appDependentFrequencyAndRecencySignals"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals initWithDictionary:]([INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals alloc], "initWithDictionary:", v16);
      -[INFERENCESchemaINFERENCECommonAppDependentSignals setAppDependentFrequencyAndRecencySignals:](v5, "setAppDependentFrequencyAndRecencySignals:", v17);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appDependentEntityFrequencyAndRecencySignals"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals initWithDictionary:]([INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals alloc], "initWithDictionary:", v18);
      -[INFERENCESchemaINFERENCECommonAppDependentSignals setAppDependentEntityFrequencyAndRecencySignals:](v5, "setAppDependentEntityFrequencyAndRecencySignals:", v19);

    }
    v20 = v5;

  }
  return v5;
}

- (NSString)appBundleId
{
  return self->_appBundleId;
}

- (void)setAppBundleId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (BOOL)isFirstPartyBundle
{
  return self->_isFirstPartyBundle;
}

- (BOOL)isForegroundApp
{
  return self->_isForegroundApp;
}

- (BOOL)isResolvedApp
{
  return self->_isResolvedApp;
}

- (float)appScoreFromModel
{
  return self->_appScoreFromModel;
}

- (double)compoundActiveBundleScore
{
  return self->_compoundActiveBundleScore;
}

- (unsigned)totalTimeSpentByUserInAppPerDay
{
  return self->_totalTimeSpentByUserInAppPerDay;
}

- (unsigned)timeSpentByUserInAppToday
{
  return self->_timeSpentByUserInAppToday;
}

- (int)timeSinceAppLastLaunchedInSec
{
  return self->_timeSinceAppLastLaunchedInSec;
}

- (INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals)appDependentFrequencyAndRecencySignals
{
  return self->_appDependentFrequencyAndRecencySignals;
}

- (void)setAppDependentFrequencyAndRecencySignals:(id)a3
{
  objc_storeStrong((id *)&self->_appDependentFrequencyAndRecencySignals, a3);
}

- (INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals)appDependentEntityFrequencyAndRecencySignals
{
  return self->_appDependentEntityFrequencyAndRecencySignals;
}

- (void)setAppDependentEntityFrequencyAndRecencySignals:(id)a3
{
  objc_storeStrong((id *)&self->_appDependentEntityFrequencyAndRecencySignals, a3);
}

- (void)setHasAppBundleId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasAppDependentFrequencyAndRecencySignals:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void)setHasAppDependentEntityFrequencyAndRecencySignals:(BOOL)a3
{
  *((_BYTE *)&self->_has + 3) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appDependentEntityFrequencyAndRecencySignals, 0);
  objc_storeStrong((id *)&self->_appDependentFrequencyAndRecencySignals, 0);
  objc_storeStrong((id *)&self->_appBundleId, 0);
}

@end
