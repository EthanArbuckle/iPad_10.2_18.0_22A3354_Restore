@implementation INFERENCESchemaINFERENCECRRTrainingSampleCollected

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
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  int v22;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)INFERENCESchemaINFERENCECRRTrainingSampleCollected;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v24, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[INFERENCESchemaINFERENCECRRTrainingSampleCollected resolverConfig](self, "resolverConfig");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[INFERENCESchemaINFERENCECRRTrainingSampleCollected deleteResolverConfig](self, "deleteResolverConfig");
  -[INFERENCESchemaINFERENCECRRTrainingSampleCollected trialEnrollment](self, "trialEnrollment");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[INFERENCESchemaINFERENCECRRTrainingSampleCollected deleteTrialEnrollment](self, "deleteTrialEnrollment");
  -[INFERENCESchemaINFERENCECRRTrainingSampleCollected matches](self, "matches");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v12, v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[INFERENCESchemaINFERENCECRRTrainingSampleCollected setMatches:](self, "setMatches:", v13);

  -[INFERENCESchemaINFERENCECRRTrainingSampleCollected forcePrompt](self, "forcePrompt");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "applySensitiveConditionsPolicy:", v4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "suppressMessage");

  if (v16)
    -[INFERENCESchemaINFERENCECRRTrainingSampleCollected deleteForcePrompt](self, "deleteForcePrompt");
  -[INFERENCESchemaINFERENCECRRTrainingSampleCollected interactionContext](self, "interactionContext");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "applySensitiveConditionsPolicy:", v4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "suppressMessage");

  if (v19)
    -[INFERENCESchemaINFERENCECRRTrainingSampleCollected deleteInteractionContext](self, "deleteInteractionContext");
  -[INFERENCESchemaINFERENCECRRTrainingSampleCollected crrCommsAppSelectionJointId](self, "crrCommsAppSelectionJointId");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "applySensitiveConditionsPolicy:", v4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "suppressMessage");

  if (v22)
    -[INFERENCESchemaINFERENCECRRTrainingSampleCollected deleteCrrCommsAppSelectionJointId](self, "deleteCrrCommsAppSelectionJointId");

  return v5;
}

- (BOOL)hasIntentTypeName
{
  return self->_intentTypeName != 0;
}

- (void)deleteIntentTypeName
{
  -[INFERENCESchemaINFERENCECRRTrainingSampleCollected setIntentTypeName:](self, "setIntentTypeName:", 0);
}

- (BOOL)hasResolverConfig
{
  return self->_resolverConfig != 0;
}

- (void)deleteResolverConfig
{
  -[INFERENCESchemaINFERENCECRRTrainingSampleCollected setResolverConfig:](self, "setResolverConfig:", 0);
}

- (BOOL)hasTrialEnrollment
{
  return self->_trialEnrollment != 0;
}

- (void)deleteTrialEnrollment
{
  -[INFERENCESchemaINFERENCECRRTrainingSampleCollected setTrialEnrollment:](self, "setTrialEnrollment:", 0);
}

- (BOOL)hasModelVersion
{
  return self->_modelVersion != 0;
}

- (void)deleteModelVersion
{
  -[INFERENCESchemaINFERENCECRRTrainingSampleCollected setModelVersion:](self, "setModelVersion:", 0);
}

- (void)clearMatches
{
  -[NSArray removeAllObjects](self->_matches, "removeAllObjects");
}

- (void)addMatches:(id)a3
{
  id v4;
  NSArray *matches;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  matches = self->_matches;
  v8 = v4;
  if (!matches)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_matches;
    self->_matches = v6;

    v4 = v8;
    matches = self->_matches;
  }
  -[NSArray addObject:](matches, "addObject:", v4);

}

- (unint64_t)matchesCount
{
  return -[NSArray count](self->_matches, "count");
}

- (id)matchesAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_matches, "objectAtIndexedSubscript:", a3);
}

- (void)setResolutionState:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_resolutionState = a3;
}

