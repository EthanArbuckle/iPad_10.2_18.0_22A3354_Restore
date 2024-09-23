@implementation ASRSchemaASRPackageGenerated

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
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ASRSchemaASRPackageGenerated;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v10, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isConditionSet:", 8))
    -[ASRSchemaASRPackageGenerated deleteLoggableSharedUserId](self, "deleteLoggableSharedUserId");
  -[ASRSchemaASRPackageGenerated package](self, "package");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[ASRSchemaASRPackageGenerated deletePackage](self, "deletePackage");

  return v5;
}

- (BOOL)hasPackage
{
  return self->_package != 0;
}

- (void)deletePackage
{
  -[ASRSchemaASRPackageGenerated setPackage:](self, "setPackage:", 0);
}

- (void)setIsFinal:(BOOL)a3
{
  *(&self->_hasNoVoiceCommandAfterRespeakCheck + 1) |= 1u;
  self->_isFinal = a3;
}

- (BOOL)hasIsFinal
{
  return *(&self->_hasNoVoiceCommandAfterRespeakCheck + 1);
}

- (void)setHasIsFinal:(BOOL)a3
{
  *(&self->_hasNoVoiceCommandAfterRespeakCheck + 1) = *(&self->_hasNoVoiceCommandAfterRespeakCheck + 1) & 0xFE | a3;
}

- (void)deleteIsFinal
{
  -[ASRSchemaASRPackageGenerated setIsFinal:](self, "setIsFinal:", 0);
  *(&self->_hasNoVoiceCommandAfterRespeakCheck + 1) &= ~1u;
}

- (BOOL)hasResultCandidateId
{
  return self->_resultCandidateId != 0;
}

- (void)deleteResultCandidateId
{
  -[ASRSchemaASRPackageGenerated setResultCandidateId:](self, "setResultCandidateId:", 0);
}

- (BOOL)hasLoggableSharedUserId
{
  return self->_loggableSharedUserId != 0;
}

- (void)deleteLoggableSharedUserId
{
  -[ASRSchemaASRPackageGenerated setLoggableSharedUserId:](self, "setLoggableSharedUserId:", 0);
}

- (BOOL)hasModelVersion
{
  return self->_modelVersion != 0;
}

- (void)deleteModelVersion
{
  -[ASRSchemaASRPackageGenerated setModelVersion:](self, "setModelVersion:", 0);
}

- (BOOL)hasAcousticModelVersion
{
  return self->_acousticModelVersion != 0;
}

- (void)deleteAcousticModelVersion
{
  -[ASRSchemaASRPackageGenerated setAcousticModelVersion:](self, "setAcousticModelVersion:", 0);
}

- (void)setHasVoiceCommandInExhaustiveParses:(BOOL)a3
{
  *(&self->_hasNoVoiceCommandAfterRespeakCheck + 1) |= 2u;
  self->_hasVoiceCommandInExhaustiveParses = a3;
}

- (BOOL)hasHasVoiceCommandInExhaustiveParses
{
  return (*((unsigned __int8 *)&self->_hasNoVoiceCommandAfterRespeakCheck + 1) >> 1) & 1;
}

- (void)setHasHasVoiceCommandInExhaustiveParses:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(&self->_hasNoVoiceCommandAfterRespeakCheck + 1) = *(&self->_hasNoVoiceCommandAfterRespeakCheck + 1) & 0xFD | v3;
}

- (void)deleteHasVoiceCommandInExhaustiveParses
{
  -[ASRSchemaASRPackageGenerated setHasVoiceCommandInExhaustiveParses:](self, "setHasVoiceCommandInExhaustiveParses:", 0);
  *(&self->_hasNoVoiceCommandAfterRespeakCheck + 1) &= ~2u;
}

- (void)setHasVoiceCommandParses:(BOOL)a3
{
  *(&self->_hasNoVoiceCommandAfterRespeakCheck + 1) |= 4u;
  self->_hasVoiceCommandParses = a3;
}

