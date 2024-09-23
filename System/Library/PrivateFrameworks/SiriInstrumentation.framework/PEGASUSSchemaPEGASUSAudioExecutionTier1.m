@implementation PEGASUSSchemaPEGASUSAudioExecutionTier1

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
  v13.super_class = (Class)PEGASUSSchemaPEGASUSAudioExecutionTier1;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v13, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isConditionSet:", 2))
  {
    -[PEGASUSSchemaPEGASUSAudioExecutionTier1 deleteAudioLaunchId](self, "deleteAudioLaunchId");
    -[PEGASUSSchemaPEGASUSAudioExecutionTier1 deleteAudioType](self, "deleteAudioType");
    -[PEGASUSSchemaPEGASUSAudioExecutionTier1 deleteAudioInternalSignals](self, "deleteAudioInternalSignals");
  }
  if (objc_msgSend(v4, "isConditionSet:", 4))
  {
    -[PEGASUSSchemaPEGASUSAudioExecutionTier1 deleteAudioLaunchId](self, "deleteAudioLaunchId");
    -[PEGASUSSchemaPEGASUSAudioExecutionTier1 deleteAudioType](self, "deleteAudioType");
    -[PEGASUSSchemaPEGASUSAudioExecutionTier1 deleteAudioInternalSignals](self, "deleteAudioInternalSignals");
  }
  if (objc_msgSend(v4, "isConditionSet:", 5))
  {
    -[PEGASUSSchemaPEGASUSAudioExecutionTier1 deleteAudioLaunchId](self, "deleteAudioLaunchId");
    -[PEGASUSSchemaPEGASUSAudioExecutionTier1 deleteAudioType](self, "deleteAudioType");
    -[PEGASUSSchemaPEGASUSAudioExecutionTier1 deleteAudioInternalSignals](self, "deleteAudioInternalSignals");
  }
  if (objc_msgSend(v4, "isConditionSet:", 6))
  {
    -[PEGASUSSchemaPEGASUSAudioExecutionTier1 deleteAudioLaunchId](self, "deleteAudioLaunchId");
    -[PEGASUSSchemaPEGASUSAudioExecutionTier1 deleteAudioType](self, "deleteAudioType");
    -[PEGASUSSchemaPEGASUSAudioExecutionTier1 deleteAudioInternalSignals](self, "deleteAudioInternalSignals");
  }
  if (objc_msgSend(v4, "isConditionSet:", 7))
  {
    -[PEGASUSSchemaPEGASUSAudioExecutionTier1 deleteAudioLaunchId](self, "deleteAudioLaunchId");
    -[PEGASUSSchemaPEGASUSAudioExecutionTier1 deleteAudioType](self, "deleteAudioType");
    -[PEGASUSSchemaPEGASUSAudioExecutionTier1 deleteAudioInternalSignals](self, "deleteAudioInternalSignals");
  }
  -[PEGASUSSchemaPEGASUSAudioExecutionTier1 audioUnderstandingTier1](self, "audioUnderstandingTier1");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[PEGASUSSchemaPEGASUSAudioExecutionTier1 deleteAudioUnderstandingTier1](self, "deleteAudioUnderstandingTier1");
  -[PEGASUSSchemaPEGASUSAudioExecutionTier1 audioQueueStateInfoTier1](self, "audioQueueStateInfoTier1");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[PEGASUSSchemaPEGASUSAudioExecutionTier1 deleteAudioQueueStateInfoTier1](self, "deleteAudioQueueStateInfoTier1");

  return v5;
}

- (BOOL)hasAudioLaunchId
{
  return self->_audioLaunchId != 0;
}

- (void)deleteAudioLaunchId
{
  -[PEGASUSSchemaPEGASUSAudioExecutionTier1 setAudioLaunchId:](self, "setAudioLaunchId:", 0);
}

- (BOOL)hasAudioType
{
  return self->_audioType != 0;
}

