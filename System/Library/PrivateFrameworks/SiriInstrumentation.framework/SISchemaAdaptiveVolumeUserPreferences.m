@implementation SISchemaAdaptiveVolumeUserPreferences

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setMostRecentIntent:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_mostRecentIntent = a3;
}

- (BOOL)hasMostRecentIntent
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasMostRecentIntent:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteMostRecentIntent
{
  -[SISchemaAdaptiveVolumeUserPreferences setMostRecentIntent:](self, "setMostRecentIntent:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setIsPermanentOffsetEnabled:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_isPermanentOffsetEnabled = a3;
}

- (BOOL)hasIsPermanentOffsetEnabled
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasIsPermanentOffsetEnabled:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteIsPermanentOffsetEnabled
{
  -[SISchemaAdaptiveVolumeUserPreferences setIsPermanentOffsetEnabled:](self, "setIsPermanentOffsetEnabled:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setPermanentOffsetFactor:(float)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_permanentOffsetFactor = a3;
}

- (BOOL)hasPermanentOffsetFactor
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasPermanentOffsetFactor:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deletePermanentOffsetFactor
{
  double v2;

  LODWORD(v2) = 0;
  -[SISchemaAdaptiveVolumeUserPreferences setPermanentOffsetFactor:](self, "setPermanentOffsetFactor:", v2);
  *(_BYTE *)&self->_has &= ~4u;
}

- (BOOL)readFrom:(id)a3
{
  double v3;

  return SISchemaAdaptiveVolumeUserPreferencesReadFrom(self, (uint64_t)a3, v3);
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
    PBDataWriterWriteFloatField();
    v4 = v6;
  }
LABEL_5:

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $0CBEF5873A4452135E3834B78C751B3F has;
  unsigned int v6;
  int mostRecentIntent;
  int v8;
  int isPermanentOffsetEnabled;
  int v10;
  float permanentOffsetFactor;
  float v12;
  BOOL v13;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_13;
  has = self->_has;
  v6 = v4[20];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_13;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    mostRecentIntent = self->_mostRecentIntent;
    if (mostRecentIntent != objc_msgSend(v4, "mostRecentIntent"))
      goto LABEL_13;
    has = self->_has;
    v6 = v4[20];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 == ((v6 >> 1) & 1))
  {
    if (v8)
    {
      isPermanentOffsetEnabled = self->_isPermanentOffsetEnabled;
      if (isPermanentOffsetEnabled != objc_msgSend(v4, "isPermanentOffsetEnabled"))
        goto LABEL_13;
      has = self->_has;
      v6 = v4[20];
    }
    v10 = (*(unsigned int *)&has >> 2) & 1;
    if (v10 == ((v6 >> 2) & 1))
    {
      if (!v10
        || (permanentOffsetFactor = self->_permanentOffsetFactor,
            objc_msgSend(v4, "permanentOffsetFactor"),
            permanentOffsetFactor == v12))
      {
        v13 = 1;
        goto LABEL_14;
      }
    }
  }
LABEL_13:
  v13 = 0;
LABEL_14:

  return v13;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  float permanentOffsetFactor;
  double v5;
  long double v6;
  double v7;
  unint64_t v8;

  if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_9:
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_4;
LABEL_10:
    v8 = 0;
    return v3 ^ v2 ^ v8;
  }
  v2 = 2654435761 * self->_mostRecentIntent;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_9;
LABEL_3:
  v3 = 2654435761 * self->_isPermanentOffsetEnabled;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_10;
LABEL_4:
  permanentOffsetFactor = self->_permanentOffsetFactor;
  v5 = permanentOffsetFactor;
  if (permanentOffsetFactor < 0.0)
    v5 = -permanentOffsetFactor;
  v6 = floor(v5 + 0.5);
  v7 = (v5 - v6) * 1.84467441e19;
  v8 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
  if (v7 >= 0.0)
  {
    if (v7 > 0.0)
      v8 += (unint64_t)v7;
  }
  else
  {
    v8 -= (unint64_t)fabs(v7);
  }
  return v3 ^ v2 ^ v8;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v6;
  void *v8;
  unsigned int v9;
  const __CFString *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_3;
LABEL_7:
    v9 = -[SISchemaAdaptiveVolumeUserPreferences mostRecentIntent](self, "mostRecentIntent") - 1;
    if (v9 > 3)
      v10 = CFSTR("ADAPTIVEVOLUMEUSERINTENT_UNKNOWN");
    else
      v10 = off_1E5633E88[v9];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("mostRecentIntent"));
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_4;
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SISchemaAdaptiveVolumeUserPreferences isPermanentOffsetEnabled](self, "isPermanentOffsetEnabled"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("isPermanentOffsetEnabled"));

  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    v5 = (void *)MEMORY[0x1E0CB37E8];
    -[SISchemaAdaptiveVolumeUserPreferences permanentOffsetFactor](self, "permanentOffsetFactor");
    objc_msgSend(v5, "numberWithFloat:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("permanentOffsetFactor"));

  }
LABEL_5:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SISchemaAdaptiveVolumeUserPreferences dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (SISchemaAdaptiveVolumeUserPreferences)initWithJSON:(id)a3
{
  void *v4;
  SISchemaAdaptiveVolumeUserPreferences *v5;
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
    self = -[SISchemaAdaptiveVolumeUserPreferences initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SISchemaAdaptiveVolumeUserPreferences)initWithDictionary:(id)a3
{
  id v4;
  SISchemaAdaptiveVolumeUserPreferences *v5;
  void *v6;
  void *v7;
  void *v8;
  SISchemaAdaptiveVolumeUserPreferences *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SISchemaAdaptiveVolumeUserPreferences;
  v5 = -[SISchemaAdaptiveVolumeUserPreferences init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mostRecentIntent"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaAdaptiveVolumeUserPreferences setMostRecentIntent:](v5, "setMostRecentIntent:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isPermanentOffsetEnabled"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaAdaptiveVolumeUserPreferences setIsPermanentOffsetEnabled:](v5, "setIsPermanentOffsetEnabled:", objc_msgSend(v7, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("permanentOffsetFactor"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v8, "floatValue");
      -[SISchemaAdaptiveVolumeUserPreferences setPermanentOffsetFactor:](v5, "setPermanentOffsetFactor:");
    }
    v9 = v5;

  }
  return v5;
}

- (int)mostRecentIntent
{
  return self->_mostRecentIntent;
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
