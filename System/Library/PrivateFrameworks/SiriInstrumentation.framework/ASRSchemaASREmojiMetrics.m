@implementation ASRSchemaASREmojiMetrics

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)clearRecognizedEmojis
{
  -[NSArray removeAllObjects](self->_recognizedEmojis, "removeAllObjects");
}

- (void)addRecognizedEmojis:(id)a3
{
  id v4;
  NSArray *recognizedEmojis;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  recognizedEmojis = self->_recognizedEmojis;
  v8 = v4;
  if (!recognizedEmojis)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_recognizedEmojis;
    self->_recognizedEmojis = v6;

    v4 = v8;
    recognizedEmojis = self->_recognizedEmojis;
  }
  -[NSArray addObject:](recognizedEmojis, "addObject:", v4);

}

- (unint64_t)recognizedEmojisCount
{
  return -[NSArray count](self->_recognizedEmojis, "count");
}

- (id)recognizedEmojisAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_recognizedEmojis, "objectAtIndexedSubscript:", a3);
}

- (void)setIsEmojiPersonalizationUsed:(BOOL)a3
{
  *(&self->_isEmojiExpectedButNotRecognized + 1) |= 1u;
  self->_isEmojiPersonalizationUsed = a3;
}

- (BOOL)hasIsEmojiPersonalizationUsed
{
  return *(&self->_isEmojiExpectedButNotRecognized + 1);
}

- (void)setHasIsEmojiPersonalizationUsed:(BOOL)a3
{
  *(&self->_isEmojiExpectedButNotRecognized + 1) = *(&self->_isEmojiExpectedButNotRecognized + 1) & 0xFE | a3;
}

- (void)deleteIsEmojiPersonalizationUsed
{
  -[ASRSchemaASREmojiMetrics setIsEmojiPersonalizationUsed:](self, "setIsEmojiPersonalizationUsed:", 0);
  *(&self->_isEmojiExpectedButNotRecognized + 1) &= ~1u;
}

- (void)setIsEmojiDisambiguationUsed:(BOOL)a3
{
  *(&self->_isEmojiExpectedButNotRecognized + 1) |= 2u;
  self->_isEmojiDisambiguationUsed = a3;
}

- (BOOL)hasIsEmojiDisambiguationUsed
{
  return (*((unsigned __int8 *)&self->_isEmojiExpectedButNotRecognized + 1) >> 1) & 1;
}

- (void)setHasIsEmojiDisambiguationUsed:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(&self->_isEmojiExpectedButNotRecognized + 1) = *(&self->_isEmojiExpectedButNotRecognized + 1) & 0xFD | v3;
}

- (void)deleteIsEmojiDisambiguationUsed
{
  -[ASRSchemaASREmojiMetrics setIsEmojiDisambiguationUsed:](self, "setIsEmojiDisambiguationUsed:", 0);
  *(&self->_isEmojiExpectedButNotRecognized + 1) &= ~2u;
}

- (void)setIsEmojiExpectedButNotRecognized:(BOOL)a3
{
  *(&self->_isEmojiExpectedButNotRecognized + 1) |= 4u;
  self->_isEmojiExpectedButNotRecognized = a3;
}

- (BOOL)hasIsEmojiExpectedButNotRecognized
{
  return (*((unsigned __int8 *)&self->_isEmojiExpectedButNotRecognized + 1) >> 2) & 1;
}

- (void)setHasIsEmojiExpectedButNotRecognized:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(&self->_isEmojiExpectedButNotRecognized + 1) = *(&self->_isEmojiExpectedButNotRecognized + 1) & 0xFB | v3;
}

- (void)deleteIsEmojiExpectedButNotRecognized
{
  -[ASRSchemaASREmojiMetrics setIsEmojiExpectedButNotRecognized:](self, "setIsEmojiExpectedButNotRecognized:", 0);
  *(&self->_isEmojiExpectedButNotRecognized + 1) &= ~4u;
}

