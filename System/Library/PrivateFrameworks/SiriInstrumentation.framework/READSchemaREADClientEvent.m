@implementation READSchemaREADClientEvent

- (id)getComponentId
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;

  -[READSchemaREADClientEvent eventMetadata](self, "eventMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "readId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    goto LABEL_5;
  objc_msgSend(v3, "value");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "value");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "length");

    if (v6)
    {
      v4 = v3;
      goto LABEL_6;
    }
LABEL_5:
    v4 = 0;
  }
LABEL_6:

  return v4;
}

- (int)componentName
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  -[READSchemaREADClientEvent eventMetadata](self, "eventMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "readId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "value");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(v3, "value");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "length");

      if (v6)
        LODWORD(v4) = 40;
      else
        LODWORD(v4) = 0;
    }
  }
  else
  {
    LODWORD(v4) = 0;
  }

  return (int)v4;
}

+ (int)joinability
{
  return 2;
}

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
  v19.super_class = (Class)READSchemaREADClientEvent;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v19, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[READSchemaREADClientEvent eventMetadata](self, "eventMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[READSchemaREADClientEvent deleteEventMetadata](self, "deleteEventMetadata");
  -[READSchemaREADClientEvent readThisRequestContext](self, "readThisRequestContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[READSchemaREADClientEvent deleteReadThisRequestContext](self, "deleteReadThisRequestContext");
  -[READSchemaREADClientEvent readsThisRequestPreprocessingContext](self, "readsThisRequestPreprocessingContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[READSchemaREADClientEvent deleteReadsThisRequestPreprocessingContext](self, "deleteReadsThisRequestPreprocessingContext");
  -[READSchemaREADClientEvent playbackSessionContext](self, "playbackSessionContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applySensitiveConditionsPolicy:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "suppressMessage");

  if (v17)
    -[READSchemaREADClientEvent deletePlaybackSessionContext](self, "deletePlaybackSessionContext");

  return v5;
}

- (SISchemaInstrumentationMessage)innerEvent
{
  unint64_t v3;
  id v4;

  v3 = -[READSchemaREADClientEvent whichEvent_Type](self, "whichEvent_Type");
  if (v3 - 101 > 2)
    v4 = 0;
  else
    v4 = *(id *)((char *)&self->super.super.super.super.isa + *off_1E562AB18[v3 - 101]);
  return (SISchemaInstrumentationMessage *)v4;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  if (a3 - 101 > 2)
    return 0;
  else
    return off_1E562AB30[a3 - 101];
}

- (id)qualifiedMessageName
{
  unint64_t v2;

  v2 = -[READSchemaREADClientEvent whichEvent_Type](self, "whichEvent_Type");
  if (v2 - 101 > 2)
    return CFSTR("com.apple.aiml.siri.read.READClientEvent");
  else
    return off_1E563A740[v2 - 101];
}

- (BOOL)hasEventMetadata
{
  return self->_eventMetadata != 0;
}

- (void)deleteEventMetadata
{
  -[READSchemaREADClientEvent setEventMetadata:](self, "setEventMetadata:", 0);
}

- (void)setReadThisRequestContext:(id)a3
{
  READSchemaREADRequestContext *v4;
  READSchemaREADRequestPreprocessingContext *readsThisRequestPreprocessingContext;
  READSchemaREADPlaybackSessionContext *playbackSessionContext;
  unint64_t v7;
  READSchemaREADRequestContext *readThisRequestContext;

  v4 = (READSchemaREADRequestContext *)a3;
  readsThisRequestPreprocessingContext = self->_readsThisRequestPreprocessingContext;
  self->_readsThisRequestPreprocessingContext = 0;

  playbackSessionContext = self->_playbackSessionContext;
  self->_playbackSessionContext = 0;

  v7 = 101;
  if (!v4)
    v7 = 0;
  self->_whichEvent_Type = v7;
  readThisRequestContext = self->_readThisRequestContext;
  self->_readThisRequestContext = v4;

}

- (READSchemaREADRequestContext)readThisRequestContext
{
  if (self->_whichEvent_Type == 101)
    return self->_readThisRequestContext;
  else
    return (READSchemaREADRequestContext *)0;
}

- (void)deleteReadThisRequestContext
{
  READSchemaREADRequestContext *readThisRequestContext;

  if (self->_whichEvent_Type == 101)
  {
    self->_whichEvent_Type = 0;
    readThisRequestContext = self->_readThisRequestContext;
    self->_readThisRequestContext = 0;

  }
}

- (void)setReadsThisRequestPreprocessingContext:(id)a3
{
  READSchemaREADRequestPreprocessingContext *v4;
  READSchemaREADRequestContext *readThisRequestContext;
  READSchemaREADPlaybackSessionContext *playbackSessionContext;
  unint64_t v7;
  READSchemaREADRequestPreprocessingContext *readsThisRequestPreprocessingContext;

  v4 = (READSchemaREADRequestPreprocessingContext *)a3;
  readThisRequestContext = self->_readThisRequestContext;
  self->_readThisRequestContext = 0;

  playbackSessionContext = self->_playbackSessionContext;
  self->_playbackSessionContext = 0;

  v7 = 102;
  if (!v4)
    v7 = 0;
  self->_whichEvent_Type = v7;
  readsThisRequestPreprocessingContext = self->_readsThisRequestPreprocessingContext;
  self->_readsThisRequestPreprocessingContext = v4;

}

- (READSchemaREADRequestPreprocessingContext)readsThisRequestPreprocessingContext
{
  if (self->_whichEvent_Type == 102)
    return self->_readsThisRequestPreprocessingContext;
  else
    return (READSchemaREADRequestPreprocessingContext *)0;
}

- (void)deleteReadsThisRequestPreprocessingContext
{
  READSchemaREADRequestPreprocessingContext *readsThisRequestPreprocessingContext;

  if (self->_whichEvent_Type == 102)
  {
    self->_whichEvent_Type = 0;
    readsThisRequestPreprocessingContext = self->_readsThisRequestPreprocessingContext;
    self->_readsThisRequestPreprocessingContext = 0;

  }
}

- (void)setPlaybackSessionContext:(id)a3
{
  READSchemaREADPlaybackSessionContext *v4;
  READSchemaREADRequestContext *readThisRequestContext;
  READSchemaREADRequestPreprocessingContext *readsThisRequestPreprocessingContext;
  unint64_t v7;
  READSchemaREADPlaybackSessionContext *playbackSessionContext;

  v4 = (READSchemaREADPlaybackSessionContext *)a3;
  readThisRequestContext = self->_readThisRequestContext;
  self->_readThisRequestContext = 0;

  readsThisRequestPreprocessingContext = self->_readsThisRequestPreprocessingContext;
  self->_readsThisRequestPreprocessingContext = 0;

  v7 = 103;
  if (!v4)
    v7 = 0;
  self->_whichEvent_Type = v7;
  playbackSessionContext = self->_playbackSessionContext;
  self->_playbackSessionContext = v4;

}

- (READSchemaREADPlaybackSessionContext)playbackSessionContext
{
  if (self->_whichEvent_Type == 103)
    return self->_playbackSessionContext;
  else
    return (READSchemaREADPlaybackSessionContext *)0;
}

- (void)deletePlaybackSessionContext
{
  READSchemaREADPlaybackSessionContext *playbackSessionContext;

  if (self->_whichEvent_Type == 103)
  {
    self->_whichEvent_Type = 0;
    playbackSessionContext = self->_playbackSessionContext;
    self->_playbackSessionContext = 0;

  }
}

- (BOOL)readFrom:(id)a3
{
  return READSchemaREADClientEventReadFrom(self, (uint64_t)a3);
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
  -[READSchemaREADClientEvent eventMetadata](self, "eventMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[READSchemaREADClientEvent eventMetadata](self, "eventMetadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[READSchemaREADClientEvent readThisRequestContext](self, "readThisRequestContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[READSchemaREADClientEvent readThisRequestContext](self, "readThisRequestContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[READSchemaREADClientEvent readsThisRequestPreprocessingContext](self, "readsThisRequestPreprocessingContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[READSchemaREADClientEvent readsThisRequestPreprocessingContext](self, "readsThisRequestPreprocessingContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[READSchemaREADClientEvent playbackSessionContext](self, "playbackSessionContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[READSchemaREADClientEvent playbackSessionContext](self, "playbackSessionContext");
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
  -[READSchemaREADClientEvent eventMetadata](self, "eventMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_22;
  -[READSchemaREADClientEvent eventMetadata](self, "eventMetadata");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[READSchemaREADClientEvent eventMetadata](self, "eventMetadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "eventMetadata");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_23;
  }
  else
  {

  }
  -[READSchemaREADClientEvent readThisRequestContext](self, "readThisRequestContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "readThisRequestContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_22;
  -[READSchemaREADClientEvent readThisRequestContext](self, "readThisRequestContext");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[READSchemaREADClientEvent readThisRequestContext](self, "readThisRequestContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "readThisRequestContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_23;
  }
  else
  {

  }
  -[READSchemaREADClientEvent readsThisRequestPreprocessingContext](self, "readsThisRequestPreprocessingContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "readsThisRequestPreprocessingContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_22;
  -[READSchemaREADClientEvent readsThisRequestPreprocessingContext](self, "readsThisRequestPreprocessingContext");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    -[READSchemaREADClientEvent readsThisRequestPreprocessingContext](self, "readsThisRequestPreprocessingContext");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "readsThisRequestPreprocessingContext");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (!v22)
      goto LABEL_23;
  }
  else
  {

  }
  -[READSchemaREADClientEvent playbackSessionContext](self, "playbackSessionContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "playbackSessionContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[READSchemaREADClientEvent playbackSessionContext](self, "playbackSessionContext");
    v23 = objc_claimAutoreleasedReturnValue();
    if (!v23)
    {

LABEL_26:
      v28 = 1;
      goto LABEL_24;
    }
    v24 = (void *)v23;
    -[READSchemaREADClientEvent playbackSessionContext](self, "playbackSessionContext");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "playbackSessionContext");
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

  v3 = -[READSchemaREADClientEventMetadata hash](self->_eventMetadata, "hash");
  v4 = -[READSchemaREADRequestContext hash](self->_readThisRequestContext, "hash") ^ v3;
  v5 = -[READSchemaREADRequestPreprocessingContext hash](self->_readsThisRequestPreprocessingContext, "hash");
  return v4 ^ v5 ^ -[READSchemaREADPlaybackSessionContext hash](self->_playbackSessionContext, "hash");
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
  if (self->_eventMetadata)
  {
    -[READSchemaREADClientEvent eventMetadata](self, "eventMetadata");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("eventMetadata"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("eventMetadata"));

    }
  }
  if (self->_playbackSessionContext)
  {
    -[READSchemaREADClientEvent playbackSessionContext](self, "playbackSessionContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("playbackSessionContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("playbackSessionContext"));

    }
  }
  if (self->_readThisRequestContext)
  {
    -[READSchemaREADClientEvent readThisRequestContext](self, "readThisRequestContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("readThisRequestContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("readThisRequestContext"));

    }
  }
  if (self->_readsThisRequestPreprocessingContext)
  {
    -[READSchemaREADClientEvent readsThisRequestPreprocessingContext](self, "readsThisRequestPreprocessingContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("readsThisRequestPreprocessingContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("readsThisRequestPreprocessingContext"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[READSchemaREADClientEvent dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (READSchemaREADClientEvent)initWithJSON:(id)a3
{
  void *v4;
  READSchemaREADClientEvent *v5;
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
    self = -[READSchemaREADClientEvent initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (READSchemaREADClientEvent)initWithDictionary:(id)a3
{
  id v4;
  READSchemaREADClientEvent *v5;
  void *v6;
  READSchemaREADClientEventMetadata *v7;
  void *v8;
  READSchemaREADRequestContext *v9;
  void *v10;
  READSchemaREADRequestPreprocessingContext *v11;
  void *v12;
  READSchemaREADPlaybackSessionContext *v13;
  READSchemaREADClientEvent *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)READSchemaREADClientEvent;
  v5 = -[READSchemaREADClientEvent init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("eventMetadata"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[READSchemaREADClientEventMetadata initWithDictionary:]([READSchemaREADClientEventMetadata alloc], "initWithDictionary:", v6);
      -[READSchemaREADClientEvent setEventMetadata:](v5, "setEventMetadata:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("readThisRequestContext"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[READSchemaREADRequestContext initWithDictionary:]([READSchemaREADRequestContext alloc], "initWithDictionary:", v8);
      -[READSchemaREADClientEvent setReadThisRequestContext:](v5, "setReadThisRequestContext:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("readsThisRequestPreprocessingContext"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[READSchemaREADRequestPreprocessingContext initWithDictionary:]([READSchemaREADRequestPreprocessingContext alloc], "initWithDictionary:", v10);
      -[READSchemaREADClientEvent setReadsThisRequestPreprocessingContext:](v5, "setReadsThisRequestPreprocessingContext:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("playbackSessionContext"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[READSchemaREADPlaybackSessionContext initWithDictionary:]([READSchemaREADPlaybackSessionContext alloc], "initWithDictionary:", v12);
      -[READSchemaREADClientEvent setPlaybackSessionContext:](v5, "setPlaybackSessionContext:", v13);

    }
    v14 = v5;

  }
  return v5;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (READSchemaREADClientEventMetadata)eventMetadata
{
  return self->_eventMetadata;
}

- (void)setEventMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_eventMetadata, a3);
}

- (void)setHasEventMetadata:(BOOL)a3
{
  self->_hasEventMetadata = a3;
}

- (BOOL)hasReadThisRequestContext
{
  return self->_hasReadThisRequestContext;
}

- (void)setHasReadThisRequestContext:(BOOL)a3
{
  self->_hasReadThisRequestContext = a3;
}

- (BOOL)hasReadsThisRequestPreprocessingContext
{
  return self->_hasReadsThisRequestPreprocessingContext;
}

- (void)setHasReadsThisRequestPreprocessingContext:(BOOL)a3
{
  self->_hasReadsThisRequestPreprocessingContext = a3;
}

- (BOOL)hasPlaybackSessionContext
{
  return self->_hasPlaybackSessionContext;
}

- (void)setHasPlaybackSessionContext:(BOOL)a3
{
  self->_hasPlaybackSessionContext = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playbackSessionContext, 0);
  objc_storeStrong((id *)&self->_readsThisRequestPreprocessingContext, 0);
  objc_storeStrong((id *)&self->_readThisRequestContext, 0);
  objc_storeStrong((id *)&self->_eventMetadata, 0);
}

- (int)getAnyEventType
{
  return 75;
}

@end
