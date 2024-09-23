@implementation PLUSSchemaPLUSContactSuggestionUsageSummary

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setSuggestionGenerationTimeSince1970InMs:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_suggestionGenerationTimeSince1970InMs = a3;
}

- (BOOL)hasSuggestionGenerationTimeSince1970InMs
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setHasSuggestionGenerationTimeSince1970InMs:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (void)deleteSuggestionGenerationTimeSince1970InMs
{
  -[PLUSSchemaPLUSContactSuggestionUsageSummary setSuggestionGenerationTimeSince1970InMs:](self, "setSuggestionGenerationTimeSince1970InMs:", 0);
  *(_WORD *)&self->_has &= ~1u;
}

- (void)setTimeUntilFirstActivationInMs:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_timeUntilFirstActivationInMs = a3;
}

- (BOOL)hasTimeUntilFirstActivationInMs
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setHasTimeUntilFirstActivationInMs:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (void)deleteTimeUntilFirstActivationInMs
{
  -[PLUSSchemaPLUSContactSuggestionUsageSummary setTimeUntilFirstActivationInMs:](self, "setTimeUntilFirstActivationInMs:", 0);
  *(_WORD *)&self->_has &= ~2u;
}

- (void)setAverageTimeBetweenActivationsInMs:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_averageTimeBetweenActivationsInMs = a3;
}

- (BOOL)hasAverageTimeBetweenActivationsInMs
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setHasAverageTimeBetweenActivationsInMs:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (void)deleteAverageTimeBetweenActivationsInMs
{
  -[PLUSSchemaPLUSContactSuggestionUsageSummary setAverageTimeBetweenActivationsInMs:](self, "setAverageTimeBetweenActivationsInMs:", 0);
  *(_WORD *)&self->_has &= ~4u;
}

- (void)setActivationCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_activationCount = a3;
}

- (BOOL)hasActivationCount
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setHasActivationCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (void)deleteActivationCount
{
  -[PLUSSchemaPLUSContactSuggestionUsageSummary setActivationCount:](self, "setActivationCount:", 0);
  *(_WORD *)&self->_has &= ~8u;
}

- (void)setPresentationCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_presentationCount = a3;
}

- (BOOL)hasPresentationCount
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setHasPresentationCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (void)deletePresentationCount
{
  -[PLUSSchemaPLUSContactSuggestionUsageSummary setPresentationCount:](self, "setPresentationCount:", 0);
  *(_WORD *)&self->_has &= ~0x10u;
}

- (void)setConfirmationSelectedCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_confirmationSelectedCount = a3;
}

- (BOOL)hasConfirmationSelectedCount
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setHasConfirmationSelectedCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (void)deleteConfirmationSelectedCount
{
  -[PLUSSchemaPLUSContactSuggestionUsageSummary setConfirmationSelectedCount:](self, "setConfirmationSelectedCount:", 0);
  *(_WORD *)&self->_has &= ~0x20u;
}

- (void)setDisambiguationSelectedCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_disambiguationSelectedCount = a3;
}

- (BOOL)hasDisambiguationSelectedCount
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setHasDisambiguationSelectedCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (void)deleteDisambiguationSelectedCount
{
  -[PLUSSchemaPLUSContactSuggestionUsageSummary setDisambiguationSelectedCount:](self, "setDisambiguationSelectedCount:", 0);
  *(_WORD *)&self->_has &= ~0x40u;
}

- (void)setAbandonmentCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_abandonmentCount = a3;
}

- (BOOL)hasAbandonmentCount
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setHasAbandonmentCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (void)deleteAbandonmentCount
{
  -[PLUSSchemaPLUSContactSuggestionUsageSummary setAbandonmentCount:](self, "setAbandonmentCount:", 0);
  *(_WORD *)&self->_has &= ~0x80u;
}

- (void)setDomain:(int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_domain = a3;
}

