@implementation DODMLSchemaDODMLClientEvent

- (id)getComponentId
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;

  -[DODMLSchemaDODMLClientEvent eventMetadata](self, "eventMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dodMlId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    goto LABEL_5;
  objc_msgSend(v3, "value");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "value");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "length");

    if (v6)
    {
      v4 = v3;
      goto LABEL_6;
    }
LABEL_5:
    v4 = 0;
  }
LABEL_6:

  return v4;
}

+ (int)joinability
{
  return 1;
}

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
  v22.super_class = (Class)DODMLSchemaDODMLClientEvent;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v22, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isConditionSet:", 2))
  {
    -[DODMLSchemaDODMLClientEvent deleteUserEditExperimentEndedTier1](self, "deleteUserEditExperimentEndedTier1");
    -[DODMLSchemaDODMLClientEvent deleteAudioFileResultTier1](self, "deleteAudioFileResultTier1");
  }
  if (objc_msgSend(v4, "isConditionSet:", 4))
  {
    -[DODMLSchemaDODMLClientEvent deleteUserEditExperimentEndedTier1](self, "deleteUserEditExperimentEndedTier1");
    -[DODMLSchemaDODMLClientEvent deleteAudioFileResultTier1](self, "deleteAudioFileResultTier1");
  }
  if (objc_msgSend(v4, "isConditionSet:", 5))
  {
    -[DODMLSchemaDODMLClientEvent deleteUserEditExperimentEndedTier1](self, "deleteUserEditExperimentEndedTier1");
    -[DODMLSchemaDODMLClientEvent deleteAudioFileResultTier1](self, "deleteAudioFileResultTier1");
  }
  if (objc_msgSend(v4, "isConditionSet:", 6))
  {
    -[DODMLSchemaDODMLClientEvent deleteUserEditExperimentEndedTier1](self, "deleteUserEditExperimentEndedTier1");
    -[DODMLSchemaDODMLClientEvent deleteAudioFileResultTier1](self, "deleteAudioFileResultTier1");
  }
  if (objc_msgSend(v4, "isConditionSet:", 7))
  {
    -[DODMLSchemaDODMLClientEvent deleteUserEditExperimentEndedTier1](self, "deleteUserEditExperimentEndedTier1");
    -[DODMLSchemaDODMLClientEvent deleteAudioFileResultTier1](self, "deleteAudioFileResultTier1");
  }
  -[DODMLSchemaDODMLClientEvent eventMetadata](self, "eventMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[DODMLSchemaDODMLClientEvent deleteEventMetadata](self, "deleteEventMetadata");
  -[DODMLSchemaDODMLClientEvent personalizationExperimentContext](self, "personalizationExperimentContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[DODMLSchemaDODMLClientEvent deletePersonalizationExperimentContext](self, "deletePersonalizationExperimentContext");
  -[DODMLSchemaDODMLClientEvent userEditExperimentContext](self, "userEditExperimentContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[DODMLSchemaDODMLClientEvent deleteUserEditExperimentContext](self, "deleteUserEditExperimentContext");
  -[DODMLSchemaDODMLClientEvent userEditExperimentEndedTier1](self, "userEditExperimentEndedTier1");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applySensitiveConditionsPolicy:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "suppressMessage");

  if (v17)
    -[DODMLSchemaDODMLClientEvent deleteUserEditExperimentEndedTier1](self, "deleteUserEditExperimentEndedTier1");
  -[DODMLSchemaDODMLClientEvent audioFileResultTier1](self, "audioFileResultTier1");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "applySensitiveConditionsPolicy:", v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "suppressMessage");

  if (v20)
    -[DODMLSchemaDODMLClientEvent deleteAudioFileResultTier1](self, "deleteAudioFileResultTier1");

  return v5;
}

