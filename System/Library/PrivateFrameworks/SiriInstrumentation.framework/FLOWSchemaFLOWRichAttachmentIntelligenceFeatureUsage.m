@implementation FLOWSchemaFLOWRichAttachmentIntelligenceFeatureUsage

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)clearIsReadingIntelligenceAttempted
{
  -[NSArray removeAllObjects](self->_isReadingIntelligenceAttempteds, "removeAllObjects");
}

- (void)addIsReadingIntelligenceAttempted:(BOOL)a3
{
  _BOOL8 v3;
  NSArray *isReadingIntelligenceAttempteds;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v3 = a3;
  isReadingIntelligenceAttempteds = self->_isReadingIntelligenceAttempteds;
  if (!isReadingIntelligenceAttempteds)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_isReadingIntelligenceAttempteds;
    self->_isReadingIntelligenceAttempteds = v6;

    isReadingIntelligenceAttempteds = self->_isReadingIntelligenceAttempteds;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSArray addObject:](isReadingIntelligenceAttempteds, "addObject:", v8);

}

- (unint64_t)isReadingIntelligenceAttemptedCount
{
  return -[NSArray count](self->_isReadingIntelligenceAttempteds, "count");
}

- (BOOL)isReadingIntelligenceAttemptedAtIndex:(unint64_t)a3
{
  void *v3;
  char v4;

  -[NSArray objectAtIndexedSubscript:](self->_isReadingIntelligenceAttempteds, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (void)clearIsReadingIntelligenceUsed
{
  -[NSArray removeAllObjects](self->_isReadingIntelligenceUseds, "removeAllObjects");
}

- (void)addIsReadingIntelligenceUsed:(BOOL)a3
{
  _BOOL8 v3;
  NSArray *isReadingIntelligenceUseds;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v3 = a3;
  isReadingIntelligenceUseds = self->_isReadingIntelligenceUseds;
  if (!isReadingIntelligenceUseds)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_isReadingIntelligenceUseds;
    self->_isReadingIntelligenceUseds = v6;

    isReadingIntelligenceUseds = self->_isReadingIntelligenceUseds;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSArray addObject:](isReadingIntelligenceUseds, "addObject:", v8);

}

- (unint64_t)isReadingIntelligenceUsedCount
{
  return -[NSArray count](self->_isReadingIntelligenceUseds, "count");
}

- (BOOL)isReadingIntelligenceUsedAtIndex:(unint64_t)a3
{
  void *v3;
  char v4;

  -[NSArray objectAtIndexedSubscript:](self->_isReadingIntelligenceUseds, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return FLOWSchemaFLOWRichAttachmentIntelligenceFeatureUsageReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = self->_isReadingIntelligenceAttempteds;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v9), "BOOLValue");
        PBDataWriterWriteBOOLField();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v7);
  }

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = self->_isReadingIntelligenceUseds;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v14), "BOOLValue", (_QWORD)v15);
        PBDataWriterWriteBOOLField();
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v12);
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
  char v16;
  BOOL v17;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  -[FLOWSchemaFLOWRichAttachmentIntelligenceFeatureUsage isReadingIntelligenceAttempteds](self, "isReadingIntelligenceAttempteds");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "isReadingIntelligenceAttempteds");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[FLOWSchemaFLOWRichAttachmentIntelligenceFeatureUsage isReadingIntelligenceAttempteds](self, "isReadingIntelligenceAttempteds");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[FLOWSchemaFLOWRichAttachmentIntelligenceFeatureUsage isReadingIntelligenceAttempteds](self, "isReadingIntelligenceAttempteds");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "isReadingIntelligenceAttempteds");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[FLOWSchemaFLOWRichAttachmentIntelligenceFeatureUsage isReadingIntelligenceUseds](self, "isReadingIntelligenceUseds");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "isReadingIntelligenceUseds");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[FLOWSchemaFLOWRichAttachmentIntelligenceFeatureUsage isReadingIntelligenceUseds](self, "isReadingIntelligenceUseds");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
    {

LABEL_15:
      v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    -[FLOWSchemaFLOWRichAttachmentIntelligenceFeatureUsage isReadingIntelligenceUseds](self, "isReadingIntelligenceUseds");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "isReadingIntelligenceUseds");
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

  v3 = -[NSArray hash](self->_isReadingIntelligenceAttempteds, "hash");
  return -[NSArray hash](self->_isReadingIntelligenceUseds, "hash") ^ v3;
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
  if (-[NSArray count](self->_isReadingIntelligenceAttempteds, "count"))
  {
    -[FLOWSchemaFLOWRichAttachmentIntelligenceFeatureUsage isReadingIntelligenceAttempteds](self, "isReadingIntelligenceAttempteds");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("isReadingIntelligenceAttempted"));

  }
  if (-[NSArray count](self->_isReadingIntelligenceUseds, "count"))
  {
    -[FLOWSchemaFLOWRichAttachmentIntelligenceFeatureUsage isReadingIntelligenceUseds](self, "isReadingIntelligenceUseds");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("isReadingIntelligenceUsed"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[FLOWSchemaFLOWRichAttachmentIntelligenceFeatureUsage dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (FLOWSchemaFLOWRichAttachmentIntelligenceFeatureUsage)initWithJSON:(id)a3
{
  void *v4;
  FLOWSchemaFLOWRichAttachmentIntelligenceFeatureUsage *v5;
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
    self = -[FLOWSchemaFLOWRichAttachmentIntelligenceFeatureUsage initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (FLOWSchemaFLOWRichAttachmentIntelligenceFeatureUsage)initWithDictionary:(id)a3
{
  id v4;
  FLOWSchemaFLOWRichAttachmentIntelligenceFeatureUsage *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  FLOWSchemaFLOWRichAttachmentIntelligenceFeatureUsage *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  objc_super v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)FLOWSchemaFLOWRichAttachmentIntelligenceFeatureUsage;
  v5 = -[FLOWSchemaFLOWRichAttachmentIntelligenceFeatureUsage init](&v30, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isReadingIntelligenceAttempted"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v28 = 0u;
      v29 = 0u;
      v26 = 0u;
      v27 = 0u;
      v7 = v6;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v27;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v27 != v10)
              objc_enumerationMutation(v7);
            v12 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v11);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              -[FLOWSchemaFLOWRichAttachmentIntelligenceFeatureUsage addIsReadingIntelligenceAttempted:](v5, "addIsReadingIntelligenceAttempted:", objc_msgSend(v12, "BOOLValue"));
            ++v11;
          }
          while (v9 != v11);
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
        }
        while (v9);
      }

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isReadingIntelligenceUsed"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      v14 = v13;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v31, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v23;
        do
        {
          v18 = 0;
          do
          {
            if (*(_QWORD *)v23 != v17)
              objc_enumerationMutation(v14);
            v19 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v18);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              -[FLOWSchemaFLOWRichAttachmentIntelligenceFeatureUsage addIsReadingIntelligenceUsed:](v5, "addIsReadingIntelligenceUsed:", objc_msgSend(v19, "BOOLValue", (_QWORD)v22));
            ++v18;
          }
          while (v16 != v18);
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v31, 16);
        }
        while (v16);
      }

    }
    v20 = v5;

  }
  return v5;
}

- (NSArray)isReadingIntelligenceAttempteds
{
  return self->_isReadingIntelligenceAttempteds;
}

- (void)setIsReadingIntelligenceAttempteds:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)isReadingIntelligenceUseds
{
  return self->_isReadingIntelligenceUseds;
}

- (void)setIsReadingIntelligenceUseds:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isReadingIntelligenceUseds, 0);
  objc_storeStrong((id *)&self->_isReadingIntelligenceAttempteds, 0);
}

@end
