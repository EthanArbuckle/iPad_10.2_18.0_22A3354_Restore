@implementation DUSchemaDUEvent

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
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)DUSchemaDUEvent;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v19, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isConditionSet:", 2))
    -[DUSchemaDUEvent deleteContent](self, "deleteContent");
  if (objc_msgSend(v4, "isConditionSet:", 4))
    -[DUSchemaDUEvent deleteContent](self, "deleteContent");
  if (objc_msgSend(v4, "isConditionSet:", 5))
    -[DUSchemaDUEvent deleteContent](self, "deleteContent");
  if (objc_msgSend(v4, "isConditionSet:", 6))
    -[DUSchemaDUEvent deleteContent](self, "deleteContent");
  if (objc_msgSend(v4, "isConditionSet:", 7))
    -[DUSchemaDUEvent deleteContent](self, "deleteContent");
  -[DUSchemaDUEvent metadata](self, "metadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[DUSchemaDUEvent deleteMetadata](self, "deleteMetadata");
  -[DUSchemaDUEvent content](self, "content");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[DUSchemaDUEvent deleteContent](self, "deleteContent");
  -[DUSchemaDUEvent speechAudioRecord](self, "speechAudioRecord");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[DUSchemaDUEvent deleteSpeechAudioRecord](self, "deleteSpeechAudioRecord");
  -[DUSchemaDUEvent searchSessionRecord](self, "searchSessionRecord");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applySensitiveConditionsPolicy:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "suppressMessage");

  if (v17)
    -[DUSchemaDUEvent deleteSearchSessionRecord](self, "deleteSearchSessionRecord");

  return v5;
}

- (SISchemaInstrumentationMessage)innerEvent
{
  unint64_t v3;
  int *v4;
  id v5;

  v3 = -[DUSchemaDUEvent whichEvent_Type](self, "whichEvent_Type");
  if (v3 == 101)
  {
    v4 = &OBJC_IVAR___DUSchemaDUEvent__speechAudioRecord;
  }
  else
  {
    if (v3 != 102)
    {
      v5 = 0;
      return (SISchemaInstrumentationMessage *)v5;
    }
    v4 = &OBJC_IVAR___DUSchemaDUEvent__searchSessionRecord;
  }
  v5 = *(id *)((char *)&self->super.super.super.super.isa + *v4);
  return (SISchemaInstrumentationMessage *)v5;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("searchSessionRecord");
  if (a3 != 102)
    v3 = 0;
  if (a3 == 101)
    return CFSTR("speechAudioRecord");
  else
    return (id)v3;
}

- (id)qualifiedMessageName
{
  unint64_t v2;
  const __CFString *v3;

  v2 = -[DUSchemaDUEvent whichEvent_Type](self, "whichEvent_Type");
  v3 = CFSTR("com.apple.aiml.dataupload.DUEvent");
  if (v2 == 102)
    v3 = CFSTR("com.apple.aiml.dataupload.DUEvent.DUSearchSessionRecord");
  if (v2 == 101)
    return CFSTR("com.apple.aiml.dataupload.DUEvent.DUSpeechAudioRecord");
  else
    return (id)v3;
}

- (BOOL)hasMetadata
{
  return self->_metadata != 0;
}

- (void)deleteMetadata
{
  -[DUSchemaDUEvent setMetadata:](self, "setMetadata:", 0);
}

- (BOOL)hasContent
{
  return self->_content != 0;
}

- (void)deleteContent
{
  -[DUSchemaDUEvent setContent:](self, "setContent:", 0);
}

- (void)setSpeechAudioRecord:(id)a3
{
  DUSchemaDUSpeechAudioRecord *v4;
  DUSchemaDUSearchSessionRecord *searchSessionRecord;
  unint64_t v6;
  DUSchemaDUSpeechAudioRecord *speechAudioRecord;

  v4 = (DUSchemaDUSpeechAudioRecord *)a3;
  searchSessionRecord = self->_searchSessionRecord;
  self->_searchSessionRecord = 0;

  v6 = 101;
  if (!v4)
    v6 = 0;
  self->_whichEvent_Type = v6;
  speechAudioRecord = self->_speechAudioRecord;
  self->_speechAudioRecord = v4;

}

