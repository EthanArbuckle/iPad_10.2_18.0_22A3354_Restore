@implementation CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent

- (void)setPersonAndAppMatched:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_personAndAppMatched = a3;
}

- (void)setHasPersonAndAppMatched:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasPersonAndAppMatched
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setPersonMatched:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_personMatched = a3;
}

- (void)setHasPersonMatched:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasPersonMatched
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (BOOL)hasSessionId
{
  return self->_sessionId != 0;
}

- (void)setTopicRulesCardinality:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_topicRulesCardinality = a3;
}

- (void)setHasTopicRulesCardinality:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTopicRulesCardinality
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setTopicContainingRuleCount:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_topicContainingRuleCount = a3;
}

- (void)setHasTopicContainingRuleCount:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTopicContainingRuleCount
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setTopicOverlap:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_topicOverlap = a3;
}

- (void)setHasTopicOverlap:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasTopicOverlap
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setTopicInContext:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_topicInContext = a3;
}

- (void)setHasTopicInContext:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasTopicInContext
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setTopicInRule:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_topicInRule = a3;
}

- (void)setHasTopicInRule:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasTopicInRule
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent;
  -[CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSString *uniqueShareEventIdentifier;
  void *v27;
  NSString *confidence;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  char has;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  NSString *support;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  NSString *sessionId;
  char v53;
  void *v54;
  void *v56;
  void *v57;
  void *v58;
  void *v59;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_contentUrlInContext);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("contentUrlInContext"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_highConfidenceRuleCount);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("highConfidenceRuleCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_locationOfInterestContainingRuleCount);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("locationOfInterestContainingRuleCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_locationOfInterestRulesCardinality);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("locationOfInterestRulesCardinality"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_lOIInContext);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("LOIInContext"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_lowConfidenceRuleCount);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("lowConfidenceRuleCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_mediumConfidenceRuleCount);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("mediumConfidenceRuleCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_photoContactContainingRuleCount);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("photoContactContainingRuleCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_photoContactInContext);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("photoContactInContext"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_photoContactRulesCardinality);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("photoContactRulesCardinality"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_photoSceneContainingRuleCount);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("photoSceneContainingRuleCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_photoSceneInContext);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("photoSceneInContext"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_photoSceneRulesCardinality);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("photoSceneRulesCardinality"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_sourceBundleIdContainingRuleCount);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("sourceBundleIdContainingRuleCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_sourceBundleIdInContext);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("sourceBundleIdInContext"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_sourceBundleIdRulesCardinality);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("sourceBundleIdRulesCardinality"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_targetBundleIdContainingRuleCount);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("targetBundleIdContainingRuleCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_targetBundleIdInContext);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("targetBundleIdInContext"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_targetBundleIdRulesCardinality);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("targetBundleIdRulesCardinality"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_totalMessagesRecieved);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("totalMessagesRecieved"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_totalMessagesSent);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("totalMessagesSent"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_totalShares);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("totalShares"));

  uniqueShareEventIdentifier = self->_uniqueShareEventIdentifier;
  if (uniqueShareEventIdentifier)
    objc_msgSend(v3, "setObject:forKey:", uniqueShareEventIdentifier, CFSTR("uniqueShareEventIdentifier"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_utiTypeInContext);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v27, CFSTR("utiTypeInContext"));

  confidence = self->_confidence;
  if (confidence)
    objc_msgSend(v3, "setObject:forKey:", confidence, CFSTR("confidence"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_contentUrlInRule);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v29, CFSTR("contentUrlInRule"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_contentUrlOverlap);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v30, CFSTR("contentUrlOverlap"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isWeekendInRule);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v31, CFSTR("isWeekendInRule"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isWeekendOverlap);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v32, CFSTR("isWeekendOverlap"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_lOIInRule);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v33, CFSTR("LOIInRule"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_lOIOverlap);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v34, CFSTR("LOIOverlap"));

  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_personAndAppMatched);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v36, CFSTR("personAndAppMatched"));

    has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_personMatched);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v37, CFSTR("personMatched"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_photoContactInRule);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v38, CFSTR("photoContactInRule"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_photoContactOverlap);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v39, CFSTR("photoContactOverlap"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_photoSceneInRule);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v40, CFSTR("photoSceneInRule"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_photoSceneOverlap);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v41, CFSTR("photoSceneOverlap"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_sourceBundleIdInRule);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v42, CFSTR("sourceBundleIdInRule"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_sourceBundleIdOverlap);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v43, CFSTR("sourceBundleIdOverlap"));

  support = self->_support;
  if (support)
    objc_msgSend(v3, "setObject:forKey:", support, CFSTR("support"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_targetBundleIDInConsequent);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v45, CFSTR("targetBundleIDInConsequent"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_targetBundleIdInRule);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v46, CFSTR("targetBundleIdInRule"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_targetBundleIdOverlap);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v47, CFSTR("targetBundleIdOverlap"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_timeOfDaySlotInRule);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v48, CFSTR("timeOfDaySlotInRule"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_timeOfDaySlotOverlap);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v49, CFSTR("timeOfDaySlotOverlap"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_utiTypeInRule);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v50, CFSTR("utiTypeInRule"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_utiTypeOverlap);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v51, CFSTR("utiTypeOverlap"));

  sessionId = self->_sessionId;
  if (sessionId)
    objc_msgSend(v3, "setObject:forKey:", sessionId, CFSTR("session_id"));
  v53 = (char)self->_has;
  if ((v53 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_topicRulesCardinality);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v56, CFSTR("topicRulesCardinality"));

    v53 = (char)self->_has;
    if ((v53 & 1) == 0)
    {
LABEL_15:
      if ((v53 & 0x40) == 0)
        goto LABEL_16;
      goto LABEL_22;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_topicContainingRuleCount);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v57, CFSTR("topicContainingRuleCount"));

  v53 = (char)self->_has;
  if ((v53 & 0x40) == 0)
  {
LABEL_16:
    if ((v53 & 0x10) == 0)
      goto LABEL_17;
LABEL_23:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_topicInContext);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v59, CFSTR("topicInContext"));

    if ((*(_BYTE *)&self->_has & 0x20) == 0)
      return v3;
    goto LABEL_18;
  }
LABEL_22:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_topicOverlap);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v58, CFSTR("topicOverlap"));

  v53 = (char)self->_has;
  if ((v53 & 0x10) != 0)
    goto LABEL_23;