- (BOOL)hasResolutionState
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasResolutionState:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteResolutionState
{
  -[INFERENCESchemaINFERENCECRRTrainingSampleCollected setResolutionState:](self, "setResolutionState:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setResolutionType:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_resolutionType = a3;
}

- (BOOL)hasResolutionType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasResolutionType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteResolutionType
{
  -[INFERENCESchemaINFERENCECRRTrainingSampleCollected setResolutionType:](self, "setResolutionType:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)hasForcePrompt
{
  return self->_forcePrompt != 0;
}

- (void)deleteForcePrompt
{
  -[INFERENCESchemaINFERENCECRRTrainingSampleCollected setForcePrompt:](self, "setForcePrompt:", 0);
}

- (void)clearAnonymizedContactIdentifiers
{
  -[NSArray removeAllObjects](self->_anonymizedContactIdentifiers, "removeAllObjects");
}

- (void)addAnonymizedContactIdentifiers:(id)a3
{
  id v4;
  NSArray *anonymizedContactIdentifiers;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  anonymizedContactIdentifiers = self->_anonymizedContactIdentifiers;
  v8 = v4;
  if (!anonymizedContactIdentifiers)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_anonymizedContactIdentifiers;
    self->_anonymizedContactIdentifiers = v6;

    v4 = v8;
    anonymizedContactIdentifiers = self->_anonymizedContactIdentifiers;
  }
  -[NSArray addObject:](anonymizedContactIdentifiers, "addObject:", v4);

}

- (unint64_t)anonymizedContactIdentifiersCount
{
  return -[NSArray count](self->_anonymizedContactIdentifiers, "count");
}

- (id)anonymizedContactIdentifiersAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_anonymizedContactIdentifiers, "objectAtIndexedSubscript:", a3);
}

- (void)setIsInteractionExecuted:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_isInteractionExecuted = a3;
}

- (BOOL)hasIsInteractionExecuted
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasIsInteractionExecuted:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteIsInteractionExecuted
{
  -[INFERENCESchemaINFERENCECRRTrainingSampleCollected setIsInteractionExecuted:](self, "setIsInteractionExecuted:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (void)setIsInteractionSuccess:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_isInteractionSuccess = a3;
}

- (BOOL)hasIsInteractionSuccess
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasIsInteractionSuccess:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)deleteIsInteractionSuccess
{
  -[INFERENCESchemaINFERENCECRRTrainingSampleCollected setIsInteractionSuccess:](self, "setIsInteractionSuccess:", 0);
  *(_BYTE *)&self->_has &= ~8u;
}

- (void)setInteractionDurationInSecBucket:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_interactionDurationInSecBucket = a3;
}

- (BOOL)hasInteractionDurationInSecBucket
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setHasInteractionDurationInSecBucket:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (void)deleteInteractionDurationInSecBucket
{
  -[INFERENCESchemaINFERENCECRRTrainingSampleCollected setInteractionDurationInSecBucket:](self, "setInteractionDurationInSecBucket:", 0);
  *(_BYTE *)&self->_has &= ~0x10u;
}

- (BOOL)hasInteractionContext
{
  return self->_interactionContext != 0;
}

- (void)deleteInteractionContext
{
  -[INFERENCESchemaINFERENCECRRTrainingSampleCollected setInteractionContext:](self, "setInteractionContext:", 0);
}

- (void)setIsPlusContactSuggesterEnabled:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_isPlusContactSuggesterEnabled = a3;
}

- (BOOL)hasIsPlusContactSuggesterEnabled
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setHasIsPlusContactSuggesterEnabled:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (void)deleteIsPlusContactSuggesterEnabled
{
  -[INFERENCESchemaINFERENCECRRTrainingSampleCollected setIsPlusContactSuggesterEnabled:](self, "setIsPlusContactSuggesterEnabled:", 0);
  *(_BYTE *)&self->_has &= ~0x20u;
}

- (void)setIsEntityCandidateRetrievalEnabled:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_isEntityCandidateRetrievalEnabled = a3;
}

- (BOOL)hasIsEntityCandidateRetrievalEnabled
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setHasIsEntityCandidateRetrievalEnabled:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (void)deleteIsEntityCandidateRetrievalEnabled
{
  -[INFERENCESchemaINFERENCECRRTrainingSampleCollected setIsEntityCandidateRetrievalEnabled:](self, "setIsEntityCandidateRetrievalEnabled:", 0);
  *(_BYTE *)&self->_has &= ~0x40u;
}

- (BOOL)hasCrrCommsAppSelectionJointId
{
  return self->_crrCommsAppSelectionJointId != 0;
}

