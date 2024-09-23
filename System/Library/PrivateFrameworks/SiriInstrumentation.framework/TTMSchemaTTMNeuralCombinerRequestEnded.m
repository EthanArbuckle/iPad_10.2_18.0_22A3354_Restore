@implementation TTMSchemaTTMNeuralCombinerRequestEnded

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
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)TTMSchemaTTMNeuralCombinerRequestEnded;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v11, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TTMSchemaTTMNeuralCombinerRequestEnded results](self, "results", v11.receiver, v11.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TTMSchemaTTMNeuralCombinerRequestEnded setResults:](self, "setResults:", v7);

  -[TTMSchemaTTMNeuralCombinerRequestEnded asset](self, "asset");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "applySensitiveConditionsPolicy:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v9, "suppressMessage");
  if ((_DWORD)v4)
    -[TTMSchemaTTMNeuralCombinerRequestEnded deleteAsset](self, "deleteAsset");
  return v5;
}

- (void)clearResults
{
  -[NSArray removeAllObjects](self->_results, "removeAllObjects");
}

- (void)addResults:(id)a3
{
  id v4;
  NSArray *results;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  results = self->_results;
  v8 = v4;
  if (!results)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_results;
    self->_results = v6;

    v4 = v8;
    results = self->_results;
  }
  -[NSArray addObject:](results, "addObject:", v4);

}

- (unint64_t)resultsCount
{
  return -[NSArray count](self->_results, "count");
}

- (id)resultsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_results, "objectAtIndexedSubscript:", a3);
}

- (BOOL)hasAsset
{
  return self->_asset != 0;
}

- (void)deleteAsset
{
  -[TTMSchemaTTMNeuralCombinerRequestEnded setAsset:](self, "setAsset:", 0);
}

- (void)setNeuralCombinerThreshold:(float)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_neuralCombinerThreshold = a3;
}

- (BOOL)hasNeuralCombinerThreshold
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasNeuralCombinerThreshold:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteNeuralCombinerThreshold
{
  double v2;

  LODWORD(v2) = 0;
  -[TTMSchemaTTMNeuralCombinerRequestEnded setNeuralCombinerThreshold:](self, "setNeuralCombinerThreshold:", v2);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)hasMitigationAssetVersion
{
  return self->_mitigationAssetVersion != 0;
}

- (void)deleteMitigationAssetVersion
{
  -[TTMSchemaTTMNeuralCombinerRequestEnded setMitigationAssetVersion:](self, "setMitigationAssetVersion:", 0);
}

- (void)setSpeakerIdThreshold:(float)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_speakerIdThreshold = a3;
}

