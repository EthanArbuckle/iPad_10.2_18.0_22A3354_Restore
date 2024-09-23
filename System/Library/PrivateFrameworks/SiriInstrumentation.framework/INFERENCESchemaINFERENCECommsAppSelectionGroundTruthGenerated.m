@implementation INFERENCESchemaINFERENCECommsAppSelectionGroundTruthGenerated

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
  void *v11;
  void *v12;
  int v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)INFERENCESchemaINFERENCECommsAppSelectionGroundTruthGenerated;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v15, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[INFERENCESchemaINFERENCECommsAppSelectionGroundTruthGenerated inferenceCommsAppSelectionTrainingAppIndependentSignals](self, "inferenceCommsAppSelectionTrainingAppIndependentSignals");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[INFERENCESchemaINFERENCECommsAppSelectionGroundTruthGenerated deleteInferenceCommsAppSelectionTrainingAppIndependentSignals](self, "deleteInferenceCommsAppSelectionTrainingAppIndependentSignals");
  -[INFERENCESchemaINFERENCECommsAppSelectionGroundTruthGenerated inferenceCommsAppSelectionTrainingAppDependentSignals](self, "inferenceCommsAppSelectionTrainingAppDependentSignals");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v9, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[INFERENCESchemaINFERENCECommsAppSelectionGroundTruthGenerated setInferenceCommsAppSelectionTrainingAppDependentSignals:](self, "setInferenceCommsAppSelectionTrainingAppDependentSignals:", v10);

  -[INFERENCESchemaINFERENCECommsAppSelectionGroundTruthGenerated crrCommsAppSelectionJointId](self, "crrCommsAppSelectionJointId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "applySensitiveConditionsPolicy:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "suppressMessage");

  if (v13)
    -[INFERENCESchemaINFERENCECommsAppSelectionGroundTruthGenerated deleteCrrCommsAppSelectionJointId](self, "deleteCrrCommsAppSelectionJointId");

  return v5;
}

- (BOOL)hasInferenceCommsAppSelectionTrainingAppIndependentSignals
{
  return self->_inferenceCommsAppSelectionTrainingAppIndependentSignals != 0;
}

- (void)deleteInferenceCommsAppSelectionTrainingAppIndependentSignals
{
  -[INFERENCESchemaINFERENCECommsAppSelectionGroundTruthGenerated setInferenceCommsAppSelectionTrainingAppIndependentSignals:](self, "setInferenceCommsAppSelectionTrainingAppIndependentSignals:", 0);
}

- (void)clearInferenceCommsAppSelectionTrainingAppDependentSignals
{
  -[NSArray removeAllObjects](self->_inferenceCommsAppSelectionTrainingAppDependentSignals, "removeAllObjects");
}

- (void)addInferenceCommsAppSelectionTrainingAppDependentSignals:(id)a3
{
  id v4;
  NSArray *inferenceCommsAppSelectionTrainingAppDependentSignals;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  inferenceCommsAppSelectionTrainingAppDependentSignals = self->_inferenceCommsAppSelectionTrainingAppDependentSignals;
  v8 = v4;
  if (!inferenceCommsAppSelectionTrainingAppDependentSignals)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_inferenceCommsAppSelectionTrainingAppDependentSignals;
    self->_inferenceCommsAppSelectionTrainingAppDependentSignals = v6;

    v4 = v8;
    inferenceCommsAppSelectionTrainingAppDependentSignals = self->_inferenceCommsAppSelectionTrainingAppDependentSignals;
  }
  -[NSArray addObject:](inferenceCommsAppSelectionTrainingAppDependentSignals, "addObject:", v4);

}

- (unint64_t)inferenceCommsAppSelectionTrainingAppDependentSignalsCount
{
  return -[NSArray count](self->_inferenceCommsAppSelectionTrainingAppDependentSignals, "count");
}

- (id)inferenceCommsAppSelectionTrainingAppDependentSignalsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_inferenceCommsAppSelectionTrainingAppDependentSignals, "objectAtIndexedSubscript:", a3);
}

- (BOOL)hasCrrCommsAppSelectionJointId
{
  return self->_crrCommsAppSelectionJointId != 0;
}

