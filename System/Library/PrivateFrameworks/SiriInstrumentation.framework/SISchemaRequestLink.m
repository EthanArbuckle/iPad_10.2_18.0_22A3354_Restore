@implementation SISchemaRequestLink

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
  v13.super_class = (Class)SISchemaRequestLink;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v13, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaRequestLink source](self, "source");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[SISchemaRequestLink deleteSource](self, "deleteSource");
  -[SISchemaRequestLink target](self, "target");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[SISchemaRequestLink deleteTarget](self, "deleteTarget");

  return v5;
}

- (id)qualifiedMessageName
{
  return CFSTR("com.apple.aiml.siri.common.RequestLink");
}

- (BOOL)hasSource
{
  return self->_source != 0;
}

- (void)deleteSource
{
  -[SISchemaRequestLink setSource:](self, "setSource:", 0);
}

- (BOOL)hasTarget
{
  return self->_target != 0;
}

- (void)deleteTarget
{
  -[SISchemaRequestLink setTarget:](self, "setTarget:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaRequestLinkReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[SISchemaRequestLink source](self, "source");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SISchemaRequestLink source](self, "source");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[SISchemaRequestLink target](self, "target");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[SISchemaRequestLink target](self, "target");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (BOOL)isEqual:(id)a3
{
  id v4;
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
  char v16;
  BOOL v17;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  -[SISchemaRequestLink source](self, "source");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "source");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[SISchemaRequestLink source](self, "source");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[SISchemaRequestLink source](self, "source");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "source");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[SISchemaRequestLink target](self, "target");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "target");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[SISchemaRequestLink target](self, "target");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
    {

LABEL_15:
      v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    -[SISchemaRequestLink target](self, "target");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "target");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if ((v16 & 1) != 0)
      goto LABEL_15;
  }
  else
  {
LABEL_11:

  }
LABEL_12:
  v17 = 0;
LABEL_13:

  return v17;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[SISchemaRequestLinkInfo hash](self->_source, "hash");
  return -[SISchemaRequestLinkInfo hash](self->_target, "hash") ^ v3;
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
  if (self->_source)
  {
    -[SISchemaRequestLink source](self, "source");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("source"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("source"));

    }
  }
  if (self->_target)
  {
    -[SISchemaRequestLink target](self, "target");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("target"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("target"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SISchemaRequestLink dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (SISchemaRequestLink)initWithJSON:(id)a3
{
  void *v4;
  SISchemaRequestLink *v5;
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
    self = -[SISchemaRequestLink initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SISchemaRequestLink)initWithDictionary:(id)a3
{
  id v4;
  SISchemaRequestLink *v5;
  void *v6;
  SISchemaRequestLinkInfo *v7;
  void *v8;
  SISchemaRequestLinkInfo *v9;
  SISchemaRequestLink *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SISchemaRequestLink;
  v5 = -[SISchemaRequestLink init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("source"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaRequestLinkInfo initWithDictionary:]([SISchemaRequestLinkInfo alloc], "initWithDictionary:", v6);
      -[SISchemaRequestLink setSource:](v5, "setSource:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("target"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[SISchemaRequestLinkInfo initWithDictionary:]([SISchemaRequestLinkInfo alloc], "initWithDictionary:", v8);
      -[SISchemaRequestLink setTarget:](v5, "setTarget:", v9);

    }
    v10 = v5;

  }
  return v5;
}

- (SISchemaRequestLinkInfo)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
  objc_storeStrong((id *)&self->_source, a3);
}

- (SISchemaRequestLinkInfo)target
{
  return self->_target;
}

- (void)setTarget:(id)a3
{
  objc_storeStrong((id *)&self->_target, a3);
}

- (void)setHasSource:(BOOL)a3
{
  self->_hasSource = a3;
}

- (void)setHasTarget:(BOOL)a3
{
  self->_hasTarget = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_target, 0);
  objc_storeStrong((id *)&self->_source, 0);
}

- (int)getAnyEventType
{
  return 9;
}

@end