- (void)deleteCrrCommsAppSelectionJointId
{
  -[INFERENCESchemaINFERENCECRRTrainingSampleCollected setCrrCommsAppSelectionJointId:](self, "setCrrCommsAppSelectionJointId:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return INFERENCESchemaINFERENCECRRTrainingSampleCollectedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  char has;
  void *v17;
  void *v18;
  NSArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  char v24;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[INFERENCESchemaINFERENCECRRTrainingSampleCollected intentTypeName](self, "intentTypeName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  -[INFERENCESchemaINFERENCECRRTrainingSampleCollected resolverConfig](self, "resolverConfig");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[INFERENCESchemaINFERENCECRRTrainingSampleCollected resolverConfig](self, "resolverConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[INFERENCESchemaINFERENCECRRTrainingSampleCollected trialEnrollment](self, "trialEnrollment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[INFERENCESchemaINFERENCECRRTrainingSampleCollected trialEnrollment](self, "trialEnrollment");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[INFERENCESchemaINFERENCECRRTrainingSampleCollected modelVersion](self, "modelVersion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    PBDataWriterWriteStringField();
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v11 = self->_matches;
  v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v35 != v14)
          objc_enumerationMutation(v11);
        PBDataWriterWriteSubmessage();
      }
      v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    }
    while (v13);
  }

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteInt32Field();
  -[INFERENCESchemaINFERENCECRRTrainingSampleCollected forcePrompt](self, "forcePrompt");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[INFERENCESchemaINFERENCECRRTrainingSampleCollected forcePrompt](self, "forcePrompt");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v19 = self->_anonymizedContactIdentifiers;
  v20 = -[NSArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v31;
    do
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v31 != v22)
          objc_enumerationMutation(v19);
        PBDataWriterWriteStringField();
      }
      v21 = -[NSArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    }
    while (v21);
  }

  v24 = (char)self->_has;
  if ((v24 & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    v24 = (char)self->_has;
    if ((v24 & 8) == 0)
    {
LABEL_31:
      if ((v24 & 0x10) == 0)
        goto LABEL_33;
      goto LABEL_32;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_31;
  }
  PBDataWriterWriteBOOLField();
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
LABEL_32:
    PBDataWriterWriteUint32Field();
LABEL_33:
  -[INFERENCESchemaINFERENCECRRTrainingSampleCollected interactionContext](self, "interactionContext", v30);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    -[INFERENCESchemaINFERENCECRRTrainingSampleCollected interactionContext](self, "interactionContext");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v27 = (char)self->_has;
  if ((v27 & 0x20) != 0)
  {
    PBDataWriterWriteBOOLField();
    v27 = (char)self->_has;
  }
  if ((v27 & 0x40) != 0)
    PBDataWriterWriteBOOLField();
  -[INFERENCESchemaINFERENCECRRTrainingSampleCollected crrCommsAppSelectionJointId](self, "crrCommsAppSelectionJointId");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    -[INFERENCESchemaINFERENCECRRTrainingSampleCollected crrCommsAppSelectionJointId](self, "crrCommsAppSelectionJointId");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

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
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  $576FFE49FB491774B160AD4B4B208A6A has;
  unsigned int v33;
  int resolutionState;
  int v35;
  int resolutionType;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  int v46;
  $576FFE49FB491774B160AD4B4B208A6A v47;
  int v48;
  unsigned int v49;
  int isInteractionExecuted;
  int v51;
  int isInteractionSuccess;
  int v53;
  unsigned int interactionDurationInSecBucket;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  int v59;
  $576FFE49FB491774B160AD4B4B208A6A v60;
  int v61;
  unsigned int v62;
  int isPlusContactSuggesterEnabled;
  int v64;
  int isEntityCandidateRetrievalEnabled;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  char v70;
  BOOL v71;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_72;
  -[INFERENCESchemaINFERENCECRRTrainingSampleCollected intentTypeName](self, "intentTypeName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intentTypeName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_71;
  -[INFERENCESchemaINFERENCECRRTrainingSampleCollected intentTypeName](self, "intentTypeName");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[INFERENCESchemaINFERENCECRRTrainingSampleCollected intentTypeName](self, "intentTypeName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "intentTypeName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_72;
  }
  else
  {

  }
  -[INFERENCESchemaINFERENCECRRTrainingSampleCollected resolverConfig](self, "resolverConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resolverConfig");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_71;
  -[INFERENCESchemaINFERENCECRRTrainingSampleCollected resolverConfig](self, "resolverConfig");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[INFERENCESchemaINFERENCECRRTrainingSampleCollected resolverConfig](self, "resolverConfig");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "resolverConfig");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_72;
  }
  else
  {

  }
  -[INFERENCESchemaINFERENCECRRTrainingSampleCollected trialEnrollment](self, "trialEnrollment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trialEnrollment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_71;
  -[INFERENCESchemaINFERENCECRRTrainingSampleCollected trialEnrollment](self, "trialEnrollment");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[INFERENCESchemaINFERENCECRRTrainingSampleCollected trialEnrollment](self, "trialEnrollment");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "trialEnrollment");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_72;
  }
  else
  {

  }
  -[INFERENCESchemaINFERENCECRRTrainingSampleCollected modelVersion](self, "modelVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "modelVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_71;
  -[INFERENCESchemaINFERENCECRRTrainingSampleCollected modelVersion](self, "modelVersion");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[INFERENCESchemaINFERENCECRRTrainingSampleCollected modelVersion](self, "modelVersion");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "modelVersion");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_72;
  }
  else
  {

  }
  -[INFERENCESchemaINFERENCECRRTrainingSampleCollected matches](self, "matches");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "matches");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_71;
  -[INFERENCESchemaINFERENCECRRTrainingSampleCollected matches](self, "matches");
  v27 = objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v28 = (void *)v27;
    -[INFERENCESchemaINFERENCECRRTrainingSampleCollected matches](self, "matches");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "matches");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "isEqual:", v30);

    if (!v31)
      goto LABEL_72;
  }
  else
  {

  }
  has = self->_has;
  v33 = v4[104];
  if ((*(_BYTE *)&has & 1) != (v33 & 1))
    goto LABEL_72;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    resolutionState = self->_resolutionState;
    if (resolutionState != objc_msgSend(v4, "resolutionState"))
      goto LABEL_72;
    has = self->_has;
    v33 = v4[104];
  }
  v35 = (*(unsigned int *)&has >> 1) & 1;
  if (v35 != ((v33 >> 1) & 1))
    goto LABEL_72;
  if (v35)
  {
    resolutionType = self->_resolutionType;
    if (resolutionType != objc_msgSend(v4, "resolutionType"))
      goto LABEL_72;
  }
  -[INFERENCESchemaINFERENCECRRTrainingSampleCollected forcePrompt](self, "forcePrompt");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "forcePrompt");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_71;
  -[INFERENCESchemaINFERENCECRRTrainingSampleCollected forcePrompt](self, "forcePrompt");
  v37 = objc_claimAutoreleasedReturnValue();
  if (v37)
  {
    v38 = (void *)v37;
    -[INFERENCESchemaINFERENCECRRTrainingSampleCollected forcePrompt](self, "forcePrompt");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "forcePrompt");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v39, "isEqual:", v40);

    if (!v41)
      goto LABEL_72;
  }
  else
  {

  }
  -[INFERENCESchemaINFERENCECRRTrainingSampleCollected anonymizedContactIdentifiers](self, "anonymizedContactIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "anonymizedContactIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_71;
  -[INFERENCESchemaINFERENCECRRTrainingSampleCollected anonymizedContactIdentifiers](self, "anonymizedContactIdentifiers");
  v42 = objc_claimAutoreleasedReturnValue();
  if (v42)
  {
    v43 = (void *)v42;
    -[INFERENCESchemaINFERENCECRRTrainingSampleCollected anonymizedContactIdentifiers](self, "anonymizedContactIdentifiers");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "anonymizedContactIdentifiers");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v44, "isEqual:", v45);

    if (!v46)
      goto LABEL_72;
  }
  else
  {

  }
  v47 = self->_has;
  v48 = (*(unsigned int *)&v47 >> 2) & 1;
  v49 = v4[104];
  if (v48 != ((v49 >> 2) & 1))
    goto LABEL_72;
  if (v48)
  {
    isInteractionExecuted = self->_isInteractionExecuted;
    if (isInteractionExecuted != objc_msgSend(v4, "isInteractionExecuted"))
      goto LABEL_72;
    v47 = self->_has;
    v49 = v4[104];
  }
  v51 = (*(unsigned int *)&v47 >> 3) & 1;
  if (v51 != ((v49 >> 3) & 1))
    goto LABEL_72;
  if (v51)
  {
    isInteractionSuccess = self->_isInteractionSuccess;
    if (isInteractionSuccess != objc_msgSend(v4, "isInteractionSuccess"))
      goto LABEL_72;
    v47 = self->_has;
    v49 = v4[104];
  }
  v53 = (*(unsigned int *)&v47 >> 4) & 1;
  if (v53 != ((v49 >> 4) & 1))
    goto LABEL_72;
  if (v53)
  {
    interactionDurationInSecBucket = self->_interactionDurationInSecBucket;
    if (interactionDurationInSecBucket != objc_msgSend(v4, "interactionDurationInSecBucket"))
      goto LABEL_72;
  }
  -[INFERENCESchemaINFERENCECRRTrainingSampleCollected interactionContext](self, "interactionContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "interactionContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_71;
  -[INFERENCESchemaINFERENCECRRTrainingSampleCollected interactionContext](self, "interactionContext");
  v55 = objc_claimAutoreleasedReturnValue();
  if (v55)
  {
    v56 = (void *)v55;
    -[INFERENCESchemaINFERENCECRRTrainingSampleCollected interactionContext](self, "interactionContext");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "interactionContext");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = objc_msgSend(v57, "isEqual:", v58);

    if (!v59)
      goto LABEL_72;
  }
  else
  {

  }
  v60 = self->_has;
  v61 = (*(unsigned int *)&v60 >> 5) & 1;
  v62 = v4[104];
  if (v61 != ((v62 >> 5) & 1))
    goto LABEL_72;
  if (v61)
  {
    isPlusContactSuggesterEnabled = self->_isPlusContactSuggesterEnabled;
    if (isPlusContactSuggesterEnabled != objc_msgSend(v4, "isPlusContactSuggesterEnabled"))
      goto LABEL_72;
    v60 = self->_has;
    v62 = v4[104];
  }
  v64 = (*(unsigned int *)&v60 >> 6) & 1;
  if (v64 != ((v62 >> 6) & 1))
    goto LABEL_72;
  if (v64)
  {
    isEntityCandidateRetrievalEnabled = self->_isEntityCandidateRetrievalEnabled;
    if (isEntityCandidateRetrievalEnabled != objc_msgSend(v4, "isEntityCandidateRetrievalEnabled"))
      goto LABEL_72;
  }
  -[INFERENCESchemaINFERENCECRRTrainingSampleCollected crrCommsAppSelectionJointId](self, "crrCommsAppSelectionJointId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "crrCommsAppSelectionJointId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_71:

    goto LABEL_72;
  }
  -[INFERENCESchemaINFERENCECRRTrainingSampleCollected crrCommsAppSelectionJointId](self, "crrCommsAppSelectionJointId");
  v66 = objc_claimAutoreleasedReturnValue();
  if (!v66)
  {

LABEL_75:
    v71 = 1;
    goto LABEL_73;
  }
  v67 = (void *)v66;
  -[INFERENCESchemaINFERENCECRRTrainingSampleCollected crrCommsAppSelectionJointId](self, "crrCommsAppSelectionJointId");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "crrCommsAppSelectionJointId");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = objc_msgSend(v68, "isEqual:", v69);

  if ((v70 & 1) != 0)
    goto LABEL_75;
