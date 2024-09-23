@implementation PEGASUSSchemaPEGASUSAudioQueueStateInfo

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
  v9.super_class = (Class)PEGASUSSchemaPEGASUSAudioQueueStateInfo;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PEGASUSSchemaPEGASUSAudioQueueStateInfo audioQueueStateItem](self, "audioQueueStateItem", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[PEGASUSSchemaPEGASUSAudioQueueStateInfo deleteAudioQueueStateItem](self, "deleteAudioQueueStateItem");
  return v5;
}

- (void)setAudioState:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_audioState = a3;
}

- (BOOL)hasAudioState
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasAudioState:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteAudioState
{
  -[PEGASUSSchemaPEGASUSAudioQueueStateInfo setAudioState:](self, "setAudioState:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setAudioEntitySource:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_audioEntitySource = a3;
}

- (BOOL)hasAudioEntitySource
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasAudioEntitySource:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteAudioEntitySource
{
  -[PEGASUSSchemaPEGASUSAudioQueueStateInfo setAudioEntitySource:](self, "setAudioEntitySource:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setAudioNowPlayingQueueIndex:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_audioNowPlayingQueueIndex = a3;
}

- (BOOL)hasAudioNowPlayingQueueIndex
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasAudioNowPlayingQueueIndex:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteAudioNowPlayingQueueIndex
{
  -[PEGASUSSchemaPEGASUSAudioQueueStateInfo setAudioNowPlayingQueueIndex:](self, "setAudioNowPlayingQueueIndex:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (void)setAudioNowPlayingQueueCount:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_audioNowPlayingQueueCount = a3;
}

- (BOOL)hasAudioNowPlayingQueueCount
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasAudioNowPlayingQueueCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)deleteAudioNowPlayingQueueCount
{
  -[PEGASUSSchemaPEGASUSAudioQueueStateInfo setAudioNowPlayingQueueCount:](self, "setAudioNowPlayingQueueCount:", 0);
  *(_BYTE *)&self->_has &= ~8u;
}

- (BOOL)hasAudioQueueStateItem
{
  return self->_audioQueueStateItem != 0;
}

- (void)deleteAudioQueueStateItem
{
  -[PEGASUSSchemaPEGASUSAudioQueueStateInfo setAudioQueueStateItem:](self, "setAudioQueueStateItem:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return PEGASUSSchemaPEGASUSAudioQueueStateInfoReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_11:
  PBDataWriterWriteInt32Field();
  if ((*(_BYTE *)&self->_has & 8) != 0)
LABEL_5:
    PBDataWriterWriteInt32Field();
LABEL_6:
  -[PEGASUSSchemaPEGASUSAudioQueueStateInfo audioQueueStateItem](self, "audioQueueStateItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v8;
  if (v5)
  {
    -[PEGASUSSchemaPEGASUSAudioQueueStateInfo audioQueueStateItem](self, "audioQueueStateItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v6 = v8;
  }

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $3336B05F162A59F79082772B46FF372A has;
  unsigned int v6;
  int audioState;
  int v8;
  int audioEntitySource;
  int v10;
  int audioNowPlayingQueueIndex;
  int v12;
  int audioNowPlayingQueueCount;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  BOOL v22;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_22;
  has = self->_has;
  v6 = v4[32];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_22;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    audioState = self->_audioState;
    if (audioState != objc_msgSend(v4, "audioState"))
      goto LABEL_22;
    has = self->_has;
    v6 = v4[32];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 == ((v6 >> 1) & 1))
  {
    if (v8)
    {
      audioEntitySource = self->_audioEntitySource;
      if (audioEntitySource != objc_msgSend(v4, "audioEntitySource"))
        goto LABEL_22;
      has = self->_has;
      v6 = v4[32];
    }
    v10 = (*(unsigned int *)&has >> 2) & 1;
    if (v10 == ((v6 >> 2) & 1))
    {
      if (v10)
      {
        audioNowPlayingQueueIndex = self->_audioNowPlayingQueueIndex;
        if (audioNowPlayingQueueIndex != objc_msgSend(v4, "audioNowPlayingQueueIndex"))
          goto LABEL_22;
        has = self->_has;
        v6 = v4[32];
      }
      v12 = (*(unsigned int *)&has >> 3) & 1;
      if (v12 == ((v6 >> 3) & 1))
      {
        if (!v12
          || (audioNowPlayingQueueCount = self->_audioNowPlayingQueueCount,
              audioNowPlayingQueueCount == objc_msgSend(v4, "audioNowPlayingQueueCount")))
        {
          -[PEGASUSSchemaPEGASUSAudioQueueStateInfo audioQueueStateItem](self, "audioQueueStateItem");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "audioQueueStateItem");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v15;
          if ((v14 == 0) != (v15 != 0))
          {
            -[PEGASUSSchemaPEGASUSAudioQueueStateInfo audioQueueStateItem](self, "audioQueueStateItem");
            v17 = objc_claimAutoreleasedReturnValue();
            if (!v17)
            {

LABEL_25:
              v22 = 1;
              goto LABEL_23;
            }
            v18 = (void *)v17;
            -[PEGASUSSchemaPEGASUSAudioQueueStateInfo audioQueueStateItem](self, "audioQueueStateItem");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "audioQueueStateItem");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v19, "isEqual:", v20);

            if ((v21 & 1) != 0)
              goto LABEL_25;
          }
          else
          {

          }
        }
      }
    }
  }
LABEL_22:
  v22 = 0;
LABEL_23:

  return v22;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v2 = 2654435761 * self->_audioState;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v3 = 2654435761 * self->_audioEntitySource;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_4;
LABEL_8:
      v4 = 0;
      if ((*(_BYTE *)&self->_has & 8) != 0)
        goto LABEL_5;
LABEL_9:
      v5 = 0;
      return v3 ^ v2 ^ v4 ^ v5 ^ -[PEGASUSSchemaPEGASUSAudioQueueStateItem hash](self->_audioQueueStateItem, "hash");
    }
  }
  else
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_8;
LABEL_4:
  v4 = 2654435761 * self->_audioNowPlayingQueueIndex;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_9;
