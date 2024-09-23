@implementation POMMESSchemaPOMMESPegasusSearchQuery

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
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)POMMESSchemaPOMMESPegasusSearchQuery;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v11, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[POMMESSchemaPOMMESPegasusSearchQuery userSpans](self, "userSpans", v11.receiver, v11.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[POMMESSchemaPOMMESPegasusSearchQuery setUserSpans:](self, "setUserSpans:", v7);

  -[POMMESSchemaPOMMESPegasusSearchQuery ampUserState](self, "ampUserState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "applySensitiveConditionsPolicy:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v9, "suppressMessage");
  if ((_DWORD)v4)
    -[POMMESSchemaPOMMESPegasusSearchQuery deleteAmpUserState](self, "deleteAmpUserState");
  return v5;
}

- (void)setHasRewrittenUtterances:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_hasRewrittenUtterances = a3;
}

- (BOOL)hasHasRewrittenUtterances
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasHasRewrittenUtterances:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteHasRewrittenUtterances
{
  -[POMMESSchemaPOMMESPegasusSearchQuery setHasRewrittenUtterances:](self, "setHasRewrittenUtterances:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)clearUserSpan
{
  -[NSArray removeAllObjects](self->_userSpans, "removeAllObjects");
}

- (void)addUserSpan:(id)a3
{
  id v4;
  NSArray *userSpans;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  userSpans = self->_userSpans;
  v8 = v4;
  if (!userSpans)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_userSpans;
    self->_userSpans = v6;

    v4 = v8;
    userSpans = self->_userSpans;
  }
  -[NSArray addObject:](userSpans, "addObject:", v4);

}

- (unint64_t)userSpanCount
{
  return -[NSArray count](self->_userSpans, "count");
}

- (id)userSpanAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_userSpans, "objectAtIndexedSubscript:", a3);
}

- (void)setHasAudioQueueStateInfo:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_hasAudioQueueStateInfo = a3;
}

