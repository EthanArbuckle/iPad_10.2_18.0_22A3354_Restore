@implementation INFERENCESchemaINFERENCECandidateInfo

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setSearchProvider:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_searchProvider = a3;
}

- (BOOL)hasSearchProvider
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasSearchProvider:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteSearchProvider
{
  -[INFERENCESchemaINFERENCECandidateInfo setSearchProvider:](self, "setSearchProvider:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setRank:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_rank = a3;
}

- (BOOL)hasRank
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasRank:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteRank
{
  -[INFERENCESchemaINFERENCECandidateInfo setRank:](self, "setRank:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setScore:(float)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_score = a3;
}

- (BOOL)hasScore
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasScore:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteScore
{
  double v2;

  LODWORD(v2) = 0;
  -[INFERENCESchemaINFERENCECandidateInfo setScore:](self, "setScore:", v2);
  *(_BYTE *)&self->_has &= ~4u;
}

- (void)setIsShownToUser:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_isShownToUser = a3;
}

- (BOOL)hasIsShownToUser
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasIsShownToUser:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)deleteIsShownToUser
{
  -[INFERENCESchemaINFERENCECandidateInfo setIsShownToUser:](self, "setIsShownToUser:", 0);
  *(_BYTE *)&self->_has &= ~8u;
}

- (BOOL)hasAnonymizedEntityIdentifier
{
  return self->_anonymizedEntityIdentifier != 0;
}

- (void)deleteAnonymizedEntityIdentifier
{
  -[INFERENCESchemaINFERENCECandidateInfo setAnonymizedEntityIdentifier:](self, "setAnonymizedEntityIdentifier:", 0);
}

- (void)setCandidateType:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_candidateType = a3;
}

- (BOOL)hasCandidateType
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setHasCandidateType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (void)deleteCandidateType
{
  -[INFERENCESchemaINFERENCECandidateInfo setCandidateType:](self, "setCandidateType:", 0);
  *(_BYTE *)&self->_has &= ~0x10u;
}

- (BOOL)readFrom:(id)a3
{
  double v3;

  return INFERENCESchemaINFERENCECandidateInfoReadFrom(self, (uint64_t)a3, v3);
}

- (void)writeTo:(id)a3
{
  char has;
  void *v5;
  id v6;

  v6 = a3;
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
      goto LABEL_13;
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
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_13:
  PBDataWriterWriteFloatField();
  if ((*(_BYTE *)&self->_has & 8) != 0)
LABEL_5:
    PBDataWriterWriteBOOLField();
LABEL_6:
  -[INFERENCESchemaINFERENCECandidateInfo anonymizedEntityIdentifier](self, "anonymizedEntityIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    PBDataWriterWriteInt32Field();

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $262A9EC8722D0B8AC431EF47AA53F1A3 has;
  unsigned int v6;
  int searchProvider;
  int v8;
  unsigned int rank;
  int v10;
  float score;
  float v12;
  int v13;
  int isShownToUser;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  int v23;
  int candidateType;
  BOOL v25;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_27;
  has = self->_has;
  v6 = v4[36];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_27;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    searchProvider = self->_searchProvider;
    if (searchProvider != objc_msgSend(v4, "searchProvider"))
      goto LABEL_27;
    has = self->_has;
    v6 = v4[36];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_27;
  if (v8)
  {
    rank = self->_rank;
    if (rank != objc_msgSend(v4, "rank"))
      goto LABEL_27;
    has = self->_has;
    v6 = v4[36];
  }
  v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1))
    goto LABEL_27;
  if (v10)
  {
    score = self->_score;
    objc_msgSend(v4, "score");
    if (score == v12)
    {
      has = self->_has;
      v6 = v4[36];
      goto LABEL_14;
    }
LABEL_27:
    v25 = 0;
    goto LABEL_28;
  }
LABEL_14:
  v13 = (*(unsigned int *)&has >> 3) & 1;
  if (v13 != ((v6 >> 3) & 1))
    goto LABEL_27;
  if (v13)
  {
    isShownToUser = self->_isShownToUser;
    if (isShownToUser != objc_msgSend(v4, "isShownToUser"))
      goto LABEL_27;
  }
  -[INFERENCESchemaINFERENCECandidateInfo anonymizedEntityIdentifier](self, "anonymizedEntityIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "anonymizedEntityIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if ((v15 == 0) == (v16 != 0))
  {

    goto LABEL_27;
  }
  -[INFERENCESchemaINFERENCECandidateInfo anonymizedEntityIdentifier](self, "anonymizedEntityIdentifier");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    -[INFERENCESchemaINFERENCECandidateInfo anonymizedEntityIdentifier](self, "anonymizedEntityIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "anonymizedEntityIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (!v22)
      goto LABEL_27;
  }
  else
  {

  }
  v23 = (*(_BYTE *)&self->_has >> 4) & 1;
  if (v23 != ((v4[36] >> 4) & 1))
    goto LABEL_27;
  if (v23)
  {
    candidateType = self->_candidateType;
    if (candidateType != objc_msgSend(v4, "candidateType"))
      goto LABEL_27;
  }
  v25 = 1;
LABEL_28:

  return v25;
}

