@implementation RGSiriSchemaRGCatalogStarted

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setExists:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_exists = a3;
}

- (BOOL)hasExists
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasExists:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteExists
{
  -[RGSiriSchemaRGCatalogStarted setExists:](self, "setExists:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)hasResponseCatalogMobileAssetVersion
{
  return self->_responseCatalogMobileAssetVersion != 0;
}

- (void)deleteResponseCatalogMobileAssetVersion
{
  -[RGSiriSchemaRGCatalogStarted setResponseCatalogMobileAssetVersion:](self, "setResponseCatalogMobileAssetVersion:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return RGSiriSchemaRGCatalogStartedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteBOOLField();
  -[RGSiriSchemaRGCatalogStarted responseCatalogMobileAssetVersion](self, "responseCatalogMobileAssetVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = v6;
  if (v4)
  {
    PBDataWriterWriteStringField();
    v5 = v6;
  }

}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  int exists;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  BOOL v14;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    if ((*(_BYTE *)&self->_has & 1) == (v4[24] & 1))
    {
      if ((*(_BYTE *)&self->_has & 1) == 0
        || (exists = self->_exists, exists == objc_msgSend(v4, "exists")))
      {
        -[RGSiriSchemaRGCatalogStarted responseCatalogMobileAssetVersion](self, "responseCatalogMobileAssetVersion");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "responseCatalogMobileAssetVersion");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v7;
        if ((v6 == 0) != (v7 != 0))
        {
          -[RGSiriSchemaRGCatalogStarted responseCatalogMobileAssetVersion](self, "responseCatalogMobileAssetVersion");
          v9 = objc_claimAutoreleasedReturnValue();
          if (!v9)
          {

LABEL_13:
            v14 = 1;
            goto LABEL_11;
          }
          v10 = (void *)v9;
          -[RGSiriSchemaRGCatalogStarted responseCatalogMobileAssetVersion](self, "responseCatalogMobileAssetVersion");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "responseCatalogMobileAssetVersion");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v11, "isEqual:", v12);

          if ((v13 & 1) != 0)
            goto LABEL_13;
        }
        else
        {

        }
      }
    }
  }
  v14 = 0;
LABEL_11:

  return v14;
}

- (unint64_t)hash
{
  uint64_t v2;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v2 = 2654435761 * self->_exists;
  else
    v2 = 0;
  return -[NSString hash](self->_responseCatalogMobileAssetVersion, "hash") ^ v2;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[RGSiriSchemaRGCatalogStarted exists](self, "exists"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("exists"));

  }
  if (self->_responseCatalogMobileAssetVersion)
  {
    -[RGSiriSchemaRGCatalogStarted responseCatalogMobileAssetVersion](self, "responseCatalogMobileAssetVersion");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("responseCatalogMobileAssetVersion"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[RGSiriSchemaRGCatalogStarted dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (RGSiriSchemaRGCatalogStarted)initWithJSON:(id)a3
{
  void *v4;
  RGSiriSchemaRGCatalogStarted *v5;
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
    self = -[RGSiriSchemaRGCatalogStarted initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (RGSiriSchemaRGCatalogStarted)initWithDictionary:(id)a3
{
  id v4;
  RGSiriSchemaRGCatalogStarted *v5;
  void *v6;
  void *v7;
  void *v8;
  RGSiriSchemaRGCatalogStarted *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RGSiriSchemaRGCatalogStarted;
  v5 = -[RGSiriSchemaRGCatalogStarted init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("exists"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[RGSiriSchemaRGCatalogStarted setExists:](v5, "setExists:", objc_msgSend(v6, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("responseCatalogMobileAssetVersion"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = (void *)objc_msgSend(v7, "copy");
      -[RGSiriSchemaRGCatalogStarted setResponseCatalogMobileAssetVersion:](v5, "setResponseCatalogMobileAssetVersion:", v8);

    }
    v9 = v5;

  }
  return v5;
}

- (BOOL)exists
{
  return self->_exists;
}

- (NSString)responseCatalogMobileAssetVersion
{
  return self->_responseCatalogMobileAssetVersion;
}

- (void)setResponseCatalogMobileAssetVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setHasResponseCatalogMobileAssetVersion:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseCatalogMobileAssetVersion, 0);
}

@end
