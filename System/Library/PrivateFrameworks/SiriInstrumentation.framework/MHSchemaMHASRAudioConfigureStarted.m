@implementation MHSchemaMHASRAudioConfigureStarted

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setAudioCodec:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_audioCodec = a3;
}

- (BOOL)hasAudioCodec
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasAudioCodec:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteAudioCodec
{
  -[MHSchemaMHASRAudioConfigureStarted setAudioCodec:](self, "setAudioCodec:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setAudioSkippedTimeInNs:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_audioSkippedTimeInNs = a3;
}

- (BOOL)hasAudioSkippedTimeInNs
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasAudioSkippedTimeInNs:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteAudioSkippedTimeInNs
{
  -[MHSchemaMHASRAudioConfigureStarted setAudioSkippedTimeInNs:](self, "setAudioSkippedTimeInNs:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setAudioSkippedNumSamples:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_audioSkippedNumSamples = a3;
}

- (BOOL)hasAudioSkippedNumSamples
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasAudioSkippedNumSamples:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteAudioSkippedNumSamples
{
  -[MHSchemaMHASRAudioConfigureStarted setAudioSkippedNumSamples:](self, "setAudioSkippedNumSamples:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (BOOL)readFrom:(id)a3
{
  return MHSchemaMHASRAudioConfigureStartedReadFrom(self, (uint64_t)a3);
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
    PBDataWriterWriteUint64Field();
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
    PBDataWriterWriteUint64Field();
    v4 = v6;
  }
LABEL_5:

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $FF46A8ECD1DC6D3A658563C8F87F134B has;
  unsigned int v6;
  int audioCodec;
  int v8;
  unint64_t audioSkippedTimeInNs;
  int v10;
  unint64_t audioSkippedNumSamples;
  BOOL v12;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  has = self->_has;
  v6 = v4[32];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_14;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    audioCodec = self->_audioCodec;
    if (audioCodec != objc_msgSend(v4, "audioCodec"))
      goto LABEL_14;
    has = self->_has;
    v6 = v4[32];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_14;
  if (v8)
  {
    audioSkippedTimeInNs = self->_audioSkippedTimeInNs;
    if (audioSkippedTimeInNs == objc_msgSend(v4, "audioSkippedTimeInNs"))
    {
      has = self->_has;
      v6 = v4[32];
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
    audioSkippedNumSamples = self->_audioSkippedNumSamples;
    if (audioSkippedNumSamples != objc_msgSend(v4, "audioSkippedNumSamples"))
      goto LABEL_14;
  }
  v12 = 1;
LABEL_15:

  return v12;
}

- (unint64_t)hash
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

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
  v2 = 2654435761 * self->_audioCodec;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v3 = 2654435761u * self->_audioSkippedTimeInNs;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_7;
LABEL_4:
  v4 = 2654435761u * self->_audioSkippedNumSamples;
  return v3 ^ v2 ^ v4;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  unsigned int v5;
  const __CFString *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v5 = -[MHSchemaMHASRAudioConfigureStarted audioCodec](self, "audioCodec") - 1;
    if (v5 > 0xA)
      v6 = CFSTR("MHASRAUDIOCODEC_UNKNOWN");
    else
      v6 = off_1E562FEA8[v5];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("audioCodec"));
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[MHSchemaMHASRAudioConfigureStarted audioSkippedNumSamples](self, "audioSkippedNumSamples"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("audioSkippedNumSamples"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[MHSchemaMHASRAudioConfigureStarted audioSkippedTimeInNs](self, "audioSkippedTimeInNs"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("audioSkippedTimeInNs"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[MHSchemaMHASRAudioConfigureStarted dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (MHSchemaMHASRAudioConfigureStarted)initWithJSON:(id)a3
{
  void *v4;
  MHSchemaMHASRAudioConfigureStarted *v5;
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
    self = -[MHSchemaMHASRAudioConfigureStarted initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (MHSchemaMHASRAudioConfigureStarted)initWithDictionary:(id)a3
{
  id v4;
  MHSchemaMHASRAudioConfigureStarted *v5;
  void *v6;
  void *v7;
  void *v8;
  MHSchemaMHASRAudioConfigureStarted *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MHSchemaMHASRAudioConfigureStarted;
  v5 = -[MHSchemaMHASRAudioConfigureStarted init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("audioCodec"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHASRAudioConfigureStarted setAudioCodec:](v5, "setAudioCodec:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("audioSkippedTimeInNs"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHASRAudioConfigureStarted setAudioSkippedTimeInNs:](v5, "setAudioSkippedTimeInNs:", objc_msgSend(v7, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("audioSkippedNumSamples"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHASRAudioConfigureStarted setAudioSkippedNumSamples:](v5, "setAudioSkippedNumSamples:", objc_msgSend(v8, "unsignedLongLongValue"));
    v9 = v5;

  }
  return v5;
}

- (int)audioCodec
{
  return self->_audioCodec;
}

- (unint64_t)audioSkippedTimeInNs
{
  return self->_audioSkippedTimeInNs;
}

- (unint64_t)audioSkippedNumSamples
{
  return self->_audioSkippedNumSamples;
}

@end
