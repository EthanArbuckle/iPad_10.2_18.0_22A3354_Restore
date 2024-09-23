@implementation ATXPBProactiveSuggestionScoreSpecification

- (uint64_t)setSuggestedConfidenceCategory:(uint64_t)result
{
  if (result)
  {
    *(_BYTE *)(result + 20) |= 2u;
    *(_DWORD *)(result + 16) = a2;
  }
  return result;
}

- (uint64_t)setRawScore:(uint64_t)result
{
  if (result)
  {
    *(_BYTE *)(result + 20) |= 1u;
    *(double *)(result + 8) = a2;
  }
  return result;
}

- (uint64_t)suggestedConfidenceCategory
{
  if (result)
  {
    if ((*(_BYTE *)(result + 20) & 2) != 0)
      return *(unsigned int *)(result + 16);
    else
      return 0;
  }
  return result;
}

- (double)rawScore
{
  if (a1)
    return *(double *)(a1 + 8);
  else
    return 0.0;
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  has = (char)self->_has;
  v6 = v4;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }

}

- (uint64_t)setHasRawScore:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 20) = *(_BYTE *)(result + 20) & 0xFE | a2;
  return result;
}

- (uint64_t)hasRawScore
{
  if (result)
    return *(_BYTE *)(result + 20) & 1;
  return result;
}

- (uint64_t)setHasSuggestedConfidenceCategory:(uint64_t)result
{
  char v2;

  if (result)
  {
    if (a2)
      v2 = 2;
    else
      v2 = 0;
    *(_BYTE *)(result + 20) = *(_BYTE *)(result + 20) & 0xFD | v2;
  }
  return result;
}

- (uint64_t)hasSuggestedConfidenceCategory
{
  if (result)
    return (*(unsigned __int8 *)(result + 20) >> 1) & 1;
  return result;
}

- (__CFString)suggestedConfidenceCategoryAsString:(void *)a1
{
  if (a1)
  {
    if (a2 < 5)
      return off_1E57CFAA0[(int)a2];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), a2);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (__CFString *)a1;
}

- (uint64_t)StringAsSuggestedConfidenceCategory:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = v3;
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Unknown")) & 1) != 0)
    {
      v6 = 0;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Fallback")) & 1) != 0)
    {
      v6 = 1;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("LowConfidence")) & 1) != 0)
    {
      v6 = 2;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("MediumConfidence")) & 1) != 0)
    {
      v6 = 3;
    }
    else if (objc_msgSend(v5, "isEqualToString:", CFSTR("HighConfidence")))
    {
      v6 = 4;
    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
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
  v8.super_class = (Class)ATXPBProactiveSuggestionScoreSpecification;
  -[ATXPBProactiveSuggestionScoreSpecification description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBProactiveSuggestionScoreSpecification dictionaryRepresentation](self, "dictionaryRepresentation");
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
  uint64_t suggestedConfidenceCategory;
  __CFString *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_rawScore);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("rawScore"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    suggestedConfidenceCategory = self->_suggestedConfidenceCategory;
    if (suggestedConfidenceCategory >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_suggestedConfidenceCategory);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E57CFAA0[suggestedConfidenceCategory];
    }
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("suggestedConfidenceCategory"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBProactiveSuggestionScoreSpecificationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)copyTo:(uint64_t)a1
{
  _QWORD *v3;
  char v4;

  v3 = a2;
  if (a1)
  {
    v4 = *(_BYTE *)(a1 + 20);
    if ((v4 & 1) != 0)
    {
      v3[1] = *(_QWORD *)(a1 + 8);
      *((_BYTE *)v3 + 20) |= 1u;
      v4 = *(_BYTE *)(a1 + 20);
    }
    if ((v4 & 2) != 0)
    {
      *((_DWORD *)v3 + 4) = *(_DWORD *)(a1 + 16);
      *((_BYTE *)v3 + 20) |= 2u;
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)result + 1) = *(_QWORD *)&self->_rawScore;
    *((_BYTE *)result + 20) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)result + 4) = self->_suggestedConfidenceCategory;
    *((_BYTE *)result + 20) |= 2u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_11;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 1) == 0 || self->_rawScore != *((double *)v4 + 1))
      goto LABEL_11;
  }
  else if ((*((_BYTE *)v4 + 20) & 1) != 0)
  {
LABEL_11:
    v5 = 0;
    goto LABEL_12;
  }
  v5 = (*((_BYTE *)v4 + 20) & 2) == 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 2) == 0 || self->_suggestedConfidenceCategory != *((_DWORD *)v4 + 4))
      goto LABEL_11;
    v5 = 1;
  }
LABEL_12:

  return v5;
}

- (unint64_t)hash
{
  char has;
  unint64_t v4;
  double rawScore;
  double v6;
  long double v7;
  double v8;
  uint64_t v9;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    rawScore = self->_rawScore;
    v6 = -rawScore;
    if (rawScore >= 0.0)
      v6 = self->_rawScore;
    v7 = floor(v6 + 0.5);
    v8 = (v6 - v7) * 1.84467441e19;
    v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0)
        v4 += (unint64_t)v8;
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    v4 = 0;
  }
  if ((has & 2) != 0)
    v9 = 2654435761 * self->_suggestedConfidenceCategory;
  else
    v9 = 0;
  return v9 ^ v4;
}

- (void)mergeFrom:(uint64_t)a1
{
  _BYTE *v3;
  char v4;

  v3 = a2;
  if (a1)
  {
    v4 = v3[20];
    if ((v4 & 1) != 0)
    {
      *(_QWORD *)(a1 + 8) = *((_QWORD *)v3 + 1);
      *(_BYTE *)(a1 + 20) |= 1u;
      v4 = v3[20];
    }
    if ((v4 & 2) != 0)
    {
      *(_DWORD *)(a1 + 16) = *((_DWORD *)v3 + 4);
      *(_BYTE *)(a1 + 20) |= 2u;
    }
  }

}

@end
