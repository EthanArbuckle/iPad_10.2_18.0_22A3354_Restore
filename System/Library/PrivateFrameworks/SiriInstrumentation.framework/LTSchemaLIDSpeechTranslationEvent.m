@implementation LTSchemaLIDSpeechTranslationEvent

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
  int v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)LTSchemaLIDSpeechTranslationEvent;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v13, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LTSchemaLIDSpeechTranslationEvent selectedLocale](self, "selectedLocale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[LTSchemaLIDSpeechTranslationEvent deleteSelectedLocale](self, "deleteSelectedLocale");
  -[LTSchemaLIDSpeechTranslationEvent alternateLocale](self, "alternateLocale");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[LTSchemaLIDSpeechTranslationEvent deleteAlternateLocale](self, "deleteAlternateLocale");

  return v5;
}

- (BOOL)hasRequestID
{
  return self->_requestID != 0;
}

- (void)deleteRequestID
{
  -[LTSchemaLIDSpeechTranslationEvent setRequestID:](self, "setRequestID:", 0);
}

- (BOOL)hasSelectedLocale
{
  return self->_selectedLocale != 0;
}

- (void)deleteSelectedLocale
{
  -[LTSchemaLIDSpeechTranslationEvent setSelectedLocale:](self, "setSelectedLocale:", 0);
}

- (BOOL)hasAlternateLocale
{
  return self->_alternateLocale != 0;
}

- (void)deleteAlternateLocale
{
  -[LTSchemaLIDSpeechTranslationEvent setAlternateLocale:](self, "setAlternateLocale:", 0);
}

- (BOOL)hasUserSelectedLocale
{
  return self->_userSelectedLocale != 0;
}