LABEL_72:
  v71 = 0;
LABEL_73:

  return v71;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  NSUInteger v15;
  unint64_t v16;
  unint64_t v17;
  NSUInteger v18;

  v18 = -[NSString hash](self->_intentTypeName, "hash");
  v17 = -[INFERENCESchemaINFERENCEContactResolverConfig hash](self->_resolverConfig, "hash");
  v16 = -[INFERENCESchemaINFERENCETrialEnrollment hash](self->_trialEnrollment, "hash");
  v15 = -[NSString hash](self->_modelVersion, "hash");
  v14 = -[NSArray hash](self->_matches, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v3 = 2654435761 * self->_resolutionState;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_resolutionType;
      goto LABEL_6;
    }
  }
  v4 = 0;
LABEL_6:
  v5 = -[INFERENCESchemaINFERENCEPromptContext hash](self->_forcePrompt, "hash");
  v6 = -[NSArray hash](self->_anonymizedContactIdentifiers, "hash");
  if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    v7 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_8;
LABEL_11:
    v8 = 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_9;
    goto LABEL_12;
  }
  v7 = 2654435761 * self->_isInteractionExecuted;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_11;
LABEL_8:
  v8 = 2654435761 * self->_isInteractionSuccess;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_9:
    v9 = 2654435761 * self->_interactionDurationInSecBucket;
    goto LABEL_13;
  }
