@implementation ODDSiriSchemaODDRequestsWithoutAssetsDimensions

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
  v9.super_class = (Class)ODDSiriSchemaODDRequestsWithoutAssetsDimensions;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ODDSiriSchemaODDRequestsWithoutAssetsDimensions assistantDimensions](self, "assistantDimensions", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[ODDSiriSchemaODDRequestsWithoutAssetsDimensions deleteAssistantDimensions](self, "deleteAssistantDimensions");
  return v5;
}

- (BOOL)hasAssistantDimensions
{
  return self->_assistantDimensions != 0;
}

- (void)deleteAssistantDimensions
{
  -[ODDSiriSchemaODDRequestsWithoutAssetsDimensions setAssistantDimensions:](self, "setAssistantDimensions:", 0);
}

- (BOOL)hasAssetSetId
{
  return self->_assetSetId != 0;
}

- (void)deleteAssetSetId
{
  -[ODDSiriSchemaODDRequestsWithoutAssetsDimensions setAssetSetId:](self, "setAssetSetId:", 0);
}

- (BOOL)hasAssetSetName
{
  return self->_assetSetName != 0;
}

- (void)deleteAssetSetName
{
  -[ODDSiriSchemaODDRequestsWithoutAssetsDimensions setAssetSetName:](self, "setAssetSetName:", 0);
}

- (BOOL)hasPreviousSystemBuild
{
  return self->_previousSystemBuild != 0;
}

