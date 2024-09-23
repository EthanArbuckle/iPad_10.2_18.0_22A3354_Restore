@implementation ODMSiriSchemaODMDynamicDimensionsAll

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
  v9.super_class = (Class)ODMSiriSchemaODMDynamicDimensionsAll;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ODMSiriSchemaODMDynamicDimensionsAll siriInputLocale](self, "siriInputLocale", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[ODMSiriSchemaODMDynamicDimensionsAll deleteSiriInputLocale](self, "deleteSiriInputLocale");
  return v5;
}

- (BOOL)hasSiriInputLocale
{
  return self->_siriInputLocale != 0;
}

- (void)deleteSiriInputLocale
{
  -[ODMSiriSchemaODMDynamicDimensionsAll setSiriInputLocale:](self, "setSiriInputLocale:", 0);
}

- (void)setViewMode:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_viewMode = a3;
}

- (BOOL)hasViewMode
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasViewMode:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteViewMode
{
  -[ODMSiriSchemaODMDynamicDimensionsAll setViewMode:](self, "setViewMode:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setAudioInterface:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_audioInterface = a3;
}

- (BOOL)hasAudioInterface
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasAudioInterface:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteAudioInterface
{
  -[ODMSiriSchemaODMDynamicDimensionsAll setAudioInterface:](self, "setAudioInterface:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setProduct:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_product = a3;
}

- (BOOL)hasProduct
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasProduct:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteProduct
{
  -[ODMSiriSchemaODMDynamicDimensionsAll setProduct:](self, "setProduct:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (void)setSiriAsrLocation:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_siriAsrLocation = a3;
}

- (BOOL)hasSiriAsrLocation
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasSiriAsrLocation:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)deleteSiriAsrLocation
{
  -[ODMSiriSchemaODMDynamicDimensionsAll setSiriAsrLocation:](self, "setSiriAsrLocation:", 0);
  *(_BYTE *)&self->_has &= ~8u;
}

- (void)setSiriNlLocation:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_siriNlLocation = a3;
}

- (BOOL)hasSiriNlLocation
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setHasSiriNlLocation:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (void)deleteSiriNlLocation
{
  -[ODMSiriSchemaODMDynamicDimensionsAll setSiriNlLocation:](self, "setSiriNlLocation:", 0);
  *(_BYTE *)&self->_has &= ~0x10u;
}

- (void)setSiriDataSharingOptInStatus:(int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_siriDataSharingOptInStatus = a3;
}

- (BOOL)hasSiriDataSharingOptInStatus
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setHasSiriDataSharingOptInStatus:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (void)deleteSiriDataSharingOptInStatus
{
  -[ODMSiriSchemaODMDynamicDimensionsAll setSiriDataSharingOptInStatus:](self, "setSiriDataSharingOptInStatus:", 0);
  *(_BYTE *)&self->_has &= ~0x20u;
}

- (BOOL)readFrom:(id)a3
{
  return ODMSiriSchemaODMDynamicDimensionsAllReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  char has;
  void *v7;
  id v8;

  v8 = a3;
  -[ODMSiriSchemaODMDynamicDimensionsAll siriInputLocale](self, "siriInputLocale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[ODMSiriSchemaODMDynamicDimensionsAll siriInputLocale](self, "siriInputLocale");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
  }
  v7 = v8;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v7 = v8;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 8) == 0)
        goto LABEL_8;
      goto LABEL_14;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteInt32Field();
  v7 = v8;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0)
      goto LABEL_9;