- (BOOL)hasSpeakerIdThreshold
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasSpeakerIdThreshold:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteSpeakerIdThreshold
{
  double v2;

  LODWORD(v2) = 0;
  -[TTMSchemaTTMNeuralCombinerRequestEnded setSpeakerIdThreshold:](self, "setSpeakerIdThreshold:", v2);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)readFrom:(id)a3
{
  double v3;

  return TTMSchemaTTMNeuralCombinerRequestEndedReadFrom(self, (uint64_t)a3, v3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_results;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  -[TTMSchemaTTMNeuralCombinerRequestEnded asset](self, "asset", v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[TTMSchemaTTMNeuralCombinerRequestEnded asset](self, "asset");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteFloatField();
  -[TTMSchemaTTMNeuralCombinerRequestEnded mitigationAssetVersion](self, "mitigationAssetVersion");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteFloatField();

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
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  float neuralCombinerThreshold;
  float v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  BOOL v24;
  int v26;
  float speakerIdThreshold;
  float v28;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_20;
  -[TTMSchemaTTMNeuralCombinerRequestEnded results](self, "results");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "results");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_19;
  -[TTMSchemaTTMNeuralCombinerRequestEnded results](self, "results");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[TTMSchemaTTMNeuralCombinerRequestEnded results](self, "results");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "results");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_20;
  }
  else
  {

  }
  -[TTMSchemaTTMNeuralCombinerRequestEnded asset](self, "asset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "asset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_19;
  -[TTMSchemaTTMNeuralCombinerRequestEnded asset](self, "asset");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[TTMSchemaTTMNeuralCombinerRequestEnded asset](self, "asset");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "asset");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_20;
  }
  else
  {

  }
  if ((*(_BYTE *)&self->_has & 1) != (v4[44] & 1))
    goto LABEL_20;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    neuralCombinerThreshold = self->_neuralCombinerThreshold;
    objc_msgSend(v4, "neuralCombinerThreshold");
    if (neuralCombinerThreshold != v18)
      goto LABEL_20;
  }
  -[TTMSchemaTTMNeuralCombinerRequestEnded mitigationAssetVersion](self, "mitigationAssetVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mitigationAssetVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_19:

    goto LABEL_20;
  }
  -[TTMSchemaTTMNeuralCombinerRequestEnded mitigationAssetVersion](self, "mitigationAssetVersion");
  v19 = objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v20 = (void *)v19;
    -[TTMSchemaTTMNeuralCombinerRequestEnded mitigationAssetVersion](self, "mitigationAssetVersion");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mitigationAssetVersion");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v21, "isEqual:", v22);

    if (!v23)
      goto LABEL_20;
  }
  else
  {

  }
  v26 = (*(_BYTE *)&self->_has >> 1) & 1;
  if (v26 == ((v4[44] >> 1) & 1))
  {
    if (!v26
      || (speakerIdThreshold = self->_speakerIdThreshold,
          objc_msgSend(v4, "speakerIdThreshold"),
          speakerIdThreshold == v28))
    {
      v24 = 1;
      goto LABEL_21;
    }
  }
LABEL_20:
  v24 = 0;
