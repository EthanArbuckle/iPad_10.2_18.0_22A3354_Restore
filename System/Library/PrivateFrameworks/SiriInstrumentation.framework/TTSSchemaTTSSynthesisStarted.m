@implementation TTSSchemaTTSSynthesisStarted

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
  v9.super_class = (Class)TTSSchemaTTSSynthesisStarted;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TTSSchemaTTSSynthesisStarted voiceContext](self, "voiceContext", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[TTSSchemaTTSSynthesisStarted deleteVoiceContext](self, "deleteVoiceContext");
  return v5;
}

- (void)setSynthesisSource:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_synthesisSource = a3;
}

- (BOOL)hasSynthesisSource
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasSynthesisSource:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteSynthesisSource
{
  -[TTSSchemaTTSSynthesisStarted setSynthesisSource:](self, "setSynthesisSource:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)hasVoiceContext
{
  return self->_voiceContext != 0;
}

- (void)deleteVoiceContext
{
  -[TTSSchemaTTSSynthesisStarted setVoiceContext:](self, "setVoiceContext:", 0);
}

- (void)setSynthesisEffect:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_synthesisEffect = a3;
}

- (BOOL)hasSynthesisEffect
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasSynthesisEffect:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteSynthesisEffect
{
  -[TTSSchemaTTSSynthesisStarted setSynthesisEffect:](self, "setSynthesisEffect:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setThermalState:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_thermalState = a3;
}

- (BOOL)hasThermalState
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasThermalState:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteThermalState
{
  -[TTSSchemaTTSSynthesisStarted setThermalState:](self, "setThermalState:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (BOOL)readFrom:(id)a3
{
  return TTSSchemaTTSSynthesisStartedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  char has;
  id v7;

  v7 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  -[TTSSchemaTTSSynthesisStarted voiceContext](self, "voiceContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[TTSSchemaTTSSynthesisStarted voiceContext](self, "voiceContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
    PBDataWriterWriteInt32Field();

}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  int synthesisSource;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  $A6BBCD0F7CB61668BE900102C8285281 has;
  int v15;
  unsigned int v16;
  int synthesisEffect;
  int v18;
  int thermalState;
  BOOL v20;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_19;
  if ((*(_BYTE *)&self->_has & 1) != (v4[32] & 1))
    goto LABEL_19;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    synthesisSource = self->_synthesisSource;
    if (synthesisSource != objc_msgSend(v4, "synthesisSource"))
      goto LABEL_19;
  }
  -[TTSSchemaTTSSynthesisStarted voiceContext](self, "voiceContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "voiceContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if ((v6 == 0) == (v7 != 0))
  {

    goto LABEL_19;
  }
  -[TTSSchemaTTSSynthesisStarted voiceContext](self, "voiceContext");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    -[TTSSchemaTTSSynthesisStarted voiceContext](self, "voiceContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "voiceContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isEqual:", v12);

    if (!v13)
      goto LABEL_19;
  }
  else
  {

  }
  has = self->_has;
  v15 = (*(unsigned int *)&has >> 1) & 1;
  v16 = v4[32];
  if (v15 != ((v16 >> 1) & 1))
  {
LABEL_19:
    v20 = 0;
    goto LABEL_20;
  }
  if (v15)
  {
    synthesisEffect = self->_synthesisEffect;
    if (synthesisEffect == objc_msgSend(v4, "synthesisEffect"))
    {
      has = self->_has;
      v16 = v4[32];
      goto LABEL_15;
    }
    goto LABEL_19;
  }
LABEL_15:
  v18 = (*(unsigned int *)&has >> 2) & 1;
  if (v18 != ((v16 >> 2) & 1))
    goto LABEL_19;
  if (v18)
  {
    thermalState = self->_thermalState;
    if (thermalState != objc_msgSend(v4, "thermalState"))
      goto LABEL_19;
  }
  v20 = 1;
LABEL_20:

  return v20;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_synthesisSource;
  else
    v3 = 0;
  v4 = -[TTSSchemaTTSVoiceContext hash](self->_voiceContext, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v5 = 2654435761 * self->_synthesisEffect;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_6;
LABEL_8:
    v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_8;
LABEL_6:
  v6 = 2654435761 * self->_thermalState;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  unsigned int v5;
  const __CFString *v6;
  unsigned int v7;
  const __CFString *v8;
  unsigned int v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5 = -[TTSSchemaTTSSynthesisStarted synthesisEffect](self, "synthesisEffect") - 1;
    if (v5 > 2)
      v6 = CFSTR("UNKNOWN");
    else
      v6 = off_1E563A778[v5];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("synthesisEffect"));
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_17;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  v7 = -[TTSSchemaTTSSynthesisStarted synthesisSource](self, "synthesisSource") - 1;
  if (v7 > 5)
    v8 = CFSTR("UNKNOWN");
  else
    v8 = off_1E563A790[v7];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("synthesisSource"));
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_13:
    v9 = -[TTSSchemaTTSSynthesisStarted thermalState](self, "thermalState") - 1;
    if (v9 > 3)
      v10 = CFSTR("DEVICETHERMALSTATE_UNKNOWN");
    else
      v10 = off_1E563A7C0[v9];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("thermalState"));
  }
LABEL_17:
  if (self->_voiceContext)
  {
    -[TTSSchemaTTSSynthesisStarted voiceContext](self, "voiceContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("voiceContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("voiceContext"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[TTSSchemaTTSSynthesisStarted dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (TTSSchemaTTSSynthesisStarted)initWithJSON:(id)a3
{
  void *v4;
  TTSSchemaTTSSynthesisStarted *v5;
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
    self = -[TTSSchemaTTSSynthesisStarted initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (TTSSchemaTTSSynthesisStarted)initWithDictionary:(id)a3
{
  id v4;
  TTSSchemaTTSSynthesisStarted *v5;
  void *v6;
  void *v7;
  TTSSchemaTTSVoiceContext *v8;
  void *v9;
  void *v10;
  TTSSchemaTTSSynthesisStarted *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TTSSchemaTTSSynthesisStarted;
  v5 = -[TTSSchemaTTSSynthesisStarted init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("synthesisSource"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[TTSSchemaTTSSynthesisStarted setSynthesisSource:](v5, "setSynthesisSource:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("voiceContext"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = -[TTSSchemaTTSVoiceContext initWithDictionary:]([TTSSchemaTTSVoiceContext alloc], "initWithDictionary:", v7);
      -[TTSSchemaTTSSynthesisStarted setVoiceContext:](v5, "setVoiceContext:", v8);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("synthesisEffect"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[TTSSchemaTTSSynthesisStarted setSynthesisEffect:](v5, "setSynthesisEffect:", objc_msgSend(v9, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("thermalState"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[TTSSchemaTTSSynthesisStarted setThermalState:](v5, "setThermalState:", objc_msgSend(v10, "intValue"));
    v11 = v5;

  }
  return v5;
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

- (int)thermalState
{
  return self->_thermalState;
}

- (void)setHasVoiceContext:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voiceContext, 0);
}

@end