- (BOOL)hasHasVoiceCommandParses
{
  return (*((unsigned __int8 *)&self->_hasNoVoiceCommandAfterRespeakCheck + 1) >> 2) & 1;
}

- (void)setHasHasVoiceCommandParses:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(&self->_hasNoVoiceCommandAfterRespeakCheck + 1) = *(&self->_hasNoVoiceCommandAfterRespeakCheck + 1) & 0xFB | v3;
}

- (void)deleteHasVoiceCommandParses
{
  -[ASRSchemaASRPackageGenerated setHasVoiceCommandParses:](self, "setHasVoiceCommandParses:", 0);
  *(&self->_hasNoVoiceCommandAfterRespeakCheck + 1) &= ~4u;
}

- (void)setHasVoiceCommandEditIntent:(BOOL)a3
{
  *(&self->_hasNoVoiceCommandAfterRespeakCheck + 1) |= 8u;
  self->_hasVoiceCommandEditIntent = a3;
}

- (BOOL)hasHasVoiceCommandEditIntent
{
  return (*((unsigned __int8 *)&self->_hasNoVoiceCommandAfterRespeakCheck + 1) >> 3) & 1;
}

- (void)setHasHasVoiceCommandEditIntent:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(&self->_hasNoVoiceCommandAfterRespeakCheck + 1) = *(&self->_hasNoVoiceCommandAfterRespeakCheck + 1) & 0xF7 | v3;
}

- (void)deleteHasVoiceCommandEditIntent
{
  -[ASRSchemaASRPackageGenerated setHasVoiceCommandEditIntent:](self, "setHasVoiceCommandEditIntent:", 0);
  *(&self->_hasNoVoiceCommandAfterRespeakCheck + 1) &= ~8u;
}

- (void)setHasVoiceCommandAfterReranking:(BOOL)a3
{
  *(&self->_hasNoVoiceCommandAfterRespeakCheck + 1) |= 0x10u;
  self->_hasVoiceCommandAfterReranking = a3;
}

- (BOOL)hasHasVoiceCommandAfterReranking
{
  return (*((unsigned __int8 *)&self->_hasNoVoiceCommandAfterRespeakCheck + 1) >> 4) & 1;
}

- (void)setHasHasVoiceCommandAfterReranking:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(&self->_hasNoVoiceCommandAfterRespeakCheck + 1) = *(&self->_hasNoVoiceCommandAfterRespeakCheck + 1) & 0xEF | v3;
}

- (void)deleteHasVoiceCommandAfterReranking
{
  -[ASRSchemaASRPackageGenerated setHasVoiceCommandAfterReranking:](self, "setHasVoiceCommandAfterReranking:", 0);
  *(&self->_hasNoVoiceCommandAfterRespeakCheck + 1) &= ~0x10u;
}

- (void)setHasNoVoiceCommandAfterRespeakCheck:(BOOL)a3
{
  *(&self->_hasNoVoiceCommandAfterRespeakCheck + 1) |= 0x20u;
  self->_hasNoVoiceCommandAfterRespeakCheck = a3;
}

- (BOOL)hasHasNoVoiceCommandAfterRespeakCheck
{
  return (*((unsigned __int8 *)&self->_hasNoVoiceCommandAfterRespeakCheck + 1) >> 5) & 1;
}

- (void)setHasHasNoVoiceCommandAfterRespeakCheck:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(&self->_hasNoVoiceCommandAfterRespeakCheck + 1) = *(&self->_hasNoVoiceCommandAfterRespeakCheck + 1) & 0xDF | v3;
}

- (void)deleteHasNoVoiceCommandAfterRespeakCheck
{
  -[ASRSchemaASRPackageGenerated setHasNoVoiceCommandAfterRespeakCheck:](self, "setHasNoVoiceCommandAfterRespeakCheck:", 0);
  *(&self->_hasNoVoiceCommandAfterRespeakCheck + 1) &= ~0x20u;
}

