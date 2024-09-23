@implementation CAARSchemaCAARActionFeatureSet

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
  void *v18;
  void *v19;
  int v20;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)CAARSchemaCAARActionFeatureSet;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v22, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAARSchemaCAARActionFeatureSet actionCandidateId](self, "actionCandidateId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[CAARSchemaCAARActionFeatureSet deleteActionCandidateId](self, "deleteActionCandidateId");
  -[CAARSchemaCAARActionFeatureSet appHistoryFeatures](self, "appHistoryFeatures");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[CAARSchemaCAARActionFeatureSet deleteAppHistoryFeatures](self, "deleteAppHistoryFeatures");
  -[CAARSchemaCAARActionFeatureSet appLevelDisambiguationHistory](self, "appLevelDisambiguationHistory");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[CAARSchemaCAARActionFeatureSet deleteAppLevelDisambiguationHistory](self, "deleteAppLevelDisambiguationHistory");
  -[CAARSchemaCAARActionFeatureSet actionLevelDisambiguationHistory](self, "actionLevelDisambiguationHistory");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applySensitiveConditionsPolicy:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "suppressMessage");

  if (v17)
    -[CAARSchemaCAARActionFeatureSet deleteActionLevelDisambiguationHistory](self, "deleteActionLevelDisambiguationHistory");
  -[CAARSchemaCAARActionFeatureSet proactiveFeatures](self, "proactiveFeatures");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "applySensitiveConditionsPolicy:", v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "suppressMessage");

  if (v20)
    -[CAARSchemaCAARActionFeatureSet deleteProactiveFeatures](self, "deleteProactiveFeatures");

  return v5;
}

- (BOOL)hasActionCandidateId
{
  return self->_actionCandidateId != 0;
}

- (void)deleteActionCandidateId
{
  -[CAARSchemaCAARActionFeatureSet setActionCandidateId:](self, "setActionCandidateId:", 0);
}

- (void)setIsHighConfidence:(BOOL)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_isHighConfidence = a3;
}

- (BOOL)hasIsHighConfidence
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setHasIsHighConfidence:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (void)deleteIsHighConfidence
{
  -[CAARSchemaCAARActionFeatureSet setIsHighConfidence:](self, "setIsHighConfidence:", 0);
  *(_WORD *)&self->_has &= ~1u;
}

- (void)setIsAppInForeground:(BOOL)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_isAppInForeground = a3;
}

- (BOOL)hasIsAppInForeground
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setHasIsAppInForeground:(BOOL)a3
{
  __int16 v3;
  int v4;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  v4 = *(_WORD *)&self->_has & 0xFFFD | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)deleteIsAppInForeground
{
  $97FEBA335C550383B08A947438191CF5 has;
  unsigned int v4;

  -[CAARSchemaCAARActionFeatureSet setIsAppInForeground:](self, "setIsAppInForeground:", 0);
  has = self->_has;
  v4 = *(_DWORD *)&has & 0xFFFFFFFD | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&has & 0xFFFD;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)setAppNameMentioned:(BOOL)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_appNameMentioned = a3;
}

- (BOOL)hasAppNameMentioned
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setHasAppNameMentioned:(BOOL)a3
{
  __int16 v3;
  int v4;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  v4 = *(_WORD *)&self->_has & 0xFFFB | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)deleteAppNameMentioned
{
  $97FEBA335C550383B08A947438191CF5 has;
  unsigned int v4;

  -[CAARSchemaCAARActionFeatureSet setAppNameMentioned:](self, "setAppNameMentioned:", 0);
  has = self->_has;
  v4 = *(_DWORD *)&has & 0xFFFFFFFB | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&has & 0xFFFB;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)setIsTopRankedPlugin:(BOOL)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_isTopRankedPlugin = a3;
}

- (BOOL)hasIsTopRankedPlugin
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setHasIsTopRankedPlugin:(BOOL)a3
{
  __int16 v3;
  int v4;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  v4 = *(_WORD *)&self->_has & 0xFFF7 | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)deleteIsTopRankedPlugin
{
  $97FEBA335C550383B08A947438191CF5 has;
  unsigned int v4;

  -[CAARSchemaCAARActionFeatureSet setIsTopRankedPlugin:](self, "setIsTopRankedPlugin:", 0);
  has = self->_has;
  v4 = *(_DWORD *)&has & 0xFFFFFFF7 | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&has & 0xFFF7;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)setEntityTypeMentioned:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_entityTypeMentioned = a3;
}

- (BOOL)hasEntityTypeMentioned
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setHasEntityTypeMentioned:(BOOL)a3
{
  __int16 v3;
  int v4;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  v4 = *(_WORD *)&self->_has & 0xFFEF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)deleteEntityTypeMentioned
{
  $97FEBA335C550383B08A947438191CF5 has;
  unsigned int v4;

  -[CAARSchemaCAARActionFeatureSet setEntityTypeMentioned:](self, "setEntityTypeMentioned:", 0);
  has = self->_has;
  v4 = *(_DWORD *)&has & 0xFFFFFFEF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&has & 0xFFEF;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)setIsColdOpenAllowlist:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_isColdOpenAllowlist = a3;
}

- (BOOL)hasIsColdOpenAllowlist
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setHasIsColdOpenAllowlist:(BOOL)a3
{
  __int16 v3;
  int v4;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  v4 = *(_WORD *)&self->_has & 0xFFDF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)deleteIsColdOpenAllowlist
{
  $97FEBA335C550383B08A947438191CF5 has;
  unsigned int v4;

  -[CAARSchemaCAARActionFeatureSet setIsColdOpenAllowlist:](self, "setIsColdOpenAllowlist:", 0);
  has = self->_has;
  v4 = *(_DWORD *)&has & 0xFFFFFFDF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&has & 0xFFDF;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)setIsLinkActionOnScreen:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_isLinkActionOnScreen = a3;
}

- (BOOL)hasIsLinkActionOnScreen
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setHasIsLinkActionOnScreen:(BOOL)a3
{
  __int16 v3;
  int v4;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  v4 = *(_WORD *)&self->_has & 0xFFBF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)deleteIsLinkActionOnScreen
{
  $97FEBA335C550383B08A947438191CF5 has;
  unsigned int v4;

  -[CAARSchemaCAARActionFeatureSet setIsLinkActionOnScreen:](self, "setIsLinkActionOnScreen:", 0);
  has = self->_has;
  v4 = *(_DWORD *)&has & 0xFFFFFFBF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&has & 0xFFBF;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)setIsDefaultLinkAction:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_isDefaultLinkAction = a3;
}

- (BOOL)hasIsDefaultLinkAction
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setHasIsDefaultLinkAction:(BOOL)a3
{
  __int16 v3;
  int v4;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  v4 = *(_WORD *)&self->_has & 0xFF7F | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)deleteIsDefaultLinkAction
{
  $97FEBA335C550383B08A947438191CF5 has;
  unsigned int v4;

  -[CAARSchemaCAARActionFeatureSet setIsDefaultLinkAction:](self, "setIsDefaultLinkAction:", 0);
  has = self->_has;
  v4 = *(_DWORD *)&has & 0xFFFFFF7F | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&has & 0xFF7F;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)setIsVocabNameMatch:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_isVocabNameMatch = a3;
}

- (BOOL)hasIsVocabNameMatch
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setHasIsVocabNameMatch:(BOOL)a3
{
  __int16 v3;
  int v4;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  v4 = *(_WORD *)&self->_has & 0xFEFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)deleteIsVocabNameMatch
{
  $97FEBA335C550383B08A947438191CF5 has;
  unsigned int v4;

  -[CAARSchemaCAARActionFeatureSet setIsVocabNameMatch:](self, "setIsVocabNameMatch:", 0);
  has = self->_has;
  v4 = *(_DWORD *)&has & 0xFFFFFEFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&has & 0xFEFF;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)setIsLinkAction:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_isLinkAction = a3;
}

- (BOOL)hasIsLinkAction
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setHasIsLinkAction:(BOOL)a3
{
  __int16 v3;
  int v4;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  v4 = *(_WORD *)&self->_has & 0xFDFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)deleteIsLinkAction
{
  $97FEBA335C550383B08A947438191CF5 has;
  unsigned int v4;

  -[CAARSchemaCAARActionFeatureSet setIsLinkAction:](self, "setIsLinkAction:", 0);
  has = self->_has;
  v4 = *(_DWORD *)&has & 0xFFFFFDFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&has & 0xFDFF;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)setIsAutoshortcut:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_isAutoshortcut = a3;
}

