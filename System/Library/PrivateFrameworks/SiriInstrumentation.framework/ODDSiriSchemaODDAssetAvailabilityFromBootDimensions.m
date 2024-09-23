@implementation ODDSiriSchemaODDAssetAvailabilityFromBootDimensions

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
  v9.super_class = (Class)ODDSiriSchemaODDAssetAvailabilityFromBootDimensions;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ODDSiriSchemaODDAssetAvailabilityFromBootDimensions assistantDimensions](self, "assistantDimensions", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[ODDSiriSchemaODDAssetAvailabilityFromBootDimensions deleteAssistantDimensions](self, "deleteAssistantDimensions");
  return v5;
}

- (BOOL)hasAssistantDimensions
{
  return self->_assistantDimensions != 0;
}

- (void)deleteAssistantDimensions
{
  -[ODDSiriSchemaODDAssetAvailabilityFromBootDimensions setAssistantDimensions:](self, "setAssistantDimensions:", 0);
}

- (BOOL)hasAssetSetId
{
  return self->_assetSetId != 0;
}

- (void)deleteAssetSetId
{
  -[ODDSiriSchemaODDAssetAvailabilityFromBootDimensions setAssetSetId:](self, "setAssetSetId:", 0);
}

- (BOOL)hasAssetSetName
{
  return self->_assetSetName != 0;
}

- (void)deleteAssetSetName
{
  -[ODDSiriSchemaODDAssetAvailabilityFromBootDimensions setAssetSetName:](self, "setAssetSetName:", 0);
}

- (BOOL)hasPreviousSystemBuild
{
  return self->_previousSystemBuild != 0;
}

- (void)deletePreviousSystemBuild
{
  -[ODDSiriSchemaODDAssetAvailabilityFromBootDimensions setPreviousSystemBuild:](self, "setPreviousSystemBuild:", 0);
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
  -[ODDSiriSchemaODDAssetAvailabilityFromBootDimensions setBuildInstallationTimestampInSecondsSince1970:](self, "setBuildInstallationTimestampInSecondsSince1970:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)readFrom:(id)a3
{
  return ODDSiriSchemaODDAssetAvailabilityFromBootDimensionsReadFrom(self, (uint64_t)a3);
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
  -[ODDSiriSchemaODDAssetAvailabilityFromBootDimensions assistantDimensions](self, "assistantDimensions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[ODDSiriSchemaODDAssetAvailabilityFromBootDimensions assistantDimensions](self, "assistantDimensions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ODDSiriSchemaODDAssetAvailabilityFromBootDimensions assetSetId](self, "assetSetId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    PBDataWriterWriteStringField();
  -[ODDSiriSchemaODDAssetAvailabilityFromBootDimensions assetSetName](self, "assetSetName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    PBDataWriterWriteStringField();
  -[ODDSiriSchemaODDAssetAvailabilityFromBootDimensions previousSystemBuild](self, "previousSystemBuild");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    PBDataWriterWriteStringField();
  v9 = v10;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    v9 = v10;
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
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  BOOL v27;
  unint64_t buildInstallationTimestampInSecondsSince1970;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_22;
  -[ODDSiriSchemaODDAssetAvailabilityFromBootDimensions assistantDimensions](self, "assistantDimensions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assistantDimensions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[ODDSiriSchemaODDAssetAvailabilityFromBootDimensions assistantDimensions](self, "assistantDimensions");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[ODDSiriSchemaODDAssetAvailabilityFromBootDimensions assistantDimensions](self, "assistantDimensions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "assistantDimensions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_22;
  }
  else
  {

  }
  -[ODDSiriSchemaODDAssetAvailabilityFromBootDimensions assetSetId](self, "assetSetId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assetSetId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[ODDSiriSchemaODDAssetAvailabilityFromBootDimensions assetSetId](self, "assetSetId");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[ODDSiriSchemaODDAssetAvailabilityFromBootDimensions assetSetId](self, "assetSetId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "assetSetId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_22;
  }
  else
  {

  }
  -[ODDSiriSchemaODDAssetAvailabilityFromBootDimensions assetSetName](self, "assetSetName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assetSetName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[ODDSiriSchemaODDAssetAvailabilityFromBootDimensions assetSetName](self, "assetSetName");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[ODDSiriSchemaODDAssetAvailabilityFromBootDimensions assetSetName](self, "assetSetName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "assetSetName");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_22;
  }
  else
  {

  }
  -[ODDSiriSchemaODDAssetAvailabilityFromBootDimensions previousSystemBuild](self, "previousSystemBuild");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "previousSystemBuild");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_21:

    goto LABEL_22;
  }
  -[ODDSiriSchemaODDAssetAvailabilityFromBootDimensions previousSystemBuild](self, "previousSystemBuild");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[ODDSiriSchemaODDAssetAvailabilityFromBootDimensions previousSystemBuild](self, "previousSystemBuild");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "previousSystemBuild");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_22;
  }
  else
  {

  }
  if ((*(_BYTE *)&self->_has & 1) == (v4[48] & 1))
  {
    if ((*(_BYTE *)&self->_has & 1) == 0
      || (buildInstallationTimestampInSecondsSince1970 = self->_buildInstallationTimestampInSecondsSince1970,
          buildInstallationTimestampInSecondsSince1970 == objc_msgSend(v4, "buildInstallationTimestampInSecondsSince1970")))
    {
      v27 = 1;
      goto LABEL_23;
    }
  }