LABEL_15:
    PBDataWriterWriteInt32Field();
    v7 = v8;
    if ((*(_BYTE *)&self->_has & 0x20) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_14:
  PBDataWriterWriteInt32Field();
  v7 = v8;
  has = (char)self->_has;
  if ((has & 0x10) != 0)
    goto LABEL_15;
LABEL_9:
  if ((has & 0x20) != 0)
  {
LABEL_10:
    PBDataWriterWriteInt32Field();
    v7 = v8;
  }
LABEL_11:

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  $0D2C39329533C3CFC09EEDCB26174B17 has;
  unsigned int v14;
  int viewMode;
  int v16;
  int audioInterface;
  int v18;
  int product;
  int v20;
  int siriAsrLocation;
  int v22;
  int siriNlLocation;
  int v24;
  int siriDataSharingOptInStatus;
  BOOL v26;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_32;
  -[ODMSiriSchemaODMDynamicDimensionsAll siriInputLocale](self, "siriInputLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "siriInputLocale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

    goto LABEL_32;
  }
  -[ODMSiriSchemaODMDynamicDimensionsAll siriInputLocale](self, "siriInputLocale");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[ODMSiriSchemaODMDynamicDimensionsAll siriInputLocale](self, "siriInputLocale");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "siriInputLocale");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_32;
  }
  else
  {

  }
  has = self->_has;
  v14 = v4[40];
  if ((*(_BYTE *)&has & 1) != (v14 & 1))
  {
LABEL_32:
    v26 = 0;
    goto LABEL_33;
  }
  if ((*(_BYTE *)&has & 1) != 0)
  {
    viewMode = self->_viewMode;
    if (viewMode != objc_msgSend(v4, "viewMode"))
      goto LABEL_32;
    has = self->_has;
    v14 = v4[40];
  }
  v16 = (*(unsigned int *)&has >> 1) & 1;
  if (v16 != ((v14 >> 1) & 1))
    goto LABEL_32;
  if (v16)
  {
    audioInterface = self->_audioInterface;
    if (audioInterface != objc_msgSend(v4, "audioInterface"))
      goto LABEL_32;
    has = self->_has;
    v14 = v4[40];
  }
  v18 = (*(unsigned int *)&has >> 2) & 1;
  if (v18 != ((v14 >> 2) & 1))
    goto LABEL_32;
  if (v18)
  {
    product = self->_product;
    if (product != objc_msgSend(v4, "product"))
      goto LABEL_32;
    has = self->_has;
    v14 = v4[40];
  }
  v20 = (*(unsigned int *)&has >> 3) & 1;
  if (v20 != ((v14 >> 3) & 1))
    goto LABEL_32;
  if (v20)
  {
    siriAsrLocation = self->_siriAsrLocation;
    if (siriAsrLocation != objc_msgSend(v4, "siriAsrLocation"))
      goto LABEL_32;
    has = self->_has;
    v14 = v4[40];
  }
  v22 = (*(unsigned int *)&has >> 4) & 1;
  if (v22 != ((v14 >> 4) & 1))
    goto LABEL_32;
  if (v22)
  {
    siriNlLocation = self->_siriNlLocation;
    if (siriNlLocation == objc_msgSend(v4, "siriNlLocation"))
    {
      has = self->_has;
      v14 = v4[40];
      goto LABEL_28;
    }
    goto LABEL_32;
  }
LABEL_28:
  v24 = (*(unsigned int *)&has >> 5) & 1;
  if (v24 != ((v14 >> 5) & 1))
    goto LABEL_32;
  if (v24)
  {
    siriDataSharingOptInStatus = self->_siriDataSharingOptInStatus;
    if (siriDataSharingOptInStatus != objc_msgSend(v4, "siriDataSharingOptInStatus"))
      goto LABEL_32;
  }
  v26 = 1;
LABEL_33:

  return v26;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3 = -[SISchemaISOLocale hash](self->_siriInputLocale, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = 2654435761 * self->_viewMode;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v5 = 2654435761 * self->_audioInterface;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_4:
    v6 = 2654435761 * self->_product;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  v6 = 0;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_5:
    v7 = 2654435761 * self->_siriAsrLocation;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_6;
LABEL_12:
    v8 = 0;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
      goto LABEL_7;
LABEL_13:
    v9 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  }
LABEL_11:
  v7 = 0;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    goto LABEL_12;
LABEL_6:
  v8 = 2654435761 * self->_siriNlLocation;
  if ((*(_BYTE *)&self->_has & 0x20) == 0)
    goto LABEL_13;
LABEL_7:
  v9 = 2654435761 * self->_siriDataSharingOptInStatus;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  unsigned int v5;
  const __CFString *v6;
  int v7;
  const __CFString *v8;
  const __CFString *v9;
  int v10;
  const __CFString *v11;
  const __CFString *v12;
  unsigned int v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  int v19;
  const __CFString *v20;
  const __CFString *v21;
  unsigned int v22;
  const __CFString *v23;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5 = -[ODMSiriSchemaODMDynamicDimensionsAll audioInterface](self, "audioInterface") - 1;
    if (v5 > 0xE)
      v6 = CFSTR("AUDIOINPUTROUTE_UNKNOWN");
    else
      v6 = off_1E563AB80[v5];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("audioInterface"));
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  v7 = -[ODMSiriSchemaODMDynamicDimensionsAll product](self, "product");
  v8 = CFSTR("PRODUCT_UNKNOWN");
  if (v7 == 1)
    v8 = CFSTR("PRODUCT_ASSISTANT");
  if (v7 == 2)
    v9 = CFSTR("PRODUCT_DICTATION");
  else
    v9 = v8;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("product"));
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0)
      goto LABEL_26;
    goto LABEL_22;
  }
