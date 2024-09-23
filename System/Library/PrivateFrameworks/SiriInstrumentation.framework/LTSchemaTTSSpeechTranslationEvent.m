@implementation LTSchemaTTSSpeechTranslationEvent

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (BOOL)hasRequestID
{
  return self->_requestID != 0;
}

- (void)deleteRequestID
{
  -[LTSchemaTTSSpeechTranslationEvent setRequestID:](self, "setRequestID:", 0);
}

- (BOOL)hasSelectedLocale
{
  return self->_selectedLocale != 0;
}

- (void)deleteSelectedLocale
{
  -[LTSchemaTTSSpeechTranslationEvent setSelectedLocale:](self, "setSelectedLocale:", 0);
}

- (void)setResponseTimeMs:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_responseTimeMs = a3;
}

- (BOOL)hasResponseTimeMs
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasResponseTimeMs:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteResponseTimeMs
{
  -[LTSchemaTTSSpeechTranslationEvent setResponseTimeMs:](self, "setResponseTimeMs:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setPlaybackBeginTimeMs:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_playbackBeginTimeMs = a3;
}

- (BOOL)hasPlaybackBeginTimeMs
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasPlaybackBeginTimeMs:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deletePlaybackBeginTimeMs
{
  -[LTSchemaTTSSpeechTranslationEvent setPlaybackBeginTimeMs:](self, "setPlaybackBeginTimeMs:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)readFrom:(id)a3
{
  return LTSchemaTTSSpeechTranslationEventReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  char has;
  void *v7;
  id v8;

  v8 = a3;
  -[LTSchemaTTSSpeechTranslationEvent requestID](self, "requestID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  -[LTSchemaTTSSpeechTranslationEvent selectedLocale](self, "selectedLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  v7 = v8;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    v7 = v8;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    v7 = v8;
  }

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
  $A7B44E420770E311DD2934706F9DCF13 has;
  unsigned int v20;
  unsigned int responseTimeMs;
  int v22;
  unsigned int playbackBeginTimeMs;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  -[LTSchemaTTSSpeechTranslationEvent requestID](self, "requestID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requestID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[LTSchemaTTSSpeechTranslationEvent requestID](self, "requestID");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[LTSchemaTTSSpeechTranslationEvent requestID](self, "requestID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "requestID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[LTSchemaTTSSpeechTranslationEvent selectedLocale](self, "selectedLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selectedLocale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_11:

    goto LABEL_12;
  }
  -[LTSchemaTTSSpeechTranslationEvent selectedLocale](self, "selectedLocale");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[LTSchemaTTSSpeechTranslationEvent selectedLocale](self, "selectedLocale");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "selectedLocale");
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
      responseTimeMs = self->_responseTimeMs;
      if (responseTimeMs != objc_msgSend(v4, "responseTimeMs"))
        goto LABEL_12;
      has = self->_has;
      v20 = v4[32];
    }
    v22 = (*(unsigned int *)&has >> 1) & 1;
    if (v22 == ((v20 >> 1) & 1))
    {
      if (!v22
        || (playbackBeginTimeMs = self->_playbackBeginTimeMs,
            playbackBeginTimeMs == objc_msgSend(v4, "playbackBeginTimeMs")))
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
  NSUInteger v3;
  NSUInteger v4;
  uint64_t v5;
  uint64_t v6;

  v3 = -[NSString hash](self->_requestID, "hash");
  v4 = -[NSString hash](self->_selectedLocale, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v5 = 2654435761 * self->_responseTimeMs;
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
  v6 = 2654435761 * self->_playbackBeginTimeMs;
  return v4 ^ v3 ^ v5 ^ v6;
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[LTSchemaTTSSpeechTranslationEvent playbackBeginTimeMs](self, "playbackBeginTimeMs"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("playbackBeginTimeMs"));

  }
  if (self->_requestID)
  {
    -[LTSchemaTTSSpeechTranslationEvent requestID](self, "requestID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("requestID"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[LTSchemaTTSSpeechTranslationEvent responseTimeMs](self, "responseTimeMs"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("responseTimeMs"));

  }
  if (self->_selectedLocale)
  {
    -[LTSchemaTTSSpeechTranslationEvent selectedLocale](self, "selectedLocale");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("selectedLocale"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[LTSchemaTTSSpeechTranslationEvent dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (LTSchemaTTSSpeechTranslationEvent)initWithJSON:(id)a3
{
  void *v4;
  LTSchemaTTSSpeechTranslationEvent *v5;
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
    self = -[LTSchemaTTSSpeechTranslationEvent initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (LTSchemaTTSSpeechTranslationEvent)initWithDictionary:(id)a3
{
  id v4;
  LTSchemaTTSSpeechTranslationEvent *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  LTSchemaTTSSpeechTranslationEvent *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)LTSchemaTTSSpeechTranslationEvent;
  v5 = -[LTSchemaTTSSpeechTranslationEvent init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("requestID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[LTSchemaTTSSpeechTranslationEvent setRequestID:](v5, "setRequestID:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("selectedLocale"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[LTSchemaTTSSpeechTranslationEvent setSelectedLocale:](v5, "setSelectedLocale:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("responseTimeMs"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[LTSchemaTTSSpeechTranslationEvent setResponseTimeMs:](v5, "setResponseTimeMs:", objc_msgSend(v10, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("playbackBeginTimeMs"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[LTSchemaTTSSpeechTranslationEvent setPlaybackBeginTimeMs:](v5, "setPlaybackBeginTimeMs:", objc_msgSend(v11, "unsignedIntValue"));
    v12 = v5;

  }
  return v5;
}

- (NSString)requestID
{
  return self->_requestID;
}

- (void)setRequestID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)selectedLocale
{
  return self->_selectedLocale;
}

- (void)setSelectedLocale:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unsigned)responseTimeMs
{
  return self->_responseTimeMs;
}

- (unsigned)playbackBeginTimeMs
{
  return self->_playbackBeginTimeMs;
}

- (void)setHasRequestID:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasSelectedLocale:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedLocale, 0);
  objc_storeStrong((id *)&self->_requestID, 0);
}

@end
