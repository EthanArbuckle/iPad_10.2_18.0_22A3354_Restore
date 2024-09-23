@implementation MHSchemaMHAssistantDaemonAudioRecordingFailureInsufficientPriority

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)clearActiveSessionDisplayIds
{
  -[NSArray removeAllObjects](self->_activeSessionDisplayIds, "removeAllObjects");
}

- (void)addActiveSessionDisplayIds:(id)a3
{
  id v4;
  NSArray *activeSessionDisplayIds;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  activeSessionDisplayIds = self->_activeSessionDisplayIds;
  v8 = v4;
  if (!activeSessionDisplayIds)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_activeSessionDisplayIds;
    self->_activeSessionDisplayIds = v6;

    v4 = v8;
    activeSessionDisplayIds = self->_activeSessionDisplayIds;
  }
  -[NSArray addObject:](activeSessionDisplayIds, "addObject:", v4);

}

- (unint64_t)activeSessionDisplayIdsCount
{
  return -[NSArray count](self->_activeSessionDisplayIds, "count");
}

- (id)activeSessionDisplayIdsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_activeSessionDisplayIds, "objectAtIndexedSubscript:", a3);
}

- (void)setAudioSessionCategory:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_audioSessionCategory = a3;
}

- (BOOL)hasAudioSessionCategory
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasAudioSessionCategory:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteAudioSessionCategory
{
  -[MHSchemaMHAssistantDaemonAudioRecordingFailureInsufficientPriority setAudioSessionCategory:](self, "setAudioSessionCategory:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setAudioSessionMode:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_audioSessionMode = a3;
}

- (BOOL)hasAudioSessionMode
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasAudioSessionMode:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteAudioSessionMode
{
  -[MHSchemaMHAssistantDaemonAudioRecordingFailureInsufficientPriority setAudioSessionMode:](self, "setAudioSessionMode:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)readFrom:(id)a3
{
  return MHSchemaMHAssistantDaemonAudioRecordingFailureInsufficientPriorityReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  char has;
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
  v5 = self->_activeSessionDisplayIds;
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

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteInt32Field();

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
  $961204A90ACD32FF3BE5F34EDBEDA117 has;
  unsigned int v14;
  int audioSessionCategory;
  int v16;
  int audioSessionMode;
  BOOL v18;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_16;
  -[MHSchemaMHAssistantDaemonAudioRecordingFailureInsufficientPriority activeSessionDisplayIds](self, "activeSessionDisplayIds");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activeSessionDisplayIds");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

    goto LABEL_16;
  }
  -[MHSchemaMHAssistantDaemonAudioRecordingFailureInsufficientPriority activeSessionDisplayIds](self, "activeSessionDisplayIds");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[MHSchemaMHAssistantDaemonAudioRecordingFailureInsufficientPriority activeSessionDisplayIds](self, "activeSessionDisplayIds");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "activeSessionDisplayIds");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_16;
  }
  else
  {

  }
  has = self->_has;
  v14 = v4[24];
  if ((*(_BYTE *)&has & 1) != (v14 & 1))
  {
LABEL_16:
    v18 = 0;
    goto LABEL_17;
  }
  if ((*(_BYTE *)&has & 1) != 0)
  {
    audioSessionCategory = self->_audioSessionCategory;
    if (audioSessionCategory == objc_msgSend(v4, "audioSessionCategory"))
    {
      has = self->_has;
      v14 = v4[24];
      goto LABEL_12;
    }
    goto LABEL_16;
  }
LABEL_12:
  v16 = (*(unsigned int *)&has >> 1) & 1;
  if (v16 != ((v14 >> 1) & 1))
    goto LABEL_16;
  if (v16)
  {
    audioSessionMode = self->_audioSessionMode;
    if (audioSessionMode != objc_msgSend(v4, "audioSessionMode"))
      goto LABEL_16;
  }
  v18 = 1;
LABEL_17:

  return v18;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = -[NSArray hash](self->_activeSessionDisplayIds, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = 2654435761 * self->_audioSessionCategory;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v5 = 0;
    return v4 ^ v3 ^ v5;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v5 = 2654435761 * self->_audioSessionMode;
  return v4 ^ v3 ^ v5;
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_activeSessionDisplayIds)
  {
    -[MHSchemaMHAssistantDaemonAudioRecordingFailureInsufficientPriority activeSessionDisplayIds](self, "activeSessionDisplayIds");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("activeSessionDisplayIds"));

  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v7 = -[MHSchemaMHAssistantDaemonAudioRecordingFailureInsufficientPriority audioSessionCategory](self, "audioSessionCategory")- 1;
    if (v7 > 0x1A)
      v8 = CFSTR("MHAUDIOSESSIONCATEGORY_UNKNOWN");
    else
      v8 = *(&off_1E563E570 + v7);
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("audioSessionCategory"));
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v9 = -[MHSchemaMHAssistantDaemonAudioRecordingFailureInsufficientPriority audioSessionMode](self, "audioSessionMode")- 1;
    if (v9 > 0x1C)
      v10 = CFSTR("MHAUDIOSESSIONMODE_UNKNOWN");
    else
      v10 = *(&off_1E563E648 + v9);
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("audioSessionMode"));
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[MHSchemaMHAssistantDaemonAudioRecordingFailureInsufficientPriority dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (MHSchemaMHAssistantDaemonAudioRecordingFailureInsufficientPriority)initWithJSON:(id)a3
{
  void *v4;
  MHSchemaMHAssistantDaemonAudioRecordingFailureInsufficientPriority *v5;
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
    self = -[MHSchemaMHAssistantDaemonAudioRecordingFailureInsufficientPriority initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (MHSchemaMHAssistantDaemonAudioRecordingFailureInsufficientPriority)initWithDictionary:(id)a3
{
  id v4;
  MHSchemaMHAssistantDaemonAudioRecordingFailureInsufficientPriority *v5;
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
  MHSchemaMHAssistantDaemonAudioRecordingFailureInsufficientPriority *v16;
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
  v22.super_class = (Class)MHSchemaMHAssistantDaemonAudioRecordingFailureInsufficientPriority;
  v5 = -[MHSchemaMHAssistantDaemonAudioRecordingFailureInsufficientPriority init](&v22, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("activeSessionDisplayIds"));
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
              -[MHSchemaMHAssistantDaemonAudioRecordingFailureInsufficientPriority addActiveSessionDisplayIds:](v5, "addActiveSessionDisplayIds:", v13);

            }
            ++v11;
          }
          while (v9 != v11);
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
        }
        while (v9);
      }

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("audioSessionCategory"), (_QWORD)v18);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHAssistantDaemonAudioRecordingFailureInsufficientPriority setAudioSessionCategory:](v5, "setAudioSessionCategory:", objc_msgSend(v14, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("audioSessionMode"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHAssistantDaemonAudioRecordingFailureInsufficientPriority setAudioSessionMode:](v5, "setAudioSessionMode:", objc_msgSend(v15, "intValue"));
    v16 = v5;

  }
  return v5;
}

- (NSArray)activeSessionDisplayIds
{
  return self->_activeSessionDisplayIds;
}

- (void)setActiveSessionDisplayIds:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (int)audioSessionCategory
{
  return self->_audioSessionCategory;
}

- (int)audioSessionMode
{
  return self->_audioSessionMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeSessionDisplayIds, 0);
}

@end
