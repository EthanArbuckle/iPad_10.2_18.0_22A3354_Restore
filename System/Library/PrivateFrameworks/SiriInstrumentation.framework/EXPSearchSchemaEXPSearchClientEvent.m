@implementation EXPSearchSchemaEXPSearchClientEvent

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
  v9.super_class = (Class)EXPSearchSchemaEXPSearchClientEvent;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EXPSearchSchemaEXPSearchClientEvent sessionExperiments](self, "sessionExperiments", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[EXPSearchSchemaEXPSearchClientEvent deleteSessionExperiments](self, "deleteSessionExperiments");
  return v5;
}

- (SISchemaInstrumentationMessage)innerEvent
{
  EXPSearchSchemaEXPSearchSessionExperiments *v3;

  if (-[EXPSearchSchemaEXPSearchClientEvent whichEvent_Type](self, "whichEvent_Type") == 101)
    v3 = self->_sessionExperiments;
  else
    v3 = 0;
  return (SISchemaInstrumentationMessage *)v3;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  if (a3 == 101)
    return CFSTR("sessionExperiments");
  else
    return 0;
}

- (id)qualifiedMessageName
{
  if (-[EXPSearchSchemaEXPSearchClientEvent whichEvent_Type](self, "whichEvent_Type") == 101)
    return CFSTR("com.apple.aiml.exp.search.EXPSearchClientEvent.EXPSearchSessionExperiments");
  else
    return CFSTR("com.apple.aiml.exp.search.EXPSearchClientEvent");
}

- (void)setSessionExperiments:(id)a3
{
  unint64_t v3;

  v3 = 101;
  if (!a3)
    v3 = 0;
  self->_whichEvent_Type = v3;
  objc_storeStrong((id *)&self->_sessionExperiments, a3);
}

- (EXPSearchSchemaEXPSearchSessionExperiments)sessionExperiments
{
  if (self->_whichEvent_Type == 101)
    return self->_sessionExperiments;
  else
    return (EXPSearchSchemaEXPSearchSessionExperiments *)0;
}

- (void)deleteSessionExperiments
{
  EXPSearchSchemaEXPSearchSessionExperiments *sessionExperiments;

  if (self->_whichEvent_Type == 101)
  {
    self->_whichEvent_Type = 0;
    sessionExperiments = self->_sessionExperiments;
    self->_sessionExperiments = 0;

  }
}

- (BOOL)readFrom:(id)a3
{
  return EXPSearchSchemaEXPSearchClientEventReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[EXPSearchSchemaEXPSearchClientEvent sessionExperiments](self, "sessionExperiments");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[EXPSearchSchemaEXPSearchClientEvent sessionExperiments](self, "sessionExperiments");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t whichEvent_Type;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  BOOL v14;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    whichEvent_Type = self->_whichEvent_Type;
    if (whichEvent_Type == objc_msgSend(v4, "whichEvent_Type"))
    {
      -[EXPSearchSchemaEXPSearchClientEvent sessionExperiments](self, "sessionExperiments");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "sessionExperiments");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if ((v6 == 0) != (v7 != 0))
      {
        -[EXPSearchSchemaEXPSearchClientEvent sessionExperiments](self, "sessionExperiments");
        v9 = objc_claimAutoreleasedReturnValue();
        if (!v9)
        {

LABEL_11:
          v14 = 1;
          goto LABEL_9;
        }
        v10 = (void *)v9;
        -[EXPSearchSchemaEXPSearchClientEvent sessionExperiments](self, "sessionExperiments");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "sessionExperiments");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "isEqual:", v12);

        if ((v13 & 1) != 0)
          goto LABEL_11;
      }
      else
      {

      }
    }
  }
  v14 = 0;
LABEL_9:

  return v14;
}

- (unint64_t)hash
{
  return -[EXPSearchSchemaEXPSearchSessionExperiments hash](self->_sessionExperiments, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_sessionExperiments)
  {
    -[EXPSearchSchemaEXPSearchClientEvent sessionExperiments](self, "sessionExperiments");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("sessionExperiments"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("sessionExperiments"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[EXPSearchSchemaEXPSearchClientEvent dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (EXPSearchSchemaEXPSearchClientEvent)initWithJSON:(id)a3
{
  void *v4;
  EXPSearchSchemaEXPSearchClientEvent *v5;
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
    self = -[EXPSearchSchemaEXPSearchClientEvent initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (EXPSearchSchemaEXPSearchClientEvent)initWithDictionary:(id)a3
{
  id v4;
  EXPSearchSchemaEXPSearchClientEvent *v5;
  void *v6;
  EXPSearchSchemaEXPSearchSessionExperiments *v7;
  EXPSearchSchemaEXPSearchClientEvent *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)EXPSearchSchemaEXPSearchClientEvent;
  v5 = -[EXPSearchSchemaEXPSearchClientEvent init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sessionExperiments"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[EXPSearchSchemaEXPSearchSessionExperiments initWithDictionary:]([EXPSearchSchemaEXPSearchSessionExperiments alloc], "initWithDictionary:", v6);
      -[EXPSearchSchemaEXPSearchClientEvent setSessionExperiments:](v5, "setSessionExperiments:", v7);

    }
    v8 = v5;

  }
  return v5;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (BOOL)hasSessionExperiments
{
  return self->_hasSessionExperiments;
}

- (void)setHasSessionExperiments:(BOOL)a3
{
  self->_hasSessionExperiments = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionExperiments, 0);
}

- (int)getAnyEventType
{
  return 39;
}

@end
