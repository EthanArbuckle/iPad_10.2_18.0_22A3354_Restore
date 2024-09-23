@implementation PGSchemaPGClientEvent

- (id)getComponentId
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;

  -[PGSchemaPGClientEvent eventMetadata](self, "eventMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ifRequestId");
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

  -[PGSchemaPGClientEvent eventMetadata](self, "eventMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ifRequestId");
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
        LODWORD(v4) = 45;
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
  v19.super_class = (Class)PGSchemaPGClientEvent;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v19, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isConditionSet:", 2))
  {
    -[PGSchemaPGClientEvent deletePgPromptTier1](self, "deletePgPromptTier1");
    -[PGSchemaPGClientEvent deletePgPromptResponseTier1](self, "deletePgPromptResponseTier1");
  }
  if (objc_msgSend(v4, "isConditionSet:", 4))
  {
    -[PGSchemaPGClientEvent deletePgPromptTier1](self, "deletePgPromptTier1");
    -[PGSchemaPGClientEvent deletePgPromptResponseTier1](self, "deletePgPromptResponseTier1");
  }
  if (objc_msgSend(v4, "isConditionSet:", 5))
  {
    -[PGSchemaPGClientEvent deletePgPromptTier1](self, "deletePgPromptTier1");
    -[PGSchemaPGClientEvent deletePgPromptResponseTier1](self, "deletePgPromptResponseTier1");
  }
  if (objc_msgSend(v4, "isConditionSet:", 6))
  {
    -[PGSchemaPGClientEvent deletePgPromptTier1](self, "deletePgPromptTier1");
    -[PGSchemaPGClientEvent deletePgPromptResponseTier1](self, "deletePgPromptResponseTier1");
  }
  if (objc_msgSend(v4, "isConditionSet:", 7))
  {
    -[PGSchemaPGClientEvent deletePgPromptTier1](self, "deletePgPromptTier1");
    -[PGSchemaPGClientEvent deletePgPromptResponseTier1](self, "deletePgPromptResponseTier1");
  }
  -[PGSchemaPGClientEvent eventMetadata](self, "eventMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[PGSchemaPGClientEvent deleteEventMetadata](self, "deleteEventMetadata");
  -[PGSchemaPGClientEvent pgRequestContext](self, "pgRequestContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[PGSchemaPGClientEvent deletePgRequestContext](self, "deletePgRequestContext");
  -[PGSchemaPGClientEvent pgPromptTier1](self, "pgPromptTier1");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[PGSchemaPGClientEvent deletePgPromptTier1](self, "deletePgPromptTier1");
  -[PGSchemaPGClientEvent pgPromptResponseTier1](self, "pgPromptResponseTier1");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applySensitiveConditionsPolicy:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "suppressMessage");

  if (v17)
    -[PGSchemaPGClientEvent deletePgPromptResponseTier1](self, "deletePgPromptResponseTier1");

  return v5;
}

- (SISchemaInstrumentationMessage)innerEvent
{
  unint64_t v3;
  id v4;

  v3 = -[PGSchemaPGClientEvent whichEvent_Type](self, "whichEvent_Type");
  if (v3 - 101 > 2)
    v4 = 0;
  else
    v4 = *(id *)((char *)&self->super.super.super.super.isa + *off_1E562A718[v3 - 101]);
  return (SISchemaInstrumentationMessage *)v4;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  if (a3 - 101 > 2)
    return 0;
  else
    return off_1E562A730[a3 - 101];
}

- (id)qualifiedMessageName
{
  unint64_t v2;

  v2 = -[PGSchemaPGClientEvent whichEvent_Type](self, "whichEvent_Type");
  if (v2 - 101 > 2)
    return CFSTR("com.apple.aiml.siri.pg.PGClientEvent");
  else
    return *(&off_1E563DC38 + v2 - 101);
}

- (BOOL)hasEventMetadata
{
  return self->_eventMetadata != 0;
}

- (void)deleteEventMetadata
{
  -[PGSchemaPGClientEvent setEventMetadata:](self, "setEventMetadata:", 0);
}

- (void)setPgRequestContext:(id)a3
{
  PGSchemaPGRequestContext *v4;
  PGSchemaPGPromptTier1 *pgPromptTier1;
  PGSchemaPGPromptResponseTier1 *pgPromptResponseTier1;
  unint64_t v7;
  PGSchemaPGRequestContext *pgRequestContext;

  v4 = (PGSchemaPGRequestContext *)a3;
  pgPromptTier1 = self->_pgPromptTier1;
  self->_pgPromptTier1 = 0;

  pgPromptResponseTier1 = self->_pgPromptResponseTier1;
  self->_pgPromptResponseTier1 = 0;

  v7 = 101;
  if (!v4)
    v7 = 0;
  self->_whichEvent_Type = v7;
  pgRequestContext = self->_pgRequestContext;
  self->_pgRequestContext = v4;

}

- (PGSchemaPGRequestContext)pgRequestContext
{
  if (self->_whichEvent_Type == 101)
    return self->_pgRequestContext;
  else
    return (PGSchemaPGRequestContext *)0;
}

