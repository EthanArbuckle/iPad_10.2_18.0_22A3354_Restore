@implementation ASRSchemaASRDictationVoiceCommandInfoTier1

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
  v10.super_class = (Class)ASRSchemaASRDictationVoiceCommandInfoTier1;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v10, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isConditionSet:", 2))
  {
    -[ASRSchemaASRDictationVoiceCommandInfoTier1 deletePreviousUtterance](self, "deletePreviousUtterance");
    -[ASRSchemaASRDictationVoiceCommandInfoTier1 deleteCommandUtterance](self, "deleteCommandUtterance");
    -[ASRSchemaASRDictationVoiceCommandInfoTier1 deleteTarget](self, "deleteTarget");
    -[ASRSchemaASRDictationVoiceCommandInfoTier1 deletePayload](self, "deletePayload");
  }
  if (objc_msgSend(v4, "isConditionSet:", 4))
  {
    -[ASRSchemaASRDictationVoiceCommandInfoTier1 deletePreviousUtterance](self, "deletePreviousUtterance");
    -[ASRSchemaASRDictationVoiceCommandInfoTier1 deleteCommandUtterance](self, "deleteCommandUtterance");
    -[ASRSchemaASRDictationVoiceCommandInfoTier1 deleteTarget](self, "deleteTarget");
    -[ASRSchemaASRDictationVoiceCommandInfoTier1 deletePayload](self, "deletePayload");
  }
  if (objc_msgSend(v4, "isConditionSet:", 5))
  {
    -[ASRSchemaASRDictationVoiceCommandInfoTier1 deletePreviousUtterance](self, "deletePreviousUtterance");
    -[ASRSchemaASRDictationVoiceCommandInfoTier1 deleteCommandUtterance](self, "deleteCommandUtterance");
    -[ASRSchemaASRDictationVoiceCommandInfoTier1 deleteTarget](self, "deleteTarget");
    -[ASRSchemaASRDictationVoiceCommandInfoTier1 deletePayload](self, "deletePayload");
  }
  if (objc_msgSend(v4, "isConditionSet:", 6))
  {
    -[ASRSchemaASRDictationVoiceCommandInfoTier1 deletePreviousUtterance](self, "deletePreviousUtterance");
    -[ASRSchemaASRDictationVoiceCommandInfoTier1 deleteCommandUtterance](self, "deleteCommandUtterance");
    -[ASRSchemaASRDictationVoiceCommandInfoTier1 deleteTarget](self, "deleteTarget");
    -[ASRSchemaASRDictationVoiceCommandInfoTier1 deletePayload](self, "deletePayload");
  }
  if (objc_msgSend(v4, "isConditionSet:", 7))
  {
    -[ASRSchemaASRDictationVoiceCommandInfoTier1 deletePreviousUtterance](self, "deletePreviousUtterance");
    -[ASRSchemaASRDictationVoiceCommandInfoTier1 deleteCommandUtterance](self, "deleteCommandUtterance");
    -[ASRSchemaASRDictationVoiceCommandInfoTier1 deleteTarget](self, "deleteTarget");
    -[ASRSchemaASRDictationVoiceCommandInfoTier1 deletePayload](self, "deletePayload");
  }
  -[ASRSchemaASRDictationVoiceCommandInfoTier1 dictationVoiceCommandLinkId](self, "dictationVoiceCommandLinkId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[ASRSchemaASRDictationVoiceCommandInfoTier1 deleteDictationVoiceCommandLinkId](self, "deleteDictationVoiceCommandLinkId");

  return v5;
}

- (BOOL)hasPreviousUtterance
{
  return self->_previousUtterance != 0;
}

- (void)deletePreviousUtterance
{
  -[ASRSchemaASRDictationVoiceCommandInfoTier1 setPreviousUtterance:](self, "setPreviousUtterance:", 0);
}

- (BOOL)hasCommandUtterance
{
  return self->_commandUtterance != 0;
}

- (void)deleteCommandUtterance
{
  -[ASRSchemaASRDictationVoiceCommandInfoTier1 setCommandUtterance:](self, "setCommandUtterance:", 0);
}

- (BOOL)hasTarget
{
  return self->_target != 0;
}

- (void)deleteTarget
{
  -[ASRSchemaASRDictationVoiceCommandInfoTier1 setTarget:](self, "setTarget:", 0);
}