- (unint64_t)hash
{
  char has;
  uint64_t v4;
  uint64_t v5;
  float score;
  double v7;
  long double v8;
  double v9;
  unint64_t v10;
  uint64_t v11;
  NSUInteger v12;
  uint64_t v13;

  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_9:
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_4;
LABEL_10:
    v10 = 0;
    goto LABEL_13;
  }
  v4 = 2654435761 * self->_searchProvider;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_9;
LABEL_3:
  v5 = 2654435761 * self->_rank;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_10;
LABEL_4:
  score = self->_score;
  v7 = score;
  if (score < 0.0)
    v7 = -score;
  v8 = floor(v7 + 0.5);
  v9 = (v7 - v8) * 1.84467441e19;
  v10 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
  if (v9 >= 0.0)
  {
    if (v9 > 0.0)
      v10 += (unint64_t)v9;
  }
  else
  {
    v10 -= (unint64_t)fabs(v9);
  }
LABEL_13:
  if ((has & 8) != 0)
    v11 = 2654435761 * self->_isShownToUser;
  else
    v11 = 0;
  v12 = -[NSString hash](self->_anonymizedEntityIdentifier, "hash");
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    v13 = 2654435761 * self->_candidateType;
  else
    v13 = 0;
  return v5 ^ v4 ^ v10 ^ v11 ^ v13 ^ v12;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  char has;
  int v7;
  const __CFString *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  const __CFString *v15;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_anonymizedEntityIdentifier)
  {
    -[INFERENCESchemaINFERENCECandidateInfo anonymizedEntityIdentifier](self, "anonymizedEntityIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("anonymizedEntityIdentifier"));

  }
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    v7 = -[INFERENCESchemaINFERENCECandidateInfo candidateType](self, "candidateType");
    v8 = CFSTR("INFERENCECANDIDATETYPE_UNKNOWN");
    if (v7 == 1)
      v8 = CFSTR("INFERENCECANDIDATETYPE_CONTACT");
    if (v7 == 2)
      v9 = CFSTR("INFERENCECANDIDATETYPE_CONTACT_HANDLE");
    else
      v9 = v8;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("candidateType"));
    has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCECandidateInfo isShownToUser](self, "isShownToUser"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("isShownToUser"));

    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_12:
      if ((has & 4) == 0)
        goto LABEL_13;
LABEL_17:
      v12 = (void *)MEMORY[0x1E0CB37E8];
      -[INFERENCESchemaINFERENCECandidateInfo score](self, "score");
      objc_msgSend(v12, "numberWithFloat:");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("score"));

      if ((*(_BYTE *)&self->_has & 1) == 0)
        goto LABEL_22;
      goto LABEL_18;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[INFERENCESchemaINFERENCECandidateInfo rank](self, "rank"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("rank"));

  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_17;
LABEL_13:
  if ((has & 1) == 0)
    goto LABEL_22;
LABEL_18:
  v14 = -[INFERENCESchemaINFERENCECandidateInfo searchProvider](self, "searchProvider") - 1;
  if (v14 > 3)
    v15 = CFSTR("INFERENCESEARCHPROVIDER_UNKNOWN");
  else
    v15 = off_1E562FA50[v14];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("searchProvider"));
LABEL_22:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[INFERENCESchemaINFERENCECandidateInfo dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (INFERENCESchemaINFERENCECandidateInfo)initWithJSON:(id)a3
{
  void *v4;
  INFERENCESchemaINFERENCECandidateInfo *v5;
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
    self = -[INFERENCESchemaINFERENCECandidateInfo initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (INFERENCESchemaINFERENCECandidateInfo)initWithDictionary:(id)a3
{
  id v4;
  INFERENCESchemaINFERENCECandidateInfo *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  INFERENCESchemaINFERENCECandidateInfo *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)INFERENCESchemaINFERENCECandidateInfo;
  v5 = -[INFERENCESchemaINFERENCECandidateInfo init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("searchProvider"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECandidateInfo setSearchProvider:](v5, "setSearchProvider:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rank"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECandidateInfo setRank:](v5, "setRank:", objc_msgSend(v7, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("score"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v8, "floatValue");
      -[INFERENCESchemaINFERENCECandidateInfo setScore:](v5, "setScore:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isShownToUser"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECandidateInfo setIsShownToUser:](v5, "setIsShownToUser:", objc_msgSend(v9, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("anonymizedEntityIdentifier"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = (void *)objc_msgSend(v10, "copy");
      -[INFERENCESchemaINFERENCECandidateInfo setAnonymizedEntityIdentifier:](v5, "setAnonymizedEntityIdentifier:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("candidateType"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECandidateInfo setCandidateType:](v5, "setCandidateType:", objc_msgSend(v12, "intValue"));
    v13 = v5;

  }
  return v5;
}

- (int)searchProvider
{
  return self->_searchProvider;
}

- (unsigned)rank
{
  return self->_rank;
}

- (float)score
{
  return self->_score;
}

- (BOOL)isShownToUser
{
  return self->_isShownToUser;
}

- (NSString)anonymizedEntityIdentifier
{
  return self->_anonymizedEntityIdentifier;
}

- (void)setAnonymizedEntityIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int)candidateType
{
  return self->_candidateType;
}

- (void)setHasAnonymizedEntityIdentifier:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anonymizedEntityIdentifier, 0);
}

@end