LABEL_17:
  if ((v53 & 0x20) != 0)
  {
LABEL_18:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_topicInRule);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v54, CFSTR("topicInRule"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return CoreBehaviorAnalysisPETCoreBehaviorAnalysisEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  PBDataWriterWriteBOOLField();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteBOOLField();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteBOOLField();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteBOOLField();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  if (!self->_uniqueShareEventIdentifier)
    -[CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent writeTo:].cold.1();
  PBDataWriterWriteStringField();
  PBDataWriterWriteBOOLField();
  if (!self->_confidence)
    -[CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent writeTo:].cold.2();
  PBDataWriterWriteStringField();
  PBDataWriterWriteBOOLField();
  PBDataWriterWriteBOOLField();
  PBDataWriterWriteBOOLField();
  PBDataWriterWriteBOOLField();
  PBDataWriterWriteBOOLField();
  PBDataWriterWriteBOOLField();
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = (char)self->_has;
  }
  if ((has & 8) != 0)
    PBDataWriterWriteBOOLField();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteBOOLField();
  PBDataWriterWriteBOOLField();
  if (!self->_support)
    -[CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent writeTo:].cold.3();
  PBDataWriterWriteStringField();
  PBDataWriterWriteBOOLField();
  PBDataWriterWriteBOOLField();
  PBDataWriterWriteBOOLField();
  PBDataWriterWriteBOOLField();
  PBDataWriterWriteBOOLField();
  PBDataWriterWriteBOOLField();
  PBDataWriterWriteBOOLField();
  if (self->_sessionId)
    PBDataWriterWriteStringField();
  v5 = (char)self->_has;
  if ((v5 & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    v5 = (char)self->_has;
  }
  v6 = v7;
  if ((v5 & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    v6 = v7;
    v5 = (char)self->_has;
    if ((v5 & 0x40) == 0)
    {
LABEL_14:
      if ((v5 & 0x10) == 0)
        goto LABEL_15;
LABEL_20:
      PBDataWriterWriteBOOLField();
      v6 = v7;
      if ((*(_BYTE *)&self->_has & 0x20) == 0)
        goto LABEL_17;
      goto LABEL_16;
    }
  }
  else if ((v5 & 0x40) == 0)
  {
    goto LABEL_14;
  }
  PBDataWriterWriteBOOLField();
  v6 = v7;
  v5 = (char)self->_has;
  if ((v5 & 0x10) != 0)
    goto LABEL_20;
LABEL_15:
  if ((v5 & 0x20) != 0)
  {
LABEL_16:
    PBDataWriterWriteBOOLField();
    v6 = v7;
  }
LABEL_17:

}

- (void)copyTo:(id)a3
{
  char has;
  _DWORD *v5;
  char v6;
  _BYTE *v7;

  v7 = a3;
  v7[144] = self->_contentUrlInContext;
  *((_DWORD *)v7 + 4) = self->_highConfidenceRuleCount;
  *((_DWORD *)v7 + 5) = self->_locationOfInterestContainingRuleCount;
  *((_DWORD *)v7 + 6) = self->_locationOfInterestRulesCardinality;
  v7[149] = self->_lOIInContext;
  *((_DWORD *)v7 + 7) = self->_lowConfidenceRuleCount;
  *((_DWORD *)v7 + 8) = self->_mediumConfidenceRuleCount;
  *((_DWORD *)v7 + 9) = self->_photoContactContainingRuleCount;
  *((_DWORD *)v7 + 10) = self->_photoContactInContext;
  *((_DWORD *)v7 + 13) = self->_photoContactRulesCardinality;
  *((_DWORD *)v7 + 14) = self->_photoSceneContainingRuleCount;
  *((_DWORD *)v7 + 15) = self->_photoSceneInContext;
  *((_DWORD *)v7 + 18) = self->_photoSceneRulesCardinality;
  *((_DWORD *)v7 + 22) = self->_sourceBundleIdContainingRuleCount;
  v7[154] = self->_sourceBundleIdInContext;
  *((_DWORD *)v7 + 23) = self->_sourceBundleIdRulesCardinality;
  *((_DWORD *)v7 + 26) = self->_targetBundleIdContainingRuleCount;
  v7[158] = self->_targetBundleIdInContext;
  *((_DWORD *)v7 + 27) = self->_targetBundleIdRulesCardinality;
  *((_DWORD *)v7 + 30) = self->_totalMessagesRecieved;
  *((_DWORD *)v7 + 31) = self->_totalMessagesSent;
  *((_DWORD *)v7 + 32) = self->_totalShares;
  objc_msgSend(v7, "setUniqueShareEventIdentifier:", self->_uniqueShareEventIdentifier);
  v7[166] = self->_utiTypeInContext;
  objc_msgSend(v7, "setConfidence:", self->_confidence);
  v7[145] = self->_contentUrlInRule;
  v7[146] = self->_contentUrlOverlap;
  v7[147] = self->_isWeekendInRule;
  v7[148] = self->_isWeekendOverlap;
  v7[150] = self->_lOIInRule;
  v7[151] = self->_lOIOverlap;
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v7[152] = self->_personAndAppMatched;
    v7[172] |= 4u;
    has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    v7[153] = self->_personMatched;
    v7[172] |= 8u;
  }
  *((_DWORD *)v7 + 11) = self->_photoContactInRule;
  *((_DWORD *)v7 + 12) = self->_photoContactOverlap;
  *((_DWORD *)v7 + 16) = self->_photoSceneInRule;
  *((_DWORD *)v7 + 17) = self->_photoSceneOverlap;
  v7[155] = self->_sourceBundleIdInRule;
  v7[156] = self->_sourceBundleIdOverlap;
  objc_msgSend(v7, "setSupport:", self->_support);
  v5 = v7;
  v7[157] = self->_targetBundleIDInConsequent;
  v7[159] = self->_targetBundleIdInRule;
  v7[160] = self->_targetBundleIdOverlap;
  v7[161] = self->_timeOfDaySlotInRule;
  v7[162] = self->_timeOfDaySlotOverlap;
  v7[167] = self->_utiTypeInRule;
  v7[168] = self->_utiTypeOverlap;
  if (self->_sessionId)
  {
    objc_msgSend(v7, "setSessionId:");
    v5 = v7;
  }
  v6 = (char)self->_has;
  if ((v6 & 2) != 0)
  {
    v5[29] = self->_topicRulesCardinality;
    *((_BYTE *)v5 + 172) |= 2u;
    v6 = (char)self->_has;
    if ((v6 & 1) == 0)
    {
LABEL_9:
      if ((v6 & 0x40) == 0)
        goto LABEL_10;
      goto LABEL_16;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_9;
  }
  v5[28] = self->_topicContainingRuleCount;
  *((_BYTE *)v5 + 172) |= 1u;
  v6 = (char)self->_has;
  if ((v6 & 0x40) == 0)
  {
LABEL_10:
    if ((v6 & 0x10) == 0)
      goto LABEL_11;
LABEL_17:
    *((_BYTE *)v5 + 163) = self->_topicInContext;
    *((_BYTE *)v5 + 172) |= 0x10u;
    if ((*(_BYTE *)&self->_has & 0x20) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_16:
  *((_BYTE *)v5 + 165) = self->_topicOverlap;
  *((_BYTE *)v5 + 172) |= 0x40u;
  v6 = (char)self->_has;
  if ((v6 & 0x10) != 0)
    goto LABEL_17;
LABEL_11:
  if ((v6 & 0x20) != 0)
  {
LABEL_12:
    *((_BYTE *)v5 + 164) = self->_topicInRule;
    *((_BYTE *)v5 + 172) |= 0x20u;
  }
LABEL_13:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  char has;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  char v15;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_BYTE *)(v5 + 144) = self->_contentUrlInContext;
  *(_DWORD *)(v5 + 16) = self->_highConfidenceRuleCount;
  *(_DWORD *)(v5 + 20) = self->_locationOfInterestContainingRuleCount;
  *(_DWORD *)(v5 + 24) = self->_locationOfInterestRulesCardinality;
  *(_BYTE *)(v5 + 149) = self->_lOIInContext;
  *(_DWORD *)(v5 + 28) = self->_lowConfidenceRuleCount;
  *(_DWORD *)(v5 + 32) = self->_mediumConfidenceRuleCount;
  *(_DWORD *)(v5 + 36) = self->_photoContactContainingRuleCount;
  *(_DWORD *)(v5 + 40) = self->_photoContactInContext;
  *(_DWORD *)(v5 + 52) = self->_photoContactRulesCardinality;
  *(_DWORD *)(v5 + 56) = self->_photoSceneContainingRuleCount;
  *(_DWORD *)(v5 + 60) = self->_photoSceneInContext;
  *(_DWORD *)(v5 + 72) = self->_photoSceneRulesCardinality;
  *(_DWORD *)(v5 + 88) = self->_sourceBundleIdContainingRuleCount;
  *(_BYTE *)(v5 + 154) = self->_sourceBundleIdInContext;
  *(_DWORD *)(v5 + 92) = self->_sourceBundleIdRulesCardinality;
  *(_DWORD *)(v5 + 104) = self->_targetBundleIdContainingRuleCount;
  *(_BYTE *)(v5 + 158) = self->_targetBundleIdInContext;
  *(_DWORD *)(v5 + 108) = self->_targetBundleIdRulesCardinality;
  *(_DWORD *)(v5 + 120) = self->_totalMessagesRecieved;
  *(_DWORD *)(v5 + 124) = self->_totalMessagesSent;
  *(_DWORD *)(v5 + 128) = self->_totalShares;
  v6 = -[NSString copyWithZone:](self->_uniqueShareEventIdentifier, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 136);
  *(_QWORD *)(v5 + 136) = v6;

  *(_BYTE *)(v5 + 166) = self->_utiTypeInContext;
  v8 = -[NSString copyWithZone:](self->_confidence, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v8;

  *(_BYTE *)(v5 + 145) = self->_contentUrlInRule;
  *(_BYTE *)(v5 + 146) = self->_contentUrlOverlap;
  *(_BYTE *)(v5 + 147) = self->_isWeekendInRule;
  *(_BYTE *)(v5 + 148) = self->_isWeekendOverlap;
  *(_BYTE *)(v5 + 150) = self->_lOIInRule;
  *(_BYTE *)(v5 + 151) = self->_lOIOverlap;
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(_BYTE *)(v5 + 152) = self->_personAndAppMatched;
    *(_BYTE *)(v5 + 172) |= 4u;
    has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    *(_BYTE *)(v5 + 153) = self->_personMatched;
    *(_BYTE *)(v5 + 172) |= 8u;
  }
  *(_DWORD *)(v5 + 44) = self->_photoContactInRule;
  *(_DWORD *)(v5 + 48) = self->_photoContactOverlap;
  *(_DWORD *)(v5 + 64) = self->_photoSceneInRule;
  *(_DWORD *)(v5 + 68) = self->_photoSceneOverlap;
  *(_BYTE *)(v5 + 155) = self->_sourceBundleIdInRule;
  *(_BYTE *)(v5 + 156) = self->_sourceBundleIdOverlap;
  v11 = -[NSString copyWithZone:](self->_support, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v11;

  *(_BYTE *)(v5 + 157) = self->_targetBundleIDInConsequent;
  *(_BYTE *)(v5 + 159) = self->_targetBundleIdInRule;
  *(_BYTE *)(v5 + 160) = self->_targetBundleIdOverlap;
  *(_BYTE *)(v5 + 161) = self->_timeOfDaySlotInRule;
  *(_BYTE *)(v5 + 162) = self->_timeOfDaySlotOverlap;
  *(_BYTE *)(v5 + 167) = self->_utiTypeInRule;
  *(_BYTE *)(v5 + 168) = self->_utiTypeOverlap;
  v13 = -[NSString copyWithZone:](self->_sessionId, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v13;

  v15 = (char)self->_has;
  if ((v15 & 2) != 0)
  {
    *(_DWORD *)(v5 + 116) = self->_topicRulesCardinality;
    *(_BYTE *)(v5 + 172) |= 2u;
    v15 = (char)self->_has;
    if ((v15 & 1) == 0)
    {
LABEL_7:
      if ((v15 & 0x40) == 0)
        goto LABEL_8;
      goto LABEL_14;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_7;
  }
  *(_DWORD *)(v5 + 112) = self->_topicContainingRuleCount;
  *(_BYTE *)(v5 + 172) |= 1u;
  v15 = (char)self->_has;
  if ((v15 & 0x40) == 0)
  {
LABEL_8:
    if ((v15 & 0x10) == 0)
      goto LABEL_9;
LABEL_15:
    *(_BYTE *)(v5 + 163) = self->_topicInContext;
    *(_BYTE *)(v5 + 172) |= 0x10u;
    if ((*(_BYTE *)&self->_has & 0x20) == 0)
      return (id)v5;
    goto LABEL_10;
  }
LABEL_14:
  *(_BYTE *)(v5 + 165) = self->_topicOverlap;
  *(_BYTE *)(v5 + 172) |= 0x40u;
  v15 = (char)self->_has;
  if ((v15 & 0x10) != 0)
    goto LABEL_15;
LABEL_9:
  if ((v15 & 0x20) != 0)
  {
LABEL_10:
    *(_BYTE *)(v5 + 164) = self->_topicInRule;
    *(_BYTE *)(v5 + 172) |= 0x20u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *uniqueShareEventIdentifier;
  NSString *confidence;
  NSString *support;
  NSString *sessionId;
  BOOL v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_157;
  if (self->_contentUrlInContext)
  {
    if (!*((_BYTE *)v4 + 144))
      goto LABEL_157;
  }
  else if (*((_BYTE *)v4 + 144))
  {
    goto LABEL_157;
  }
  if (self->_highConfidenceRuleCount != *((_DWORD *)v4 + 4)
    || self->_locationOfInterestContainingRuleCount != *((_DWORD *)v4 + 5)
    || self->_locationOfInterestRulesCardinality != *((_DWORD *)v4 + 6))
  {
    goto LABEL_157;
  }
  if (self->_lOIInContext)
  {
    if (!*((_BYTE *)v4 + 149))
      goto LABEL_157;
  }
  else if (*((_BYTE *)v4 + 149))
  {
    goto LABEL_157;
  }
  if (self->_lowConfidenceRuleCount != *((_DWORD *)v4 + 7)
    || self->_mediumConfidenceRuleCount != *((_DWORD *)v4 + 8)
    || self->_photoContactContainingRuleCount != *((_DWORD *)v4 + 9)
    || self->_photoContactInContext != *((_DWORD *)v4 + 10)
    || self->_photoContactRulesCardinality != *((_DWORD *)v4 + 13)
    || self->_photoSceneContainingRuleCount != *((_DWORD *)v4 + 14)
    || self->_photoSceneInContext != *((_DWORD *)v4 + 15)
    || self->_photoSceneRulesCardinality != *((_DWORD *)v4 + 18)
    || self->_sourceBundleIdContainingRuleCount != *((_DWORD *)v4 + 22))
  {
    goto LABEL_157;
  }
  if (self->_sourceBundleIdInContext)
  {
    if (!*((_BYTE *)v4 + 154))
      goto LABEL_157;
  }
  else if (*((_BYTE *)v4 + 154))
  {
    goto LABEL_157;
  }
  if (self->_sourceBundleIdRulesCardinality != *((_DWORD *)v4 + 23)
    || self->_targetBundleIdContainingRuleCount != *((_DWORD *)v4 + 26))
  {
    goto LABEL_157;
  }
  if (self->_targetBundleIdInContext)
  {
    if (!*((_BYTE *)v4 + 158))
      goto LABEL_157;
  }
  else if (*((_BYTE *)v4 + 158))
  {
    goto LABEL_157;
  }
  if (self->_targetBundleIdRulesCardinality != *((_DWORD *)v4 + 27))
    goto LABEL_157;
  if (self->_totalMessagesRecieved != *((_DWORD *)v4 + 30))
    goto LABEL_157;
  if (self->_totalMessagesSent != *((_DWORD *)v4 + 31))
    goto LABEL_157;
  if (self->_totalShares != *((_DWORD *)v4 + 32))
    goto LABEL_157;
  uniqueShareEventIdentifier = self->_uniqueShareEventIdentifier;
  if ((unint64_t)uniqueShareEventIdentifier | *((_QWORD *)v4 + 17))
  {
    if (!-[NSString isEqual:](uniqueShareEventIdentifier, "isEqual:"))
      goto LABEL_157;
  }
  if (self->_utiTypeInContext)
  {
    if (!*((_BYTE *)v4 + 166))
      goto LABEL_157;
  }
  else if (*((_BYTE *)v4 + 166))
  {
    goto LABEL_157;
  }
  confidence = self->_confidence;
  if ((unint64_t)confidence | *((_QWORD *)v4 + 1) && !-[NSString isEqual:](confidence, "isEqual:"))
    goto LABEL_157;
  if (self->_contentUrlInRule)
  {
    if (!*((_BYTE *)v4 + 145))
      goto LABEL_157;
  }
  else if (*((_BYTE *)v4 + 145))
  {
    goto LABEL_157;
  }
  if (self->_contentUrlOverlap)
  {
    if (!*((_BYTE *)v4 + 146))
      goto LABEL_157;
  }
  else if (*((_BYTE *)v4 + 146))
  {
    goto LABEL_157;
  }
  if (self->_isWeekendInRule)
  {
    if (!*((_BYTE *)v4 + 147))
      goto LABEL_157;
  }
  else if (*((_BYTE *)v4 + 147))
  {
    goto LABEL_157;
  }
  if (self->_isWeekendOverlap)
  {
    if (!*((_BYTE *)v4 + 148))
      goto LABEL_157;
  }
  else if (*((_BYTE *)v4 + 148))
  {
    goto LABEL_157;
  }
  if (self->_lOIInRule)
  {
    if (!*((_BYTE *)v4 + 150))
      goto LABEL_157;
  }
  else if (*((_BYTE *)v4 + 150))
  {
    goto LABEL_157;
  }
  if (self->_lOIOverlap)
  {
    if (!*((_BYTE *)v4 + 151))
      goto LABEL_157;
  }
  else if (*((_BYTE *)v4 + 151))
  {
    goto LABEL_157;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 172) & 4) == 0)
      goto LABEL_157;
    if (self->_personAndAppMatched)
    {
      if (!*((_BYTE *)v4 + 152))
        goto LABEL_157;
    }
    else if (*((_BYTE *)v4 + 152))
    {
      goto LABEL_157;
    }
  }
  else if ((*((_BYTE *)v4 + 172) & 4) != 0)
  {
    goto LABEL_157;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 172) & 8) == 0)
      goto LABEL_157;
    if (self->_personMatched)
    {
      if (!*((_BYTE *)v4 + 153))
        goto LABEL_157;
    }
    else if (*((_BYTE *)v4 + 153))
    {
      goto LABEL_157;
    }
  }
  else if ((*((_BYTE *)v4 + 172) & 8) != 0)
  {
    goto LABEL_157;
  }
  if (self->_photoContactInRule != *((_DWORD *)v4 + 11)
    || self->_photoContactOverlap != *((_DWORD *)v4 + 12)
    || self->_photoSceneInRule != *((_DWORD *)v4 + 16)
    || self->_photoSceneOverlap != *((_DWORD *)v4 + 17))
  {
    goto LABEL_157;
  }
  if (self->_sourceBundleIdInRule)
  {
    if (!*((_BYTE *)v4 + 155))
      goto LABEL_157;
  }
  else if (*((_BYTE *)v4 + 155))
  {
    goto LABEL_157;
  }
  if (self->_sourceBundleIdOverlap)
  {
    if (!*((_BYTE *)v4 + 156))
      goto LABEL_157;
  }
  else if (*((_BYTE *)v4 + 156))
  {
    goto LABEL_157;
  }
  support = self->_support;
  if ((unint64_t)support | *((_QWORD *)v4 + 12) && !-[NSString isEqual:](support, "isEqual:"))
    goto LABEL_157;
  if (self->_targetBundleIDInConsequent)
  {
    if (!*((_BYTE *)v4 + 157))
      goto LABEL_157;
  }
  else if (*((_BYTE *)v4 + 157))
  {
    goto LABEL_157;
  }
  if (self->_targetBundleIdInRule)
  {
    if (!*((_BYTE *)v4 + 159))
      goto LABEL_157;
  }
  else if (*((_BYTE *)v4 + 159))
  {
    goto LABEL_157;
  }
  if (self->_targetBundleIdOverlap)
  {
    if (!*((_BYTE *)v4 + 160))
      goto LABEL_157;
  }
  else if (*((_BYTE *)v4 + 160))
  {
    goto LABEL_157;
  }
  if (self->_timeOfDaySlotInRule)
  {
    if (!*((_BYTE *)v4 + 161))
      goto LABEL_157;
  }
  else if (*((_BYTE *)v4 + 161))
  {
    goto LABEL_157;
  }
  if (self->_timeOfDaySlotOverlap)
  {
    if (!*((_BYTE *)v4 + 162))
      goto LABEL_157;
  }
  else if (*((_BYTE *)v4 + 162))
  {
    goto LABEL_157;
  }
  if (self->_utiTypeInRule)
  {
    if (!*((_BYTE *)v4 + 167))
      goto LABEL_157;
  }
  else if (*((_BYTE *)v4 + 167))
  {
    goto LABEL_157;
  }
  if (self->_utiTypeOverlap)
  {
    if (!*((_BYTE *)v4 + 168))
      goto LABEL_157;
  }
  else if (*((_BYTE *)v4 + 168))
  {
    goto LABEL_157;
  }
  sessionId = self->_sessionId;
  if ((unint64_t)sessionId | *((_QWORD *)v4 + 10) && !-[NSString isEqual:](sessionId, "isEqual:"))
    goto LABEL_157;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 172) & 2) == 0 || self->_topicRulesCardinality != *((_DWORD *)v4 + 29))
      goto LABEL_157;
  }
  else if ((*((_BYTE *)v4 + 172) & 2) != 0)
  {
    goto LABEL_157;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 172) & 1) == 0 || self->_topicContainingRuleCount != *((_DWORD *)v4 + 28))
      goto LABEL_157;
  }
  else if ((*((_BYTE *)v4 + 172) & 1) != 0)
  {
    goto LABEL_157;
  }
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    if ((*((_BYTE *)v4 + 172) & 0x40) == 0)
      goto LABEL_157;
    if (self->_topicOverlap)
    {
      if (!*((_BYTE *)v4 + 165))
        goto LABEL_157;
    }
    else if (*((_BYTE *)v4 + 165))
    {
      goto LABEL_157;
    }
  }
  else if ((*((_BYTE *)v4 + 172) & 0x40) != 0)
  {
    goto LABEL_157;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 172) & 0x10) == 0)
      goto LABEL_157;
    if (self->_topicInContext)
    {
      if (!*((_BYTE *)v4 + 163))
        goto LABEL_157;
    }
    else if (*((_BYTE *)v4 + 163))
    {
      goto LABEL_157;
    }
  }
  else if ((*((_BYTE *)v4 + 172) & 0x10) != 0)
  {
    goto LABEL_157;
  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 172) & 0x20) != 0)
    {
      if (self->_topicInRule)
      {
        if (!*((_BYTE *)v4 + 164))
          goto LABEL_157;
      }
      else if (*((_BYTE *)v4 + 164))
      {
        goto LABEL_157;
      }
      v9 = 1;
      goto LABEL_158;
    }