- (BOOL)hasDomain
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setHasDomain:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (void)deleteDomain
{
  -[PLUSSchemaPLUSContactSuggestionUsageSummary setDomain:](self, "setDomain:", 0);
  *(_WORD *)&self->_has &= ~0x100u;
}

- (BOOL)readFrom:(id)a3
{
  return PLUSSchemaPLUSContactSuggestionUsageSummaryReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has;
  id v5;

  v5 = a3;
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
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
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteUint64Field();
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
    PBDataWriterWriteInt32Field();
LABEL_11:

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int16 *v4;
  $5ADA42BDFC6FEBF971321BB42B88A1BB has;
  unsigned int v6;
  unint64_t suggestionGenerationTimeSince1970InMs;
  int v8;
  unint64_t timeUntilFirstActivationInMs;
  int v10;
  unint64_t averageTimeBetweenActivationsInMs;
  int v12;
  unsigned int activationCount;
  int v14;
  unsigned int presentationCount;
  int v16;
  unsigned int confirmationSelectedCount;
  int v18;
  unsigned int disambiguationSelectedCount;
  int v20;
  unsigned int abandonmentCount;
  int v22;
  int domain;
  BOOL v24;

  v4 = (unsigned __int16 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_38;
  has = self->_has;
  v6 = v4[28];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_38;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    suggestionGenerationTimeSince1970InMs = self->_suggestionGenerationTimeSince1970InMs;
    if (suggestionGenerationTimeSince1970InMs != objc_msgSend(v4, "suggestionGenerationTimeSince1970InMs"))
      goto LABEL_38;
    has = self->_has;
    v6 = v4[28];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_38;
  if (v8)
  {
    timeUntilFirstActivationInMs = self->_timeUntilFirstActivationInMs;
    if (timeUntilFirstActivationInMs != objc_msgSend(v4, "timeUntilFirstActivationInMs"))
      goto LABEL_38;
    has = self->_has;
    v6 = v4[28];
  }
  v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1))
    goto LABEL_38;
  if (v10)
  {
    averageTimeBetweenActivationsInMs = self->_averageTimeBetweenActivationsInMs;
    if (averageTimeBetweenActivationsInMs != objc_msgSend(v4, "averageTimeBetweenActivationsInMs"))
      goto LABEL_38;
    has = self->_has;
    v6 = v4[28];
  }
  v12 = (*(unsigned int *)&has >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1))
    goto LABEL_38;
  if (v12)
  {
    activationCount = self->_activationCount;
    if (activationCount != objc_msgSend(v4, "activationCount"))
      goto LABEL_38;
    has = self->_has;
    v6 = v4[28];
  }
  v14 = (*(unsigned int *)&has >> 4) & 1;
  if (v14 != ((v6 >> 4) & 1))
    goto LABEL_38;
  if (v14)
  {
    presentationCount = self->_presentationCount;
    if (presentationCount != objc_msgSend(v4, "presentationCount"))
      goto LABEL_38;
    has = self->_has;
    v6 = v4[28];
  }
  v16 = (*(unsigned int *)&has >> 5) & 1;
  if (v16 != ((v6 >> 5) & 1))
    goto LABEL_38;
  if (v16)
  {
    confirmationSelectedCount = self->_confirmationSelectedCount;
    if (confirmationSelectedCount != objc_msgSend(v4, "confirmationSelectedCount"))
      goto LABEL_38;
    has = self->_has;
    v6 = v4[28];
  }
  v18 = (*(unsigned int *)&has >> 6) & 1;
  if (v18 != ((v6 >> 6) & 1))
    goto LABEL_38;
  if (v18)
  {
    disambiguationSelectedCount = self->_disambiguationSelectedCount;
    if (disambiguationSelectedCount != objc_msgSend(v4, "disambiguationSelectedCount"))
      goto LABEL_38;
    has = self->_has;
    v6 = v4[28];
  }
  v20 = (*(unsigned int *)&has >> 7) & 1;
  if (v20 != ((v6 >> 7) & 1))
    goto LABEL_38;
  if (v20)
  {
    abandonmentCount = self->_abandonmentCount;
    if (abandonmentCount == objc_msgSend(v4, "abandonmentCount"))
    {
      has = self->_has;
      v6 = v4[28];
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
    domain = self->_domain;
    if (domain != objc_msgSend(v4, "domain"))
      goto LABEL_38;
  }
  v24 = 1;
LABEL_39:

  return v24;
}