- (BOOL)readFrom:(id)a3
{
  return ASRSchemaASRPackageGeneratedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  id v12;

  v12 = a3;
  -[ASRSchemaASRPackageGenerated package](self, "package");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[ASRSchemaASRPackageGenerated package](self, "package");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (*(&self->_hasNoVoiceCommandAfterRespeakCheck + 1))
    PBDataWriterWriteBOOLField();
  -[ASRSchemaASRPackageGenerated resultCandidateId](self, "resultCandidateId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    PBDataWriterWriteStringField();
  -[ASRSchemaASRPackageGenerated loggableSharedUserId](self, "loggableSharedUserId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    PBDataWriterWriteStringField();
  -[ASRSchemaASRPackageGenerated modelVersion](self, "modelVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    PBDataWriterWriteStringField();
  -[ASRSchemaASRPackageGenerated acousticModelVersion](self, "acousticModelVersion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    PBDataWriterWriteStringField();
  v10 = *(&self->_hasNoVoiceCommandAfterRespeakCheck + 1);
  v11 = v12;
  if ((v10 & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    v11 = v12;
    v10 = *(&self->_hasNoVoiceCommandAfterRespeakCheck + 1);
    if ((v10 & 4) == 0)
    {
LABEL_15:
      if ((v10 & 8) == 0)
        goto LABEL_16;
      goto LABEL_22;
    }
  }
  else if ((*(&self->_hasNoVoiceCommandAfterRespeakCheck + 1) & 4) == 0)
  {
    goto LABEL_15;
  }
  PBDataWriterWriteBOOLField();
  v11 = v12;
  v10 = *(&self->_hasNoVoiceCommandAfterRespeakCheck + 1);
  if ((v10 & 8) == 0)
  {
LABEL_16:
    if ((v10 & 0x10) == 0)
      goto LABEL_17;
LABEL_23:
    PBDataWriterWriteBOOLField();
    v11 = v12;
    if ((*(&self->_hasNoVoiceCommandAfterRespeakCheck + 1) & 0x20) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
LABEL_22:
  PBDataWriterWriteBOOLField();
  v11 = v12;
  v10 = *(&self->_hasNoVoiceCommandAfterRespeakCheck + 1);
  if ((v10 & 0x10) != 0)
    goto LABEL_23;
LABEL_17:
  if ((v10 & 0x20) != 0)
  {
LABEL_18:
    PBDataWriterWriteBOOLField();
    v11 = v12;
  }
LABEL_19:

}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  int isFinal;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
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
  BOOL v33;
  unsigned int v35;
  int v36;
  unsigned int v37;
  int hasVoiceCommandInExhaustiveParses;
  int v39;
  int hasVoiceCommandParses;
  int v41;
  int hasVoiceCommandEditIntent;
  int v43;
  int hasVoiceCommandAfterReranking;
  int v45;
  int hasNoVoiceCommandAfterRespeakCheck;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_30;
  -[ASRSchemaASRPackageGenerated package](self, "package");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "package");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_29;
  -[ASRSchemaASRPackageGenerated package](self, "package");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[ASRSchemaASRPackageGenerated package](self, "package");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "package");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_30;
  }
  else
  {

  }
  if (*(&self->_hasNoVoiceCommandAfterRespeakCheck + 1) != (v4[61] & 1))
    goto LABEL_30;
  if (*(&self->_hasNoVoiceCommandAfterRespeakCheck + 1))
  {
    isFinal = self->_isFinal;
    if (isFinal != objc_msgSend(v4, "isFinal"))
      goto LABEL_30;
  }
  -[ASRSchemaASRPackageGenerated resultCandidateId](self, "resultCandidateId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resultCandidateId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_29;
  -[ASRSchemaASRPackageGenerated resultCandidateId](self, "resultCandidateId");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[ASRSchemaASRPackageGenerated resultCandidateId](self, "resultCandidateId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "resultCandidateId");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_30;
  }
  else
  {

  }
  -[ASRSchemaASRPackageGenerated loggableSharedUserId](self, "loggableSharedUserId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "loggableSharedUserId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_29;
  -[ASRSchemaASRPackageGenerated loggableSharedUserId](self, "loggableSharedUserId");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    -[ASRSchemaASRPackageGenerated loggableSharedUserId](self, "loggableSharedUserId");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "loggableSharedUserId");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (!v22)
      goto LABEL_30;
  }
  else
  {

  }
  -[ASRSchemaASRPackageGenerated modelVersion](self, "modelVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "modelVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_29;
  -[ASRSchemaASRPackageGenerated modelVersion](self, "modelVersion");
  v23 = objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v24 = (void *)v23;
    -[ASRSchemaASRPackageGenerated modelVersion](self, "modelVersion");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "modelVersion");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "isEqual:", v26);

    if (!v27)
      goto LABEL_30;
  }
  else
  {

  }
  -[ASRSchemaASRPackageGenerated acousticModelVersion](self, "acousticModelVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "acousticModelVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_29:

    goto LABEL_30;
  }
  -[ASRSchemaASRPackageGenerated acousticModelVersion](self, "acousticModelVersion");
  v28 = objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    v29 = (void *)v28;
    -[ASRSchemaASRPackageGenerated acousticModelVersion](self, "acousticModelVersion");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "acousticModelVersion");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v30, "isEqual:", v31);

    if (!v32)
      goto LABEL_30;
  }
  else
  {

  }
  v35 = *((unsigned __int8 *)&self->_hasNoVoiceCommandAfterRespeakCheck + 1);
  v36 = (v35 >> 1) & 1;
  v37 = v4[61];
  if (v36 == ((v37 >> 1) & 1))
  {
    if (v36)
    {
      hasVoiceCommandInExhaustiveParses = self->_hasVoiceCommandInExhaustiveParses;
      if (hasVoiceCommandInExhaustiveParses != objc_msgSend(v4, "hasVoiceCommandInExhaustiveParses"))
        goto LABEL_30;
      v35 = *((unsigned __int8 *)&self->_hasNoVoiceCommandAfterRespeakCheck + 1);
      v37 = v4[61];
    }
    v39 = (v35 >> 2) & 1;
    if (v39 == ((v37 >> 2) & 1))
    {
      if (v39)
      {
        hasVoiceCommandParses = self->_hasVoiceCommandParses;
        if (hasVoiceCommandParses != objc_msgSend(v4, "hasVoiceCommandParses"))
          goto LABEL_30;
        v35 = *((unsigned __int8 *)&self->_hasNoVoiceCommandAfterRespeakCheck + 1);
        v37 = v4[61];
      }
      v41 = (v35 >> 3) & 1;
      if (v41 == ((v37 >> 3) & 1))
      {
        if (v41)
        {
          hasVoiceCommandEditIntent = self->_hasVoiceCommandEditIntent;
          if (hasVoiceCommandEditIntent != objc_msgSend(v4, "hasVoiceCommandEditIntent"))
            goto LABEL_30;
          v35 = *((unsigned __int8 *)&self->_hasNoVoiceCommandAfterRespeakCheck + 1);
          v37 = v4[61];
        }
        v43 = (v35 >> 4) & 1;
        if (v43 == ((v37 >> 4) & 1))
        {
          if (v43)
          {
            hasVoiceCommandAfterReranking = self->_hasVoiceCommandAfterReranking;
            if (hasVoiceCommandAfterReranking != objc_msgSend(v4, "hasVoiceCommandAfterReranking"))
              goto LABEL_30;
            v35 = *((unsigned __int8 *)&self->_hasNoVoiceCommandAfterRespeakCheck + 1);
            v37 = v4[61];
          }
          v45 = (v35 >> 5) & 1;
          if (v45 == ((v37 >> 5) & 1))
          {
            if (!v45
              || (hasNoVoiceCommandAfterRespeakCheck = self->_hasNoVoiceCommandAfterRespeakCheck,
                  hasNoVoiceCommandAfterRespeakCheck == objc_msgSend(v4, "hasNoVoiceCommandAfterRespeakCheck")))
            {
              v33 = 1;
              goto LABEL_31;
            }
          }
        }
      }
    }
  }
