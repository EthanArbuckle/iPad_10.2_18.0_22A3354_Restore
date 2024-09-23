@implementation PEGASUSSchemaPEGASUSWebAnswerExecution

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setAnswerType:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_answerType = a3;
}

- (BOOL)hasAnswerType
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setHasAnswerType:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (void)deleteAnswerType
{
  -[PEGASUSSchemaPEGASUSWebAnswerExecution setAnswerType:](self, "setAnswerType:", 0);
  *(_WORD *)&self->_has &= ~1u;
}

- (void)setAllowListType:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_allowListType = a3;
}

- (BOOL)hasAllowListType
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setHasAllowListType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (void)deleteAllowListType
{
  -[PEGASUSSchemaPEGASUSWebAnswerExecution setAllowListType:](self, "setAllowListType:", 0);
  *(_WORD *)&self->_has &= ~2u;
}

- (void)setFuzzyMatchType:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_fuzzyMatchType = a3;
}

- (BOOL)hasFuzzyMatchType
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setHasFuzzyMatchType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (void)deleteFuzzyMatchType
{
  -[PEGASUSSchemaPEGASUSWebAnswerExecution setFuzzyMatchType:](self, "setFuzzyMatchType:", 0);
  *(_WORD *)&self->_has &= ~4u;
}

- (void)setSubDomain:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_subDomain = a3;
}

- (BOOL)hasSubDomain
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setHasSubDomain:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (void)deleteSubDomain
{
  -[PEGASUSSchemaPEGASUSWebAnswerExecution setSubDomain:](self, "setSubDomain:", 0);
  *(_WORD *)&self->_has &= ~8u;
}

- (void)setQuality:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_quality = a3;
}

- (BOOL)hasQuality
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setHasQuality:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (void)deleteQuality
{
  -[PEGASUSSchemaPEGASUSWebAnswerExecution setQuality:](self, "setQuality:", 0);
  *(_WORD *)&self->_has &= ~0x10u;
}

- (void)setAnswerClass:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_answerClass = a3;
}

- (BOOL)hasAnswerClass
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setHasAnswerClass:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (void)deleteAnswerClass
{
  -[PEGASUSSchemaPEGASUSWebAnswerExecution setAnswerClass:](self, "setAnswerClass:", 0);
  *(_WORD *)&self->_has &= ~0x20u;
}

- (void)setNumHighlights:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_numHighlights = a3;
}

- (BOOL)hasNumHighlights
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setHasNumHighlights:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (void)deleteNumHighlights
{
  -[PEGASUSSchemaPEGASUSWebAnswerExecution setNumHighlights:](self, "setNumHighlights:", 0);
  *(_WORD *)&self->_has &= ~0x40u;
}

- (void)setNumCallouts:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_numCallouts = a3;
}

- (BOOL)hasNumCallouts
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setHasNumCallouts:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (void)deleteNumCallouts
{
  -[PEGASUSSchemaPEGASUSWebAnswerExecution setNumCallouts:](self, "setNumCallouts:", 0);
  *(_WORD *)&self->_has &= ~0x80u;
}

- (void)setNumLinkedCallouts:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_numLinkedCallouts = a3;
}

- (BOOL)hasNumLinkedCallouts
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setHasNumLinkedCallouts:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (void)deleteNumLinkedCallouts
{
  -[PEGASUSSchemaPEGASUSWebAnswerExecution setNumLinkedCallouts:](self, "setNumLinkedCallouts:", 0);
  *(_WORD *)&self->_has &= ~0x100u;
}

- (BOOL)readFrom:(id)a3
{
  return PEGASUSSchemaPEGASUSWebAnswerExecutionReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has;
  id v5;

  v5 = a3;
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0)
      goto LABEL_9;
LABEL_19:
    PBDataWriterWriteUint32Field();
    if ((*(_WORD *)&self->_has & 0x100) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_18:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x80) != 0)
    goto LABEL_19;
LABEL_9:
  if ((has & 0x100) != 0)
LABEL_10:
    PBDataWriterWriteUint32Field();