LABEL_157:
    v9 = 0;
    goto LABEL_158;
  }
  v9 = (*((_BYTE *)v4 + 172) & 0x20) == 0;
LABEL_158:

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  _BOOL4 targetBundleIdInRule;
  _BOOL4 targetBundleIdOverlap;
  _BOOL4 timeOfDaySlotInRule;
  _BOOL4 timeOfDaySlotOverlap;
  _BOOL4 utiTypeInRule;
  _BOOL4 utiTypeOverlap;
  NSUInteger v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _BOOL4 targetBundleIDInConsequent;
  _BOOL4 sourceBundleIdOverlap;
  _BOOL4 sourceBundleIdInRule;
  unsigned int photoSceneOverlap;
  unsigned int photoSceneInRule;
  unsigned int photoContactOverlap;
  _BOOL4 lOIOverlap;
  unsigned int photoContactInRule;
  _BOOL4 isWeekendOverlap;
  _BOOL4 isWeekendInRule;
  _BOOL4 contentUrlOverlap;
  _BOOL4 contentUrlInRule;
  _BOOL4 lOIInRule;
  uint64_t v32;
  uint64_t v33;
  NSUInteger v34;
  _BOOL4 utiTypeInContext;
  NSUInteger v36;
  unsigned int totalShares;
  unsigned int totalMessagesSent;
  unsigned int totalMessagesRecieved;
  unsigned int targetBundleIdRulesCardinality;
  _BOOL4 targetBundleIdInContext;
  unsigned int targetBundleIdContainingRuleCount;
  unsigned int sourceBundleIdRulesCardinality;
  _BOOL4 sourceBundleIdInContext;
  unsigned int sourceBundleIdContainingRuleCount;
  unsigned int photoSceneRulesCardinality;
  unsigned int photoSceneInContext;
  unsigned int photoSceneContainingRuleCount;
  unsigned int photoContactRulesCardinality;
  unsigned int photoContactInContext;
  unsigned int photoContactContainingRuleCount;
  unsigned int mediumConfidenceRuleCount;
  unsigned int lowConfidenceRuleCount;
  _BOOL4 lOIInContext;
  unsigned int locationOfInterestRulesCardinality;
  unsigned int highConfidenceRuleCount;
  unsigned int locationOfInterestContainingRuleCount;
  _BOOL4 contentUrlInContext;

  contentUrlInContext = self->_contentUrlInContext;
  highConfidenceRuleCount = self->_highConfidenceRuleCount;
  locationOfInterestContainingRuleCount = self->_locationOfInterestContainingRuleCount;
  locationOfInterestRulesCardinality = self->_locationOfInterestRulesCardinality;
  lOIInContext = self->_lOIInContext;
  lowConfidenceRuleCount = self->_lowConfidenceRuleCount;
  mediumConfidenceRuleCount = self->_mediumConfidenceRuleCount;
  photoContactContainingRuleCount = self->_photoContactContainingRuleCount;
  photoContactInContext = self->_photoContactInContext;
  photoContactRulesCardinality = self->_photoContactRulesCardinality;
  photoSceneContainingRuleCount = self->_photoSceneContainingRuleCount;
  photoSceneInContext = self->_photoSceneInContext;
  photoSceneRulesCardinality = self->_photoSceneRulesCardinality;
  sourceBundleIdContainingRuleCount = self->_sourceBundleIdContainingRuleCount;
  sourceBundleIdInContext = self->_sourceBundleIdInContext;
  sourceBundleIdRulesCardinality = self->_sourceBundleIdRulesCardinality;
  targetBundleIdContainingRuleCount = self->_targetBundleIdContainingRuleCount;
  targetBundleIdInContext = self->_targetBundleIdInContext;
  targetBundleIdRulesCardinality = self->_targetBundleIdRulesCardinality;
  totalMessagesRecieved = self->_totalMessagesRecieved;
  totalMessagesSent = self->_totalMessagesSent;
  totalShares = self->_totalShares;
  v3 = -[NSString hash](self->_uniqueShareEventIdentifier, "hash");
  utiTypeInContext = self->_utiTypeInContext;
  v36 = v3;
  v34 = -[NSString hash](self->_confidence, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
    v33 = 2654435761 * self->_personAndAppMatched;
  else
    v33 = 0;
  if ((*(_BYTE *)&self->_has & 8) != 0)
    v32 = 2654435761 * self->_personMatched;
  else
    v32 = 0;
  contentUrlInRule = self->_contentUrlInRule;
  contentUrlOverlap = self->_contentUrlOverlap;
  isWeekendInRule = self->_isWeekendInRule;
  isWeekendOverlap = self->_isWeekendOverlap;
  lOIInRule = self->_lOIInRule;
  lOIOverlap = self->_lOIOverlap;
  photoContactInRule = self->_photoContactInRule;
  photoContactOverlap = self->_photoContactOverlap;
  photoSceneInRule = self->_photoSceneInRule;
  photoSceneOverlap = self->_photoSceneOverlap;
  sourceBundleIdInRule = self->_sourceBundleIdInRule;
  sourceBundleIdOverlap = self->_sourceBundleIdOverlap;
  v4 = -[NSString hash](self->_support, "hash");
  targetBundleIDInConsequent = self->_targetBundleIDInConsequent;
  targetBundleIdInRule = self->_targetBundleIdInRule;
  targetBundleIdOverlap = self->_targetBundleIdOverlap;
  timeOfDaySlotInRule = self->_timeOfDaySlotInRule;
  timeOfDaySlotOverlap = self->_timeOfDaySlotOverlap;
  utiTypeInRule = self->_utiTypeInRule;
  utiTypeOverlap = self->_utiTypeOverlap;
  v11 = -[NSString hash](self->_sessionId, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v12 = 2654435761 * self->_topicRulesCardinality;
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
LABEL_9:
      v13 = 2654435761 * self->_topicContainingRuleCount;
      if ((*(_BYTE *)&self->_has & 0x40) != 0)
        goto LABEL_10;
      goto LABEL_15;
    }
  }
  else
  {
    v12 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_9;
  }
  v13 = 0;
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
LABEL_10:
    v14 = 2654435761 * self->_topicOverlap;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_11;