LABEL_5:
  v5 = 2654435761 * self->_audioNowPlayingQueueCount;
  return v3 ^ v2 ^ v4 ^ v5 ^ -[PEGASUSSchemaPEGASUSAudioQueueStateItem hash](self->_audioQueueStateItem, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  int v5;
  const __CFString *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  const __CFString *v14;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5 = -[PEGASUSSchemaPEGASUSAudioQueueStateInfo audioEntitySource](self, "audioEntitySource");
    v6 = CFSTR("PEGASUSAUDIOENTITYSOURCE_UNKNOWN");
    if (v5 == 1)
      v6 = CFSTR("PEGASUSAUDIOENTITYSOURCE_RADIO");
    if (v5 == 2)
      v7 = CFSTR("PEGASUSAUDIOENTITYSOURCE_LOCAL");
    else
      v7 = v6;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("audioEntitySource"));
    has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[PEGASUSSchemaPEGASUSAudioQueueStateInfo audioNowPlayingQueueCount](self, "audioNowPlayingQueueCount"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("audioNowPlayingQueueCount"));

    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[PEGASUSSchemaPEGASUSAudioQueueStateInfo audioNowPlayingQueueIndex](self, "audioNowPlayingQueueIndex"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("audioNowPlayingQueueIndex"));

  }
  if (self->_audioQueueStateItem)
  {
    -[PEGASUSSchemaPEGASUSAudioQueueStateInfo audioQueueStateItem](self, "audioQueueStateItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("audioQueueStateItem"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("audioQueueStateItem"));

    }
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v13 = -[PEGASUSSchemaPEGASUSAudioQueueStateInfo audioState](self, "audioState") - 1;
    if (v13 > 5)
      v14 = CFSTR("MEDIAPLAYBACKSTATE_UNKNOWN");
    else
      v14 = off_1E563B3A8[v13];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("audioState"));
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PEGASUSSchemaPEGASUSAudioQueueStateInfo dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (PEGASUSSchemaPEGASUSAudioQueueStateInfo)initWithJSON:(id)a3
{
  void *v4;
  PEGASUSSchemaPEGASUSAudioQueueStateInfo *v5;
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
    self = -[PEGASUSSchemaPEGASUSAudioQueueStateInfo initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PEGASUSSchemaPEGASUSAudioQueueStateInfo)initWithDictionary:(id)a3
{
  id v4;
  PEGASUSSchemaPEGASUSAudioQueueStateInfo *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  PEGASUSSchemaPEGASUSAudioQueueStateItem *v11;
  PEGASUSSchemaPEGASUSAudioQueueStateInfo *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PEGASUSSchemaPEGASUSAudioQueueStateInfo;
  v5 = -[PEGASUSSchemaPEGASUSAudioQueueStateInfo init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("audioState"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PEGASUSSchemaPEGASUSAudioQueueStateInfo setAudioState:](v5, "setAudioState:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("audioEntitySource"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PEGASUSSchemaPEGASUSAudioQueueStateInfo setAudioEntitySource:](v5, "setAudioEntitySource:", objc_msgSend(v7, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("audioNowPlayingQueueIndex"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PEGASUSSchemaPEGASUSAudioQueueStateInfo setAudioNowPlayingQueueIndex:](v5, "setAudioNowPlayingQueueIndex:", objc_msgSend(v8, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("audioNowPlayingQueueCount"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PEGASUSSchemaPEGASUSAudioQueueStateInfo setAudioNowPlayingQueueCount:](v5, "setAudioNowPlayingQueueCount:", objc_msgSend(v9, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("audioQueueStateItem"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[PEGASUSSchemaPEGASUSAudioQueueStateItem initWithDictionary:]([PEGASUSSchemaPEGASUSAudioQueueStateItem alloc], "initWithDictionary:", v10);
      -[PEGASUSSchemaPEGASUSAudioQueueStateInfo setAudioQueueStateItem:](v5, "setAudioQueueStateItem:", v11);

    }
    v12 = v5;

  }
  return v5;
}

- (int)audioState
{
  return self->_audioState;
}

- (int)audioEntitySource
{
  return self->_audioEntitySource;
}

- (int)audioNowPlayingQueueIndex
{
  return self->_audioNowPlayingQueueIndex;
}

- (int)audioNowPlayingQueueCount
{
  return self->_audioNowPlayingQueueCount;
}

- (PEGASUSSchemaPEGASUSAudioQueueStateItem)audioQueueStateItem
{
  return self->_audioQueueStateItem;
}

- (void)setAudioQueueStateItem:(id)a3
{
  objc_storeStrong((id *)&self->_audioQueueStateItem, a3);
}

- (void)setHasAudioQueueStateItem:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioQueueStateItem, 0);
}

@end