LABEL_12:
  v9 = 0;
LABEL_13:
  v10 = -[INFERENCESchemaINFERENCEPotentialRetryContactInteractionContext hash](self->_interactionContext, "hash");
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    v11 = 2654435761 * self->_isPlusContactSuggesterEnabled;
    if ((*(_BYTE *)&self->_has & 0x40) != 0)
      goto LABEL_15;
LABEL_17:
    v12 = 0;
    return v17 ^ v18 ^ v16 ^ v15 ^ v14 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ -[SISchemaUUID hash](self->_crrCommsAppSelectionJointId, "hash");
  }
  v11 = 0;
  if ((*(_BYTE *)&self->_has & 0x40) == 0)
    goto LABEL_17;
LABEL_15:
  v12 = 2654435761 * self->_isEntityCandidateRetrievalEnabled;
  return v17 ^ v18 ^ v16 ^ v15 ^ v14 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ -[SISchemaUUID hash](self->_crrCommsAppSelectionJointId, "hash");
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
  char has;
  void *v18;
  void *v19;
  NSArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  unsigned int v30;
  const __CFString *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  unsigned int v36;
  const __CFString *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_anonymizedContactIdentifiers)
  {
    -[INFERENCESchemaINFERENCECRRTrainingSampleCollected anonymizedContactIdentifiers](self, "anonymizedContactIdentifiers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("anonymizedContactIdentifiers"));

  }
  if (self->_crrCommsAppSelectionJointId)
  {
    -[INFERENCESchemaINFERENCECRRTrainingSampleCollected crrCommsAppSelectionJointId](self, "crrCommsAppSelectionJointId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("crrCommsAppSelectionJointId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("crrCommsAppSelectionJointId"));

    }
  }
  if (self->_forcePrompt)
  {
    -[INFERENCESchemaINFERENCECRRTrainingSampleCollected forcePrompt](self, "forcePrompt");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("forcePrompt"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("forcePrompt"));

    }
  }
  if (self->_intentTypeName)
  {
    -[INFERENCESchemaINFERENCECRRTrainingSampleCollected intentTypeName](self, "intentTypeName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("intentTypeName"));

  }
  if (self->_interactionContext)
  {
    -[INFERENCESchemaINFERENCECRRTrainingSampleCollected interactionContext](self, "interactionContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dictionaryRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("interactionContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("interactionContext"));

    }
  }
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[INFERENCESchemaINFERENCECRRTrainingSampleCollected interactionDurationInSecBucket](self, "interactionDurationInSecBucket"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, CFSTR("interactionDurationInSecBucket"));

    has = (char)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_22:
      if ((has & 4) == 0)
        goto LABEL_23;
      goto LABEL_45;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x40) == 0)
  {
    goto LABEL_22;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCECRRTrainingSampleCollected isEntityCandidateRetrievalEnabled](self, "isEntityCandidateRetrievalEnabled"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, CFSTR("isEntityCandidateRetrievalEnabled"));

  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_23:
    if ((has & 8) == 0)
      goto LABEL_24;
    goto LABEL_46;
  }