- (SISchemaInstrumentationMessage)innerEvent
{
  unint64_t v3;
  id v4;

  v3 = -[DODMLSchemaDODMLClientEvent whichEvent_Type](self, "whichEvent_Type");
  if (v3 - 2 > 3)
    v4 = 0;
  else
    v4 = *(id *)((char *)&self->super.super.super.super.isa + *off_1E5629458[v3 - 2]);
  return (SISchemaInstrumentationMessage *)v4;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  if (a3 - 2 > 3)
    return 0;
  else
    return off_1E5629478[a3 - 2];
}

- (id)qualifiedMessageName
{
  unint64_t v2;

  v2 = -[DODMLSchemaDODMLClientEvent whichEvent_Type](self, "whichEvent_Type");
  if (v2 - 2 > 3)
    return CFSTR("com.apple.aiml.siri.dodml.DODMLClientEvent");
  else
    return off_1E562D3F8[v2 - 2];
}

- (BOOL)hasEventMetadata
{
  return self->_eventMetadata != 0;
}

- (void)deleteEventMetadata
{
  -[DODMLSchemaDODMLClientEvent setEventMetadata:](self, "setEventMetadata:", 0);
}

- (void)setPersonalizationExperimentContext:(id)a3
{
  DODMLASRSchemaDODMLASRPersonalizationExperimentContext *v4;
  DODMLASRSchemaDODMLASRUserEditExperimentContext *userEditExperimentContext;
  DODMLASRSchemaDODMLASRUserEditExperimentEndedTier1 *userEditExperimentEndedTier1;
  DODMLASRSchemaDODMLASRAudioFileResultTier1 *audioFileResultTier1;
  DODMLASRSchemaDODMLASRPersonalizationExperimentContext *personalizationExperimentContext;

  v4 = (DODMLASRSchemaDODMLASRPersonalizationExperimentContext *)a3;
  userEditExperimentContext = self->_userEditExperimentContext;
  self->_userEditExperimentContext = 0;

  userEditExperimentEndedTier1 = self->_userEditExperimentEndedTier1;
  self->_userEditExperimentEndedTier1 = 0;

  audioFileResultTier1 = self->_audioFileResultTier1;
  self->_audioFileResultTier1 = 0;

  self->_whichEvent_Type = 2 * (v4 != 0);
  personalizationExperimentContext = self->_personalizationExperimentContext;
  self->_personalizationExperimentContext = v4;

}

- (DODMLASRSchemaDODMLASRPersonalizationExperimentContext)personalizationExperimentContext
{
  if (self->_whichEvent_Type == 2)
    return self->_personalizationExperimentContext;
  else
    return (DODMLASRSchemaDODMLASRPersonalizationExperimentContext *)0;
}

- (void)deletePersonalizationExperimentContext
{
  DODMLASRSchemaDODMLASRPersonalizationExperimentContext *personalizationExperimentContext;

  if (self->_whichEvent_Type == 2)
  {
    self->_whichEvent_Type = 0;
    personalizationExperimentContext = self->_personalizationExperimentContext;
    self->_personalizationExperimentContext = 0;

  }
}

- (void)setUserEditExperimentContext:(id)a3
{
  DODMLASRSchemaDODMLASRUserEditExperimentContext *v4;
  DODMLASRSchemaDODMLASRPersonalizationExperimentContext *personalizationExperimentContext;
  DODMLASRSchemaDODMLASRUserEditExperimentEndedTier1 *userEditExperimentEndedTier1;
  DODMLASRSchemaDODMLASRAudioFileResultTier1 *audioFileResultTier1;
  unint64_t v8;
  DODMLASRSchemaDODMLASRUserEditExperimentContext *userEditExperimentContext;

  v4 = (DODMLASRSchemaDODMLASRUserEditExperimentContext *)a3;
  personalizationExperimentContext = self->_personalizationExperimentContext;
  self->_personalizationExperimentContext = 0;

  userEditExperimentEndedTier1 = self->_userEditExperimentEndedTier1;
  self->_userEditExperimentEndedTier1 = 0;

  audioFileResultTier1 = self->_audioFileResultTier1;
  self->_audioFileResultTier1 = 0;

  v8 = 3;
  if (!v4)
    v8 = 0;
  self->_whichEvent_Type = v8;
  userEditExperimentContext = self->_userEditExperimentContext;
  self->_userEditExperimentContext = v4;

}