LABEL_30:
  v33 = 0;
LABEL_31:

  return v33;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v3 = -[ASRSchemaASRPackage hash](self->_package, "hash");
  if (*(&self->_hasNoVoiceCommandAfterRespeakCheck + 1))
    v4 = 2654435761 * self->_isFinal;
  else
    v4 = 0;
  v5 = -[NSString hash](self->_resultCandidateId, "hash");
  v6 = -[NSString hash](self->_loggableSharedUserId, "hash");
  v7 = -[NSString hash](self->_modelVersion, "hash");
  v8 = -[NSString hash](self->_acousticModelVersion, "hash");
  if ((*(&self->_hasNoVoiceCommandAfterRespeakCheck + 1) & 2) != 0)
  {
    v9 = 2654435761 * self->_hasVoiceCommandInExhaustiveParses;
    if ((*(&self->_hasNoVoiceCommandAfterRespeakCheck + 1) & 4) != 0)
    {
LABEL_6:
      v10 = 2654435761 * self->_hasVoiceCommandParses;
      if ((*(&self->_hasNoVoiceCommandAfterRespeakCheck + 1) & 8) != 0)
        goto LABEL_7;
      goto LABEL_12;
    }
  }
  else
  {
    v9 = 0;
    if ((*(&self->_hasNoVoiceCommandAfterRespeakCheck + 1) & 4) != 0)
      goto LABEL_6;
  }
  v10 = 0;
  if ((*(&self->_hasNoVoiceCommandAfterRespeakCheck + 1) & 8) != 0)
  {
LABEL_7:
    v11 = 2654435761 * self->_hasVoiceCommandEditIntent;
    if ((*(&self->_hasNoVoiceCommandAfterRespeakCheck + 1) & 0x10) != 0)
      goto LABEL_8;
LABEL_13:
    v12 = 0;
    if ((*(&self->_hasNoVoiceCommandAfterRespeakCheck + 1) & 0x20) != 0)
      goto LABEL_9;
LABEL_14:
    v13 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13;
  }