- (void)deletePreviousSystemBuild
{
  -[ODDSiriSchemaODDRequestsWithoutAssetsDimensions setPreviousSystemBuild:](self, "setPreviousSystemBuild:", 0);
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
  -[ODDSiriSchemaODDRequestsWithoutAssetsDimensions setBuildInstallationTimestampInSecondsSince1970:](self, "setBuildInstallationTimestampInSecondsSince1970:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)clearAssetFailureReason
{
  -[NSArray removeAllObjects](self->_assetFailureReasons, "removeAllObjects");
}

- (void)addAssetFailureReason:(int)a3
{
  uint64_t v3;
  NSArray *assetFailureReasons;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v3 = *(_QWORD *)&a3;
  assetFailureReasons = self->_assetFailureReasons;
  if (!assetFailureReasons)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_assetFailureReasons;
    self->_assetFailureReasons = v6;

    assetFailureReasons = self->_assetFailureReasons;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSArray addObject:](assetFailureReasons, "addObject:", v8);

}

- (unint64_t)assetFailureReasonCount
{
  return -[NSArray count](self->_assetFailureReasons, "count");
}

- (int)assetFailureReasonAtIndex:(unint64_t)a3
{
  void *v3;
  int v4;

  -[NSArray objectAtIndexedSubscript:](self->_assetFailureReasons, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ODDSiriSchemaODDRequestsWithoutAssetsDimensionsReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ODDSiriSchemaODDRequestsWithoutAssetsDimensions assistantDimensions](self, "assistantDimensions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[ODDSiriSchemaODDRequestsWithoutAssetsDimensions assistantDimensions](self, "assistantDimensions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ODDSiriSchemaODDRequestsWithoutAssetsDimensions assetSetId](self, "assetSetId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    PBDataWriterWriteStringField();
  -[ODDSiriSchemaODDRequestsWithoutAssetsDimensions assetSetName](self, "assetSetName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    PBDataWriterWriteStringField();
  -[ODDSiriSchemaODDRequestsWithoutAssetsDimensions previousSystemBuild](self, "previousSystemBuild");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field();
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = self->_assetFailureReasons;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v14), "intValue", (_QWORD)v15);
        PBDataWriterWriteInt32Field();
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v12);
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
  unint64_t buildInstallationTimestampInSecondsSince1970;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  char v32;
  BOOL v33;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_30;
  -[ODDSiriSchemaODDRequestsWithoutAssetsDimensions assistantDimensions](self, "assistantDimensions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assistantDimensions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_29;
  -[ODDSiriSchemaODDRequestsWithoutAssetsDimensions assistantDimensions](self, "assistantDimensions");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[ODDSiriSchemaODDRequestsWithoutAssetsDimensions assistantDimensions](self, "assistantDimensions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "assistantDimensions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_30;
  }
  else
  {

  }
  -[ODDSiriSchemaODDRequestsWithoutAssetsDimensions assetSetId](self, "assetSetId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assetSetId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_29;
  -[ODDSiriSchemaODDRequestsWithoutAssetsDimensions assetSetId](self, "assetSetId");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[ODDSiriSchemaODDRequestsWithoutAssetsDimensions assetSetId](self, "assetSetId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "assetSetId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_30;
  }
  else
  {

  }
  -[ODDSiriSchemaODDRequestsWithoutAssetsDimensions assetSetName](self, "assetSetName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assetSetName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_29;
  -[ODDSiriSchemaODDRequestsWithoutAssetsDimensions assetSetName](self, "assetSetName");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[ODDSiriSchemaODDRequestsWithoutAssetsDimensions assetSetName](self, "assetSetName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "assetSetName");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_30;
  }
  else
  {

  }
  -[ODDSiriSchemaODDRequestsWithoutAssetsDimensions previousSystemBuild](self, "previousSystemBuild");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "previousSystemBuild");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_29;
  -[ODDSiriSchemaODDRequestsWithoutAssetsDimensions previousSystemBuild](self, "previousSystemBuild");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[ODDSiriSchemaODDRequestsWithoutAssetsDimensions previousSystemBuild](self, "previousSystemBuild");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "previousSystemBuild");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_30;
  }
  else
  {

  }
  if ((*(_BYTE *)&self->_has & 1) != (v4[56] & 1))
    goto LABEL_30;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    buildInstallationTimestampInSecondsSince1970 = self->_buildInstallationTimestampInSecondsSince1970;
    if (buildInstallationTimestampInSecondsSince1970 != objc_msgSend(v4, "buildInstallationTimestampInSecondsSince1970"))goto LABEL_30;
  }
  -[ODDSiriSchemaODDRequestsWithoutAssetsDimensions assetFailureReasons](self, "assetFailureReasons");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assetFailureReasons");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[ODDSiriSchemaODDRequestsWithoutAssetsDimensions assetFailureReasons](self, "assetFailureReasons");
    v28 = objc_claimAutoreleasedReturnValue();
    if (!v28)
    {

LABEL_33:
      v33 = 1;
      goto LABEL_31;
    }
    v29 = (void *)v28;
    -[ODDSiriSchemaODDRequestsWithoutAssetsDimensions assetFailureReasons](self, "assetFailureReasons");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "assetFailureReasons");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v30, "isEqual:", v31);

    if ((v32 & 1) != 0)
      goto LABEL_33;
  }
  else
  {
LABEL_29:

  }
LABEL_30:
  v33 = 0;
