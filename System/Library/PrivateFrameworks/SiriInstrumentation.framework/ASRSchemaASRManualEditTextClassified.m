@implementation ASRSchemaASRManualEditTextClassified

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
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ASRSchemaASRManualEditTextClassified;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v12, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isConditionSet:", 2))
  {
    -[ASRSchemaASRManualEditTextClassified deleteManualEdits](self, "deleteManualEdits");
    -[ASRSchemaASRManualEditTextClassified deleteFullCorrectedText](self, "deleteFullCorrectedText");
  }
  if (objc_msgSend(v4, "isConditionSet:", 4))
  {
    -[ASRSchemaASRManualEditTextClassified deleteManualEdits](self, "deleteManualEdits");
    -[ASRSchemaASRManualEditTextClassified deleteFullCorrectedText](self, "deleteFullCorrectedText");
  }
  if (objc_msgSend(v4, "isConditionSet:", 5))
  {
    -[ASRSchemaASRManualEditTextClassified deleteManualEdits](self, "deleteManualEdits");
    -[ASRSchemaASRManualEditTextClassified deleteFullCorrectedText](self, "deleteFullCorrectedText");
  }
  if (objc_msgSend(v4, "isConditionSet:", 6))
  {
    -[ASRSchemaASRManualEditTextClassified deleteManualEdits](self, "deleteManualEdits");
    -[ASRSchemaASRManualEditTextClassified deleteFullCorrectedText](self, "deleteFullCorrectedText");
  }
  if (objc_msgSend(v4, "isConditionSet:", 7))
  {
    -[ASRSchemaASRManualEditTextClassified deleteManualEdits](self, "deleteManualEdits");
    -[ASRSchemaASRManualEditTextClassified deleteFullCorrectedText](self, "deleteFullCorrectedText");
  }
  -[ASRSchemaASRManualEditTextClassified originalAsrId](self, "originalAsrId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[ASRSchemaASRManualEditTextClassified deleteOriginalAsrId](self, "deleteOriginalAsrId");
  -[ASRSchemaASRManualEditTextClassified manualEdits](self, "manualEdits");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v9, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASRSchemaASRManualEditTextClassified setManualEdits:](self, "setManualEdits:", v10);

  return v5;
}

- (BOOL)hasOriginalAsrId
{
  return self->_originalAsrId != 0;
}

- (void)deleteOriginalAsrId
{
  -[ASRSchemaASRManualEditTextClassified setOriginalAsrId:](self, "setOriginalAsrId:", 0);
}

- (void)clearManualEdits
{
  -[NSArray removeAllObjects](self->_manualEdits, "removeAllObjects");
}

- (void)addManualEdits:(id)a3
{
  id v4;
  NSArray *manualEdits;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  manualEdits = self->_manualEdits;
  v8 = v4;
  if (!manualEdits)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_manualEdits;
    self->_manualEdits = v6;

    v4 = v8;
    manualEdits = self->_manualEdits;
  }
  -[NSArray addObject:](manualEdits, "addObject:", v4);

}

- (unint64_t)manualEditsCount
{
  return -[NSArray count](self->_manualEdits, "count");
}

- (id)manualEditsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_manualEdits, "objectAtIndexedSubscript:", a3);
}

- (BOOL)hasFullCorrectedText
{
  return self->_fullCorrectedText != 0;
}

