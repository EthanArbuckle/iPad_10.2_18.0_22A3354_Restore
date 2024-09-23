@implementation TTSSchemaTTSSpeechStarted

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
  int v8;
  void *v9;
  void *v10;
  int v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TTSSchemaTTSSpeechStarted;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v13, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TTSSchemaTTSSpeechStarted voiceContext](self, "voiceContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[TTSSchemaTTSSpeechStarted deleteVoiceContext](self, "deleteVoiceContext");
  -[TTSSchemaTTSSpeechStarted audioInterface](self, "audioInterface");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[TTSSchemaTTSSpeechStarted deleteAudioInterface](self, "deleteAudioInterface");

  return v5;
}

- (void)setAudioOutputRoute:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_audioOutputRoute = a3;
}

- (BOOL)hasAudioOutputRoute
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasAudioOutputRoute:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteAudioOutputRoute
{
  -[TTSSchemaTTSSpeechStarted setAudioOutputRoute:](self, "setAudioOutputRoute:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setCustomerPerceivedLatencyInSecond:(float)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_customerPerceivedLatencyInSecond = a3;
}

- (BOOL)hasCustomerPerceivedLatencyInSecond
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasCustomerPerceivedLatencyInSecond:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteCustomerPerceivedLatencyInSecond
{
  double v2;

  LODWORD(v2) = 0;
  -[TTSSchemaTTSSpeechStarted setCustomerPerceivedLatencyInSecond:](self, "setCustomerPerceivedLatencyInSecond:", v2);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setSynthesisSource:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_synthesisSource = a3;
}

- (BOOL)hasSynthesisSource
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasSynthesisSource:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteSynthesisSource
{
  -[TTSSchemaTTSSpeechStarted setSynthesisSource:](self, "setSynthesisSource:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (BOOL)hasVoiceContext
{
  return self->_voiceContext != 0;
}

- (void)deleteVoiceContext
{
  -[TTSSchemaTTSSpeechStarted setVoiceContext:](self, "setVoiceContext:", 0);
}

- (void)setSynthesisEffect:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_synthesisEffect = a3;
}

- (BOOL)hasSynthesisEffect
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasSynthesisEffect:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)deleteSynthesisEffect
{
  -[TTSSchemaTTSSpeechStarted setSynthesisEffect:](self, "setSynthesisEffect:", 0);
  *(_BYTE *)&self->_has &= ~8u;
}

- (BOOL)hasAudioInterface
{
  return self->_audioInterface != 0;
}

- (void)deleteAudioInterface
{
  -[TTSSchemaTTSSpeechStarted setAudioInterface:](self, "setAudioInterface:", 0);
}

- (void)setVolume:(float)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_volume = a3;
}

- (BOOL)hasVolume
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setHasVolume:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (void)deleteVolume
{
  double v2;

  LODWORD(v2) = 0;
  -[TTSSchemaTTSSpeechStarted setVolume:](self, "setVolume:", v2);
  *(_BYTE *)&self->_has &= ~0x10u;
}

- (void)setThermalState:(int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_thermalState = a3;
}

- (BOOL)hasThermalState
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setHasThermalState:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (void)deleteThermalState
{
  -[TTSSchemaTTSSpeechStarted setThermalState:](self, "setThermalState:", 0);
  *(_BYTE *)&self->_has &= ~0x20u;
}

- (void)setAssetSelectionLatencyInSecond:(float)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_assetSelectionLatencyInSecond = a3;
}

- (BOOL)hasAssetSelectionLatencyInSecond
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setHasAssetSelectionLatencyInSecond:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (void)deleteAssetSelectionLatencyInSecond
{
  double v2;

  LODWORD(v2) = 0;
  -[TTSSchemaTTSSpeechStarted setAssetSelectionLatencyInSecond:](self, "setAssetSelectionLatencyInSecond:", v2);
  *(_BYTE *)&self->_has &= ~0x40u;
}

- (BOOL)readFrom:(id)a3
{
  double v3;

  return TTSSchemaTTSSpeechStartedReadFrom(self, (uint64_t)a3, v3);
}

