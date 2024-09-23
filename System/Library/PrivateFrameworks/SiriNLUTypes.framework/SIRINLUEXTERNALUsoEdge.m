@implementation SIRINLUEXTERNALUsoEdge

- (unsigned)fromIndex
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_fromIndex;
  else
    return 0;
}

- (void)setFromIndex:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_fromIndex = a3;
}

- (void)setHasFromIndex:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasFromIndex
{
  return *(_BYTE *)&self->_has & 1;
}

- (unsigned)toIndex
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_toIndex;
  else
    return 0;
}

- (void)setToIndex:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_toIndex = a3;
}

- (void)setHasToIndex:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasToIndex
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasLabel
{
  return self->_label != 0;
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
  v8.super_class = (Class)SIRINLUEXTERNALUsoEdge;
  -[SIRINLUEXTERNALUsoEdge description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRINLUEXTERNALUsoEdge dictionaryRepresentation](self, "dictionaryRepresentation");
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
  void *v6;
  SIRINLUEXTERNALUsoEdgeLabel *label;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_fromIndex);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("from_index"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_toIndex);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("to_index"));

  }
  label = self->_label;
  if (label)
  {
    -[SIRINLUEXTERNALUsoEdgeLabel dictionaryRepresentation](label, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("label"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUEXTERNALUsoEdgeReadFrom((uint64_t)self, (uint64_t)a3);
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
    PBDataWriterWriteUint32Field();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v6;
  }
  if (self->_label)
  {
    PBDataWriterWriteSubmessage();
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
    v4[2] = self->_fromIndex;
    *((_BYTE *)v4 + 28) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v4[6] = self->_toIndex;
    *((_BYTE *)v4 + 28) |= 2u;
  }
  if (self->_label)
  {
    v6 = v4;
    objc_msgSend(v4, "setLabel:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  char has;
  id v8;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_DWORD *)(v5 + 8) = self->_fromIndex;
    *(_BYTE *)(v5 + 28) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_toIndex;
    *(_BYTE *)(v5 + 28) |= 2u;
  }
  v8 = -[SIRINLUEXTERNALUsoEdgeLabel copyWithZone:](self->_label, "copyWithZone:", a3);
  v9 = (void *)v6[2];
  v6[2] = v8;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  SIRINLUEXTERNALUsoEdgeLabel *label;
  char v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) == 0 || self->_fromIndex != *((_DWORD *)v4 + 2))
      goto LABEL_14;
  }
  else if ((*((_BYTE *)v4 + 28) & 1) != 0)
  {
LABEL_14:
    v6 = 0;
    goto LABEL_15;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 2) == 0 || self->_toIndex != *((_DWORD *)v4 + 6))
      goto LABEL_14;
  }
  else if ((*((_BYTE *)v4 + 28) & 2) != 0)
  {
    goto LABEL_14;
  }
  label = self->_label;
  if ((unint64_t)label | *((_QWORD *)v4 + 2))
    v6 = -[SIRINLUEXTERNALUsoEdgeLabel isEqual:](label, "isEqual:");
  else
    v6 = 1;
LABEL_15:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v2 = 2654435761 * self->_fromIndex;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v3 = 0;
    return v3 ^ v2 ^ -[SIRINLUEXTERNALUsoEdgeLabel hash](self->_label, "hash");
  }
  v2 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v3 = 2654435761 * self->_toIndex;
  return v3 ^ v2 ^ -[SIRINLUEXTERNALUsoEdgeLabel hash](self->_label, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  _QWORD *v5;
  char v6;
  SIRINLUEXTERNALUsoEdgeLabel *label;
  uint64_t v8;
  _QWORD *v9;

  v4 = a3;
  v5 = v4;
  v6 = *((_BYTE *)v4 + 28);
  if ((v6 & 1) != 0)
  {
    self->_fromIndex = *((_DWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
    v6 = *((_BYTE *)v4 + 28);
  }
  if ((v6 & 2) != 0)
  {
    self->_toIndex = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 2u;
  }
  label = self->_label;
  v8 = v5[2];
  if (label)
  {
    if (v8)
    {
      v9 = v5;
      -[SIRINLUEXTERNALUsoEdgeLabel mergeFrom:](label, "mergeFrom:");
LABEL_10:
      v5 = v9;
    }
  }
  else if (v8)
  {
    v9 = v5;
    -[SIRINLUEXTERNALUsoEdge setLabel:](self, "setLabel:");
    goto LABEL_10;
  }

}

- (SIRINLUEXTERNALUsoEdgeLabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
}

@end