- (BOOL)hasIsAutoshortcut
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setHasIsAutoshortcut:(BOOL)a3
{
  __int16 v3;
  int v4;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  v4 = *(_WORD *)&self->_has & 0xFBFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)deleteIsAutoshortcut
{
  $97FEBA335C550383B08A947438191CF5 has;
  unsigned int v4;

  -[CAARSchemaCAARActionFeatureSet setIsAutoshortcut:](self, "setIsAutoshortcut:", 0);
  has = self->_has;
  v4 = *(_DWORD *)&has & 0xFFFFFBFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&has & 0xFBFF;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)setIsAutoshortcutAppOnScreen:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_isAutoshortcutAppOnScreen = a3;
}

- (BOOL)hasIsAutoshortcutAppOnScreen
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setHasIsAutoshortcutAppOnScreen:(BOOL)a3
{
  __int16 v3;
  int v4;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  v4 = *(_WORD *)&self->_has & 0xF7FF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)deleteIsAutoshortcutAppOnScreen
{
  $97FEBA335C550383B08A947438191CF5 has;
  unsigned int v4;

  -[CAARSchemaCAARActionFeatureSet setIsAutoshortcutAppOnScreen:](self, "setIsAutoshortcutAppOnScreen:", 0);
  has = self->_has;
  v4 = *(_DWORD *)&has & 0xFFFFF7FF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&has & 0xF7FF;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)setEntitySaliencyMaxScore:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_entitySaliencyMaxScore = a3;
}

- (BOOL)hasEntitySaliencyMaxScore
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setHasEntitySaliencyMaxScore:(BOOL)a3
{
  __int16 v3;
  int v4;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  v4 = *(_WORD *)&self->_has & 0xEFFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)deleteEntitySaliencyMaxScore
{
  $97FEBA335C550383B08A947438191CF5 has;
  unsigned int v4;

  -[CAARSchemaCAARActionFeatureSet setEntitySaliencyMaxScore:](self, "setEntitySaliencyMaxScore:", 0);
  has = self->_has;
  v4 = *(_DWORD *)&has & 0xFFFFEFFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&has & 0xEFFF;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)setNumSalientEntities:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_numSalientEntities = a3;
}

- (BOOL)hasNumSalientEntities
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (void)setHasNumSalientEntities:(BOOL)a3
{
  __int16 v3;
  int v4;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  v4 = *(_WORD *)&self->_has & 0xDFFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xDFFF | v3;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)deleteNumSalientEntities
{
  $97FEBA335C550383B08A947438191CF5 has;
  unsigned int v4;

  -[CAARSchemaCAARActionFeatureSet setNumSalientEntities:](self, "setNumSalientEntities:", 0);
  has = self->_has;
  v4 = *(_DWORD *)&has & 0xFFFFDFFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&has & 0xDFFF;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)setNlParseProbability:(float)a3
{
  *(_WORD *)&self->_has |= 0x4000u;
  self->_nlParseProbability = a3;
}

- (BOOL)hasNlParseProbability
{
  return (*(_WORD *)&self->_has >> 14) & 1;
}

- (void)setHasNlParseProbability:(BOOL)a3
{
  __int16 v3;
  int v4;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  v4 = *(_WORD *)&self->_has & 0xBFFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xBFFF | v3;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)deleteNlParseProbability
{
  double v2;
  $97FEBA335C550383B08A947438191CF5 has;
  unsigned int v5;

  LODWORD(v2) = 0;
  -[CAARSchemaCAARActionFeatureSet setNlParseProbability:](self, "setNlParseProbability:", v2);
  has = self->_has;
  v5 = *(_DWORD *)&has & 0xFFFFBFFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&has & 0xBFFF;
  *((_BYTE *)&self->_has + 2) = BYTE2(v5);
}

- (void)setIsTopRankedParse:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x8000u;
  self->_isTopRankedParse = a3;
}

- (BOOL)hasIsTopRankedParse
{
  return *(_WORD *)&self->_has >> 15;
}

- (void)setHasIsTopRankedParse:(BOOL)a3
{
  __int16 v3;
  int v4;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  v4 = *(_WORD *)&self->_has & 0x7FFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0x7FFF | v3;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)deleteIsTopRankedParse
{
  $97FEBA335C550383B08A947438191CF5 has;
  unsigned int v4;

  -[CAARSchemaCAARActionFeatureSet setIsTopRankedParse:](self, "setIsTopRankedParse:", 0);
  has = self->_has;
  v4 = *(_DWORD *)&has & 0xFFFF7FFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&has & 0x7FFF;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)setIsRepeatedFlowHandlerId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = (*(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16) | 0x10000u) >> 16;
  self->_isRepeatedFlowHandlerId = a3;
}

- (BOOL)hasIsRepeatedFlowHandlerId
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setHasIsRepeatedFlowHandlerId:(BOOL)a3
{
  int v3;
  unsigned int v4;

  if (a3)
    v3 = 0x10000;
  else
    v3 = 0;
  v4 = (*(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16)) & 0xFFFEFFFF;
  *(_WORD *)&self->_has = self->_has;
  *((_BYTE *)&self->_has + 2) = (v4 | v3) >> 16;
}

- (void)deleteIsRepeatedFlowHandlerId
{
  $97FEBA335C550383B08A947438191CF5 has;
  unsigned int v4;

  -[CAARSchemaCAARActionFeatureSet setIsRepeatedFlowHandlerId:](self, "setIsRepeatedFlowHandlerId:", 0);
  has = self->_has;
  v4 = (*(_DWORD *)&has | (*((unsigned __int8 *)&self->_has + 2) << 16)) & 0xFFFEFFFF;
  *(_WORD *)&self->_has = has;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (BOOL)hasAppHistoryFeatures
{
  return self->_appHistoryFeatures != 0;
}

- (void)deleteAppHistoryFeatures
{
  -[CAARSchemaCAARActionFeatureSet setAppHistoryFeatures:](self, "setAppHistoryFeatures:", 0);
}

- (BOOL)hasAppLevelDisambiguationHistory
{
  return self->_appLevelDisambiguationHistory != 0;
}

- (void)deleteAppLevelDisambiguationHistory
{
  -[CAARSchemaCAARActionFeatureSet setAppLevelDisambiguationHistory:](self, "setAppLevelDisambiguationHistory:", 0);
}

- (BOOL)hasActionLevelDisambiguationHistory
{
  return self->_actionLevelDisambiguationHistory != 0;
}

- (void)deleteActionLevelDisambiguationHistory
{
  -[CAARSchemaCAARActionFeatureSet setActionLevelDisambiguationHistory:](self, "setActionLevelDisambiguationHistory:", 0);
}

- (BOOL)hasProactiveFeatures
{
  return self->_proactiveFeatures != 0;
}

- (void)deleteProactiveFeatures
{
  -[CAARSchemaCAARActionFeatureSet setProactiveFeatures:](self, "setProactiveFeatures:", 0);
}

- (void)setIsAutoShortcutEnabled:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = (*(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16) | 0x20000u) >> 16;
  self->_isAutoShortcutEnabled = a3;
}

- (BOOL)hasIsAutoShortcutEnabled
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setHasIsAutoShortcutEnabled:(BOOL)a3
{
  int v3;
  unsigned int v4;

  if (a3)
    v3 = 0x20000;
  else
    v3 = 0;
  v4 = (*(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16)) & 0xFFFDFFFF;
  *(_WORD *)&self->_has = self->_has;
  *((_BYTE *)&self->_has + 2) = (v4 | v3) >> 16;
}

- (void)deleteIsAutoShortcutEnabled
{
  $97FEBA335C550383B08A947438191CF5 has;
  unsigned int v4;

  -[CAARSchemaCAARActionFeatureSet setIsAutoShortcutEnabled:](self, "setIsAutoShortcutEnabled:", 0);
  has = self->_has;
  v4 = (*(_DWORD *)&has | (*((unsigned __int8 *)&self->_has + 2) << 16)) & 0xFFFDFFFF;
  *(_WORD *)&self->_has = has;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)setIsAmbiguousFirstRunPreviouslyShown:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = (*(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16) | 0x40000u) >> 16;
  self->_isAmbiguousFirstRunPreviouslyShown = a3;
}

- (BOOL)hasIsAmbiguousFirstRunPreviouslyShown
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setHasIsAmbiguousFirstRunPreviouslyShown:(BOOL)a3
{
  int v3;
  unsigned int v4;

  if (a3)
    v3 = 0x40000;
  else
    v3 = 0;
  v4 = (*(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16)) & 0xFFFBFFFF;
  *(_WORD *)&self->_has = self->_has;
  *((_BYTE *)&self->_has + 2) = (v4 | v3) >> 16;
}

