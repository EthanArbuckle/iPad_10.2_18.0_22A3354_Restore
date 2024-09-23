@implementation SIRINLUINTERNALQUERYREWRITEQRToken

- (BOOL)hasValue
{
  return self->_value != 0;
}

- (void)setStartIndex:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_startIndex = a3;
}

- (void)setHasStartIndex:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasStartIndex
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setEndIndex:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_endIndex = a3;
}

- (void)setHasEndIndex:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasEndIndex
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setAsrConfidence:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_asrConfidence = a3;
}

- (void)setHasAsrConfidence:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAsrConfidence
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasPhoneSequence
{
  return self->_phoneSequence != 0;
}

- (void)setRemoveSpaceAfter:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_removeSpaceAfter = a3;
}

- (void)setHasRemoveSpaceAfter:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasRemoveSpaceAfter
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
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
  v8.super_class = (Class)SIRINLUINTERNALQUERYREWRITEQRToken;
  -[SIRINLUINTERNALQUERYREWRITEQRToken description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRINLUINTERNALQUERYREWRITEQRToken dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSString *phoneSequence;
  void *v9;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  value = self->_value;
  if (value)
    objc_msgSend(v3, "setObject:forKey:", value, CFSTR("value"));
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_startIndex);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("start_index"));

    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 1) == 0)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_endIndex);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("end_index"));

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_6:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_asrConfidence);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("asr_confidence"));

  }
LABEL_7:
  phoneSequence = self->_phoneSequence;
  if (phoneSequence)
    objc_msgSend(v4, "setObject:forKey:", phoneSequence, CFSTR("phone_sequence"));
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_removeSpaceAfter);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("remove_space_after"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUINTERNALQUERYREWRITEQRTokenReadFrom((uint64_t)self, (uint64_t)a3);
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
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v6;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 1) == 0)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteUint32Field();
  v4 = v6;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_6:
    PBDataWriterWriteDoubleField();
    v4 = v6;
  }
LABEL_7:
  if (self->_phoneSequence)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_value)
  {
    objc_msgSend(v4, "setValue:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)v4 + 8) = self->_startIndex;
    *((_BYTE *)v4 + 52) |= 4u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 1) == 0)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  *((_DWORD *)v4 + 4) = self->_endIndex;
  *((_BYTE *)v4 + 52) |= 2u;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_6:
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_asrConfidence;
    *((_BYTE *)v4 + 52) |= 1u;
  }
LABEL_7:
  if (self->_phoneSequence)
  {
    objc_msgSend(v6, "setPhoneSequence:");
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    *((_BYTE *)v4 + 48) = self->_removeSpaceAfter;
    *((_BYTE *)v4 + 52) |= 8u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char has;
  uint64_t v9;
  void *v10;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_value, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v6;

  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v5 + 32) = self->_startIndex;
    *(_BYTE *)(v5 + 52) |= 4u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 16) = self->_endIndex;
  *(_BYTE *)(v5 + 52) |= 2u;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_4:
    *(double *)(v5 + 8) = self->_asrConfidence;
    *(_BYTE *)(v5 + 52) |= 1u;
  }
LABEL_5:
  v9 = -[NSString copyWithZone:](self->_phoneSequence, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v9;

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    *(_BYTE *)(v5 + 48) = self->_removeSpaceAfter;
    *(_BYTE *)(v5 + 52) |= 8u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *value;
  char has;
  char v7;
  NSString *phoneSequence;
  BOOL v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_24;
  value = self->_value;
  if ((unint64_t)value | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](value, "isEqual:"))
      goto LABEL_24;
  }
  has = (char)self->_has;
  v7 = *((_BYTE *)v4 + 52);
  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 4) == 0 || self->_startIndex != *((_DWORD *)v4 + 8))
      goto LABEL_24;
  }
  else if ((*((_BYTE *)v4 + 52) & 4) != 0)
  {
    goto LABEL_24;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 2) == 0 || self->_endIndex != *((_DWORD *)v4 + 4))
      goto LABEL_24;
  }
  else if ((*((_BYTE *)v4 + 52) & 2) != 0)
  {
    goto LABEL_24;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 1) == 0 || self->_asrConfidence != *((double *)v4 + 1))
      goto LABEL_24;
  }
  else if ((*((_BYTE *)v4 + 52) & 1) != 0)
  {
    goto LABEL_24;
  }
  phoneSequence = self->_phoneSequence;
  if ((unint64_t)phoneSequence | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](phoneSequence, "isEqual:"))
      goto LABEL_24;
    has = (char)self->_has;
    v7 = *((_BYTE *)v4 + 52);
  }
  v9 = (v7 & 8) == 0;
  if ((has & 8) != 0)
  {
    if ((v7 & 8) != 0)
    {
      if (self->_removeSpaceAfter)
      {
        if (!*((_BYTE *)v4 + 48))
          goto LABEL_24;
      }
      else if (*((_BYTE *)v4 + 48))
      {
        goto LABEL_24;
      }
      v9 = 1;
      goto LABEL_25;
    }
LABEL_24:
    v9 = 0;
  }
