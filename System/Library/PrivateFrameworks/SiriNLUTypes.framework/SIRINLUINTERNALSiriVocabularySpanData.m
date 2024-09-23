@implementation SIRINLUINTERNALSiriVocabularySpanData

- (void)setPriorOrdinality:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_priorOrdinality = a3;
}

- (void)setHasPriorOrdinality:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasPriorOrdinality
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setPriorScore:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_priorScore = a3;
}

- (void)setHasPriorScore:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPriorScore
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setMatchScore:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_matchScore = a3;
}

- (void)setHasMatchScore:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMatchScore
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUINTERNALSiriVocabularySpanData;
  -[SIRINLUINTERNALSiriVocabularySpanData description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRINLUINTERNALSiriVocabularySpanData dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_3;
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_priorScore);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("prior_score"));

    if ((*(_BYTE *)&self->_has & 1) == 0)
      return v3;
    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_priorOrdinality);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("prior_ordinality"));

  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 1) != 0)
  {
LABEL_4:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_matchScore);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("match_score"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUINTERNALSiriVocabularySpanDataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  has = (char)self->_has;
  v6 = v4;
  if ((has & 4) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_3;
LABEL_7:
    PBDataWriterWriteDoubleField();
    v4 = v6;
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  PBDataWriterWriteUint32Field();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 1) != 0)
  {
LABEL_4:
    PBDataWriterWriteDoubleField();
    v4 = v6;
  }
LABEL_5:

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  char has;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_3;
LABEL_7:
    v4[2] = *(_QWORD *)&self->_priorScore;
    *((_BYTE *)v4 + 28) |= 2u;
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  *((_DWORD *)v4 + 6) = self->_priorOrdinality;
  *((_BYTE *)v4 + 28) |= 4u;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 1) != 0)
  {
LABEL_4:
    v4[1] = *(_QWORD *)&self->_matchScore;
    *((_BYTE *)v4 + 28) |= 1u;
  }
LABEL_5:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)result + 6) = self->_priorOrdinality;
    *((_BYTE *)result + 28) |= 4u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        return result;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)result + 2) = *(_QWORD *)&self->_priorScore;
  *((_BYTE *)result + 28) |= 2u;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    return result;
LABEL_4:
  *((_QWORD *)result + 1) = *(_QWORD *)&self->_matchScore;
  *((_BYTE *)result + 28) |= 1u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_16;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 4) == 0 || self->_priorOrdinality != *((_DWORD *)v4 + 6))
      goto LABEL_16;
  }
  else if ((*((_BYTE *)v4 + 28) & 4) != 0)
  {
LABEL_16:
    v5 = 0;
    goto LABEL_17;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 2) == 0 || self->_priorScore != *((double *)v4 + 2))
      goto LABEL_16;
  }
  else if ((*((_BYTE *)v4 + 28) & 2) != 0)
  {
    goto LABEL_16;
  }
  v5 = (*((_BYTE *)v4 + 28) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) == 0 || self->_matchScore != *((double *)v4 + 1))
      goto LABEL_16;
    v5 = 1;
  }
LABEL_17:

  return v5;
}

- (unint64_t)hash
{
  char has;
  uint64_t v4;
  double priorScore;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  unint64_t v10;
  double matchScore;
  double v12;
  long double v13;
  double v14;

  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v4 = 2654435761 * self->_priorOrdinality;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_8:
    v9 = 0;
    goto LABEL_11;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_8;
LABEL_3:
  priorScore = self->_priorScore;
  v6 = -priorScore;
  if (priorScore >= 0.0)
    v6 = self->_priorScore;
  v7 = floor(v6 + 0.5);
  v8 = (v6 - v7) * 1.84467441e19;
  v9 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
  if (v8 >= 0.0)
  {
    if (v8 > 0.0)
      v9 += (unint64_t)v8;
  }
  else
  {
    v9 -= (unint64_t)fabs(v8);
  }
LABEL_11:
  if ((has & 1) != 0)
  {
    matchScore = self->_matchScore;
    v12 = -matchScore;
    if (matchScore >= 0.0)
      v12 = self->_matchScore;
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
  return v9 ^ v4 ^ v10;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 28);
  if ((v5 & 4) == 0)
  {
    if ((*((_BYTE *)v4 + 28) & 2) == 0)
      goto LABEL_3;
LABEL_7:
    self->_priorScore = *((double *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
    if ((*((_BYTE *)v4 + 28) & 1) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  self->_priorOrdinality = *((_DWORD *)v4 + 6);
  *(_BYTE *)&self->_has |= 4u;
  v5 = *((_BYTE *)v4 + 28);
  if ((v5 & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((v5 & 1) != 0)
  {
LABEL_4:
    self->_matchScore = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
LABEL_5:

}

- (unsigned)priorOrdinality
{
  return self->_priorOrdinality;
}

- (double)priorScore
{
  return self->_priorScore;
}

- (double)matchScore
{
  return self->_matchScore;
}

@end