- (void)deleteFullCorrectedText
{
  -[ASRSchemaASRManualEditTextClassified setFullCorrectedText:](self, "setFullCorrectedText:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return ASRSchemaASRManualEditTextClassifiedReadFrom(self, (uint64_t)a3);
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
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ASRSchemaASRManualEditTextClassified originalAsrId](self, "originalAsrId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[ASRSchemaASRManualEditTextClassified originalAsrId](self, "originalAsrId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = self->_manualEdits;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        PBDataWriterWriteSubmessage();
        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

  -[ASRSchemaASRManualEditTextClassified fullCorrectedText](self, "fullCorrectedText", v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
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
  -[ASRSchemaASRManualEditTextClassified originalAsrId](self, "originalAsrId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "originalAsrId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[ASRSchemaASRManualEditTextClassified originalAsrId](self, "originalAsrId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[ASRSchemaASRManualEditTextClassified originalAsrId](self, "originalAsrId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "originalAsrId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_17;
  }
  else
  {

  }
  -[ASRSchemaASRManualEditTextClassified manualEdits](self, "manualEdits");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "manualEdits");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[ASRSchemaASRManualEditTextClassified manualEdits](self, "manualEdits");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[ASRSchemaASRManualEditTextClassified manualEdits](self, "manualEdits");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "manualEdits");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_17;
  }
  else
  {

  }
  -[ASRSchemaASRManualEditTextClassified fullCorrectedText](self, "fullCorrectedText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fullCorrectedText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[ASRSchemaASRManualEditTextClassified fullCorrectedText](self, "fullCorrectedText");
    v17 = objc_claimAutoreleasedReturnValue();
    if (!v17)
    {

LABEL_20:
      v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    -[ASRSchemaASRManualEditTextClassified fullCorrectedText](self, "fullCorrectedText");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fullCorrectedText");
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

  v3 = -[SISchemaUUID hash](self->_originalAsrId, "hash");
  v4 = -[NSArray hash](self->_manualEdits, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_fullCorrectedText, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_fullCorrectedText)
  {
    -[ASRSchemaASRManualEditTextClassified fullCorrectedText](self, "fullCorrectedText");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("fullCorrectedText"));

  }
  if (-[NSArray count](self->_manualEdits, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v7 = self->_manualEdits;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v19 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v18);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            objc_msgSend(v6, "addObject:", v12);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "addObject:", v13);

          }
        }
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v9);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("manualEdits"));
  }
  if (self->_originalAsrId)
  {
    -[ASRSchemaASRManualEditTextClassified originalAsrId](self, "originalAsrId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dictionaryRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("originalAsrId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("originalAsrId"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (_QWORD)v18);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[ASRSchemaASRManualEditTextClassified dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (ASRSchemaASRManualEditTextClassified)initWithJSON:(id)a3
{
  void *v4;
  ASRSchemaASRManualEditTextClassified *v5;
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
    self = -[ASRSchemaASRManualEditTextClassified initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (ASRSchemaASRManualEditTextClassified)initWithDictionary:(id)a3
{
  id v4;
  ASRSchemaASRManualEditTextClassified *v5;
  void *v6;
  SISchemaUUID *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  ASRSchemaASRConfusionPairToken *v15;
  void *v16;
  void *v17;
  ASRSchemaASRManualEditTextClassified *v18;
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
  v25.super_class = (Class)ASRSchemaASRManualEditTextClassified;
  v5 = -[ASRSchemaASRManualEditTextClassified init](&v25, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("originalAsrId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v6);
      -[ASRSchemaASRManualEditTextClassified setOriginalAsrId:](v5, "setOriginalAsrId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("manualEdits"));
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
              v15 = -[ASRSchemaASRConfusionPairToken initWithDictionary:]([ASRSchemaASRConfusionPairToken alloc], "initWithDictionary:", v14);
              -[ASRSchemaASRManualEditTextClassified addManualEdits:](v5, "addManualEdits:", v15);

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
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("fullCorrectedText"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = (void *)objc_msgSend(v16, "copy");
      -[ASRSchemaASRManualEditTextClassified setFullCorrectedText:](v5, "setFullCorrectedText:", v17);

    }
    v18 = v5;

  }
  return v5;
}

- (SISchemaUUID)originalAsrId
{
  return self->_originalAsrId;
}

- (void)setOriginalAsrId:(id)a3
{
  objc_storeStrong((id *)&self->_originalAsrId, a3);
}

- (NSArray)manualEdits
{
  return self->_manualEdits;
}

- (void)setManualEdits:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)fullCorrectedText
{
  return self->_fullCorrectedText;
}

- (void)setFullCorrectedText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setHasOriginalAsrId:(BOOL)a3
{
  self->_hasOriginalAsrId = a3;
}

- (void)setHasFullCorrectedText:(BOOL)a3
{
  self->_hasFullCorrectedText = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fullCorrectedText, 0);
  objc_storeStrong((id *)&self->_manualEdits, 0);
  objc_storeStrong((id *)&self->_originalAsrId, 0);
}

@end
