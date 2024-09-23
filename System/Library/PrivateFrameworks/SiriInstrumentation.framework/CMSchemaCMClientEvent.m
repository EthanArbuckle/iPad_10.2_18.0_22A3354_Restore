@implementation CMSchemaCMClientEvent

- (id)getComponentId
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;

  -[CMSchemaCMClientEvent eventMetadata](self, "eventMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cmId");
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

  -[CMSchemaCMClientEvent eventMetadata](self, "eventMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cmId");
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
        LODWORD(v4) = 47;
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
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CMSchemaCMClientEvent;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v16, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CMSchemaCMClientEvent eventMetadata](self, "eventMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[CMSchemaCMClientEvent deleteEventMetadata](self, "deleteEventMetadata");
  -[CMSchemaCMClientEvent searchContext](self, "searchContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[CMSchemaCMClientEvent deleteSearchContext](self, "deleteSearchContext");
  -[CMSchemaCMClientEvent insertContext](self, "insertContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[CMSchemaCMClientEvent deleteInsertContext](self, "deleteInsertContext");

  return v5;
}

- (SISchemaInstrumentationMessage)innerEvent
{
  unint64_t v3;
  int *v4;
  id v5;

  v3 = -[CMSchemaCMClientEvent whichEvent_Type](self, "whichEvent_Type");
  if (v3 == 2)
  {
    v4 = &OBJC_IVAR___CMSchemaCMClientEvent__searchContext;
  }
  else
  {
    if (v3 != 3)
    {
      v5 = 0;
      return (SISchemaInstrumentationMessage *)v5;
    }
    v4 = &OBJC_IVAR___CMSchemaCMClientEvent__insertContext;
  }
  v5 = *(id *)((char *)&self->super.super.super.super.isa + *v4);
  return (SISchemaInstrumentationMessage *)v5;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("insertContext");
  if (a3 != 3)
    v3 = 0;
  if (a3 == 2)
    return CFSTR("searchContext");
  else
    return (id)v3;
}

- (id)qualifiedMessageName
{
  unint64_t v2;
  const __CFString *v3;

  v2 = -[CMSchemaCMClientEvent whichEvent_Type](self, "whichEvent_Type");
  v3 = CFSTR("com.apple.aiml.siri.cm.CMClientEvent");
  if (v2 == 3)
    v3 = CFSTR("com.apple.aiml.siri.cm.CMClientEvent.CMInsertContext");
  if (v2 == 2)
    return CFSTR("com.apple.aiml.siri.cm.CMClientEvent.CMSearchContext");
  else
    return (id)v3;
}

- (BOOL)hasEventMetadata
{
  return self->_eventMetadata != 0;
}

- (void)deleteEventMetadata
{
  -[CMSchemaCMClientEvent setEventMetadata:](self, "setEventMetadata:", 0);
}

- (void)setSearchContext:(id)a3
{
  CMSchemaCMSearchContext *v4;
  CMSchemaCMInsertContext *insertContext;
  CMSchemaCMSearchContext *searchContext;

  v4 = (CMSchemaCMSearchContext *)a3;
  insertContext = self->_insertContext;
  self->_insertContext = 0;

  self->_whichEvent_Type = 2 * (v4 != 0);
  searchContext = self->_searchContext;
  self->_searchContext = v4;

}

- (CMSchemaCMSearchContext)searchContext
{
  if (self->_whichEvent_Type == 2)
    return self->_searchContext;
  else
    return (CMSchemaCMSearchContext *)0;
}

- (void)deleteSearchContext
{
  CMSchemaCMSearchContext *searchContext;

  if (self->_whichEvent_Type == 2)
  {
    self->_whichEvent_Type = 0;
    searchContext = self->_searchContext;
    self->_searchContext = 0;

  }
}

- (void)setInsertContext:(id)a3
{
  CMSchemaCMInsertContext *v4;
  CMSchemaCMSearchContext *searchContext;
  unint64_t v6;
  CMSchemaCMInsertContext *insertContext;

  v4 = (CMSchemaCMInsertContext *)a3;
  searchContext = self->_searchContext;
  self->_searchContext = 0;

  v6 = 3;
  if (!v4)
    v6 = 0;
  self->_whichEvent_Type = v6;
  insertContext = self->_insertContext;
  self->_insertContext = v4;

}

- (CMSchemaCMInsertContext)insertContext
{
  if (self->_whichEvent_Type == 3)
    return self->_insertContext;
  else
    return (CMSchemaCMInsertContext *)0;
}

- (void)deleteInsertContext
{
  CMSchemaCMInsertContext *insertContext;

  if (self->_whichEvent_Type == 3)
  {
    self->_whichEvent_Type = 0;
    insertContext = self->_insertContext;
    self->_insertContext = 0;

  }
}

- (BOOL)readFrom:(id)a3
{
  return CMSchemaCMClientEventReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[CMSchemaCMClientEvent eventMetadata](self, "eventMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CMSchemaCMClientEvent eventMetadata](self, "eventMetadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[CMSchemaCMClientEvent searchContext](self, "searchContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[CMSchemaCMClientEvent searchContext](self, "searchContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[CMSchemaCMClientEvent insertContext](self, "insertContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[CMSchemaCMClientEvent insertContext](self, "insertContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
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
  char v22;
  BOOL v23;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_18;
  whichEvent_Type = self->_whichEvent_Type;
  if (whichEvent_Type != objc_msgSend(v4, "whichEvent_Type"))
    goto LABEL_18;
  -[CMSchemaCMClientEvent eventMetadata](self, "eventMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_17;
  -[CMSchemaCMClientEvent eventMetadata](self, "eventMetadata");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[CMSchemaCMClientEvent eventMetadata](self, "eventMetadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "eventMetadata");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_18;
  }
  else
  {

  }
  -[CMSchemaCMClientEvent searchContext](self, "searchContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "searchContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_17;
  -[CMSchemaCMClientEvent searchContext](self, "searchContext");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[CMSchemaCMClientEvent searchContext](self, "searchContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "searchContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_18;
  }
  else
  {

  }
  -[CMSchemaCMClientEvent insertContext](self, "insertContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "insertContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[CMSchemaCMClientEvent insertContext](self, "insertContext");
    v18 = objc_claimAutoreleasedReturnValue();
    if (!v18)
    {

LABEL_21:
      v23 = 1;
      goto LABEL_19;
    }
    v19 = (void *)v18;
    -[CMSchemaCMClientEvent insertContext](self, "insertContext");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "insertContext");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if ((v22 & 1) != 0)
      goto LABEL_21;
  }
  else
  {
LABEL_17:

  }
LABEL_18:
  v23 = 0;
LABEL_19:

  return v23;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;

  v3 = -[CMSchemaCMClientEventMetadata hash](self->_eventMetadata, "hash");
  v4 = -[CMSchemaCMSearchContext hash](self->_searchContext, "hash") ^ v3;
  return v4 ^ -[CMSchemaCMInsertContext hash](self->_insertContext, "hash");
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_eventMetadata)
  {
    -[CMSchemaCMClientEvent eventMetadata](self, "eventMetadata");
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
  if (self->_insertContext)
  {
    -[CMSchemaCMClientEvent insertContext](self, "insertContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("insertContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("insertContext"));

    }
  }
  if (self->_searchContext)
  {
    -[CMSchemaCMClientEvent searchContext](self, "searchContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("searchContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("searchContext"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[CMSchemaCMClientEvent dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (CMSchemaCMClientEvent)initWithJSON:(id)a3
{
  void *v4;
  CMSchemaCMClientEvent *v5;
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
    self = -[CMSchemaCMClientEvent initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (CMSchemaCMClientEvent)initWithDictionary:(id)a3
{
  id v4;
  CMSchemaCMClientEvent *v5;
  void *v6;
  CMSchemaCMClientEventMetadata *v7;
  void *v8;
  CMSchemaCMSearchContext *v9;
  void *v10;
  CMSchemaCMInsertContext *v11;
  CMSchemaCMClientEvent *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CMSchemaCMClientEvent;
  v5 = -[CMSchemaCMClientEvent init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("eventMetadata"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[CMSchemaCMClientEventMetadata initWithDictionary:]([CMSchemaCMClientEventMetadata alloc], "initWithDictionary:", v6);
      -[CMSchemaCMClientEvent setEventMetadata:](v5, "setEventMetadata:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("searchContext"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[CMSchemaCMSearchContext initWithDictionary:]([CMSchemaCMSearchContext alloc], "initWithDictionary:", v8);
      -[CMSchemaCMClientEvent setSearchContext:](v5, "setSearchContext:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("insertContext"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[CMSchemaCMInsertContext initWithDictionary:]([CMSchemaCMInsertContext alloc], "initWithDictionary:", v10);
      -[CMSchemaCMClientEvent setInsertContext:](v5, "setInsertContext:", v11);

    }
    v12 = v5;

  }
  return v5;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (CMSchemaCMClientEventMetadata)eventMetadata
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

- (BOOL)hasSearchContext
{
  return self->_hasSearchContext;
}

- (void)setHasSearchContext:(BOOL)a3
{
  self->_hasSearchContext = a3;
}

- (BOOL)hasInsertContext
{
  return self->_hasInsertContext;
}

- (void)setHasInsertContext:(BOOL)a3
{
  self->_hasInsertContext = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_insertContext, 0);
  objc_storeStrong((id *)&self->_searchContext, 0);
  objc_storeStrong((id *)&self->_eventMetadata, 0);
}

- (int)getAnyEventType
{
  return 90;
}

@end
