@implementation PEGASUSSchemaPEGASUSAudioUnderstanding

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setAudioVerb:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_audioVerb = a3;
}

- (BOOL)hasAudioVerb
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasAudioVerb:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteAudioVerb
{
  -[PEGASUSSchemaPEGASUSAudioUnderstanding setAudioVerb:](self, "setAudioVerb:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setRequestedMediaType:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_requestedMediaType = a3;
}

- (BOOL)hasRequestedMediaType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasRequestedMediaType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteRequestedMediaType
{
  -[PEGASUSSchemaPEGASUSAudioUnderstanding setRequestedMediaType:](self, "setRequestedMediaType:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)clearAudioAttributes
{
  -[NSArray removeAllObjects](self->_audioAttributes, "removeAllObjects");
}

- (void)addAudioAttributes:(int)a3
{
  uint64_t v3;
  NSArray *audioAttributes;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v3 = *(_QWORD *)&a3;
  audioAttributes = self->_audioAttributes;
  if (!audioAttributes)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_audioAttributes;
    self->_audioAttributes = v6;

    audioAttributes = self->_audioAttributes;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSArray addObject:](audioAttributes, "addObject:", v8);

}

- (unint64_t)audioAttributesCount
{
  return -[NSArray count](self->_audioAttributes, "count");
}

- (int)audioAttributesAtIndex:(unint64_t)a3
{
  void *v3;
  int v4;

  -[NSArray objectAtIndexedSubscript:](self->_audioAttributes, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  return v4;
}

- (void)setAudioDecade:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_audioDecade = a3;
}

- (BOOL)hasAudioDecade
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasAudioDecade:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteAudioDecade
{
  -[PEGASUSSchemaPEGASUSAudioUnderstanding setAudioDecade:](self, "setAudioDecade:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (BOOL)readFrom:(id)a3
{
  return PEGASUSSchemaPEGASUSAudioUnderstandingReadFrom(self, (uint64_t)a3);
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
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteInt32Field();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = self->_audioAttributes;
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
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "intValue", (_QWORD)v11);
        PBDataWriterWriteInt32Field();
      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

  if ((*(_BYTE *)&self->_has & 4) != 0)
    PBDataWriterWriteInt32Field();

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $B46EF0E530EC967909A69E8F6C95FCE8 has;
  unsigned int v6;
  int audioVerb;
  int v8;
  int requestedMediaType;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  int v18;
  int audioDecade;
  BOOL v20;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_19;
  has = self->_has;
  v6 = v4[28];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_19;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    audioVerb = self->_audioVerb;
    if (audioVerb != objc_msgSend(v4, "audioVerb"))
    {
LABEL_19:
      v20 = 0;
      goto LABEL_20;
    }
    has = self->_has;
    v6 = v4[28];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_19;
  if (v8)
  {
    requestedMediaType = self->_requestedMediaType;
    if (requestedMediaType != objc_msgSend(v4, "requestedMediaType"))
      goto LABEL_19;
  }
  -[PEGASUSSchemaPEGASUSAudioUnderstanding audioAttributes](self, "audioAttributes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "audioAttributes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if ((v10 == 0) == (v11 != 0))
  {

    goto LABEL_19;
  }
  -[PEGASUSSchemaPEGASUSAudioUnderstanding audioAttributes](self, "audioAttributes");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[PEGASUSSchemaPEGASUSAudioUnderstanding audioAttributes](self, "audioAttributes");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "audioAttributes");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_19;
  }
  else
  {

  }
  v18 = (*(_BYTE *)&self->_has >> 2) & 1;
  if (v18 != ((v4[28] >> 2) & 1))
    goto LABEL_19;
  if (v18)
  {
    audioDecade = self->_audioDecade;
    if (audioDecade != objc_msgSend(v4, "audioDecade"))
      goto LABEL_19;
  }
  v20 = 1;
LABEL_20:

  return v20;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v3 = 2654435761 * self->_audioVerb;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_requestedMediaType;
      goto LABEL_6;
    }
  }
  v4 = 0;
LABEL_6:
  v5 = -[NSArray hash](self->_audioAttributes, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
    v6 = 2654435761 * self->_audioDecade;
  else
    v6 = 0;
  return v4 ^ v3 ^ v6 ^ v5;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  char has;
  unsigned int v7;
  const __CFString *v8;
  unsigned int v9;
  const __CFString *v10;
  unsigned int v11;
  const __CFString *v12;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSArray count](self->_audioAttributes, "count"))
  {
    -[PEGASUSSchemaPEGASUSAudioUnderstanding audioAttributes](self, "audioAttributes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("audioAttributes"));

  }
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v7 = -[PEGASUSSchemaPEGASUSAudioUnderstanding audioDecade](self, "audioDecade") - 1;
    if (v7 > 0xA)
      v8 = CFSTR("PEGASUSAUDIODECADE_UNKNOWN");
    else
      v8 = off_1E563B408[v7];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("audioDecade"));
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_5:
      if ((has & 2) == 0)
        goto LABEL_19;
      goto LABEL_15;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_5;
  }
  v9 = -[PEGASUSSchemaPEGASUSAudioUnderstanding audioVerb](self, "audioVerb") - 1;
  if (v9 > 9)
    v10 = CFSTR("PEGASUSAUDIOVERB_UNKNOWN");
  else
    v10 = off_1E563B460[v9];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("audioVerb"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_15:
    v11 = -[PEGASUSSchemaPEGASUSAudioUnderstanding requestedMediaType](self, "requestedMediaType") - 1;
    if (v11 > 0x17)
      v12 = CFSTR("PEGASUSREQUESTEDMEDIATYPE_UNKNOWN");
    else
      v12 = off_1E563B4B0[v11];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("requestedMediaType"));
  }