- (BOOL)readFrom:(id)a3
{
  return ASRSchemaASREmojiMetricsReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  char v10;
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
  v5 = self->_recognizedEmojis;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteStringField();
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  v10 = *(&self->_isEmojiExpectedButNotRecognized + 1);
  if ((v10 & 1) == 0)
  {
    if ((*(&self->_isEmojiExpectedButNotRecognized + 1) & 2) == 0)
      goto LABEL_10;
LABEL_14:
    PBDataWriterWriteBOOLField();
    if ((*(&self->_isEmojiExpectedButNotRecognized + 1) & 4) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
  PBDataWriterWriteBOOLField();
  v10 = *(&self->_isEmojiExpectedButNotRecognized + 1);
  if ((v10 & 2) != 0)
    goto LABEL_14;
LABEL_10:
  if ((v10 & 4) != 0)
LABEL_11:
    PBDataWriterWriteBOOLField();
LABEL_12:

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  unsigned int v13;
  unsigned int v14;
  int isEmojiPersonalizationUsed;
  int v16;
  int isEmojiDisambiguationUsed;
  int v18;
  int isEmojiExpectedButNotRecognized;
  BOOL v20;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_20;
  -[ASRSchemaASREmojiMetrics recognizedEmojis](self, "recognizedEmojis");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recognizedEmojis");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

    goto LABEL_20;
  }
  -[ASRSchemaASREmojiMetrics recognizedEmojis](self, "recognizedEmojis");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[ASRSchemaASREmojiMetrics recognizedEmojis](self, "recognizedEmojis");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "recognizedEmojis");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_20;
  }
  else
  {

  }
  v13 = *((unsigned __int8 *)&self->_isEmojiExpectedButNotRecognized + 1);
  v14 = v4[19];
  if ((v13 & 1) != (v14 & 1))
  {
LABEL_20:
    v20 = 0;
    goto LABEL_21;
  }
  if ((v13 & 1) != 0)
  {
    isEmojiPersonalizationUsed = self->_isEmojiPersonalizationUsed;
    if (isEmojiPersonalizationUsed != objc_msgSend(v4, "isEmojiPersonalizationUsed"))
      goto LABEL_20;
    v13 = *((unsigned __int8 *)&self->_isEmojiExpectedButNotRecognized + 1);
    v14 = v4[19];
  }
  v16 = (v13 >> 1) & 1;
  if (v16 != ((v14 >> 1) & 1))
    goto LABEL_20;
  if (v16)
  {
    isEmojiDisambiguationUsed = self->_isEmojiDisambiguationUsed;
    if (isEmojiDisambiguationUsed == objc_msgSend(v4, "isEmojiDisambiguationUsed"))
    {
      v13 = *((unsigned __int8 *)&self->_isEmojiExpectedButNotRecognized + 1);
      v14 = v4[19];
      goto LABEL_16;
    }
    goto LABEL_20;
  }
LABEL_16:
  v18 = (v13 >> 2) & 1;
  if (v18 != ((v14 >> 2) & 1))
    goto LABEL_20;
  if (v18)
  {
    isEmojiExpectedButNotRecognized = self->_isEmojiExpectedButNotRecognized;
    if (isEmojiExpectedButNotRecognized != objc_msgSend(v4, "isEmojiExpectedButNotRecognized"))
      goto LABEL_20;
  }
  v20 = 1;
