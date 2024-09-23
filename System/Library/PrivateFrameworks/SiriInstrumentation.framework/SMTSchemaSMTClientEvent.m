@implementation SMTSchemaSMTClientEvent

- (id)getComponentId
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;

  -[SMTSchemaSMTClientEvent eventMetadata](self, "eventMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "smtId");
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

+ (int)joinability
{
  return 1;
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
  v19.super_class = (Class)SMTSchemaSMTClientEvent;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v19, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMTSchemaSMTClientEvent eventMetadata](self, "eventMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[SMTSchemaSMTClientEvent deleteEventMetadata](self, "deleteEventMetadata");
  -[SMTSchemaSMTClientEvent appLanguageModelAssetCopyContext](self, "appLanguageModelAssetCopyContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[SMTSchemaSMTClientEvent deleteAppLanguageModelAssetCopyContext](self, "deleteAppLanguageModelAssetCopyContext");
  -[SMTSchemaSMTClientEvent appLanguageModelBuildContext](self, "appLanguageModelBuildContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[SMTSchemaSMTClientEvent deleteAppLanguageModelBuildContext](self, "deleteAppLanguageModelBuildContext");
  -[SMTSchemaSMTClientEvent appLanguageModelProfileRebuildContext](self, "appLanguageModelProfileRebuildContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applySensitiveConditionsPolicy:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "suppressMessage");

  if (v17)
    -[SMTSchemaSMTClientEvent deleteAppLanguageModelProfileRebuildContext](self, "deleteAppLanguageModelProfileRebuildContext");

  return v5;
}

- (SISchemaInstrumentationMessage)innerEvent
{
  unint64_t v3;
  id v4;

  v3 = -[SMTSchemaSMTClientEvent whichEvent_Type](self, "whichEvent_Type");
  if (v3 - 101 > 2)
    v4 = 0;
  else
    v4 = *(id *)((char *)&self->super.super.super.super.isa + *off_1E562ADF8[v3 - 101]);
  return (SISchemaInstrumentationMessage *)v4;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  if (a3 - 101 > 2)
    return 0;
  else
    return off_1E562AE10[a3 - 101];
}

- (int)clockIsolationLevel
{
  if (-[SMTSchemaSMTClientEvent whichEvent_Type](self, "whichEvent_Type") - 101 >= 3)
    return 1;
  else
    return 2;
}

- (id)qualifiedMessageName
{
  unint64_t v2;

  v2 = -[SMTSchemaSMTClientEvent whichEvent_Type](self, "whichEvent_Type");
  if (v2 - 101 > 2)
    return CFSTR("com.apple.aiml.siri.smt.SMTClientEvent");
  else
    return off_1E5638030[v2 - 101];
}

- (BOOL)hasEventMetadata
{
  return self->_eventMetadata != 0;
}

- (void)deleteEventMetadata
{
  -[SMTSchemaSMTClientEvent setEventMetadata:](self, "setEventMetadata:", 0);
}

- (void)setAppLanguageModelAssetCopyContext:(id)a3
{
  SMTSchemaSMTAppLanguageModelAssetCopyContext *v4;
  SMTSchemaSMTAppLanguageModelBuildContext *appLanguageModelBuildContext;
  SMTSchemaSMTAppLanguageModelProfileRebuildContext *appLanguageModelProfileRebuildContext;
  unint64_t v7;
  SMTSchemaSMTAppLanguageModelAssetCopyContext *appLanguageModelAssetCopyContext;

  v4 = (SMTSchemaSMTAppLanguageModelAssetCopyContext *)a3;
  appLanguageModelBuildContext = self->_appLanguageModelBuildContext;
  self->_appLanguageModelBuildContext = 0;

  appLanguageModelProfileRebuildContext = self->_appLanguageModelProfileRebuildContext;
  self->_appLanguageModelProfileRebuildContext = 0;

  v7 = 101;
  if (!v4)
    v7 = 0;
  self->_whichEvent_Type = v7;
  appLanguageModelAssetCopyContext = self->_appLanguageModelAssetCopyContext;
  self->_appLanguageModelAssetCopyContext = v4;

}

- (SMTSchemaSMTAppLanguageModelAssetCopyContext)appLanguageModelAssetCopyContext
{
  if (self->_whichEvent_Type == 101)
    return self->_appLanguageModelAssetCopyContext;
  else
    return (SMTSchemaSMTAppLanguageModelAssetCopyContext *)0;
}

- (void)deleteAppLanguageModelAssetCopyContext
{
  SMTSchemaSMTAppLanguageModelAssetCopyContext *appLanguageModelAssetCopyContext;

  if (self->_whichEvent_Type == 101)
  {
    self->_whichEvent_Type = 0;
    appLanguageModelAssetCopyContext = self->_appLanguageModelAssetCopyContext;
    self->_appLanguageModelAssetCopyContext = 0;

  }
}

- (void)setAppLanguageModelBuildContext:(id)a3
{
  SMTSchemaSMTAppLanguageModelBuildContext *v4;
  SMTSchemaSMTAppLanguageModelAssetCopyContext *appLanguageModelAssetCopyContext;
  SMTSchemaSMTAppLanguageModelProfileRebuildContext *appLanguageModelProfileRebuildContext;
  unint64_t v7;
  SMTSchemaSMTAppLanguageModelBuildContext *appLanguageModelBuildContext;

  v4 = (SMTSchemaSMTAppLanguageModelBuildContext *)a3;
  appLanguageModelAssetCopyContext = self->_appLanguageModelAssetCopyContext;
  self->_appLanguageModelAssetCopyContext = 0;

  appLanguageModelProfileRebuildContext = self->_appLanguageModelProfileRebuildContext;
  self->_appLanguageModelProfileRebuildContext = 0;

  v7 = 102;
  if (!v4)
    v7 = 0;
  self->_whichEvent_Type = v7;
  appLanguageModelBuildContext = self->_appLanguageModelBuildContext;
  self->_appLanguageModelBuildContext = v4;

}

- (SMTSchemaSMTAppLanguageModelBuildContext)appLanguageModelBuildContext
{
  if (self->_whichEvent_Type == 102)
    return self->_appLanguageModelBuildContext;
  else
    return (SMTSchemaSMTAppLanguageModelBuildContext *)0;
}

- (void)deleteAppLanguageModelBuildContext
{
  SMTSchemaSMTAppLanguageModelBuildContext *appLanguageModelBuildContext;

  if (self->_whichEvent_Type == 102)
  {
    self->_whichEvent_Type = 0;
    appLanguageModelBuildContext = self->_appLanguageModelBuildContext;
    self->_appLanguageModelBuildContext = 0;

  }
}

- (void)setAppLanguageModelProfileRebuildContext:(id)a3
{
  SMTSchemaSMTAppLanguageModelProfileRebuildContext *v4;
  SMTSchemaSMTAppLanguageModelAssetCopyContext *appLanguageModelAssetCopyContext;
  SMTSchemaSMTAppLanguageModelBuildContext *appLanguageModelBuildContext;
  unint64_t v7;
  SMTSchemaSMTAppLanguageModelProfileRebuildContext *appLanguageModelProfileRebuildContext;

  v4 = (SMTSchemaSMTAppLanguageModelProfileRebuildContext *)a3;
  appLanguageModelAssetCopyContext = self->_appLanguageModelAssetCopyContext;
  self->_appLanguageModelAssetCopyContext = 0;

  appLanguageModelBuildContext = self->_appLanguageModelBuildContext;
  self->_appLanguageModelBuildContext = 0;

  v7 = 103;
  if (!v4)
    v7 = 0;
  self->_whichEvent_Type = v7;
  appLanguageModelProfileRebuildContext = self->_appLanguageModelProfileRebuildContext;
  self->_appLanguageModelProfileRebuildContext = v4;

}

- (SMTSchemaSMTAppLanguageModelProfileRebuildContext)appLanguageModelProfileRebuildContext
{
  if (self->_whichEvent_Type == 103)
    return self->_appLanguageModelProfileRebuildContext;
  else
    return (SMTSchemaSMTAppLanguageModelProfileRebuildContext *)0;
}

- (void)deleteAppLanguageModelProfileRebuildContext
{
  SMTSchemaSMTAppLanguageModelProfileRebuildContext *appLanguageModelProfileRebuildContext;

  if (self->_whichEvent_Type == 103)
  {
    self->_whichEvent_Type = 0;
    appLanguageModelProfileRebuildContext = self->_appLanguageModelProfileRebuildContext;
    self->_appLanguageModelProfileRebuildContext = 0;

  }
}

- (BOOL)readFrom:(id)a3
{
  return SMTSchemaSMTClientEventReadFrom(self, (uint64_t)a3);
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
  -[SMTSchemaSMTClientEvent eventMetadata](self, "eventMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SMTSchemaSMTClientEvent eventMetadata](self, "eventMetadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[SMTSchemaSMTClientEvent appLanguageModelAssetCopyContext](self, "appLanguageModelAssetCopyContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[SMTSchemaSMTClientEvent appLanguageModelAssetCopyContext](self, "appLanguageModelAssetCopyContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[SMTSchemaSMTClientEvent appLanguageModelBuildContext](self, "appLanguageModelBuildContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[SMTSchemaSMTClientEvent appLanguageModelBuildContext](self, "appLanguageModelBuildContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[SMTSchemaSMTClientEvent appLanguageModelProfileRebuildContext](self, "appLanguageModelProfileRebuildContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[SMTSchemaSMTClientEvent appLanguageModelProfileRebuildContext](self, "appLanguageModelProfileRebuildContext");
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
  -[SMTSchemaSMTClientEvent eventMetadata](self, "eventMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_22;
  -[SMTSchemaSMTClientEvent eventMetadata](self, "eventMetadata");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[SMTSchemaSMTClientEvent eventMetadata](self, "eventMetadata");
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
  -[SMTSchemaSMTClientEvent appLanguageModelAssetCopyContext](self, "appLanguageModelAssetCopyContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appLanguageModelAssetCopyContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_22;
  -[SMTSchemaSMTClientEvent appLanguageModelAssetCopyContext](self, "appLanguageModelAssetCopyContext");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[SMTSchemaSMTClientEvent appLanguageModelAssetCopyContext](self, "appLanguageModelAssetCopyContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appLanguageModelAssetCopyContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_23;
  }
  else
  {

  }
  -[SMTSchemaSMTClientEvent appLanguageModelBuildContext](self, "appLanguageModelBuildContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appLanguageModelBuildContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_22;
  -[SMTSchemaSMTClientEvent appLanguageModelBuildContext](self, "appLanguageModelBuildContext");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    -[SMTSchemaSMTClientEvent appLanguageModelBuildContext](self, "appLanguageModelBuildContext");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appLanguageModelBuildContext");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (!v22)
      goto LABEL_23;
  }
  else
  {

  }
  -[SMTSchemaSMTClientEvent appLanguageModelProfileRebuildContext](self, "appLanguageModelProfileRebuildContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appLanguageModelProfileRebuildContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[SMTSchemaSMTClientEvent appLanguageModelProfileRebuildContext](self, "appLanguageModelProfileRebuildContext");
    v23 = objc_claimAutoreleasedReturnValue();
    if (!v23)
    {

LABEL_26:
      v28 = 1;
      goto LABEL_24;
    }
    v24 = (void *)v23;
    -[SMTSchemaSMTClientEvent appLanguageModelProfileRebuildContext](self, "appLanguageModelProfileRebuildContext");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appLanguageModelProfileRebuildContext");
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

  v3 = -[SMTSchemaSMTClientEventMetadata hash](self->_eventMetadata, "hash");
  v4 = -[SMTSchemaSMTAppLanguageModelAssetCopyContext hash](self->_appLanguageModelAssetCopyContext, "hash") ^ v3;
  v5 = -[SMTSchemaSMTAppLanguageModelBuildContext hash](self->_appLanguageModelBuildContext, "hash");
  return v4 ^ v5 ^ -[SMTSchemaSMTAppLanguageModelProfileRebuildContext hash](self->_appLanguageModelProfileRebuildContext, "hash");
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
  if (self->_appLanguageModelAssetCopyContext)
  {
    -[SMTSchemaSMTClientEvent appLanguageModelAssetCopyContext](self, "appLanguageModelAssetCopyContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("appLanguageModelAssetCopyContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("appLanguageModelAssetCopyContext"));

    }
  }
  if (self->_appLanguageModelBuildContext)
  {
    -[SMTSchemaSMTClientEvent appLanguageModelBuildContext](self, "appLanguageModelBuildContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("appLanguageModelBuildContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("appLanguageModelBuildContext"));

    }
  }
  if (self->_appLanguageModelProfileRebuildContext)
  {
    -[SMTSchemaSMTClientEvent appLanguageModelProfileRebuildContext](self, "appLanguageModelProfileRebuildContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("appLanguageModelProfileRebuildContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("appLanguageModelProfileRebuildContext"));

    }
  }
  if (self->_eventMetadata)
  {
    -[SMTSchemaSMTClientEvent eventMetadata](self, "eventMetadata");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("eventMetadata"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("eventMetadata"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SMTSchemaSMTClientEvent dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (SMTSchemaSMTClientEvent)initWithJSON:(id)a3
{
  void *v4;
  SMTSchemaSMTClientEvent *v5;
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
    self = -[SMTSchemaSMTClientEvent initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SMTSchemaSMTClientEvent)initWithDictionary:(id)a3
{
  id v4;
  SMTSchemaSMTClientEvent *v5;
  void *v6;
  SMTSchemaSMTClientEventMetadata *v7;
  void *v8;
  SMTSchemaSMTAppLanguageModelAssetCopyContext *v9;
  void *v10;
  SMTSchemaSMTAppLanguageModelBuildContext *v11;
  void *v12;
  SMTSchemaSMTAppLanguageModelProfileRebuildContext *v13;
  SMTSchemaSMTClientEvent *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SMTSchemaSMTClientEvent;
  v5 = -[SMTSchemaSMTClientEvent init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("eventMetadata"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SMTSchemaSMTClientEventMetadata initWithDictionary:]([SMTSchemaSMTClientEventMetadata alloc], "initWithDictionary:", v6);
      -[SMTSchemaSMTClientEvent setEventMetadata:](v5, "setEventMetadata:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appLanguageModelAssetCopyContext"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[SMTSchemaSMTAppLanguageModelAssetCopyContext initWithDictionary:]([SMTSchemaSMTAppLanguageModelAssetCopyContext alloc], "initWithDictionary:", v8);
      -[SMTSchemaSMTClientEvent setAppLanguageModelAssetCopyContext:](v5, "setAppLanguageModelAssetCopyContext:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appLanguageModelBuildContext"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[SMTSchemaSMTAppLanguageModelBuildContext initWithDictionary:]([SMTSchemaSMTAppLanguageModelBuildContext alloc], "initWithDictionary:", v10);
      -[SMTSchemaSMTClientEvent setAppLanguageModelBuildContext:](v5, "setAppLanguageModelBuildContext:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appLanguageModelProfileRebuildContext"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[SMTSchemaSMTAppLanguageModelProfileRebuildContext initWithDictionary:]([SMTSchemaSMTAppLanguageModelProfileRebuildContext alloc], "initWithDictionary:", v12);
      -[SMTSchemaSMTClientEvent setAppLanguageModelProfileRebuildContext:](v5, "setAppLanguageModelProfileRebuildContext:", v13);

    }
    v14 = v5;

  }
  return v5;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (SMTSchemaSMTClientEventMetadata)eventMetadata
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

- (BOOL)hasAppLanguageModelAssetCopyContext
{
  return self->_hasAppLanguageModelAssetCopyContext;
}

- (void)setHasAppLanguageModelAssetCopyContext:(BOOL)a3
{
  self->_hasAppLanguageModelAssetCopyContext = a3;
}

- (BOOL)hasAppLanguageModelBuildContext
{
  return self->_hasAppLanguageModelBuildContext;
}

- (void)setHasAppLanguageModelBuildContext:(BOOL)a3
{
  self->_hasAppLanguageModelBuildContext = a3;
}

- (BOOL)hasAppLanguageModelProfileRebuildContext
{
  return self->_hasAppLanguageModelProfileRebuildContext;
}

- (void)setHasAppLanguageModelProfileRebuildContext:(BOOL)a3
{
  self->_hasAppLanguageModelProfileRebuildContext = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appLanguageModelProfileRebuildContext, 0);
  objc_storeStrong((id *)&self->_appLanguageModelBuildContext, 0);
  objc_storeStrong((id *)&self->_appLanguageModelAssetCopyContext, 0);
  objc_storeStrong((id *)&self->_eventMetadata, 0);
}

- (int)getAnyEventType
{
  return 60;
}

@end