- (void)deleteIsAmbiguousFirstRunPreviouslyShown
{
  $97FEBA335C550383B08A947438191CF5 has;
  unsigned int v4;

  -[CAARSchemaCAARActionFeatureSet setIsAmbiguousFirstRunPreviouslyShown:](self, "setIsAmbiguousFirstRunPreviouslyShown:", 0);
  has = self->_has;
  v4 = (*(_DWORD *)&has | (*((unsigned __int8 *)&self->_has + 2) << 16)) & 0xFFFBFFFF;
  *(_WORD *)&self->_has = has;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (BOOL)hasActionIdentifier
{
  return self->_actionIdentifier != 0;
}

- (void)deleteActionIdentifier
{
  -[CAARSchemaCAARActionFeatureSet setActionIdentifier:](self, "setActionIdentifier:", 0);
}

- (void)setIsInterpretableAsUniversalCommand:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = (*(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16) | 0x80000u) >> 16;
  self->_isInterpretableAsUniversalCommand = a3;
}

- (BOOL)hasIsInterpretableAsUniversalCommand
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setHasIsInterpretableAsUniversalCommand:(BOOL)a3
{
  int v3;
  unsigned int v4;

  if (a3)
    v3 = 0x80000;
  else
    v3 = 0;
  v4 = (*(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16)) & 0xFFF7FFFF;
  *(_WORD *)&self->_has = self->_has;
  *((_BYTE *)&self->_has + 2) = (v4 | v3) >> 16;
}

- (void)deleteIsInterpretableAsUniversalCommand
{
  $97FEBA335C550383B08A947438191CF5 has;
  unsigned int v4;

  -[CAARSchemaCAARActionFeatureSet setIsInterpretableAsUniversalCommand:](self, "setIsInterpretableAsUniversalCommand:", 0);
  has = self->_has;
  v4 = (*(_DWORD *)&has | (*((unsigned __int8 *)&self->_has + 2) << 16)) & 0xFFF7FFFF;
  *(_WORD *)&self->_has = has;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)setDomainProtectionLevel:(int)a3
{
  *((_BYTE *)&self->_has + 2) = (*(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16) | 0x100000u) >> 16;
  self->_domainProtectionLevel = a3;
}

- (BOOL)hasDomainProtectionLevel
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setHasDomainProtectionLevel:(BOOL)a3
{
  int v3;
  unsigned int v4;

  if (a3)
    v3 = 0x100000;
  else
    v3 = 0;
  v4 = (*(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16)) & 0xFFEFFFFF;
  *(_WORD *)&self->_has = self->_has;
  *((_BYTE *)&self->_has + 2) = (v4 | v3) >> 16;
}

- (void)deleteDomainProtectionLevel
{
  $97FEBA335C550383B08A947438191CF5 has;
  unsigned int v4;

  -[CAARSchemaCAARActionFeatureSet setDomainProtectionLevel:](self, "setDomainProtectionLevel:", 0);
  has = self->_has;
  v4 = (*(_DWORD *)&has | (*((unsigned __int8 *)&self->_has + 2) << 16)) & 0xFFEFFFFF;
  *(_WORD *)&self->_has = has;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (BOOL)readFrom:(id)a3
{
  double v3;

  return CAARSchemaCAARActionFeatureSetReadFrom(self, (uint64_t)a3, v3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  $97FEBA335C550383B08A947438191CF5 has;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  int v18;
  void *v19;
  $97FEBA335C550383B08A947438191CF5 v20;
  id v21;

  v21 = a3;
  -[CAARSchemaCAARActionFeatureSet actionCandidateId](self, "actionCandidateId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CAARSchemaCAARActionFeatureSet actionCandidateId](self, "actionCandidateId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  has = self->_has;
  v7 = *(_DWORD *)&has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_BYTE *)&has & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    v20 = self->_has;
    v7 = *(_DWORD *)&v20 | (*((unsigned __int8 *)&self->_has + 2) << 16);
    if ((*(_BYTE *)&v20 & 2) == 0)
    {
LABEL_5:
      if ((v7 & 4) == 0)
        goto LABEL_6;
      goto LABEL_42;
    }
  }
  else if ((*(_BYTE *)&has & 2) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteBOOLField();
  v7 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 4) == 0)
  {
LABEL_6:
    if ((v7 & 8) == 0)
      goto LABEL_7;
    goto LABEL_43;
  }
LABEL_42:
  PBDataWriterWriteBOOLField();
  v7 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 8) == 0)
  {
LABEL_7:
    if ((v7 & 0x10) == 0)
      goto LABEL_8;
    goto LABEL_44;
  }
LABEL_43:
  PBDataWriterWriteBOOLField();
  v7 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x10) == 0)
  {
LABEL_8:
    if ((v7 & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_45;
  }
LABEL_44:
  PBDataWriterWriteBOOLField();
  v7 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x20) == 0)
  {
LABEL_9:
    if ((v7 & 0x40) == 0)
      goto LABEL_10;
    goto LABEL_46;
  }
LABEL_45:
  PBDataWriterWriteBOOLField();
  v7 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x40) == 0)
  {
LABEL_10:
    if ((v7 & 0x80) == 0)
      goto LABEL_11;
    goto LABEL_47;
  }
LABEL_46:
  PBDataWriterWriteBOOLField();
  v7 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x80) == 0)
  {
LABEL_11:
    if ((v7 & 0x100) == 0)
      goto LABEL_12;
    goto LABEL_48;
  }
LABEL_47:
  PBDataWriterWriteBOOLField();
  v7 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
LABEL_12:
    if ((v7 & 0x200) == 0)
      goto LABEL_13;
    goto LABEL_49;
  }
LABEL_48:
  PBDataWriterWriteBOOLField();
  v7 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
LABEL_13:
    if ((v7 & 0x400) == 0)
      goto LABEL_14;
    goto LABEL_50;
  }
LABEL_49:
  PBDataWriterWriteBOOLField();
  v7 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
LABEL_14:
    if ((v7 & 0x800) == 0)
      goto LABEL_15;
    goto LABEL_51;
  }
LABEL_50:
  PBDataWriterWriteBOOLField();
  v7 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
LABEL_15:
    if ((v7 & 0x1000) == 0)
      goto LABEL_16;
    goto LABEL_52;
  }
LABEL_51:
  PBDataWriterWriteBOOLField();
  v7 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x1000) == 0)
  {
LABEL_16:
    if ((v7 & 0x2000) == 0)
      goto LABEL_17;
    goto LABEL_53;
  }
LABEL_52:
  PBDataWriterWriteUint32Field();
  v7 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x2000) == 0)
  {
LABEL_17:
    if ((v7 & 0x4000) == 0)
      goto LABEL_18;
    goto LABEL_54;
  }
LABEL_53:
  PBDataWriterWriteUint32Field();
  v7 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x4000) == 0)
  {
LABEL_18:
    if ((v7 & 0x8000) == 0)
      goto LABEL_19;
    goto LABEL_55;
  }
LABEL_54:
  PBDataWriterWriteFloatField();
  v7 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x8000) == 0)
  {
LABEL_19:
    if ((v7 & 0x10000) == 0)
      goto LABEL_21;
    goto LABEL_20;
  }
LABEL_55:
  PBDataWriterWriteBOOLField();
  if (((*(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16)) & 0x10000) != 0)
LABEL_20:
    PBDataWriterWriteBOOLField();
