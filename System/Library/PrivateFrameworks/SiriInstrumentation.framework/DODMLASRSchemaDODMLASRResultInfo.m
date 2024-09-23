@implementation DODMLASRSchemaDODMLASRResultInfo

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
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)DODMLASRSchemaDODMLASRResultInfo;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DODMLASRSchemaDODMLASRResultInfo choices](self, "choices", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[DODMLASRSchemaDODMLASRResultInfo setChoices:](self, "setChoices:", v7);
  return v5;
}

- (BOOL)hasStageName
{
  return self->_stageName != 0;
}

- (void)deleteStageName
{
  -[DODMLASRSchemaDODMLASRResultInfo setStageName:](self, "setStageName:", 0);
}

- (void)setIsAligned:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_isAligned = a3;
}

- (BOOL)hasIsAligned
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasIsAligned:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteIsAligned
{
  -[DODMLASRSchemaDODMLASRResultInfo setIsAligned:](self, "setIsAligned:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)clearChoices
{
  -[NSArray removeAllObjects](self->_choices, "removeAllObjects");
}

- (void)addChoices:(id)a3
{
  id v4;
  NSArray *choices;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  choices = self->_choices;
  v8 = v4;
  if (!choices)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_choices;
    self->_choices = v6;

    v4 = v8;
    choices = self->_choices;
  }
  -[NSArray addObject:](choices, "addObject:", v4);

}

- (unint64_t)choicesCount
{
  return -[NSArray count](self->_choices, "count");
}

- (id)choicesAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_choices, "objectAtIndexedSubscript:", a3);
}

- (BOOL)readFrom:(id)a3
{
  return DODMLASRSchemaDODMLASRResultInfoReadFrom(self, (uint64_t)a3);
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
  -[DODMLASRSchemaDODMLASRResultInfo stageName](self, "stageName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteBOOLField();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = self->_choices;
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
        PBDataWriterWriteSubmessage();
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
  _BYTE *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  int isAligned;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  BOOL v18;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  -[DODMLASRSchemaDODMLASRResultInfo stageName](self, "stageName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stageName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_14;
  -[DODMLASRSchemaDODMLASRResultInfo stageName](self, "stageName");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[DODMLASRSchemaDODMLASRResultInfo stageName](self, "stageName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stageName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_15;
  }
  else
  {

  }
  if ((*(_BYTE *)&self->_has & 1) != (v4[32] & 1))
    goto LABEL_15;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    isAligned = self->_isAligned;
    if (isAligned != objc_msgSend(v4, "isAligned"))
      goto LABEL_15;
  }
  -[DODMLASRSchemaDODMLASRResultInfo choices](self, "choices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "choices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[DODMLASRSchemaDODMLASRResultInfo choices](self, "choices");
    v13 = objc_claimAutoreleasedReturnValue();
    if (!v13)
    {

LABEL_18:
      v18 = 1;
      goto LABEL_16;
    }
    v14 = (void *)v13;
    -[DODMLASRSchemaDODMLASRResultInfo choices](self, "choices");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "choices");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if ((v17 & 1) != 0)
      goto LABEL_18;
  }
  else
  {
LABEL_14:

  }
LABEL_15:
  v18 = 0;
LABEL_16:

  return v18;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;

  v3 = -[NSString hash](self->_stageName, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_isAligned;
  else
    v4 = 0;
  return v4 ^ v3 ^ -[NSArray hash](self->_choices, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSArray count](self->_choices, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v5 = self->_choices;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v17 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v16);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10)
          {
            objc_msgSend(v4, "addObject:", v10);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "addObject:", v11);

          }
        }
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v7);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("choices"));
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[DODMLASRSchemaDODMLASRResultInfo isAligned](self, "isAligned"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("isAligned"));

  }
  if (self->_stageName)
  {
    -[DODMLASRSchemaDODMLASRResultInfo stageName](self, "stageName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("stageName"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (_QWORD)v16);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[DODMLASRSchemaDODMLASRResultInfo dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (DODMLASRSchemaDODMLASRResultInfo)initWithJSON:(id)a3
{
  void *v4;
  DODMLASRSchemaDODMLASRResultInfo *v5;
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
    self = -[DODMLASRSchemaDODMLASRResultInfo initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (DODMLASRSchemaDODMLASRResultInfo)initWithDictionary:(id)a3
{
  id v4;
  DODMLASRSchemaDODMLASRResultInfo *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  DODMLASRSchemaDODMLASRChoiceInfo *v16;
  DODMLASRSchemaDODMLASRResultInfo *v17;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  objc_super v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)DODMLASRSchemaDODMLASRResultInfo;
  v5 = -[DODMLASRSchemaDODMLASRResultInfo init](&v24, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("stageName"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[DODMLASRSchemaDODMLASRResultInfo setStageName:](v5, "setStageName:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isAligned"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[DODMLASRSchemaDODMLASRResultInfo setIsAligned:](v5, "setIsAligned:", objc_msgSend(v8, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("choices"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = v8;
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      v10 = v9;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v21;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v21 != v13)
              objc_enumerationMutation(v10);
            v15 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v16 = -[DODMLASRSchemaDODMLASRChoiceInfo initWithDictionary:]([DODMLASRSchemaDODMLASRChoiceInfo alloc], "initWithDictionary:", v15);
              -[DODMLASRSchemaDODMLASRResultInfo addChoices:](v5, "addChoices:", v16);

            }
          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
        }
        while (v12);
      }

      v8 = v19;
    }
    v17 = v5;

  }
  return v5;
}

- (NSString)stageName
{
  return self->_stageName;
}

- (void)setStageName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (BOOL)isAligned
{
  return self->_isAligned;
}

- (NSArray)choices
{
  return self->_choices;
}

- (void)setChoices:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setHasStageName:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_choices, 0);
  objc_storeStrong((id *)&self->_stageName, 0);
}

@end
