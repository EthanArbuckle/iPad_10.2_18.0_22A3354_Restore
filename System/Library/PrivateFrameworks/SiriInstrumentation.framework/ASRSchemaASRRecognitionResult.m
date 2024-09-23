@implementation ASRSchemaASRRecognitionResult

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
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ASRSchemaASRRecognitionResult;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v14, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASRSchemaASRRecognitionResult linkId](self, "linkId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[ASRSchemaASRRecognitionResult deleteLinkId](self, "deleteLinkId");
  -[ASRSchemaASRRecognitionResult phrases](self, "phrases");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v9, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASRSchemaASRRecognitionResult setPhrases:](self, "setPhrases:", v10);

  -[ASRSchemaASRRecognitionResult utterances](self, "utterances");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v11, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASRSchemaASRRecognitionResult setUtterances:](self, "setUtterances:", v12);

  return v5;
}

- (BOOL)hasLinkId
{
  return self->_linkId != 0;
}

- (void)deleteLinkId
{
  -[ASRSchemaASRRecognitionResult setLinkId:](self, "setLinkId:", 0);
}

- (void)clearPhrases
{
  -[NSArray removeAllObjects](self->_phrases, "removeAllObjects");
}

- (void)addPhrases:(id)a3
{
  id v4;
  NSArray *phrases;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  phrases = self->_phrases;
  v8 = v4;
  if (!phrases)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_phrases;
    self->_phrases = v6;

    v4 = v8;
    phrases = self->_phrases;
  }
  -[NSArray addObject:](phrases, "addObject:", v4);

}

- (unint64_t)phrasesCount
{
  return -[NSArray count](self->_phrases, "count");
}

- (id)phrasesAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_phrases, "objectAtIndexedSubscript:", a3);
}

- (void)clearUtterances
{
  -[NSArray removeAllObjects](self->_utterances, "removeAllObjects");
}

- (void)addUtterances:(id)a3
{
  id v4;
  NSArray *utterances;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  utterances = self->_utterances;
  v8 = v4;
  if (!utterances)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_utterances;
    self->_utterances = v6;

    v4 = v8;
    utterances = self->_utterances;
  }
  -[NSArray addObject:](utterances, "addObject:", v4);

}

- (unint64_t)utterancesCount
{
  return -[NSArray count](self->_utterances, "count");
}

- (id)utterancesAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_utterances, "objectAtIndexedSubscript:", a3);
}

