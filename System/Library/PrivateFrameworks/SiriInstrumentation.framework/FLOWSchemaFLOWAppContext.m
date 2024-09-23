@implementation FLOWSchemaFLOWAppContext

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (BOOL)hasBundleId
{
  return self->_bundleId != 0;
}

- (void)deleteBundleId
{
  -[FLOWSchemaFLOWAppContext setBundleId:](self, "setBundleId:", 0);
}

- (BOOL)hasAppVersion
{
  return self->_appVersion != 0;
}

- (void)deleteAppVersion
{
  -[FLOWSchemaFLOWAppContext setAppVersion:](self, "setAppVersion:", 0);
}

- (void)setIsSmartEnoughAppSelectionUsed:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_isSmartEnoughAppSelectionUsed = a3;
}

- (BOOL)hasIsSmartEnoughAppSelectionUsed
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasIsSmartEnoughAppSelectionUsed:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteIsSmartEnoughAppSelectionUsed
{
  -[FLOWSchemaFLOWAppContext setIsSmartEnoughAppSelectionUsed:](self, "setIsSmartEnoughAppSelectionUsed:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setAppResolutionType:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_appResolutionType = a3;
}

- (BOOL)hasAppResolutionType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasAppResolutionType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteAppResolutionType
{
  -[FLOWSchemaFLOWAppContext setAppResolutionType:](self, "setAppResolutionType:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setProtectedAppType:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_protectedAppType = a3;
}

- (BOOL)hasProtectedAppType
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasProtectedAppType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteProtectedAppType
{
  -[FLOWSchemaFLOWAppContext setProtectedAppType:](self, "setProtectedAppType:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (BOOL)readFrom:(id)a3
{
  return FLOWSchemaFLOWAppContextReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  char has;
  void *v7;
  id v8;

  v8 = a3;
  -[FLOWSchemaFLOWAppContext bundleId](self, "bundleId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  -[FLOWSchemaFLOWAppContext appVersion](self, "appVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  v7 = v8;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_7;
LABEL_11:
    PBDataWriterWriteInt32Field();
    v7 = v8;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
  PBDataWriterWriteBOOLField();
  v7 = v8;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_11;
LABEL_7:
  if ((has & 4) != 0)
  {
LABEL_8:
    PBDataWriterWriteInt32Field();
    v7 = v8;
  }
LABEL_9:

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
  BOOL v17;
  $F05D26BC8273E1F3DDD6EB10D1D8A00E has;
  unsigned int v20;
  int isSmartEnoughAppSelectionUsed;
  int v22;
  int appResolutionType;
  int v24;
  int protectedAppType;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  -[FLOWSchemaFLOWAppContext bundleId](self, "bundleId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[FLOWSchemaFLOWAppContext bundleId](self, "bundleId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[FLOWSchemaFLOWAppContext bundleId](self, "bundleId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[FLOWSchemaFLOWAppContext appVersion](self, "appVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_11:

    goto LABEL_12;
  }
  -[FLOWSchemaFLOWAppContext appVersion](self, "appVersion");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[FLOWSchemaFLOWAppContext appVersion](self, "appVersion");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appVersion");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_12;
  }
  else
  {

  }
  has = self->_has;
  v20 = v4[36];
  if ((*(_BYTE *)&has & 1) == (v20 & 1))
  {
    if ((*(_BYTE *)&has & 1) != 0)
    {
      isSmartEnoughAppSelectionUsed = self->_isSmartEnoughAppSelectionUsed;
      if (isSmartEnoughAppSelectionUsed != objc_msgSend(v4, "isSmartEnoughAppSelectionUsed"))
        goto LABEL_12;
      has = self->_has;
      v20 = v4[36];
    }
    v22 = (*(unsigned int *)&has >> 1) & 1;
    if (v22 == ((v20 >> 1) & 1))
    {
      if (v22)
      {
        appResolutionType = self->_appResolutionType;
        if (appResolutionType != objc_msgSend(v4, "appResolutionType"))
          goto LABEL_12;
        has = self->_has;
        v20 = v4[36];
      }
      v24 = (*(unsigned int *)&has >> 2) & 1;
      if (v24 == ((v20 >> 2) & 1))
      {
        if (!v24
          || (protectedAppType = self->_protectedAppType,
              protectedAppType == objc_msgSend(v4, "protectedAppType")))
        {
          v17 = 1;
          goto LABEL_13;
        }
      }
    }
  }
LABEL_12:
  v17 = 0;
LABEL_13:

  return v17;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = -[NSString hash](self->_bundleId, "hash");
  v4 = -[NSString hash](self->_appVersion, "hash");
  if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_6:
    v6 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_4;
LABEL_7:
    v7 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7;
  }
  v5 = 2654435761 * self->_isSmartEnoughAppSelectionUsed;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v6 = 2654435761 * self->_appResolutionType;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_7;
LABEL_4:
  v7 = 2654435761 * self->_protectedAppType;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
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
  char has;
  void *v11;
  unsigned int v12;
  const __CFString *v13;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v4 = -[FLOWSchemaFLOWAppContext appResolutionType](self, "appResolutionType") - 1;
    if (v4 > 0xC)
      v5 = CFSTR("FLOWAPPRESOLUTIONTYPE_UNKNOWN");
    else
      v5 = off_1E562D7C8[v4];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("appResolutionType"));
  }
  if (self->_appVersion)
  {
    -[FLOWSchemaFLOWAppContext appVersion](self, "appVersion");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("appVersion"));

  }
  if (self->_bundleId)
  {
    -[FLOWSchemaFLOWAppContext bundleId](self, "bundleId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("bundleId"));

  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[FLOWSchemaFLOWAppContext isSmartEnoughAppSelectionUsed](self, "isSmartEnoughAppSelectionUsed"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("isSmartEnoughAppSelectionUsed"));

    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    v12 = -[FLOWSchemaFLOWAppContext protectedAppType](self, "protectedAppType") - 1;
    if (v12 > 2)
      v13 = CFSTR("FLOWPROTECTEDAPPTYPE_UNKNOWN");
    else
      v13 = off_1E562D830[v12];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("protectedAppType"));
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[FLOWSchemaFLOWAppContext dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (FLOWSchemaFLOWAppContext)initWithJSON:(id)a3
{
  void *v4;
  FLOWSchemaFLOWAppContext *v5;
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
    self = -[FLOWSchemaFLOWAppContext initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (FLOWSchemaFLOWAppContext)initWithDictionary:(id)a3
{
  id v4;
  FLOWSchemaFLOWAppContext *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  FLOWSchemaFLOWAppContext *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)FLOWSchemaFLOWAppContext;
  v5 = -[FLOWSchemaFLOWAppContext init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("bundleId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[FLOWSchemaFLOWAppContext setBundleId:](v5, "setBundleId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appVersion"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[FLOWSchemaFLOWAppContext setAppVersion:](v5, "setAppVersion:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isSmartEnoughAppSelectionUsed"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[FLOWSchemaFLOWAppContext setIsSmartEnoughAppSelectionUsed:](v5, "setIsSmartEnoughAppSelectionUsed:", objc_msgSend(v10, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appResolutionType"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[FLOWSchemaFLOWAppContext setAppResolutionType:](v5, "setAppResolutionType:", objc_msgSend(v11, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("protectedAppType"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[FLOWSchemaFLOWAppContext setProtectedAppType:](v5, "setProtectedAppType:", objc_msgSend(v12, "intValue"));
    v13 = v5;

  }
  return v5;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)appVersion
{
  return self->_appVersion;
}

- (void)setAppVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)isSmartEnoughAppSelectionUsed
{
  return self->_isSmartEnoughAppSelectionUsed;
}

- (int)appResolutionType
{
  return self->_appResolutionType;
}

- (int)protectedAppType
{
  return self->_protectedAppType;
}

- (void)setHasBundleId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasAppVersion:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appVersion, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
}

@end
