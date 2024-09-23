@implementation LRSchemaLRClientEvent

+ (int)joinability
{
  return 4;
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
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)LRSchemaLRClientEvent;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LRSchemaLRClientEvent redactionSummaryReported](self, "redactionSummaryReported", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[LRSchemaLRClientEvent deleteRedactionSummaryReported](self, "deleteRedactionSummaryReported");
  return v5;
}

- (SISchemaInstrumentationMessage)innerEvent
{
  LRSchemaLRRedactionSummaryReported *v3;

  if (-[LRSchemaLRClientEvent whichEvent_Type](self, "whichEvent_Type") == 101)
    v3 = self->_redactionSummaryReported;
  else
    v3 = 0;
  return (SISchemaInstrumentationMessage *)v3;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  if (a3 == 101)
    return CFSTR("redactionSummaryReported");
  else
    return 0;
}

- (id)qualifiedMessageName
{
  if (-[LRSchemaLRClientEvent whichEvent_Type](self, "whichEvent_Type") == 101)
    return CFSTR("com.apple.aiml.redaction.LRClientEvent.LRRedactionSummaryReported");
  else
    return CFSTR("com.apple.aiml.redaction.LRClientEvent");
}

- (void)setRedactionSummaryReported:(id)a3
{
  unint64_t v3;

  v3 = 101;
  if (!a3)
    v3 = 0;
  self->_whichEvent_Type = v3;
  objc_storeStrong((id *)&self->_redactionSummaryReported, a3);
}

- (LRSchemaLRRedactionSummaryReported)redactionSummaryReported
{
  if (self->_whichEvent_Type == 101)
    return self->_redactionSummaryReported;
  else
    return (LRSchemaLRRedactionSummaryReported *)0;
}

- (void)deleteRedactionSummaryReported
{
  LRSchemaLRRedactionSummaryReported *redactionSummaryReported;

  if (self->_whichEvent_Type == 101)
  {
    self->_whichEvent_Type = 0;
    redactionSummaryReported = self->_redactionSummaryReported;
    self->_redactionSummaryReported = 0;

  }
}

- (BOOL)readFrom:(id)a3
{
  return LRSchemaLRClientEventReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[LRSchemaLRClientEvent redactionSummaryReported](self, "redactionSummaryReported");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[LRSchemaLRClientEvent redactionSummaryReported](self, "redactionSummaryReported");
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
      -[LRSchemaLRClientEvent redactionSummaryReported](self, "redactionSummaryReported");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "redactionSummaryReported");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if ((v6 == 0) != (v7 != 0))
      {
        -[LRSchemaLRClientEvent redactionSummaryReported](self, "redactionSummaryReported");
        v9 = objc_claimAutoreleasedReturnValue();
        if (!v9)
        {

LABEL_11:
          v14 = 1;
          goto LABEL_9;
        }
        v10 = (void *)v9;
        -[LRSchemaLRClientEvent redactionSummaryReported](self, "redactionSummaryReported");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "redactionSummaryReported");
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
  return -[LRSchemaLRRedactionSummaryReported hash](self->_redactionSummaryReported, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_redactionSummaryReported)
  {
    -[LRSchemaLRClientEvent redactionSummaryReported](self, "redactionSummaryReported");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("redactionSummaryReported"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("redactionSummaryReported"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[LRSchemaLRClientEvent dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (LRSchemaLRClientEvent)initWithJSON:(id)a3
{
  void *v4;
  LRSchemaLRClientEvent *v5;
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
    self = -[LRSchemaLRClientEvent initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (LRSchemaLRClientEvent)initWithDictionary:(id)a3
{
  id v4;
  LRSchemaLRClientEvent *v5;
  void *v6;
  LRSchemaLRRedactionSummaryReported *v7;
  LRSchemaLRClientEvent *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)LRSchemaLRClientEvent;
  v5 = -[LRSchemaLRClientEvent init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("redactionSummaryReported"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[LRSchemaLRRedactionSummaryReported initWithDictionary:]([LRSchemaLRRedactionSummaryReported alloc], "initWithDictionary:", v6);
      -[LRSchemaLRClientEvent setRedactionSummaryReported:](v5, "setRedactionSummaryReported:", v7);

    }
    v8 = v5;

  }
  return v5;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (BOOL)hasRedactionSummaryReported
{
  return self->_hasRedactionSummaryReported;
}

- (void)setHasRedactionSummaryReported:(BOOL)a3
{
  self->_hasRedactionSummaryReported = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_redactionSummaryReported, 0);
}

- (int)getAnyEventType
{
  return 64;
}

@end