- (void)deleteCrrCommsAppSelectionJointId
{
  -[INFERENCESchemaINFERENCECommsAppSelectionGroundTruthGenerated setCrrCommsAppSelectionJointId:](self, "setCrrCommsAppSelectionJointId:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return INFERENCESchemaINFERENCECommsAppSelectionGroundTruthGeneratedReadFrom(self, (uint64_t)a3);
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
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[INFERENCESchemaINFERENCECommsAppSelectionGroundTruthGenerated inferenceCommsAppSelectionTrainingAppIndependentSignals](self, "inferenceCommsAppSelectionTrainingAppIndependentSignals");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[INFERENCESchemaINFERENCECommsAppSelectionGroundTruthGenerated inferenceCommsAppSelectionTrainingAppIndependentSignals](self, "inferenceCommsAppSelectionTrainingAppIndependentSignals");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = self->_inferenceCommsAppSelectionTrainingAppDependentSignals;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        PBDataWriterWriteSubmessage();
        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  -[INFERENCESchemaINFERENCECommsAppSelectionGroundTruthGenerated crrCommsAppSelectionJointId](self, "crrCommsAppSelectionJointId", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[INFERENCESchemaINFERENCECommsAppSelectionGroundTruthGenerated crrCommsAppSelectionJointId](self, "crrCommsAppSelectionJointId");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
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
  -[INFERENCESchemaINFERENCECommsAppSelectionGroundTruthGenerated inferenceCommsAppSelectionTrainingAppIndependentSignals](self, "inferenceCommsAppSelectionTrainingAppIndependentSignals");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "inferenceCommsAppSelectionTrainingAppIndependentSignals");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[INFERENCESchemaINFERENCECommsAppSelectionGroundTruthGenerated inferenceCommsAppSelectionTrainingAppIndependentSignals](self, "inferenceCommsAppSelectionTrainingAppIndependentSignals");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[INFERENCESchemaINFERENCECommsAppSelectionGroundTruthGenerated inferenceCommsAppSelectionTrainingAppIndependentSignals](self, "inferenceCommsAppSelectionTrainingAppIndependentSignals");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "inferenceCommsAppSelectionTrainingAppIndependentSignals");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_17;
  }
  else
  {

  }
  -[INFERENCESchemaINFERENCECommsAppSelectionGroundTruthGenerated inferenceCommsAppSelectionTrainingAppDependentSignals](self, "inferenceCommsAppSelectionTrainingAppDependentSignals");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "inferenceCommsAppSelectionTrainingAppDependentSignals");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[INFERENCESchemaINFERENCECommsAppSelectionGroundTruthGenerated inferenceCommsAppSelectionTrainingAppDependentSignals](self, "inferenceCommsAppSelectionTrainingAppDependentSignals");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[INFERENCESchemaINFERENCECommsAppSelectionGroundTruthGenerated inferenceCommsAppSelectionTrainingAppDependentSignals](self, "inferenceCommsAppSelectionTrainingAppDependentSignals");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "inferenceCommsAppSelectionTrainingAppDependentSignals");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_17;
  }
  else
  {

  }
  -[INFERENCESchemaINFERENCECommsAppSelectionGroundTruthGenerated crrCommsAppSelectionJointId](self, "crrCommsAppSelectionJointId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "crrCommsAppSelectionJointId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[INFERENCESchemaINFERENCECommsAppSelectionGroundTruthGenerated crrCommsAppSelectionJointId](self, "crrCommsAppSelectionJointId");
    v17 = objc_claimAutoreleasedReturnValue();
    if (!v17)
    {

LABEL_20:
      v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    -[INFERENCESchemaINFERENCECommsAppSelectionGroundTruthGenerated crrCommsAppSelectionJointId](self, "crrCommsAppSelectionJointId");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "crrCommsAppSelectionJointId");
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
  uint64_t v4;

  v3 = -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppIndependentSignals hash](self->_inferenceCommsAppSelectionTrainingAppIndependentSignals, "hash");
  v4 = -[NSArray hash](self->_inferenceCommsAppSelectionTrainingAppDependentSignals, "hash") ^ v3;
  return v4 ^ -[SISchemaUUID hash](self->_crrCommsAppSelectionJointId, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_crrCommsAppSelectionJointId)
  {
    -[INFERENCESchemaINFERENCECommsAppSelectionGroundTruthGenerated crrCommsAppSelectionJointId](self, "crrCommsAppSelectionJointId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("crrCommsAppSelectionJointId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("crrCommsAppSelectionJointId"));

    }
  }
  if (-[NSArray count](self->_inferenceCommsAppSelectionTrainingAppDependentSignals, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v8 = self->_inferenceCommsAppSelectionTrainingAppDependentSignals;
    v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v20 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v19);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
          {
            objc_msgSend(v7, "addObject:", v13);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "addObject:", v14);

          }
        }
        v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v10);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("inferenceCommsAppSelectionTrainingAppDependentSignals"));
  }
  if (self->_inferenceCommsAppSelectionTrainingAppIndependentSignals)
  {
    -[INFERENCESchemaINFERENCECommsAppSelectionGroundTruthGenerated inferenceCommsAppSelectionTrainingAppIndependentSignals](self, "inferenceCommsAppSelectionTrainingAppIndependentSignals");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "dictionaryRepresentation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("inferenceCommsAppSelectionTrainingAppIndependentSignals"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("inferenceCommsAppSelectionTrainingAppIndependentSignals"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (_QWORD)v19);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[INFERENCESchemaINFERENCECommsAppSelectionGroundTruthGenerated dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (INFERENCESchemaINFERENCECommsAppSelectionGroundTruthGenerated)initWithJSON:(id)a3
{
  void *v4;
  INFERENCESchemaINFERENCECommsAppSelectionGroundTruthGenerated *v5;
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
    self = -[INFERENCESchemaINFERENCECommsAppSelectionGroundTruthGenerated initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (INFERENCESchemaINFERENCECommsAppSelectionGroundTruthGenerated)initWithDictionary:(id)a3
{
  id v4;
  INFERENCESchemaINFERENCECommsAppSelectionGroundTruthGenerated *v5;
  void *v6;
  INFERENCESchemaINFERENCECommsAppSelectionTrainingAppIndependentSignals *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentSignals *v15;
  void *v16;
  SISchemaUUID *v17;
  INFERENCESchemaINFERENCECommsAppSelectionGroundTruthGenerated *v18;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  objc_super v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)INFERENCESchemaINFERENCECommsAppSelectionGroundTruthGenerated;
  v5 = -[INFERENCESchemaINFERENCECommsAppSelectionGroundTruthGenerated init](&v25, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("inferenceCommsAppSelectionTrainingAppIndependentSignals"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppIndependentSignals initWithDictionary:]([INFERENCESchemaINFERENCECommsAppSelectionTrainingAppIndependentSignals alloc], "initWithDictionary:", v6);
      -[INFERENCESchemaINFERENCECommsAppSelectionGroundTruthGenerated setInferenceCommsAppSelectionTrainingAppIndependentSignals:](v5, "setInferenceCommsAppSelectionTrainingAppIndependentSignals:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("inferenceCommsAppSelectionTrainingAppDependentSignals"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v20 = v6;
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      v9 = v8;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v22;
        do
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v22 != v12)
              objc_enumerationMutation(v9);
            v14 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v13);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v15 = -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentSignals initWithDictionary:]([INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentSignals alloc], "initWithDictionary:", v14);
              -[INFERENCESchemaINFERENCECommsAppSelectionGroundTruthGenerated addInferenceCommsAppSelectionTrainingAppDependentSignals:](v5, "addInferenceCommsAppSelectionTrainingAppDependentSignals:", v15);

            }
            ++v13;
          }
          while (v11 != v13);
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
        }
        while (v11);
      }

      v6 = v20;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("crrCommsAppSelectionJointId"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v16);
      -[INFERENCESchemaINFERENCECommsAppSelectionGroundTruthGenerated setCrrCommsAppSelectionJointId:](v5, "setCrrCommsAppSelectionJointId:", v17);

    }
    v18 = v5;

  }
  return v5;
}

