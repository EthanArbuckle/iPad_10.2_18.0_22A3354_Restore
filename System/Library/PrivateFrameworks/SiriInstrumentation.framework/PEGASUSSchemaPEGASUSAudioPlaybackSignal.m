@implementation PEGASUSSchemaPEGASUSAudioPlaybackSignal

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setAudioPlaybackQueueLocation:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_audioPlaybackQueueLocation = a3;
}

- (BOOL)hasAudioPlaybackQueueLocation
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasAudioPlaybackQueueLocation:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteAudioPlaybackQueueLocation
{
  -[PEGASUSSchemaPEGASUSAudioPlaybackSignal setAudioPlaybackQueueLocation:](self, "setAudioPlaybackQueueLocation:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setAudioPlaybackSpeed:(float)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_audioPlaybackSpeed = a3;
}

- (BOOL)hasAudioPlaybackSpeed
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasAudioPlaybackSpeed:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteAudioPlaybackSpeed
{
  double v2;

  LODWORD(v2) = 0;
  -[PEGASUSSchemaPEGASUSAudioPlaybackSignal setAudioPlaybackSpeed:](self, "setAudioPlaybackSpeed:", v2);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)readFrom:(id)a3
{
  double v3;

  return PEGASUSSchemaPEGASUSAudioPlaybackSignalReadFrom(self, (uint64_t)a3, v3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  has = (char)self->_has;
  v6 = v4;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteFloatField();
    v4 = v6;
  }

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $10BB006E35C241C8874FEF93FA132A15 has;
  unsigned int v6;
  int audioPlaybackQueueLocation;
  int v8;
  float audioPlaybackSpeed;
  float v10;
  BOOL v11;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_9;
  has = self->_has;
  v6 = v4[16];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_9;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    audioPlaybackQueueLocation = self->_audioPlaybackQueueLocation;
    if (audioPlaybackQueueLocation != objc_msgSend(v4, "audioPlaybackQueueLocation"))
      goto LABEL_9;
    has = self->_has;
    v6 = v4[16];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 == ((v6 >> 1) & 1))
  {
    if (!v8
      || (audioPlaybackSpeed = self->_audioPlaybackSpeed,
          objc_msgSend(v4, "audioPlaybackSpeed"),
          audioPlaybackSpeed == v10))
    {
      v11 = 1;
      goto LABEL_10;
    }
  }
LABEL_9:
  v11 = 0;
LABEL_10:

  return v11;
}

- (unint64_t)hash
{
  uint64_t v2;
  float audioPlaybackSpeed;
  double v4;
  long double v5;
  double v6;
  unint64_t v7;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v2 = 2654435761 * self->_audioPlaybackQueueLocation;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_8:
    v7 = 0;
    return v7 ^ v2;
  }
  v2 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_8;
LABEL_3:
  audioPlaybackSpeed = self->_audioPlaybackSpeed;
  v4 = audioPlaybackSpeed;
  if (audioPlaybackSpeed < 0.0)
    v4 = -audioPlaybackSpeed;
  v5 = floor(v4 + 0.5);
  v6 = (v4 - v5) * 1.84467441e19;
  v7 = 2654435761u * (unint64_t)fmod(v5, 1.84467441e19);
  if (v6 >= 0.0)
  {
    if (v6 > 0.0)
      v7 += (unint64_t)v6;
  }
  else
  {
    v7 -= (unint64_t)fabs(v6);
  }
  return v7 ^ v2;
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
    v5 = -[PEGASUSSchemaPEGASUSAudioPlaybackSignal audioPlaybackQueueLocation](self, "audioPlaybackQueueLocation") - 1;
    if (v5 > 2)
      v6 = CFSTR("PEGASUSAUDIOPLAYBACKQUEUELOCATION_UNKNOWN");
    else
      v6 = off_1E563B390[v5];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("audioPlaybackQueueLocation"));
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v7 = (void *)MEMORY[0x1E0CB37E8];
    -[PEGASUSSchemaPEGASUSAudioPlaybackSignal audioPlaybackSpeed](self, "audioPlaybackSpeed");
    objc_msgSend(v7, "numberWithFloat:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("audioPlaybackSpeed"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PEGASUSSchemaPEGASUSAudioPlaybackSignal dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (PEGASUSSchemaPEGASUSAudioPlaybackSignal)initWithJSON:(id)a3
{
  void *v4;
  PEGASUSSchemaPEGASUSAudioPlaybackSignal *v5;
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
    self = -[PEGASUSSchemaPEGASUSAudioPlaybackSignal initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PEGASUSSchemaPEGASUSAudioPlaybackSignal)initWithDictionary:(id)a3
{
  id v4;
  PEGASUSSchemaPEGASUSAudioPlaybackSignal *v5;
  void *v6;
  void *v7;
  PEGASUSSchemaPEGASUSAudioPlaybackSignal *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PEGASUSSchemaPEGASUSAudioPlaybackSignal;
  v5 = -[PEGASUSSchemaPEGASUSAudioPlaybackSignal init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("audioPlaybackQueueLocation"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PEGASUSSchemaPEGASUSAudioPlaybackSignal setAudioPlaybackQueueLocation:](v5, "setAudioPlaybackQueueLocation:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("audioPlaybackSpeed"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "floatValue");
      -[PEGASUSSchemaPEGASUSAudioPlaybackSignal setAudioPlaybackSpeed:](v5, "setAudioPlaybackSpeed:");
    }
    v8 = v5;

  }
  return v5;
}

- (int)audioPlaybackQueueLocation
{
  return self->_audioPlaybackQueueLocation;
}

- (float)audioPlaybackSpeed
{
  return self->_audioPlaybackSpeed;
}

@end