LABEL_12:
  v11 = 0;
  if ((*(&self->_hasNoVoiceCommandAfterRespeakCheck + 1) & 0x10) == 0)
    goto LABEL_13;
LABEL_8:
  v12 = 2654435761 * self->_hasVoiceCommandAfterReranking;
  if ((*(&self->_hasNoVoiceCommandAfterRespeakCheck + 1) & 0x20) == 0)
    goto LABEL_14;
LABEL_9:
  v13 = 2654435761 * self->_hasNoVoiceCommandAfterRespeakCheck;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_acousticModelVersion)
  {
    -[ASRSchemaASRPackageGenerated acousticModelVersion](self, "acousticModelVersion");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("acousticModelVersion"));

  }
  v6 = *(&self->_hasNoVoiceCommandAfterRespeakCheck + 1);
  if ((v6 & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ASRSchemaASRPackageGenerated hasNoVoiceCommandAfterRespeakCheck](self, "hasNoVoiceCommandAfterRespeakCheck"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("hasNoVoiceCommandAfterRespeakCheck"));

    v6 = *(&self->_hasNoVoiceCommandAfterRespeakCheck + 1);
    if ((v6 & 0x10) == 0)
    {
LABEL_5:
      if ((v6 & 8) == 0)
        goto LABEL_6;
      goto LABEL_19;
    }
  }
  else if ((*(&self->_hasNoVoiceCommandAfterRespeakCheck + 1) & 0x10) == 0)
  {
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ASRSchemaASRPackageGenerated hasVoiceCommandAfterReranking](self, "hasVoiceCommandAfterReranking"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("hasVoiceCommandAfterReranking"));

  v6 = *(&self->_hasNoVoiceCommandAfterRespeakCheck + 1);
  if ((v6 & 8) == 0)
  {
LABEL_6:
    if ((v6 & 2) == 0)
      goto LABEL_7;
    goto LABEL_20;
  }
