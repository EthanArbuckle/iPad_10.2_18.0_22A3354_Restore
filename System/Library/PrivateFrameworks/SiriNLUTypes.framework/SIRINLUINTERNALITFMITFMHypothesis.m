@implementation SIRINLUINTERNALITFMITFMHypothesis

- (void)setLabel:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_label = a3;
}

- (void)setHasLabel:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasLabel
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setProbability:(float)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_probability = a3;
}

- (void)setHasProbability:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasProbability
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasStringLabel
{
  return self->_stringLabel != 0;
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
  v8.super_class = (Class)SIRINLUINTERNALITFMITFMHypothesis;
  -[SIRINLUINTERNALITFMITFMHypothesis description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRINLUINTERNALITFMITFMHypothesis dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  double v4;
  char has;
  void *v6;
  void *v7;
  NSString *stringLabel;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_label);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("label"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(float *)&v4 = self->_probability;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("probability"));

  }
  stringLabel = self->_stringLabel;
  if (stringLabel)
    objc_msgSend(v3, "setObject:forKey:", stringLabel, CFSTR("string_label"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUINTERNALITFMITFMHypothesisReadFrom((uint64_t)self, (uint64_t)a3);
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
    PBDataWriterWriteInt32Field();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteFloatField();
    v4 = v6;
  }
  if (self->_stringLabel)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char has;
  _DWORD *v6;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v4[2] = self->_label;
    *((_BYTE *)v4 + 24) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v4[3] = LODWORD(self->_probability);
    *((_BYTE *)v4 + 24) |= 2u;
  }
  if (self->_stringLabel)
  {
    v6 = v4;
    objc_msgSend(v4, "setStringLabel:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  char has;
  uint64_t v8;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_DWORD *)(v5 + 8) = self->_label;
    *(_BYTE *)(v5 + 24) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(float *)(v5 + 12) = self->_probability;
    *(_BYTE *)(v5 + 24) |= 2u;
  }
  v8 = -[NSString copyWithZone:](self->_stringLabel, "copyWithZone:", a3);
  v9 = (void *)v6[2];
  v6[2] = v8;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *stringLabel;
  char v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 1) == 0 || self->_label != *((_DWORD *)v4 + 2))
      goto LABEL_14;
  }
  else if ((*((_BYTE *)v4 + 24) & 1) != 0)
  {
LABEL_14:
    v6 = 0;
    goto LABEL_15;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 2) == 0 || self->_probability != *((float *)v4 + 3))
      goto LABEL_14;
  }
  else if ((*((_BYTE *)v4 + 24) & 2) != 0)
  {
    goto LABEL_14;
  }
  stringLabel = self->_stringLabel;
  if ((unint64_t)stringLabel | *((_QWORD *)v4 + 2))
    v6 = -[NSString isEqual:](stringLabel, "isEqual:");
  else
    v6 = 1;
LABEL_15:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;
  float probability;
  float v5;
  float v6;
  float v7;
  unint64_t v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v3 = 2654435761 * self->_label;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_8:
    v8 = 0;
    return v8 ^ v3 ^ -[NSString hash](self->_stringLabel, "hash");
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_8;
LABEL_3:
  probability = self->_probability;
  v5 = -probability;
  if (probability >= 0.0)
    v5 = self->_probability;
  v6 = floorf(v5 + 0.5);
  v7 = (float)(v5 - v6) * 1.8447e19;
  v8 = 2654435761u * (unint64_t)fmodf(v6, 1.8447e19);
  if (v7 >= 0.0)
  {
    if (v7 > 0.0)
      v8 += (unint64_t)v7;
  }
  else
  {
    v8 -= (unint64_t)fabsf(v7);
  }
  return v8 ^ v3 ^ -[NSString hash](self->_stringLabel, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 24);
  if ((v5 & 1) != 0)
  {
    self->_label = *((_DWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)v4 + 24);
  }
  if ((v5 & 2) != 0)
  {
    self->_probability = *((float *)v4 + 3);
    *(_BYTE *)&self->_has |= 2u;
  }
  if (*((_QWORD *)v4 + 2))
  {
    v6 = v4;
    -[SIRINLUINTERNALITFMITFMHypothesis setStringLabel:](self, "setStringLabel:");
    v4 = v6;
  }

}

- (int)label
{
  return self->_label;
}

- (float)probability
{
  return self->_probability;
}

- (NSString)stringLabel
{
  return self->_stringLabel;
}

- (void)setStringLabel:(id)a3
{
  objc_storeStrong((id *)&self->_stringLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringLabel, 0);
}

@end