- (DODMLASRSchemaDODMLASRUserEditExperimentContext)userEditExperimentContext
{
  if (self->_whichEvent_Type == 3)
    return self->_userEditExperimentContext;
  else
    return (DODMLASRSchemaDODMLASRUserEditExperimentContext *)0;
}

- (void)deleteUserEditExperimentContext
{
  DODMLASRSchemaDODMLASRUserEditExperimentContext *userEditExperimentContext;

  if (self->_whichEvent_Type == 3)
  {
    self->_whichEvent_Type = 0;
    userEditExperimentContext = self->_userEditExperimentContext;
    self->_userEditExperimentContext = 0;

  }
}

- (void)setUserEditExperimentEndedTier1:(id)a3
{
  DODMLASRSchemaDODMLASRUserEditExperimentEndedTier1 *v4;
  DODMLASRSchemaDODMLASRPersonalizationExperimentContext *personalizationExperimentContext;
  DODMLASRSchemaDODMLASRUserEditExperimentContext *userEditExperimentContext;
  DODMLASRSchemaDODMLASRAudioFileResultTier1 *audioFileResultTier1;
  DODMLASRSchemaDODMLASRUserEditExperimentEndedTier1 *userEditExperimentEndedTier1;

  v4 = (DODMLASRSchemaDODMLASRUserEditExperimentEndedTier1 *)a3;
  personalizationExperimentContext = self->_personalizationExperimentContext;
  self->_personalizationExperimentContext = 0;

  userEditExperimentContext = self->_userEditExperimentContext;
  self->_userEditExperimentContext = 0;

  audioFileResultTier1 = self->_audioFileResultTier1;
  self->_audioFileResultTier1 = 0;

  self->_whichEvent_Type = 4 * (v4 != 0);
  userEditExperimentEndedTier1 = self->_userEditExperimentEndedTier1;
  self->_userEditExperimentEndedTier1 = v4;

}

- (DODMLASRSchemaDODMLASRUserEditExperimentEndedTier1)userEditExperimentEndedTier1
{
  if (self->_whichEvent_Type == 4)
    return self->_userEditExperimentEndedTier1;
  else
    return (DODMLASRSchemaDODMLASRUserEditExperimentEndedTier1 *)0;
}

- (void)deleteUserEditExperimentEndedTier1
{
  DODMLASRSchemaDODMLASRUserEditExperimentEndedTier1 *userEditExperimentEndedTier1;

  if (self->_whichEvent_Type == 4)
  {
    self->_whichEvent_Type = 0;
    userEditExperimentEndedTier1 = self->_userEditExperimentEndedTier1;
    self->_userEditExperimentEndedTier1 = 0;

  }
}

- (void)setAudioFileResultTier1:(id)a3
{
  DODMLASRSchemaDODMLASRAudioFileResultTier1 *v4;
  DODMLASRSchemaDODMLASRPersonalizationExperimentContext *personalizationExperimentContext;
  DODMLASRSchemaDODMLASRUserEditExperimentContext *userEditExperimentContext;
  DODMLASRSchemaDODMLASRUserEditExperimentEndedTier1 *userEditExperimentEndedTier1;
  unint64_t v8;
  DODMLASRSchemaDODMLASRAudioFileResultTier1 *audioFileResultTier1;

  v4 = (DODMLASRSchemaDODMLASRAudioFileResultTier1 *)a3;
  personalizationExperimentContext = self->_personalizationExperimentContext;
  self->_personalizationExperimentContext = 0;

  userEditExperimentContext = self->_userEditExperimentContext;
  self->_userEditExperimentContext = 0;

  userEditExperimentEndedTier1 = self->_userEditExperimentEndedTier1;
  self->_userEditExperimentEndedTier1 = 0;

  v8 = 5;
  if (!v4)
    v8 = 0;
  self->_whichEvent_Type = v8;
  audioFileResultTier1 = self->_audioFileResultTier1;
  self->_audioFileResultTier1 = v4;

}

