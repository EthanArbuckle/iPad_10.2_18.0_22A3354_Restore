@implementation SISchemaVerticalLayoutCardSectionInvocationContext

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (BOOL)hasResultIdentifier
{
  return self->_resultIdentifier != 0;
}

- (void)deleteResultIdentifier
{
  -[SISchemaVerticalLayoutCardSectionInvocationContext setResultIdentifier:](self, "setResultIdentifier:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaVerticalLayoutCardSectionInvocationContextReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[SISchemaVerticalLayoutCardSectionInvocationContext resultIdentifier](self, "resultIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  BOOL v13;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    -[SISchemaVerticalLayoutCardSectionInvocationContext resultIdentifier](self, "resultIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "resultIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if ((v5 == 0) != (v6 != 0))
    {
      -[SISchemaVerticalLayoutCardSectionInvocationContext resultIdentifier](self, "resultIdentifier");
      v8 = objc_claimAutoreleasedReturnValue();
      if (!v8)
      {

LABEL_10:
        v13 = 1;
        goto LABEL_8;
      }
      v9 = (void *)v8;
      -[SISchemaVerticalLayoutCardSectionInvocationContext resultIdentifier](self, "resultIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "resultIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqual:", v11);

      if ((v12 & 1) != 0)
        goto LABEL_10;
    }
    else
    {

    }
  }
  v13 = 0;
LABEL_8:

  return v13;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_resultIdentifier, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_resultIdentifier)
  {
    -[SISchemaVerticalLayoutCardSectionInvocationContext resultIdentifier](self, "resultIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("resultIdentifier"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SISchemaVerticalLayoutCardSectionInvocationContext dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (SISchemaVerticalLayoutCardSectionInvocationContext)initWithJSON:(id)a3
{
  void *v4;
  SISchemaVerticalLayoutCardSectionInvocationContext *v5;
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
    self = -[SISchemaVerticalLayoutCardSectionInvocationContext initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SISchemaVerticalLayoutCardSectionInvocationContext)initWithDictionary:(id)a3
{
  id v4;
  SISchemaVerticalLayoutCardSectionInvocationContext *v5;
  void *v6;
  void *v7;
  SISchemaVerticalLayoutCardSectionInvocationContext *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SISchemaVerticalLayoutCardSectionInvocationContext;
  v5 = -[SISchemaVerticalLayoutCardSectionInvocationContext init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("resultIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[SISchemaVerticalLayoutCardSectionInvocationContext setResultIdentifier:](v5, "setResultIdentifier:", v7);

    }
    v8 = v5;

  }
  return v5;
}

- (NSString)resultIdentifier
{
  return self->_resultIdentifier;
}

- (void)setResultIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setHasResultIdentifier:(BOOL)a3
{
  self->_hasResultIdentifier = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultIdentifier, 0);
}

@end