LABEL_21:

  return v24;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  float neuralCombinerThreshold;
  double v7;
  long double v8;
  double v9;
  NSUInteger v10;
  unint64_t v11;
  float speakerIdThreshold;
  double v13;
  long double v14;
  double v15;

  v3 = -[NSArray hash](self->_results, "hash");
  v4 = -[SISchemaAsset hash](self->_asset, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    neuralCombinerThreshold = self->_neuralCombinerThreshold;
    v7 = neuralCombinerThreshold;
    if (neuralCombinerThreshold < 0.0)
      v7 = -neuralCombinerThreshold;
    v8 = floor(v7 + 0.5);
    v9 = (v7 - v8) * 1.84467441e19;
    v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0)
        v5 += (unint64_t)v9;
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    v5 = 0;
  }
  v10 = -[NSString hash](self->_mitigationAssetVersion, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    speakerIdThreshold = self->_speakerIdThreshold;
    v13 = speakerIdThreshold;
    if (speakerIdThreshold < 0.0)
      v13 = -speakerIdThreshold;
    v14 = floor(v13 + 0.5);
    v15 = (v13 - v14) * 1.84467441e19;
    v11 = 2654435761u * (unint64_t)fmod(v14, 1.84467441e19);
    if (v15 >= 0.0)
    {
      if (v15 > 0.0)
        v11 += (unint64_t)v15;
    }
    else
    {
      v11 -= (unint64_t)fabs(v15);
    }
  }
  else
  {
    v11 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v10 ^ v11;
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
  NSArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_asset)
  {
    -[TTMSchemaTTMNeuralCombinerRequestEnded asset](self, "asset");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("asset"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("asset"));

    }
  }
  if (self->_mitigationAssetVersion)
  {
    -[TTMSchemaTTMNeuralCombinerRequestEnded mitigationAssetVersion](self, "mitigationAssetVersion");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("mitigationAssetVersion"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v9 = (void *)MEMORY[0x1E0CB37E8];
    -[TTMSchemaTTMNeuralCombinerRequestEnded neuralCombinerThreshold](self, "neuralCombinerThreshold");
    objc_msgSend(v9, "numberWithFloat:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("neuralCombinerThreshold"));

  }
  if (-[NSArray count](self->_results, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v12 = self->_results;
    v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v23 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "dictionaryRepresentation");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17)
          {
            objc_msgSend(v11, "addObject:", v17);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "addObject:", v18);

          }
        }
        v14 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v14);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("results"));
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v19 = (void *)MEMORY[0x1E0CB37E8];
    -[TTMSchemaTTMNeuralCombinerRequestEnded speakerIdThreshold](self, "speakerIdThreshold");
    objc_msgSend(v19, "numberWithFloat:");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("speakerIdThreshold"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[TTMSchemaTTMNeuralCombinerRequestEnded dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (TTMSchemaTTMNeuralCombinerRequestEnded)initWithJSON:(id)a3
{
  void *v4;
  TTMSchemaTTMNeuralCombinerRequestEnded *v5;
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
    self = -[TTMSchemaTTMNeuralCombinerRequestEnded initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (TTMSchemaTTMNeuralCombinerRequestEnded)initWithDictionary:(id)a3
{
  id v4;
  TTMSchemaTTMNeuralCombinerRequestEnded *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  TTMSchemaTTMNeuralCombinerTCUResult *v13;
  TTMSchemaTTMNeuralCombinerTCUResult *v14;
  void *v15;
  SISchemaAsset *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  TTMSchemaTTMNeuralCombinerRequestEnded *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  objc_super v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)TTMSchemaTTMNeuralCombinerRequestEnded;
  v5 = -[TTMSchemaTTMNeuralCombinerRequestEnded init](&v27, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("results"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v7 = v6;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v24;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v24 != v10)
              objc_enumerationMutation(v7);
            v12 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v11);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v13 = [TTMSchemaTTMNeuralCombinerTCUResult alloc];
              v14 = -[TTMSchemaTTMNeuralCombinerTCUResult initWithDictionary:](v13, "initWithDictionary:", v12, (_QWORD)v23);
              -[TTMSchemaTTMNeuralCombinerRequestEnded addResults:](v5, "addResults:", v14);

            }
            ++v11;
          }
          while (v9 != v11);
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
        }
        while (v9);
      }

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("asset"), (_QWORD)v23);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16 = -[SISchemaAsset initWithDictionary:]([SISchemaAsset alloc], "initWithDictionary:", v15);
      -[TTMSchemaTTMNeuralCombinerRequestEnded setAsset:](v5, "setAsset:", v16);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("neuralCombinerThreshold"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v17, "floatValue");
      -[TTMSchemaTTMNeuralCombinerRequestEnded setNeuralCombinerThreshold:](v5, "setNeuralCombinerThreshold:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mitigationAssetVersion"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = (void *)objc_msgSend(v18, "copy");
      -[TTMSchemaTTMNeuralCombinerRequestEnded setMitigationAssetVersion:](v5, "setMitigationAssetVersion:", v19);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("speakerIdThreshold"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v20, "floatValue");
      -[TTMSchemaTTMNeuralCombinerRequestEnded setSpeakerIdThreshold:](v5, "setSpeakerIdThreshold:");
    }
    v21 = v5;

  }
  return v5;
}

- (NSArray)results
{
  return self->_results;
}

- (void)setResults:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (SISchemaAsset)asset
{
  return self->_asset;
}

- (void)setAsset:(id)a3
{
  objc_storeStrong((id *)&self->_asset, a3);
}

- (float)neuralCombinerThreshold
{
  return self->_neuralCombinerThreshold;
}

- (NSString)mitigationAssetVersion
{
  return self->_mitigationAssetVersion;
}

- (void)setMitigationAssetVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (float)speakerIdThreshold
{
  return self->_speakerIdThreshold;
}

- (void)setHasAsset:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasMitigationAssetVersion:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mitigationAssetVersion, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_results, 0);
}

@end