- (void)deletePgRequestContext
{
  PGSchemaPGRequestContext *pgRequestContext;

  if (self->_whichEvent_Type == 101)
  {
    self->_whichEvent_Type = 0;
    pgRequestContext = self->_pgRequestContext;
    self->_pgRequestContext = 0;

  }
}

- (void)setPgPromptTier1:(id)a3
{
  PGSchemaPGPromptTier1 *v4;
  PGSchemaPGRequestContext *pgRequestContext;
  PGSchemaPGPromptResponseTier1 *pgPromptResponseTier1;
  unint64_t v7;
  PGSchemaPGPromptTier1 *pgPromptTier1;

  v4 = (PGSchemaPGPromptTier1 *)a3;
  pgRequestContext = self->_pgRequestContext;
  self->_pgRequestContext = 0;

  pgPromptResponseTier1 = self->_pgPromptResponseTier1;
  self->_pgPromptResponseTier1 = 0;

  v7 = 102;
  if (!v4)
    v7 = 0;
  self->_whichEvent_Type = v7;
  pgPromptTier1 = self->_pgPromptTier1;
  self->_pgPromptTier1 = v4;

}

- (PGSchemaPGPromptTier1)pgPromptTier1
{
  if (self->_whichEvent_Type == 102)
    return self->_pgPromptTier1;
  else
    return (PGSchemaPGPromptTier1 *)0;
}

- (void)deletePgPromptTier1
{
  PGSchemaPGPromptTier1 *pgPromptTier1;

  if (self->_whichEvent_Type == 102)
  {
    self->_whichEvent_Type = 0;
    pgPromptTier1 = self->_pgPromptTier1;
    self->_pgPromptTier1 = 0;

  }
}

- (void)setPgPromptResponseTier1:(id)a3
{
  PGSchemaPGPromptResponseTier1 *v4;
  PGSchemaPGRequestContext *pgRequestContext;
  PGSchemaPGPromptTier1 *pgPromptTier1;
  unint64_t v7;
  PGSchemaPGPromptResponseTier1 *pgPromptResponseTier1;

  v4 = (PGSchemaPGPromptResponseTier1 *)a3;
  pgRequestContext = self->_pgRequestContext;
  self->_pgRequestContext = 0;

  pgPromptTier1 = self->_pgPromptTier1;
  self->_pgPromptTier1 = 0;

  v7 = 103;
  if (!v4)
    v7 = 0;
  self->_whichEvent_Type = v7;
  pgPromptResponseTier1 = self->_pgPromptResponseTier1;
  self->_pgPromptResponseTier1 = v4;

}

- (PGSchemaPGPromptResponseTier1)pgPromptResponseTier1
{
  if (self->_whichEvent_Type == 103)
    return self->_pgPromptResponseTier1;
  else
    return (PGSchemaPGPromptResponseTier1 *)0;
}

- (void)deletePgPromptResponseTier1
{
  PGSchemaPGPromptResponseTier1 *pgPromptResponseTier1;

  if (self->_whichEvent_Type == 103)
  {
    self->_whichEvent_Type = 0;
    pgPromptResponseTier1 = self->_pgPromptResponseTier1;
    self->_pgPromptResponseTier1 = 0;

  }
}

