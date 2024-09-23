@implementation PLUSSchemaPLUSInferencePluginCompleted

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setNumberOfConversationsReviewed:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_numberOfConversationsReviewed = a3;
}

- (BOOL)hasNumberOfConversationsReviewed
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasNumberOfConversationsReviewed:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteNumberOfConversationsReviewed
{
  -[PLUSSchemaPLUSInferencePluginCompleted setNumberOfConversationsReviewed:](self, "setNumberOfConversationsReviewed:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setNumberOfGroundTruthsGenerated:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_numberOfGroundTruthsGenerated = a3;
}

- (BOOL)hasNumberOfGroundTruthsGenerated
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasNumberOfGroundTruthsGenerated:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteNumberOfGroundTruthsGenerated
{
  -[PLUSSchemaPLUSInferencePluginCompleted setNumberOfGroundTruthsGenerated:](self, "setNumberOfGroundTruthsGenerated:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setNumberOfContactSuggestionsGenerated:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_numberOfContactSuggestionsGenerated = a3;
}

- (BOOL)hasNumberOfContactSuggestionsGenerated
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasNumberOfContactSuggestionsGenerated:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteNumberOfContactSuggestionsGenerated
{
  -[PLUSSchemaPLUSInferencePluginCompleted setNumberOfContactSuggestionsGenerated:](self, "setNumberOfContactSuggestionsGenerated:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (void)setNumberOfContactSuggestionsUpdated:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_numberOfContactSuggestionsUpdated = a3;
}

- (BOOL)hasNumberOfContactSuggestionsUpdated
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasNumberOfContactSuggestionsUpdated:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)deleteNumberOfContactSuggestionsUpdated
{
  -[PLUSSchemaPLUSInferencePluginCompleted setNumberOfContactSuggestionsUpdated:](self, "setNumberOfContactSuggestionsUpdated:", 0);
  *(_BYTE *)&self->_has &= ~8u;
}

- (void)setNumberOfContactSuggestionsRemoved:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_numberOfContactSuggestionsRemoved = a3;
}

- (BOOL)hasNumberOfContactSuggestionsRemoved
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setHasNumberOfContactSuggestionsRemoved:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (void)deleteNumberOfContactSuggestionsRemoved
{
  -[PLUSSchemaPLUSInferencePluginCompleted setNumberOfContactSuggestionsRemoved:](self, "setNumberOfContactSuggestionsRemoved:", 0);
  *(_BYTE *)&self->_has &= ~0x10u;
}

- (void)setNumberOfTurnsReviewed:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_numberOfTurnsReviewed = a3;
}

- (BOOL)hasNumberOfTurnsReviewed
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setHasNumberOfTurnsReviewed:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (void)deleteNumberOfTurnsReviewed
{
  -[PLUSSchemaPLUSInferencePluginCompleted setNumberOfTurnsReviewed:](self, "setNumberOfTurnsReviewed:", 0);
  *(_BYTE *)&self->_has &= ~0x20u;
}

