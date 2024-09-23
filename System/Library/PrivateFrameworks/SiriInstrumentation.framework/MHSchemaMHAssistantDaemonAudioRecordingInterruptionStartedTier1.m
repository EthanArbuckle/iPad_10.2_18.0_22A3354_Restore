@implementation MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1

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
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v10, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isConditionSet:", 4))
    -[MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1 deleteActiveSessionDisplayIds](self, "deleteActiveSessionDisplayIds");
  -[MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1 linkId](self, "linkId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1 deleteLinkId](self, "deleteLinkId");

  return v5;
}

- (BOOL)hasLinkId
{
  return self->_linkId != 0;
}

- (void)deleteLinkId
{
  -[MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1 setLinkId:](self, "setLinkId:", 0);
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
  -[MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1 setAudioSessionCategory:](self, "setAudioSessionCategory:", 0);
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
  -[MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1 setAudioSessionMode:](self, "setAudioSessionMode:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)readFrom:(id)a3
{
  return MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1ReadFrom(self, (uint64_t)a3);
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
  uint64_t i;
  char has;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1 linkId](self, "linkId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1 linkId](self, "linkId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = self->_activeSessionDisplayIds;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        PBDataWriterWriteStringField();
      }
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
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
  BOOL v17;
  $961204A90ACD32FF3BE5F34EDBEDA117 has;
  unsigned int v20;
  int audioSessionCategory;
  int v22;
  int audioSessionMode;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  -[MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1 linkId](self, "linkId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "linkId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1 linkId](self, "linkId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1 linkId](self, "linkId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "linkId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1 activeSessionDisplayIds](self, "activeSessionDisplayIds");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activeSessionDisplayIds");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_11:

    goto LABEL_12;
  }
  -[MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1 activeSessionDisplayIds](self, "activeSessionDisplayIds");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1 activeSessionDisplayIds](self, "activeSessionDisplayIds");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "activeSessionDisplayIds");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_12;
  }
  else
  {

  }
  has = self->_has;
  v20 = v4[32];
  if ((*(_BYTE *)&has & 1) == (v20 & 1))
  {
    if ((*(_BYTE *)&has & 1) != 0)
    {
      audioSessionCategory = self->_audioSessionCategory;
      if (audioSessionCategory != objc_msgSend(v4, "audioSessionCategory"))
        goto LABEL_12;
      has = self->_has;
      v20 = v4[32];
    }
    v22 = (*(unsigned int *)&has >> 1) & 1;
    if (v22 == ((v20 >> 1) & 1))
    {
      if (!v22
        || (audioSessionMode = self->_audioSessionMode,
            audioSessionMode == objc_msgSend(v4, "audioSessionMode")))
      {
        v17 = 1;
        goto LABEL_13;
      }
    }
  }
LABEL_12:
  v17 = 0;
LABEL_13:

  return v17;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = -[SISchemaUUID hash](self->_linkId, "hash");
  v4 = -[NSArray hash](self->_activeSessionDisplayIds, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v5 = 2654435761 * self->_audioSessionCategory;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v6 = 2654435761 * self->_audioSessionMode;
  return v4 ^ v3 ^ v5 ^ v6;
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
  void *v11;
  void *v12;
  void *v13;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_activeSessionDisplayIds)
  {
    -[MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1 activeSessionDisplayIds](self, "activeSessionDisplayIds");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("activeSessionDisplayIds"));

  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v7 = -[MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1 audioSessionCategory](self, "audioSessionCategory")- 1;
    if (v7 > 0x1A)
      v8 = CFSTR("MHAUDIOSESSIONCATEGORY_UNKNOWN");
    else
      v8 = off_1E562FF60[v7];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("audioSessionCategory"));
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v9 = -[MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1 audioSessionMode](self, "audioSessionMode")
       - 1;
    if (v9 > 0x1C)
      v10 = CFSTR("MHAUDIOSESSIONMODE_UNKNOWN");
    else
      v10 = off_1E5630038[v9];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("audioSessionMode"));
  }
  if (self->_linkId)
  {
    -[MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1 linkId](self, "linkId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("linkId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("linkId"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1 dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1)initWithJSON:(id)a3
{
  void *v4;
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1 *v5;
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
    self = -[MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1 initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1)initWithDictionary:(id)a3
{
  id v4;
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1 *v5;
  void *v6;
  SISchemaUUID *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1 *v18;
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
  v24.super_class = (Class)MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1;
  v5 = -[MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1 init](&v24, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("linkId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v6);
      -[MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1 setLinkId:](v5, "setLinkId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("activeSessionDisplayIds"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      v9 = v8;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v21;
        do
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v21 != v12)
              objc_enumerationMutation(v9);
            v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v13);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v15 = (void *)objc_msgSend(v14, "copy", (_QWORD)v20);
              -[MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1 addActiveSessionDisplayIds:](v5, "addActiveSessionDisplayIds:", v15);

            }
            ++v13;
          }
          while (v11 != v13);
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
        }
        while (v11);
      }

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("audioSessionCategory"), (_QWORD)v20);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1 setAudioSessionCategory:](v5, "setAudioSessionCategory:", objc_msgSend(v16, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("audioSessionMode"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1 setAudioSessionMode:](v5, "setAudioSessionMode:", objc_msgSend(v17, "intValue"));
    v18 = v5;

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

- (NSArray)activeSessionDisplayIds
{
  return self->_activeSessionDisplayIds;
}

- (void)setActiveSessionDisplayIds:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int)audioSessionCategory
{
  return self->_audioSessionCategory;
}

- (int)audioSessionMode
{
  return self->_audioSessionMode;
}

- (void)setHasLinkId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeSessionDisplayIds, 0);
  objc_storeStrong((id *)&self->_linkId, 0);
}

@end
