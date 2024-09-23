@implementation READSchemaREADPlaybackSessionStartedOrChanged

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
  v9.super_class = (Class)READSchemaREADPlaybackSessionStartedOrChanged;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[READSchemaREADPlaybackSessionStartedOrChanged audioInterface](self, "audioInterface", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[READSchemaREADPlaybackSessionStartedOrChanged deleteAudioInterface](self, "deleteAudioInterface");
  return v5;
}

- (void)setCustomerPerceivedLatency:(float)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_customerPerceivedLatency = a3;
}

- (BOOL)hasCustomerPerceivedLatency
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasCustomerPerceivedLatency:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteCustomerPerceivedLatency
{
  double v2;

  LODWORD(v2) = 0;
  -[READSchemaREADPlaybackSessionStartedOrChanged setCustomerPerceivedLatency:](self, "setCustomerPerceivedLatency:", v2);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)hasAudioInterface
{
  return self->_audioInterface != 0;
}

- (void)deleteAudioInterface
{
  -[READSchemaREADPlaybackSessionStartedOrChanged setAudioInterface:](self, "setAudioInterface:", 0);
}

- (void)setVolume:(float)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_volume = a3;
}

- (BOOL)hasVolume
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasVolume:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteVolume
{
  double v2;

  LODWORD(v2) = 0;
  -[READSchemaREADPlaybackSessionStartedOrChanged setVolume:](self, "setVolume:", v2);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setPlaybackStateChange:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_playbackStateChange = a3;
}

- (BOOL)hasPlaybackStateChange
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasPlaybackStateChange:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deletePlaybackStateChange
{
  -[READSchemaREADPlaybackSessionStartedOrChanged setPlaybackStateChange:](self, "setPlaybackStateChange:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (BOOL)readFrom:(id)a3
{
  double v3;

  return READSchemaREADPlaybackSessionStartedOrChangedReadFrom(self, (uint64_t)a3, v3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  char has;
  id v7;

  v7 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteFloatField();
  -[READSchemaREADPlaybackSessionStartedOrChanged audioInterface](self, "audioInterface");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[READSchemaREADPlaybackSessionStartedOrChanged audioInterface](self, "audioInterface");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteFloatField();
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
    PBDataWriterWriteInt32Field();

}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  float customerPerceivedLatency;
  float v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  $63CC23D1A4492DA0C32E812D0FFCE95D has;
  int v16;
  unsigned int v17;
  float volume;
  float v19;
  int v20;
  int playbackStateChange;
  BOOL v22;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_19;
  if ((*(_BYTE *)&self->_has & 1) != (v4[32] & 1))
    goto LABEL_19;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    customerPerceivedLatency = self->_customerPerceivedLatency;
    objc_msgSend(v4, "customerPerceivedLatency");
    if (customerPerceivedLatency != v6)
      goto LABEL_19;
  }
  -[READSchemaREADPlaybackSessionStartedOrChanged audioInterface](self, "audioInterface");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "audioInterface");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if ((v7 == 0) == (v8 != 0))
  {

    goto LABEL_19;
  }
  -[READSchemaREADPlaybackSessionStartedOrChanged audioInterface](self, "audioInterface");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)v10;
    -[READSchemaREADPlaybackSessionStartedOrChanged audioInterface](self, "audioInterface");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "audioInterface");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "isEqual:", v13);

    if (!v14)
      goto LABEL_19;
  }
  else
  {

  }
  has = self->_has;
  v16 = (*(unsigned int *)&has >> 1) & 1;
  v17 = v4[32];
  if (v16 != ((v17 >> 1) & 1))
  {
LABEL_19:
    v22 = 0;
    goto LABEL_20;
  }
  if (v16)
  {
    volume = self->_volume;
    objc_msgSend(v4, "volume");
    if (volume == v19)
    {
      has = self->_has;
      v17 = v4[32];
      goto LABEL_15;
    }
    goto LABEL_19;
  }
LABEL_15:
  v20 = (*(unsigned int *)&has >> 2) & 1;
  if (v20 != ((v17 >> 2) & 1))
    goto LABEL_19;
  if (v20)
  {
    playbackStateChange = self->_playbackStateChange;
    if (playbackStateChange != objc_msgSend(v4, "playbackStateChange"))
      goto LABEL_19;
  }
  v22 = 1;
LABEL_20:

  return v22;
}