- (DUSchemaDUSpeechAudioRecord)speechAudioRecord
{
  if (self->_whichEvent_Type == 101)
    return self->_speechAudioRecord;
  else
    return (DUSchemaDUSpeechAudioRecord *)0;
}

- (void)deleteSpeechAudioRecord
{
  DUSchemaDUSpeechAudioRecord *speechAudioRecord;

  if (self->_whichEvent_Type == 101)
  {
    self->_whichEvent_Type = 0;
    speechAudioRecord = self->_speechAudioRecord;
    self->_speechAudioRecord = 0;

  }
}

- (void)setSearchSessionRecord:(id)a3
{
  DUSchemaDUSearchSessionRecord *v4;
  DUSchemaDUSpeechAudioRecord *speechAudioRecord;
  unint64_t v6;
  DUSchemaDUSearchSessionRecord *searchSessionRecord;

  v4 = (DUSchemaDUSearchSessionRecord *)a3;
  speechAudioRecord = self->_speechAudioRecord;
  self->_speechAudioRecord = 0;

  v6 = 102;
  if (!v4)
    v6 = 0;
  self->_whichEvent_Type = v6;
  searchSessionRecord = self->_searchSessionRecord;
  self->_searchSessionRecord = v4;

}

- (DUSchemaDUSearchSessionRecord)searchSessionRecord
{
  if (self->_whichEvent_Type == 102)
    return self->_searchSessionRecord;
  else
    return (DUSchemaDUSearchSessionRecord *)0;
}

- (void)deleteSearchSessionRecord
{
  DUSchemaDUSearchSessionRecord *searchSessionRecord;

  if (self->_whichEvent_Type == 102)
  {
    self->_whichEvent_Type = 0;
    searchSessionRecord = self->_searchSessionRecord;
    self->_searchSessionRecord = 0;

  }
}

- (BOOL)readFrom:(id)a3
{
  return DUSchemaDUEventReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  -[DUSchemaDUEvent metadata](self, "metadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[DUSchemaDUEvent metadata](self, "metadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[DUSchemaDUEvent content](self, "content");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[DUSchemaDUEvent content](self, "content");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[DUSchemaDUEvent speechAudioRecord](self, "speechAudioRecord");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[DUSchemaDUEvent speechAudioRecord](self, "speechAudioRecord");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[DUSchemaDUEvent searchSessionRecord](self, "searchSessionRecord");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[DUSchemaDUEvent searchSessionRecord](self, "searchSessionRecord");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t whichEvent_Type;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
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
    goto LABEL_23;
  whichEvent_Type = self->_whichEvent_Type;
  if (whichEvent_Type != objc_msgSend(v4, "whichEvent_Type"))
    goto LABEL_23;
  -[DUSchemaDUEvent metadata](self, "metadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "metadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_22;
  -[DUSchemaDUEvent metadata](self, "metadata");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[DUSchemaDUEvent metadata](self, "metadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "metadata");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_23;
  }
  else
  {

  }
  -[DUSchemaDUEvent content](self, "content");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "content");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_22;
  -[DUSchemaDUEvent content](self, "content");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[DUSchemaDUEvent content](self, "content");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "content");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_23;
  }
  else
  {

  }
  -[DUSchemaDUEvent speechAudioRecord](self, "speechAudioRecord");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "speechAudioRecord");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_22;
  -[DUSchemaDUEvent speechAudioRecord](self, "speechAudioRecord");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    -[DUSchemaDUEvent speechAudioRecord](self, "speechAudioRecord");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "speechAudioRecord");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (!v22)
      goto LABEL_23;
  }
  else
  {

  }
  -[DUSchemaDUEvent searchSessionRecord](self, "searchSessionRecord");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "searchSessionRecord");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[DUSchemaDUEvent searchSessionRecord](self, "searchSessionRecord");
    v23 = objc_claimAutoreleasedReturnValue();
    if (!v23)
    {

LABEL_26:
      v28 = 1;
      goto LABEL_24;
    }
    v24 = (void *)v23;
    -[DUSchemaDUEvent searchSessionRecord](self, "searchSessionRecord");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "searchSessionRecord");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "isEqual:", v26);

    if ((v27 & 1) != 0)
      goto LABEL_26;
  }
  else
  {
LABEL_22:

  }