- (DODMLASRSchemaDODMLASRAudioFileResultTier1)audioFileResultTier1
{
  if (self->_whichEvent_Type == 5)
    return self->_audioFileResultTier1;
  else
    return (DODMLASRSchemaDODMLASRAudioFileResultTier1 *)0;
}

- (void)deleteAudioFileResultTier1
{
  DODMLASRSchemaDODMLASRAudioFileResultTier1 *audioFileResultTier1;

  if (self->_whichEvent_Type == 5)
  {
    self->_whichEvent_Type = 0;
    audioFileResultTier1 = self->_audioFileResultTier1;
    self->_audioFileResultTier1 = 0;

  }
}

- (BOOL)readFrom:(id)a3
{
  return DODMLSchemaDODMLClientEventReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
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
  id v14;

  v14 = a3;
  -[DODMLSchemaDODMLClientEvent eventMetadata](self, "eventMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[DODMLSchemaDODMLClientEvent eventMetadata](self, "eventMetadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[DODMLSchemaDODMLClientEvent personalizationExperimentContext](self, "personalizationExperimentContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[DODMLSchemaDODMLClientEvent personalizationExperimentContext](self, "personalizationExperimentContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[DODMLSchemaDODMLClientEvent userEditExperimentContext](self, "userEditExperimentContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[DODMLSchemaDODMLClientEvent userEditExperimentContext](self, "userEditExperimentContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[DODMLSchemaDODMLClientEvent userEditExperimentEndedTier1](self, "userEditExperimentEndedTier1");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[DODMLSchemaDODMLClientEvent userEditExperimentEndedTier1](self, "userEditExperimentEndedTier1");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[DODMLSchemaDODMLClientEvent audioFileResultTier1](self, "audioFileResultTier1");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[DODMLSchemaDODMLClientEvent audioFileResultTier1](self, "audioFileResultTier1");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t whichEvent_Type;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
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
  char v32;
  BOOL v33;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_28;
  whichEvent_Type = self->_whichEvent_Type;
  if (whichEvent_Type != objc_msgSend(v4, "whichEvent_Type"))
    goto LABEL_28;
  -[DODMLSchemaDODMLClientEvent eventMetadata](self, "eventMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_27;
  -[DODMLSchemaDODMLClientEvent eventMetadata](self, "eventMetadata");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[DODMLSchemaDODMLClientEvent eventMetadata](self, "eventMetadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "eventMetadata");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_28;
  }
  else
  {

  }
  -[DODMLSchemaDODMLClientEvent personalizationExperimentContext](self, "personalizationExperimentContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "personalizationExperimentContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_27;
  -[DODMLSchemaDODMLClientEvent personalizationExperimentContext](self, "personalizationExperimentContext");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[DODMLSchemaDODMLClientEvent personalizationExperimentContext](self, "personalizationExperimentContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "personalizationExperimentContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_28;
  }
  else
  {

  }
  -[DODMLSchemaDODMLClientEvent userEditExperimentContext](self, "userEditExperimentContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userEditExperimentContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_27;
  -[DODMLSchemaDODMLClientEvent userEditExperimentContext](self, "userEditExperimentContext");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    -[DODMLSchemaDODMLClientEvent userEditExperimentContext](self, "userEditExperimentContext");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userEditExperimentContext");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (!v22)
      goto LABEL_28;
  }
  else
  {

  }
  -[DODMLSchemaDODMLClientEvent userEditExperimentEndedTier1](self, "userEditExperimentEndedTier1");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userEditExperimentEndedTier1");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_27;
  -[DODMLSchemaDODMLClientEvent userEditExperimentEndedTier1](self, "userEditExperimentEndedTier1");
  v23 = objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v24 = (void *)v23;
    -[DODMLSchemaDODMLClientEvent userEditExperimentEndedTier1](self, "userEditExperimentEndedTier1");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userEditExperimentEndedTier1");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "isEqual:", v26);

    if (!v27)
      goto LABEL_28;
  }
  else
  {

  }
  -[DODMLSchemaDODMLClientEvent audioFileResultTier1](self, "audioFileResultTier1");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "audioFileResultTier1");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[DODMLSchemaDODMLClientEvent audioFileResultTier1](self, "audioFileResultTier1");
    v28 = objc_claimAutoreleasedReturnValue();
    if (!v28)
    {

LABEL_31:
      v33 = 1;
      goto LABEL_29;
    }
    v29 = (void *)v28;
    -[DODMLSchemaDODMLClientEvent audioFileResultTier1](self, "audioFileResultTier1");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "audioFileResultTier1");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v30, "isEqual:", v31);

    if ((v32 & 1) != 0)
      goto LABEL_31;
  }
  else
  {
LABEL_27:

  }
LABEL_28:
  v33 = 0;
LABEL_29:

  return v33;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v3 = -[DODMLSchemaDODMLClientEventMetadata hash](self->_eventMetadata, "hash");
  v4 = -[DODMLASRSchemaDODMLASRPersonalizationExperimentContext hash](self->_personalizationExperimentContext, "hash") ^ v3;
  v5 = -[DODMLASRSchemaDODMLASRUserEditExperimentContext hash](self->_userEditExperimentContext, "hash");
  v6 = v4 ^ v5 ^ -[DODMLASRSchemaDODMLASRUserEditExperimentEndedTier1 hash](self->_userEditExperimentEndedTier1, "hash");
  return v6 ^ -[DODMLASRSchemaDODMLASRAudioFileResultTier1 hash](self->_audioFileResultTier1, "hash");
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_audioFileResultTier1)
  {
    -[DODMLSchemaDODMLClientEvent audioFileResultTier1](self, "audioFileResultTier1");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("audioFileResultTier1"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("audioFileResultTier1"));

    }
  }
  if (self->_eventMetadata)
  {
    -[DODMLSchemaDODMLClientEvent eventMetadata](self, "eventMetadata");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("eventMetadata"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("eventMetadata"));

    }
  }
  if (self->_personalizationExperimentContext)
  {
    -[DODMLSchemaDODMLClientEvent personalizationExperimentContext](self, "personalizationExperimentContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("personalizationExperimentContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("personalizationExperimentContext"));

    }
  }
  if (self->_userEditExperimentContext)
  {
    -[DODMLSchemaDODMLClientEvent userEditExperimentContext](self, "userEditExperimentContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("userEditExperimentContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("userEditExperimentContext"));

    }
  }
  if (self->_userEditExperimentEndedTier1)
  {
    -[DODMLSchemaDODMLClientEvent userEditExperimentEndedTier1](self, "userEditExperimentEndedTier1");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("userEditExperimentEndedTier1"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("userEditExperimentEndedTier1"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[DODMLSchemaDODMLClientEvent dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (DODMLSchemaDODMLClientEvent)initWithJSON:(id)a3
{
  void *v4;
  DODMLSchemaDODMLClientEvent *v5;
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
    self = -[DODMLSchemaDODMLClientEvent initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (DODMLSchemaDODMLClientEvent)initWithDictionary:(id)a3
{
  id v4;
  DODMLSchemaDODMLClientEvent *v5;
  void *v6;
  DODMLSchemaDODMLClientEventMetadata *v7;
  void *v8;
  DODMLASRSchemaDODMLASRPersonalizationExperimentContext *v9;
  void *v10;
  DODMLASRSchemaDODMLASRUserEditExperimentContext *v11;
  void *v12;
  DODMLASRSchemaDODMLASRUserEditExperimentEndedTier1 *v13;
  void *v14;
  DODMLASRSchemaDODMLASRAudioFileResultTier1 *v15;
  DODMLSchemaDODMLClientEvent *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)DODMLSchemaDODMLClientEvent;
  v5 = -[DODMLSchemaDODMLClientEvent init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("eventMetadata"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[DODMLSchemaDODMLClientEventMetadata initWithDictionary:]([DODMLSchemaDODMLClientEventMetadata alloc], "initWithDictionary:", v6);
      -[DODMLSchemaDODMLClientEvent setEventMetadata:](v5, "setEventMetadata:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("personalizationExperimentContext"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[DODMLASRSchemaDODMLASRPersonalizationExperimentContext initWithDictionary:]([DODMLASRSchemaDODMLASRPersonalizationExperimentContext alloc], "initWithDictionary:", v8);
      -[DODMLSchemaDODMLClientEvent setPersonalizationExperimentContext:](v5, "setPersonalizationExperimentContext:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("userEditExperimentContext"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[DODMLASRSchemaDODMLASRUserEditExperimentContext initWithDictionary:]([DODMLASRSchemaDODMLASRUserEditExperimentContext alloc], "initWithDictionary:", v10);
      -[DODMLSchemaDODMLClientEvent setUserEditExperimentContext:](v5, "setUserEditExperimentContext:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("userEditExperimentEndedTier1"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[DODMLASRSchemaDODMLASRUserEditExperimentEndedTier1 initWithDictionary:]([DODMLASRSchemaDODMLASRUserEditExperimentEndedTier1 alloc], "initWithDictionary:", v12);
      -[DODMLSchemaDODMLClientEvent setUserEditExperimentEndedTier1:](v5, "setUserEditExperimentEndedTier1:", v13);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("audioFileResultTier1"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = -[DODMLASRSchemaDODMLASRAudioFileResultTier1 initWithDictionary:]([DODMLASRSchemaDODMLASRAudioFileResultTier1 alloc], "initWithDictionary:", v14);
      -[DODMLSchemaDODMLClientEvent setAudioFileResultTier1:](v5, "setAudioFileResultTier1:", v15);

    }
    v16 = v5;

  }
  return v5;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (DODMLSchemaDODMLClientEventMetadata)eventMetadata
{
  return self->_eventMetadata;
}

- (void)setEventMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_eventMetadata, a3);
}

- (void)setHasEventMetadata:(BOOL)a3
{
  self->_hasEventMetadata = a3;
}

- (BOOL)hasPersonalizationExperimentContext
{
  return self->_hasPersonalizationExperimentContext;
}

- (void)setHasPersonalizationExperimentContext:(BOOL)a3
{
  self->_hasPersonalizationExperimentContext = a3;
}

- (BOOL)hasUserEditExperimentContext
{
  return self->_hasUserEditExperimentContext;
}

- (void)setHasUserEditExperimentContext:(BOOL)a3
{
  self->_hasUserEditExperimentContext = a3;
}

- (BOOL)hasUserEditExperimentEndedTier1
{
  return self->_hasUserEditExperimentEndedTier1;
}

- (void)setHasUserEditExperimentEndedTier1:(BOOL)a3
{
  self->_hasUserEditExperimentEndedTier1 = a3;
}

- (BOOL)hasAudioFileResultTier1
{
  return self->_hasAudioFileResultTier1;
}

- (void)setHasAudioFileResultTier1:(BOOL)a3
{
  self->_hasAudioFileResultTier1 = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioFileResultTier1, 0);
  objc_storeStrong((id *)&self->_userEditExperimentEndedTier1, 0);
  objc_storeStrong((id *)&self->_userEditExperimentContext, 0);
  objc_storeStrong((id *)&self->_personalizationExperimentContext, 0);
  objc_storeStrong((id *)&self->_eventMetadata, 0);
}

- (int)getAnyEventType
{
  return 37;
}

@end