- (BOOL)readFrom:(id)a3
{
  return PLUSSchemaPLUSInferencePluginCompletedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_6;
LABEL_13:
    PBDataWriterWriteUint32Field();
    if ((*(_BYTE *)&self->_has & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_12:
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 0x10) != 0)
    goto LABEL_13;
LABEL_6:
  if ((has & 0x20) != 0)
LABEL_7:
    PBDataWriterWriteUint32Field();
LABEL_8:

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $1BAE7CEF085383C47556127327B3B1C0 has;
  unsigned int v6;
  unsigned int numberOfConversationsReviewed;
  int v8;
  unsigned int numberOfGroundTruthsGenerated;
  int v10;
  unsigned int numberOfContactSuggestionsGenerated;
  int v12;
  unsigned int numberOfContactSuggestionsUpdated;
  int v14;
  unsigned int numberOfContactSuggestionsRemoved;
  int v16;
  unsigned int numberOfTurnsReviewed;
  BOOL v18;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_26;
  has = self->_has;
  v6 = v4[32];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_26;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    numberOfConversationsReviewed = self->_numberOfConversationsReviewed;
    if (numberOfConversationsReviewed != objc_msgSend(v4, "numberOfConversationsReviewed"))
      goto LABEL_26;
    has = self->_has;
    v6 = v4[32];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_26;
  if (v8)
  {
    numberOfGroundTruthsGenerated = self->_numberOfGroundTruthsGenerated;
    if (numberOfGroundTruthsGenerated != objc_msgSend(v4, "numberOfGroundTruthsGenerated"))
      goto LABEL_26;
    has = self->_has;
    v6 = v4[32];
  }
  v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1))
    goto LABEL_26;
  if (v10)
  {
    numberOfContactSuggestionsGenerated = self->_numberOfContactSuggestionsGenerated;
    if (numberOfContactSuggestionsGenerated != objc_msgSend(v4, "numberOfContactSuggestionsGenerated"))
      goto LABEL_26;
    has = self->_has;
    v6 = v4[32];
  }
  v12 = (*(unsigned int *)&has >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1))
    goto LABEL_26;
  if (v12)
  {
    numberOfContactSuggestionsUpdated = self->_numberOfContactSuggestionsUpdated;
    if (numberOfContactSuggestionsUpdated != objc_msgSend(v4, "numberOfContactSuggestionsUpdated"))
      goto LABEL_26;
    has = self->_has;
    v6 = v4[32];
  }
  v14 = (*(unsigned int *)&has >> 4) & 1;
  if (v14 != ((v6 >> 4) & 1))
    goto LABEL_26;
  if (v14)
  {
    numberOfContactSuggestionsRemoved = self->_numberOfContactSuggestionsRemoved;
    if (numberOfContactSuggestionsRemoved == objc_msgSend(v4, "numberOfContactSuggestionsRemoved"))
    {
      has = self->_has;
      v6 = v4[32];
      goto LABEL_22;
    }
LABEL_26:
    v18 = 0;
    goto LABEL_27;
  }
LABEL_22:
  v16 = (*(unsigned int *)&has >> 5) & 1;
  if (v16 != ((v6 >> 5) & 1))
    goto LABEL_26;
  if (v16)
  {
    numberOfTurnsReviewed = self->_numberOfTurnsReviewed;
    if (numberOfTurnsReviewed != objc_msgSend(v4, "numberOfTurnsReviewed"))
      goto LABEL_26;
  }
  v18 = 1;
LABEL_27:

  return v18;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v2 = 2654435761 * self->_numberOfConversationsReviewed;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v3 = 2654435761 * self->_numberOfGroundTruthsGenerated;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_4;
      goto LABEL_10;
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
    v4 = 2654435761 * self->_numberOfContactSuggestionsGenerated;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_5:
    v5 = 2654435761 * self->_numberOfContactSuggestionsUpdated;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_6;
LABEL_12:
    v6 = 0;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
      goto LABEL_7;
LABEL_13:
    v7 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7;
  }
LABEL_11:
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    goto LABEL_12;
LABEL_6:
  v6 = 2654435761 * self->_numberOfContactSuggestionsRemoved;
  if ((*(_BYTE *)&self->_has & 0x20) == 0)
    goto LABEL_13;
LABEL_7:
  v7 = 2654435761 * self->_numberOfTurnsReviewed;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PLUSSchemaPLUSInferencePluginCompleted numberOfContactSuggestionsGenerated](self, "numberOfContactSuggestionsGenerated"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("numberOfContactSuggestionsGenerated"));

    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PLUSSchemaPLUSInferencePluginCompleted numberOfContactSuggestionsRemoved](self, "numberOfContactSuggestionsRemoved"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("numberOfContactSuggestionsRemoved"));

  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 1) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PLUSSchemaPLUSInferencePluginCompleted numberOfContactSuggestionsUpdated](self, "numberOfContactSuggestionsUpdated"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("numberOfContactSuggestionsUpdated"));

  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 2) == 0)
      goto LABEL_6;
