@implementation PEGASUSSchemaPEGASUSAudioExecution

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
  v16.super_class = (Class)PEGASUSSchemaPEGASUSAudioExecution;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v16, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PEGASUSSchemaPEGASUSAudioExecution audioPlaybackSignal](self, "audioPlaybackSignal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[PEGASUSSchemaPEGASUSAudioExecution deleteAudioPlaybackSignal](self, "deleteAudioPlaybackSignal");
  -[PEGASUSSchemaPEGASUSAudioExecution audioUnderstanding](self, "audioUnderstanding");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[PEGASUSSchemaPEGASUSAudioExecution deleteAudioUnderstanding](self, "deleteAudioUnderstanding");
  -[PEGASUSSchemaPEGASUSAudioExecution audioQueueStateInfo](self, "audioQueueStateInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[PEGASUSSchemaPEGASUSAudioExecution deleteAudioQueueStateInfo](self, "deleteAudioQueueStateInfo");

  return v5;
}

- (BOOL)hasAudioPlaybackSignal
{
  return self->_audioPlaybackSignal != 0;
}

- (void)deleteAudioPlaybackSignal
{
  -[PEGASUSSchemaPEGASUSAudioExecution setAudioPlaybackSignal:](self, "setAudioPlaybackSignal:", 0);
}

- (BOOL)hasAudioUnderstanding
{
  return self->_audioUnderstanding != 0;
}

- (void)deleteAudioUnderstanding
{
  -[PEGASUSSchemaPEGASUSAudioExecution setAudioUnderstanding:](self, "setAudioUnderstanding:", 0);
}

- (BOOL)hasAudioQueueStateInfo
{
  return self->_audioQueueStateInfo != 0;
}

- (void)deleteAudioQueueStateInfo
{
  -[PEGASUSSchemaPEGASUSAudioExecution setAudioQueueStateInfo:](self, "setAudioQueueStateInfo:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return PEGASUSSchemaPEGASUSAudioExecutionReadFrom(self, (uint64_t)a3);
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
  -[PEGASUSSchemaPEGASUSAudioExecution audioPlaybackSignal](self, "audioPlaybackSignal");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PEGASUSSchemaPEGASUSAudioExecution audioPlaybackSignal](self, "audioPlaybackSignal");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PEGASUSSchemaPEGASUSAudioExecution audioUnderstanding](self, "audioUnderstanding");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[PEGASUSSchemaPEGASUSAudioExecution audioUnderstanding](self, "audioUnderstanding");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PEGASUSSchemaPEGASUSAudioExecution audioQueueStateInfo](self, "audioQueueStateInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[PEGASUSSchemaPEGASUSAudioExecution audioQueueStateInfo](self, "audioQueueStateInfo");
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
  char v21;
  BOOL v22;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  -[PEGASUSSchemaPEGASUSAudioExecution audioPlaybackSignal](self, "audioPlaybackSignal");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "audioPlaybackSignal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[PEGASUSSchemaPEGASUSAudioExecution audioPlaybackSignal](self, "audioPlaybackSignal");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[PEGASUSSchemaPEGASUSAudioExecution audioPlaybackSignal](self, "audioPlaybackSignal");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "audioPlaybackSignal");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_17;
  }
  else
  {

  }
  -[PEGASUSSchemaPEGASUSAudioExecution audioUnderstanding](self, "audioUnderstanding");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "audioUnderstanding");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[PEGASUSSchemaPEGASUSAudioExecution audioUnderstanding](self, "audioUnderstanding");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[PEGASUSSchemaPEGASUSAudioExecution audioUnderstanding](self, "audioUnderstanding");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "audioUnderstanding");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_17;
  }
  else
  {

  }
  -[PEGASUSSchemaPEGASUSAudioExecution audioQueueStateInfo](self, "audioQueueStateInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "audioQueueStateInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[PEGASUSSchemaPEGASUSAudioExecution audioQueueStateInfo](self, "audioQueueStateInfo");
    v17 = objc_claimAutoreleasedReturnValue();
    if (!v17)
    {

LABEL_20:
      v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    -[PEGASUSSchemaPEGASUSAudioExecution audioQueueStateInfo](self, "audioQueueStateInfo");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "audioQueueStateInfo");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if ((v21 & 1) != 0)
      goto LABEL_20;
  }
  else
  {
LABEL_16:

  }
LABEL_17:
  v22 = 0;
