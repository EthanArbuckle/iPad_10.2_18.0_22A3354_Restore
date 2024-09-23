@implementation UAFSchemaUAFAsset

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (BOOL)hasAssetName
{
  return self->_assetName != 0;
}

- (void)deleteAssetName
{
  -[UAFSchemaUAFAsset setAssetName:](self, "setAssetName:", 0);
}

- (BOOL)hasAssetSpecifier
{
  return self->_assetSpecifier != 0;
}

- (void)deleteAssetSpecifier
{
  -[UAFSchemaUAFAsset setAssetSpecifier:](self, "setAssetSpecifier:", 0);
}

- (BOOL)hasAssetVersion
{
  return self->_assetVersion != 0;
}

- (void)deleteAssetVersion
{
  -[UAFSchemaUAFAsset setAssetVersion:](self, "setAssetVersion:", 0);
}

- (void)setAssetLocale:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_assetLocale = a3;
}

- (BOOL)hasAssetLocale
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasAssetLocale:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteAssetLocale
{
  -[UAFSchemaUAFAsset setAssetLocale:](self, "setAssetLocale:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setAssetSource:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_assetSource = a3;
}

- (BOOL)hasAssetSource
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasAssetSource:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteAssetSource
{
  -[UAFSchemaUAFAsset setAssetSource:](self, "setAssetSource:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setAssetSizeOnDisk:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_assetSizeOnDisk = a3;
}

- (BOOL)hasAssetSizeOnDisk
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasAssetSizeOnDisk:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteAssetSizeOnDisk
{
  -[UAFSchemaUAFAsset setAssetSizeOnDisk:](self, "setAssetSizeOnDisk:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (void)setIsAssetPathValid:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_isAssetPathValid = a3;
}

- (BOOL)hasIsAssetPathValid
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasIsAssetPathValid:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)deleteIsAssetPathValid
{
  -[UAFSchemaUAFAsset setIsAssetPathValid:](self, "setIsAssetPathValid:", 0);
  *(_BYTE *)&self->_has &= ~8u;
}

- (BOOL)hasAssetPath
{
  return self->_assetPath != 0;
}

- (void)deleteAssetPath
{
  -[UAFSchemaUAFAsset setAssetPath:](self, "setAssetPath:", 0);
}

- (void)setAssetDownloadSizeInBytes:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_assetDownloadSizeInBytes = a3;
}

- (BOOL)hasAssetDownloadSizeInBytes
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setHasAssetDownloadSizeInBytes:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (void)deleteAssetDownloadSizeInBytes
{
  -[UAFSchemaUAFAsset setAssetDownloadSizeInBytes:](self, "setAssetDownloadSizeInBytes:", 0);
  *(_BYTE *)&self->_has &= ~0x10u;
}

- (void)setAssetUnarchivedSizeInBytes:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_assetUnarchivedSizeInBytes = a3;
}

- (BOOL)hasAssetUnarchivedSizeInBytes
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setHasAssetUnarchivedSizeInBytes:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (void)deleteAssetUnarchivedSizeInBytes
{
  -[UAFSchemaUAFAsset setAssetUnarchivedSizeInBytes:](self, "setAssetUnarchivedSizeInBytes:", 0);
  *(_BYTE *)&self->_has &= ~0x20u;
}