LABEL_11:

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int16 *v4;
  $C6664949539671ADC8C2BA285AA94CA1 has;
  unsigned int v6;
  unsigned int answerType;
  int v8;
  unsigned int allowListType;
  int v10;
  unsigned int fuzzyMatchType;
  int v12;
  unsigned int subDomain;
  int v14;
  unsigned int quality;
  int v16;
  unsigned int answerClass;
  int v18;
  unsigned int numHighlights;
  int v20;
  unsigned int numCallouts;
  int v22;
  unsigned int numLinkedCallouts;
  BOOL v24;

  v4 = (unsigned __int16 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_38;
  has = self->_has;
  v6 = v4[22];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_38;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    answerType = self->_answerType;
    if (answerType != objc_msgSend(v4, "answerType"))
      goto LABEL_38;
    has = self->_has;
    v6 = v4[22];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_38;
  if (v8)
  {
    allowListType = self->_allowListType;
    if (allowListType != objc_msgSend(v4, "allowListType"))
      goto LABEL_38;
    has = self->_has;
    v6 = v4[22];
  }
  v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1))
    goto LABEL_38;
  if (v10)
  {
    fuzzyMatchType = self->_fuzzyMatchType;
    if (fuzzyMatchType != objc_msgSend(v4, "fuzzyMatchType"))
      goto LABEL_38;
    has = self->_has;
    v6 = v4[22];
  }
  v12 = (*(unsigned int *)&has >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1))
    goto LABEL_38;
  if (v12)
  {
    subDomain = self->_subDomain;
    if (subDomain != objc_msgSend(v4, "subDomain"))
      goto LABEL_38;
    has = self->_has;
    v6 = v4[22];
  }
  v14 = (*(unsigned int *)&has >> 4) & 1;
  if (v14 != ((v6 >> 4) & 1))
    goto LABEL_38;
  if (v14)
  {
    quality = self->_quality;
    if (quality != objc_msgSend(v4, "quality"))
      goto LABEL_38;
    has = self->_has;
    v6 = v4[22];
  }
  v16 = (*(unsigned int *)&has >> 5) & 1;
  if (v16 != ((v6 >> 5) & 1))
    goto LABEL_38;
  if (v16)
  {
    answerClass = self->_answerClass;
    if (answerClass != objc_msgSend(v4, "answerClass"))
      goto LABEL_38;
    has = self->_has;
    v6 = v4[22];
  }
  v18 = (*(unsigned int *)&has >> 6) & 1;
  if (v18 != ((v6 >> 6) & 1))
    goto LABEL_38;
  if (v18)
  {
    numHighlights = self->_numHighlights;
    if (numHighlights != objc_msgSend(v4, "numHighlights"))
      goto LABEL_38;
    has = self->_has;
    v6 = v4[22];
  }
  v20 = (*(unsigned int *)&has >> 7) & 1;
  if (v20 != ((v6 >> 7) & 1))
    goto LABEL_38;
  if (v20)
  {
    numCallouts = self->_numCallouts;
    if (numCallouts == objc_msgSend(v4, "numCallouts"))
    {
      has = self->_has;
      v6 = v4[22];
      goto LABEL_34;
    }
LABEL_38:
    v24 = 0;
    goto LABEL_39;
  }
LABEL_34:
  v22 = (*(unsigned int *)&has >> 8) & 1;
  if (v22 != ((v6 >> 8) & 1))
    goto LABEL_38;
  if (v22)
  {
    numLinkedCallouts = self->_numLinkedCallouts;
    if (numLinkedCallouts != objc_msgSend(v4, "numLinkedCallouts"))
      goto LABEL_38;
  }
  v24 = 1;
LABEL_39:

  return v24;
}

- (unint64_t)hash
{
  __int16 has;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v3 = 2654435761 * self->_answerType;
    if ((has & 2) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_allowListType;
      if ((has & 4) != 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else
  {
    v3 = 0;
    if ((has & 2) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((has & 4) != 0)
  {
LABEL_4:
    v5 = 2654435761 * self->_fuzzyMatchType;
    if ((has & 8) != 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  v5 = 0;
  if ((has & 8) != 0)
  {
LABEL_5:
    v6 = 2654435761 * self->_subDomain;
    if ((has & 0x10) != 0)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  v6 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_6:
    v7 = 2654435761 * self->_quality;
    if ((has & 0x20) != 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  v7 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_7:
    v8 = 2654435761 * self->_answerClass;
    if ((has & 0x40) != 0)
      goto LABEL_8;
    goto LABEL_17;
  }
LABEL_16:
  v8 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_8:
    v9 = 2654435761 * self->_numHighlights;
    if ((has & 0x80) != 0)
      goto LABEL_9;
LABEL_18:
    v10 = 0;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_10;
LABEL_19:
    v11 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
  }
LABEL_17:
  v9 = 0;
  if ((has & 0x80) == 0)
    goto LABEL_18;
LABEL_9:
  v10 = 2654435761 * self->_numCallouts;
  if ((*(_WORD *)&self->_has & 0x100) == 0)
    goto LABEL_19;
LABEL_10:
  v11 = 2654435761 * self->_numLinkedCallouts;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (id)dictionaryRepresentation
{
  void *v3;
  __int16 has;
  void *v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PEGASUSSchemaPEGASUSWebAnswerExecution allowListType](self, "allowListType"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("allowListType"));

    has = (__int16)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else if ((has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PEGASUSSchemaPEGASUSWebAnswerExecution answerClass](self, "answerClass"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("answerClass"));

  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PEGASUSSchemaPEGASUSWebAnswerExecution answerType](self, "answerType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("answerType"));

  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_16;
  }
LABEL_15:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PEGASUSSchemaPEGASUSWebAnswerExecution fuzzyMatchType](self, "fuzzyMatchType"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("fuzzyMatchType"));

  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PEGASUSSchemaPEGASUSWebAnswerExecution numCallouts](self, "numCallouts"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("numCallouts"));

  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 0x100) == 0)
      goto LABEL_8;
    goto LABEL_18;
  }
LABEL_17:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PEGASUSSchemaPEGASUSWebAnswerExecution numHighlights](self, "numHighlights"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("numHighlights"));

  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0)
      goto LABEL_9;