LABEL_31:

  return v33;
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
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ -[NSArray hash](self->_assetFailureReasons, "hash");
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
  if (-[NSArray count](self->_assetFailureReasons, "count"))
  {
    -[ODDSiriSchemaODDRequestsWithoutAssetsDimensions assetFailureReasons](self, "assetFailureReasons");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("assetFailureReason"));

  }
  if (self->_assetSetId)
  {
    -[ODDSiriSchemaODDRequestsWithoutAssetsDimensions assetSetId](self, "assetSetId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("assetSetId"));

  }
  if (self->_assetSetName)
  {
    -[ODDSiriSchemaODDRequestsWithoutAssetsDimensions assetSetName](self, "assetSetName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("assetSetName"));

  }
  if (self->_assistantDimensions)
  {
    -[ODDSiriSchemaODDRequestsWithoutAssetsDimensions assistantDimensions](self, "assistantDimensions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("assistantDimensions"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("assistantDimensions"));

    }
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[ODDSiriSchemaODDRequestsWithoutAssetsDimensions buildInstallationTimestampInSecondsSince1970](self, "buildInstallationTimestampInSecondsSince1970"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("buildInstallationTimestampInSecondsSince1970"));

  }
  if (self->_previousSystemBuild)
  {
    -[ODDSiriSchemaODDRequestsWithoutAssetsDimensions previousSystemBuild](self, "previousSystemBuild");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("previousSystemBuild"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[ODDSiriSchemaODDRequestsWithoutAssetsDimensions dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (ODDSiriSchemaODDRequestsWithoutAssetsDimensions)initWithJSON:(id)a3
{
  void *v4;
  ODDSiriSchemaODDRequestsWithoutAssetsDimensions *v5;
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
    self = -[ODDSiriSchemaODDRequestsWithoutAssetsDimensions initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (ODDSiriSchemaODDRequestsWithoutAssetsDimensions)initWithDictionary:(id)a3
{
  id v4;
  ODDSiriSchemaODDRequestsWithoutAssetsDimensions *v5;
  void *v6;
  ODDSiriSchemaODDAssistantDimensions *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  ODDSiriSchemaODDRequestsWithoutAssetsDimensions *v22;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  objc_super v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)ODDSiriSchemaODDRequestsWithoutAssetsDimensions;
  v5 = -[ODDSiriSchemaODDRequestsWithoutAssetsDimensions init](&v32, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("assistantDimensions"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[ODDSiriSchemaODDAssistantDimensions initWithDictionary:]([ODDSiriSchemaODDAssistantDimensions alloc], "initWithDictionary:", v6);
      -[ODDSiriSchemaODDRequestsWithoutAssetsDimensions setAssistantDimensions:](v5, "setAssistantDimensions:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("assetSetId"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[ODDSiriSchemaODDRequestsWithoutAssetsDimensions setAssetSetId:](v5, "setAssetSetId:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("assetSetName"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = (void *)objc_msgSend(v10, "copy");
      -[ODDSiriSchemaODDRequestsWithoutAssetsDimensions setAssetSetName:](v5, "setAssetSetName:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("previousSystemBuild"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = (void *)objc_msgSend(v12, "copy");
      -[ODDSiriSchemaODDRequestsWithoutAssetsDimensions setPreviousSystemBuild:](v5, "setPreviousSystemBuild:", v13);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("buildInstallationTimestampInSecondsSince1970"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ODDSiriSchemaODDRequestsWithoutAssetsDimensions setBuildInstallationTimestampInSecondsSince1970:](v5, "setBuildInstallationTimestampInSecondsSince1970:", objc_msgSend(v14, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("assetFailureReason"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v24 = v12;
      v25 = v10;
      v26 = v8;
      v27 = v6;
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v16 = v15;
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v29;
        do
        {
          v20 = 0;
          do
          {
            if (*(_QWORD *)v29 != v19)
              objc_enumerationMutation(v16);
            v21 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v20);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              -[ODDSiriSchemaODDRequestsWithoutAssetsDimensions addAssetFailureReason:](v5, "addAssetFailureReason:", objc_msgSend(v21, "intValue"));
            ++v20;
          }
          while (v18 != v20);
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
        }
        while (v18);
      }

      v8 = v26;
      v6 = v27;
      v12 = v24;
      v10 = v25;
    }
    v22 = v5;

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

- (NSArray)assetFailureReasons
{
  return self->_assetFailureReasons;
}

- (void)setAssetFailureReasons:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
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
  objc_storeStrong((id *)&self->_assetFailureReasons, 0);
  objc_storeStrong((id *)&self->_previousSystemBuild, 0);
  objc_storeStrong((id *)&self->_assetSetName, 0);
  objc_storeStrong((id *)&self->_assetSetId, 0);
  objc_storeStrong((id *)&self->_assistantDimensions, 0);
}

@end