LABEL_16:
    v15 = 0;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
      goto LABEL_12;
LABEL_17:
    v16 = 0;
    goto LABEL_18;
  }
LABEL_15:
  v14 = 0;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    goto LABEL_16;
LABEL_11:
  v15 = 2654435761 * self->_topicInContext;
  if ((*(_BYTE *)&self->_has & 0x20) == 0)
    goto LABEL_17;
LABEL_12:
  v16 = 2654435761 * self->_topicInRule;
LABEL_18:
  v17 = (2654435761 * highConfidenceRuleCount) ^ (2654435761 * contentUrlInContext) ^ (2654435761
                                                                                         * locationOfInterestContainingRuleCount) ^ (2654435761 * locationOfInterestRulesCardinality) ^ (2654435761 * lOIInContext) ^ (2654435761 * lowConfidenceRuleCount) ^ (2654435761 * mediumConfidenceRuleCount) ^ (2654435761 * photoContactContainingRuleCount) ^ (2654435761 * photoContactInContext) ^ (2654435761 * photoContactRulesCardinality) ^ (2654435761 * photoSceneContainingRuleCount) ^ (2654435761 * photoSceneInContext) ^ (2654435761 * photoSceneRulesCardinality) ^ (2654435761 * sourceBundleIdContainingRuleCount) ^ (2654435761 * sourceBundleIdInContext) ^ (2654435761 * sourceBundleIdRulesCardinality) ^ (2654435761 * targetBundleIdContainingRuleCount) ^ (2654435761 * targetBundleIdInContext) ^ (2654435761 * targetBundleIdRulesCardinality) ^ (2654435761 * totalMessagesRecieved) ^ (2654435761 * totalMessagesSent) ^ (2654435761 * totalShares) ^ v36 ^ (2654435761 * utiTypeInContext) ^ v34 ^ (2654435761 * contentUrlInRule) ^ (2654435761 * contentUrlOverlap) ^ (2654435761 * isWeekendInRule) ^ (2654435761 * isWeekendOverlap) ^ (2654435761 * lOIInRule) ^ (2654435761 * lOIOverlap) ^ v33 ^ v32 ^ (2654435761 * photoContactInRule) ^ (2654435761 * photoContactOverlap) ^ (2654435761 * photoSceneInRule) ^ (2654435761 * photoSceneOverlap) ^ (2654435761 * sourceBundleIdInRule) ^ (2654435761 * sourceBundleIdOverlap) ^ v4 ^ (2654435761 * targetBundleIDInConsequent) ^ (2654435761 * targetBundleIdInRule) ^ (2654435761 * targetBundleIdOverlap) ^ (2654435761 * timeOfDaySlotInRule) ^ (2654435761 * timeOfDaySlotOverlap) ^ (2654435761 * utiTypeInRule);
  return v17 ^ (2654435761 * utiTypeOverlap) ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  char v6;
  id v7;

  v4 = a3;
  self->_contentUrlInContext = *((_BYTE *)v4 + 144);
  self->_highConfidenceRuleCount = *((_DWORD *)v4 + 4);
  self->_locationOfInterestContainingRuleCount = *((_DWORD *)v4 + 5);
  self->_locationOfInterestRulesCardinality = *((_DWORD *)v4 + 6);
  self->_lOIInContext = *((_BYTE *)v4 + 149);
  self->_lowConfidenceRuleCount = *((_DWORD *)v4 + 7);
  self->_mediumConfidenceRuleCount = *((_DWORD *)v4 + 8);
  self->_photoContactContainingRuleCount = *((_DWORD *)v4 + 9);
  self->_photoContactInContext = *((_DWORD *)v4 + 10);
  self->_photoContactRulesCardinality = *((_DWORD *)v4 + 13);
  self->_photoSceneContainingRuleCount = *((_DWORD *)v4 + 14);
  self->_photoSceneInContext = *((_DWORD *)v4 + 15);
  self->_photoSceneRulesCardinality = *((_DWORD *)v4 + 18);
  self->_sourceBundleIdContainingRuleCount = *((_DWORD *)v4 + 22);
  self->_sourceBundleIdInContext = *((_BYTE *)v4 + 154);
  self->_sourceBundleIdRulesCardinality = *((_DWORD *)v4 + 23);
  self->_targetBundleIdContainingRuleCount = *((_DWORD *)v4 + 26);
  self->_targetBundleIdInContext = *((_BYTE *)v4 + 158);
  self->_targetBundleIdRulesCardinality = *((_DWORD *)v4 + 27);
  self->_totalMessagesRecieved = *((_DWORD *)v4 + 30);
  self->_totalMessagesSent = *((_DWORD *)v4 + 31);
  self->_totalShares = *((_DWORD *)v4 + 32);
  v7 = v4;
  if (*((_QWORD *)v4 + 17))
  {
    -[CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent setUniqueShareEventIdentifier:](self, "setUniqueShareEventIdentifier:");
    v4 = v7;
  }
  self->_utiTypeInContext = *((_BYTE *)v4 + 166);
  if (*((_QWORD *)v4 + 1))
  {
    -[CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent setConfidence:](self, "setConfidence:");
    v4 = v7;
  }
  self->_contentUrlInRule = *((_BYTE *)v4 + 145);
  self->_contentUrlOverlap = *((_BYTE *)v4 + 146);
  self->_isWeekendInRule = *((_BYTE *)v4 + 147);
  self->_isWeekendOverlap = *((_BYTE *)v4 + 148);
  self->_lOIInRule = *((_BYTE *)v4 + 150);
  self->_lOIOverlap = *((_BYTE *)v4 + 151);
  v5 = *((_BYTE *)v4 + 172);
  if ((v5 & 4) != 0)
  {
    self->_personAndAppMatched = *((_BYTE *)v4 + 152);
    *(_BYTE *)&self->_has |= 4u;
    v5 = *((_BYTE *)v4 + 172);
  }
  if ((v5 & 8) != 0)
  {
    self->_personMatched = *((_BYTE *)v4 + 153);
    *(_BYTE *)&self->_has |= 8u;
  }
  self->_photoContactInRule = *((_DWORD *)v4 + 11);
  self->_photoContactOverlap = *((_DWORD *)v4 + 12);
  self->_photoSceneInRule = *((_DWORD *)v4 + 16);
  self->_photoSceneOverlap = *((_DWORD *)v4 + 17);
  self->_sourceBundleIdInRule = *((_BYTE *)v4 + 155);
  self->_sourceBundleIdOverlap = *((_BYTE *)v4 + 156);
  if (*((_QWORD *)v4 + 12))
  {
    -[CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent setSupport:](self, "setSupport:");
    v4 = v7;
  }
  self->_targetBundleIDInConsequent = *((_BYTE *)v4 + 157);
  self->_targetBundleIdInRule = *((_BYTE *)v4 + 159);
  self->_targetBundleIdOverlap = *((_BYTE *)v4 + 160);
  self->_timeOfDaySlotInRule = *((_BYTE *)v4 + 161);
  self->_timeOfDaySlotOverlap = *((_BYTE *)v4 + 162);
  self->_utiTypeInRule = *((_BYTE *)v4 + 167);
  self->_utiTypeOverlap = *((_BYTE *)v4 + 168);
  if (*((_QWORD *)v4 + 10))
  {
    -[CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent setSessionId:](self, "setSessionId:");
    v4 = v7;
  }
  v6 = *((_BYTE *)v4 + 172);
  if ((v6 & 2) != 0)
  {
    self->_topicRulesCardinality = *((_DWORD *)v4 + 29);
    *(_BYTE *)&self->_has |= 2u;
    v6 = *((_BYTE *)v4 + 172);
    if ((v6 & 1) == 0)
    {
LABEL_15:
      if ((v6 & 0x40) == 0)
        goto LABEL_16;
      goto LABEL_22;
    }
  }
  else if ((*((_BYTE *)v4 + 172) & 1) == 0)
  {
    goto LABEL_15;
  }
  self->_topicContainingRuleCount = *((_DWORD *)v4 + 28);
  *(_BYTE *)&self->_has |= 1u;
  v6 = *((_BYTE *)v4 + 172);
  if ((v6 & 0x40) == 0)
  {
LABEL_16:
    if ((v6 & 0x10) == 0)
      goto LABEL_17;
LABEL_23:
    self->_topicInContext = *((_BYTE *)v4 + 163);
    *(_BYTE *)&self->_has |= 0x10u;
    if ((*((_BYTE *)v4 + 172) & 0x20) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
LABEL_22:
  self->_topicOverlap = *((_BYTE *)v4 + 165);
  *(_BYTE *)&self->_has |= 0x40u;
  v6 = *((_BYTE *)v4 + 172);
  if ((v6 & 0x10) != 0)
    goto LABEL_23;
LABEL_17:
  if ((v6 & 0x20) != 0)
  {
LABEL_18:
    self->_topicInRule = *((_BYTE *)v4 + 164);
    *(_BYTE *)&self->_has |= 0x20u;
  }
LABEL_19:

}

- (BOOL)contentUrlInContext
{
  return self->_contentUrlInContext;
}

- (void)setContentUrlInContext:(BOOL)a3
{
  self->_contentUrlInContext = a3;
}

- (unsigned)highConfidenceRuleCount
{
  return self->_highConfidenceRuleCount;
}

- (void)setHighConfidenceRuleCount:(unsigned int)a3
{
  self->_highConfidenceRuleCount = a3;
}

- (unsigned)locationOfInterestContainingRuleCount
{
  return self->_locationOfInterestContainingRuleCount;
}

- (void)setLocationOfInterestContainingRuleCount:(unsigned int)a3
{
  self->_locationOfInterestContainingRuleCount = a3;
}

- (unsigned)locationOfInterestRulesCardinality
{
  return self->_locationOfInterestRulesCardinality;
}

- (void)setLocationOfInterestRulesCardinality:(unsigned int)a3
{
  self->_locationOfInterestRulesCardinality = a3;
}

- (BOOL)lOIInContext
{
  return self->_lOIInContext;
}

- (void)setLOIInContext:(BOOL)a3
{
  self->_lOIInContext = a3;
}

- (unsigned)lowConfidenceRuleCount
{
  return self->_lowConfidenceRuleCount;
}

- (void)setLowConfidenceRuleCount:(unsigned int)a3
{
  self->_lowConfidenceRuleCount = a3;
}

- (unsigned)mediumConfidenceRuleCount
{
  return self->_mediumConfidenceRuleCount;
}

- (void)setMediumConfidenceRuleCount:(unsigned int)a3
{
  self->_mediumConfidenceRuleCount = a3;
}

- (unsigned)photoContactContainingRuleCount
{
  return self->_photoContactContainingRuleCount;
}

- (void)setPhotoContactContainingRuleCount:(unsigned int)a3
{
  self->_photoContactContainingRuleCount = a3;
}

- (unsigned)photoContactInContext
{
  return self->_photoContactInContext;
}

- (void)setPhotoContactInContext:(unsigned int)a3
{
  self->_photoContactInContext = a3;
}

- (unsigned)photoContactRulesCardinality
{
  return self->_photoContactRulesCardinality;
}

- (void)setPhotoContactRulesCardinality:(unsigned int)a3
{
  self->_photoContactRulesCardinality = a3;
}

- (unsigned)photoSceneContainingRuleCount
{
  return self->_photoSceneContainingRuleCount;
}

- (void)setPhotoSceneContainingRuleCount:(unsigned int)a3
{
  self->_photoSceneContainingRuleCount = a3;
}

- (unsigned)photoSceneInContext
{
  return self->_photoSceneInContext;
}

- (void)setPhotoSceneInContext:(unsigned int)a3
{
  self->_photoSceneInContext = a3;
}

- (unsigned)photoSceneRulesCardinality
{
  return self->_photoSceneRulesCardinality;
}

- (void)setPhotoSceneRulesCardinality:(unsigned int)a3
{
  self->_photoSceneRulesCardinality = a3;
}

- (unsigned)sourceBundleIdContainingRuleCount
{
  return self->_sourceBundleIdContainingRuleCount;
}

- (void)setSourceBundleIdContainingRuleCount:(unsigned int)a3
{
  self->_sourceBundleIdContainingRuleCount = a3;
}

- (BOOL)sourceBundleIdInContext
{
  return self->_sourceBundleIdInContext;
}

- (void)setSourceBundleIdInContext:(BOOL)a3
{
  self->_sourceBundleIdInContext = a3;
}

- (unsigned)sourceBundleIdRulesCardinality
{
  return self->_sourceBundleIdRulesCardinality;
}

- (void)setSourceBundleIdRulesCardinality:(unsigned int)a3
{
  self->_sourceBundleIdRulesCardinality = a3;
}

- (unsigned)targetBundleIdContainingRuleCount
{
  return self->_targetBundleIdContainingRuleCount;
}

- (void)setTargetBundleIdContainingRuleCount:(unsigned int)a3
{
  self->_targetBundleIdContainingRuleCount = a3;
}

- (BOOL)targetBundleIdInContext
{
  return self->_targetBundleIdInContext;
}

- (void)setTargetBundleIdInContext:(BOOL)a3
{
  self->_targetBundleIdInContext = a3;
}

- (unsigned)targetBundleIdRulesCardinality
{
  return self->_targetBundleIdRulesCardinality;
}

- (void)setTargetBundleIdRulesCardinality:(unsigned int)a3
{
  self->_targetBundleIdRulesCardinality = a3;
}

- (unsigned)totalMessagesRecieved
{
  return self->_totalMessagesRecieved;
}

- (void)setTotalMessagesRecieved:(unsigned int)a3
{
  self->_totalMessagesRecieved = a3;
}

- (unsigned)totalMessagesSent
{
  return self->_totalMessagesSent;
}

- (void)setTotalMessagesSent:(unsigned int)a3
{
  self->_totalMessagesSent = a3;
}

- (unsigned)totalShares
{
  return self->_totalShares;
}

- (void)setTotalShares:(unsigned int)a3
{
  self->_totalShares = a3;
}

- (NSString)uniqueShareEventIdentifier
{
  return self->_uniqueShareEventIdentifier;
}

- (void)setUniqueShareEventIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_uniqueShareEventIdentifier, a3);
}