- (void)deleteAudioType
{
  -[PEGASUSSchemaPEGASUSAudioExecutionTier1 setAudioType:](self, "setAudioType:", 0);
}

- (void)clearAudioInternalSignals
{
  -[NSArray removeAllObjects](self->_audioInternalSignals, "removeAllObjects");
}

- (void)addAudioInternalSignals:(id)a3
{
  id v4;
  NSArray *audioInternalSignals;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  audioInternalSignals = self->_audioInternalSignals;
  v8 = v4;
  if (!audioInternalSignals)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_audioInternalSignals;
    self->_audioInternalSignals = v6;

    v4 = v8;
    audioInternalSignals = self->_audioInternalSignals;
  }
  -[NSArray addObject:](audioInternalSignals, "addObject:", v4);

}

- (unint64_t)audioInternalSignalsCount
{
  return -[NSArray count](self->_audioInternalSignals, "count");
}

- (id)audioInternalSignalsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_audioInternalSignals, "objectAtIndexedSubscript:", a3);
}

- (BOOL)hasAudioUnderstandingTier1
{
  return self->_audioUnderstandingTier1 != 0;
}

- (void)deleteAudioUnderstandingTier1
{
  -[PEGASUSSchemaPEGASUSAudioExecutionTier1 setAudioUnderstandingTier1:](self, "setAudioUnderstandingTier1:", 0);
}

- (BOOL)hasAudioQueueStateInfoTier1
{
  return self->_audioQueueStateInfoTier1 != 0;
}