- (unint64_t)hash
{
  __int16 has;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v3 = 2654435761u * self->_suggestionGenerationTimeSince1970InMs;
    if ((has & 2) != 0)
    {
LABEL_3:
      v4 = 2654435761u * self->_timeUntilFirstActivationInMs;
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
    v5 = 2654435761u * self->_averageTimeBetweenActivationsInMs;
    if ((has & 8) != 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  v5 = 0;
  if ((has & 8) != 0)
  {
LABEL_5:
    v6 = 2654435761 * self->_activationCount;
    if ((has & 0x10) != 0)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  v6 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_6:
    v7 = 2654435761 * self->_presentationCount;
    if ((has & 0x20) != 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  v7 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_7:
    v8 = 2654435761 * self->_confirmationSelectedCount;
    if ((has & 0x40) != 0)
      goto LABEL_8;
    goto LABEL_17;
  }
LABEL_16:
  v8 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_8:
    v9 = 2654435761 * self->_disambiguationSelectedCount;
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
  v10 = 2654435761 * self->_abandonmentCount;
  if ((*(_WORD *)&self->_has & 0x100) == 0)
    goto LABEL_19;
LABEL_10:
  v11 = 2654435761 * self->_domain;
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
  unsigned int v12;
  const __CFString *v13;
  void *v14;
  void *v15;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (__int16)self->_has;
  if ((has & 0x80) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PLUSSchemaPLUSContactSuggestionUsageSummary abandonmentCount](self, "abandonmentCount"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("abandonmentCount"));

    has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PLUSSchemaPLUSContactSuggestionUsageSummary activationCount](self, "activationCount"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("activationCount"));

  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[PLUSSchemaPLUSContactSuggestionUsageSummary averageTimeBetweenActivationsInMs](self, "averageTimeBetweenActivationsInMs"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("averageTimeBetweenActivationsInMs"));

  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0)
      goto LABEL_6;
    goto LABEL_16;
  }
LABEL_15:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PLUSSchemaPLUSContactSuggestionUsageSummary confirmationSelectedCount](self, "confirmationSelectedCount"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("confirmationSelectedCount"));

  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_6:
    if ((has & 0x100) == 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PLUSSchemaPLUSContactSuggestionUsageSummary disambiguationSelectedCount](self, "disambiguationSelectedCount"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("disambiguationSelectedCount"));

  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0)
      goto LABEL_8;
    goto LABEL_21;
  }
LABEL_17:
  v12 = -[PLUSSchemaPLUSContactSuggestionUsageSummary domain](self, "domain") - 1;
  if (v12 > 3)
    v13 = CFSTR("PLUSINFERENCECONTACTDOMAIN_UNKNOWN");
  else
    v13 = off_1E5638990[v12];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("domain"));
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 1) == 0)
      goto LABEL_9;
LABEL_22:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[PLUSSchemaPLUSContactSuggestionUsageSummary suggestionGenerationTimeSince1970InMs](self, "suggestionGenerationTimeSince1970InMs"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("suggestionGenerationTimeSince1970InMs"));

    if ((*(_WORD *)&self->_has & 2) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_21:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PLUSSchemaPLUSContactSuggestionUsageSummary presentationCount](self, "presentationCount"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("presentationCount"));

  has = (__int16)self->_has;
  if ((has & 1) != 0)
    goto LABEL_22;
