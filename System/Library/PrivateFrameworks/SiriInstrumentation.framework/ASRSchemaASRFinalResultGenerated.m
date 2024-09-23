@implementation ASRSchemaASRFinalResultGenerated

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)clearTokenSilenceStartTimeInNsList
{
  -[NSArray removeAllObjects](self->_tokenSilenceStartTimeInNsLists, "removeAllObjects");
}

- (void)addTokenSilenceStartTimeInNsList:(unint64_t)a3
{
  NSArray *tokenSilenceStartTimeInNsLists;
  NSArray *v6;
  NSArray *v7;
  id v8;

  tokenSilenceStartTimeInNsLists = self->_tokenSilenceStartTimeInNsLists;
  if (!tokenSilenceStartTimeInNsLists)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_tokenSilenceStartTimeInNsLists;
    self->_tokenSilenceStartTimeInNsLists = v6;

    tokenSilenceStartTimeInNsLists = self->_tokenSilenceStartTimeInNsLists;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSArray addObject:](tokenSilenceStartTimeInNsLists, "addObject:", v8);

}

- (unint64_t)tokenSilenceStartTimeInNsListCount
{
  return -[NSArray count](self->_tokenSilenceStartTimeInNsLists, "count");
}

- (unint64_t)tokenSilenceStartTimeInNsListAtIndex:(unint64_t)a3
{
  void *v3;
  unint64_t v4;

  -[NSArray objectAtIndexedSubscript:](self->_tokenSilenceStartTimeInNsLists, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedLongLongValue");

  return v4;
}

- (void)clearCorrectPartialResultIndexList
{
  -[NSArray removeAllObjects](self->_correctPartialResultIndexLists, "removeAllObjects");
}

- (void)addCorrectPartialResultIndexList:(int)a3
{
  uint64_t v3;
  NSArray *correctPartialResultIndexLists;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v3 = *(_QWORD *)&a3;
  correctPartialResultIndexLists = self->_correctPartialResultIndexLists;
  if (!correctPartialResultIndexLists)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_correctPartialResultIndexLists;
    self->_correctPartialResultIndexLists = v6;

    correctPartialResultIndexLists = self->_correctPartialResultIndexLists;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSArray addObject:](correctPartialResultIndexLists, "addObject:", v8);

}

- (unint64_t)correctPartialResultIndexListCount
{
  return -[NSArray count](self->_correctPartialResultIndexLists, "count");
}

- (int)correctPartialResultIndexListAtIndex:(unint64_t)a3
{
  void *v3;
  int v4;

  -[NSArray objectAtIndexedSubscript:](self->_correctPartialResultIndexLists, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  return v4;
}

- (void)setIsAfterResume:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_isAfterResume = a3;
}

