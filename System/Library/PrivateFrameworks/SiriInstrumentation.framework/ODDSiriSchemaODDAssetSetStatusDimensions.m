@implementation ODDSiriSchemaODDAssetSetStatusDimensions

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
  v13.super_class = (Class)ODDSiriSchemaODDAssetSetStatusDimensions;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v13, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ODDSiriSchemaODDAssetSetStatusDimensions assistantDimensions](self, "assistantDimensions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[ODDSiriSchemaODDAssetSetStatusDimensions deleteAssistantDimensions](self, "deleteAssistantDimensions");
  -[ODDSiriSchemaODDAssetSetStatusDimensions assetSetStatus](self, "assetSetStatus");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[ODDSiriSchemaODDAssetSetStatusDimensions deleteAssetSetStatus](self, "deleteAssetSetStatus");

  return v5;
}

- (BOOL)hasAssistantDimensions
{
  return self->_assistantDimensions != 0;
}

- (void)deleteAssistantDimensions
{
  -[ODDSiriSchemaODDAssetSetStatusDimensions setAssistantDimensions:](self, "setAssistantDimensions:", 0);
}

- (BOOL)hasPreviousSystemBuild
{
  return self->_previousSystemBuild != 0;
}

- (void)deletePreviousSystemBuild
{
  -[ODDSiriSchemaODDAssetSetStatusDimensions setPreviousSystemBuild:](self, "setPreviousSystemBuild:", 0);
}

- (void)setBuildInstallationTimestampInSecondsSince1970:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_buildInstallationTimestampInSecondsSince1970 = a3;
}

- (BOOL)hasBuildInstallationTimestampInSecondsSince1970
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasBuildInstallationTimestampInSecondsSince1970:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteBuildInstallationTimestampInSecondsSince1970
{
  -[ODDSiriSchemaODDAssetSetStatusDimensions setBuildInstallationTimestampInSecondsSince1970:](self, "setBuildInstallationTimestampInSecondsSince1970:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)hasAssetSetStatus
{
  return self->_assetSetStatus != 0;
}

- (void)deleteAssetSetStatus
{
  -[ODDSiriSchemaODDAssetSetStatusDimensions setAssetSetStatus:](self, "setAssetSetStatus:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return ODDSiriSchemaODDAssetSetStatusDimensionsReadFrom(self, (uint64_t)a3);
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
  -[ODDSiriSchemaODDAssetSetStatusDimensions assistantDimensions](self, "assistantDimensions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[ODDSiriSchemaODDAssetSetStatusDimensions assistantDimensions](self, "assistantDimensions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ODDSiriSchemaODDAssetSetStatusDimensions previousSystemBuild](self, "previousSystemBuild");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field();
  -[ODDSiriSchemaODDAssetSetStatusDimensions assetSetStatus](self, "assetSetStatus");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v10;
  if (v7)
  {
    -[ODDSiriSchemaODDAssetSetStatusDimensions assetSetStatus](self, "assetSetStatus");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v8 = v10;
  }

}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
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
  unint64_t buildInstallationTimestampInSecondsSince1970;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  BOOL v23;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_20;
  -[ODDSiriSchemaODDAssetSetStatusDimensions assistantDimensions](self, "assistantDimensions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assistantDimensions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_19;
  -[ODDSiriSchemaODDAssetSetStatusDimensions assistantDimensions](self, "assistantDimensions");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[ODDSiriSchemaODDAssetSetStatusDimensions assistantDimensions](self, "assistantDimensions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "assistantDimensions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_20;
  }
  else
  {

  }
  -[ODDSiriSchemaODDAssetSetStatusDimensions previousSystemBuild](self, "previousSystemBuild");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "previousSystemBuild");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_19;
  -[ODDSiriSchemaODDAssetSetStatusDimensions previousSystemBuild](self, "previousSystemBuild");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[ODDSiriSchemaODDAssetSetStatusDimensions previousSystemBuild](self, "previousSystemBuild");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "previousSystemBuild");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_20;
  }
  else
  {

  }
  if ((*(_BYTE *)&self->_has & 1) != (v4[40] & 1))
    goto LABEL_20;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    buildInstallationTimestampInSecondsSince1970 = self->_buildInstallationTimestampInSecondsSince1970;
    if (buildInstallationTimestampInSecondsSince1970 != objc_msgSend(v4, "buildInstallationTimestampInSecondsSince1970"))goto LABEL_20;
  }
  -[ODDSiriSchemaODDAssetSetStatusDimensions assetSetStatus](self, "assetSetStatus");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assetSetStatus");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[ODDSiriSchemaODDAssetSetStatusDimensions assetSetStatus](self, "assetSetStatus");
    v18 = objc_claimAutoreleasedReturnValue();
    if (!v18)
    {

LABEL_23:
      v23 = 1;
      goto LABEL_21;
    }
    v19 = (void *)v18;
    -[ODDSiriSchemaODDAssetSetStatusDimensions assetSetStatus](self, "assetSetStatus");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "assetSetStatus");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if ((v22 & 1) != 0)
      goto LABEL_23;
  }
  else
  {
LABEL_19:

  }
