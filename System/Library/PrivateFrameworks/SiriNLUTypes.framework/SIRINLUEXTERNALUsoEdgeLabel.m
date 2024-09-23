@implementation SIRINLUEXTERNALUsoEdgeLabel

- (unsigned)usoElementId
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_usoElementId;
  else
    return 0;
}

- (void)setUsoElementId:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_usoElementId = a3;
}

- (void)setHasUsoElementId:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasUsoElementId
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setEnumeration:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_enumeration = a3;
}

- (void)setHasEnumeration:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEnumeration
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasBaseEdgeLabel
{
  return self->_baseEdgeLabel != 0;
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
  v8.super_class = (Class)SIRINLUEXTERNALUsoEdgeLabel;
  -[SIRINLUEXTERNALUsoEdgeLabel description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRINLUEXTERNALUsoEdgeLabel dictionaryRepresentation](self, "dictionaryRepresentation");
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
  SIRINLUEXTERNALUsoLabel *baseEdgeLabel;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_usoElementId);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("uso_element_id"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_enumeration);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("enumeration"));

  }
  baseEdgeLabel = self->_baseEdgeLabel;
  if (baseEdgeLabel)
  {
    -[SIRINLUEXTERNALUsoLabel dictionaryRepresentation](baseEdgeLabel, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("base_edge_label"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUEXTERNALUsoEdgeLabelReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  has = (char)self->_has;
  v6 = v4;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v6;
  }
  if (self->_baseEdgeLabel)
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
  if ((has & 2) != 0)
  {
    v4[5] = self->_usoElementId;
    *((_BYTE *)v4 + 24) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    v4[4] = self->_enumeration;
    *((_BYTE *)v4 + 24) |= 1u;
  }
  if (self->_baseEdgeLabel)
  {
    v6 = v4;
    objc_msgSend(v4, "setBaseEdgeLabel:");
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
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 20) = self->_usoElementId;
    *(_BYTE *)(v5 + 24) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_enumeration;
    *(_BYTE *)(v5 + 24) |= 1u;
  }
  v8 = -[SIRINLUEXTERNALUsoLabel copyWithZone:](self->_baseEdgeLabel, "copyWithZone:", a3);
  v9 = (void *)v6[1];
  v6[1] = v8;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  SIRINLUEXTERNALUsoLabel *baseEdgeLabel;
  char v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 2) == 0 || self->_usoElementId != *((_DWORD *)v4 + 5))
      goto LABEL_14;
  }
  else if ((*((_BYTE *)v4 + 24) & 2) != 0)
  {
LABEL_14:
    v6 = 0;
    goto LABEL_15;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 1) == 0 || self->_enumeration != *((_DWORD *)v4 + 4))
      goto LABEL_14;
  }
  else if ((*((_BYTE *)v4 + 24) & 1) != 0)
  {
    goto LABEL_14;
  }
  baseEdgeLabel = self->_baseEdgeLabel;
  if ((unint64_t)baseEdgeLabel | *((_QWORD *)v4 + 1))
    v6 = -[SIRINLUEXTERNALUsoLabel isEqual:](baseEdgeLabel, "isEqual:");
  else
    v6 = 1;
LABEL_15:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v2 = 2654435761 * self->_usoElementId;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
LABEL_5:
    v3 = 0;
    return v3 ^ v2 ^ -[SIRINLUEXTERNALUsoLabel hash](self->_baseEdgeLabel, "hash");
  }
  v2 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_5;
LABEL_3:
  v3 = 2654435761 * self->_enumeration;
  return v3 ^ v2 ^ -[SIRINLUEXTERNALUsoLabel hash](self->_baseEdgeLabel, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  _QWORD *v5;
  char v6;
  SIRINLUEXTERNALUsoLabel *baseEdgeLabel;
  uint64_t v8;
  _QWORD *v9;

  v4 = a3;
  v5 = v4;
  v6 = *((_BYTE *)v4 + 24);
  if ((v6 & 2) != 0)
  {
    self->_usoElementId = *((_DWORD *)v4 + 5);
    *(_BYTE *)&self->_has |= 2u;
    v6 = *((_BYTE *)v4 + 24);
  }
  if ((v6 & 1) != 0)
  {
    self->_enumeration = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 1u;
  }
  baseEdgeLabel = self->_baseEdgeLabel;
  v8 = v5[1];
  if (baseEdgeLabel)
  {
    if (v8)
    {
      v9 = v5;
      -[SIRINLUEXTERNALUsoLabel mergeFrom:](baseEdgeLabel, "mergeFrom:");
LABEL_10:
      v5 = v9;
    }
  }
  else if (v8)
  {
    v9 = v5;
    -[SIRINLUEXTERNALUsoEdgeLabel setBaseEdgeLabel:](self, "setBaseEdgeLabel:");
    goto LABEL_10;
  }

}

- (unsigned)enumeration
{
  return self->_enumeration;
}

- (SIRINLUEXTERNALUsoLabel)baseEdgeLabel
{
  return self->_baseEdgeLabel;
}

- (void)setBaseEdgeLabel:(id)a3
{
  objc_storeStrong((id *)&self->_baseEdgeLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseEdgeLabel, 0);
}

@end
