@implementation MTSchemaMTTranslationTTSPlayed

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setSourceOrTarget:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_sourceOrTarget = a3;
}

- (BOOL)hasSourceOrTarget
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasSourceOrTarget:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteSourceOrTarget
{
  -[MTSchemaMTTranslationTTSPlayed setSourceOrTarget:](self, "setSourceOrTarget:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setIsAutoplayTranslation:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_isAutoplayTranslation = a3;
}

- (BOOL)hasIsAutoplayTranslation
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasIsAutoplayTranslation:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteIsAutoplayTranslation
{
  -[MTSchemaMTTranslationTTSPlayed setIsAutoplayTranslation:](self, "setIsAutoplayTranslation:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setPlaybackSpeed:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_playbackSpeed = a3;
}

- (BOOL)hasPlaybackSpeed
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasPlaybackSpeed:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deletePlaybackSpeed
{
  -[MTSchemaMTTranslationTTSPlayed setPlaybackSpeed:](self, "setPlaybackSpeed:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (void)setAudioChannel:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_audioChannel = a3;
}

- (BOOL)hasAudioChannel
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasAudioChannel:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)deleteAudioChannel
{
  -[MTSchemaMTTranslationTTSPlayed setAudioChannel:](self, "setAudioChannel:", 0);
  *(_BYTE *)&self->_has &= ~8u;
}

- (BOOL)readFrom:(id)a3
{
  return MTSchemaMTTranslationTTSPlayedReadFrom(self, (uint64_t)a3);
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
LABEL_9:
      PBDataWriterWriteInt32Field();
      if ((*(_BYTE *)&self->_has & 8) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_9;
LABEL_4:
  if ((has & 8) != 0)
LABEL_5:
    PBDataWriterWriteInt32Field();
LABEL_6:

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $9110518B41D4E7E4CE2BC12E3A3FBD4E has;
  unsigned int v6;
  int sourceOrTarget;
  int v8;
  int isAutoplayTranslation;
  int v10;
  int playbackSpeed;
  int v12;
  int audioChannel;
  BOOL v14;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_18;
  has = self->_has;
  v6 = v4[24];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_18;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    sourceOrTarget = self->_sourceOrTarget;
    if (sourceOrTarget != objc_msgSend(v4, "sourceOrTarget"))
      goto LABEL_18;
    has = self->_has;
    v6 = v4[24];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_18;
  if (v8)
  {
    isAutoplayTranslation = self->_isAutoplayTranslation;
    if (isAutoplayTranslation != objc_msgSend(v4, "isAutoplayTranslation"))
      goto LABEL_18;
    has = self->_has;
    v6 = v4[24];
  }
  v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1))
    goto LABEL_18;
  if (v10)
  {
    playbackSpeed = self->_playbackSpeed;
    if (playbackSpeed == objc_msgSend(v4, "playbackSpeed"))
    {
      has = self->_has;
      v6 = v4[24];
      goto LABEL_14;
    }
LABEL_18:
    v14 = 0;
    goto LABEL_19;
  }
LABEL_14:
  v12 = (*(unsigned int *)&has >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1))
    goto LABEL_18;
  if (v12)
  {
    audioChannel = self->_audioChannel;
    if (audioChannel != objc_msgSend(v4, "audioChannel"))
      goto LABEL_18;
  }
  v14 = 1;
LABEL_19:

  return v14;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v2 = 2654435761 * self->_sourceOrTarget;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v3 = 2654435761 * self->_isAutoplayTranslation;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_4;
LABEL_8:
      v4 = 0;
      if ((*(_BYTE *)&self->_has & 8) != 0)
        goto LABEL_5;
LABEL_9:
      v5 = 0;
      return v3 ^ v2 ^ v4 ^ v5;
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
    goto LABEL_8;
LABEL_4:
  v4 = 2654435761 * self->_playbackSpeed;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_9;
LABEL_5:
  v5 = 2654435761 * self->_audioChannel;
  return v3 ^ v2 ^ v4 ^ v5;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  int v5;
  const __CFString *v6;
  const __CFString *v7;
  unsigned int v9;
  const __CFString *v10;
  void *v11;
  unsigned int v12;
  const __CFString *v13;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v9 = -[MTSchemaMTTranslationTTSPlayed audioChannel](self, "audioChannel") - 1;
    if (v9 > 4)
      v10 = CFSTR("MTAPPAUDIOCHANNEL_UNKNOWN");
    else
      v10 = off_1E563D590[v9];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("audioChannel"));
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
LABEL_17:
      v12 = -[MTSchemaMTTranslationTTSPlayed playbackSpeed](self, "playbackSpeed") - 1;
      if (v12 > 3)
        v13 = CFSTR("MTTTSPLAYBACKSPEED_UNKNOWN");
      else
        v13 = off_1E563D5B8[v12];
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("playbackSpeed"));
      if ((*(_BYTE *)&self->_has & 1) == 0)
        goto LABEL_11;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MTSchemaMTTranslationTTSPlayed isAutoplayTranslation](self, "isAutoplayTranslation"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("isAutoplayTranslation"));

  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_17;
LABEL_4:
  if ((has & 1) == 0)
    goto LABEL_11;
LABEL_5:
  v5 = -[MTSchemaMTTranslationTTSPlayed sourceOrTarget](self, "sourceOrTarget");
  v6 = CFSTR("MTSOURCEORTARGETLANGUAGE_UNKNOWN");
  if (v5 == 1)
    v6 = CFSTR("MTSOURCEORTARGETLANGUAGE_SOURCE");
  if (v5 == 2)
    v7 = CFSTR("MTSOURCEORTARGETLANGUAGE_TARGET");
  else
    v7 = v6;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("sourceOrTarget"));
LABEL_11:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[MTSchemaMTTranslationTTSPlayed dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (MTSchemaMTTranslationTTSPlayed)initWithJSON:(id)a3
{
  void *v4;
  MTSchemaMTTranslationTTSPlayed *v5;
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
    self = -[MTSchemaMTTranslationTTSPlayed initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (MTSchemaMTTranslationTTSPlayed)initWithDictionary:(id)a3
{
  id v4;
  MTSchemaMTTranslationTTSPlayed *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  MTSchemaMTTranslationTTSPlayed *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MTSchemaMTTranslationTTSPlayed;
  v5 = -[MTSchemaMTTranslationTTSPlayed init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sourceOrTarget"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MTSchemaMTTranslationTTSPlayed setSourceOrTarget:](v5, "setSourceOrTarget:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isAutoplayTranslation"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MTSchemaMTTranslationTTSPlayed setIsAutoplayTranslation:](v5, "setIsAutoplayTranslation:", objc_msgSend(v7, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("playbackSpeed"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MTSchemaMTTranslationTTSPlayed setPlaybackSpeed:](v5, "setPlaybackSpeed:", objc_msgSend(v8, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("audioChannel"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MTSchemaMTTranslationTTSPlayed setAudioChannel:](v5, "setAudioChannel:", objc_msgSend(v9, "intValue"));
    v10 = v5;

  }
  return v5;
}

- (int)sourceOrTarget
{
  return self->_sourceOrTarget;
}

- (BOOL)isAutoplayTranslation
{
  return self->_isAutoplayTranslation;
}

- (int)playbackSpeed
{
  return self->_playbackSpeed;
}

- (int)audioChannel
{
  return self->_audioChannel;
}

@end
