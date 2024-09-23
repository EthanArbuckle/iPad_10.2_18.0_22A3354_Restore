@implementation TTSSchemaTTSVoiceContext

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setVoiceType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_voiceType = a3;
}

- (BOOL)hasVoiceType
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasVoiceType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteVoiceType
{
  -[TTSSchemaTTSVoiceContext setVoiceType:](self, "setVoiceType:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setVoiceFootprint:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_voiceFootprint = a3;
}

- (BOOL)hasVoiceFootprint
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasVoiceFootprint:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteVoiceFootprint
{
  -[TTSSchemaTTSVoiceContext setVoiceFootprint:](self, "setVoiceFootprint:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setVoiceVersion:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_voiceVersion = a3;
}

- (BOOL)hasVoiceVersion
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasVoiceVersion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteVoiceVersion
{
  -[TTSSchemaTTSVoiceContext setVoiceVersion:](self, "setVoiceVersion:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (void)setResourceVersion:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_resourceVersion = a3;
}

- (BOOL)hasResourceVersion
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasResourceVersion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)deleteResourceVersion
{
  -[TTSSchemaTTSVoiceContext setResourceVersion:](self, "setResourceVersion:", 0);
  *(_BYTE *)&self->_has &= ~8u;
}

- (void)setVoiceName:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_voiceName = a3;
}

- (BOOL)hasVoiceName
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setHasVoiceName:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (void)deleteVoiceName
{
  -[TTSSchemaTTSVoiceContext setVoiceName:](self, "setVoiceName:", 0);
  *(_BYTE *)&self->_has &= ~0x10u;
}

- (BOOL)readFrom:(id)a3
{
  return TTSSchemaTTSVoiceContextReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
LABEL_11:
    PBDataWriterWriteUint32Field();
    if ((*(_BYTE *)&self->_has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_10:
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_11;
LABEL_5:
  if ((has & 0x10) != 0)
LABEL_6:
    PBDataWriterWriteInt32Field();
LABEL_7:

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $5501C8C9C290B9FE42F7871BD3F5DE51 has;
  unsigned int v6;
  int voiceType;
  int v8;
  int voiceFootprint;
  int v10;
  unsigned int voiceVersion;
  int v12;
  unsigned int resourceVersion;
  int v14;
  int voiceName;
  BOOL v16;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_22;
  has = self->_has;
  v6 = v4[28];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_22;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    voiceType = self->_voiceType;
    if (voiceType != objc_msgSend(v4, "voiceType"))
      goto LABEL_22;
    has = self->_has;
    v6 = v4[28];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_22;
  if (v8)
  {
    voiceFootprint = self->_voiceFootprint;
    if (voiceFootprint != objc_msgSend(v4, "voiceFootprint"))
      goto LABEL_22;
    has = self->_has;
    v6 = v4[28];
  }
  v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1))
    goto LABEL_22;
  if (v10)
  {
    voiceVersion = self->_voiceVersion;
    if (voiceVersion != objc_msgSend(v4, "voiceVersion"))
      goto LABEL_22;
    has = self->_has;
    v6 = v4[28];
  }
  v12 = (*(unsigned int *)&has >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1))
    goto LABEL_22;
  if (v12)
  {
    resourceVersion = self->_resourceVersion;
    if (resourceVersion == objc_msgSend(v4, "resourceVersion"))
    {
      has = self->_has;
      v6 = v4[28];
      goto LABEL_18;
    }
LABEL_22:
    v16 = 0;
    goto LABEL_23;
  }
LABEL_18:
  v14 = (*(unsigned int *)&has >> 4) & 1;
  if (v14 != ((v6 >> 4) & 1))
    goto LABEL_22;
  if (v14)
  {
    voiceName = self->_voiceName;
    if (voiceName != objc_msgSend(v4, "voiceName"))
      goto LABEL_22;
  }
  v16 = 1;
LABEL_23:

  return v16;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v2 = 2654435761 * self->_voiceType;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v3 = 2654435761 * self->_voiceFootprint;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_4:
    v4 = 2654435761 * self->_voiceVersion;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_5;
LABEL_10:
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_6;
LABEL_11:
    v6 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6;
  }
LABEL_9:
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_10;
LABEL_5:
  v5 = 2654435761 * self->_resourceVersion;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    goto LABEL_11;
LABEL_6:
  v6 = 2654435761 * self->_voiceName;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v7;
  unsigned int v8;
  const __CFString *v9;
  unsigned int v10;
  const __CFString *v11;
  unsigned int v12;
  const __CFString *v13;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[TTSSchemaTTSVoiceContext resourceVersion](self, "resourceVersion"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("resourceVersion"));

    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  v8 = -[TTSSchemaTTSVoiceContext voiceFootprint](self, "voiceFootprint") - 1;
  if (v8 > 3)
    v9 = CFSTR("UNKNOWN");
  else
    v9 = off_1E5638528[v8];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("voiceFootprint"));
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 1) == 0)
      goto LABEL_5;
LABEL_17:
    v12 = -[TTSSchemaTTSVoiceContext voiceType](self, "voiceType") - 1;
    if (v12 > 4)
      v13 = CFSTR("UNKNOWN");
    else
      v13 = off_1E5638830[v12];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("voiceType"));
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_6;
    goto LABEL_7;
  }
LABEL_13:
  v10 = -[TTSSchemaTTSVoiceContext voiceName](self, "voiceName") - 1;
  if (v10 > 0x5C)
    v11 = CFSTR("VOICENAME_UNKNOWN");
  else
    v11 = off_1E5638548[v10];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("voiceName"));
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_17;
LABEL_5:
  if ((has & 4) != 0)
  {
LABEL_6:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[TTSSchemaTTSVoiceContext voiceVersion](self, "voiceVersion"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("voiceVersion"));

  }
LABEL_7:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[TTSSchemaTTSVoiceContext dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (TTSSchemaTTSVoiceContext)initWithJSON:(id)a3
{
  void *v4;
  TTSSchemaTTSVoiceContext *v5;
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
    self = -[TTSSchemaTTSVoiceContext initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (TTSSchemaTTSVoiceContext)initWithDictionary:(id)a3
{
  id v4;
  TTSSchemaTTSVoiceContext *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  TTSSchemaTTSVoiceContext *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TTSSchemaTTSVoiceContext;
  v5 = -[TTSSchemaTTSVoiceContext init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("voiceType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[TTSSchemaTTSVoiceContext setVoiceType:](v5, "setVoiceType:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("voiceFootprint"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[TTSSchemaTTSVoiceContext setVoiceFootprint:](v5, "setVoiceFootprint:", objc_msgSend(v7, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("voiceVersion"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[TTSSchemaTTSVoiceContext setVoiceVersion:](v5, "setVoiceVersion:", objc_msgSend(v8, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("resourceVersion"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[TTSSchemaTTSVoiceContext setResourceVersion:](v5, "setResourceVersion:", objc_msgSend(v9, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("voiceName"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[TTSSchemaTTSVoiceContext setVoiceName:](v5, "setVoiceName:", objc_msgSend(v10, "intValue"));
    v11 = v5;

  }
  return v5;
}

- (int)voiceType
{
  return self->_voiceType;
}

- (int)voiceFootprint
{
  return self->_voiceFootprint;
}

- (unsigned)voiceVersion
{
  return self->_voiceVersion;
}

- (unsigned)resourceVersion
{
  return self->_resourceVersion;
}

- (int)voiceName
{
  return self->_voiceName;
}

@end
