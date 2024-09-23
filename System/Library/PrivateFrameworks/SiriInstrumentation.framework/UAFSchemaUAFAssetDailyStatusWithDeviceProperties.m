@implementation UAFSchemaUAFAssetDailyStatusWithDeviceProperties

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
  v13.super_class = (Class)UAFSchemaUAFAssetDailyStatusWithDeviceProperties;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v13, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UAFSchemaUAFAssetDailyStatusWithDeviceProperties deviceMetadata](self, "deviceMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[UAFSchemaUAFAssetDailyStatusWithDeviceProperties deleteDeviceMetadata](self, "deleteDeviceMetadata");
  -[UAFSchemaUAFAssetDailyStatusWithDeviceProperties availableAssetDailyStatus](self, "availableAssetDailyStatus");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[UAFSchemaUAFAssetDailyStatusWithDeviceProperties deleteAvailableAssetDailyStatus](self, "deleteAvailableAssetDailyStatus");

  return v5;
}

- (BOOL)hasDeviceMetadata
{
  return self->_deviceMetadata != 0;
}

- (void)deleteDeviceMetadata
{
  -[UAFSchemaUAFAssetDailyStatusWithDeviceProperties setDeviceMetadata:](self, "setDeviceMetadata:", 0);
}

- (void)setAvailableAssetDailyStatus:(id)a3
{
  unint64_t v3;

  v3 = 101;
  if (!a3)
    v3 = 0;
  self->_whichEvent = v3;
  objc_storeStrong((id *)&self->_availableAssetDailyStatus, a3);
}

- (SADSchemaSADAvailableAssetDailyStatus)availableAssetDailyStatus
{
  if (self->_whichEvent == 101)
    return self->_availableAssetDailyStatus;
  else
    return (SADSchemaSADAvailableAssetDailyStatus *)0;
}

- (void)deleteAvailableAssetDailyStatus
{
  SADSchemaSADAvailableAssetDailyStatus *availableAssetDailyStatus;

  if (self->_whichEvent == 101)
  {
    self->_whichEvent = 0;
    availableAssetDailyStatus = self->_availableAssetDailyStatus;
    self->_availableAssetDailyStatus = 0;

  }
}

- (BOOL)readFrom:(id)a3
{
  return UAFSchemaUAFAssetDailyStatusWithDevicePropertiesReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[UAFSchemaUAFAssetDailyStatusWithDeviceProperties deviceMetadata](self, "deviceMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[UAFSchemaUAFAssetDailyStatusWithDeviceProperties deviceMetadata](self, "deviceMetadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[UAFSchemaUAFAssetDailyStatusWithDeviceProperties availableAssetDailyStatus](self, "availableAssetDailyStatus");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[UAFSchemaUAFAssetDailyStatusWithDeviceProperties availableAssetDailyStatus](self, "availableAssetDailyStatus");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t whichEvent;
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
  char v17;
  BOOL v18;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_13;
  whichEvent = self->_whichEvent;
  if (whichEvent != objc_msgSend(v4, "whichEvent"))
    goto LABEL_13;
  -[UAFSchemaUAFAssetDailyStatusWithDeviceProperties deviceMetadata](self, "deviceMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deviceMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_12;
  -[UAFSchemaUAFAssetDailyStatusWithDeviceProperties deviceMetadata](self, "deviceMetadata");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[UAFSchemaUAFAssetDailyStatusWithDeviceProperties deviceMetadata](self, "deviceMetadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deviceMetadata");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_13;
  }
  else
  {

  }
  -[UAFSchemaUAFAssetDailyStatusWithDeviceProperties availableAssetDailyStatus](self, "availableAssetDailyStatus");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "availableAssetDailyStatus");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[UAFSchemaUAFAssetDailyStatusWithDeviceProperties availableAssetDailyStatus](self, "availableAssetDailyStatus");
    v13 = objc_claimAutoreleasedReturnValue();
    if (!v13)
    {

LABEL_16:
      v18 = 1;
      goto LABEL_14;
    }
    v14 = (void *)v13;
    -[UAFSchemaUAFAssetDailyStatusWithDeviceProperties availableAssetDailyStatus](self, "availableAssetDailyStatus");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "availableAssetDailyStatus");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if ((v17 & 1) != 0)
      goto LABEL_16;
  }
  else
  {
LABEL_12:

  }
LABEL_13:
  v18 = 0;
LABEL_14:

  return v18;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[UAFSchemaUAFDeviceMetadata hash](self->_deviceMetadata, "hash");
  return -[SADSchemaSADAvailableAssetDailyStatus hash](self->_availableAssetDailyStatus, "hash") ^ v3;
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
  if (self->_availableAssetDailyStatus)
  {
    -[UAFSchemaUAFAssetDailyStatusWithDeviceProperties availableAssetDailyStatus](self, "availableAssetDailyStatus");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("availableAssetDailyStatus"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("availableAssetDailyStatus"));

    }
  }
  if (self->_deviceMetadata)
  {
    -[UAFSchemaUAFAssetDailyStatusWithDeviceProperties deviceMetadata](self, "deviceMetadata");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("deviceMetadata"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("deviceMetadata"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[UAFSchemaUAFAssetDailyStatusWithDeviceProperties dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (UAFSchemaUAFAssetDailyStatusWithDeviceProperties)initWithJSON:(id)a3
{
  void *v4;
  UAFSchemaUAFAssetDailyStatusWithDeviceProperties *v5;
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
    self = -[UAFSchemaUAFAssetDailyStatusWithDeviceProperties initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (UAFSchemaUAFAssetDailyStatusWithDeviceProperties)initWithDictionary:(id)a3
{
  id v4;
  UAFSchemaUAFAssetDailyStatusWithDeviceProperties *v5;
  void *v6;
  UAFSchemaUAFDeviceMetadata *v7;
  void *v8;
  SADSchemaSADAvailableAssetDailyStatus *v9;
  UAFSchemaUAFAssetDailyStatusWithDeviceProperties *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)UAFSchemaUAFAssetDailyStatusWithDeviceProperties;
  v5 = -[UAFSchemaUAFAssetDailyStatusWithDeviceProperties init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deviceMetadata"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[UAFSchemaUAFDeviceMetadata initWithDictionary:]([UAFSchemaUAFDeviceMetadata alloc], "initWithDictionary:", v6);
      -[UAFSchemaUAFAssetDailyStatusWithDeviceProperties setDeviceMetadata:](v5, "setDeviceMetadata:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("availableAssetDailyStatus"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[SADSchemaSADAvailableAssetDailyStatus initWithDictionary:]([SADSchemaSADAvailableAssetDailyStatus alloc], "initWithDictionary:", v8);
      -[UAFSchemaUAFAssetDailyStatusWithDeviceProperties setAvailableAssetDailyStatus:](v5, "setAvailableAssetDailyStatus:", v9);

    }
    v10 = v5;

  }
  return v5;
}

- (unint64_t)whichEvent
{
  return self->_whichEvent;
}

- (UAFSchemaUAFDeviceMetadata)deviceMetadata
{
  return self->_deviceMetadata;
}

- (void)setDeviceMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_deviceMetadata, a3);
}

- (void)setHasDeviceMetadata:(BOOL)a3
{
  self->_hasDeviceMetadata = a3;
}

- (BOOL)hasAvailableAssetDailyStatus
{
  return self->_hasAvailableAssetDailyStatus;
}

- (void)setHasAvailableAssetDailyStatus:(BOOL)a3
{
  self->_hasAvailableAssetDailyStatus = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_availableAssetDailyStatus, 0);
  objc_storeStrong((id *)&self->_deviceMetadata, 0);
}

@end