LABEL_45:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCECRRTrainingSampleCollected isInteractionExecuted](self, "isInteractionExecuted"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v34, CFSTR("isInteractionExecuted"));

  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_24:
    if ((has & 0x20) == 0)
      goto LABEL_26;
    goto LABEL_25;
  }
LABEL_46:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCECRRTrainingSampleCollected isInteractionSuccess](self, "isInteractionSuccess"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v35, CFSTR("isInteractionSuccess"));

  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
LABEL_25:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCECRRTrainingSampleCollected isPlusContactSuggesterEnabled](self, "isPlusContactSuggesterEnabled"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("isPlusContactSuggesterEnabled"));

  }
LABEL_26:
  if (-[NSArray count](self->_matches, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v20 = self->_matches;
    v21 = -[NSArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v46;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v46 != v23)
            objc_enumerationMutation(v20);
          objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * i), "dictionaryRepresentation");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if (v25)
          {
            objc_msgSend(v19, "addObject:", v25);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "addObject:", v26);

          }
        }
        v22 = -[NSArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
      }
      while (v22);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("matches"));
  }
  if (self->_modelVersion)
  {
    -[INFERENCESchemaINFERENCECRRTrainingSampleCollected modelVersion](self, "modelVersion");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)objc_msgSend(v27, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v28, CFSTR("modelVersion"));

  }
  v29 = (char)self->_has;
  if ((v29 & 1) != 0)
  {
    v30 = -[INFERENCESchemaINFERENCECRRTrainingSampleCollected resolutionState](self, "resolutionState") - 1;
    if (v30 > 3)
      v31 = CFSTR("INFERENCERESOLUTIONSTATE_UNKNOWN");
    else
      v31 = off_1E562FA08[v30];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v31, CFSTR("resolutionState"));
    v29 = (char)self->_has;
  }
  if ((v29 & 2) != 0)
  {
    v36 = -[INFERENCESchemaINFERENCECRRTrainingSampleCollected resolutionType](self, "resolutionType") - 1;
    if (v36 > 4)
      v37 = CFSTR("INFERENCECONTACTRESOLUTIONTYPE_UNKNOWN");
    else
      v37 = off_1E562FA28[v36];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v37, CFSTR("resolutionType"));
  }
  if (self->_resolverConfig)
  {
    -[INFERENCESchemaINFERENCECRRTrainingSampleCollected resolverConfig](self, "resolverConfig");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "dictionaryRepresentation");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (v39)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v39, CFSTR("resolverConfig"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v40, CFSTR("resolverConfig"));

    }
  }
  if (self->_trialEnrollment)
  {
    -[INFERENCESchemaINFERENCECRRTrainingSampleCollected trialEnrollment](self, "trialEnrollment");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "dictionaryRepresentation");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    if (v42)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v42, CFSTR("trialEnrollment"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v43, CFSTR("trialEnrollment"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[INFERENCESchemaINFERENCECRRTrainingSampleCollected dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (INFERENCESchemaINFERENCECRRTrainingSampleCollected)initWithJSON:(id)a3
{
  void *v4;
  INFERENCESchemaINFERENCECRRTrainingSampleCollected *v5;
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
    self = -[INFERENCESchemaINFERENCECRRTrainingSampleCollected initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (INFERENCESchemaINFERENCECRRTrainingSampleCollected)initWithDictionary:(id)a3
{
  id v4;
  INFERENCESchemaINFERENCECRRTrainingSampleCollected *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  INFERENCESchemaINFERENCEContactResolverConfig *v9;
  uint64_t v10;
  INFERENCESchemaINFERENCETrialEnrollment *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  INFERENCESchemaINFERENCEContactMatch *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  INFERENCESchemaINFERENCEPromptContext *v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  INFERENCESchemaINFERENCEPotentialRetryContactInteractionContext *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  SISchemaUUID *v43;
  INFERENCESchemaINFERENCECRRTrainingSampleCollected *v44;
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
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  objc_super v64;
  _BYTE v65[128];
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v64.receiver = self;
  v64.super_class = (Class)INFERENCESchemaINFERENCECRRTrainingSampleCollected;
  v5 = -[INFERENCESchemaINFERENCECRRTrainingSampleCollected init](&v64, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("intentTypeName"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[INFERENCESchemaINFERENCECRRTrainingSampleCollected setIntentTypeName:](v5, "setIntentTypeName:", v7);

    }
    v53 = v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("resolverConfig"));
    v8 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[INFERENCESchemaINFERENCEContactResolverConfig initWithDictionary:]([INFERENCESchemaINFERENCEContactResolverConfig alloc], "initWithDictionary:", v8);
      -[INFERENCESchemaINFERENCECRRTrainingSampleCollected setResolverConfig:](v5, "setResolverConfig:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("trialEnrollment"));
    v10 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[INFERENCESchemaINFERENCETrialEnrollment initWithDictionary:]([INFERENCESchemaINFERENCETrialEnrollment alloc], "initWithDictionary:", v10);
      -[INFERENCESchemaINFERENCECRRTrainingSampleCollected setTrialEnrollment:](v5, "setTrialEnrollment:", v11);

    }
    v51 = (void *)v10;
    v52 = (void *)v8;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("modelVersion"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = (void *)objc_msgSend(v12, "copy");
      -[INFERENCESchemaINFERENCECRRTrainingSampleCollected setModelVersion:](v5, "setModelVersion:", v13);

    }
    v50 = v12;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("matches"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v55 = v14;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v62 = 0u;
      v63 = 0u;
      v60 = 0u;
      v61 = 0u;
      v15 = v14;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v60, v66, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v61;
        do
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v61 != v18)
              objc_enumerationMutation(v15);
            v20 = *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v21 = -[INFERENCESchemaINFERENCEContactMatch initWithDictionary:]([INFERENCESchemaINFERENCEContactMatch alloc], "initWithDictionary:", v20);
              -[INFERENCESchemaINFERENCECRRTrainingSampleCollected addMatches:](v5, "addMatches:", v21);

            }
          }
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v60, v66, 16);
        }
        while (v17);
      }

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("resolutionState"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECRRTrainingSampleCollected setResolutionState:](v5, "setResolutionState:", objc_msgSend(v22, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("resolutionType"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECRRTrainingSampleCollected setResolutionType:](v5, "setResolutionType:", objc_msgSend(v23, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("forcePrompt"));
    v24 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v54 = (void *)v24;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v25 = -[INFERENCESchemaINFERENCEPromptContext initWithDictionary:]([INFERENCESchemaINFERENCEPromptContext alloc], "initWithDictionary:", v24);
      -[INFERENCESchemaINFERENCECRRTrainingSampleCollected setForcePrompt:](v5, "setForcePrompt:", v25);

    }
    v48 = v23;
    v49 = v22;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("anonymizedContactIdentifiers"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v58 = 0u;
      v59 = 0u;
      v56 = 0u;
      v57 = 0u;
      v46 = v26;
      v27 = v26;
      v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v56, v65, 16);
      if (v28)
      {
        v29 = v28;
        v30 = *(_QWORD *)v57;
        do
        {
          for (j = 0; j != v29; ++j)
          {
            if (*(_QWORD *)v57 != v30)
              objc_enumerationMutation(v27);
            v32 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * j);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v33 = (void *)objc_msgSend(v32, "copy");
              -[INFERENCESchemaINFERENCECRRTrainingSampleCollected addAnonymizedContactIdentifiers:](v5, "addAnonymizedContactIdentifiers:", v33);

            }
          }
          v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v56, v65, 16);
        }
        while (v29);
      }

      v26 = v46;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isInteractionExecuted"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECRRTrainingSampleCollected setIsInteractionExecuted:](v5, "setIsInteractionExecuted:", objc_msgSend(v34, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isInteractionSuccess"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECRRTrainingSampleCollected setIsInteractionSuccess:](v5, "setIsInteractionSuccess:", objc_msgSend(v35, "BOOLValue"));
    v47 = v34;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("interactionDurationInSecBucket"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECRRTrainingSampleCollected setInteractionDurationInSecBucket:](v5, "setInteractionDurationInSecBucket:", objc_msgSend(v36, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("interactionContext"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v38 = -[INFERENCESchemaINFERENCEPotentialRetryContactInteractionContext initWithDictionary:]([INFERENCESchemaINFERENCEPotentialRetryContactInteractionContext alloc], "initWithDictionary:", v37);
      -[INFERENCESchemaINFERENCECRRTrainingSampleCollected setInteractionContext:](v5, "setInteractionContext:", v38);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isPlusContactSuggesterEnabled"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECRRTrainingSampleCollected setIsPlusContactSuggesterEnabled:](v5, "setIsPlusContactSuggesterEnabled:", objc_msgSend(v39, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isEntityCandidateRetrievalEnabled"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECRRTrainingSampleCollected setIsEntityCandidateRetrievalEnabled:](v5, "setIsEntityCandidateRetrievalEnabled:", objc_msgSend(v40, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("crrCommsAppSelectionJointId"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v42 = v26;
      v43 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v41);
      -[INFERENCESchemaINFERENCECRRTrainingSampleCollected setCrrCommsAppSelectionJointId:](v5, "setCrrCommsAppSelectionJointId:", v43);

      v26 = v42;
    }
    v44 = v5;

  }
  return v5;
}

- (NSString)intentTypeName
{
  return self->_intentTypeName;
}

- (void)setIntentTypeName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (INFERENCESchemaINFERENCEContactResolverConfig)resolverConfig
{
  return self->_resolverConfig;
}

- (void)setResolverConfig:(id)a3
{
  objc_storeStrong((id *)&self->_resolverConfig, a3);
}

- (INFERENCESchemaINFERENCETrialEnrollment)trialEnrollment
{
  return self->_trialEnrollment;
}

- (void)setTrialEnrollment:(id)a3
{
  objc_storeStrong((id *)&self->_trialEnrollment, a3);
}

- (NSString)modelVersion
{
  return self->_modelVersion;
}

- (void)setModelVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)matches
{
  return self->_matches;
}

