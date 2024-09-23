@implementation ODDSiriSchemaODDDeviceAndUsageDynamicDimensions

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
  v9.super_class = (Class)ODDSiriSchemaODDDeviceAndUsageDynamicDimensions;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ODDSiriSchemaODDDeviceAndUsageDynamicDimensions siriInputLocale](self, "siriInputLocale", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[ODDSiriSchemaODDDeviceAndUsageDynamicDimensions deleteSiriInputLocale](self, "deleteSiriInputLocale");
  return v5;
}

- (BOOL)hasSiriInputLocale
{
  return self->_siriInputLocale != 0;
}

- (void)deleteSiriInputLocale
{
  -[ODDSiriSchemaODDDeviceAndUsageDynamicDimensions setSiriInputLocale:](self, "setSiriInputLocale:", 0);
}

- (void)setViewInterface:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_viewInterface = a3;
}

- (BOOL)hasViewInterface
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasViewInterface:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteViewInterface
{
  -[ODDSiriSchemaODDDeviceAndUsageDynamicDimensions setViewInterface:](self, "setViewInterface:", 0);
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
  -[ODDSiriSchemaODDDeviceAndUsageDynamicDimensions setAudioInterface:](self, "setAudioInterface:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setAppTaskType:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_appTaskType = a3;
}

- (BOOL)hasAppTaskType
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasAppTaskType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteAppTaskType
{
  -[ODDSiriSchemaODDDeviceAndUsageDynamicDimensions setAppTaskType:](self, "setAppTaskType:", 0);
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
  -[ODDSiriSchemaODDDeviceAndUsageDynamicDimensions setTaskAppBundleId:](self, "setTaskAppBundleId:", 0);
  *(_BYTE *)&self->_has &= ~8u;
}

- (BOOL)readFrom:(id)a3
{
  return ODDSiriSchemaODDDeviceAndUsageDynamicDimensionsReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  char has;
  void *v7;
  id v8;

  v8 = a3;
  -[ODDSiriSchemaODDDeviceAndUsageDynamicDimensions siriInputLocale](self, "siriInputLocale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[ODDSiriSchemaODDDeviceAndUsageDynamicDimensions siriInputLocale](self, "siriInputLocale");
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
  $8AA122162F5E67FA27E0DE1A795B73C2 has;
  unsigned int v14;
  int viewInterface;
  int v16;
  int audioInterface;
  int v18;
  int appTaskType;
  int v20;
  int taskAppBundleId;
  BOOL v22;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_24;
  -[ODDSiriSchemaODDDeviceAndUsageDynamicDimensions siriInputLocale](self, "siriInputLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "siriInputLocale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

    goto LABEL_24;
  }
  -[ODDSiriSchemaODDDeviceAndUsageDynamicDimensions siriInputLocale](self, "siriInputLocale");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[ODDSiriSchemaODDDeviceAndUsageDynamicDimensions siriInputLocale](self, "siriInputLocale");
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
    viewInterface = self->_viewInterface;
    if (viewInterface != objc_msgSend(v4, "viewInterface"))
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
    appTaskType = self->_appTaskType;
    if (appTaskType == objc_msgSend(v4, "appTaskType"))
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
    v4 = 2654435761 * self->_viewInterface;
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
  v6 = 2654435761 * self->_appTaskType;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_9;
LABEL_5:
  v7 = 2654435761 * self->_taskAppBundleId;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  unsigned int v5;
  const __CFString *v6;
  unsigned int v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  unsigned int v13;
  const __CFString *v14;
  unsigned int v15;
  const __CFString *v16;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v5 = -[ODDSiriSchemaODDDeviceAndUsageDynamicDimensions appTaskType](self, "appTaskType") - 1;
    if (v5 > 3)
      v6 = CFSTR("ODDAPPTASKTYPE_UNKNOWN");
    else
      v6 = off_1E563BC50[v5];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("appTaskType"));
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v7 = -[ODDSiriSchemaODDDeviceAndUsageDynamicDimensions audioInterface](self, "audioInterface") - 1;
    if (v7 > 0xE)
      v8 = CFSTR("AUDIOINPUTROUTE_UNKNOWN");
    else
      v8 = off_1E563BC70[v7];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("audioInterface"));
  }
  if (self->_siriInputLocale)
  {
    -[ODDSiriSchemaODDDeviceAndUsageDynamicDimensions siriInputLocale](self, "siriInputLocale");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("siriInputLocale"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("siriInputLocale"));

    }
  }
  v12 = (char)self->_has;
  if ((v12 & 8) != 0)
  {
    v13 = -[ODDSiriSchemaODDDeviceAndUsageDynamicDimensions taskAppBundleId](self, "taskAppBundleId") - 1;
    if (v13 > 2)
      v14 = CFSTR("ODDTASKAPPBUNDLEID_UNKNOWN");
    else
      v14 = off_1E563BCE8[v13];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("taskAppBundleId"));
    v12 = (char)self->_has;
  }
  if ((v12 & 1) != 0)
  {
    v15 = -[ODDSiriSchemaODDDeviceAndUsageDynamicDimensions viewInterface](self, "viewInterface") - 1;
    if (v15 > 7)
      v16 = CFSTR("ASSISTANTVIEWMODE_UNKNOWN");
    else
      v16 = off_1E563BD00[v15];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("viewInterface"));
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[ODDSiriSchemaODDDeviceAndUsageDynamicDimensions dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (ODDSiriSchemaODDDeviceAndUsageDynamicDimensions)initWithJSON:(id)a3
{
  void *v4;
  ODDSiriSchemaODDDeviceAndUsageDynamicDimensions *v5;
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
    self = -[ODDSiriSchemaODDDeviceAndUsageDynamicDimensions initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (ODDSiriSchemaODDDeviceAndUsageDynamicDimensions)initWithDictionary:(id)a3
{
  id v4;
  ODDSiriSchemaODDDeviceAndUsageDynamicDimensions *v5;
  void *v6;
  SISchemaISOLocale *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  ODDSiriSchemaODDDeviceAndUsageDynamicDimensions *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ODDSiriSchemaODDDeviceAndUsageDynamicDimensions;
  v5 = -[ODDSiriSchemaODDDeviceAndUsageDynamicDimensions init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("siriInputLocale"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaISOLocale initWithDictionary:]([SISchemaISOLocale alloc], "initWithDictionary:", v6);
      -[ODDSiriSchemaODDDeviceAndUsageDynamicDimensions setSiriInputLocale:](v5, "setSiriInputLocale:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("viewInterface"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ODDSiriSchemaODDDeviceAndUsageDynamicDimensions setViewInterface:](v5, "setViewInterface:", objc_msgSend(v8, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("audioInterface"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ODDSiriSchemaODDDeviceAndUsageDynamicDimensions setAudioInterface:](v5, "setAudioInterface:", objc_msgSend(v9, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appTaskType"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ODDSiriSchemaODDDeviceAndUsageDynamicDimensions setAppTaskType:](v5, "setAppTaskType:", objc_msgSend(v10, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("taskAppBundleId"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ODDSiriSchemaODDDeviceAndUsageDynamicDimensions setTaskAppBundleId:](v5, "setTaskAppBundleId:", objc_msgSend(v11, "intValue"));
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

- (int)viewInterface
{
  return self->_viewInterface;
}

- (int)audioInterface
{
  return self->_audioInterface;
}

- (int)appTaskType
{
  return self->_appTaskType;
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