- (BOOL)hasPayload
{
  return self->_payload != 0;
}

- (void)deletePayload
{
  -[ASRSchemaASRDictationVoiceCommandInfoTier1 setPayload:](self, "setPayload:", 0);
}

- (BOOL)hasDictationVoiceCommandLinkId
{
  return self->_dictationVoiceCommandLinkId != 0;
}

- (void)deleteDictationVoiceCommandLinkId
{
  -[ASRSchemaASRDictationVoiceCommandInfoTier1 setDictationVoiceCommandLinkId:](self, "setDictationVoiceCommandLinkId:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return ASRSchemaASRDictationVoiceCommandInfoTier1ReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[ASRSchemaASRDictationVoiceCommandInfoTier1 previousUtterance](self, "previousUtterance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  -[ASRSchemaASRDictationVoiceCommandInfoTier1 commandUtterance](self, "commandUtterance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  -[ASRSchemaASRDictationVoiceCommandInfoTier1 target](self, "target");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    PBDataWriterWriteStringField();
  -[ASRSchemaASRDictationVoiceCommandInfoTier1 payload](self, "payload");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    PBDataWriterWriteStringField();
  -[ASRSchemaASRDictationVoiceCommandInfoTier1 dictationVoiceCommandLinkId](self, "dictationVoiceCommandLinkId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[ASRSchemaASRDictationVoiceCommandInfoTier1 dictationVoiceCommandLinkId](self, "dictationVoiceCommandLinkId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (BOOL)isEqual:(id)a3
{
  id v4;
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
  char v31;
  BOOL v32;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_27;
  -[ASRSchemaASRDictationVoiceCommandInfoTier1 previousUtterance](self, "previousUtterance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "previousUtterance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_26;
  -[ASRSchemaASRDictationVoiceCommandInfoTier1 previousUtterance](self, "previousUtterance");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[ASRSchemaASRDictationVoiceCommandInfoTier1 previousUtterance](self, "previousUtterance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "previousUtterance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_27;
  }
  else
  {

  }
  -[ASRSchemaASRDictationVoiceCommandInfoTier1 commandUtterance](self, "commandUtterance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commandUtterance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_26;
  -[ASRSchemaASRDictationVoiceCommandInfoTier1 commandUtterance](self, "commandUtterance");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[ASRSchemaASRDictationVoiceCommandInfoTier1 commandUtterance](self, "commandUtterance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "commandUtterance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_27;
  }
  else
  {

  }
  -[ASRSchemaASRDictationVoiceCommandInfoTier1 target](self, "target");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "target");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_26;
  -[ASRSchemaASRDictationVoiceCommandInfoTier1 target](self, "target");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[ASRSchemaASRDictationVoiceCommandInfoTier1 target](self, "target");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "target");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_27;
  }
  else
  {

  }
  -[ASRSchemaASRDictationVoiceCommandInfoTier1 payload](self, "payload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "payload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_26;
  -[ASRSchemaASRDictationVoiceCommandInfoTier1 payload](self, "payload");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[ASRSchemaASRDictationVoiceCommandInfoTier1 payload](self, "payload");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "payload");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_27;
  }
  else
  {

  }
  -[ASRSchemaASRDictationVoiceCommandInfoTier1 dictationVoiceCommandLinkId](self, "dictationVoiceCommandLinkId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictationVoiceCommandLinkId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[ASRSchemaASRDictationVoiceCommandInfoTier1 dictationVoiceCommandLinkId](self, "dictationVoiceCommandLinkId");
    v27 = objc_claimAutoreleasedReturnValue();
    if (!v27)
    {

LABEL_30:
      v32 = 1;
      goto LABEL_28;
    }
    v28 = (void *)v27;
    -[ASRSchemaASRDictationVoiceCommandInfoTier1 dictationVoiceCommandLinkId](self, "dictationVoiceCommandLinkId");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictationVoiceCommandLinkId");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "isEqual:", v30);

    if ((v31 & 1) != 0)
      goto LABEL_30;
  }
  else
  {
LABEL_26:

  }
LABEL_27:
  v32 = 0;
LABEL_28:

  return v32;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;

  v3 = -[NSString hash](self->_previousUtterance, "hash");
  v4 = -[NSString hash](self->_commandUtterance, "hash") ^ v3;
  v5 = -[NSString hash](self->_target, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_payload, "hash");
  return v6 ^ -[SISchemaUUID hash](self->_dictationVoiceCommandLinkId, "hash");
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_commandUtterance)
  {
    -[ASRSchemaASRDictationVoiceCommandInfoTier1 commandUtterance](self, "commandUtterance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("commandUtterance"));

  }
  if (self->_dictationVoiceCommandLinkId)
  {
    -[ASRSchemaASRDictationVoiceCommandInfoTier1 dictationVoiceCommandLinkId](self, "dictationVoiceCommandLinkId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("dictationVoiceCommandLinkId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("dictationVoiceCommandLinkId"));

    }
  }
  if (self->_payload)
  {
    -[ASRSchemaASRDictationVoiceCommandInfoTier1 payload](self, "payload");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("payload"));

  }
  if (self->_previousUtterance)
  {
    -[ASRSchemaASRDictationVoiceCommandInfoTier1 previousUtterance](self, "previousUtterance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("previousUtterance"));

  }
  if (self->_target)
  {
    -[ASRSchemaASRDictationVoiceCommandInfoTier1 target](self, "target");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("target"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[ASRSchemaASRDictationVoiceCommandInfoTier1 dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (ASRSchemaASRDictationVoiceCommandInfoTier1)initWithJSON:(id)a3
{
  void *v4;
  ASRSchemaASRDictationVoiceCommandInfoTier1 *v5;
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
    self = -[ASRSchemaASRDictationVoiceCommandInfoTier1 initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (ASRSchemaASRDictationVoiceCommandInfoTier1)initWithDictionary:(id)a3
{
  id v4;
  ASRSchemaASRDictationVoiceCommandInfoTier1 *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  SISchemaUUID *v15;
  ASRSchemaASRDictationVoiceCommandInfoTier1 *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)ASRSchemaASRDictationVoiceCommandInfoTier1;
  v5 = -[ASRSchemaASRDictationVoiceCommandInfoTier1 init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("previousUtterance"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[ASRSchemaASRDictationVoiceCommandInfoTier1 setPreviousUtterance:](v5, "setPreviousUtterance:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("commandUtterance"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[ASRSchemaASRDictationVoiceCommandInfoTier1 setCommandUtterance:](v5, "setCommandUtterance:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("target"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = (void *)objc_msgSend(v10, "copy");
      -[ASRSchemaASRDictationVoiceCommandInfoTier1 setTarget:](v5, "setTarget:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("payload"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = (void *)objc_msgSend(v12, "copy");
      -[ASRSchemaASRDictationVoiceCommandInfoTier1 setPayload:](v5, "setPayload:", v13);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dictationVoiceCommandLinkId"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v14);
      -[ASRSchemaASRDictationVoiceCommandInfoTier1 setDictationVoiceCommandLinkId:](v5, "setDictationVoiceCommandLinkId:", v15);

    }
    v16 = v5;

  }
  return v5;
}

- (NSString)previousUtterance
{
  return self->_previousUtterance;
}

- (void)setPreviousUtterance:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)commandUtterance
{
  return self->_commandUtterance;
}

- (void)setCommandUtterance:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)target
{
  return self->_target;
}

- (void)setTarget:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)payload
{
  return self->_payload;
}

- (void)setPayload:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (SISchemaUUID)dictationVoiceCommandLinkId
{
  return self->_dictationVoiceCommandLinkId;
}

- (void)setDictationVoiceCommandLinkId:(id)a3
{
  objc_storeStrong((id *)&self->_dictationVoiceCommandLinkId, a3);
}

- (void)setHasPreviousUtterance:(BOOL)a3
{
  self->_hasPreviousUtterance = a3;
}

- (void)setHasCommandUtterance:(BOOL)a3
{
  self->_hasCommandUtterance = a3;
}

- (void)setHasTarget:(BOOL)a3
{
  self->_hasTarget = a3;
}

- (void)setHasPayload:(BOOL)a3
{
  self->_hasPayload = a3;
}

- (void)setHasDictationVoiceCommandLinkId:(BOOL)a3
{
  self->_hasDictationVoiceCommandLinkId = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictationVoiceCommandLinkId, 0);
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_target, 0);
  objc_storeStrong((id *)&self->_commandUtterance, 0);
  objc_storeStrong((id *)&self->_previousUtterance, 0);
}

@end