- (BOOL)hasHasAudioQueueStateInfo
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasHasAudioQueueStateInfo:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteHasAudioQueueStateInfo
{
  -[POMMESSchemaPOMMESPegasusSearchQuery setHasAudioQueueStateInfo:](self, "setHasAudioQueueStateInfo:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)hasAmpUserState
{
  return self->_ampUserState != 0;
}

- (void)deleteAmpUserState
{
  -[POMMESSchemaPOMMESPegasusSearchQuery setAmpUserState:](self, "setAmpUserState:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return POMMESSchemaPOMMESPegasusSearchQueryReadFrom(self, (uint64_t)a3);
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
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteBOOLField();
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_userSpans;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteBOOLField();
  -[POMMESSchemaPOMMESPegasusSearchQuery ampUserState](self, "ampUserState", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[POMMESSchemaPOMMESPegasusSearchQuery ampUserState](self, "ampUserState");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  int hasRewrittenUtterances;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  int v13;
  int hasAudioQueueStateInfo;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  BOOL v20;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_18;
  if ((*(_BYTE *)&self->_has & 1) != (v4[40] & 1))
    goto LABEL_18;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    hasRewrittenUtterances = self->_hasRewrittenUtterances;
    if (hasRewrittenUtterances != objc_msgSend(v4, "hasRewrittenUtterances"))
      goto LABEL_18;
  }
  -[POMMESSchemaPOMMESPegasusSearchQuery userSpans](self, "userSpans");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userSpans");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_17;
  -[POMMESSchemaPOMMESPegasusSearchQuery userSpans](self, "userSpans");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[POMMESSchemaPOMMESPegasusSearchQuery userSpans](self, "userSpans");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userSpans");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_18;
  }
  else
  {

  }
  v13 = (*(_BYTE *)&self->_has >> 1) & 1;
  if (v13 != ((v4[40] >> 1) & 1))
    goto LABEL_18;
  if (v13)
  {
    hasAudioQueueStateInfo = self->_hasAudioQueueStateInfo;
    if (hasAudioQueueStateInfo != objc_msgSend(v4, "hasAudioQueueStateInfo"))
      goto LABEL_18;
  }
  -[POMMESSchemaPOMMESPegasusSearchQuery ampUserState](self, "ampUserState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ampUserState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[POMMESSchemaPOMMESPegasusSearchQuery ampUserState](self, "ampUserState");
    v15 = objc_claimAutoreleasedReturnValue();
    if (!v15)
    {

LABEL_21:
      v20 = 1;
      goto LABEL_19;
    }
    v16 = (void *)v15;
    -[POMMESSchemaPOMMESPegasusSearchQuery ampUserState](self, "ampUserState");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ampUserState");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v17, "isEqual:", v18);

    if ((v19 & 1) != 0)
      goto LABEL_21;
  }
  else
  {
LABEL_17:

  }
LABEL_18:
  v20 = 0;
LABEL_19:

  return v20;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_hasRewrittenUtterances;
  else
    v3 = 0;
  v4 = -[NSArray hash](self->_userSpans, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v5 = 2654435761 * self->_hasAudioQueueStateInfo;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5 ^ -[POMMESSchemaPOMMESPegasusSearchQueryAmpUserState hash](self->_ampUserState, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char has;
  void *v8;
  void *v9;
  void *v10;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_ampUserState)
  {
    -[POMMESSchemaPOMMESPegasusSearchQuery ampUserState](self, "ampUserState");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("ampUserState"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("ampUserState"));

    }
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[POMMESSchemaPOMMESPegasusSearchQuery hasAudioQueueStateInfo](self, "hasAudioQueueStateInfo"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("hasAudioQueueStateInfo"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[POMMESSchemaPOMMESPegasusSearchQuery hasRewrittenUtterances](self, "hasRewrittenUtterances"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("hasRewrittenUtterances"));

  }
  if (-[NSArray count](self->_userSpans, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v11 = self->_userSpans;
    v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v20 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v19);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16)
          {
            objc_msgSend(v10, "addObject:", v16);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "addObject:", v17);

          }
        }
        v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v13);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("userSpan"));
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (_QWORD)v19);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[POMMESSchemaPOMMESPegasusSearchQuery dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (POMMESSchemaPOMMESPegasusSearchQuery)initWithJSON:(id)a3
{
  void *v4;
  POMMESSchemaPOMMESPegasusSearchQuery *v5;
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
    self = -[POMMESSchemaPOMMESPegasusSearchQuery initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (POMMESSchemaPOMMESPegasusSearchQuery)initWithDictionary:(id)a3
{
  id v4;
  POMMESSchemaPOMMESPegasusSearchQuery *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  POMMESSchemaPOMMESPegasusSearchQueryUserSpan *v14;
  void *v15;
  void *v16;
  POMMESSchemaPOMMESPegasusSearchQueryAmpUserState *v17;
  POMMESSchemaPOMMESPegasusSearchQuery *v18;
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
  v25.super_class = (Class)POMMESSchemaPOMMESPegasusSearchQuery;
  v5 = -[POMMESSchemaPOMMESPegasusSearchQuery init](&v25, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasRewrittenUtterances"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[POMMESSchemaPOMMESPegasusSearchQuery setHasRewrittenUtterances:](v5, "setHasRewrittenUtterances:", objc_msgSend(v6, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("userSpan"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v20 = v6;
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      v8 = v7;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v22;
        do
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v22 != v11)
              objc_enumerationMutation(v8);
            v13 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v12);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v14 = -[POMMESSchemaPOMMESPegasusSearchQueryUserSpan initWithDictionary:]([POMMESSchemaPOMMESPegasusSearchQueryUserSpan alloc], "initWithDictionary:", v13);
              -[POMMESSchemaPOMMESPegasusSearchQuery addUserSpan:](v5, "addUserSpan:", v14);

            }
            ++v12;
          }
          while (v10 != v12);
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
        }
        while (v10);
      }

      v6 = v20;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasAudioQueueStateInfo"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[POMMESSchemaPOMMESPegasusSearchQuery setHasAudioQueueStateInfo:](v5, "setHasAudioQueueStateInfo:", objc_msgSend(v15, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ampUserState"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = -[POMMESSchemaPOMMESPegasusSearchQueryAmpUserState initWithDictionary:]([POMMESSchemaPOMMESPegasusSearchQueryAmpUserState alloc], "initWithDictionary:", v16);
      -[POMMESSchemaPOMMESPegasusSearchQuery setAmpUserState:](v5, "setAmpUserState:", v17);

    }
    v18 = v5;

  }
  return v5;
}

- (BOOL)hasRewrittenUtterances
{
  return self->_hasRewrittenUtterances;
}

- (NSArray)userSpans
{
  return self->_userSpans;
}

- (void)setUserSpans:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)hasAudioQueueStateInfo
{
  return self->_hasAudioQueueStateInfo;
}

- (POMMESSchemaPOMMESPegasusSearchQueryAmpUserState)ampUserState
{
  return self->_ampUserState;
}

- (void)setAmpUserState:(id)a3
{
  objc_storeStrong((id *)&self->_ampUserState, a3);
}

- (void)setHasAmpUserState:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ampUserState, 0);
  objc_storeStrong((id *)&self->_userSpans, 0);
}

@end