LABEL_13:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PLUSSchemaPLUSInferencePluginCompleted numberOfGroundTruthsGenerated](self, "numberOfGroundTruthsGenerated"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("numberOfGroundTruthsGenerated"));

    if ((*(_BYTE *)&self->_has & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_12:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PLUSSchemaPLUSInferencePluginCompleted numberOfConversationsReviewed](self, "numberOfConversationsReviewed"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("numberOfConversationsReviewed"));

  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_13;
LABEL_6:
  if ((has & 0x20) != 0)
  {
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PLUSSchemaPLUSInferencePluginCompleted numberOfTurnsReviewed](self, "numberOfTurnsReviewed"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("numberOfTurnsReviewed"));

  }
LABEL_8:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PLUSSchemaPLUSInferencePluginCompleted dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (PLUSSchemaPLUSInferencePluginCompleted)initWithJSON:(id)a3
{
  void *v4;
  PLUSSchemaPLUSInferencePluginCompleted *v5;
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
    self = -[PLUSSchemaPLUSInferencePluginCompleted initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PLUSSchemaPLUSInferencePluginCompleted)initWithDictionary:(id)a3
{
  id v4;
  PLUSSchemaPLUSInferencePluginCompleted *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  PLUSSchemaPLUSInferencePluginCompleted *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PLUSSchemaPLUSInferencePluginCompleted;
  v5 = -[PLUSSchemaPLUSInferencePluginCompleted init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numberOfConversationsReviewed"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PLUSSchemaPLUSInferencePluginCompleted setNumberOfConversationsReviewed:](v5, "setNumberOfConversationsReviewed:", objc_msgSend(v6, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numberOfGroundTruthsGenerated"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PLUSSchemaPLUSInferencePluginCompleted setNumberOfGroundTruthsGenerated:](v5, "setNumberOfGroundTruthsGenerated:", objc_msgSend(v7, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numberOfContactSuggestionsGenerated"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PLUSSchemaPLUSInferencePluginCompleted setNumberOfContactSuggestionsGenerated:](v5, "setNumberOfContactSuggestionsGenerated:", objc_msgSend(v8, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numberOfContactSuggestionsUpdated"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PLUSSchemaPLUSInferencePluginCompleted setNumberOfContactSuggestionsUpdated:](v5, "setNumberOfContactSuggestionsUpdated:", objc_msgSend(v9, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numberOfContactSuggestionsRemoved"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PLUSSchemaPLUSInferencePluginCompleted setNumberOfContactSuggestionsRemoved:](v5, "setNumberOfContactSuggestionsRemoved:", objc_msgSend(v10, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numberOfTurnsReviewed"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PLUSSchemaPLUSInferencePluginCompleted setNumberOfTurnsReviewed:](v5, "setNumberOfTurnsReviewed:", objc_msgSend(v11, "unsignedIntValue"));
    v12 = v5;

  }
  return v5;
}

- (unsigned)numberOfConversationsReviewed
{
  return self->_numberOfConversationsReviewed;
}

- (unsigned)numberOfGroundTruthsGenerated
{
  return self->_numberOfGroundTruthsGenerated;
}

- (unsigned)numberOfContactSuggestionsGenerated
{
  return self->_numberOfContactSuggestionsGenerated;
}

- (unsigned)numberOfContactSuggestionsUpdated
{
  return self->_numberOfContactSuggestionsUpdated;
}

- (unsigned)numberOfContactSuggestionsRemoved
{
  return self->_numberOfContactSuggestionsRemoved;
}

- (unsigned)numberOfTurnsReviewed
{
  return self->_numberOfTurnsReviewed;
}

@end