LABEL_23:
  v28 = 0;
LABEL_24:

  return v28;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;

  v3 = -[DUSchemaDUEventMetadata hash](self->_metadata, "hash");
  v4 = -[DUSchemaDUContent hash](self->_content, "hash") ^ v3;
  v5 = -[DUSchemaDUSpeechAudioRecord hash](self->_speechAudioRecord, "hash");
  return v4 ^ v5 ^ -[DUSchemaDUSearchSessionRecord hash](self->_searchSessionRecord, "hash");
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
  if (self->_content)
  {
    -[DUSchemaDUEvent content](self, "content");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("content"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("content"));

    }
  }
  if (self->_metadata)
  {
    -[DUSchemaDUEvent metadata](self, "metadata");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("metadata"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("metadata"));

    }
  }
  if (self->_searchSessionRecord)
  {
    -[DUSchemaDUEvent searchSessionRecord](self, "searchSessionRecord");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("searchSessionRecord"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("searchSessionRecord"));

    }
  }
  if (self->_speechAudioRecord)
  {
    -[DUSchemaDUEvent speechAudioRecord](self, "speechAudioRecord");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("speechAudioRecord"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("speechAudioRecord"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[DUSchemaDUEvent dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (DUSchemaDUEvent)initWithJSON:(id)a3
{
  void *v4;
  DUSchemaDUEvent *v5;
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
    self = -[DUSchemaDUEvent initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (DUSchemaDUEvent)initWithDictionary:(id)a3
{
  id v4;
  DUSchemaDUEvent *v5;
  void *v6;
  DUSchemaDUEventMetadata *v7;
  void *v8;
  DUSchemaDUContent *v9;
  void *v10;
  DUSchemaDUSpeechAudioRecord *v11;
  void *v12;
  DUSchemaDUSearchSessionRecord *v13;
  DUSchemaDUEvent *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)DUSchemaDUEvent;
  v5 = -[DUSchemaDUEvent init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("metadata"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[DUSchemaDUEventMetadata initWithDictionary:]([DUSchemaDUEventMetadata alloc], "initWithDictionary:", v6);
      -[DUSchemaDUEvent setMetadata:](v5, "setMetadata:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("content"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[DUSchemaDUContent initWithDictionary:]([DUSchemaDUContent alloc], "initWithDictionary:", v8);
      -[DUSchemaDUEvent setContent:](v5, "setContent:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("speechAudioRecord"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[DUSchemaDUSpeechAudioRecord initWithDictionary:]([DUSchemaDUSpeechAudioRecord alloc], "initWithDictionary:", v10);
      -[DUSchemaDUEvent setSpeechAudioRecord:](v5, "setSpeechAudioRecord:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("searchSessionRecord"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[DUSchemaDUSearchSessionRecord initWithDictionary:]([DUSchemaDUSearchSessionRecord alloc], "initWithDictionary:", v12);
      -[DUSchemaDUEvent setSearchSessionRecord:](v5, "setSearchSessionRecord:", v13);

    }
    v14 = v5;

  }
  return v5;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (DUSchemaDUEventMetadata)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (DUSchemaDUContent)content
{
  return self->_content;
}

- (void)setContent:(id)a3
{
  objc_storeStrong((id *)&self->_content, a3);
}

- (void)setHasMetadata:(BOOL)a3
{
  self->_hasMetadata = a3;
}

- (void)setHasContent:(BOOL)a3
{
  self->_hasContent = a3;
}

- (BOOL)hasSpeechAudioRecord
{
  return self->_hasSpeechAudioRecord;
}

- (void)setHasSpeechAudioRecord:(BOOL)a3
{
  self->_hasSpeechAudioRecord = a3;
}

- (BOOL)hasSearchSessionRecord
{
  return self->_hasSearchSessionRecord;
}

- (void)setHasSearchSessionRecord:(BOOL)a3
{
  self->_hasSearchSessionRecord = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchSessionRecord, 0);
  objc_storeStrong((id *)&self->_speechAudioRecord, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
}

- (int)getAnyEventType
{
  return 21;
}

@end
