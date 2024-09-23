@implementation ODMSiriSchemaODMDynamicDimensions

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
  v9.super_class = (Class)ODMSiriSchemaODMDynamicDimensions;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ODMSiriSchemaODMDynamicDimensions siriInputLocale](self, "siriInputLocale", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[ODMSiriSchemaODMDynamicDimensions deleteSiriInputLocale](self, "deleteSiriInputLocale");
  return v5;
}

- (BOOL)hasSiriInputLocale
{
  return self->_siriInputLocale != 0;
}

- (void)deleteSiriInputLocale
{
  -[ODMSiriSchemaODMDynamicDimensions setSiriInputLocale:](self, "setSiriInputLocale:", 0);
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
  -[ODMSiriSchemaODMDynamicDimensions setViewMode:](self, "setViewMode:", 0);
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
  -[ODMSiriSchemaODMDynamicDimensions setAudioInterface:](self, "setAudioInterface:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setTaskType:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_taskType = a3;
}

- (BOOL)hasTaskType
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasTaskType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteTaskType
{
  -[ODMSiriSchemaODMDynamicDimensions setTaskType:](self, "setTaskType:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (void)setTaskAppBundleId:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_taskAppBundleId = a3;
}

- (BOOL)hasTaskAppBundleId
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasTaskAppBundleId:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)deleteTaskAppBundleId
{
  -[ODMSiriSchemaODMDynamicDimensions setTaskAppBundleId:](self, "setTaskAppBundleId:", 0);
  *(_BYTE *)&self->_has &= ~8u;
}

- (BOOL)readFrom:(id)a3
{
  return ODMSiriSchemaODMDynamicDimensionsReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  char has;
  void *v7;
  id v8;

  v8 = a3;
  -[ODMSiriSchemaODMDynamicDimensions siriInputLocale](self, "siriInputLocale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[ODMSiriSchemaODMDynamicDimensions siriInputLocale](self, "siriInputLocale");
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
  if ((has & 2) == 0)
  {
    if ((has & 4) == 0)
      goto LABEL_7;
LABEL_11:
    PBDataWriterWriteInt32Field();
    v7 = v8;
    if ((*(_BYTE *)&self->_has & 8) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
  PBDataWriterWriteInt32Field();
  v7 = v8;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_11;
LABEL_7:
  if ((has & 8) != 0)
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
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  $23F3F1D064460F7B771191FA2FA872D8 has;
  unsigned int v14;
  int viewMode;
  int v16;
  int audioInterface;
  int v18;
  int taskType;
  int v20;
  int taskAppBundleId;
  BOOL v22;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_24;
  -[ODMSiriSchemaODMDynamicDimensions siriInputLocale](self, "siriInputLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "siriInputLocale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

    goto LABEL_24;
  }
  -[ODMSiriSchemaODMDynamicDimensions siriInputLocale](self, "siriInputLocale");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[ODMSiriSchemaODMDynamicDimensions siriInputLocale](self, "siriInputLocale");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "siriInputLocale");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_24;
  }
  else
  {

  }
  has = self->_has;
  v14 = v4[32];
  if ((*(_BYTE *)&has & 1) != (v14 & 1))
  {
LABEL_24:
    v22 = 0;
    goto LABEL_25;
  }
  if ((*(_BYTE *)&has & 1) != 0)
  {
    viewMode = self->_viewMode;
    if (viewMode != objc_msgSend(v4, "viewMode"))
      goto LABEL_24;
    has = self->_has;
    v14 = v4[32];
  }
  v16 = (*(unsigned int *)&has >> 1) & 1;
  if (v16 != ((v14 >> 1) & 1))
    goto LABEL_24;
  if (v16)
  {
    audioInterface = self->_audioInterface;
    if (audioInterface != objc_msgSend(v4, "audioInterface"))
      goto LABEL_24;
    has = self->_has;
    v14 = v4[32];
  }
  v18 = (*(unsigned int *)&has >> 2) & 1;
  if (v18 != ((v14 >> 2) & 1))
    goto LABEL_24;
  if (v18)
  {
    taskType = self->_taskType;
    if (taskType == objc_msgSend(v4, "taskType"))
    {
      has = self->_has;
      v14 = v4[32];
      goto LABEL_20;
    }
    goto LABEL_24;
  }
LABEL_20:
  v20 = (*(unsigned int *)&has >> 3) & 1;
  if (v20 != ((v14 >> 3) & 1))
    goto LABEL_24;
  if (v20)
  {
    taskAppBundleId = self->_taskAppBundleId;
    if (taskAppBundleId != objc_msgSend(v4, "taskAppBundleId"))
      goto LABEL_24;
  }
  v22 = 1;
LABEL_25:

  return v22;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

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
LABEL_8:
      v6 = 0;
      if ((*(_BYTE *)&self->_has & 8) != 0)
        goto LABEL_5;
LABEL_9:
      v7 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ v7;
    }
  }
  else
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_8;
LABEL_4:
  v6 = 2654435761 * self->_taskType;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_9;
LABEL_5:
  v7 = 2654435761 * self->_taskAppBundleId;
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
  char has;
  unsigned int v10;
  const __CFString *v11;
  unsigned int v12;
  const __CFString *v13;
  unsigned int v14;
  const __CFString *v15;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v4 = -[ODMSiriSchemaODMDynamicDimensions audioInterface](self, "audioInterface") - 1;
    if (v4 > 0xE)
      v5 = CFSTR("AUDIOINPUTROUTE_UNKNOWN");
    else
      v5 = off_1E5639F00[v4];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("audioInterface"));
  }
  if (self->_siriInputLocale)
  {
    -[ODMSiriSchemaODMDynamicDimensions siriInputLocale](self, "siriInputLocale");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("siriInputLocale"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("siriInputLocale"));

    }
  }
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v10 = -[ODMSiriSchemaODMDynamicDimensions taskAppBundleId](self, "taskAppBundleId") - 1;
    if (v10 > 2)
      v11 = CFSTR("ODMSIRITASKAPPBUNDLEID_UNKNOWN");
    else
      v11 = off_1E5639F78[v10];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("taskAppBundleId"));
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_13:
      if ((has & 1) == 0)
        goto LABEL_27;
      goto LABEL_23;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_13;
  }
  v12 = -[ODMSiriSchemaODMDynamicDimensions taskType](self, "taskType") - 1;
  if (v12 > 3)
    v13 = CFSTR("ODMSIRITASKTYPE_UNKNOWN");
  else
    v13 = off_1E5639F90[v12];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("taskType"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_23:
    v14 = -[ODMSiriSchemaODMDynamicDimensions viewMode](self, "viewMode") - 1;
    if (v14 > 6)
      v15 = CFSTR("ODMSIRIUIVIEWMODE_UNKNOWN");
    else
      v15 = off_1E5639FB0[v14];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("viewMode"));
  }