- (BOOL)readFrom:(id)a3
{
  return PGSchemaPGClientEventReadFrom(self, (uint64_t)a3);
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
  -[PGSchemaPGClientEvent eventMetadata](self, "eventMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PGSchemaPGClientEvent eventMetadata](self, "eventMetadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PGSchemaPGClientEvent pgRequestContext](self, "pgRequestContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[PGSchemaPGClientEvent pgRequestContext](self, "pgRequestContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PGSchemaPGClientEvent pgPromptTier1](self, "pgPromptTier1");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[PGSchemaPGClientEvent pgPromptTier1](self, "pgPromptTier1");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PGSchemaPGClientEvent pgPromptResponseTier1](self, "pgPromptResponseTier1");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[PGSchemaPGClientEvent pgPromptResponseTier1](self, "pgPromptResponseTier1");
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
  -[PGSchemaPGClientEvent eventMetadata](self, "eventMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_22;
  -[PGSchemaPGClientEvent eventMetadata](self, "eventMetadata");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[PGSchemaPGClientEvent eventMetadata](self, "eventMetadata");
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
  -[PGSchemaPGClientEvent pgRequestContext](self, "pgRequestContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pgRequestContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_22;
  -[PGSchemaPGClientEvent pgRequestContext](self, "pgRequestContext");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[PGSchemaPGClientEvent pgRequestContext](self, "pgRequestContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pgRequestContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_23;
  }
  else
  {

  }
  -[PGSchemaPGClientEvent pgPromptTier1](self, "pgPromptTier1");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pgPromptTier1");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_22;
  -[PGSchemaPGClientEvent pgPromptTier1](self, "pgPromptTier1");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    -[PGSchemaPGClientEvent pgPromptTier1](self, "pgPromptTier1");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pgPromptTier1");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (!v22)
      goto LABEL_23;
  }
  else
  {

  }
  -[PGSchemaPGClientEvent pgPromptResponseTier1](self, "pgPromptResponseTier1");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pgPromptResponseTier1");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[PGSchemaPGClientEvent pgPromptResponseTier1](self, "pgPromptResponseTier1");
    v23 = objc_claimAutoreleasedReturnValue();
    if (!v23)
    {

LABEL_26:
      v28 = 1;
      goto LABEL_24;
    }
    v24 = (void *)v23;
    -[PGSchemaPGClientEvent pgPromptResponseTier1](self, "pgPromptResponseTier1");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pgPromptResponseTier1");
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

  v3 = -[PGSchemaPGClientEventMetadata hash](self->_eventMetadata, "hash");
  v4 = -[PGSchemaPGRequestContext hash](self->_pgRequestContext, "hash") ^ v3;
  v5 = -[PGSchemaPGPromptTier1 hash](self->_pgPromptTier1, "hash");
  return v4 ^ v5 ^ -[PGSchemaPGPromptResponseTier1 hash](self->_pgPromptResponseTier1, "hash");
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
    -[PGSchemaPGClientEvent eventMetadata](self, "eventMetadata");
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
  if (self->_pgPromptResponseTier1)
  {
    -[PGSchemaPGClientEvent pgPromptResponseTier1](self, "pgPromptResponseTier1");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("pgPromptResponseTier1"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("pgPromptResponseTier1"));

    }
  }
  if (self->_pgPromptTier1)
  {
    -[PGSchemaPGClientEvent pgPromptTier1](self, "pgPromptTier1");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("pgPromptTier1"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("pgPromptTier1"));

    }
  }
  if (self->_pgRequestContext)
  {
    -[PGSchemaPGClientEvent pgRequestContext](self, "pgRequestContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("pgRequestContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("pgRequestContext"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PGSchemaPGClientEvent dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (PGSchemaPGClientEvent)initWithJSON:(id)a3
{
  void *v4;
  PGSchemaPGClientEvent *v5;
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
    self = -[PGSchemaPGClientEvent initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PGSchemaPGClientEvent)initWithDictionary:(id)a3
{
  id v4;
  PGSchemaPGClientEvent *v5;
  void *v6;
  PGSchemaPGClientEventMetadata *v7;
  void *v8;
  PGSchemaPGRequestContext *v9;
  void *v10;
  PGSchemaPGPromptTier1 *v11;
  void *v12;
  PGSchemaPGPromptResponseTier1 *v13;
  PGSchemaPGClientEvent *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PGSchemaPGClientEvent;
  v5 = -[PGSchemaPGClientEvent init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("eventMetadata"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[PGSchemaPGClientEventMetadata initWithDictionary:]([PGSchemaPGClientEventMetadata alloc], "initWithDictionary:", v6);
      -[PGSchemaPGClientEvent setEventMetadata:](v5, "setEventMetadata:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pgRequestContext"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[PGSchemaPGRequestContext initWithDictionary:]([PGSchemaPGRequestContext alloc], "initWithDictionary:", v8);
      -[PGSchemaPGClientEvent setPgRequestContext:](v5, "setPgRequestContext:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pgPromptTier1"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[PGSchemaPGPromptTier1 initWithDictionary:]([PGSchemaPGPromptTier1 alloc], "initWithDictionary:", v10);
      -[PGSchemaPGClientEvent setPgPromptTier1:](v5, "setPgPromptTier1:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pgPromptResponseTier1"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[PGSchemaPGPromptResponseTier1 initWithDictionary:]([PGSchemaPGPromptResponseTier1 alloc], "initWithDictionary:", v12);
      -[PGSchemaPGClientEvent setPgPromptResponseTier1:](v5, "setPgPromptResponseTier1:", v13);

    }
    v14 = v5;

  }
  return v5;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (PGSchemaPGClientEventMetadata)eventMetadata
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

- (BOOL)hasPgRequestContext
{
  return self->_hasPgRequestContext;
}

- (void)setHasPgRequestContext:(BOOL)a3
{
  self->_hasPgRequestContext = a3;
}

- (BOOL)hasPgPromptTier1
{
  return self->_hasPgPromptTier1;
}

- (void)setHasPgPromptTier1:(BOOL)a3
{
  self->_hasPgPromptTier1 = a3;
}

- (BOOL)hasPgPromptResponseTier1
{
  return self->_hasPgPromptResponseTier1;
}

- (void)setHasPgPromptResponseTier1:(BOOL)a3
{
  self->_hasPgPromptResponseTier1 = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pgPromptResponseTier1, 0);
  objc_storeStrong((id *)&self->_pgPromptTier1, 0);
  objc_storeStrong((id *)&self->_pgRequestContext, 0);
  objc_storeStrong((id *)&self->_eventMetadata, 0);
}

- (int)getAnyEventType
{
  return 96;
}

@end