LABEL_16:
  v10 = -[ODMSiriSchemaODMDynamicDimensionsAll siriAsrLocation](self, "siriAsrLocation");
  v11 = CFSTR("ORCHSIRIASRMODE_UNKNOWN");
  if (v10 == 1)
    v11 = CFSTR("ORCHSIRIASRMODE_SERVER");
  if (v10 == 2)
    v12 = CFSTR("ORCHSIRIASRMODE_DEVICE");
  else
    v12 = v11;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("siriAsrLocation"));
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
LABEL_22:
    v13 = -[ODMSiriSchemaODMDynamicDimensionsAll siriDataSharingOptInStatus](self, "siriDataSharingOptInStatus") - 1;
    if (v13 > 2)
      v14 = CFSTR("UNKNOWN");
    else
      v14 = off_1E563ABF8[v13];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("siriDataSharingOptInStatus"));
  }
LABEL_26:
  if (self->_siriInputLocale)
  {
    -[ODMSiriSchemaODMDynamicDimensionsAll siriInputLocale](self, "siriInputLocale");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "dictionaryRepresentation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("siriInputLocale"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("siriInputLocale"));

    }
  }
  v18 = (char)self->_has;
  if ((v18 & 0x10) != 0)
  {
    v19 = -[ODMSiriSchemaODMDynamicDimensionsAll siriNlLocation](self, "siriNlLocation");
    v20 = CFSTR("ORCHSIRINLMODE_UNKNOWN");
    if (v19 == 1)
      v20 = CFSTR("ORCHSIRINLMODE_NLV3_SERVER");
    if (v19 == 2)
      v21 = CFSTR("ORCHSIRINLMODE_NLX_DEVICE");
    else
      v21 = v20;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("siriNlLocation"));
    v18 = (char)self->_has;
  }
  if ((v18 & 1) != 0)
  {
    v22 = -[ODMSiriSchemaODMDynamicDimensionsAll viewMode](self, "viewMode") - 1;
    if (v22 > 6)
      v23 = CFSTR("ODMSIRIUIVIEWMODE_UNKNOWN");
    else
      v23 = off_1E563AC10[v22];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("viewMode"));
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[ODMSiriSchemaODMDynamicDimensionsAll dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (ODMSiriSchemaODMDynamicDimensionsAll)initWithJSON:(id)a3
{
  void *v4;
  ODMSiriSchemaODMDynamicDimensionsAll *v5;
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
    self = -[ODMSiriSchemaODMDynamicDimensionsAll initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (ODMSiriSchemaODMDynamicDimensionsAll)initWithDictionary:(id)a3
{
  id v4;
  ODMSiriSchemaODMDynamicDimensionsAll *v5;
  void *v6;
  SISchemaISOLocale *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  ODMSiriSchemaODMDynamicDimensionsAll *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ODMSiriSchemaODMDynamicDimensionsAll;
  v5 = -[ODMSiriSchemaODMDynamicDimensionsAll init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("siriInputLocale"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaISOLocale initWithDictionary:]([SISchemaISOLocale alloc], "initWithDictionary:", v6);
      -[ODMSiriSchemaODMDynamicDimensionsAll setSiriInputLocale:](v5, "setSiriInputLocale:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("viewMode"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ODMSiriSchemaODMDynamicDimensionsAll setViewMode:](v5, "setViewMode:", objc_msgSend(v8, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("audioInterface"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ODMSiriSchemaODMDynamicDimensionsAll setAudioInterface:](v5, "setAudioInterface:", objc_msgSend(v9, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("product"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ODMSiriSchemaODMDynamicDimensionsAll setProduct:](v5, "setProduct:", objc_msgSend(v10, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("siriAsrLocation"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ODMSiriSchemaODMDynamicDimensionsAll setSiriAsrLocation:](v5, "setSiriAsrLocation:", objc_msgSend(v11, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("siriNlLocation"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ODMSiriSchemaODMDynamicDimensionsAll setSiriNlLocation:](v5, "setSiriNlLocation:", objc_msgSend(v12, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("siriDataSharingOptInStatus"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ODMSiriSchemaODMDynamicDimensionsAll setSiriDataSharingOptInStatus:](v5, "setSiriDataSharingOptInStatus:", objc_msgSend(v13, "intValue"));
    v14 = v5;

  }
  return v5;
}

- (SISchemaISOLocale)siriInputLocale
{
  return self->_siriInputLocale;
}

- (void)setSiriInputLocale:(id)a3
{
  objc_storeStrong((id *)&self->_siriInputLocale, a3);
}

- (int)viewMode
{
  return self->_viewMode;
}

- (int)audioInterface
{
  return self->_audioInterface;
}

- (int)product
{
  return self->_product;
}

- (int)siriAsrLocation
{
  return self->_siriAsrLocation;
}

- (int)siriNlLocation
{
  return self->_siriNlLocation;
}

- (int)siriDataSharingOptInStatus
{
  return self->_siriDataSharingOptInStatus;
}

- (void)setHasSiriInputLocale:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siriInputLocale, 0);
}

@end
