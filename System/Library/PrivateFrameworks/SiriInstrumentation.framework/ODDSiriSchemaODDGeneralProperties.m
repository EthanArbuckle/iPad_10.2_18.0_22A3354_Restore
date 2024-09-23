@implementation ODDSiriSchemaODDGeneralProperties

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
  v13.super_class = (Class)ODDSiriSchemaODDGeneralProperties;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v13, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ODDSiriSchemaODDGeneralProperties systemLocale](self, "systemLocale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[ODDSiriSchemaODDGeneralProperties deleteSystemLocale](self, "deleteSystemLocale");
  -[ODDSiriSchemaODDGeneralProperties assetSetStatus](self, "assetSetStatus");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[ODDSiriSchemaODDGeneralProperties deleteAssetSetStatus](self, "deleteAssetSetStatus");

  return v5;
}

- (BOOL)hasSystemLocale
{
  return self->_systemLocale != 0;
}

- (void)deleteSystemLocale
{
  -[ODDSiriSchemaODDGeneralProperties setSystemLocale:](self, "setSystemLocale:", 0);
}

- (void)setStorefrontId:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_storefrontId = a3;
}

- (BOOL)hasStorefrontId
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasStorefrontId:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteStorefrontId
{
  -[ODDSiriSchemaODDGeneralProperties setStorefrontId:](self, "setStorefrontId:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setUTCOffset:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_UTCOffset = a3;
}

- (BOOL)hasUTCOffset
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasUTCOffset:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteUTCOffset
{
  -[ODDSiriSchemaODDGeneralProperties setUTCOffset:](self, "setUTCOffset:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)hasDeviceType
{
  return self->_deviceType != 0;
}

- (void)deleteDeviceType
{
  -[ODDSiriSchemaODDGeneralProperties setDeviceType:](self, "setDeviceType:", 0);
}

- (BOOL)hasModelNumber
{
  return self->_modelNumber != 0;
}

- (void)deleteModelNumber
{
  -[ODDSiriSchemaODDGeneralProperties setModelNumber:](self, "setModelNumber:", 0);
}

- (BOOL)hasDeviceOS
{
  return self->_deviceOS != 0;
}

- (void)deleteDeviceOS
{
  -[ODDSiriSchemaODDGeneralProperties setDeviceOS:](self, "setDeviceOS:", 0);
}

- (void)setIsStoreDemoMode:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_isStoreDemoMode = a3;
}

- (BOOL)hasIsStoreDemoMode
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasIsStoreDemoMode:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteIsStoreDemoMode
{
  -[ODDSiriSchemaODDGeneralProperties setIsStoreDemoMode:](self, "setIsStoreDemoMode:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (void)setBuildInstallationTimestampInSecondsSince1970:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_buildInstallationTimestampInSecondsSince1970 = a3;
}

- (BOOL)hasBuildInstallationTimestampInSecondsSince1970
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasBuildInstallationTimestampInSecondsSince1970:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)deleteBuildInstallationTimestampInSecondsSince1970
{
  -[ODDSiriSchemaODDGeneralProperties setBuildInstallationTimestampInSecondsSince1970:](self, "setBuildInstallationTimestampInSecondsSince1970:", 0);
  *(_BYTE *)&self->_has &= ~8u;
}

- (BOOL)hasAssetSetStatus
{
  return self->_assetSetStatus != 0;
}

- (void)deleteAssetSetStatus
{
  -[ODDSiriSchemaODDGeneralProperties setAssetSetStatus:](self, "setAssetSetStatus:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return ODDSiriSchemaODDGeneralPropertiesReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  char has;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  -[ODDSiriSchemaODDGeneralProperties systemLocale](self, "systemLocale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[ODDSiriSchemaODDGeneralProperties systemLocale](self, "systemLocale");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteInt32Field();
  -[ODDSiriSchemaODDGeneralProperties deviceType](self, "deviceType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    PBDataWriterWriteStringField();
  -[ODDSiriSchemaODDGeneralProperties modelNumber](self, "modelNumber");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    PBDataWriterWriteStringField();
  -[ODDSiriSchemaODDGeneralProperties deviceOS](self, "deviceOS");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    PBDataWriterWriteStringField();
  v10 = (char)self->_has;
  if ((v10 & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    v10 = (char)self->_has;
  }
  if ((v10 & 8) != 0)
    PBDataWriterWriteUint64Field();
  -[ODDSiriSchemaODDGeneralProperties assetSetStatus](self, "assetSetStatus");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = v14;
  if (v11)
  {
    -[ODDSiriSchemaODDGeneralProperties assetSetStatus](self, "assetSetStatus");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v12 = v14;
  }

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  $911EABDD144D96B5C286D3B90FC5BECC has;
  unsigned int v13;
  int storefrontId;
  int v15;
  int UTCOffset;
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
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  $911EABDD144D96B5C286D3B90FC5BECC v32;
  int v33;
  unsigned int v34;
  int isStoreDemoMode;
  int v36;
  unint64_t buildInstallationTimestampInSecondsSince1970;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  char v42;
  BOOL v43;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_41;
  -[ODDSiriSchemaODDGeneralProperties systemLocale](self, "systemLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "systemLocale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_40;
  -[ODDSiriSchemaODDGeneralProperties systemLocale](self, "systemLocale");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[ODDSiriSchemaODDGeneralProperties systemLocale](self, "systemLocale");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "systemLocale");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_41;
  }
  else
  {

  }
  has = self->_has;
  v13 = v4[72];
  if ((*(_BYTE *)&has & 1) != (v13 & 1))
    goto LABEL_41;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    storefrontId = self->_storefrontId;
    if (storefrontId != objc_msgSend(v4, "storefrontId"))
      goto LABEL_41;
    has = self->_has;
    v13 = v4[72];
  }
  v15 = (*(unsigned int *)&has >> 1) & 1;
  if (v15 != ((v13 >> 1) & 1))
    goto LABEL_41;
  if (v15)
  {
    UTCOffset = self->_UTCOffset;
    if (UTCOffset != objc_msgSend(v4, "UTCOffset"))
      goto LABEL_41;
  }
  -[ODDSiriSchemaODDGeneralProperties deviceType](self, "deviceType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deviceType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_40;
  -[ODDSiriSchemaODDGeneralProperties deviceType](self, "deviceType");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[ODDSiriSchemaODDGeneralProperties deviceType](self, "deviceType");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deviceType");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_41;
  }
  else
  {

  }
  -[ODDSiriSchemaODDGeneralProperties modelNumber](self, "modelNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "modelNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_40;
  -[ODDSiriSchemaODDGeneralProperties modelNumber](self, "modelNumber");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[ODDSiriSchemaODDGeneralProperties modelNumber](self, "modelNumber");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "modelNumber");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_41;
  }
  else
  {

  }
  -[ODDSiriSchemaODDGeneralProperties deviceOS](self, "deviceOS");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deviceOS");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_40;
  -[ODDSiriSchemaODDGeneralProperties deviceOS](self, "deviceOS");
  v27 = objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v28 = (void *)v27;
    -[ODDSiriSchemaODDGeneralProperties deviceOS](self, "deviceOS");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deviceOS");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "isEqual:", v30);

    if (!v31)
      goto LABEL_41;
  }
  else
  {

  }
  v32 = self->_has;
  v33 = (*(unsigned int *)&v32 >> 2) & 1;
  v34 = v4[72];
  if (v33 != ((v34 >> 2) & 1))
    goto LABEL_41;
  if (v33)
  {
    isStoreDemoMode = self->_isStoreDemoMode;
    if (isStoreDemoMode != objc_msgSend(v4, "isStoreDemoMode"))
      goto LABEL_41;
    v32 = self->_has;
    v34 = v4[72];
  }
  v36 = (*(unsigned int *)&v32 >> 3) & 1;
  if (v36 != ((v34 >> 3) & 1))
    goto LABEL_41;
  if (v36)
  {
    buildInstallationTimestampInSecondsSince1970 = self->_buildInstallationTimestampInSecondsSince1970;
    if (buildInstallationTimestampInSecondsSince1970 != objc_msgSend(v4, "buildInstallationTimestampInSecondsSince1970"))goto LABEL_41;
  }
  -[ODDSiriSchemaODDGeneralProperties assetSetStatus](self, "assetSetStatus");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assetSetStatus");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_40:

    goto LABEL_41;
  }
  -[ODDSiriSchemaODDGeneralProperties assetSetStatus](self, "assetSetStatus");
  v38 = objc_claimAutoreleasedReturnValue();
  if (!v38)
  {

LABEL_44:
    v43 = 1;
    goto LABEL_42;
  }
  v39 = (void *)v38;
  -[ODDSiriSchemaODDGeneralProperties assetSetStatus](self, "assetSetStatus");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assetSetStatus");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v40, "isEqual:", v41);

  if ((v42 & 1) != 0)
    goto LABEL_44;
LABEL_41:
  v43 = 0;
LABEL_42:

  return v43;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  uint64_t v9;
  unint64_t v10;

  v3 = -[SISchemaISOLocale hash](self->_systemLocale, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = 2654435761 * self->_storefrontId;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  else
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v5 = 2654435761 * self->_UTCOffset;
      goto LABEL_6;
    }
  }
  v5 = 0;