- (BOOL)utiTypeInContext
{
  return self->_utiTypeInContext;
}

- (void)setUtiTypeInContext:(BOOL)a3
{
  self->_utiTypeInContext = a3;
}

- (NSString)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(id)a3
{
  objc_storeStrong((id *)&self->_confidence, a3);
}

- (BOOL)contentUrlInRule
{
  return self->_contentUrlInRule;
}

- (void)setContentUrlInRule:(BOOL)a3
{
  self->_contentUrlInRule = a3;
}

- (BOOL)contentUrlOverlap
{
  return self->_contentUrlOverlap;
}

- (void)setContentUrlOverlap:(BOOL)a3
{
  self->_contentUrlOverlap = a3;
}

- (BOOL)isWeekendInRule
{
  return self->_isWeekendInRule;
}

- (void)setIsWeekendInRule:(BOOL)a3
{
  self->_isWeekendInRule = a3;
}

- (BOOL)isWeekendOverlap
{
  return self->_isWeekendOverlap;
}

- (void)setIsWeekendOverlap:(BOOL)a3
{
  self->_isWeekendOverlap = a3;
}

- (BOOL)lOIInRule
{
  return self->_lOIInRule;
}

- (void)setLOIInRule:(BOOL)a3
{
  self->_lOIInRule = a3;
}