LABEL_21:
  -[CAARSchemaCAARActionFeatureSet appHistoryFeatures](self, "appHistoryFeatures");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[CAARSchemaCAARActionFeatureSet appHistoryFeatures](self, "appHistoryFeatures");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[CAARSchemaCAARActionFeatureSet appLevelDisambiguationHistory](self, "appLevelDisambiguationHistory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[CAARSchemaCAARActionFeatureSet appLevelDisambiguationHistory](self, "appLevelDisambiguationHistory");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[CAARSchemaCAARActionFeatureSet actionLevelDisambiguationHistory](self, "actionLevelDisambiguationHistory");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[CAARSchemaCAARActionFeatureSet actionLevelDisambiguationHistory](self, "actionLevelDisambiguationHistory");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[CAARSchemaCAARActionFeatureSet proactiveFeatures](self, "proactiveFeatures");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[CAARSchemaCAARActionFeatureSet proactiveFeatures](self, "proactiveFeatures");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v16 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((v16 & 0x20000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v16 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  }
  if ((v16 & 0x40000) != 0)
    PBDataWriterWriteBOOLField();
  -[CAARSchemaCAARActionFeatureSet actionIdentifier](self, "actionIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
    PBDataWriterWriteStringField();
  v18 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  v19 = v21;
  if ((v18 & 0x80000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v19 = v21;
    v18 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  }
  if ((v18 & 0x100000) != 0)
  {
    PBDataWriterWriteInt32Field();
    v19 = v21;
  }

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int16 *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  unsigned int v12;
  int v13;
  unsigned int v14;
  int isHighConfidence;
  int v16;
  int isAppInForeground;
  int v18;
  int appNameMentioned;
  int v20;
  int isTopRankedPlugin;
  int v22;
  int entityTypeMentioned;
  int v24;
  int isColdOpenAllowlist;
  int v26;
  int isLinkActionOnScreen;
  int v28;
  int isDefaultLinkAction;
  int v30;
  int isVocabNameMatch;
  int v32;
  int isLinkAction;
  int v34;
  int isAutoshortcut;
  int v36;
  int isAutoshortcutAppOnScreen;
  int v38;
  unsigned int entitySaliencyMaxScore;
  int v40;
  unsigned int numSalientEntities;
  int v42;
  float nlParseProbability;
  float v44;
  int v45;
  int isTopRankedParse;
  int v47;
  int isRepeatedFlowHandlerId;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  int v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  int v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  int v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  int v68;
  unsigned int v69;
  int v70;
  unsigned int v71;
  unsigned int v72;
  unsigned int v73;
  int isAutoShortcutEnabled;
  int v75;
  int isAmbiguousFirstRunPreviouslyShown;
  uint64_t v77;
  void *v78;
  void *v79;
  void *v80;
  int v81;
  BOOL v82;
  unsigned int v84;
  int v85;
  unsigned int v86;
  unsigned int v87;
  unsigned int v88;
  int isInterpretableAsUniversalCommand;
  int v90;
  int domainProtectionLevel;

  v4 = (unsigned __int16 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_107;
  -[CAARSchemaCAARActionFeatureSet actionCandidateId](self, "actionCandidateId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actionCandidateId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_106;
  -[CAARSchemaCAARActionFeatureSet actionCandidateId](self, "actionCandidateId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[CAARSchemaCAARActionFeatureSet actionCandidateId](self, "actionCandidateId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "actionCandidateId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_107;
  }
  else
  {

  }
  v12 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  v13 = *(_WORD *)&self->_has & 1;
  v14 = v4[52] | (*((unsigned __int8 *)v4 + 106) << 16);
  if (v13 != (v4[52] & 1))
    goto LABEL_107;
  if (v13)
  {
    isHighConfidence = self->_isHighConfidence;
    if (isHighConfidence != objc_msgSend(v4, "isHighConfidence"))
      goto LABEL_107;
    v12 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    v14 = v4[52] | (*((unsigned __int8 *)v4 + 106) << 16);
  }
  v16 = (v12 >> 1) & 1;
  if (v16 != ((v14 >> 1) & 1))
    goto LABEL_107;
  if (v16)
  {
    isAppInForeground = self->_isAppInForeground;
    if (isAppInForeground != objc_msgSend(v4, "isAppInForeground"))
      goto LABEL_107;
    v12 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    v14 = v4[52] | (*((unsigned __int8 *)v4 + 106) << 16);
  }
  v18 = (v12 >> 2) & 1;
  if (v18 != ((v14 >> 2) & 1))
    goto LABEL_107;
  if (v18)
  {
    appNameMentioned = self->_appNameMentioned;
    if (appNameMentioned != objc_msgSend(v4, "appNameMentioned"))
      goto LABEL_107;
    v12 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    v14 = v4[52] | (*((unsigned __int8 *)v4 + 106) << 16);
  }
  v20 = (v12 >> 3) & 1;
  if (v20 != ((v14 >> 3) & 1))
    goto LABEL_107;
  if (v20)
  {
    isTopRankedPlugin = self->_isTopRankedPlugin;
    if (isTopRankedPlugin != objc_msgSend(v4, "isTopRankedPlugin"))
      goto LABEL_107;
    v12 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    v14 = v4[52] | (*((unsigned __int8 *)v4 + 106) << 16);
  }
  v22 = (v12 >> 4) & 1;
  if (v22 != ((v14 >> 4) & 1))
    goto LABEL_107;
  if (v22)
  {
    entityTypeMentioned = self->_entityTypeMentioned;
    if (entityTypeMentioned != objc_msgSend(v4, "entityTypeMentioned"))
      goto LABEL_107;
    v12 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    v14 = v4[52] | (*((unsigned __int8 *)v4 + 106) << 16);
  }
  v24 = (v12 >> 5) & 1;
  if (v24 != ((v14 >> 5) & 1))
    goto LABEL_107;
  if (v24)
  {
    isColdOpenAllowlist = self->_isColdOpenAllowlist;
    if (isColdOpenAllowlist != objc_msgSend(v4, "isColdOpenAllowlist"))
      goto LABEL_107;
    v12 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    v14 = v4[52] | (*((unsigned __int8 *)v4 + 106) << 16);
  }
  v26 = (v12 >> 6) & 1;
  if (v26 != ((v14 >> 6) & 1))
    goto LABEL_107;
  if (v26)
  {
    isLinkActionOnScreen = self->_isLinkActionOnScreen;
    if (isLinkActionOnScreen != objc_msgSend(v4, "isLinkActionOnScreen"))
      goto LABEL_107;
    v12 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    v14 = v4[52] | (*((unsigned __int8 *)v4 + 106) << 16);
  }
  v28 = (v12 >> 7) & 1;
  if (v28 != ((v14 >> 7) & 1))
    goto LABEL_107;
  if (v28)
  {
    isDefaultLinkAction = self->_isDefaultLinkAction;
    if (isDefaultLinkAction != objc_msgSend(v4, "isDefaultLinkAction"))
      goto LABEL_107;
    v12 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    v14 = v4[52] | (*((unsigned __int8 *)v4 + 106) << 16);
  }
  v30 = (v12 >> 8) & 1;
  if (v30 != ((v14 >> 8) & 1))
    goto LABEL_107;
  if (v30)
  {
    isVocabNameMatch = self->_isVocabNameMatch;
    if (isVocabNameMatch != objc_msgSend(v4, "isVocabNameMatch"))
      goto LABEL_107;
    v12 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    v14 = v4[52] | (*((unsigned __int8 *)v4 + 106) << 16);
  }
  v32 = (v12 >> 9) & 1;
  if (v32 != ((v14 >> 9) & 1))
    goto LABEL_107;
  if (v32)
  {
    isLinkAction = self->_isLinkAction;
    if (isLinkAction != objc_msgSend(v4, "isLinkAction"))
      goto LABEL_107;
    v12 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    v14 = v4[52] | (*((unsigned __int8 *)v4 + 106) << 16);
  }
  v34 = (v12 >> 10) & 1;
  if (v34 != ((v14 >> 10) & 1))
    goto LABEL_107;
  if (v34)
  {
    isAutoshortcut = self->_isAutoshortcut;
    if (isAutoshortcut != objc_msgSend(v4, "isAutoshortcut"))
      goto LABEL_107;
    v12 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    v14 = v4[52] | (*((unsigned __int8 *)v4 + 106) << 16);
  }
  v36 = (v12 >> 11) & 1;
  if (v36 != ((v14 >> 11) & 1))
    goto LABEL_107;
  if (v36)
  {
    isAutoshortcutAppOnScreen = self->_isAutoshortcutAppOnScreen;
    if (isAutoshortcutAppOnScreen != objc_msgSend(v4, "isAutoshortcutAppOnScreen"))
      goto LABEL_107;
    v12 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    v14 = v4[52] | (*((unsigned __int8 *)v4 + 106) << 16);
  }
  v38 = (v12 >> 12) & 1;
  if (v38 != ((v14 >> 12) & 1))
    goto LABEL_107;
  if (v38)
  {
    entitySaliencyMaxScore = self->_entitySaliencyMaxScore;
    if (entitySaliencyMaxScore != objc_msgSend(v4, "entitySaliencyMaxScore"))
      goto LABEL_107;
    v12 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    v14 = v4[52] | (*((unsigned __int8 *)v4 + 106) << 16);
  }
  v40 = (v12 >> 13) & 1;
  if (v40 != ((v14 >> 13) & 1))
    goto LABEL_107;
  if (v40)
  {
    numSalientEntities = self->_numSalientEntities;
    if (numSalientEntities != objc_msgSend(v4, "numSalientEntities"))
      goto LABEL_107;
    v12 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    v14 = v4[52] | (*((unsigned __int8 *)v4 + 106) << 16);
  }
  v42 = (v12 >> 14) & 1;
  if (v42 != ((v14 >> 14) & 1))
    goto LABEL_107;
  if (v42)
  {
    nlParseProbability = self->_nlParseProbability;
    objc_msgSend(v4, "nlParseProbability");
    if (nlParseProbability != v44)
      goto LABEL_107;
    v12 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    v14 = v4[52] | (*((unsigned __int8 *)v4 + 106) << 16);
  }
  v45 = (v12 >> 15) & 1;
  if (v45 != ((v14 >> 15) & 1))
    goto LABEL_107;
  if (v45)
  {
    isTopRankedParse = self->_isTopRankedParse;
    if (isTopRankedParse != objc_msgSend(v4, "isTopRankedParse"))
      goto LABEL_107;
    v12 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    v14 = v4[52] | (*((unsigned __int8 *)v4 + 106) << 16);
  }
  v47 = HIWORD(v12) & 1;
  if (v47 != (HIWORD(v14) & 1))
    goto LABEL_107;
  if (v47)
  {
    isRepeatedFlowHandlerId = self->_isRepeatedFlowHandlerId;
    if (isRepeatedFlowHandlerId != objc_msgSend(v4, "isRepeatedFlowHandlerId"))
      goto LABEL_107;
  }
  -[CAARSchemaCAARActionFeatureSet appHistoryFeatures](self, "appHistoryFeatures");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appHistoryFeatures");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_106;
  -[CAARSchemaCAARActionFeatureSet appHistoryFeatures](self, "appHistoryFeatures");
  v49 = objc_claimAutoreleasedReturnValue();
  if (v49)
  {
    v50 = (void *)v49;
    -[CAARSchemaCAARActionFeatureSet appHistoryFeatures](self, "appHistoryFeatures");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appHistoryFeatures");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = objc_msgSend(v51, "isEqual:", v52);

    if (!v53)
      goto LABEL_107;
  }
  else
  {

  }
  -[CAARSchemaCAARActionFeatureSet appLevelDisambiguationHistory](self, "appLevelDisambiguationHistory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appLevelDisambiguationHistory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_106;
  -[CAARSchemaCAARActionFeatureSet appLevelDisambiguationHistory](self, "appLevelDisambiguationHistory");
  v54 = objc_claimAutoreleasedReturnValue();
  if (v54)
  {
    v55 = (void *)v54;
    -[CAARSchemaCAARActionFeatureSet appLevelDisambiguationHistory](self, "appLevelDisambiguationHistory");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appLevelDisambiguationHistory");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = objc_msgSend(v56, "isEqual:", v57);

    if (!v58)
      goto LABEL_107;
  }
  else
  {

  }
  -[CAARSchemaCAARActionFeatureSet actionLevelDisambiguationHistory](self, "actionLevelDisambiguationHistory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actionLevelDisambiguationHistory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_106;
  -[CAARSchemaCAARActionFeatureSet actionLevelDisambiguationHistory](self, "actionLevelDisambiguationHistory");
  v59 = objc_claimAutoreleasedReturnValue();
  if (v59)
  {
    v60 = (void *)v59;
    -[CAARSchemaCAARActionFeatureSet actionLevelDisambiguationHistory](self, "actionLevelDisambiguationHistory");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "actionLevelDisambiguationHistory");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = objc_msgSend(v61, "isEqual:", v62);

    if (!v63)
      goto LABEL_107;
  }
  else
  {

  }
  -[CAARSchemaCAARActionFeatureSet proactiveFeatures](self, "proactiveFeatures");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "proactiveFeatures");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_106;
  -[CAARSchemaCAARActionFeatureSet proactiveFeatures](self, "proactiveFeatures");
  v64 = objc_claimAutoreleasedReturnValue();
  if (v64)
  {
    v65 = (void *)v64;
    -[CAARSchemaCAARActionFeatureSet proactiveFeatures](self, "proactiveFeatures");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "proactiveFeatures");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = objc_msgSend(v66, "isEqual:", v67);

    if (!v68)
      goto LABEL_107;
  }
  else
  {

  }
  v69 = *((unsigned __int8 *)&self->_has + 2);
  v70 = (v69 >> 1) & 1;
  v71 = *((unsigned __int8 *)v4 + 106);
  if (v70 != ((v71 >> 1) & 1))
    goto LABEL_107;
  if (v70)
  {
    isAutoShortcutEnabled = self->_isAutoShortcutEnabled;
    if (isAutoShortcutEnabled != objc_msgSend(v4, "isAutoShortcutEnabled"))
      goto LABEL_107;
    v72 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    v73 = v4[52] | (*((unsigned __int8 *)v4 + 106) << 16);
  }
  else
  {
    v72 = *(_WORD *)&self->_has | (v69 << 16);
    v73 = v4[52] | (v71 << 16);
  }
  v75 = (v72 >> 18) & 1;
  if (v75 != ((v73 >> 18) & 1))
    goto LABEL_107;
  if (v75)
  {
    isAmbiguousFirstRunPreviouslyShown = self->_isAmbiguousFirstRunPreviouslyShown;
    if (isAmbiguousFirstRunPreviouslyShown != objc_msgSend(v4, "isAmbiguousFirstRunPreviouslyShown"))
      goto LABEL_107;
  }
  -[CAARSchemaCAARActionFeatureSet actionIdentifier](self, "actionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_106:

    goto LABEL_107;
  }
  -[CAARSchemaCAARActionFeatureSet actionIdentifier](self, "actionIdentifier");
  v77 = objc_claimAutoreleasedReturnValue();
  if (v77)
  {
    v78 = (void *)v77;
    -[CAARSchemaCAARActionFeatureSet actionIdentifier](self, "actionIdentifier");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "actionIdentifier");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = objc_msgSend(v79, "isEqual:", v80);

    if (!v81)
      goto LABEL_107;
  }
  else
  {

  }
  v84 = *((unsigned __int8 *)&self->_has + 2);
  v85 = (v84 >> 3) & 1;
  v86 = *((unsigned __int8 *)v4 + 106);
  if (v85 == ((v86 >> 3) & 1))
  {
    if (v85)
    {
      isInterpretableAsUniversalCommand = self->_isInterpretableAsUniversalCommand;
      if (isInterpretableAsUniversalCommand != objc_msgSend(v4, "isInterpretableAsUniversalCommand"))
        goto LABEL_107;
      v87 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
      v88 = v4[52] | (*((unsigned __int8 *)v4 + 106) << 16);
    }
    else
    {
      v87 = *(_WORD *)&self->_has | (v84 << 16);
      v88 = v4[52] | (v86 << 16);
    }
    v90 = (v87 >> 20) & 1;
    if (v90 == ((v88 >> 20) & 1))
    {
      if (!v90
        || (domainProtectionLevel = self->_domainProtectionLevel,
            domainProtectionLevel == objc_msgSend(v4, "domainProtectionLevel")))
      {
        v82 = 1;
        goto LABEL_108;
      }
    }
  }
LABEL_107:
  v82 = 0;
LABEL_108:

  return v82;
}

- (unint64_t)hash
{
  $97FEBA335C550383B08A947438191CF5 has;
  int v4;
  float nlParseProbability;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  NSUInteger v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;

  v39 = -[SISchemaUUID hash](self->_actionCandidateId, "hash");
  has = self->_has;
  v4 = *(_DWORD *)&has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_BYTE *)&has & 1) != 0)
  {
    v38 = 2654435761 * self->_isHighConfidence;
    if ((*(_BYTE *)&has & 2) != 0)
    {
LABEL_3:
      v37 = 2654435761 * self->_isAppInForeground;
      if ((*(_BYTE *)&has & 4) != 0)
        goto LABEL_4;
      goto LABEL_22;
    }
  }
  else
  {
    v38 = 0;
    if ((*(_BYTE *)&has & 2) != 0)
      goto LABEL_3;
  }
  v37 = 0;
  if ((*(_BYTE *)&has & 4) != 0)
  {
LABEL_4:
    v36 = 2654435761 * self->_appNameMentioned;
    if ((*(_BYTE *)&has & 8) != 0)
      goto LABEL_5;
    goto LABEL_23;
  }