- (void)deleteAudioQueueStateInfoTier1
{
  -[PEGASUSSchemaPEGASUSAudioExecutionTier1 setAudioQueueStateInfoTier1:](self, "setAudioQueueStateInfoTier1:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return PEGASUSSchemaPEGASUSAudioExecutionTier1ReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PEGASUSSchemaPEGASUSAudioExecutionTier1 audioLaunchId](self, "audioLaunchId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  -[PEGASUSSchemaPEGASUSAudioExecutionTier1 audioType](self, "audioType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    PBDataWriterWriteStringField();
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = self->_audioInternalSignals;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        PBDataWriterWriteStringField();
        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

  -[PEGASUSSchemaPEGASUSAudioExecutionTier1 audioUnderstandingTier1](self, "audioUnderstandingTier1", v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[PEGASUSSchemaPEGASUSAudioExecutionTier1 audioUnderstandingTier1](self, "audioUnderstandingTier1");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PEGASUSSchemaPEGASUSAudioExecutionTier1 audioQueueStateInfoTier1](self, "audioQueueStateInfoTier1");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[PEGASUSSchemaPEGASUSAudioExecutionTier1 audioQueueStateInfoTier1](self, "audioQueueStateInfoTier1");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
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
  -[PEGASUSSchemaPEGASUSAudioExecutionTier1 audioLaunchId](self, "audioLaunchId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "audioLaunchId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_26;
  -[PEGASUSSchemaPEGASUSAudioExecutionTier1 audioLaunchId](self, "audioLaunchId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[PEGASUSSchemaPEGASUSAudioExecutionTier1 audioLaunchId](self, "audioLaunchId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "audioLaunchId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_27;
  }
  else
  {

  }
  -[PEGASUSSchemaPEGASUSAudioExecutionTier1 audioType](self, "audioType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "audioType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_26;
  -[PEGASUSSchemaPEGASUSAudioExecutionTier1 audioType](self, "audioType");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[PEGASUSSchemaPEGASUSAudioExecutionTier1 audioType](self, "audioType");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "audioType");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_27;
  }
  else
  {

  }
  -[PEGASUSSchemaPEGASUSAudioExecutionTier1 audioInternalSignals](self, "audioInternalSignals");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "audioInternalSignals");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_26;
  -[PEGASUSSchemaPEGASUSAudioExecutionTier1 audioInternalSignals](self, "audioInternalSignals");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[PEGASUSSchemaPEGASUSAudioExecutionTier1 audioInternalSignals](self, "audioInternalSignals");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "audioInternalSignals");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_27;
  }
  else
  {

  }
  -[PEGASUSSchemaPEGASUSAudioExecutionTier1 audioUnderstandingTier1](self, "audioUnderstandingTier1");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "audioUnderstandingTier1");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_26;
  -[PEGASUSSchemaPEGASUSAudioExecutionTier1 audioUnderstandingTier1](self, "audioUnderstandingTier1");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[PEGASUSSchemaPEGASUSAudioExecutionTier1 audioUnderstandingTier1](self, "audioUnderstandingTier1");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "audioUnderstandingTier1");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_27;
  }
  else
  {

  }
  -[PEGASUSSchemaPEGASUSAudioExecutionTier1 audioQueueStateInfoTier1](self, "audioQueueStateInfoTier1");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "audioQueueStateInfoTier1");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[PEGASUSSchemaPEGASUSAudioExecutionTier1 audioQueueStateInfoTier1](self, "audioQueueStateInfoTier1");
    v27 = objc_claimAutoreleasedReturnValue();
    if (!v27)
    {

LABEL_30:
      v32 = 1;
      goto LABEL_28;
    }
    v28 = (void *)v27;
    -[PEGASUSSchemaPEGASUSAudioExecutionTier1 audioQueueStateInfoTier1](self, "audioQueueStateInfoTier1");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "audioQueueStateInfoTier1");
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
  uint64_t v5;
  unint64_t v6;

  v3 = -[NSString hash](self->_audioLaunchId, "hash");
  v4 = -[NSString hash](self->_audioType, "hash") ^ v3;
  v5 = -[NSArray hash](self->_audioInternalSignals, "hash");
  v6 = v4 ^ v5 ^ -[PEGASUSSchemaPEGASUSAudioUnderstandingTier1 hash](self->_audioUnderstandingTier1, "hash");
  return v6 ^ -[PEGASUSSchemaPEGASUSAudioQueueStateInfoTier1 hash](self->_audioQueueStateInfoTier1, "hash");
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_audioInternalSignals)
  {
    -[PEGASUSSchemaPEGASUSAudioExecutionTier1 audioInternalSignals](self, "audioInternalSignals");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("audioInternalSignals"));

  }
  if (self->_audioLaunchId)
  {
    -[PEGASUSSchemaPEGASUSAudioExecutionTier1 audioLaunchId](self, "audioLaunchId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("audioLaunchId"));

  }
  if (self->_audioQueueStateInfoTier1)
  {
    -[PEGASUSSchemaPEGASUSAudioExecutionTier1 audioQueueStateInfoTier1](self, "audioQueueStateInfoTier1");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("audioQueueStateInfoTier1"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("audioQueueStateInfoTier1"));

    }
  }
  if (self->_audioType)
  {
    -[PEGASUSSchemaPEGASUSAudioExecutionTier1 audioType](self, "audioType");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("audioType"));

  }
  if (self->_audioUnderstandingTier1)
  {
    -[PEGASUSSchemaPEGASUSAudioExecutionTier1 audioUnderstandingTier1](self, "audioUnderstandingTier1");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("audioUnderstandingTier1"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("audioUnderstandingTier1"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PEGASUSSchemaPEGASUSAudioExecutionTier1 dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (PEGASUSSchemaPEGASUSAudioExecutionTier1)initWithJSON:(id)a3
{
  void *v4;
  PEGASUSSchemaPEGASUSAudioExecutionTier1 *v5;
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
    self = -[PEGASUSSchemaPEGASUSAudioExecutionTier1 initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PEGASUSSchemaPEGASUSAudioExecutionTier1)initWithDictionary:(id)a3
{
  id v4;
  PEGASUSSchemaPEGASUSAudioExecutionTier1 *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  PEGASUSSchemaPEGASUSAudioUnderstandingTier1 *v19;
  void *v20;
  PEGASUSSchemaPEGASUSAudioQueueStateInfoTier1 *v21;
  PEGASUSSchemaPEGASUSAudioExecutionTier1 *v22;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  objc_super v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)PEGASUSSchemaPEGASUSAudioExecutionTier1;
  v5 = -[PEGASUSSchemaPEGASUSAudioExecutionTier1 init](&v29, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("audioLaunchId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[PEGASUSSchemaPEGASUSAudioExecutionTier1 setAudioLaunchId:](v5, "setAudioLaunchId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("audioType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[PEGASUSSchemaPEGASUSAudioExecutionTier1 setAudioType:](v5, "setAudioType:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("audioInternalSignals"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v24 = v6;
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      v11 = v10;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v26;
        do
        {
          v15 = 0;
          do
          {
            if (*(_QWORD *)v26 != v14)
              objc_enumerationMutation(v11);
            v16 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v15);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v17 = (void *)objc_msgSend(v16, "copy");
              -[PEGASUSSchemaPEGASUSAudioExecutionTier1 addAudioInternalSignals:](v5, "addAudioInternalSignals:", v17);

            }
            ++v15;
          }
          while (v13 != v15);
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
        }
        while (v13);
      }

      v6 = v24;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("audioUnderstandingTier1"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = -[PEGASUSSchemaPEGASUSAudioUnderstandingTier1 initWithDictionary:]([PEGASUSSchemaPEGASUSAudioUnderstandingTier1 alloc], "initWithDictionary:", v18);
      -[PEGASUSSchemaPEGASUSAudioExecutionTier1 setAudioUnderstandingTier1:](v5, "setAudioUnderstandingTier1:", v19);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("audioQueueStateInfoTier1"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v21 = -[PEGASUSSchemaPEGASUSAudioQueueStateInfoTier1 initWithDictionary:]([PEGASUSSchemaPEGASUSAudioQueueStateInfoTier1 alloc], "initWithDictionary:", v20);
      -[PEGASUSSchemaPEGASUSAudioExecutionTier1 setAudioQueueStateInfoTier1:](v5, "setAudioQueueStateInfoTier1:", v21);

    }
    v22 = v5;

  }
  return v5;
}

- (NSString)audioLaunchId
{
  return self->_audioLaunchId;
}

- (void)setAudioLaunchId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)audioType
{
  return self->_audioType;
}

- (void)setAudioType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)audioInternalSignals
{
  return self->_audioInternalSignals;
}

- (void)setAudioInternalSignals:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (PEGASUSSchemaPEGASUSAudioUnderstandingTier1)audioUnderstandingTier1
{
  return self->_audioUnderstandingTier1;
}

- (void)setAudioUnderstandingTier1:(id)a3
{
  objc_storeStrong((id *)&self->_audioUnderstandingTier1, a3);
}

- (PEGASUSSchemaPEGASUSAudioQueueStateInfoTier1)audioQueueStateInfoTier1
{
  return self->_audioQueueStateInfoTier1;
}

- (void)setAudioQueueStateInfoTier1:(id)a3
{
  objc_storeStrong((id *)&self->_audioQueueStateInfoTier1, a3);
}

- (void)setHasAudioLaunchId:(BOOL)a3
{
  self->_hasAudioLaunchId = a3;
}

- (void)setHasAudioType:(BOOL)a3
{
  self->_hasAudioType = a3;
}

- (void)setHasAudioUnderstandingTier1:(BOOL)a3
{
  self->_hasAudioUnderstandingTier1 = a3;
}

- (void)setHasAudioQueueStateInfoTier1:(BOOL)a3
{
  self->_hasAudioQueueStateInfoTier1 = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioQueueStateInfoTier1, 0);
  objc_storeStrong((id *)&self->_audioUnderstandingTier1, 0);
  objc_storeStrong((id *)&self->_audioInternalSignals, 0);
  objc_storeStrong((id *)&self->_audioType, 0);
  objc_storeStrong((id *)&self->_audioLaunchId, 0);
}

@end