LABEL_22:
  v27 = 0;
LABEL_23:

  return v27;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  unint64_t v7;

  v3 = -[ODDSiriSchemaODDAssistantDimensions hash](self->_assistantDimensions, "hash");
  v4 = -[NSString hash](self->_assetSetId, "hash");
  v5 = -[NSString hash](self->_assetSetName, "hash");
  v6 = -[NSString hash](self->_previousSystemBuild, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v7 = 2654435761u * self->_buildInstallationTimestampInSecondsSince1970;
  else
    v7 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_assetSetId)
  {
    -[ODDSiriSchemaODDAssetAvailabilityFromBootDimensions assetSetId](self, "assetSetId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("assetSetId"));

  }
  if (self->_assetSetName)
  {
    -[ODDSiriSchemaODDAssetAvailabilityFromBootDimensions assetSetName](self, "assetSetName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("assetSetName"));

  }
  if (self->_assistantDimensions)
  {
    -[ODDSiriSchemaODDAssetAvailabilityFromBootDimensions assistantDimensions](self, "assistantDimensions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("assistantDimensions"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("assistantDimensions"));

    }
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[ODDSiriSchemaODDAssetAvailabilityFromBootDimensions buildInstallationTimestampInSecondsSince1970](self, "buildInstallationTimestampInSecondsSince1970"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("buildInstallationTimestampInSecondsSince1970"));

  }
  if (self->_previousSystemBuild)
  {
    -[ODDSiriSchemaODDAssetAvailabilityFromBootDimensions previousSystemBuild](self, "previousSystemBuild");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("previousSystemBuild"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[ODDSiriSchemaODDAssetAvailabilityFromBootDimensions dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (ODDSiriSchemaODDAssetAvailabilityFromBootDimensions)initWithJSON:(id)a3
{
  void *v4;
  ODDSiriSchemaODDAssetAvailabilityFromBootDimensions *v5;
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
    self = -[ODDSiriSchemaODDAssetAvailabilityFromBootDimensions initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (ODDSiriSchemaODDAssetAvailabilityFromBootDimensions)initWithDictionary:(id)a3
{
  id v4;
  ODDSiriSchemaODDAssetAvailabilityFromBootDimensions *v5;
  void *v6;
  ODDSiriSchemaODDAssistantDimensions *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  ODDSiriSchemaODDAssetAvailabilityFromBootDimensions *v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)ODDSiriSchemaODDAssetAvailabilityFromBootDimensions;
  v5 = -[ODDSiriSchemaODDAssetAvailabilityFromBootDimensions init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("assistantDimensions"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[ODDSiriSchemaODDAssistantDimensions initWithDictionary:]([ODDSiriSchemaODDAssistantDimensions alloc], "initWithDictionary:", v6);
      -[ODDSiriSchemaODDAssetAvailabilityFromBootDimensions setAssistantDimensions:](v5, "setAssistantDimensions:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("assetSetId"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[ODDSiriSchemaODDAssetAvailabilityFromBootDimensions setAssetSetId:](v5, "setAssetSetId:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("assetSetName"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = (void *)objc_msgSend(v10, "copy");
      -[ODDSiriSchemaODDAssetAvailabilityFromBootDimensions setAssetSetName:](v5, "setAssetSetName:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("previousSystemBuild"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = (void *)objc_msgSend(v12, "copy");
      -[ODDSiriSchemaODDAssetAvailabilityFromBootDimensions setPreviousSystemBuild:](v5, "setPreviousSystemBuild:", v13);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("buildInstallationTimestampInSecondsSince1970"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ODDSiriSchemaODDAssetAvailabilityFromBootDimensions setBuildInstallationTimestampInSecondsSince1970:](v5, "setBuildInstallationTimestampInSecondsSince1970:", objc_msgSend(v14, "unsignedLongLongValue"));
    v15 = v5;

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

- (NSString)assetSetId
{
  return self->_assetSetId;
}

- (void)setAssetSetId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)assetSetName
{
  return self->_assetSetName;
}

- (void)setAssetSetName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)previousSystemBuild
{
  return self->_previousSystemBuild;
}

- (void)setPreviousSystemBuild:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (unint64_t)buildInstallationTimestampInSecondsSince1970
{
  return self->_buildInstallationTimestampInSecondsSince1970;
}

- (void)setHasAssistantDimensions:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasAssetSetId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void)setHasAssetSetName:(BOOL)a3
{
  *((_BYTE *)&self->_has + 3) = a3;
}

- (void)setHasPreviousSystemBuild:(BOOL)a3
{
  self->_hasAssistantDimensions = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousSystemBuild, 0);
  objc_storeStrong((id *)&self->_assetSetName, 0);
  objc_storeStrong((id *)&self->_assetSetId, 0);
  objc_storeStrong((id *)&self->_assistantDimensions, 0);
}

@end