LABEL_22:
  v36 = 0;
  if ((*(_BYTE *)&has & 8) != 0)
  {
LABEL_5:
    v35 = 2654435761 * self->_isTopRankedPlugin;
    if ((*(_BYTE *)&has & 0x10) != 0)
      goto LABEL_6;
    goto LABEL_24;
  }
LABEL_23:
  v35 = 0;
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
LABEL_6:
    v34 = 2654435761 * self->_entityTypeMentioned;
    if ((*(_BYTE *)&has & 0x20) != 0)
      goto LABEL_7;
    goto LABEL_25;
  }
LABEL_24:
  v34 = 0;
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
LABEL_7:
    v33 = 2654435761 * self->_isColdOpenAllowlist;
    if ((*(_BYTE *)&has & 0x40) != 0)
      goto LABEL_8;
    goto LABEL_26;
  }
LABEL_25:
  v33 = 0;
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
LABEL_8:
    v32 = 2654435761 * self->_isLinkActionOnScreen;
    if ((*(_BYTE *)&has & 0x80) != 0)
      goto LABEL_9;
    goto LABEL_27;
  }
LABEL_26:
  v32 = 0;
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
LABEL_9:
    v31 = 2654435761 * self->_isDefaultLinkAction;
    if ((*(_WORD *)&has & 0x100) != 0)
      goto LABEL_10;
    goto LABEL_28;
  }
