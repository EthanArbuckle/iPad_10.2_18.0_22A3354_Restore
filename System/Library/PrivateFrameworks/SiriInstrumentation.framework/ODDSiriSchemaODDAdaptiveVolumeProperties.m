@implementation ODDSiriSchemaODDAdaptiveVolumeProperties

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setIsAdaptiveVolumeEnabled:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_isAdaptiveVolumeEnabled = a3;
}

- (BOOL)hasIsAdaptiveVolumeEnabled
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasIsAdaptiveVolumeEnabled:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteIsAdaptiveVolumeEnabled
{
  -[ODDSiriSchemaODDAdaptiveVolumeProperties setIsAdaptiveVolumeEnabled:](self, "setIsAdaptiveVolumeEnabled:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setAdaptiveVolume:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_adaptiveVolume = a3;
}

- (BOOL)hasAdaptiveVolume
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasAdaptiveVolume:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteAdaptiveVolume
{
  -[ODDSiriSchemaODDAdaptiveVolumeProperties setAdaptiveVolume:](self, "setAdaptiveVolume:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setIsPermanentOffsetEnabled:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_isPermanentOffsetEnabled = a3;
}

- (BOOL)hasIsPermanentOffsetEnabled
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasIsPermanentOffsetEnabled:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteIsPermanentOffsetEnabled
{
  -[ODDSiriSchemaODDAdaptiveVolumeProperties setIsPermanentOffsetEnabled:](self, "setIsPermanentOffsetEnabled:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (void)setPermanentOffsetFactor:(float)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_permanentOffsetFactor = a3;
}

- (BOOL)hasPermanentOffsetFactor
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasPermanentOffsetFactor:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)deletePermanentOffsetFactor
{
  double v2;

  LODWORD(v2) = 0;
  -[ODDSiriSchemaODDAdaptiveVolumeProperties setPermanentOffsetFactor:](self, "setPermanentOffsetFactor:", v2);
  *(_BYTE *)&self->_has &= ~8u;
}

- (BOOL)readFrom:(id)a3
{
  double v3;

  return ODDSiriSchemaODDAdaptiveVolumePropertiesReadFrom(self, (uint64_t)a3, v3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
LABEL_9:
      PBDataWriterWriteBOOLField();
      if ((*(_BYTE *)&self->_has & 8) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_9;
LABEL_4:
  if ((has & 8) != 0)
LABEL_5:
    PBDataWriterWriteFloatField();
LABEL_6:

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $3FAB968AB4C877F155AA3EB238C08006 has;
  unsigned int v6;
  int isAdaptiveVolumeEnabled;
  int v8;
  int adaptiveVolume;
  int v10;
  int isPermanentOffsetEnabled;
  int v12;
  float permanentOffsetFactor;
  float v14;
  BOOL v15;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  has = self->_has;
  v6 = v4[24];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_17;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    isAdaptiveVolumeEnabled = self->_isAdaptiveVolumeEnabled;
    if (isAdaptiveVolumeEnabled != objc_msgSend(v4, "isAdaptiveVolumeEnabled"))
      goto LABEL_17;
    has = self->_has;
    v6 = v4[24];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 == ((v6 >> 1) & 1))
  {
    if (v8)
    {
      adaptiveVolume = self->_adaptiveVolume;
      if (adaptiveVolume != objc_msgSend(v4, "adaptiveVolume"))
        goto LABEL_17;
      has = self->_has;
      v6 = v4[24];
    }
    v10 = (*(unsigned int *)&has >> 2) & 1;
    if (v10 == ((v6 >> 2) & 1))
    {
      if (v10)
      {
        isPermanentOffsetEnabled = self->_isPermanentOffsetEnabled;
        if (isPermanentOffsetEnabled != objc_msgSend(v4, "isPermanentOffsetEnabled"))
          goto LABEL_17;
        has = self->_has;
        v6 = v4[24];
      }
      v12 = (*(unsigned int *)&has >> 3) & 1;
      if (v12 == ((v6 >> 3) & 1))
      {
        if (!v12
          || (permanentOffsetFactor = self->_permanentOffsetFactor,
              objc_msgSend(v4, "permanentOffsetFactor"),
              permanentOffsetFactor == v14))
        {
          v15 = 1;
          goto LABEL_18;
        }
      }
    }
  }
LABEL_17:
  v15 = 0;
LABEL_18:

  return v15;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  float permanentOffsetFactor;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v2 = 2654435761 * self->_isAdaptiveVolumeEnabled;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v3 = 2654435761 * self->_adaptiveVolume;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_4;
LABEL_11:
      v4 = 0;
      if ((*(_BYTE *)&self->_has & 8) != 0)
        goto LABEL_5;
LABEL_12:
      v9 = 0;
      return v3 ^ v2 ^ v4 ^ v9;
    }
  }
  else
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_11;
LABEL_4:
  v4 = 2654435761 * self->_isPermanentOffsetEnabled;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_12;
LABEL_5:
  permanentOffsetFactor = self->_permanentOffsetFactor;
  v6 = permanentOffsetFactor;
  if (permanentOffsetFactor < 0.0)
    v6 = -permanentOffsetFactor;
  v7 = floor(v6 + 0.5);
  v8 = (v6 - v7) * 1.84467441e19;
  v9 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
  if (v8 >= 0.0)
  {
    if (v8 > 0.0)
      v9 += (unint64_t)v8;
  }
  else
  {
    v9 -= (unint64_t)fabs(v8);
  }
  return v3 ^ v2 ^ v4 ^ v9;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  unsigned int v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5 = -[ODDSiriSchemaODDAdaptiveVolumeProperties adaptiveVolume](self, "adaptiveVolume") - 1;
    if (v5 > 3)
      v6 = CFSTR("ODDADAPTIVEVOLUMEUSERINTENT_UNKNOWN");
    else
      v6 = off_1E563BD40[v5];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("adaptiveVolume"));
    has = (char)self->_has;
  }
  if ((has & 1) == 0)
  {
    if ((has & 4) == 0)
      goto LABEL_8;
LABEL_12:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ODDSiriSchemaODDAdaptiveVolumeProperties isPermanentOffsetEnabled](self, "isPermanentOffsetEnabled"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("isPermanentOffsetEnabled"));

    if ((*(_BYTE *)&self->_has & 8) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ODDSiriSchemaODDAdaptiveVolumeProperties isAdaptiveVolumeEnabled](self, "isAdaptiveVolumeEnabled"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("isAdaptiveVolumeEnabled"));

  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_12;