LABEL_19:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PEGASUSSchemaPEGASUSWebAnswerExecution quality](self, "quality"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("quality"));

    if ((*(_WORD *)&self->_has & 8) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_18:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PEGASUSSchemaPEGASUSWebAnswerExecution numLinkedCallouts](self, "numLinkedCallouts"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("numLinkedCallouts"));

  has = (__int16)self->_has;
  if ((has & 0x10) != 0)
    goto LABEL_19;
LABEL_9:
  if ((has & 8) != 0)
  {
LABEL_10:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PEGASUSSchemaPEGASUSWebAnswerExecution subDomain](self, "subDomain"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("subDomain"));

  }
LABEL_11:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PEGASUSSchemaPEGASUSWebAnswerExecution dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (PEGASUSSchemaPEGASUSWebAnswerExecution)initWithJSON:(id)a3
{
  void *v4;
  PEGASUSSchemaPEGASUSWebAnswerExecution *v5;
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
    self = -[PEGASUSSchemaPEGASUSWebAnswerExecution initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PEGASUSSchemaPEGASUSWebAnswerExecution)initWithDictionary:(id)a3
{
  id v4;
  PEGASUSSchemaPEGASUSWebAnswerExecution *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  PEGASUSSchemaPEGASUSWebAnswerExecution *v16;
  void *v18;
  void *v19;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PEGASUSSchemaPEGASUSWebAnswerExecution;
  v5 = -[PEGASUSSchemaPEGASUSWebAnswerExecution init](&v20, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("answerType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PEGASUSSchemaPEGASUSWebAnswerExecution setAnswerType:](v5, "setAnswerType:", objc_msgSend(v6, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("allowListType"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PEGASUSSchemaPEGASUSWebAnswerExecution setAllowListType:](v5, "setAllowListType:", objc_msgSend(v7, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("fuzzyMatchType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PEGASUSSchemaPEGASUSWebAnswerExecution setFuzzyMatchType:](v5, "setFuzzyMatchType:", objc_msgSend(v8, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("subDomain"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PEGASUSSchemaPEGASUSWebAnswerExecution setSubDomain:](v5, "setSubDomain:", objc_msgSend(v9, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("quality"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PEGASUSSchemaPEGASUSWebAnswerExecution setQuality:](v5, "setQuality:", objc_msgSend(v10, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("answerClass"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PEGASUSSchemaPEGASUSWebAnswerExecution setAnswerClass:](v5, "setAnswerClass:", objc_msgSend(v11, "unsignedIntValue"));
    v19 = v7;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numHighlights"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PEGASUSSchemaPEGASUSWebAnswerExecution setNumHighlights:](v5, "setNumHighlights:", objc_msgSend(v12, "unsignedIntValue"));
    v13 = v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numCallouts"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PEGASUSSchemaPEGASUSWebAnswerExecution setNumCallouts:](v5, "setNumCallouts:", objc_msgSend(v14, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numLinkedCallouts"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PEGASUSSchemaPEGASUSWebAnswerExecution setNumLinkedCallouts:](v5, "setNumLinkedCallouts:", objc_msgSend(v15, "unsignedIntValue"));
    v16 = v5;

  }
  return v5;
}

- (unsigned)answerType
{
  return self->_answerType;
}

- (unsigned)allowListType
{
  return self->_allowListType;
}

- (unsigned)fuzzyMatchType
{
  return self->_fuzzyMatchType;
}

- (unsigned)subDomain
{
  return self->_subDomain;
}

- (unsigned)quality
{
  return self->_quality;
}

- (unsigned)answerClass
{
  return self->_answerClass;
}

- (unsigned)numHighlights
{
  return self->_numHighlights;
}

- (unsigned)numCallouts
{
  return self->_numCallouts;
}

- (unsigned)numLinkedCallouts
{
  return self->_numLinkedCallouts;
}

@end