LABEL_6:
  v6 = -[NSString hash](self->_deviceType, "hash");
  v7 = -[NSString hash](self->_modelNumber, "hash");
  v8 = -[NSString hash](self->_deviceOS, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v9 = 2654435761 * self->_isStoreDemoMode;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_8;
LABEL_10:
    v10 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ -[UAFSchemaUAFAssetSetStatus hash](self->_assetSetStatus, "hash");
  }
  v9 = 0;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_10;
LABEL_8:
  v10 = 2654435761u * self->_buildInstallationTimestampInSecondsSince1970;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ -[UAFSchemaUAFAssetSetStatus hash](self->_assetSetStatus, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  unsigned int v4;
  const __CFString *v5;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v4 = -[ODDSiriSchemaODDGeneralProperties UTCOffset](self, "UTCOffset") - 1;
    if (v4 > 0x25)
      v5 = CFSTR("UTCOFFSET_UNKNOWN");
    else
      v5 = off_1E563BDC8[v4];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("UTCOffset"));
  }
  if (self->_assetSetStatus)
  {
    -[ODDSiriSchemaODDGeneralProperties assetSetStatus](self, "assetSetStatus");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("assetSetStatus"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("assetSetStatus"));

    }
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[ODDSiriSchemaODDGeneralProperties buildInstallationTimestampInSecondsSince1970](self, "buildInstallationTimestampInSecondsSince1970"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("buildInstallationTimestampInSecondsSince1970"));

  }
  if (self->_deviceOS)
  {
    -[ODDSiriSchemaODDGeneralProperties deviceOS](self, "deviceOS");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("deviceOS"));

  }
  if (self->_deviceType)
  {
    -[ODDSiriSchemaODDGeneralProperties deviceType](self, "deviceType");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("deviceType"));

  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ODDSiriSchemaODDGeneralProperties isStoreDemoMode](self, "isStoreDemoMode"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("isStoreDemoMode"));

  }
  if (self->_modelNumber)
  {
    -[ODDSiriSchemaODDGeneralProperties modelNumber](self, "modelNumber");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("modelNumber"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[ODDSiriSchemaODDGeneralProperties storefrontId](self, "storefrontId"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("storefrontId"));

  }
  if (self->_systemLocale)
  {
    -[ODDSiriSchemaODDGeneralProperties systemLocale](self, "systemLocale");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "dictionaryRepresentation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("systemLocale"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("systemLocale"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[ODDSiriSchemaODDGeneralProperties dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (ODDSiriSchemaODDGeneralProperties)initWithJSON:(id)a3
{
  void *v4;
  ODDSiriSchemaODDGeneralProperties *v5;
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
    self = -[ODDSiriSchemaODDGeneralProperties initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (ODDSiriSchemaODDGeneralProperties)initWithDictionary:(id)a3
{
  id v4;
  ODDSiriSchemaODDGeneralProperties *v5;
  uint64_t v6;
  SISchemaISOLocale *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  UAFSchemaUAFAssetSetStatus *v19;
  ODDSiriSchemaODDGeneralProperties *v20;
  void *v22;
  void *v23;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)ODDSiriSchemaODDGeneralProperties;
  v5 = -[ODDSiriSchemaODDGeneralProperties init](&v24, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("systemLocale"));
    v6 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaISOLocale initWithDictionary:]([SISchemaISOLocale alloc], "initWithDictionary:", v6);
      -[ODDSiriSchemaODDGeneralProperties setSystemLocale:](v5, "setSystemLocale:", v7);

    }
    v23 = (void *)v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("storefrontId"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ODDSiriSchemaODDGeneralProperties setStorefrontId:](v5, "setStorefrontId:", objc_msgSend(v8, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("UTCOffset"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ODDSiriSchemaODDGeneralProperties setUTCOffset:](v5, "setUTCOffset:", objc_msgSend(v9, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deviceType"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = (void *)objc_msgSend(v10, "copy");
      -[ODDSiriSchemaODDGeneralProperties setDeviceType:](v5, "setDeviceType:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("modelNumber"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = (void *)objc_msgSend(v12, "copy");
      -[ODDSiriSchemaODDGeneralProperties setModelNumber:](v5, "setModelNumber:", v13);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deviceOS"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = (void *)objc_msgSend(v14, "copy");
      -[ODDSiriSchemaODDGeneralProperties setDeviceOS:](v5, "setDeviceOS:", v15);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isStoreDemoMode"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ODDSiriSchemaODDGeneralProperties setIsStoreDemoMode:](v5, "setIsStoreDemoMode:", objc_msgSend(v16, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("buildInstallationTimestampInSecondsSince1970"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ODDSiriSchemaODDGeneralProperties setBuildInstallationTimestampInSecondsSince1970:](v5, "setBuildInstallationTimestampInSecondsSince1970:", objc_msgSend(v17, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("assetSetStatus"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = -[UAFSchemaUAFAssetSetStatus initWithDictionary:]([UAFSchemaUAFAssetSetStatus alloc], "initWithDictionary:", v18);
      -[ODDSiriSchemaODDGeneralProperties setAssetSetStatus:](v5, "setAssetSetStatus:", v19);

    }
    v20 = v5;

  }
  return v5;
}

- (SISchemaISOLocale)systemLocale
{
  return self->_systemLocale;
}

- (void)setSystemLocale:(id)a3
{
  objc_storeStrong((id *)&self->_systemLocale, a3);
}

- (int)storefrontId
{
  return self->_storefrontId;
}

- (int)UTCOffset
{
  return self->_UTCOffset;
}

- (NSString)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)modelNumber
{
  return self->_modelNumber;
}

- (void)setModelNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)deviceOS
{
  return self->_deviceOS;
}

- (void)setDeviceOS:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)isStoreDemoMode
{
  return self->_isStoreDemoMode;
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

- (void)setHasSystemLocale:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasDeviceType:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void)setHasModelNumber:(BOOL)a3
{
  *((_BYTE *)&self->_has + 3) = a3;
}

- (void)setHasDeviceOS:(BOOL)a3
{
  self->_hasSystemLocale = a3;
}

- (void)setHasAssetSetStatus:(BOOL)a3
{
  self->_hasDeviceType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetSetStatus, 0);
  objc_storeStrong((id *)&self->_deviceOS, 0);
  objc_storeStrong((id *)&self->_modelNumber, 0);
  objc_storeStrong((id *)&self->_deviceType, 0);
  objc_storeStrong((id *)&self->_systemLocale, 0);
}

@end