LABEL_27:
  v31 = 0;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
LABEL_10:
    v30 = 2654435761 * self->_isVocabNameMatch;
    if ((*(_WORD *)&has & 0x200) != 0)
      goto LABEL_11;
    goto LABEL_29;
  }
LABEL_28:
  v30 = 0;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_11:
    v29 = 2654435761 * self->_isLinkAction;
    if ((*(_WORD *)&has & 0x400) != 0)
      goto LABEL_12;
    goto LABEL_30;
  }
LABEL_29:
  v29 = 0;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_12:
    v28 = 2654435761 * self->_isAutoshortcut;
    if ((*(_WORD *)&has & 0x800) != 0)
      goto LABEL_13;
    goto LABEL_31;
  }
LABEL_30:
  v28 = 0;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
LABEL_13:
    v27 = 2654435761 * self->_isAutoshortcutAppOnScreen;
    if ((*(_WORD *)&has & 0x1000) != 0)
      goto LABEL_14;
    goto LABEL_32;
  }
LABEL_31:
  v27 = 0;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
LABEL_14:
    v26 = 2654435761 * self->_entitySaliencyMaxScore;
    if ((*(_WORD *)&has & 0x2000) != 0)
      goto LABEL_15;
LABEL_33:
    v25 = 0;
    if ((*(_WORD *)&has & 0x4000) != 0)
      goto LABEL_16;
LABEL_34:
    v9 = 0;
    goto LABEL_37;
  }
LABEL_32:
  v26 = 0;
  if ((*(_WORD *)&has & 0x2000) == 0)
    goto LABEL_33;
LABEL_15:
  v25 = 2654435761 * self->_numSalientEntities;
  if ((*(_WORD *)&has & 0x4000) == 0)
    goto LABEL_34;
LABEL_16:
  nlParseProbability = self->_nlParseProbability;
  v6 = nlParseProbability;
  if (nlParseProbability < 0.0)
    v6 = -nlParseProbability;
  v7 = floor(v6 + 0.5);
  v8 = (v6 - v7) * 1.84467441e19;
  v9 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
  if (v8 >= 0.0)
  {
    if (v8 > 0.0)
      v9 += (unint64_t)v8;
  }
  else
  {
    v9 -= (unint64_t)fabs(v8);
  }
LABEL_37:
  if ((v4 & 0x8000) != 0)
  {
    v24 = 2654435761 * self->_isTopRankedParse;
    if ((v4 & 0x10000) != 0)
      goto LABEL_39;
  }
  else
  {
    v24 = 0;
    if ((v4 & 0x10000) != 0)
    {
LABEL_39:
      v10 = -[CAARSchemaCAARAppHistoryFeatures hash](self->_appHistoryFeatures, "hash", 2654435761 * self->_isRepeatedFlowHandlerId);
      goto LABEL_42;
    }
  }
  v10 = -[CAARSchemaCAARAppHistoryFeatures hash](self->_appHistoryFeatures, "hash", 0);
LABEL_42:
  v11 = v10;
  v12 = -[CAARSchemaCAARAppLevelDisambiguationHistory hash](self->_appLevelDisambiguationHistory, "hash");
  v13 = -[CAARSchemaCAARActionLevelDisambiguationHistory hash](self->_actionLevelDisambiguationHistory, "hash");
  v14 = -[CAARSchemaCAARProactiveFeatures hash](self->_proactiveFeatures, "hash");
  v15 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((v15 & 0x20000) != 0)
  {
    v16 = 2654435761 * self->_isAutoShortcutEnabled;
    if ((v15 & 0x40000) != 0)
      goto LABEL_44;
  }
  else
  {
    v16 = 0;
    if ((v15 & 0x40000) != 0)
    {
LABEL_44:
      v17 = 2654435761 * self->_isAmbiguousFirstRunPreviouslyShown;
      goto LABEL_47;
    }
  }
  v17 = 0;
LABEL_47:
  v18 = -[NSString hash](self->_actionIdentifier, "hash");
  v19 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((v19 & 0x80000) != 0)
  {
    v20 = 2654435761 * self->_isInterpretableAsUniversalCommand;
    if ((v19 & 0x100000) != 0)
      goto LABEL_49;
LABEL_51:
    v21 = 0;
    return v38 ^ v39 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v9 ^ v24 ^ v23 ^ v11 ^ v12 ^ v13 ^ v14 ^ v16 ^ v17 ^ v18 ^ v20 ^ v21;
  }
  v20 = 0;
  if ((v19 & 0x100000) == 0)
    goto LABEL_51;
LABEL_49:
  v21 = 2654435761 * self->_domainProtectionLevel;
  return v38 ^ v39 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v9 ^ v24 ^ v23 ^ v11 ^ v12 ^ v13 ^ v14 ^ v16 ^ v17 ^ v18 ^ v20 ^ v21;
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
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  $97FEBA335C550383B08A947438191CF5 has;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unsigned int v24;
  const __CFString *v25;
  void *v26;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_actionCandidateId)
  {
    -[CAARSchemaCAARActionFeatureSet actionCandidateId](self, "actionCandidateId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("actionCandidateId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("actionCandidateId"));

    }
  }
  if (self->_actionIdentifier)
  {
    -[CAARSchemaCAARActionFeatureSet actionIdentifier](self, "actionIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("actionIdentifier"));

  }
  if (self->_actionLevelDisambiguationHistory)
  {
    -[CAARSchemaCAARActionFeatureSet actionLevelDisambiguationHistory](self, "actionLevelDisambiguationHistory");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("actionLevelDisambiguationHistory"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("actionLevelDisambiguationHistory"));

    }
  }
  if (self->_appHistoryFeatures)
  {
    -[CAARSchemaCAARActionFeatureSet appHistoryFeatures](self, "appHistoryFeatures");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("appHistoryFeatures"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("appHistoryFeatures"));

    }
  }
  if (self->_appLevelDisambiguationHistory)
  {
    -[CAARSchemaCAARActionFeatureSet appLevelDisambiguationHistory](self, "appLevelDisambiguationHistory");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "dictionaryRepresentation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("appLevelDisambiguationHistory"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("appLevelDisambiguationHistory"));

    }
  }
  has = self->_has;
  v19 = *(_DWORD *)&has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_BYTE *)&has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CAARSchemaCAARActionFeatureSet appNameMentioned](self, "appNameMentioned"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("appNameMentioned"));

    v19 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    if ((v19 & 0x100000) == 0)
    {
LABEL_25:
      if ((v19 & 0x1000) == 0)
        goto LABEL_26;
      goto LABEL_56;
    }
  }
  else if ((v19 & 0x100000) == 0)
  {
    goto LABEL_25;
  }
  v24 = -[CAARSchemaCAARActionFeatureSet domainProtectionLevel](self, "domainProtectionLevel") - 1;
  if (v24 > 2)
    v25 = CFSTR("CAARDOMAINPROTECTIONLEVEL_UNKNOWN");
  else
    v25 = off_1E562B8D8[v24];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("domainProtectionLevel"));
  v19 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x1000) == 0)
  {
LABEL_26:
    if ((v19 & 0x10) == 0)
      goto LABEL_27;
    goto LABEL_57;
  }
LABEL_56:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[CAARSchemaCAARActionFeatureSet entitySaliencyMaxScore](self, "entitySaliencyMaxScore"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v28, CFSTR("entitySaliencyMaxScore"));

  v19 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x10) == 0)
  {
LABEL_27:
    if ((v19 & 0x40000) == 0)
      goto LABEL_28;
    goto LABEL_58;
  }
LABEL_57:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CAARSchemaCAARActionFeatureSet entityTypeMentioned](self, "entityTypeMentioned"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("entityTypeMentioned"));

  v19 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((v19 & 0x40000) == 0)
  {
LABEL_28:
    if ((v19 & 2) == 0)
      goto LABEL_29;
    goto LABEL_59;
  }
LABEL_58:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CAARSchemaCAARActionFeatureSet isAmbiguousFirstRunPreviouslyShown](self, "isAmbiguousFirstRunPreviouslyShown"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("isAmbiguousFirstRunPreviouslyShown"));

  v19 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 2) == 0)
  {
LABEL_29:
    if ((v19 & 0x20000) == 0)
      goto LABEL_30;
    goto LABEL_60;
  }
LABEL_59:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CAARSchemaCAARActionFeatureSet isAppInForeground](self, "isAppInForeground"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v31, CFSTR("isAppInForeground"));

  v19 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((v19 & 0x20000) == 0)
  {
LABEL_30:
    if ((v19 & 0x400) == 0)
      goto LABEL_31;
    goto LABEL_61;
  }