- (void)setMatches:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (int)resolutionState
{
  return self->_resolutionState;
}

- (int)resolutionType
{
  return self->_resolutionType;
}

- (INFERENCESchemaINFERENCEPromptContext)forcePrompt
{
  return self->_forcePrompt;
}

- (void)setForcePrompt:(id)a3
{
  objc_storeStrong((id *)&self->_forcePrompt, a3);
}

- (NSArray)anonymizedContactIdentifiers
{
  return self->_anonymizedContactIdentifiers;
}

- (void)setAnonymizedContactIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BOOL)isInteractionExecuted
{
  return self->_isInteractionExecuted;
}

- (BOOL)isInteractionSuccess
{
  return self->_isInteractionSuccess;
}

- (unsigned)interactionDurationInSecBucket
{
  return self->_interactionDurationInSecBucket;
}

- (INFERENCESchemaINFERENCEPotentialRetryContactInteractionContext)interactionContext
{
  return self->_interactionContext;
}

- (void)setInteractionContext:(id)a3
{
  objc_storeStrong((id *)&self->_interactionContext, a3);
}

- (BOOL)isPlusContactSuggesterEnabled
{
  return self->_isPlusContactSuggesterEnabled;
}

- (BOOL)isEntityCandidateRetrievalEnabled
{
  return self->_isEntityCandidateRetrievalEnabled;
}