- (BOOL)lOIOverlap
{
  return self->_lOIOverlap;
}

- (void)setLOIOverlap:(BOOL)a3
{
  self->_lOIOverlap = a3;
}

- (BOOL)personAndAppMatched
{
  return self->_personAndAppMatched;
}

- (BOOL)personMatched
{
  return self->_personMatched;
}

- (unsigned)photoContactInRule
{
  return self->_photoContactInRule;
}

- (void)setPhotoContactInRule:(unsigned int)a3
{
  self->_photoContactInRule = a3;
}

- (unsigned)photoContactOverlap
{
  return self->_photoContactOverlap;
}

- (void)setPhotoContactOverlap:(unsigned int)a3
{
  self->_photoContactOverlap = a3;
}

- (unsigned)photoSceneInRule
{
  return self->_photoSceneInRule;
}

- (void)setPhotoSceneInRule:(unsigned int)a3
{
  self->_photoSceneInRule = a3;
}

- (unsigned)photoSceneOverlap
{
  return self->_photoSceneOverlap;
}

- (void)setPhotoSceneOverlap:(unsigned int)a3
{
  self->_photoSceneOverlap = a3;
}

- (BOOL)sourceBundleIdInRule
{
  return self->_sourceBundleIdInRule;
}

- (void)setSourceBundleIdInRule:(BOOL)a3
{
  self->_sourceBundleIdInRule = a3;
}