LABEL_18:

  return v22;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;

  v3 = -[PEGASUSSchemaPEGASUSAudioPlaybackSignal hash](self->_audioPlaybackSignal, "hash");
  v4 = -[PEGASUSSchemaPEGASUSAudioUnderstanding hash](self->_audioUnderstanding, "hash") ^ v3;
  return v4 ^ -[PEGASUSSchemaPEGASUSAudioQueueStateInfo hash](self->_audioQueueStateInfo, "hash");
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_audioPlaybackSignal)
  {
    -[PEGASUSSchemaPEGASUSAudioExecution audioPlaybackSignal](self, "audioPlaybackSignal");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("audioPlaybackSignal"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("audioPlaybackSignal"));

    }
  }
  if (self->_audioQueueStateInfo)
  {
    -[PEGASUSSchemaPEGASUSAudioExecution audioQueueStateInfo](self, "audioQueueStateInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("audioQueueStateInfo"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("audioQueueStateInfo"));

    }
  }
  if (self->_audioUnderstanding)
  {
    -[PEGASUSSchemaPEGASUSAudioExecution audioUnderstanding](self, "audioUnderstanding");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("audioUnderstanding"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("audioUnderstanding"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PEGASUSSchemaPEGASUSAudioExecution dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (PEGASUSSchemaPEGASUSAudioExecution)initWithJSON:(id)a3
{
  void *v4;
  PEGASUSSchemaPEGASUSAudioExecution *v5;
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
    self = -[PEGASUSSchemaPEGASUSAudioExecution initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PEGASUSSchemaPEGASUSAudioExecution)initWithDictionary:(id)a3
{
  id v4;
  PEGASUSSchemaPEGASUSAudioExecution *v5;
  void *v6;
  PEGASUSSchemaPEGASUSAudioPlaybackSignal *v7;
  void *v8;
  PEGASUSSchemaPEGASUSAudioUnderstanding *v9;
  void *v10;
  PEGASUSSchemaPEGASUSAudioQueueStateInfo *v11;
  PEGASUSSchemaPEGASUSAudioExecution *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PEGASUSSchemaPEGASUSAudioExecution;
  v5 = -[PEGASUSSchemaPEGASUSAudioExecution init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("audioPlaybackSignal"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[PEGASUSSchemaPEGASUSAudioPlaybackSignal initWithDictionary:]([PEGASUSSchemaPEGASUSAudioPlaybackSignal alloc], "initWithDictionary:", v6);
      -[PEGASUSSchemaPEGASUSAudioExecution setAudioPlaybackSignal:](v5, "setAudioPlaybackSignal:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("audioUnderstanding"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[PEGASUSSchemaPEGASUSAudioUnderstanding initWithDictionary:]([PEGASUSSchemaPEGASUSAudioUnderstanding alloc], "initWithDictionary:", v8);
      -[PEGASUSSchemaPEGASUSAudioExecution setAudioUnderstanding:](v5, "setAudioUnderstanding:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("audioQueueStateInfo"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[PEGASUSSchemaPEGASUSAudioQueueStateInfo initWithDictionary:]([PEGASUSSchemaPEGASUSAudioQueueStateInfo alloc], "initWithDictionary:", v10);
      -[PEGASUSSchemaPEGASUSAudioExecution setAudioQueueStateInfo:](v5, "setAudioQueueStateInfo:", v11);

    }
    v12 = v5;

  }
  return v5;
}

- (PEGASUSSchemaPEGASUSAudioPlaybackSignal)audioPlaybackSignal
{
  return self->_audioPlaybackSignal;
}

- (void)setAudioPlaybackSignal:(id)a3
{
  objc_storeStrong((id *)&self->_audioPlaybackSignal, a3);
}

- (PEGASUSSchemaPEGASUSAudioUnderstanding)audioUnderstanding
{
  return self->_audioUnderstanding;
}

- (void)setAudioUnderstanding:(id)a3
{
  objc_storeStrong((id *)&self->_audioUnderstanding, a3);
}

- (PEGASUSSchemaPEGASUSAudioQueueStateInfo)audioQueueStateInfo
{
  return self->_audioQueueStateInfo;
}

- (void)setAudioQueueStateInfo:(id)a3
{
  objc_storeStrong((id *)&self->_audioQueueStateInfo, a3);
}

- (void)setHasAudioPlaybackSignal:(BOOL)a3
{
  self->_hasAudioPlaybackSignal = a3;
}

- (void)setHasAudioUnderstanding:(BOOL)a3
{
  self->_hasAudioUnderstanding = a3;
}

- (void)setHasAudioQueueStateInfo:(BOOL)a3
{
  self->_hasAudioQueueStateInfo = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioQueueStateInfo, 0);
  objc_storeStrong((id *)&self->_audioUnderstanding, 0);
  objc_storeStrong((id *)&self->_audioPlaybackSignal, 0);
}

@end
