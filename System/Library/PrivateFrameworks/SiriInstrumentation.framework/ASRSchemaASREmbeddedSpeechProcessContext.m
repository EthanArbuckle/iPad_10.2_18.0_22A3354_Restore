@implementation ASRSchemaASREmbeddedSpeechProcessContext

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
  v9.super_class = (Class)ASRSchemaASREmbeddedSpeechProcessContext;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASRSchemaASREmbeddedSpeechProcessContext startedOrChanged](self, "startedOrChanged", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[ASRSchemaASREmbeddedSpeechProcessContext deleteStartedOrChanged](self, "deleteStartedOrChanged");
  return v5;
}

- (void)setStartedOrChanged:(id)a3
{
  unint64_t v3;

  v3 = 101;
  if (!a3)
    v3 = 0;
  self->_whichContextevent = v3;
  objc_storeStrong((id *)&self->_startedOrChanged, a3);
}

- (ASRSchemaASREmbeddedSpeechProcessStarted)startedOrChanged
{
  if (self->_whichContextevent == 101)
    return self->_startedOrChanged;
  else
    return (ASRSchemaASREmbeddedSpeechProcessStarted *)0;
}

- (void)deleteStartedOrChanged
{
  ASRSchemaASREmbeddedSpeechProcessStarted *startedOrChanged;

  if (self->_whichContextevent == 101)
  {
    self->_whichContextevent = 0;
    startedOrChanged = self->_startedOrChanged;
    self->_startedOrChanged = 0;

  }
}

- (BOOL)readFrom:(id)a3
{
  return ASRSchemaASREmbeddedSpeechProcessContextReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[ASRSchemaASREmbeddedSpeechProcessContext startedOrChanged](self, "startedOrChanged");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[ASRSchemaASREmbeddedSpeechProcessContext startedOrChanged](self, "startedOrChanged");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t whichContextevent;
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
    whichContextevent = self->_whichContextevent;
    if (whichContextevent == objc_msgSend(v4, "whichContextevent"))
    {
      -[ASRSchemaASREmbeddedSpeechProcessContext startedOrChanged](self, "startedOrChanged");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "startedOrChanged");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if ((v6 == 0) != (v7 != 0))
      {
        -[ASRSchemaASREmbeddedSpeechProcessContext startedOrChanged](self, "startedOrChanged");
        v9 = objc_claimAutoreleasedReturnValue();
        if (!v9)
        {

LABEL_11:
          v14 = 1;
          goto LABEL_9;
        }
        v10 = (void *)v9;
        -[ASRSchemaASREmbeddedSpeechProcessContext startedOrChanged](self, "startedOrChanged");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "startedOrChanged");
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
  return -[ASRSchemaASREmbeddedSpeechProcessStarted hash](self->_startedOrChanged, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_startedOrChanged)
  {
    -[ASRSchemaASREmbeddedSpeechProcessContext startedOrChanged](self, "startedOrChanged");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("startedOrChanged"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("startedOrChanged"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[ASRSchemaASREmbeddedSpeechProcessContext dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (ASRSchemaASREmbeddedSpeechProcessContext)initWithJSON:(id)a3
{
  void *v4;
  ASRSchemaASREmbeddedSpeechProcessContext *v5;
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
    self = -[ASRSchemaASREmbeddedSpeechProcessContext initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (ASRSchemaASREmbeddedSpeechProcessContext)initWithDictionary:(id)a3
{
  id v4;
  ASRSchemaASREmbeddedSpeechProcessContext *v5;
  void *v6;
  ASRSchemaASREmbeddedSpeechProcessStarted *v7;
  ASRSchemaASREmbeddedSpeechProcessContext *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ASRSchemaASREmbeddedSpeechProcessContext;
  v5 = -[ASRSchemaASREmbeddedSpeechProcessContext init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("startedOrChanged"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[ASRSchemaASREmbeddedSpeechProcessStarted initWithDictionary:]([ASRSchemaASREmbeddedSpeechProcessStarted alloc], "initWithDictionary:", v6);
      -[ASRSchemaASREmbeddedSpeechProcessContext setStartedOrChanged:](v5, "setStartedOrChanged:", v7);

    }
    v8 = v5;

  }
  return v5;
}

- (unint64_t)whichContextevent
{
  return self->_whichContextevent;
}

- (BOOL)hasStartedOrChanged
{
  return self->_hasStartedOrChanged;
}

- (void)setHasStartedOrChanged:(BOOL)a3
{
  self->_hasStartedOrChanged = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startedOrChanged, 0);
}

@end