LABEL_21:

  return v20;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = -[NSArray hash](self->_recognizedEmojis, "hash");
  if (!*(&self->_isEmojiExpectedButNotRecognized + 1))
  {
    v4 = 0;
    if ((*(&self->_isEmojiExpectedButNotRecognized + 1) & 2) != 0)
      goto LABEL_3;
LABEL_6:
    v5 = 0;
    if ((*(&self->_isEmojiExpectedButNotRecognized + 1) & 4) != 0)
      goto LABEL_4;
LABEL_7:
    v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  v4 = 2654435761 * self->_isEmojiPersonalizationUsed;
  if ((*(&self->_isEmojiExpectedButNotRecognized + 1) & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v5 = 2654435761 * self->_isEmojiDisambiguationUsed;
  if ((*(&self->_isEmojiExpectedButNotRecognized + 1) & 4) == 0)
    goto LABEL_7;
LABEL_4:
  v6 = 2654435761 * self->_isEmojiExpectedButNotRecognized;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(&self->_isEmojiExpectedButNotRecognized + 1);
  if ((v4 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ASRSchemaASREmojiMetrics isEmojiDisambiguationUsed](self, "isEmojiDisambiguationUsed"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("isEmojiDisambiguationUsed"));

    v4 = *(&self->_isEmojiExpectedButNotRecognized + 1);
    if ((v4 & 4) == 0)
    {
LABEL_3:
      if ((v4 & 1) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(&self->_isEmojiExpectedButNotRecognized + 1) & 4) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ASRSchemaASREmojiMetrics isEmojiExpectedButNotRecognized](self, "isEmojiExpectedButNotRecognized"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("isEmojiExpectedButNotRecognized"));

  if (*(&self->_isEmojiExpectedButNotRecognized + 1))
  {
LABEL_4:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ASRSchemaASREmojiMetrics isEmojiPersonalizationUsed](self, "isEmojiPersonalizationUsed"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("isEmojiPersonalizationUsed"));

  }
LABEL_5:
  if (self->_recognizedEmojis)
  {
    -[ASRSchemaASREmojiMetrics recognizedEmojis](self, "recognizedEmojis");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("recognizedEmojis"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[ASRSchemaASREmojiMetrics dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (ASRSchemaASREmojiMetrics)initWithJSON:(id)a3
{
  void *v4;
  ASRSchemaASREmojiMetrics *v5;
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
    self = -[ASRSchemaASREmojiMetrics initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (ASRSchemaASREmojiMetrics)initWithDictionary:(id)a3
{
  id v4;
  ASRSchemaASREmojiMetrics *v5;
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
  void *v16;
  ASRSchemaASREmojiMetrics *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  objc_super v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)ASRSchemaASREmojiMetrics;
  v5 = -[ASRSchemaASREmojiMetrics init](&v23, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("recognizedEmojis"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      v7 = v6;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v20;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v20 != v10)
              objc_enumerationMutation(v7);
            v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v11);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v13 = (void *)objc_msgSend(v12, "copy", (_QWORD)v19);
              -[ASRSchemaASREmojiMetrics addRecognizedEmojis:](v5, "addRecognizedEmojis:", v13);

            }
            ++v11;
          }
          while (v9 != v11);
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
        }
        while (v9);
      }

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isEmojiPersonalizationUsed"), (_QWORD)v19);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ASRSchemaASREmojiMetrics setIsEmojiPersonalizationUsed:](v5, "setIsEmojiPersonalizationUsed:", objc_msgSend(v14, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isEmojiDisambiguationUsed"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ASRSchemaASREmojiMetrics setIsEmojiDisambiguationUsed:](v5, "setIsEmojiDisambiguationUsed:", objc_msgSend(v15, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isEmojiExpectedButNotRecognized"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ASRSchemaASREmojiMetrics setIsEmojiExpectedButNotRecognized:](v5, "setIsEmojiExpectedButNotRecognized:", objc_msgSend(v16, "BOOLValue"));
    v17 = v5;

  }
  return v5;
}

- (NSArray)recognizedEmojis
{
  return self->_recognizedEmojis;
}

- (void)setRecognizedEmojis:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (BOOL)isEmojiPersonalizationUsed
{
  return self->_isEmojiPersonalizationUsed;
}

- (BOOL)isEmojiDisambiguationUsed
{
  return self->_isEmojiDisambiguationUsed;
}

- (BOOL)isEmojiExpectedButNotRecognized
{
  return self->_isEmojiExpectedButNotRecognized;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recognizedEmojis, 0);
}

@end