- (void)writeTo:(id)a3
{
  char has;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  id v10;

  v10 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteFloatField();
  if ((*(_BYTE *)&self->_has & 4) != 0)
LABEL_4:
    PBDataWriterWriteInt32Field();
LABEL_5:
  -[TTSSchemaTTSSpeechStarted voiceContext](self, "voiceContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[TTSSchemaTTSSpeechStarted voiceContext](self, "voiceContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
    PBDataWriterWriteInt32Field();
  -[TTSSchemaTTSSpeechStarted audioInterface](self, "audioInterface");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[TTSSchemaTTSSpeechStarted audioInterface](self, "audioInterface");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v9 = (char)self->_has;
  if ((v9 & 0x10) == 0)
  {
    if ((*(_BYTE *)&self->_has & 0x20) == 0)
      goto LABEL_13;
LABEL_20:
    PBDataWriterWriteInt32Field();
    if ((*(_BYTE *)&self->_has & 0x40) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
  PBDataWriterWriteFloatField();
  v9 = (char)self->_has;
  if ((v9 & 0x20) != 0)
    goto LABEL_20;
LABEL_13:
  if ((v9 & 0x40) != 0)
LABEL_14:
    PBDataWriterWriteFloatField();
LABEL_15:

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $C0554B60F74CC19DAE9F4AE205FD9552 has;
  unsigned int v6;
  int audioOutputRoute;
  int v8;
  float customerPerceivedLatencyInSecond;
  float v10;
  int v11;
  int synthesisSource;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  int v20;
  int synthesisEffect;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  BOOL v27;
  $C0554B60F74CC19DAE9F4AE205FD9552 v29;
  int v30;
  unsigned int v31;
  float volume;
  float v33;
  int v34;
  int thermalState;
  int v36;
  float assetSelectionLatencyInSecond;
  float v38;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_26;
  has = self->_has;
  v6 = v4[60];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_26;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    audioOutputRoute = self->_audioOutputRoute;
    if (audioOutputRoute != objc_msgSend(v4, "audioOutputRoute"))
      goto LABEL_26;
    has = self->_has;
    v6 = v4[60];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 == ((v6 >> 1) & 1))
  {
    if (v8)
    {
      customerPerceivedLatencyInSecond = self->_customerPerceivedLatencyInSecond;
      objc_msgSend(v4, "customerPerceivedLatencyInSecond");
      if (customerPerceivedLatencyInSecond != v10)
        goto LABEL_26;
      has = self->_has;
      v6 = v4[60];
    }
    v11 = (*(unsigned int *)&has >> 2) & 1;
    if (v11 != ((v6 >> 2) & 1))
      goto LABEL_26;
    if (v11)
    {
      synthesisSource = self->_synthesisSource;
      if (synthesisSource != objc_msgSend(v4, "synthesisSource"))
        goto LABEL_26;
    }
    -[TTSSchemaTTSSpeechStarted voiceContext](self, "voiceContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "voiceContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v13 == 0) == (v14 != 0))
      goto LABEL_25;
    -[TTSSchemaTTSSpeechStarted voiceContext](self, "voiceContext");
    v15 = objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v16 = (void *)v15;
      -[TTSSchemaTTSSpeechStarted voiceContext](self, "voiceContext");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "voiceContext");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v17, "isEqual:", v18);

      if (!v19)
        goto LABEL_26;
    }
    else
    {

    }
    v20 = (*(_BYTE *)&self->_has >> 3) & 1;
    if (v20 != ((v4[60] >> 3) & 1))
      goto LABEL_26;
    if (v20)
    {
      synthesisEffect = self->_synthesisEffect;
      if (synthesisEffect != objc_msgSend(v4, "synthesisEffect"))
        goto LABEL_26;
    }
    -[TTSSchemaTTSSpeechStarted audioInterface](self, "audioInterface");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "audioInterface");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v13 == 0) == (v14 != 0))
    {
LABEL_25:

      goto LABEL_26;
    }
    -[TTSSchemaTTSSpeechStarted audioInterface](self, "audioInterface");
    v22 = objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      v23 = (void *)v22;
      -[TTSSchemaTTSSpeechStarted audioInterface](self, "audioInterface");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "audioInterface");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v24, "isEqual:", v25);

      if (!v26)
        goto LABEL_26;
    }
    else
    {

    }
    v29 = self->_has;
    v30 = (*(unsigned int *)&v29 >> 4) & 1;
    v31 = v4[60];
    if (v30 == ((v31 >> 4) & 1))
    {
      if (v30)
      {
        volume = self->_volume;
        objc_msgSend(v4, "volume");
        if (volume != v33)
          goto LABEL_26;
        v29 = self->_has;
        v31 = v4[60];
      }
      v34 = (*(unsigned int *)&v29 >> 5) & 1;
      if (v34 == ((v31 >> 5) & 1))
      {
        if (v34)
        {
          thermalState = self->_thermalState;
          if (thermalState != objc_msgSend(v4, "thermalState"))
            goto LABEL_26;
          v29 = self->_has;
          v31 = v4[60];
        }
        v36 = (*(unsigned int *)&v29 >> 6) & 1;
        if (v36 == ((v31 >> 6) & 1))
        {
          if (!v36
            || (assetSelectionLatencyInSecond = self->_assetSelectionLatencyInSecond,
                objc_msgSend(v4, "assetSelectionLatencyInSecond"),
                assetSelectionLatencyInSecond == v38))
          {
            v27 = 1;
            goto LABEL_27;
          }
        }
      }
    }
  }