- (SISchemaUUID)crrCommsAppSelectionJointId
{
  return self->_crrCommsAppSelectionJointId;
}

- (void)setCrrCommsAppSelectionJointId:(id)a3
{
  objc_storeStrong((id *)&self->_crrCommsAppSelectionJointId, a3);
}

- (void)setHasIntentTypeName:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasResolverConfig:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void)setHasTrialEnrollment:(BOOL)a3
{
  *((_BYTE *)&self->_has + 3) = a3;
}

- (void)setHasModelVersion:(BOOL)a3
{
  self->_hasIntentTypeName = a3;
}

- (void)setHasForcePrompt:(BOOL)a3
{
  self->_hasResolverConfig = a3;
}

- (void)setHasInteractionContext:(BOOL)a3
{
  self->_hasTrialEnrollment = a3;
}

- (void)setHasCrrCommsAppSelectionJointId:(BOOL)a3
{
  self->_hasModelVersion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_crrCommsAppSelectionJointId, 0);
  objc_storeStrong((id *)&self->_interactionContext, 0);
  objc_storeStrong((id *)&self->_anonymizedContactIdentifiers, 0);
  objc_storeStrong((id *)&self->_forcePrompt, 0);
  objc_storeStrong((id *)&self->_matches, 0);
  objc_storeStrong((id *)&self->_modelVersion, 0);
  objc_storeStrong((id *)&self->_trialEnrollment, 0);
  objc_storeStrong((id *)&self->_resolverConfig, 0);
  objc_storeStrong((id *)&self->_intentTypeName, 0);
}

@end
