@implementation PEGASUSSchemaPEGASUSWebAnswerCitationInfoTier1

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
  v7.super_class = (Class)PEGASUSSchemaPEGASUSWebAnswerCitationInfoTier1;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v7, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isConditionSet:", 2))
    -[PEGASUSSchemaPEGASUSWebAnswerCitationInfoTier1 deleteSubText](self, "deleteSubText");
  if (objc_msgSend(v4, "isConditionSet:", 4))
    -[PEGASUSSchemaPEGASUSWebAnswerCitationInfoTier1 deleteSubText](self, "deleteSubText");
  if (objc_msgSend(v4, "isConditionSet:", 5))
    -[PEGASUSSchemaPEGASUSWebAnswerCitationInfoTier1 deleteSubText](self, "deleteSubText");
  if (objc_msgSend(v4, "isConditionSet:", 6))
    -[PEGASUSSchemaPEGASUSWebAnswerCitationInfoTier1 deleteSubText](self, "deleteSubText");
  if (objc_msgSend(v4, "isConditionSet:", 7))
    -[PEGASUSSchemaPEGASUSWebAnswerCitationInfoTier1 deleteSubText](self, "deleteSubText");

  return v5;
}

- (BOOL)hasSubText
{
  return self->_subText != 0;
}

- (void)deleteSubText
{
  -[PEGASUSSchemaPEGASUSWebAnswerCitationInfoTier1 setSubText:](self, "setSubText:", 0);
}

- (void)clearCitationIndices
{
  -[NSArray removeAllObjects](self->_citationIndices, "removeAllObjects");
}

- (void)addCitationIndices:(int)a3
{
  uint64_t v3;
  NSArray *citationIndices;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v3 = *(_QWORD *)&a3;
  citationIndices = self->_citationIndices;
  if (!citationIndices)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_citationIndices;
    self->_citationIndices = v6;

    citationIndices = self->_citationIndices;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSArray addObject:](citationIndices, "addObject:", v8);

}

- (unint64_t)citationIndicesCount
{
  return -[NSArray count](self->_citationIndices, "count");
}

- (int)citationIndicesAtIndex:(unint64_t)a3
{
  void *v3;
  int v4;

  -[NSArray objectAtIndexedSubscript:](self->_citationIndices, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return PEGASUSSchemaPEGASUSWebAnswerCitationInfoTier1ReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PEGASUSSchemaPEGASUSWebAnswerCitationInfoTier1 subText](self, "subText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = self->_citationIndices;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10), "intValue", (_QWORD)v11);
        PBDataWriterWriteInt32Field();
        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
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
  -[PEGASUSSchemaPEGASUSWebAnswerCitationInfoTier1 subText](self, "subText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[PEGASUSSchemaPEGASUSWebAnswerCitationInfoTier1 subText](self, "subText");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[PEGASUSSchemaPEGASUSWebAnswerCitationInfoTier1 subText](self, "subText");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "subText");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[PEGASUSSchemaPEGASUSWebAnswerCitationInfoTier1 citationIndices](self, "citationIndices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "citationIndices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[PEGASUSSchemaPEGASUSWebAnswerCitationInfoTier1 citationIndices](self, "citationIndices");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
    {

LABEL_15:
      v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    -[PEGASUSSchemaPEGASUSWebAnswerCitationInfoTier1 citationIndices](self, "citationIndices");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "citationIndices");
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
  NSUInteger v3;

  v3 = -[NSString hash](self->_subText, "hash");
  return -[NSArray hash](self->_citationIndices, "hash") ^ v3;
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
  if (-[NSArray count](self->_citationIndices, "count"))
  {
    -[PEGASUSSchemaPEGASUSWebAnswerCitationInfoTier1 citationIndices](self, "citationIndices");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("citationIndices"));

  }
  if (self->_subText)
  {
    -[PEGASUSSchemaPEGASUSWebAnswerCitationInfoTier1 subText](self, "subText");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("subText"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PEGASUSSchemaPEGASUSWebAnswerCitationInfoTier1 dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (PEGASUSSchemaPEGASUSWebAnswerCitationInfoTier1)initWithJSON:(id)a3
{
  void *v4;
  PEGASUSSchemaPEGASUSWebAnswerCitationInfoTier1 *v5;
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
    self = -[PEGASUSSchemaPEGASUSWebAnswerCitationInfoTier1 initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PEGASUSSchemaPEGASUSWebAnswerCitationInfoTier1)initWithDictionary:(id)a3
{
  id v4;
  PEGASUSSchemaPEGASUSWebAnswerCitationInfoTier1 *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  PEGASUSSchemaPEGASUSWebAnswerCitationInfoTier1 *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  objc_super v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PEGASUSSchemaPEGASUSWebAnswerCitationInfoTier1;
  v5 = -[PEGASUSSchemaPEGASUSWebAnswerCitationInfoTier1 init](&v21, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("subText"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[PEGASUSSchemaPEGASUSWebAnswerCitationInfoTier1 setSubText:](v5, "setSubText:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("citationIndices"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      v9 = v8;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v18;
        do
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v18 != v12)
              objc_enumerationMutation(v9);
            v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v13);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              -[PEGASUSSchemaPEGASUSWebAnswerCitationInfoTier1 addCitationIndices:](v5, "addCitationIndices:", objc_msgSend(v14, "intValue", (_QWORD)v17));
            ++v13;
          }
          while (v11 != v13);
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
        }
        while (v11);
      }

    }
    v15 = v5;

  }
  return v5;
}

- (NSString)subText
{
  return self->_subText;
}

- (void)setSubText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)citationIndices
{
  return self->_citationIndices;
}

- (void)setCitationIndices:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setHasSubText:(BOOL)a3
{
  self->_hasSubText = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_citationIndices, 0);
  objc_storeStrong((id *)&self->_subText, 0);
}

@end