LABEL_60:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CAARSchemaCAARActionFeatureSet isAutoShortcutEnabled](self, "isAutoShortcutEnabled"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, CFSTR("isAutoShortcutEnabled"));

  v19 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
LABEL_31:
    if ((v19 & 0x800) == 0)
      goto LABEL_32;
    goto LABEL_62;
  }
LABEL_61:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CAARSchemaCAARActionFeatureSet isAutoshortcut](self, "isAutoshortcut"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, CFSTR("isAutoshortcut"));

  v19 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
LABEL_32:
    if ((v19 & 0x20) == 0)
      goto LABEL_33;
    goto LABEL_63;
  }
LABEL_62:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CAARSchemaCAARActionFeatureSet isAutoshortcutAppOnScreen](self, "isAutoshortcutAppOnScreen"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v34, CFSTR("isAutoshortcutAppOnScreen"));

  v19 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x20) == 0)
  {
LABEL_33:
    if ((v19 & 0x80) == 0)
      goto LABEL_34;
    goto LABEL_64;
  }
LABEL_63:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CAARSchemaCAARActionFeatureSet isColdOpenAllowlist](self, "isColdOpenAllowlist"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v35, CFSTR("isColdOpenAllowlist"));

  v19 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x80) == 0)
  {
LABEL_34:
    if ((v19 & 1) == 0)
      goto LABEL_35;
    goto LABEL_65;
  }
LABEL_64:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CAARSchemaCAARActionFeatureSet isDefaultLinkAction](self, "isDefaultLinkAction"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v36, CFSTR("isDefaultLinkAction"));

  v19 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 1) == 0)
  {
LABEL_35:
    if ((v19 & 0x80000) == 0)
      goto LABEL_36;
    goto LABEL_66;
  }
LABEL_65:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CAARSchemaCAARActionFeatureSet isHighConfidence](self, "isHighConfidence"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v37, CFSTR("isHighConfidence"));

  v19 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((v19 & 0x80000) == 0)
  {
LABEL_36:
    if ((v19 & 0x200) == 0)
      goto LABEL_37;
    goto LABEL_67;
  }
LABEL_66:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CAARSchemaCAARActionFeatureSet isInterpretableAsUniversalCommand](self, "isInterpretableAsUniversalCommand"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v38, CFSTR("isInterpretableAsUniversalCommand"));

  v19 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
LABEL_37:
    if ((v19 & 0x40) == 0)
      goto LABEL_38;
    goto LABEL_68;
  }
LABEL_67:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CAARSchemaCAARActionFeatureSet isLinkAction](self, "isLinkAction"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v39, CFSTR("isLinkAction"));

  v19 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x40) == 0)
  {
LABEL_38:
    if ((v19 & 0x10000) == 0)
      goto LABEL_39;
    goto LABEL_69;
  }
LABEL_68:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CAARSchemaCAARActionFeatureSet isLinkActionOnScreen](self, "isLinkActionOnScreen"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v40, CFSTR("isLinkActionOnScreen"));

  v19 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((v19 & 0x10000) == 0)
  {
LABEL_39:
    if ((v19 & 0x8000) == 0)
      goto LABEL_40;
    goto LABEL_70;
  }
LABEL_69:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CAARSchemaCAARActionFeatureSet isRepeatedFlowHandlerId](self, "isRepeatedFlowHandlerId"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v41, CFSTR("isRepeatedFlowHandlerId"));

  LOWORD(v19) = self->_has;
  if ((v19 & 0x8000) == 0)
  {
LABEL_40:
    if ((v19 & 8) == 0)
      goto LABEL_41;
    goto LABEL_71;
  }
LABEL_70:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CAARSchemaCAARActionFeatureSet isTopRankedParse](self, "isTopRankedParse"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v42, CFSTR("isTopRankedParse"));

  LOWORD(v19) = self->_has;
  if ((v19 & 8) == 0)
  {
LABEL_41:
    if ((v19 & 0x100) == 0)
      goto LABEL_42;
    goto LABEL_72;
  }
LABEL_71:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CAARSchemaCAARActionFeatureSet isTopRankedPlugin](self, "isTopRankedPlugin"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v43, CFSTR("isTopRankedPlugin"));

  LOWORD(v19) = self->_has;
  if ((v19 & 0x100) == 0)
  {
LABEL_42:
    if ((v19 & 0x4000) == 0)
      goto LABEL_43;
    goto LABEL_73;
  }
LABEL_72:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CAARSchemaCAARActionFeatureSet isVocabNameMatch](self, "isVocabNameMatch"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v44, CFSTR("isVocabNameMatch"));

  LOWORD(v19) = self->_has;
  if ((v19 & 0x4000) == 0)
  {
LABEL_43:
    if ((v19 & 0x2000) == 0)
      goto LABEL_45;
    goto LABEL_44;
  }
LABEL_73:
  v45 = (void *)MEMORY[0x1E0CB37E8];
  -[CAARSchemaCAARActionFeatureSet nlParseProbability](self, "nlParseProbability");
  objc_msgSend(v45, "numberWithFloat:");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v46, CFSTR("nlParseProbability"));

  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
LABEL_44:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[CAARSchemaCAARActionFeatureSet numSalientEntities](self, "numSalientEntities"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("numSalientEntities"));

  }
