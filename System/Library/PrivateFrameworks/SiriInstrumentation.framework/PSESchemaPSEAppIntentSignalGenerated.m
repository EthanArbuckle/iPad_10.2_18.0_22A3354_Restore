@implementation PSESchemaPSEAppIntentSignalGenerated

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
  v13.super_class = (Class)PSESchemaPSEAppIntentSignalGenerated;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v13, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSESchemaPSEAppIntentSignalGenerated commonSignal](self, "commonSignal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[PSESchemaPSEAppIntentSignalGenerated deleteCommonSignal](self, "deleteCommonSignal");
  -[PSESchemaPSEAppIntentSignalGenerated engagementSignal](self, "engagementSignal");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[PSESchemaPSEAppIntentSignalGenerated deleteEngagementSignal](self, "deleteEngagementSignal");

  return v5;
}

- (BOOL)hasCommonSignal
{
  return self->_commonSignal != 0;
}

- (void)deleteCommonSignal
{
  -[PSESchemaPSEAppIntentSignalGenerated setCommonSignal:](self, "setCommonSignal:", 0);
}

- (BOOL)hasEngagementSignal
{
  return self->_engagementSignal != 0;
}

- (void)deleteEngagementSignal
{
  -[PSESchemaPSEAppIntentSignalGenerated setEngagementSignal:](self, "setEngagementSignal:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return PSESchemaPSEAppIntentSignalGeneratedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[PSESchemaPSEAppIntentSignalGenerated commonSignal](self, "commonSignal");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PSESchemaPSEAppIntentSignalGenerated commonSignal](self, "commonSignal");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PSESchemaPSEAppIntentSignalGenerated engagementSignal](self, "engagementSignal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[PSESchemaPSEAppIntentSignalGenerated engagementSignal](self, "engagementSignal");
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
  -[PSESchemaPSEAppIntentSignalGenerated commonSignal](self, "commonSignal");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonSignal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[PSESchemaPSEAppIntentSignalGenerated commonSignal](self, "commonSignal");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[PSESchemaPSEAppIntentSignalGenerated commonSignal](self, "commonSignal");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "commonSignal");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[PSESchemaPSEAppIntentSignalGenerated engagementSignal](self, "engagementSignal");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "engagementSignal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[PSESchemaPSEAppIntentSignalGenerated engagementSignal](self, "engagementSignal");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
    {

LABEL_15:
      v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    -[PSESchemaPSEAppIntentSignalGenerated engagementSignal](self, "engagementSignal");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "engagementSignal");
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

  v3 = -[PSESchemaPSECommonSignal hash](self->_commonSignal, "hash");
  return -[PSESchemaPSEAppIntentInteractionEngagement hash](self->_engagementSignal, "hash") ^ v3;
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
  if (self->_commonSignal)
  {
    -[PSESchemaPSEAppIntentSignalGenerated commonSignal](self, "commonSignal");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("commonSignal"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("commonSignal"));

    }
  }
  if (self->_engagementSignal)
  {
    -[PSESchemaPSEAppIntentSignalGenerated engagementSignal](self, "engagementSignal");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("engagementSignal"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("engagementSignal"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PSESchemaPSEAppIntentSignalGenerated dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (PSESchemaPSEAppIntentSignalGenerated)initWithJSON:(id)a3
{
  void *v4;
  PSESchemaPSEAppIntentSignalGenerated *v5;
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
    self = -[PSESchemaPSEAppIntentSignalGenerated initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PSESchemaPSEAppIntentSignalGenerated)initWithDictionary:(id)a3
{
  id v4;
  PSESchemaPSEAppIntentSignalGenerated *v5;
  void *v6;
  PSESchemaPSECommonSignal *v7;
  void *v8;
  PSESchemaPSEAppIntentInteractionEngagement *v9;
  PSESchemaPSEAppIntentSignalGenerated *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PSESchemaPSEAppIntentSignalGenerated;
  v5 = -[PSESchemaPSEAppIntentSignalGenerated init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("commonSignal"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[PSESchemaPSECommonSignal initWithDictionary:]([PSESchemaPSECommonSignal alloc], "initWithDictionary:", v6);
      -[PSESchemaPSEAppIntentSignalGenerated setCommonSignal:](v5, "setCommonSignal:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("engagementSignal"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[PSESchemaPSEAppIntentInteractionEngagement initWithDictionary:]([PSESchemaPSEAppIntentInteractionEngagement alloc], "initWithDictionary:", v8);
      -[PSESchemaPSEAppIntentSignalGenerated setEngagementSignal:](v5, "setEngagementSignal:", v9);

    }
    v10 = v5;

  }
  return v5;
}

- (PSESchemaPSECommonSignal)commonSignal
{
  return self->_commonSignal;
}

- (void)setCommonSignal:(id)a3
{
  objc_storeStrong((id *)&self->_commonSignal, a3);
}

- (PSESchemaPSEAppIntentInteractionEngagement)engagementSignal
{
  return self->_engagementSignal;
}

- (void)setEngagementSignal:(id)a3
{
  objc_storeStrong((id *)&self->_engagementSignal, a3);
}

- (void)setHasCommonSignal:(BOOL)a3
{
  self->_hasCommonSignal = a3;
}

- (void)setHasEngagementSignal:(BOOL)a3
{
  self->_hasEngagementSignal = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_engagementSignal, 0);
  objc_storeStrong((id *)&self->_commonSignal, 0);
}

@end