- (BOOL)sourceBundleIdOverlap
{
  return self->_sourceBundleIdOverlap;
}

- (void)setSourceBundleIdOverlap:(BOOL)a3
{
  self->_sourceBundleIdOverlap = a3;
}

- (NSString)support
{
  return self->_support;
}

- (void)setSupport:(id)a3
{
  objc_storeStrong((id *)&self->_support, a3);
}

- (BOOL)targetBundleIDInConsequent
{
  return self->_targetBundleIDInConsequent;
}

- (void)setTargetBundleIDInConsequent:(BOOL)a3
{
  self->_targetBundleIDInConsequent = a3;
}

- (BOOL)targetBundleIdInRule
{
  return self->_targetBundleIdInRule;
}

- (void)setTargetBundleIdInRule:(BOOL)a3
{
  self->_targetBundleIdInRule = a3;
}

- (BOOL)targetBundleIdOverlap
{
  return self->_targetBundleIdOverlap;
}

- (void)setTargetBundleIdOverlap:(BOOL)a3
{
  self->_targetBundleIdOverlap = a3;
}

- (BOOL)timeOfDaySlotInRule
{
  return self->_timeOfDaySlotInRule;
}

- (void)setTimeOfDaySlotInRule:(BOOL)a3
{
  self->_timeOfDaySlotInRule = a3;
}