LABEL_19:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ASRSchemaASRPackageGenerated hasVoiceCommandEditIntent](self, "hasVoiceCommandEditIntent"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("hasVoiceCommandEditIntent"));

  v6 = *(&self->_hasNoVoiceCommandAfterRespeakCheck + 1);
  if ((v6 & 2) == 0)
  {
LABEL_7:
    if ((v6 & 4) == 0)
      goto LABEL_8;
    goto LABEL_21;
  }
LABEL_20:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ASRSchemaASRPackageGenerated hasVoiceCommandInExhaustiveParses](self, "hasVoiceCommandInExhaustiveParses"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("hasVoiceCommandInExhaustiveParses"));

  v6 = *(&self->_hasNoVoiceCommandAfterRespeakCheck + 1);
  if ((v6 & 4) == 0)
  {
LABEL_8:
    if ((v6 & 1) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_21:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ASRSchemaASRPackageGenerated hasVoiceCommandParses](self, "hasVoiceCommandParses"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("hasVoiceCommandParses"));

  if (*(&self->_hasNoVoiceCommandAfterRespeakCheck + 1))
  {
LABEL_9:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ASRSchemaASRPackageGenerated isFinal](self, "isFinal"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("isFinal"));

  }
LABEL_10:
  if (self->_loggableSharedUserId)
  {
    -[ASRSchemaASRPackageGenerated loggableSharedUserId](self, "loggableSharedUserId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("loggableSharedUserId"));

  }
  if (self->_modelVersion)
  {
    -[ASRSchemaASRPackageGenerated modelVersion](self, "modelVersion");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("modelVersion"));

  }
  if (self->_package)
  {
    -[ASRSchemaASRPackageGenerated package](self, "package");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("package"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("package"));

    }
  }
  if (self->_resultCandidateId)
  {
    -[ASRSchemaASRPackageGenerated resultCandidateId](self, "resultCandidateId");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v20, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("resultCandidateId"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[ASRSchemaASRPackageGenerated dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (ASRSchemaASRPackageGenerated)initWithJSON:(id)a3
{
  void *v4;
  ASRSchemaASRPackageGenerated *v5;
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
    self = -[ASRSchemaASRPackageGenerated initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (ASRSchemaASRPackageGenerated)initWithDictionary:(id)a3
{
  id v4;
  ASRSchemaASRPackageGenerated *v5;
  uint64_t v6;
  ASRSchemaASRPackage *v7;
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
  ASRSchemaASRPackageGenerated *v23;
  void *v25;
  void *v26;
  void *v27;
  objc_super v28;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)ASRSchemaASRPackageGenerated;
  v5 = -[ASRSchemaASRPackageGenerated init](&v28, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("package"));
    v6 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[ASRSchemaASRPackage initWithDictionary:]([ASRSchemaASRPackage alloc], "initWithDictionary:", v6);
      -[ASRSchemaASRPackageGenerated setPackage:](v5, "setPackage:", v7);

    }
    v27 = (void *)v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isFinal"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ASRSchemaASRPackageGenerated setIsFinal:](v5, "setIsFinal:", objc_msgSend(v8, "BOOLValue"));
    v26 = v8;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("resultCandidateId"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = (void *)objc_msgSend(v9, "copy");
      -[ASRSchemaASRPackageGenerated setResultCandidateId:](v5, "setResultCandidateId:", v10);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("loggableSharedUserId"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = (void *)objc_msgSend(v11, "copy");
      -[ASRSchemaASRPackageGenerated setLoggableSharedUserId:](v5, "setLoggableSharedUserId:", v12);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("modelVersion"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = (void *)objc_msgSend(v13, "copy");
      -[ASRSchemaASRPackageGenerated setModelVersion:](v5, "setModelVersion:", v14);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("acousticModelVersion"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16 = (void *)objc_msgSend(v15, "copy");
      -[ASRSchemaASRPackageGenerated setAcousticModelVersion:](v5, "setAcousticModelVersion:", v16);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasVoiceCommandInExhaustiveParses"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ASRSchemaASRPackageGenerated setHasVoiceCommandInExhaustiveParses:](v5, "setHasVoiceCommandInExhaustiveParses:", objc_msgSend(v17, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasVoiceCommandParses"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ASRSchemaASRPackageGenerated setHasVoiceCommandParses:](v5, "setHasVoiceCommandParses:", objc_msgSend(v18, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasVoiceCommandEditIntent"), v13);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ASRSchemaASRPackageGenerated setHasVoiceCommandEditIntent:](v5, "setHasVoiceCommandEditIntent:", objc_msgSend(v19, "BOOLValue"));
    v20 = v9;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasVoiceCommandAfterReranking"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ASRSchemaASRPackageGenerated setHasVoiceCommandAfterReranking:](v5, "setHasVoiceCommandAfterReranking:", objc_msgSend(v21, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasNoVoiceCommandAfterRespeakCheck"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ASRSchemaASRPackageGenerated setHasNoVoiceCommandAfterRespeakCheck:](v5, "setHasNoVoiceCommandAfterRespeakCheck:", objc_msgSend(v22, "BOOLValue"));
    v23 = v5;

  }
  return v5;
}

- (ASRSchemaASRPackage)package
{
  return self->_package;
}

- (void)setPackage:(id)a3
{
  objc_storeStrong((id *)&self->_package, a3);
}

- (BOOL)isFinal
{
  return self->_isFinal;
}

- (NSString)resultCandidateId
{
  return self->_resultCandidateId;
}

- (void)setResultCandidateId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)loggableSharedUserId
{
  return self->_loggableSharedUserId;
}

- (void)setLoggableSharedUserId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)modelVersion
{
  return self->_modelVersion;
}

- (void)setModelVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)acousticModelVersion
{
  return self->_acousticModelVersion;
}

- (void)setAcousticModelVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)hasVoiceCommandInExhaustiveParses
{
  return self->_hasVoiceCommandInExhaustiveParses;
}

- (BOOL)hasVoiceCommandParses
{
  return self->_hasVoiceCommandParses;
}

- (BOOL)hasVoiceCommandEditIntent
{
  return self->_hasVoiceCommandEditIntent;
}

- (BOOL)hasVoiceCommandAfterReranking
{
  return self->_hasVoiceCommandAfterReranking;
}

- (BOOL)hasNoVoiceCommandAfterRespeakCheck
{
  return self->_hasNoVoiceCommandAfterRespeakCheck;
}

- (void)setHasPackage:(BOOL)a3
{
  *(&self->_hasNoVoiceCommandAfterRespeakCheck + 2) = a3;
}

- (void)setHasResultCandidateId:(BOOL)a3
{
  *(&self->_hasNoVoiceCommandAfterRespeakCheck + 3) = a3;
}

- (void)setHasLoggableSharedUserId:(BOOL)a3
{
  *(_BYTE *)&self->_has = a3;
}

- (void)setHasModelVersion:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasAcousticModelVersion:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_acousticModelVersion, 0);
  objc_storeStrong((id *)&self->_modelVersion, 0);
  objc_storeStrong((id *)&self->_loggableSharedUserId, 0);
  objc_storeStrong((id *)&self->_resultCandidateId, 0);
  objc_storeStrong((id *)&self->_package, 0);
}

@end
