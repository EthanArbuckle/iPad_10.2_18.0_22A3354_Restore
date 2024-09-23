@implementation ASRSchemaASRInterpolationWeightBundle

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setStartTimeInNs:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_startTimeInNs = a3;
}

- (BOOL)hasStartTimeInNs
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasStartTimeInNs:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteStartTimeInNs
{
  -[ASRSchemaASRInterpolationWeightBundle setStartTimeInNs:](self, "setStartTimeInNs:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setEndTimeInNs:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_endTimeInNs = a3;
}

- (BOOL)hasEndTimeInNs
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasEndTimeInNs:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteEndTimeInNs
{
  -[ASRSchemaASRInterpolationWeightBundle setEndTimeInNs:](self, "setEndTimeInNs:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)clearWeights
{
  -[NSArray removeAllObjects](self->_weights, "removeAllObjects");
}

- (void)addWeights:(float)a3
{
  NSArray *weights;
  NSArray *v6;
  NSArray *v7;
  double v8;
  id v9;

  weights = self->_weights;
  if (!weights)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_weights;
    self->_weights = v6;

    weights = self->_weights;
  }
  *(float *)&v8 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[NSArray addObject:](weights, "addObject:", v9);

}

- (unint64_t)weightsCount
{
  return -[NSArray count](self->_weights, "count");
}

- (float)weightsAtIndex:(unint64_t)a3
{
  void *v3;
  float v4;
  float v5;

  -[NSArray objectAtIndexedSubscript:](self->_weights, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "floatValue");
  v5 = v4;

  return v5;
}

- (BOOL)readFrom:(id)a3
{
  double v3;

  return ASRSchemaASRInterpolationWeightBundleReadFrom(self, (uint64_t)a3, v3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteUint64Field();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = self->_weights;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "floatValue", (_QWORD)v11);
        PBDataWriterWriteFloatField();
      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $F60B79F1AEB0D1197C1771A21EE4FA2C has;
  unsigned int v6;
  unint64_t startTimeInNs;
  int v8;
  unint64_t endTimeInNs;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  BOOL v18;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  has = self->_has;
  v6 = v4[32];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_14;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    startTimeInNs = self->_startTimeInNs;
    if (startTimeInNs != objc_msgSend(v4, "startTimeInNs"))
      goto LABEL_14;
    has = self->_has;
    v6 = v4[32];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 == ((v6 >> 1) & 1))
  {
    if (!v8 || (endTimeInNs = self->_endTimeInNs, endTimeInNs == objc_msgSend(v4, "endTimeInNs")))
    {
      -[ASRSchemaASRInterpolationWeightBundle weights](self, "weights");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "weights");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if ((v10 == 0) != (v11 != 0))
      {
        -[ASRSchemaASRInterpolationWeightBundle weights](self, "weights");
        v13 = objc_claimAutoreleasedReturnValue();
        if (!v13)
        {

LABEL_17:
          v18 = 1;
          goto LABEL_15;
        }
        v14 = (void *)v13;
        -[ASRSchemaASRInterpolationWeightBundle weights](self, "weights");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "weights");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v15, "isEqual:", v16);

        if ((v17 & 1) != 0)
          goto LABEL_17;
      }
      else
      {

      }
    }
  }
LABEL_14:
  v18 = 0;
LABEL_15:

  return v18;
}

- (unint64_t)hash
{
  unint64_t v2;
  unint64_t v3;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v2 = 2654435761u * self->_startTimeInNs;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v3 = 0;
    return v3 ^ v2 ^ -[NSArray hash](self->_weights, "hash");
  }
  v2 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v3 = 2654435761u * self->_endTimeInNs;
  return v3 ^ v2 ^ -[NSArray hash](self->_weights, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[ASRSchemaASRInterpolationWeightBundle endTimeInNs](self, "endTimeInNs"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("endTimeInNs"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[ASRSchemaASRInterpolationWeightBundle startTimeInNs](self, "startTimeInNs"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("startTimeInNs"));

  }
  if (-[NSArray count](self->_weights, "count"))
  {
    -[ASRSchemaASRInterpolationWeightBundle weights](self, "weights");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("weights"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[ASRSchemaASRInterpolationWeightBundle dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (ASRSchemaASRInterpolationWeightBundle)initWithJSON:(id)a3
{
  void *v4;
  ASRSchemaASRInterpolationWeightBundle *v5;
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
    self = -[ASRSchemaASRInterpolationWeightBundle initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (ASRSchemaASRInterpolationWeightBundle)initWithDictionary:(id)a3
{
  id v4;
  ASRSchemaASRInterpolationWeightBundle *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  ASRSchemaASRInterpolationWeightBundle *v15;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  objc_super v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)ASRSchemaASRInterpolationWeightBundle;
  v5 = -[ASRSchemaASRInterpolationWeightBundle init](&v22, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("startTimeInNs"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ASRSchemaASRInterpolationWeightBundle setStartTimeInNs:](v5, "setStartTimeInNs:", objc_msgSend(v6, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("endTimeInNs"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ASRSchemaASRInterpolationWeightBundle setEndTimeInNs:](v5, "setEndTimeInNs:", objc_msgSend(v7, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("weights"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = v6;
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      v9 = v8;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v19;
        do
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v19 != v12)
              objc_enumerationMutation(v9);
            v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v13);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v14, "floatValue");
              -[ASRSchemaASRInterpolationWeightBundle addWeights:](v5, "addWeights:");
            }
            ++v13;
          }
          while (v11 != v13);
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
        }
        while (v11);
      }

      v6 = v17;
    }
    v15 = v5;

  }
  return v5;
}

- (unint64_t)startTimeInNs
{
  return self->_startTimeInNs;
}

- (unint64_t)endTimeInNs
{
  return self->_endTimeInNs;
}

- (NSArray)weights
{
  return self->_weights;
}

- (void)setWeights:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_weights, 0);
}

@end