- (INFERENCESchemaINFERENCECommsAppSelectionTrainingAppIndependentSignals)inferenceCommsAppSelectionTrainingAppIndependentSignals
{
  return self->_inferenceCommsAppSelectionTrainingAppIndependentSignals;
}

- (void)setInferenceCommsAppSelectionTrainingAppIndependentSignals:(id)a3
{
  objc_storeStrong((id *)&self->_inferenceCommsAppSelectionTrainingAppIndependentSignals, a3);
}

- (NSArray)inferenceCommsAppSelectionTrainingAppDependentSignals
{
  return self->_inferenceCommsAppSelectionTrainingAppDependentSignals;
}

- (void)setInferenceCommsAppSelectionTrainingAppDependentSignals:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (SISchemaUUID)crrCommsAppSelectionJointId
{
  return self->_crrCommsAppSelectionJointId;
}

- (void)setCrrCommsAppSelectionJointId:(id)a3
{
  objc_storeStrong((id *)&self->_crrCommsAppSelectionJointId, a3);
}

- (void)setHasInferenceCommsAppSelectionTrainingAppIndependentSignals:(BOOL)a3
{
  self->_hasInferenceCommsAppSelectionTrainingAppIndependentSignals = a3;
}

- (void)setHasCrrCommsAppSelectionJointId:(BOOL)a3
{
  self->_hasCrrCommsAppSelectionJointId = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_crrCommsAppSelectionJointId, 0);
  objc_storeStrong((id *)&self->_inferenceCommsAppSelectionTrainingAppDependentSignals, 0);
  objc_storeStrong((id *)&self->_inferenceCommsAppSelectionTrainingAppIndependentSignals, 0);
}

@end