- (BOOL)readFrom:(id)a3
{
  return UAFSchemaUAFAssetReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char has;
  void *v8;
  char v9;
  void *v10;
  id v11;

  v11 = a3;
  -[UAFSchemaUAFAsset assetName](self, "assetName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  -[UAFSchemaUAFAsset assetSpecifier](self, "assetSpecifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  -[UAFSchemaUAFAsset assetVersion](self, "assetVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_9:
      if ((has & 4) == 0)
        goto LABEL_10;
      goto LABEL_21;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_10:
    if ((has & 8) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_21:
  PBDataWriterWriteUint32Field();
  if ((*(_BYTE *)&self->_has & 8) != 0)
LABEL_11:
    PBDataWriterWriteBOOLField();
LABEL_12:
  -[UAFSchemaUAFAsset assetPath](self, "assetPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    PBDataWriterWriteStringField();
  v9 = (char)self->_has;
  v10 = v11;
  if ((v9 & 0x10) != 0)
  {
    PBDataWriterWriteUint64Field();
    v10 = v11;
    v9 = (char)self->_has;
  }
  if ((v9 & 0x20) != 0)
  {
    PBDataWriterWriteUint64Field();
    v10 = v11;
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
  $079AA5609C6C4560B57F927AEF0D77E6 has;
  unsigned int v23;
  int assetLocale;
  int v25;
  int assetSource;
  int v27;
  unsigned int assetSizeOnDisk;
  int v29;
  int isAssetPathValid;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  BOOL v36;
  $079AA5609C6C4560B57F927AEF0D77E6 v38;
  int v39;
  unsigned int v40;
  unint64_t assetDownloadSizeInBytes;
  int v42;
  unint64_t assetUnarchivedSizeInBytes;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_37;
  -[UAFSchemaUAFAsset assetName](self, "assetName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assetName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_36;
  -[UAFSchemaUAFAsset assetName](self, "assetName");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[UAFSchemaUAFAsset assetName](self, "assetName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "assetName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_37;
  }
  else
  {

  }
  -[UAFSchemaUAFAsset assetSpecifier](self, "assetSpecifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assetSpecifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_36;
  -[UAFSchemaUAFAsset assetSpecifier](self, "assetSpecifier");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[UAFSchemaUAFAsset assetSpecifier](self, "assetSpecifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "assetSpecifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_37;
  }
  else
  {

  }
  -[UAFSchemaUAFAsset assetVersion](self, "assetVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assetVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_36;
  -[UAFSchemaUAFAsset assetVersion](self, "assetVersion");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[UAFSchemaUAFAsset assetVersion](self, "assetVersion");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "assetVersion");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_37;
  }
  else
  {

  }
  has = self->_has;
  v23 = v4[72];
  if ((*(_BYTE *)&has & 1) != (v23 & 1))
    goto LABEL_37;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    assetLocale = self->_assetLocale;
    if (assetLocale != objc_msgSend(v4, "assetLocale"))
      goto LABEL_37;
    has = self->_has;
    v23 = v4[72];
  }
  v25 = (*(unsigned int *)&has >> 1) & 1;
  if (v25 != ((v23 >> 1) & 1))
    goto LABEL_37;
  if (v25)
  {
    assetSource = self->_assetSource;
    if (assetSource != objc_msgSend(v4, "assetSource"))
      goto LABEL_37;
    has = self->_has;
    v23 = v4[72];
  }
  v27 = (*(unsigned int *)&has >> 2) & 1;
  if (v27 != ((v23 >> 2) & 1))
    goto LABEL_37;
  if (v27)
  {
    assetSizeOnDisk = self->_assetSizeOnDisk;
    if (assetSizeOnDisk != objc_msgSend(v4, "assetSizeOnDisk"))
      goto LABEL_37;
    has = self->_has;
    v23 = v4[72];
  }
  v29 = (*(unsigned int *)&has >> 3) & 1;
  if (v29 != ((v23 >> 3) & 1))
    goto LABEL_37;
  if (v29)
  {
    isAssetPathValid = self->_isAssetPathValid;
    if (isAssetPathValid != objc_msgSend(v4, "isAssetPathValid"))
      goto LABEL_37;
  }
  -[UAFSchemaUAFAsset assetPath](self, "assetPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assetPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_36:

    goto LABEL_37;
  }
  -[UAFSchemaUAFAsset assetPath](self, "assetPath");
  v31 = objc_claimAutoreleasedReturnValue();
  if (v31)
  {
    v32 = (void *)v31;
    -[UAFSchemaUAFAsset assetPath](self, "assetPath");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "assetPath");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v33, "isEqual:", v34);

    if (!v35)
      goto LABEL_37;
  }
  else
  {

  }
  v38 = self->_has;
  v39 = (*(unsigned int *)&v38 >> 4) & 1;
  v40 = v4[72];
  if (v39 == ((v40 >> 4) & 1))
  {
    if (v39)
    {
      assetDownloadSizeInBytes = self->_assetDownloadSizeInBytes;
      if (assetDownloadSizeInBytes != objc_msgSend(v4, "assetDownloadSizeInBytes"))
        goto LABEL_37;
      v38 = self->_has;
      v40 = v4[72];
    }
    v42 = (*(unsigned int *)&v38 >> 5) & 1;
    if (v42 == ((v40 >> 5) & 1))
    {
      if (!v42
        || (assetUnarchivedSizeInBytes = self->_assetUnarchivedSizeInBytes,
            assetUnarchivedSizeInBytes == objc_msgSend(v4, "assetUnarchivedSizeInBytes")))
      {
        v36 = 1;
        goto LABEL_38;
      }
    }
  }
LABEL_37:
  v36 = 0;
LABEL_38:

  return v36;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSUInteger v10;
  unint64_t v11;
  unint64_t v12;

  v3 = -[NSString hash](self->_assetName, "hash");
  v4 = -[NSString hash](self->_assetSpecifier, "hash");
  v5 = -[NSString hash](self->_assetVersion, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v6 = 2654435761 * self->_assetLocale;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v7 = 2654435761 * self->_assetSource;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_4;
LABEL_8:
      v8 = 0;
      if ((*(_BYTE *)&self->_has & 8) != 0)
        goto LABEL_5;
      goto LABEL_9;
    }
  }
  else
  {
    v6 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  v7 = 0;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_8;
LABEL_4:
  v8 = 2654435761 * self->_assetSizeOnDisk;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_5:
    v9 = 2654435761 * self->_isAssetPathValid;
    goto LABEL_10;
  }
LABEL_9:
  v9 = 0;
LABEL_10:
  v10 = -[NSString hash](self->_assetPath, "hash");
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    v11 = 2654435761u * self->_assetDownloadSizeInBytes;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
      goto LABEL_12;
LABEL_14:
    v12 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
  }
  v11 = 0;
  if ((*(_BYTE *)&self->_has & 0x20) == 0)
    goto LABEL_14;
LABEL_12:
  v12 = 2654435761u * self->_assetUnarchivedSizeInBytes;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  unsigned int v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  unsigned int v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[UAFSchemaUAFAsset assetDownloadSizeInBytes](self, "assetDownloadSizeInBytes"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("assetDownloadSizeInBytes"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    v6 = -[UAFSchemaUAFAsset assetLocale](self, "assetLocale") - 1;
    if (v6 > 0x3D)
      v7 = CFSTR("LOCALE_UNKNOWN_LOCALE");
    else
      v7 = off_1E563A970[v6];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("assetLocale"));
  }
  if (self->_assetName)
  {
    -[UAFSchemaUAFAsset assetName](self, "assetName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("assetName"));

  }
  if (self->_assetPath)
  {
    -[UAFSchemaUAFAsset assetPath](self, "assetPath");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("assetPath"));

  }
  v12 = (char)self->_has;
  if ((v12 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[UAFSchemaUAFAsset assetSizeOnDisk](self, "assetSizeOnDisk"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("assetSizeOnDisk"));

    v12 = (char)self->_has;
  }
  if ((v12 & 2) != 0)
  {
    v14 = -[UAFSchemaUAFAsset assetSource](self, "assetSource") - 1;
    if (v14 > 3)
      v15 = CFSTR("UAFASSETSOURCE_UNKNOWN");
    else
      v15 = off_1E563AB60[v14];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("assetSource"));
  }
  if (self->_assetSpecifier)
  {
    -[UAFSchemaUAFAsset assetSpecifier](self, "assetSpecifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v16, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("assetSpecifier"));

  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[UAFSchemaUAFAsset assetUnarchivedSizeInBytes](self, "assetUnarchivedSizeInBytes"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("assetUnarchivedSizeInBytes"));

  }
  if (self->_assetVersion)
  {
    -[UAFSchemaUAFAsset assetVersion](self, "assetVersion");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v19, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("assetVersion"));

  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[UAFSchemaUAFAsset isAssetPathValid](self, "isAssetPathValid"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("isAssetPathValid"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[UAFSchemaUAFAsset dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (UAFSchemaUAFAsset)initWithJSON:(id)a3
{
  void *v4;
  UAFSchemaUAFAsset *v5;
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
    self = -[UAFSchemaUAFAsset initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (UAFSchemaUAFAsset)initWithDictionary:(id)a3
{
  id v4;
  UAFSchemaUAFAsset *v5;
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
  UAFSchemaUAFAsset *v20;
  void *v22;
  void *v23;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)UAFSchemaUAFAsset;
  v5 = -[UAFSchemaUAFAsset init](&v24, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("assetName"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[UAFSchemaUAFAsset setAssetName:](v5, "setAssetName:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("assetSpecifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[UAFSchemaUAFAsset setAssetSpecifier:](v5, "setAssetSpecifier:", v9);

    }
    v22 = v8;
    v23 = v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("assetVersion"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = (void *)objc_msgSend(v10, "copy");
      -[UAFSchemaUAFAsset setAssetVersion:](v5, "setAssetVersion:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("assetLocale"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[UAFSchemaUAFAsset setAssetLocale:](v5, "setAssetLocale:", objc_msgSend(v12, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("assetSource"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[UAFSchemaUAFAsset setAssetSource:](v5, "setAssetSource:", objc_msgSend(v13, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("assetSizeOnDisk"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[UAFSchemaUAFAsset setAssetSizeOnDisk:](v5, "setAssetSizeOnDisk:", objc_msgSend(v14, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isAssetPathValid"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[UAFSchemaUAFAsset setIsAssetPathValid:](v5, "setIsAssetPathValid:", objc_msgSend(v15, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("assetPath"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = (void *)objc_msgSend(v16, "copy");
      -[UAFSchemaUAFAsset setAssetPath:](v5, "setAssetPath:", v17);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("assetDownloadSizeInBytes"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[UAFSchemaUAFAsset setAssetDownloadSizeInBytes:](v5, "setAssetDownloadSizeInBytes:", objc_msgSend(v18, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("assetUnarchivedSizeInBytes"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[UAFSchemaUAFAsset setAssetUnarchivedSizeInBytes:](v5, "setAssetUnarchivedSizeInBytes:", objc_msgSend(v19, "unsignedLongLongValue"));
    v20 = v5;

  }
  return v5;
}

- (NSString)assetName
{
  return self->_assetName;
}

- (void)setAssetName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)assetSpecifier
{
  return self->_assetSpecifier;
}

- (void)setAssetSpecifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)assetVersion
{
  return self->_assetVersion;
}

- (void)setAssetVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int)assetLocale
{
  return self->_assetLocale;
}

- (int)assetSource
{
  return self->_assetSource;
}

- (unsigned)assetSizeOnDisk
{
  return self->_assetSizeOnDisk;
}

- (BOOL)isAssetPathValid
{
  return self->_isAssetPathValid;
}

- (NSString)assetPath
{
  return self->_assetPath;
}

- (void)setAssetPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (unint64_t)assetDownloadSizeInBytes
{
  return self->_assetDownloadSizeInBytes;
}

- (unint64_t)assetUnarchivedSizeInBytes
{
  return self->_assetUnarchivedSizeInBytes;
}

- (void)setHasAssetName:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasAssetSpecifier:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void)setHasAssetVersion:(BOOL)a3
{
  *((_BYTE *)&self->_has + 3) = a3;
}

- (void)setHasAssetPath:(BOOL)a3
{
  self->_hasAssetName = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetPath, 0);
  objc_storeStrong((id *)&self->_assetVersion, 0);
  objc_storeStrong((id *)&self->_assetSpecifier, 0);
  objc_storeStrong((id *)&self->_assetName, 0);
}

@end
