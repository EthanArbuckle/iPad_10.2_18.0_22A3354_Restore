@implementation SIRINLUINTERNALSubwordToken

- (BOOL)hasValue
{
  return self->_value != 0;
}

- (void)setSubwordTokenIndex:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_subwordTokenIndex = a3;
}

- (void)setHasSubwordTokenIndex:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSubwordTokenIndex
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setTokenIndex:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_tokenIndex = a3;
}

- (void)setHasTokenIndex:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTokenIndex
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
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
  v8.super_class = (Class)SIRINLUINTERNALSubwordToken;
  -[SIRINLUINTERNALSubwordToken description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRINLUINTERNALSubwordToken dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *value;
  char has;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  value = self->_value;
  if (value)
    objc_msgSend(v3, "setObject:forKey:", value, CFSTR("value"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_subwordTokenIndex);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("subword_token_index"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_tokenIndex);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("token_index"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUINTERNALSubwordTokenReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_value)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  if (self->_value)
  {
    v6 = v4;
    objc_msgSend(v4, "setValue:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_DWORD *)v4 + 2) = self->_subwordTokenIndex;
    *((_BYTE *)v4 + 24) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 3) = self->_tokenIndex;
    *((_BYTE *)v4 + 24) |= 2u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_value, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_DWORD *)(v5 + 8) = self->_subwordTokenIndex;
    *(_BYTE *)(v5 + 24) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 12) = self->_tokenIndex;
    *(_BYTE *)(v5 + 24) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *value;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_13;
  value = self->_value;
  if ((unint64_t)value | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](value, "isEqual:"))
      goto LABEL_13;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 1) == 0 || self->_subwordTokenIndex != *((_DWORD *)v4 + 2))
      goto LABEL_13;
  }
  else if ((*((_BYTE *)v4 + 24) & 1) != 0)
  {
LABEL_13:
    v6 = 0;
    goto LABEL_14;
  }
  v6 = (*((_BYTE *)v4 + 24) & 2) == 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 2) == 0 || self->_tokenIndex != *((_DWORD *)v4 + 3))
      goto LABEL_13;
    v6 = 1;
  }
LABEL_14:

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;

  v3 = -[NSString hash](self->_value, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = 2654435761 * self->_subwordTokenIndex;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v5 = 0;
    return v4 ^ v3 ^ v5;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v5 = 2654435761 * self->_tokenIndex;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  int *v4;
  char v5;
  int *v6;

  v4 = (int *)a3;
  if (*((_QWORD *)v4 + 2))
  {
    v6 = v4;
    -[SIRINLUINTERNALSubwordToken setValue:](self, "setValue:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 24);
  if ((v5 & 1) != 0)
  {
    self->_subwordTokenIndex = v4[2];
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)v4 + 24);
  }
  if ((v5 & 2) != 0)
  {
    self->_tokenIndex = v4[3];
    *(_BYTE *)&self->_has |= 2u;
  }

}

- (NSString)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_storeStrong((id *)&self->_value, a3);
}

- (int)subwordTokenIndex
{
  return self->_subwordTokenIndex;
}

- (int)tokenIndex
{
  return self->_tokenIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
}

@end