LABEL_9:
  if ((has & 2) != 0)
  {
LABEL_10:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[PLUSSchemaPLUSContactSuggestionUsageSummary timeUntilFirstActivationInMs](self, "timeUntilFirstActivationInMs"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("timeUntilFirstActivationInMs"));

  }
LABEL_11:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PLUSSchemaPLUSContactSuggestionUsageSummary dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (PLUSSchemaPLUSContactSuggestionUsageSummary)initWithJSON:(id)a3
{
  void *v4;
  PLUSSchemaPLUSContactSuggestionUsageSummary *v5;
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
    self = -[PLUSSchemaPLUSContactSuggestionUsageSummary initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PLUSSchemaPLUSContactSuggestionUsageSummary)initWithDictionary:(id)a3
{
  id v4;
  PLUSSchemaPLUSContactSuggestionUsageSummary *v5;
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
  PLUSSchemaPLUSContactSuggestionUsageSummary *v16;
  void *v18;
  void *v19;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PLUSSchemaPLUSContactSuggestionUsageSummary;
  v5 = -[PLUSSchemaPLUSContactSuggestionUsageSummary init](&v20, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("suggestionGenerationTimeSince1970InMs"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PLUSSchemaPLUSContactSuggestionUsageSummary setSuggestionGenerationTimeSince1970InMs:](v5, "setSuggestionGenerationTimeSince1970InMs:", objc_msgSend(v6, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timeUntilFirstActivationInMs"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PLUSSchemaPLUSContactSuggestionUsageSummary setTimeUntilFirstActivationInMs:](v5, "setTimeUntilFirstActivationInMs:", objc_msgSend(v7, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("averageTimeBetweenActivationsInMs"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PLUSSchemaPLUSContactSuggestionUsageSummary setAverageTimeBetweenActivationsInMs:](v5, "setAverageTimeBetweenActivationsInMs:", objc_msgSend(v8, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("activationCount"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PLUSSchemaPLUSContactSuggestionUsageSummary setActivationCount:](v5, "setActivationCount:", objc_msgSend(v9, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("presentationCount"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PLUSSchemaPLUSContactSuggestionUsageSummary setPresentationCount:](v5, "setPresentationCount:", objc_msgSend(v10, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("confirmationSelectedCount"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PLUSSchemaPLUSContactSuggestionUsageSummary setConfirmationSelectedCount:](v5, "setConfirmationSelectedCount:", objc_msgSend(v11, "unsignedIntValue"));
    v19 = v7;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("disambiguationSelectedCount"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PLUSSchemaPLUSContactSuggestionUsageSummary setDisambiguationSelectedCount:](v5, "setDisambiguationSelectedCount:", objc_msgSend(v12, "unsignedIntValue"));
    v13 = v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("abandonmentCount"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PLUSSchemaPLUSContactSuggestionUsageSummary setAbandonmentCount:](v5, "setAbandonmentCount:", objc_msgSend(v14, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("domain"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PLUSSchemaPLUSContactSuggestionUsageSummary setDomain:](v5, "setDomain:", objc_msgSend(v15, "intValue"));
    v16 = v5;

  }
  return v5;
}

- (unint64_t)suggestionGenerationTimeSince1970InMs
{
  return self->_suggestionGenerationTimeSince1970InMs;
}

- (unint64_t)timeUntilFirstActivationInMs
{
  return self->_timeUntilFirstActivationInMs;
}

- (unint64_t)averageTimeBetweenActivationsInMs
{
  return self->_averageTimeBetweenActivationsInMs;
}

- (unsigned)activationCount
{
  return self->_activationCount;
}

- (unsigned)presentationCount
{
  return self->_presentationCount;
}

- (unsigned)confirmationSelectedCount
{
  return self->_confirmationSelectedCount;
}

- (unsigned)disambiguationSelectedCount
{
  return self->_disambiguationSelectedCount;
}

- (unsigned)abandonmentCount
{
  return self->_abandonmentCount;
}

- (int)domain
{
  return self->_domain;
}

@end