- (BOOL)timeOfDaySlotOverlap
{
  return self->_timeOfDaySlotOverlap;
}

- (void)setTimeOfDaySlotOverlap:(BOOL)a3
{
  self->_timeOfDaySlotOverlap = a3;
}

- (BOOL)utiTypeInRule
{
  return self->_utiTypeInRule;
}

- (void)setUtiTypeInRule:(BOOL)a3
{
  self->_utiTypeInRule = a3;
}

- (BOOL)utiTypeOverlap
{
  return self->_utiTypeOverlap;
}

- (void)setUtiTypeOverlap:(BOOL)a3
{
  self->_utiTypeOverlap = a3;
}

- (NSString)sessionId
{
  return self->_sessionId;
}

- (void)setSessionId:(id)a3
{
  objc_storeStrong((id *)&self->_sessionId, a3);
}

- (unsigned)topicRulesCardinality
{
  return self->_topicRulesCardinality;
}

- (unsigned)topicContainingRuleCount
{
  return self->_topicContainingRuleCount;
}

- (BOOL)topicOverlap
{
  return self->_topicOverlap;
}

- (BOOL)topicInContext
{
  return self->_topicInContext;
}

- (BOOL)topicInRule
{
  return self->_topicInRule;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueShareEventIdentifier, 0);
  objc_storeStrong((id *)&self->_support, 0);
  objc_storeStrong((id *)&self->_sessionId, 0);
  objc_storeStrong((id *)&self->_confidence, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent writeTo:]", "CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent.m", 659, "nil != self->_uniqueShareEventIdentifier");
}

- (void)writeTo:.cold.2()
{
  __assert_rtn("-[CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent writeTo:]", "CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent.m", 668, "nil != self->_confidence");
}

- (void)writeTo:.cold.3()
{
  __assert_rtn("-[CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent writeTo:]", "CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent.m", 735, "nil != self->_support");
}

@end