LABEL_25:

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;
  double asrConfidence;
  double v7;
  long double v8;
  double v9;
  unint64_t v10;
  NSUInteger v11;
  uint64_t v12;

  v3 = -[NSString hash](self->_value, "hash");
  if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_9:
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_4;
LABEL_10:
    v10 = 0;
    goto LABEL_13;
  }
  v4 = 2654435761 * self->_startIndex;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_9;
LABEL_3:
  v5 = 2654435761 * self->_endIndex;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_10;
LABEL_4:
  asrConfidence = self->_asrConfidence;
  v7 = -asrConfidence;
  if (asrConfidence >= 0.0)
    v7 = self->_asrConfidence;
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
  v11 = -[NSString hash](self->_phoneSequence, "hash");
  if ((*(_BYTE *)&self->_has & 8) != 0)
    v12 = 2654435761 * self->_removeSpaceAfter;
  else
    v12 = 0;
  return v4 ^ v3 ^ v5 ^ v10 ^ v11 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  v6 = v4;
  if (*((_QWORD *)v4 + 5))
  {
    -[SIRINLUINTERNALQUERYREWRITEQRToken setValue:](self, "setValue:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 52);
  if ((v5 & 4) != 0)
  {
    self->_startIndex = *((_DWORD *)v4 + 8);
    *(_BYTE *)&self->_has |= 4u;
    v5 = *((_BYTE *)v4 + 52);
    if ((v5 & 2) == 0)
    {
LABEL_5:
      if ((v5 & 1) == 0)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  else if ((*((_BYTE *)v4 + 52) & 2) == 0)
  {
    goto LABEL_5;
  }
  self->_endIndex = *((_DWORD *)v4 + 4);
  *(_BYTE *)&self->_has |= 2u;
  if ((*((_BYTE *)v4 + 52) & 1) != 0)
  {
LABEL_6:
    self->_asrConfidence = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
LABEL_7:
  if (*((_QWORD *)v4 + 3))
  {
    -[SIRINLUINTERNALQUERYREWRITEQRToken setPhoneSequence:](self, "setPhoneSequence:");
    v4 = v6;
  }
  if ((*((_BYTE *)v4 + 52) & 8) != 0)
  {
    self->_removeSpaceAfter = *((_BYTE *)v4 + 48);
    *(_BYTE *)&self->_has |= 8u;
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

- (unsigned)startIndex
{
  return self->_startIndex;
}

- (unsigned)endIndex
{
  return self->_endIndex;
}

- (double)asrConfidence
{
  return self->_asrConfidence;
}

- (NSString)phoneSequence
{
  return self->_phoneSequence;
}

- (void)setPhoneSequence:(id)a3
{
  objc_storeStrong((id *)&self->_phoneSequence, a3);
}

- (BOOL)removeSpaceAfter
{
  return self->_removeSpaceAfter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_phoneSequence, 0);
}

+ (id)options
{
  if (options_once_13460 != -1)
    dispatch_once(&options_once_13460, &__block_literal_global_13461);
  return (id)options_sOptions_13462;
}

void __45__SIRINLUINTERNALQUERYREWRITEQRToken_options__block_invoke()
{
  void *v0;

  v0 = (void *)options_sOptions_13462;
  options_sOptions_13462 = (uint64_t)&unk_1E7BD2C38;

}

@end