LABEL_26:
  v27 = 0;
LABEL_27:

  return v27;
}

- (unint64_t)hash
{
  char has;
  float customerPerceivedLatencyInSecond;
  double v5;
  long double v6;
  double v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  unint64_t v14;
  float volume;
  double v16;
  long double v17;
  double v18;
  uint64_t v19;
  float assetSelectionLatencyInSecond;
  double v21;
  long double v22;
  double v23;
  unint64_t v24;
  uint64_t v26;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v26 = 2654435761 * self->_audioOutputRoute;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_8:
    v8 = 0;
    goto LABEL_11;
  }
  v26 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_8;
LABEL_3:
  customerPerceivedLatencyInSecond = self->_customerPerceivedLatencyInSecond;
  v5 = customerPerceivedLatencyInSecond;
  if (customerPerceivedLatencyInSecond < 0.0)
    v5 = -customerPerceivedLatencyInSecond;
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
LABEL_11:
  if ((has & 4) != 0)
    v9 = 2654435761 * self->_synthesisSource;
  else
    v9 = 0;
  v10 = -[TTSSchemaTTSVoiceContext hash](self->_voiceContext, "hash");
  if ((*(_BYTE *)&self->_has & 8) != 0)
    v11 = 2654435761 * self->_synthesisEffect;
  else
    v11 = 0;
  v12 = -[TTSSchemaTTSAudioInterface hash](self->_audioInterface, "hash");
  v13 = (char)self->_has;
  if ((v13 & 0x10) != 0)
  {
    volume = self->_volume;
    v16 = volume;
    if (volume < 0.0)
      v16 = -volume;
    v17 = floor(v16 + 0.5);
    v18 = (v16 - v17) * 1.84467441e19;
    v14 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0)
        v14 += (unint64_t)v18;
    }
    else
    {
      v14 -= (unint64_t)fabs(v18);
    }
  }
  else
  {
    v14 = 0;
  }
  if ((v13 & 0x20) != 0)
  {
    v19 = 2654435761 * self->_thermalState;
    if ((v13 & 0x40) != 0)
      goto LABEL_27;
LABEL_32:
    v24 = 0;
    return v8 ^ v26 ^ v9 ^ v11 ^ v10 ^ v12 ^ v14 ^ v19 ^ v24;
  }
  v19 = 0;
  if ((v13 & 0x40) == 0)
    goto LABEL_32;
LABEL_27:
  assetSelectionLatencyInSecond = self->_assetSelectionLatencyInSecond;
  v21 = assetSelectionLatencyInSecond;
  if (assetSelectionLatencyInSecond < 0.0)
    v21 = -assetSelectionLatencyInSecond;
  v22 = floor(v21 + 0.5);
  v23 = (v21 - v22) * 1.84467441e19;
  v24 = 2654435761u * (unint64_t)fmod(v22, 1.84467441e19);
  if (v23 >= 0.0)
  {
    if (v23 > 0.0)
      v24 += (unint64_t)v23;
  }
  else
  {
    v24 -= (unint64_t)fabs(v23);
  }
  return v8 ^ v26 ^ v9 ^ v11 ^ v10 ^ v12 ^ v14 ^ v19 ^ v24;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char has;
  unsigned int v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  const __CFString *v15;
  unsigned int v16;
  const __CFString *v17;
  unsigned int v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[TTSSchemaTTSSpeechStarted assetSelectionLatencyInSecond](self, "assetSelectionLatencyInSecond");
    objc_msgSend(v4, "numberWithFloat:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("assetSelectionLatencyInSecond"));

  }
  if (self->_audioInterface)
  {
    -[TTSSchemaTTSSpeechStarted audioInterface](self, "audioInterface");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("audioInterface"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("audioInterface"));

    }
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v10 = -[TTSSchemaTTSSpeechStarted audioOutputRoute](self, "audioOutputRoute") - 1;
    if (v10 > 7)
      v11 = CFSTR("UNKNOWN");
    else
      v11 = off_1E5638480[v10];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("audioOutputRoute"));
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_10:
      if ((has & 8) == 0)
        goto LABEL_11;
      goto LABEL_19;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_10;
  }
  v12 = (void *)MEMORY[0x1E0CB37E8];
  -[TTSSchemaTTSSpeechStarted customerPerceivedLatencyInSecond](self, "customerPerceivedLatencyInSecond");
  objc_msgSend(v12, "numberWithFloat:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("customerPerceivedLatencyInSecond"));

  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_11:
    if ((has & 4) == 0)
      goto LABEL_12;
    goto LABEL_23;
  }
LABEL_19:
  v14 = -[TTSSchemaTTSSpeechStarted synthesisEffect](self, "synthesisEffect") - 1;
  if (v14 > 2)
    v15 = CFSTR("UNKNOWN");
  else
    v15 = off_1E56384C0[v14];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("synthesisEffect"));
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_12:
    if ((has & 0x20) == 0)
      goto LABEL_31;
    goto LABEL_27;
  }
