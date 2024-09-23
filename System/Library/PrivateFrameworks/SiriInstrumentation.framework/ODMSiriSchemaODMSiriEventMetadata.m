@implementation ODMSiriSchemaODMSiriEventMetadata

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
  v13.super_class = (Class)ODMSiriSchemaODMSiriEventMetadata;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v13, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ODMSiriSchemaODMSiriEventMetadata odmId](self, "odmId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[ODMSiriSchemaODMSiriEventMetadata deleteOdmId](self, "deleteOdmId");
  -[ODMSiriSchemaODMSiriEventMetadata trialExperimentIdentifiers](self, "trialExperimentIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[ODMSiriSchemaODMSiriEventMetadata deleteTrialExperimentIdentifiers](self, "deleteTrialExperimentIdentifiers");

  return v5;
}

- (BOOL)hasOdmId
{
  return self->_odmId != 0;
}

- (void)deleteOdmId
{
  -[ODMSiriSchemaODMSiriEventMetadata setOdmId:](self, "setOdmId:", 0);
}

- (BOOL)hasPluginVersion
{
  return self->_pluginVersion != 0;
}

- (void)deletePluginVersion
{
  -[ODMSiriSchemaODMSiriEventMetadata setPluginVersion:](self, "setPluginVersion:", 0);
}

- (BOOL)hasTrialExperimentIdentifiers
{
  return self->_trialExperimentIdentifiers != 0;
}

- (void)deleteTrialExperimentIdentifiers
{
  -[ODMSiriSchemaODMSiriEventMetadata setTrialExperimentIdentifiers:](self, "setTrialExperimentIdentifiers:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return ODMSiriSchemaODMSiriEventMetadataReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[ODMSiriSchemaODMSiriEventMetadata odmId](self, "odmId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[ODMSiriSchemaODMSiriEventMetadata odmId](self, "odmId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ODMSiriSchemaODMSiriEventMetadata pluginVersion](self, "pluginVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    PBDataWriterWriteStringField();
  -[ODMSiriSchemaODMSiriEventMetadata trialExperimentIdentifiers](self, "trialExperimentIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[ODMSiriSchemaODMSiriEventMetadata trialExperimentIdentifiers](self, "trialExperimentIdentifiers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
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
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  BOOL v22;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  -[ODMSiriSchemaODMSiriEventMetadata odmId](self, "odmId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "odmId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[ODMSiriSchemaODMSiriEventMetadata odmId](self, "odmId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[ODMSiriSchemaODMSiriEventMetadata odmId](self, "odmId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "odmId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_17;
  }
  else
  {

  }
  -[ODMSiriSchemaODMSiriEventMetadata pluginVersion](self, "pluginVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pluginVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[ODMSiriSchemaODMSiriEventMetadata pluginVersion](self, "pluginVersion");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[ODMSiriSchemaODMSiriEventMetadata pluginVersion](self, "pluginVersion");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pluginVersion");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_17;
  }
  else
  {

  }
  -[ODMSiriSchemaODMSiriEventMetadata trialExperimentIdentifiers](self, "trialExperimentIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trialExperimentIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[ODMSiriSchemaODMSiriEventMetadata trialExperimentIdentifiers](self, "trialExperimentIdentifiers");
    v17 = objc_claimAutoreleasedReturnValue();
    if (!v17)
    {

LABEL_20:
      v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    -[ODMSiriSchemaODMSiriEventMetadata trialExperimentIdentifiers](self, "trialExperimentIdentifiers");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "trialExperimentIdentifiers");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if ((v21 & 1) != 0)
      goto LABEL_20;
  }
  else
  {
LABEL_16:

  }
LABEL_17:
  v22 = 0;
LABEL_18:

  return v22;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;

  v3 = -[SISchemaUUID hash](self->_odmId, "hash");
  v4 = -[NSString hash](self->_pluginVersion, "hash") ^ v3;
  return v4 ^ -[ODMSiriSchemaODMTrialExperimentIdentifiers hash](self->_trialExperimentIdentifiers, "hash");
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_odmId)
  {
    -[ODMSiriSchemaODMSiriEventMetadata odmId](self, "odmId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("odmId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("odmId"));

    }
  }
  if (self->_pluginVersion)
  {
    -[ODMSiriSchemaODMSiriEventMetadata pluginVersion](self, "pluginVersion");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("pluginVersion"));

  }
  if (self->_trialExperimentIdentifiers)
  {
    -[ODMSiriSchemaODMSiriEventMetadata trialExperimentIdentifiers](self, "trialExperimentIdentifiers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("trialExperimentIdentifiers"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("trialExperimentIdentifiers"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[ODMSiriSchemaODMSiriEventMetadata dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (ODMSiriSchemaODMSiriEventMetadata)initWithJSON:(id)a3
{
  void *v4;
  ODMSiriSchemaODMSiriEventMetadata *v5;
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
    self = -[ODMSiriSchemaODMSiriEventMetadata initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (ODMSiriSchemaODMSiriEventMetadata)initWithDictionary:(id)a3
{
  id v4;
  ODMSiriSchemaODMSiriEventMetadata *v5;
  void *v6;
  SISchemaUUID *v7;
  void *v8;
  void *v9;
  void *v10;
  ODMSiriSchemaODMTrialExperimentIdentifiers *v11;
  ODMSiriSchemaODMSiriEventMetadata *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ODMSiriSchemaODMSiriEventMetadata;
  v5 = -[ODMSiriSchemaODMSiriEventMetadata init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("odmId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v6);
      -[ODMSiriSchemaODMSiriEventMetadata setOdmId:](v5, "setOdmId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pluginVersion"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[ODMSiriSchemaODMSiriEventMetadata setPluginVersion:](v5, "setPluginVersion:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("trialExperimentIdentifiers"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[ODMSiriSchemaODMTrialExperimentIdentifiers initWithDictionary:]([ODMSiriSchemaODMTrialExperimentIdentifiers alloc], "initWithDictionary:", v10);
      -[ODMSiriSchemaODMSiriEventMetadata setTrialExperimentIdentifiers:](v5, "setTrialExperimentIdentifiers:", v11);

    }
    v12 = v5;

  }
  return v5;
}

- (SISchemaUUID)odmId
{
  return self->_odmId;
}

- (void)setOdmId:(id)a3
{
  objc_storeStrong((id *)&self->_odmId, a3);
}

- (NSString)pluginVersion
{
  return self->_pluginVersion;
}

- (void)setPluginVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (ODMSiriSchemaODMTrialExperimentIdentifiers)trialExperimentIdentifiers
{
  return self->_trialExperimentIdentifiers;
}

- (void)setTrialExperimentIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_trialExperimentIdentifiers, a3);
}

- (void)setHasOdmId:(BOOL)a3
{
  self->_hasOdmId = a3;
}

- (void)setHasPluginVersion:(BOOL)a3
{
  self->_hasPluginVersion = a3;
}

- (void)setHasTrialExperimentIdentifiers:(BOOL)a3
{
  self->_hasTrialExperimentIdentifiers = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trialExperimentIdentifiers, 0);
  objc_storeStrong((id *)&self->_pluginVersion, 0);
  objc_storeStrong((id *)&self->_odmId, 0);
}

@end
