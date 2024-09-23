@implementation PEGASUSSchemaPEGASUSVideoExecutionTier1

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
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PEGASUSSchemaPEGASUSVideoExecutionTier1;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v7, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isConditionSet:", 2))
  {
    -[PEGASUSSchemaPEGASUSVideoExecutionTier1 deleteResultEntityIds](self, "deleteResultEntityIds");
    -[PEGASUSSchemaPEGASUSVideoExecutionTier1 deleteVideoTitle](self, "deleteVideoTitle");
  }
  if (objc_msgSend(v4, "isConditionSet:", 4))
  {
    -[PEGASUSSchemaPEGASUSVideoExecutionTier1 deleteResultEntityIds](self, "deleteResultEntityIds");
    -[PEGASUSSchemaPEGASUSVideoExecutionTier1 deleteVideoTitle](self, "deleteVideoTitle");
  }
  if (objc_msgSend(v4, "isConditionSet:", 5))
  {
    -[PEGASUSSchemaPEGASUSVideoExecutionTier1 deleteResultEntityIds](self, "deleteResultEntityIds");
    -[PEGASUSSchemaPEGASUSVideoExecutionTier1 deleteVideoTitle](self, "deleteVideoTitle");
  }
  if (objc_msgSend(v4, "isConditionSet:", 6))
  {
    -[PEGASUSSchemaPEGASUSVideoExecutionTier1 deleteResultEntityIds](self, "deleteResultEntityIds");
    -[PEGASUSSchemaPEGASUSVideoExecutionTier1 deleteVideoTitle](self, "deleteVideoTitle");
  }
  if (objc_msgSend(v4, "isConditionSet:", 7))
  {
    -[PEGASUSSchemaPEGASUSVideoExecutionTier1 deleteResultEntityIds](self, "deleteResultEntityIds");
    -[PEGASUSSchemaPEGASUSVideoExecutionTier1 deleteVideoTitle](self, "deleteVideoTitle");
  }

  return v5;
}

- (void)clearResultEntityIds
{
  -[NSArray removeAllObjects](self->_resultEntityIds, "removeAllObjects");
}

- (void)addResultEntityIds:(id)a3
{
  id v4;
  NSArray *resultEntityIds;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  resultEntityIds = self->_resultEntityIds;
  v8 = v4;
  if (!resultEntityIds)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_resultEntityIds;
    self->_resultEntityIds = v6;

    v4 = v8;
    resultEntityIds = self->_resultEntityIds;
  }
  -[NSArray addObject:](resultEntityIds, "addObject:", v4);

}

- (unint64_t)resultEntityIdsCount
{
  return -[NSArray count](self->_resultEntityIds, "count");
}

- (id)resultEntityIdsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_resultEntityIds, "objectAtIndexedSubscript:", a3);
}

- (BOOL)hasVideoTitle
{
  return self->_videoTitle != 0;
}

- (void)deleteVideoTitle
{
  -[PEGASUSSchemaPEGASUSVideoExecutionTier1 setVideoTitle:](self, "setVideoTitle:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return PEGASUSSchemaPEGASUSVideoExecutionTier1ReadFrom(self, (uint64_t)a3);
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
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_resultEntityIds;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  -[PEGASUSSchemaPEGASUSVideoExecutionTier1 videoTitle](self, "videoTitle", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    PBDataWriterWriteStringField();

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
  char v16;
  BOOL v17;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  -[PEGASUSSchemaPEGASUSVideoExecutionTier1 resultEntityIds](self, "resultEntityIds");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resultEntityIds");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[PEGASUSSchemaPEGASUSVideoExecutionTier1 resultEntityIds](self, "resultEntityIds");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[PEGASUSSchemaPEGASUSVideoExecutionTier1 resultEntityIds](self, "resultEntityIds");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "resultEntityIds");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[PEGASUSSchemaPEGASUSVideoExecutionTier1 videoTitle](self, "videoTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "videoTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[PEGASUSSchemaPEGASUSVideoExecutionTier1 videoTitle](self, "videoTitle");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
    {

LABEL_15:
      v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    -[PEGASUSSchemaPEGASUSVideoExecutionTier1 videoTitle](self, "videoTitle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "videoTitle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if ((v16 & 1) != 0)
      goto LABEL_15;
  }
  else
  {
LABEL_11:

  }
LABEL_12:
  v17 = 0;
LABEL_13:

  return v17;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[NSArray hash](self->_resultEntityIds, "hash");
  return -[NSString hash](self->_videoTitle, "hash") ^ v3;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_resultEntityIds)
  {
    -[PEGASUSSchemaPEGASUSVideoExecutionTier1 resultEntityIds](self, "resultEntityIds");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("resultEntityIds"));

  }
  if (self->_videoTitle)
  {
    -[PEGASUSSchemaPEGASUSVideoExecutionTier1 videoTitle](self, "videoTitle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("videoTitle"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PEGASUSSchemaPEGASUSVideoExecutionTier1 dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (PEGASUSSchemaPEGASUSVideoExecutionTier1)initWithJSON:(id)a3
{
  void *v4;
  PEGASUSSchemaPEGASUSVideoExecutionTier1 *v5;
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
    self = -[PEGASUSSchemaPEGASUSVideoExecutionTier1 initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PEGASUSSchemaPEGASUSVideoExecutionTier1)initWithDictionary:(id)a3
{
  id v4;
  PEGASUSSchemaPEGASUSVideoExecutionTier1 *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  PEGASUSSchemaPEGASUSVideoExecutionTier1 *v16;
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
  v22.super_class = (Class)PEGASUSSchemaPEGASUSVideoExecutionTier1;
  v5 = -[PEGASUSSchemaPEGASUSVideoExecutionTier1 init](&v22, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("resultEntityIds"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      v7 = v6;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v19;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v19 != v10)
              objc_enumerationMutation(v7);
            v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v11);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v13 = (void *)objc_msgSend(v12, "copy", (_QWORD)v18);
              -[PEGASUSSchemaPEGASUSVideoExecutionTier1 addResultEntityIds:](v5, "addResultEntityIds:", v13);

            }
            ++v11;
          }
          while (v9 != v11);
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
        }
        while (v9);
      }

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("videoTitle"), (_QWORD)v18);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = (void *)objc_msgSend(v14, "copy");
      -[PEGASUSSchemaPEGASUSVideoExecutionTier1 setVideoTitle:](v5, "setVideoTitle:", v15);

    }
    v16 = v5;

  }
  return v5;
}

- (NSArray)resultEntityIds
{
  return self->_resultEntityIds;
}

- (void)setResultEntityIds:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)videoTitle
{
  return self->_videoTitle;
}

- (void)setVideoTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setHasVideoTitle:(BOOL)a3
{
  self->_hasVideoTitle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoTitle, 0);
  objc_storeStrong((id *)&self->_resultEntityIds, 0);
}

@end