- (unint64_t)hash
{
  unint64_t v3;
  float customerPerceivedLatency;
  double v5;
  long double v6;
  double v7;
  unint64_t v8;
  char has;
  unint64_t v10;
  float volume;
  double v12;
  long double v13;
  double v14;
  uint64_t v15;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    customerPerceivedLatency = self->_customerPerceivedLatency;
    v5 = customerPerceivedLatency;
    if (customerPerceivedLatency < 0.0)
      v5 = -customerPerceivedLatency;
    v6 = floor(v5 + 0.5);
    v7 = (v5 - v6) * 1.84467441e19;
    v3 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
    if (v7 >= 0.0)
    {
      if (v7 > 0.0)
        v3 += (unint64_t)v7;
    }
    else
    {
      v3 -= (unint64_t)fabs(v7);
    }
  }
  else
  {
    v3 = 0;
  }
  v8 = -[TTSSchemaTTSAudioInterface hash](self->_audioInterface, "hash");
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    volume = self->_volume;
    v12 = volume;
    if (volume < 0.0)
      v12 = -volume;
    v13 = floor(v12 + 0.5);
    v14 = (v12 - v13) * 1.84467441e19;
    v10 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
    if (v14 >= 0.0)
    {
      if (v14 > 0.0)
        v10 += (unint64_t)v14;
    }
    else
    {
      v10 -= (unint64_t)fabs(v14);
    }
  }
  else
  {
    v10 = 0;
  }
  if ((has & 4) != 0)
    v15 = 2654435761 * self->_playbackStateChange;
  else
    v15 = 0;
  return v8 ^ v3 ^ v10 ^ v15;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char has;
  void *v8;
  void *v9;
  void *v11;
  void *v12;
  unsigned int v13;
  const __CFString *v14;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_audioInterface)
  {
    -[READSchemaREADPlaybackSessionStartedOrChanged audioInterface](self, "audioInterface");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("audioInterface"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("audioInterface"));

    }
  }
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_8;
LABEL_12:
    v13 = -[READSchemaREADPlaybackSessionStartedOrChanged playbackStateChange](self, "playbackStateChange") - 1;
    if (v13 > 3)
      v14 = CFSTR("READPLAYBACKSTATE_UNKNOWN");
    else
      v14 = off_1E563A758[v13];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("playbackStateChange"));
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_9;
    goto LABEL_10;
  }
  v11 = (void *)MEMORY[0x1E0CB37E8];
  -[READSchemaREADPlaybackSessionStartedOrChanged customerPerceivedLatency](self, "customerPerceivedLatency");
  objc_msgSend(v11, "numberWithFloat:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("customerPerceivedLatency"));

  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_12;
LABEL_8:
  if ((has & 2) != 0)
  {
LABEL_9:
    v8 = (void *)MEMORY[0x1E0CB37E8];
    -[READSchemaREADPlaybackSessionStartedOrChanged volume](self, "volume");
    objc_msgSend(v8, "numberWithFloat:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("volume"));

  }
LABEL_10:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[READSchemaREADPlaybackSessionStartedOrChanged dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (READSchemaREADPlaybackSessionStartedOrChanged)initWithJSON:(id)a3
{
  void *v4;
  READSchemaREADPlaybackSessionStartedOrChanged *v5;
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
    self = -[READSchemaREADPlaybackSessionStartedOrChanged initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (READSchemaREADPlaybackSessionStartedOrChanged)initWithDictionary:(id)a3
{
  id v4;
  READSchemaREADPlaybackSessionStartedOrChanged *v5;
  void *v6;
  void *v7;
  TTSSchemaTTSAudioInterface *v8;
  void *v9;
  void *v10;
  READSchemaREADPlaybackSessionStartedOrChanged *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)READSchemaREADPlaybackSessionStartedOrChanged;
  v5 = -[READSchemaREADPlaybackSessionStartedOrChanged init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("customerPerceivedLatency"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "floatValue");
      -[READSchemaREADPlaybackSessionStartedOrChanged setCustomerPerceivedLatency:](v5, "setCustomerPerceivedLatency:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("audioInterface"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = -[TTSSchemaTTSAudioInterface initWithDictionary:]([TTSSchemaTTSAudioInterface alloc], "initWithDictionary:", v7);
      -[READSchemaREADPlaybackSessionStartedOrChanged setAudioInterface:](v5, "setAudioInterface:", v8);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("volume"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v9, "floatValue");
      -[READSchemaREADPlaybackSessionStartedOrChanged setVolume:](v5, "setVolume:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("playbackStateChange"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[READSchemaREADPlaybackSessionStartedOrChanged setPlaybackStateChange:](v5, "setPlaybackStateChange:", objc_msgSend(v10, "intValue"));
    v11 = v5;

  }
  return v5;
}

- (float)customerPerceivedLatency
{
  return self->_customerPerceivedLatency;
}

- (TTSSchemaTTSAudioInterface)audioInterface
{
  return self->_audioInterface;
}

- (void)setAudioInterface:(id)a3
{
  objc_storeStrong((id *)&self->_audioInterface, a3);
}

- (float)volume
{
  return self->_volume;
}

- (int)playbackStateChange
{
  return self->_playbackStateChange;
}

- (void)setHasAudioInterface:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioInterface, 0);
}

@end