- (BOOL)hasIsAfterResume
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasIsAfterResume:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteIsAfterResume
{
  -[ASRSchemaASRFinalResultGenerated setIsAfterResume:](self, "setIsAfterResume:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)clearCorrectAlignedPartialResultIndexList
{
  -[NSArray removeAllObjects](self->_correctAlignedPartialResultIndexLists, "removeAllObjects");
}

- (void)addCorrectAlignedPartialResultIndexList:(int)a3
{
  uint64_t v3;
  NSArray *correctAlignedPartialResultIndexLists;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v3 = *(_QWORD *)&a3;
  correctAlignedPartialResultIndexLists = self->_correctAlignedPartialResultIndexLists;
  if (!correctAlignedPartialResultIndexLists)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_correctAlignedPartialResultIndexLists;
    self->_correctAlignedPartialResultIndexLists = v6;

    correctAlignedPartialResultIndexLists = self->_correctAlignedPartialResultIndexLists;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSArray addObject:](correctAlignedPartialResultIndexLists, "addObject:", v8);

}

- (unint64_t)correctAlignedPartialResultIndexListCount
{
  return -[NSArray count](self->_correctAlignedPartialResultIndexLists, "count");
}

- (int)correctAlignedPartialResultIndexListAtIndex:(unint64_t)a3
{
  void *v3;
  int v4;

  -[NSArray objectAtIndexedSubscript:](self->_correctAlignedPartialResultIndexLists, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  return v4;
}

- (void)clearCorrectAlignedUnfilteredPartialResultIndexList
{
  -[NSArray removeAllObjects](self->_correctAlignedUnfilteredPartialResultIndexLists, "removeAllObjects");
}

- (void)addCorrectAlignedUnfilteredPartialResultIndexList:(int)a3
{
  uint64_t v3;
  NSArray *correctAlignedUnfilteredPartialResultIndexLists;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v3 = *(_QWORD *)&a3;
  correctAlignedUnfilteredPartialResultIndexLists = self->_correctAlignedUnfilteredPartialResultIndexLists;
  if (!correctAlignedUnfilteredPartialResultIndexLists)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_correctAlignedUnfilteredPartialResultIndexLists;
    self->_correctAlignedUnfilteredPartialResultIndexLists = v6;

    correctAlignedUnfilteredPartialResultIndexLists = self->_correctAlignedUnfilteredPartialResultIndexLists;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSArray addObject:](correctAlignedUnfilteredPartialResultIndexLists, "addObject:", v8);

}

- (unint64_t)correctAlignedUnfilteredPartialResultIndexListCount
{
  return -[NSArray count](self->_correctAlignedUnfilteredPartialResultIndexLists, "count");
}

- (int)correctAlignedUnfilteredPartialResultIndexListAtIndex:(unint64_t)a3
{
  void *v3;
  int v4;

  -[NSArray objectAtIndexedSubscript:](self->_correctAlignedUnfilteredPartialResultIndexLists, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ASRSchemaASRFinalResultGeneratedReadFrom(self, (uint64_t)a3);
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
  NSArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v5 = self->_tokenSilenceStartTimeInNsLists;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v38;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v38 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * v9), "unsignedLongLongValue");
        PBDataWriterWriteUint64Field();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
    }
    while (v7);
  }

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v10 = self->_correctPartialResultIndexLists;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * v14), "intValue");
        PBDataWriterWriteInt32Field();
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
    }
    while (v12);
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteBOOLField();
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v15 = self->_correctAlignedPartialResultIndexLists;
  v16 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v29, v42, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v30;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v30 != v18)
          objc_enumerationMutation(v15);
        objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * v19), "intValue");
        PBDataWriterWriteInt32Field();
        ++v19;
      }
      while (v17 != v19);
      v17 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v29, v42, 16);
    }
    while (v17);
  }

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v20 = self->_correctAlignedUnfilteredPartialResultIndexLists;
  v21 = -[NSArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v25, v41, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v26;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v26 != v23)
          objc_enumerationMutation(v20);
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v24), "intValue", (_QWORD)v25);
        PBDataWriterWriteInt32Field();
        ++v24;
      }
      while (v22 != v24);
      v22 = -[NSArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v25, v41, 16);
    }
    while (v22);
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
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  int isAfterResume;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  BOOL v28;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_25;
  -[ASRSchemaASRFinalResultGenerated tokenSilenceStartTimeInNsLists](self, "tokenSilenceStartTimeInNsLists");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tokenSilenceStartTimeInNsLists");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_24;
  -[ASRSchemaASRFinalResultGenerated tokenSilenceStartTimeInNsLists](self, "tokenSilenceStartTimeInNsLists");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[ASRSchemaASRFinalResultGenerated tokenSilenceStartTimeInNsLists](self, "tokenSilenceStartTimeInNsLists");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "tokenSilenceStartTimeInNsLists");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_25;
  }
  else
  {

  }
  -[ASRSchemaASRFinalResultGenerated correctPartialResultIndexLists](self, "correctPartialResultIndexLists");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "correctPartialResultIndexLists");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_24;
  -[ASRSchemaASRFinalResultGenerated correctPartialResultIndexLists](self, "correctPartialResultIndexLists");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[ASRSchemaASRFinalResultGenerated correctPartialResultIndexLists](self, "correctPartialResultIndexLists");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "correctPartialResultIndexLists");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_25;
  }
  else
  {

  }
  if ((*(_BYTE *)&self->_has & 1) != (v4[48] & 1))
    goto LABEL_25;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    isAfterResume = self->_isAfterResume;
    if (isAfterResume != objc_msgSend(v4, "isAfterResume"))
      goto LABEL_25;
  }
  -[ASRSchemaASRFinalResultGenerated correctAlignedPartialResultIndexLists](self, "correctAlignedPartialResultIndexLists");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "correctAlignedPartialResultIndexLists");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_24;
  -[ASRSchemaASRFinalResultGenerated correctAlignedPartialResultIndexLists](self, "correctAlignedPartialResultIndexLists");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    -[ASRSchemaASRFinalResultGenerated correctAlignedPartialResultIndexLists](self, "correctAlignedPartialResultIndexLists");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "correctAlignedPartialResultIndexLists");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (!v22)
      goto LABEL_25;
  }
  else
  {

  }
  -[ASRSchemaASRFinalResultGenerated correctAlignedUnfilteredPartialResultIndexLists](self, "correctAlignedUnfilteredPartialResultIndexLists");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "correctAlignedUnfilteredPartialResultIndexLists");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[ASRSchemaASRFinalResultGenerated correctAlignedUnfilteredPartialResultIndexLists](self, "correctAlignedUnfilteredPartialResultIndexLists");
    v23 = objc_claimAutoreleasedReturnValue();
    if (!v23)
    {

LABEL_28:
      v28 = 1;
      goto LABEL_26;
    }
    v24 = (void *)v23;
    -[ASRSchemaASRFinalResultGenerated correctAlignedUnfilteredPartialResultIndexLists](self, "correctAlignedUnfilteredPartialResultIndexLists");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "correctAlignedUnfilteredPartialResultIndexLists");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "isEqual:", v26);

    if ((v27 & 1) != 0)
      goto LABEL_28;
  }
  else
  {
LABEL_24:

  }