LABEL_19:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PEGASUSSchemaPEGASUSAudioUnderstanding dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (PEGASUSSchemaPEGASUSAudioUnderstanding)initWithJSON:(id)a3
{
  void *v4;
  PEGASUSSchemaPEGASUSAudioUnderstanding *v5;
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
    self = -[PEGASUSSchemaPEGASUSAudioUnderstanding initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PEGASUSSchemaPEGASUSAudioUnderstanding)initWithDictionary:(id)a3
{
  id v4;
  PEGASUSSchemaPEGASUSAudioUnderstanding *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  PEGASUSSchemaPEGASUSAudioUnderstanding *v16;
  void *v18;
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
  v23.super_class = (Class)PEGASUSSchemaPEGASUSAudioUnderstanding;
  v5 = -[PEGASUSSchemaPEGASUSAudioUnderstanding init](&v23, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("audioVerb"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PEGASUSSchemaPEGASUSAudioUnderstanding setAudioVerb:](v5, "setAudioVerb:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("requestedMediaType"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PEGASUSSchemaPEGASUSAudioUnderstanding setRequestedMediaType:](v5, "setRequestedMediaType:", objc_msgSend(v7, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("audioAttributes"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v18 = v6;
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      v9 = v8;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v20;
        do
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v20 != v12)
              objc_enumerationMutation(v9);
            v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v13);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              -[PEGASUSSchemaPEGASUSAudioUnderstanding addAudioAttributes:](v5, "addAudioAttributes:", objc_msgSend(v14, "intValue"));
            ++v13;
          }
          while (v11 != v13);
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
        }
        while (v11);
      }

      v6 = v18;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("audioDecade"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PEGASUSSchemaPEGASUSAudioUnderstanding setAudioDecade:](v5, "setAudioDecade:", objc_msgSend(v15, "intValue"));
    v16 = v5;

  }
  return v5;
}

- (int)audioVerb
{
  return self->_audioVerb;
}

- (int)requestedMediaType
{
  return self->_requestedMediaType;
}

- (NSArray)audioAttributes
{
  return self->_audioAttributes;
}

- (void)setAudioAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int)audioDecade
{
  return self->_audioDecade;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioAttributes, 0);
}

@end