LABEL_8:
  if ((has & 8) != 0)
  {
LABEL_9:
    v7 = (void *)MEMORY[0x1E0CB37E8];
    -[ODDSiriSchemaODDAdaptiveVolumeProperties permanentOffsetFactor](self, "permanentOffsetFactor");
    objc_msgSend(v7, "numberWithFloat:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("permanentOffsetFactor"));

  }
LABEL_10:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[ODDSiriSchemaODDAdaptiveVolumeProperties dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (ODDSiriSchemaODDAdaptiveVolumeProperties)initWithJSON:(id)a3
{
  void *v4;
  ODDSiriSchemaODDAdaptiveVolumeProperties *v5;
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
    self = -[ODDSiriSchemaODDAdaptiveVolumeProperties initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (ODDSiriSchemaODDAdaptiveVolumeProperties)initWithDictionary:(id)a3
{
  id v4;
  ODDSiriSchemaODDAdaptiveVolumeProperties *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  ODDSiriSchemaODDAdaptiveVolumeProperties *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ODDSiriSchemaODDAdaptiveVolumeProperties;
  v5 = -[ODDSiriSchemaODDAdaptiveVolumeProperties init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isAdaptiveVolumeEnabled"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ODDSiriSchemaODDAdaptiveVolumeProperties setIsAdaptiveVolumeEnabled:](v5, "setIsAdaptiveVolumeEnabled:", objc_msgSend(v6, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("adaptiveVolume"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ODDSiriSchemaODDAdaptiveVolumeProperties setAdaptiveVolume:](v5, "setAdaptiveVolume:", objc_msgSend(v7, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isPermanentOffsetEnabled"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ODDSiriSchemaODDAdaptiveVolumeProperties setIsPermanentOffsetEnabled:](v5, "setIsPermanentOffsetEnabled:", objc_msgSend(v8, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("permanentOffsetFactor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v9, "floatValue");
      -[ODDSiriSchemaODDAdaptiveVolumeProperties setPermanentOffsetFactor:](v5, "setPermanentOffsetFactor:");
    }
    v10 = v5;

  }
  return v5;
}

- (BOOL)isAdaptiveVolumeEnabled
{
  return self->_isAdaptiveVolumeEnabled;
}

- (int)adaptiveVolume
{
  return self->_adaptiveVolume;
}

- (BOOL)isPermanentOffsetEnabled
{
  return self->_isPermanentOffsetEnabled;
}

- (float)permanentOffsetFactor
{
  return self->_permanentOffsetFactor;
}

@end
