@implementation SIRINLUINTERNALCompareOptions

- (BOOL)caseInsensitive
{
  return (*(_BYTE *)&self->_has & 1) == 0 || self->_caseInsensitive;
}

- (void)setCaseInsensitive:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_caseInsensitive = a3;
}

- (void)setHasCaseInsensitive:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCaseInsensitive
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)diacriticInsensitive
{
  return (*(_BYTE *)&self->_has & 2) != 0 && self->_diacriticInsensitive;
}

- (void)setDiacriticInsensitive:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_diacriticInsensitive = a3;
}

- (void)setHasDiacriticInsensitive:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDiacriticInsensitive
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)widthInsensitive
{
  return (*(_BYTE *)&self->_has & 4) != 0 && self->_widthInsensitive;
}

- (void)setWidthInsensitive:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_widthInsensitive = a3;
}

- (void)setHasWidthInsensitive:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasWidthInsensitive
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
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
  v8.super_class = (Class)SIRINLUINTERNALCompareOptions;
  -[SIRINLUINTERNALCompareOptions description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRINLUINTERNALCompareOptions dictionaryRepresentation](self, "dictionaryRepresentation");
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
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_3;
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_diacriticInsensitive);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("diacritic_insensitive"));

    if ((*(_BYTE *)&self->_has & 4) == 0)
      return v3;
    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_caseInsensitive);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("case_insensitive"));

  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_widthInsensitive);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("width_insensitive"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUINTERNALCompareOptionsReadFrom((uint64_t)self, (uint64_t)a3);
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
    PBDataWriterWriteBOOLField();
    v4 = v6;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  PBDataWriterWriteBOOLField();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    PBDataWriterWriteBOOLField();
    v4 = v6;
  }
LABEL_5:

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  char has;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_3;
LABEL_7:
    v4[9] = self->_diacriticInsensitive;
    v4[12] |= 2u;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  v4[8] = self->_caseInsensitive;
  v4[12] |= 1u;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    v4[10] = self->_widthInsensitive;
    v4[12] |= 4u;
  }
LABEL_5:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_BYTE *)result + 8) = self->_caseInsensitive;
    *((_BYTE *)result + 12) |= 1u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        return result;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_BYTE *)result + 9) = self->_diacriticInsensitive;
  *((_BYTE *)result + 12) |= 2u;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    return result;
LABEL_4:
  *((_BYTE *)result + 10) = self->_widthInsensitive;
  *((_BYTE *)result + 12) |= 4u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_20;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((v4[12] & 1) == 0)
      goto LABEL_20;
    if (self->_caseInsensitive)
    {
      if (!v4[8])
        goto LABEL_20;
    }
    else if (v4[8])
    {
      goto LABEL_20;
    }
  }
  else if ((v4[12] & 1) != 0)
  {
    goto LABEL_20;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((v4[12] & 2) == 0)
      goto LABEL_20;
    if (self->_diacriticInsensitive)
    {
      if (!v4[9])
        goto LABEL_20;
    }
    else if (v4[9])
    {
      goto LABEL_20;
    }
  }
  else if ((v4[12] & 2) != 0)
  {
    goto LABEL_20;
  }
  v5 = (v4[12] & 4) == 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((v4[12] & 4) != 0)
    {
      if (self->_widthInsensitive)
      {
        if (!v4[10])
          goto LABEL_20;
      }
      else if (v4[10])
      {
        goto LABEL_20;
      }
      v5 = 1;
      goto LABEL_21;
    }
LABEL_20:
    v5 = 0;
  }
LABEL_21:

  return v5;
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
  v2 = 2654435761 * self->_caseInsensitive;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v3 = 2654435761 * self->_diacriticInsensitive;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_7;
LABEL_4:
  v4 = 2654435761 * self->_widthInsensitive;
  return v3 ^ v2 ^ v4;
}

- (void)mergeFrom:(id)a3
{
  BOOL *v4;
  BOOL v5;

  v4 = (BOOL *)a3;
  v5 = v4[12];
  if (!v5)
  {
    if ((v4[12] & 2) == 0)
      goto LABEL_3;
LABEL_7:
    self->_diacriticInsensitive = v4[9];
    *(_BYTE *)&self->_has |= 2u;
    if ((v4[12] & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  self->_caseInsensitive = v4[8];
  *(_BYTE *)&self->_has |= 1u;
  v5 = v4[12];
  if ((v5 & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((v5 & 4) != 0)
  {
LABEL_4:
    self->_widthInsensitive = v4[10];
    *(_BYTE *)&self->_has |= 4u;
  }
LABEL_5:

}

@end