LABEL_45:
  if (self->_proactiveFeatures)
  {
    -[CAARSchemaCAARActionFeatureSet proactiveFeatures](self, "proactiveFeatures");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "dictionaryRepresentation");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("proactiveFeatures"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("proactiveFeatures"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[CAARSchemaCAARActionFeatureSet dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (CAARSchemaCAARActionFeatureSet)initWithJSON:(id)a3
{
  void *v4;
  CAARSchemaCAARActionFeatureSet *v5;
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
    self = -[CAARSchemaCAARActionFeatureSet initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (CAARSchemaCAARActionFeatureSet)initWithDictionary:(id)a3
{
  id v4;
  CAARSchemaCAARActionFeatureSet *v5;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  CAARSchemaCAARAppHistoryFeatures *v26;
  uint64_t v27;
  CAARSchemaCAARAppLevelDisambiguationHistory *v28;
  void *v29;
  CAARSchemaCAARActionLevelDisambiguationHistory *v30;
  void *v31;
  CAARSchemaCAARProactiveFeatures *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  CAARSchemaCAARActionFeatureSet *v39;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  objc_super v61;

  v4 = a3;
  v61.receiver = self;
  v61.super_class = (Class)CAARSchemaCAARActionFeatureSet;
  v5 = -[CAARSchemaCAARActionFeatureSet init](&v61, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("actionCandidateId"));
    v6 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v6);
      -[CAARSchemaCAARActionFeatureSet setActionCandidateId:](v5, "setActionCandidateId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isHighConfidence"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CAARSchemaCAARActionFeatureSet setIsHighConfidence:](v5, "setIsHighConfidence:", objc_msgSend(v8, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isAppInForeground"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CAARSchemaCAARActionFeatureSet setIsAppInForeground:](v5, "setIsAppInForeground:", objc_msgSend(v9, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appNameMentioned"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CAARSchemaCAARActionFeatureSet setAppNameMentioned:](v5, "setAppNameMentioned:", objc_msgSend(v10, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isTopRankedPlugin"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CAARSchemaCAARActionFeatureSet setIsTopRankedPlugin:](v5, "setIsTopRankedPlugin:", objc_msgSend(v11, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("entityTypeMentioned"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v60 = v12;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CAARSchemaCAARActionFeatureSet setEntityTypeMentioned:](v5, "setEntityTypeMentioned:", objc_msgSend(v12, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isColdOpenAllowlist"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v59 = v13;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CAARSchemaCAARActionFeatureSet setIsColdOpenAllowlist:](v5, "setIsColdOpenAllowlist:", objc_msgSend(v13, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isLinkActionOnScreen"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v58 = v14;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CAARSchemaCAARActionFeatureSet setIsLinkActionOnScreen:](v5, "setIsLinkActionOnScreen:", objc_msgSend(v14, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isDefaultLinkAction"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v57 = v15;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CAARSchemaCAARActionFeatureSet setIsDefaultLinkAction:](v5, "setIsDefaultLinkAction:", objc_msgSend(v15, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isVocabNameMatch"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v56 = v16;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CAARSchemaCAARActionFeatureSet setIsVocabNameMatch:](v5, "setIsVocabNameMatch:", objc_msgSend(v16, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isLinkAction"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v55 = v17;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CAARSchemaCAARActionFeatureSet setIsLinkAction:](v5, "setIsLinkAction:", objc_msgSend(v17, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isAutoshortcut"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v54 = v18;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CAARSchemaCAARActionFeatureSet setIsAutoshortcut:](v5, "setIsAutoshortcut:", objc_msgSend(v18, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isAutoshortcutAppOnScreen"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v53 = v19;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CAARSchemaCAARActionFeatureSet setIsAutoshortcutAppOnScreen:](v5, "setIsAutoshortcutAppOnScreen:", objc_msgSend(v19, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("entitySaliencyMaxScore"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v52 = v20;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CAARSchemaCAARActionFeatureSet setEntitySaliencyMaxScore:](v5, "setEntitySaliencyMaxScore:", objc_msgSend(v20, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numSalientEntities"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v51 = v21;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CAARSchemaCAARActionFeatureSet setNumSalientEntities:](v5, "setNumSalientEntities:", objc_msgSend(v21, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("nlParseProbability"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v50 = v22;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v22, "floatValue");
      -[CAARSchemaCAARActionFeatureSet setNlParseProbability:](v5, "setNlParseProbability:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isTopRankedParse"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v49 = v23;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CAARSchemaCAARActionFeatureSet setIsTopRankedParse:](v5, "setIsTopRankedParse:", objc_msgSend(v23, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isRepeatedFlowHandlerId"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v48 = v24;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CAARSchemaCAARActionFeatureSet setIsRepeatedFlowHandlerId:](v5, "setIsRepeatedFlowHandlerId:", objc_msgSend(v24, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appHistoryFeatures"));
    v25 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v47 = (void *)v25;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v26 = -[CAARSchemaCAARAppHistoryFeatures initWithDictionary:]([CAARSchemaCAARAppHistoryFeatures alloc], "initWithDictionary:", v25);
      -[CAARSchemaCAARActionFeatureSet setAppHistoryFeatures:](v5, "setAppHistoryFeatures:", v26);

    }
    v45 = v8;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appLevelDisambiguationHistory"));
    v27 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v28 = -[CAARSchemaCAARAppLevelDisambiguationHistory initWithDictionary:]([CAARSchemaCAARAppLevelDisambiguationHistory alloc], "initWithDictionary:", v27);
      -[CAARSchemaCAARActionFeatureSet setAppLevelDisambiguationHistory:](v5, "setAppLevelDisambiguationHistory:", v28);

    }
    v41 = (void *)v27;
    v44 = v9;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("actionLevelDisambiguationHistory"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v30 = -[CAARSchemaCAARActionLevelDisambiguationHistory initWithDictionary:]([CAARSchemaCAARActionLevelDisambiguationHistory alloc], "initWithDictionary:", v29);
      -[CAARSchemaCAARActionFeatureSet setActionLevelDisambiguationHistory:](v5, "setActionLevelDisambiguationHistory:", v30);

    }
    v43 = v10;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("proactiveFeatures"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v32 = -[CAARSchemaCAARProactiveFeatures initWithDictionary:]([CAARSchemaCAARProactiveFeatures alloc], "initWithDictionary:", v31);
      -[CAARSchemaCAARActionFeatureSet setProactiveFeatures:](v5, "setProactiveFeatures:", v32);

    }
    v42 = v11;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isAutoShortcutEnabled"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CAARSchemaCAARActionFeatureSet setIsAutoShortcutEnabled:](v5, "setIsAutoShortcutEnabled:", objc_msgSend(v33, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isAmbiguousFirstRunPreviouslyShown"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CAARSchemaCAARActionFeatureSet setIsAmbiguousFirstRunPreviouslyShown:](v5, "setIsAmbiguousFirstRunPreviouslyShown:", objc_msgSend(v34, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("actionIdentifier"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v36 = (void *)objc_msgSend(v35, "copy");
      -[CAARSchemaCAARActionFeatureSet setActionIdentifier:](v5, "setActionIdentifier:", v36);

    }
    v46 = (void *)v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isInterpretableAsUniversalCommand"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CAARSchemaCAARActionFeatureSet setIsInterpretableAsUniversalCommand:](v5, "setIsInterpretableAsUniversalCommand:", objc_msgSend(v37, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("domainProtectionLevel"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CAARSchemaCAARActionFeatureSet setDomainProtectionLevel:](v5, "setDomainProtectionLevel:", objc_msgSend(v38, "intValue"));
    v39 = v5;

  }
  return v5;
}

- (SISchemaUUID)actionCandidateId
{
  return self->_actionCandidateId;
}

- (void)setActionCandidateId:(id)a3
{
  objc_storeStrong((id *)&self->_actionCandidateId, a3);
}

- (BOOL)isHighConfidence
{
  return self->_isHighConfidence;
}

- (BOOL)isAppInForeground
{
  return self->_isAppInForeground;
}

- (BOOL)appNameMentioned
{
  return self->_appNameMentioned;
}

- (BOOL)isTopRankedPlugin
{
  return self->_isTopRankedPlugin;
}

- (BOOL)entityTypeMentioned
{
  return self->_entityTypeMentioned;
}

- (BOOL)isColdOpenAllowlist
{
  return self->_isColdOpenAllowlist;
}

- (BOOL)isLinkActionOnScreen
{
  return self->_isLinkActionOnScreen;
}

- (BOOL)isDefaultLinkAction
{
  return self->_isDefaultLinkAction;
}

- (BOOL)isVocabNameMatch
{
  return self->_isVocabNameMatch;
}

- (BOOL)isLinkAction
{
  return self->_isLinkAction;
}

- (BOOL)isAutoshortcut
{
  return self->_isAutoshortcut;
}

- (BOOL)isAutoshortcutAppOnScreen
{
  return self->_isAutoshortcutAppOnScreen;
}

- (unsigned)entitySaliencyMaxScore
{
  return self->_entitySaliencyMaxScore;
}

- (unsigned)numSalientEntities
{
  return self->_numSalientEntities;
}

- (float)nlParseProbability
{
  return self->_nlParseProbability;
}

- (BOOL)isTopRankedParse
{
  return self->_isTopRankedParse;
}

- (BOOL)isRepeatedFlowHandlerId
{
  return self->_isRepeatedFlowHandlerId;
}

- (CAARSchemaCAARAppHistoryFeatures)appHistoryFeatures
{
  return self->_appHistoryFeatures;
}

- (void)setAppHistoryFeatures:(id)a3
{
  objc_storeStrong((id *)&self->_appHistoryFeatures, a3);
}

- (CAARSchemaCAARAppLevelDisambiguationHistory)appLevelDisambiguationHistory
{
  return self->_appLevelDisambiguationHistory;
}

- (void)setAppLevelDisambiguationHistory:(id)a3
{
  objc_storeStrong((id *)&self->_appLevelDisambiguationHistory, a3);
}

- (CAARSchemaCAARActionLevelDisambiguationHistory)actionLevelDisambiguationHistory
{
  return self->_actionLevelDisambiguationHistory;
}

- (void)setActionLevelDisambiguationHistory:(id)a3
{
  objc_storeStrong((id *)&self->_actionLevelDisambiguationHistory, a3);
}

- (CAARSchemaCAARProactiveFeatures)proactiveFeatures
{
  return self->_proactiveFeatures;
}

- (void)setProactiveFeatures:(id)a3
{
  objc_storeStrong((id *)&self->_proactiveFeatures, a3);
}

- (BOOL)isAutoShortcutEnabled
{
  return self->_isAutoShortcutEnabled;
}

- (BOOL)isAmbiguousFirstRunPreviouslyShown
{
  return self->_isAmbiguousFirstRunPreviouslyShown;
}

- (NSString)actionIdentifier
{
  return self->_actionIdentifier;
}

- (void)setActionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (BOOL)isInterpretableAsUniversalCommand
{
  return self->_isInterpretableAsUniversalCommand;
}

- (int)domainProtectionLevel
{
  return self->_domainProtectionLevel;
}

- (void)setHasActionCandidateId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 3) = a3;
}

- (void)setHasAppHistoryFeatures:(BOOL)a3
{
  self->_hasActionCandidateId = a3;
}

- (void)setHasAppLevelDisambiguationHistory:(BOOL)a3
{
  self->_hasAppHistoryFeatures = a3;
}

- (void)setHasActionLevelDisambiguationHistory:(BOOL)a3
{
  self->_hasAppLevelDisambiguationHistory = a3;
}

- (void)setHasProactiveFeatures:(BOOL)a3
{
  self->_hasActionLevelDisambiguationHistory = a3;
}

- (void)setHasActionIdentifier:(BOOL)a3
{
  self->_hasProactiveFeatures = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionIdentifier, 0);
  objc_storeStrong((id *)&self->_proactiveFeatures, 0);
  objc_storeStrong((id *)&self->_actionLevelDisambiguationHistory, 0);
  objc_storeStrong((id *)&self->_appLevelDisambiguationHistory, 0);
  objc_storeStrong((id *)&self->_appHistoryFeatures, 0);
  objc_storeStrong((id *)&self->_actionCandidateId, 0);
}

@end
