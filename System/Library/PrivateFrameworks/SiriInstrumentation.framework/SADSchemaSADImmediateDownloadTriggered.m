@implementation SADSchemaSADImmediateDownloadTriggered

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setLocale:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_locale = a3;
}

- (BOOL)hasLocale
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasLocale:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteLocale
{
  -[SADSchemaSADImmediateDownloadTriggered setLocale:](self, "setLocale:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setExistingAssets:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_existingAssets = a3;
}

- (BOOL)hasExistingAssets
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasExistingAssets:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteExistingAssets
{
  -[SADSchemaSADImmediateDownloadTriggered setExistingAssets:](self, "setExistingAssets:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setRetryCount:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_retryCount = a3;
}

- (BOOL)hasRetryCount
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasRetryCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteRetryCount
{
  -[SADSchemaSADImmediateDownloadTriggered setRetryCount:](self, "setRetryCount:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (BOOL)readFrom:(id)a3
{
  return SADSchemaSADImmediateDownloadTriggeredReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  has = (char)self->_has;
  v6 = v4;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_3;
LABEL_7:
    PBDataWriterWriteBOOLField();
    v4 = v6;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  PBDataWriterWriteInt32Field();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    PBDataWriterWriteUint32Field();
    v4 = v6;
  }
LABEL_5:

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $25C9E36BE6107429B28F79A9D959A98C has;
  unsigned int v6;
  int locale;
  int v8;
  int existingAssets;
  int v10;
  unsigned int retryCount;
  BOOL v12;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  has = self->_has;
  v6 = v4[20];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_14;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    locale = self->_locale;
    if (locale != objc_msgSend(v4, "locale"))
      goto LABEL_14;
    has = self->_has;
    v6 = v4[20];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_14;
  if (v8)
  {
    existingAssets = self->_existingAssets;
    if (existingAssets == objc_msgSend(v4, "existingAssets"))
    {
      has = self->_has;
      v6 = v4[20];
      goto LABEL_10;
    }
LABEL_14:
    v12 = 0;
    goto LABEL_15;
  }
LABEL_10:
  v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1))
    goto LABEL_14;
  if (v10)
  {
    retryCount = self->_retryCount;
    if (retryCount != objc_msgSend(v4, "retryCount"))
      goto LABEL_14;
  }
  v12 = 1;
LABEL_15:

  return v12;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_6:
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_4;
LABEL_7:
    v4 = 0;
    return v3 ^ v2 ^ v4;
  }
  v2 = 2654435761 * self->_locale;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v3 = 2654435761 * self->_existingAssets;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_7;
LABEL_4:
  v4 = 2654435761 * self->_retryCount;
  return v3 ^ v2 ^ v4;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v7;
  unsigned int v8;
  const __CFString *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_3;
LABEL_7:
    v8 = -[SADSchemaSADImmediateDownloadTriggered locale](self, "locale") - 1;
    if (v8 > 0x3D)
      v9 = CFSTR("LOCALE_UNKNOWN_LOCALE");
    else
      v9 = off_1E5633978[v8];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("locale"));
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_4;
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SADSchemaSADImmediateDownloadTriggered existingAssets](self, "existingAssets"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("existingAssets"));

  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[SADSchemaSADImmediateDownloadTriggered retryCount](self, "retryCount"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("retryCount"));

  }
LABEL_5:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SADSchemaSADImmediateDownloadTriggered dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (SADSchemaSADImmediateDownloadTriggered)initWithJSON:(id)a3
{
  void *v4;
  SADSchemaSADImmediateDownloadTriggered *v5;
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
    self = -[SADSchemaSADImmediateDownloadTriggered initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SADSchemaSADImmediateDownloadTriggered)initWithDictionary:(id)a3
{
  id v4;
  SADSchemaSADImmediateDownloadTriggered *v5;
  void *v6;
  void *v7;
  void *v8;
  SADSchemaSADImmediateDownloadTriggered *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SADSchemaSADImmediateDownloadTriggered;
  v5 = -[SADSchemaSADImmediateDownloadTriggered init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("locale"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SADSchemaSADImmediateDownloadTriggered setLocale:](v5, "setLocale:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("existingAssets"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SADSchemaSADImmediateDownloadTriggered setExistingAssets:](v5, "setExistingAssets:", objc_msgSend(v7, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("retryCount"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SADSchemaSADImmediateDownloadTriggered setRetryCount:](v5, "setRetryCount:", objc_msgSend(v8, "unsignedIntValue"));
    v9 = v5;

  }
  return v5;
}

- (int)locale
{
  return self->_locale;
}

- (BOOL)existingAssets
{
  return self->_existingAssets;
}

- (unsigned)retryCount
{
  return self->_retryCount;
}

@end