LABEL_25:
  v28 = 0;
LABEL_26:

  return v28;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = -[NSArray hash](self->_tokenSilenceStartTimeInNsLists, "hash");
  v4 = -[NSArray hash](self->_correctPartialResultIndexLists, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v5 = 2654435761 * self->_isAfterResume;
  else
    v5 = 0;
  v6 = v4 ^ v3 ^ v5 ^ -[NSArray hash](self->_correctAlignedPartialResultIndexLists, "hash");
  return v6 ^ -[NSArray hash](self->_correctAlignedUnfilteredPartialResultIndexLists, "hash");
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
  void *v12;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSArray count](self->_correctAlignedPartialResultIndexLists, "count"))
  {
    -[ASRSchemaASRFinalResultGenerated correctAlignedPartialResultIndexLists](self, "correctAlignedPartialResultIndexLists");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("correctAlignedPartialResultIndexList"));

  }
  if (-[NSArray count](self->_correctAlignedUnfilteredPartialResultIndexLists, "count"))
  {
    -[ASRSchemaASRFinalResultGenerated correctAlignedUnfilteredPartialResultIndexLists](self, "correctAlignedUnfilteredPartialResultIndexLists");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("correctAlignedUnfilteredPartialResultIndexList"));

  }
  if (-[NSArray count](self->_correctPartialResultIndexLists, "count"))
  {
    -[ASRSchemaASRFinalResultGenerated correctPartialResultIndexLists](self, "correctPartialResultIndexLists");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("correctPartialResultIndexList"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ASRSchemaASRFinalResultGenerated isAfterResume](self, "isAfterResume"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("isAfterResume"));

  }
  if (-[NSArray count](self->_tokenSilenceStartTimeInNsLists, "count"))
  {
    -[ASRSchemaASRFinalResultGenerated tokenSilenceStartTimeInNsLists](self, "tokenSilenceStartTimeInNsLists");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("tokenSilenceStartTimeInNsList"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[ASRSchemaASRFinalResultGenerated dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (ASRSchemaASRFinalResultGenerated)initWithJSON:(id)a3
{
  void *v4;
  ASRSchemaASRFinalResultGenerated *v5;
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
    self = -[ASRSchemaASRFinalResultGenerated initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (ASRSchemaASRFinalResultGenerated)initWithDictionary:(id)a3
{
  id v4;
  ASRSchemaASRFinalResultGenerated *v5;
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
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  ASRSchemaASRFinalResultGenerated *v36;
  void *v38;
  void *v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  objc_super v57;
  _BYTE v58[128];
  _BYTE v59[128];
  _BYTE v60[128];
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v57.receiver = self;
  v57.super_class = (Class)ASRSchemaASRFinalResultGenerated;
  v5 = -[ASRSchemaASRFinalResultGenerated init](&v57, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("tokenSilenceStartTimeInNsList"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v55 = 0u;
      v56 = 0u;
      v53 = 0u;
      v54 = 0u;
      v7 = v6;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v54;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v54 != v10)
              objc_enumerationMutation(v7);
            v12 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * v11);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              -[ASRSchemaASRFinalResultGenerated addTokenSilenceStartTimeInNsList:](v5, "addTokenSilenceStartTimeInNsList:", objc_msgSend(v12, "unsignedLongLongValue"));
            ++v11;
          }
          while (v9 != v11);
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
        }
        while (v9);
      }

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("correctPartialResultIndexList"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v51 = 0u;
      v52 = 0u;
      v49 = 0u;
      v50 = 0u;
      v14 = v13;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v49, v60, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v50;
        do
        {
          v18 = 0;
          do
          {
            if (*(_QWORD *)v50 != v17)
              objc_enumerationMutation(v14);
            v19 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v18);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              -[ASRSchemaASRFinalResultGenerated addCorrectPartialResultIndexList:](v5, "addCorrectPartialResultIndexList:", objc_msgSend(v19, "intValue"));
            ++v18;
          }
          while (v16 != v18);
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v49, v60, 16);
        }
        while (v16);
      }

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isAfterResume"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ASRSchemaASRFinalResultGenerated setIsAfterResume:](v5, "setIsAfterResume:", objc_msgSend(v20, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("correctAlignedPartialResultIndexList"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v39 = v20;
    v40 = v13;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v22 = v6;
      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
      v23 = v21;
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v45, v59, 16);
      if (v24)
      {
        v25 = v24;
        v26 = *(_QWORD *)v46;
        do
        {
          v27 = 0;
          do
          {
            if (*(_QWORD *)v46 != v26)
              objc_enumerationMutation(v23);
            v28 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v27);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              -[ASRSchemaASRFinalResultGenerated addCorrectAlignedPartialResultIndexList:](v5, "addCorrectAlignedPartialResultIndexList:", objc_msgSend(v28, "intValue"));
            ++v27;
          }
          while (v25 != v27);
          v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v45, v59, 16);
        }
        while (v25);
      }

      v6 = v22;
      v20 = v39;
      v13 = v40;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("correctAlignedUnfilteredPartialResultIndexList"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v38 = v6;
      v43 = 0u;
      v44 = 0u;
      v41 = 0u;
      v42 = 0u;
      v30 = v29;
      v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v41, v58, 16);
      if (v31)
      {
        v32 = v31;
        v33 = *(_QWORD *)v42;
        do
        {
          v34 = 0;
          do
          {
            if (*(_QWORD *)v42 != v33)
              objc_enumerationMutation(v30);
            v35 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v34);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              -[ASRSchemaASRFinalResultGenerated addCorrectAlignedUnfilteredPartialResultIndexList:](v5, "addCorrectAlignedUnfilteredPartialResultIndexList:", objc_msgSend(v35, "intValue"));
            ++v34;
          }
          while (v32 != v34);
          v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v41, v58, 16);
        }
        while (v32);
      }

      v6 = v38;
      v20 = v39;
      v13 = v40;
    }
    v36 = v5;

  }
  return v5;
}

- (NSArray)tokenSilenceStartTimeInNsLists
{
  return self->_tokenSilenceStartTimeInNsLists;
}

- (void)setTokenSilenceStartTimeInNsLists:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)correctPartialResultIndexLists
{
  return self->_correctPartialResultIndexLists;
}

- (void)setCorrectPartialResultIndexLists:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)isAfterResume
{
  return self->_isAfterResume;
}

- (NSArray)correctAlignedPartialResultIndexLists
{
  return self->_correctAlignedPartialResultIndexLists;
}

- (void)setCorrectAlignedPartialResultIndexLists:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)correctAlignedUnfilteredPartialResultIndexLists
{
  return self->_correctAlignedUnfilteredPartialResultIndexLists;
}

- (void)setCorrectAlignedUnfilteredPartialResultIndexLists:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_correctAlignedUnfilteredPartialResultIndexLists, 0);
  objc_storeStrong((id *)&self->_correctAlignedPartialResultIndexLists, 0);
  objc_storeStrong((id *)&self->_correctPartialResultIndexLists, 0);
  objc_storeStrong((id *)&self->_tokenSilenceStartTimeInNsLists, 0);
}

@end