- (void)deleteUserSelectedLocale
{
  -[LTSchemaLIDSpeechTranslationEvent setUserSelectedLocale:](self, "setUserSelectedLocale:", 0);
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
  -[LTSchemaLIDSpeechTranslationEvent setResponseTimeMs:](self, "setResponseTimeMs:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setSpeechElapsedTime:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_speechElapsedTime = a3;
}

- (BOOL)hasSpeechElapsedTime
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasSpeechElapsedTime:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteSpeechElapsedTime
{
  -[LTSchemaLIDSpeechTranslationEvent setSpeechElapsedTime:](self, "setSpeechElapsedTime:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)readFrom:(id)a3
{
  return LTSchemaLIDSpeechTranslationEventReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char has;
  void *v11;
  id v12;

  v12 = a3;
  -[LTSchemaLIDSpeechTranslationEvent requestID](self, "requestID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  -[LTSchemaLIDSpeechTranslationEvent selectedLocale](self, "selectedLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[LTSchemaLIDSpeechTranslationEvent selectedLocale](self, "selectedLocale");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[LTSchemaLIDSpeechTranslationEvent alternateLocale](self, "alternateLocale");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[LTSchemaLIDSpeechTranslationEvent alternateLocale](self, "alternateLocale");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[LTSchemaLIDSpeechTranslationEvent userSelectedLocale](self, "userSelectedLocale");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  v11 = v12;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    v11 = v12;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    v11 = v12;
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
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  BOOL v27;
  $9BA7F92579BAE5AFFC13C1948E9867C3 has;
  unsigned int v30;
  unsigned int responseTimeMs;
  int v32;
  unsigned int speechElapsedTime;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_22;
  -[LTSchemaLIDSpeechTranslationEvent requestID](self, "requestID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requestID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[LTSchemaLIDSpeechTranslationEvent requestID](self, "requestID");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[LTSchemaLIDSpeechTranslationEvent requestID](self, "requestID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "requestID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_22;
  }
  else
  {

  }
  -[LTSchemaLIDSpeechTranslationEvent selectedLocale](self, "selectedLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selectedLocale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[LTSchemaLIDSpeechTranslationEvent selectedLocale](self, "selectedLocale");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[LTSchemaLIDSpeechTranslationEvent selectedLocale](self, "selectedLocale");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "selectedLocale");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_22;
  }
  else
  {

  }
  -[LTSchemaLIDSpeechTranslationEvent alternateLocale](self, "alternateLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alternateLocale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[LTSchemaLIDSpeechTranslationEvent alternateLocale](self, "alternateLocale");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[LTSchemaLIDSpeechTranslationEvent alternateLocale](self, "alternateLocale");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "alternateLocale");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_22;
  }
  else
  {

  }
  -[LTSchemaLIDSpeechTranslationEvent userSelectedLocale](self, "userSelectedLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userSelectedLocale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_21:

    goto LABEL_22;
  }
  -[LTSchemaLIDSpeechTranslationEvent userSelectedLocale](self, "userSelectedLocale");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[LTSchemaLIDSpeechTranslationEvent userSelectedLocale](self, "userSelectedLocale");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userSelectedLocale");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_22;
  }
  else
  {

  }
  has = self->_has;
  v30 = v4[48];
  if ((*(_BYTE *)&has & 1) == (v30 & 1))
  {
    if ((*(_BYTE *)&has & 1) != 0)
    {
      responseTimeMs = self->_responseTimeMs;
      if (responseTimeMs != objc_msgSend(v4, "responseTimeMs"))
        goto LABEL_22;
      has = self->_has;
      v30 = v4[48];
    }
    v32 = (*(unsigned int *)&has >> 1) & 1;
    if (v32 == ((v30 >> 1) & 1))
    {
      if (!v32
        || (speechElapsedTime = self->_speechElapsedTime,
            speechElapsedTime == objc_msgSend(v4, "speechElapsedTime")))
      {
        v27 = 1;
        goto LABEL_23;
      }
    }
  }
LABEL_22:
  v27 = 0;
LABEL_23:

  return v27;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  unint64_t v5;
  NSUInteger v6;
  uint64_t v7;
  uint64_t v8;

  v3 = -[NSString hash](self->_requestID, "hash");
  v4 = -[LTSchemaLocaleConfidence hash](self->_selectedLocale, "hash");
  v5 = -[LTSchemaLocaleConfidence hash](self->_alternateLocale, "hash");
  v6 = -[NSString hash](self->_userSelectedLocale, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v7 = 2654435761 * self->_responseTimeMs;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v8 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
  }
  v7 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v8 = 2654435761 * self->_speechElapsedTime;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
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
  void *v13;
  void *v14;
  void *v15;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_alternateLocale)
  {
    -[LTSchemaLIDSpeechTranslationEvent alternateLocale](self, "alternateLocale");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("alternateLocale"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("alternateLocale"));

    }
  }
  if (self->_requestID)
  {
    -[LTSchemaLIDSpeechTranslationEvent requestID](self, "requestID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("requestID"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[LTSchemaLIDSpeechTranslationEvent responseTimeMs](self, "responseTimeMs"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("responseTimeMs"));

  }
  if (self->_selectedLocale)
  {
    -[LTSchemaLIDSpeechTranslationEvent selectedLocale](self, "selectedLocale");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("selectedLocale"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("selectedLocale"));

    }
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[LTSchemaLIDSpeechTranslationEvent speechElapsedTime](self, "speechElapsedTime"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("speechElapsedTime"));

  }
  if (self->_userSelectedLocale)
  {
    -[LTSchemaLIDSpeechTranslationEvent userSelectedLocale](self, "userSelectedLocale");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("userSelectedLocale"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[LTSchemaLIDSpeechTranslationEvent dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (LTSchemaLIDSpeechTranslationEvent)initWithJSON:(id)a3
{
  void *v4;
  LTSchemaLIDSpeechTranslationEvent *v5;
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
    self = -[LTSchemaLIDSpeechTranslationEvent initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (LTSchemaLIDSpeechTranslationEvent)initWithDictionary:(id)a3
{
  id v4;
  LTSchemaLIDSpeechTranslationEvent *v5;
  void *v6;
  void *v7;
  void *v8;
  LTSchemaLocaleConfidence *v9;
  void *v10;
  LTSchemaLocaleConfidence *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  LTSchemaLIDSpeechTranslationEvent *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)LTSchemaLIDSpeechTranslationEvent;
  v5 = -[LTSchemaLIDSpeechTranslationEvent init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("requestID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[LTSchemaLIDSpeechTranslationEvent setRequestID:](v5, "setRequestID:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("selectedLocale"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[LTSchemaLocaleConfidence initWithDictionary:]([LTSchemaLocaleConfidence alloc], "initWithDictionary:", v8);
      -[LTSchemaLIDSpeechTranslationEvent setSelectedLocale:](v5, "setSelectedLocale:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("alternateLocale"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[LTSchemaLocaleConfidence initWithDictionary:]([LTSchemaLocaleConfidence alloc], "initWithDictionary:", v10);
      -[LTSchemaLIDSpeechTranslationEvent setAlternateLocale:](v5, "setAlternateLocale:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("userSelectedLocale"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = (void *)objc_msgSend(v12, "copy");
      -[LTSchemaLIDSpeechTranslationEvent setUserSelectedLocale:](v5, "setUserSelectedLocale:", v13);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("responseTimeMs"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[LTSchemaLIDSpeechTranslationEvent setResponseTimeMs:](v5, "setResponseTimeMs:", objc_msgSend(v14, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("speechElapsedTime"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[LTSchemaLIDSpeechTranslationEvent setSpeechElapsedTime:](v5, "setSpeechElapsedTime:", objc_msgSend(v15, "unsignedIntValue"));
    v16 = v5;

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

- (LTSchemaLocaleConfidence)selectedLocale
{
  return self->_selectedLocale;
}

- (void)setSelectedLocale:(id)a3
{
  objc_storeStrong((id *)&self->_selectedLocale, a3);
}

- (LTSchemaLocaleConfidence)alternateLocale
{
  return self->_alternateLocale;
}

- (void)setAlternateLocale:(id)a3
{
  objc_storeStrong((id *)&self->_alternateLocale, a3);
}

- (NSString)userSelectedLocale
{
  return self->_userSelectedLocale;
}

- (void)setUserSelectedLocale:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (unsigned)responseTimeMs
{
  return self->_responseTimeMs;
}

- (unsigned)speechElapsedTime
{
  return self->_speechElapsedTime;
}

- (void)setHasRequestID:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasSelectedLocale:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void)setHasAlternateLocale:(BOOL)a3
{
  *((_BYTE *)&self->_has + 3) = a3;
}

- (void)setHasUserSelectedLocale:(BOOL)a3
{
  self->_hasRequestID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userSelectedLocale, 0);
  objc_storeStrong((id *)&self->_alternateLocale, 0);
  objc_storeStrong((id *)&self->_selectedLocale, 0);
  objc_storeStrong((id *)&self->_requestID, 0);
}

@end