LABEL_20:
  v23 = 0;
LABEL_21:

  return v23;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  unint64_t v5;

  v3 = -[ODDSiriSchemaODDAssistantDimensions hash](self->_assistantDimensions, "hash");
  v4 = -[NSString hash](self->_previousSystemBuild, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v5 = 2654435761u * self->_buildInstallationTimestampInSecondsSince1970;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5 ^ -[UAFSchemaUAFAssetSetStatus hash](self->_assetSetStatus, "hash");
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
  if (self->_assetSetStatus)
  {
    -[ODDSiriSchemaODDAssetSetStatusDimensions assetSetStatus](self, "assetSetStatus");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("assetSetStatus"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("assetSetStatus"));

    }
  }
  if (self->_assistantDimensions)
  {
    -[ODDSiriSchemaODDAssetSetStatusDimensions assistantDimensions](self, "assistantDimensions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("assistantDimensions"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("assistantDimensions"));

    }
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[ODDSiriSchemaODDAssetSetStatusDimensions buildInstallationTimestampInSecondsSince1970](self, "buildInstallationTimestampInSecondsSince1970"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("buildInstallationTimestampInSecondsSince1970"));

  }
  if (self->_previousSystemBuild)
  {
    -[ODDSiriSchemaODDAssetSetStatusDimensions previousSystemBuild](self, "previousSystemBuild");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("previousSystemBuild"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[ODDSiriSchemaODDAssetSetStatusDimensions dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (ODDSiriSchemaODDAssetSetStatusDimensions)initWithJSON:(id)a3
{
  void *v4;
  ODDSiriSchemaODDAssetSetStatusDimensions *v5;
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
    self = -[ODDSiriSchemaODDAssetSetStatusDimensions initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (ODDSiriSchemaODDAssetSetStatusDimensions)initWithDictionary:(id)a3
{
  id v4;
  ODDSiriSchemaODDAssetSetStatusDimensions *v5;
  void *v6;
  ODDSiriSchemaODDAssistantDimensions *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  UAFSchemaUAFAssetSetStatus *v12;
  ODDSiriSchemaODDAssetSetStatusDimensions *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ODDSiriSchemaODDAssetSetStatusDimensions;
  v5 = -[ODDSiriSchemaODDAssetSetStatusDimensions init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("assistantDimensions"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[ODDSiriSchemaODDAssistantDimensions initWithDictionary:]([ODDSiriSchemaODDAssistantDimensions alloc], "initWithDictionary:", v6);
      -[ODDSiriSchemaODDAssetSetStatusDimensions setAssistantDimensions:](v5, "setAssistantDimensions:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("previousSystemBuild"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[ODDSiriSchemaODDAssetSetStatusDimensions setPreviousSystemBuild:](v5, "setPreviousSystemBuild:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("buildInstallationTimestampInSecondsSince1970"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ODDSiriSchemaODDAssetSetStatusDimensions setBuildInstallationTimestampInSecondsSince1970:](v5, "setBuildInstallationTimestampInSecondsSince1970:", objc_msgSend(v10, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("assetSetStatus"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = -[UAFSchemaUAFAssetSetStatus initWithDictionary:]([UAFSchemaUAFAssetSetStatus alloc], "initWithDictionary:", v11);
      -[ODDSiriSchemaODDAssetSetStatusDimensions setAssetSetStatus:](v5, "setAssetSetStatus:", v12);

    }
    v13 = v5;

  }
  return v5;
}

- (ODDSiriSchemaODDAssistantDimensions)assistantDimensions
{
  return self->_assistantDimensions;
}

- (void)setAssistantDimensions:(id)a3
{
  objc_storeStrong((id *)&self->_assistantDimensions, a3);
}

- (NSString)previousSystemBuild
{
  return self->_previousSystemBuild;
}

- (void)setPreviousSystemBuild:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unint64_t)buildInstallationTimestampInSecondsSince1970
{
  return self->_buildInstallationTimestampInSecondsSince1970;
}

- (UAFSchemaUAFAssetSetStatus)assetSetStatus
{
  return self->_assetSetStatus;
}

- (void)setAssetSetStatus:(id)a3
{
  objc_storeStrong((id *)&self->_assetSetStatus, a3);
}

- (void)setHasAssistantDimensions:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasPreviousSystemBuild:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void)setHasAssetSetStatus:(BOOL)a3
{
  *((_BYTE *)&self->_has + 3) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetSetStatus, 0);
  objc_storeStrong((id *)&self->_previousSystemBuild, 0);
  objc_storeStrong((id *)&self->_assistantDimensions, 0);
}

@end