- (BOOL)readFrom:(id)a3
{
  return ASRSchemaASRRecognitionResultReadFrom(self, (uint64_t)a3);
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
  NSArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ASRSchemaASRRecognitionResult linkId](self, "linkId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[ASRSchemaASRRecognitionResult linkId](self, "linkId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = self->_phrases;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v22;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v7);
        PBDataWriterWriteSubmessage();
        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v9);
  }

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v12 = self->_utterances;
  v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v18;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(v12);
        PBDataWriterWriteSubmessage();
        ++v16;
      }
      while (v14 != v16);
      v14 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v14);
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
  -[ASRSchemaASRRecognitionResult linkId](self, "linkId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "linkId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[ASRSchemaASRRecognitionResult linkId](self, "linkId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[ASRSchemaASRRecognitionResult linkId](self, "linkId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "linkId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_17;
  }
  else
  {

  }
  -[ASRSchemaASRRecognitionResult phrases](self, "phrases");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "phrases");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[ASRSchemaASRRecognitionResult phrases](self, "phrases");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[ASRSchemaASRRecognitionResult phrases](self, "phrases");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "phrases");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_17;
  }
  else
  {

  }
  -[ASRSchemaASRRecognitionResult utterances](self, "utterances");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "utterances");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[ASRSchemaASRRecognitionResult utterances](self, "utterances");
    v17 = objc_claimAutoreleasedReturnValue();
    if (!v17)
    {

LABEL_20:
      v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    -[ASRSchemaASRRecognitionResult utterances](self, "utterances");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "utterances");
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

  v3 = -[SISchemaUUID hash](self->_linkId, "hash");
  v4 = -[NSArray hash](self->_phrases, "hash") ^ v3;
  return v4 ^ -[NSArray hash](self->_utterances, "hash");
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
  NSArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_linkId)
  {
    -[ASRSchemaASRRecognitionResult linkId](self, "linkId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("linkId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("linkId"));

    }
  }
  if (-[NSArray count](self->_phrases, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v8 = self->_phrases;
    v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v29 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "dictionaryRepresentation");
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
        v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v10);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("phrases"));
  }
  if (-[NSArray count](self->_utterances, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v16 = self->_utterances;
    v17 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v25;
      do
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v25 != v19)
            objc_enumerationMutation(v16);
          objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * j), "dictionaryRepresentation", (_QWORD)v24);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (v21)
          {
            objc_msgSend(v15, "addObject:", v21);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "addObject:", v22);

          }
        }
        v18 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
      }
      while (v18);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("utterances"));
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (_QWORD)v24);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[ASRSchemaASRRecognitionResult dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (ASRSchemaASRRecognitionResult)initWithJSON:(id)a3
{
  void *v4;
  ASRSchemaASRRecognitionResult *v5;
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
    self = -[ASRSchemaASRRecognitionResult initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (ASRSchemaASRRecognitionResult)initWithDictionary:(id)a3
{
  id v4;
  ASRSchemaASRRecognitionResult *v5;
  void *v6;
  SISchemaUUID *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  ASRSchemaASRPhrase *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  ASRSchemaASRUtterance *v24;
  ASRSchemaASRRecognitionResult *v25;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  objc_super v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)ASRSchemaASRRecognitionResult;
  v5 = -[ASRSchemaASRRecognitionResult init](&v37, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("linkId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v6);
      -[ASRSchemaASRRecognitionResult setLinkId:](v5, "setLinkId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("phrases"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v28 = v6;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      v9 = v8;
      v10 = v8;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v34;
        do
        {
          v14 = 0;
          do
          {
            if (*(_QWORD *)v34 != v13)
              objc_enumerationMutation(v10);
            v15 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v14);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v16 = -[ASRSchemaASRPhrase initWithDictionary:]([ASRSchemaASRPhrase alloc], "initWithDictionary:", v15);
              -[ASRSchemaASRRecognitionResult addPhrases:](v5, "addPhrases:", v16);

            }
            ++v14;
          }
          while (v12 != v14);
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
        }
        while (v12);
      }

      v6 = v28;
      v8 = v9;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("utterances"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v27 = v8;
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      v18 = v17;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v30;
        do
        {
          v22 = 0;
          do
          {
            if (*(_QWORD *)v30 != v21)
              objc_enumerationMutation(v18);
            v23 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v22);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v24 = -[ASRSchemaASRUtterance initWithDictionary:]([ASRSchemaASRUtterance alloc], "initWithDictionary:", v23);
              -[ASRSchemaASRRecognitionResult addUtterances:](v5, "addUtterances:", v24);

            }
            ++v22;
          }
          while (v20 != v22);
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
        }
        while (v20);
      }

      v8 = v27;
      v6 = v28;
    }
    v25 = v5;

  }
  return v5;
}

- (SISchemaUUID)linkId
{
  return self->_linkId;
}

- (void)setLinkId:(id)a3
{
  objc_storeStrong((id *)&self->_linkId, a3);
}

- (NSArray)phrases
{
  return self->_phrases;
}

- (void)setPhrases:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)utterances
{
  return self->_utterances;
}

- (void)setUtterances:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setHasLinkId:(BOOL)a3
{
  self->_hasLinkId = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_utterances, 0);
  objc_storeStrong((id *)&self->_phrases, 0);
  objc_storeStrong((id *)&self->_linkId, 0);
}

@end
