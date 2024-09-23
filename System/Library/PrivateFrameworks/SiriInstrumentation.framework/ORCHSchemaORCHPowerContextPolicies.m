@implementation ORCHSchemaORCHPowerContextPolicies

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setAsrAssistantPolicy:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_asrAssistantPolicy = a3;
}

- (BOOL)hasAsrAssistantPolicy
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasAsrAssistantPolicy:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteAsrAssistantPolicy
{
  -[ORCHSchemaORCHPowerContextPolicies setAsrAssistantPolicy:](self, "setAsrAssistantPolicy:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setAsrDictationPolicy:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_asrDictationPolicy = a3;
}

- (BOOL)hasAsrDictationPolicy
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasAsrDictationPolicy:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteAsrDictationPolicy
{
  -[ORCHSchemaORCHPowerContextPolicies setAsrDictationPolicy:](self, "setAsrDictationPolicy:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setTtsPolicy:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_ttsPolicy = a3;
}

- (BOOL)hasTtsPolicy
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasTtsPolicy:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteTtsPolicy
{
  -[ORCHSchemaORCHPowerContextPolicies setTtsPolicy:](self, "setTtsPolicy:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (BOOL)readFrom:(id)a3
{
  return ORCHSchemaORCHPowerContextPoliciesReadFrom(self, (uint64_t)a3);
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
    PBDataWriterWriteInt32Field();
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
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }
LABEL_5:

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $6296049F541958650971E0097E4B7BB4 has;
  unsigned int v6;
  int asrAssistantPolicy;
  int v8;
  int asrDictationPolicy;
  int v10;
  int ttsPolicy;
  BOOL v12;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  has = self->_has;
  v6 = v4[20];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_14;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    asrAssistantPolicy = self->_asrAssistantPolicy;
    if (asrAssistantPolicy != objc_msgSend(v4, "asrAssistantPolicy"))
      goto LABEL_14;
    has = self->_has;
    v6 = v4[20];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_14;
  if (v8)
  {
    asrDictationPolicy = self->_asrDictationPolicy;
    if (asrDictationPolicy == objc_msgSend(v4, "asrDictationPolicy"))
    {
      has = self->_has;
      v6 = v4[20];
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
    ttsPolicy = self->_ttsPolicy;
    if (ttsPolicy != objc_msgSend(v4, "ttsPolicy"))
      goto LABEL_14;
  }
  v12 = 1;
LABEL_15:

  return v12;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

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
  v2 = 2654435761 * self->_asrAssistantPolicy;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v3 = 2654435761 * self->_asrDictationPolicy;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_7;
LABEL_4:
  v4 = 2654435761 * self->_ttsPolicy;
  return v3 ^ v2 ^ v4;
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v5 = -[ORCHSchemaORCHPowerContextPolicies asrAssistantPolicy](self, "asrAssistantPolicy") - 1;
    if (v5 > 3)
      v6 = CFSTR("ORCHASRPOWERCONTEXTPOLICY_UNKNOWN");
    else
      v6 = off_1E563B7B0[v5];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("asrAssistantPolicy"));
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_17;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  v7 = -[ORCHSchemaORCHPowerContextPolicies asrDictationPolicy](self, "asrDictationPolicy") - 1;
  if (v7 > 3)
    v8 = CFSTR("ORCHASRPOWERCONTEXTPOLICY_UNKNOWN");
  else
    v8 = off_1E563B7B0[v7];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("asrDictationPolicy"));
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_13:
    v9 = -[ORCHSchemaORCHPowerContextPolicies ttsPolicy](self, "ttsPolicy") - 1;
    if (v9 > 2)
      v10 = CFSTR("ORCHTTSPOWERCONTEXTPOLICY_UNKNOWN");
    else
      v10 = off_1E563B7D0[v9];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("ttsPolicy"));
  }
LABEL_17:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[ORCHSchemaORCHPowerContextPolicies dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (ORCHSchemaORCHPowerContextPolicies)initWithJSON:(id)a3
{
  void *v4;
  ORCHSchemaORCHPowerContextPolicies *v5;
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
    self = -[ORCHSchemaORCHPowerContextPolicies initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (ORCHSchemaORCHPowerContextPolicies)initWithDictionary:(id)a3
{
  id v4;
  ORCHSchemaORCHPowerContextPolicies *v5;
  void *v6;
  void *v7;
  void *v8;
  ORCHSchemaORCHPowerContextPolicies *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ORCHSchemaORCHPowerContextPolicies;
  v5 = -[ORCHSchemaORCHPowerContextPolicies init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("asrAssistantPolicy"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ORCHSchemaORCHPowerContextPolicies setAsrAssistantPolicy:](v5, "setAsrAssistantPolicy:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("asrDictationPolicy"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ORCHSchemaORCHPowerContextPolicies setAsrDictationPolicy:](v5, "setAsrDictationPolicy:", objc_msgSend(v7, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ttsPolicy"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ORCHSchemaORCHPowerContextPolicies setTtsPolicy:](v5, "setTtsPolicy:", objc_msgSend(v8, "intValue"));
    v9 = v5;

  }
  return v5;
}

- (int)asrAssistantPolicy
{
  return self->_asrAssistantPolicy;
}

- (int)asrDictationPolicy
{
  return self->_asrDictationPolicy;
}

- (int)ttsPolicy
{
  return self->_ttsPolicy;
}

@end