LABEL_27:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[ODMSiriSchemaODMDynamicDimensions dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (ODMSiriSchemaODMDynamicDimensions)initWithJSON:(id)a3
{
  void *v4;
  ODMSiriSchemaODMDynamicDimensions *v5;
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
    self = -[ODMSiriSchemaODMDynamicDimensions initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (ODMSiriSchemaODMDynamicDimensions)initWithDictionary:(id)a3
{
  id v4;
  ODMSiriSchemaODMDynamicDimensions *v5;
  void *v6;
  SISchemaISOLocale *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  ODMSiriSchemaODMDynamicDimensions *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ODMSiriSchemaODMDynamicDimensions;
  v5 = -[ODMSiriSchemaODMDynamicDimensions init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("siriInputLocale"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaISOLocale initWithDictionary:]([SISchemaISOLocale alloc], "initWithDictionary:", v6);
      -[ODMSiriSchemaODMDynamicDimensions setSiriInputLocale:](v5, "setSiriInputLocale:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("viewMode"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ODMSiriSchemaODMDynamicDimensions setViewMode:](v5, "setViewMode:", objc_msgSend(v8, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("audioInterface"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ODMSiriSchemaODMDynamicDimensions setAudioInterface:](v5, "setAudioInterface:", objc_msgSend(v9, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("taskType"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ODMSiriSchemaODMDynamicDimensions setTaskType:](v5, "setTaskType:", objc_msgSend(v10, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("taskAppBundleId"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ODMSiriSchemaODMDynamicDimensions setTaskAppBundleId:](v5, "setTaskAppBundleId:", objc_msgSend(v11, "intValue"));
    v12 = v5;

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

- (int)taskType
{
  return self->_taskType;
}

- (int)taskAppBundleId
{
  return self->_taskAppBundleId;
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