LABEL_23:
  v16 = -[TTSSchemaTTSSpeechStarted synthesisSource](self, "synthesisSource") - 1;
  if (v16 > 5)
    v17 = CFSTR("UNKNOWN");
  else
    v17 = off_1E56384D8[v16];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("synthesisSource"));
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
LABEL_27:
    v18 = -[TTSSchemaTTSSpeechStarted thermalState](self, "thermalState") - 1;
    if (v18 > 3)
      v19 = CFSTR("DEVICETHERMALSTATE_UNKNOWN");
    else
      v19 = off_1E5638508[v18];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("thermalState"));
  }
LABEL_31:
  if (self->_voiceContext)
  {
    -[TTSSchemaTTSSpeechStarted voiceContext](self, "voiceContext");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "dictionaryRepresentation");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("voiceContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("voiceContext"));

    }
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    v23 = (void *)MEMORY[0x1E0CB37E8];
    -[TTSSchemaTTSSpeechStarted volume](self, "volume");
    objc_msgSend(v23, "numberWithFloat:");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("volume"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[TTSSchemaTTSSpeechStarted dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (TTSSchemaTTSSpeechStarted)initWithJSON:(id)a3
{
  void *v4;
  TTSSchemaTTSSpeechStarted *v5;
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
    self = -[TTSSchemaTTSSpeechStarted initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (TTSSchemaTTSSpeechStarted)initWithDictionary:(id)a3
{
  id v4;
  TTSSchemaTTSSpeechStarted *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  TTSSchemaTTSVoiceContext *v10;
  void *v11;
  void *v12;
  TTSSchemaTTSAudioInterface *v13;
  void *v14;
  void *v15;
  void *v16;
  TTSSchemaTTSSpeechStarted *v17;
  void *v19;
  void *v20;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)TTSSchemaTTSSpeechStarted;
  v5 = -[TTSSchemaTTSSpeechStarted init](&v21, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("audioOutputRoute"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[TTSSchemaTTSSpeechStarted setAudioOutputRoute:](v5, "setAudioOutputRoute:", objc_msgSend(v6, "intValue"));
    v20 = v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("customerPerceivedLatencyInSecond"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "floatValue");
      -[TTSSchemaTTSSpeechStarted setCustomerPerceivedLatencyInSecond:](v5, "setCustomerPerceivedLatencyInSecond:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("synthesisSource"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[TTSSchemaTTSSpeechStarted setSynthesisSource:](v5, "setSynthesisSource:", objc_msgSend(v8, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("voiceContext"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = -[TTSSchemaTTSVoiceContext initWithDictionary:]([TTSSchemaTTSVoiceContext alloc], "initWithDictionary:", v9);
      -[TTSSchemaTTSSpeechStarted setVoiceContext:](v5, "setVoiceContext:", v10);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("synthesisEffect"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[TTSSchemaTTSSpeechStarted setSynthesisEffect:](v5, "setSynthesisEffect:", objc_msgSend(v11, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("audioInterface"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[TTSSchemaTTSAudioInterface initWithDictionary:]([TTSSchemaTTSAudioInterface alloc], "initWithDictionary:", v12);
      -[TTSSchemaTTSSpeechStarted setAudioInterface:](v5, "setAudioInterface:", v13);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("volume"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v14, "floatValue");
      -[TTSSchemaTTSSpeechStarted setVolume:](v5, "setVolume:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("thermalState"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[TTSSchemaTTSSpeechStarted setThermalState:](v5, "setThermalState:", objc_msgSend(v15, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("assetSelectionLatencyInSecond"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v16, "floatValue");
      -[TTSSchemaTTSSpeechStarted setAssetSelectionLatencyInSecond:](v5, "setAssetSelectionLatencyInSecond:");
    }
    v17 = v5;

  }
  return v5;
}

- (int)audioOutputRoute
{
  return self->_audioOutputRoute;
}

- (float)customerPerceivedLatencyInSecond
{
  return self->_customerPerceivedLatencyInSecond;
}

- (int)synthesisSource
{
  return self->_synthesisSource;
}

- (TTSSchemaTTSVoiceContext)voiceContext
{
  return self->_voiceContext;
}

- (void)setVoiceContext:(id)a3
{
  objc_storeStrong((id *)&self->_voiceContext, a3);
}

- (int)synthesisEffect
{
  return self->_synthesisEffect;
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

- (int)thermalState
{
  return self->_thermalState;
}

- (float)assetSelectionLatencyInSecond
{
  return self->_assetSelectionLatencyInSecond;
}

- (void)setHasVoiceContext:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasAudioInterface:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioInterface, 0);
  objc_storeStrong((id *)&self->_voiceContext, 0);
}

@end
