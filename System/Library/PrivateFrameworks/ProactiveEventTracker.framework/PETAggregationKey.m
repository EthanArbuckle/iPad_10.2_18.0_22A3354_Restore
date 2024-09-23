@implementation PETAggregationKey

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  has = (char)self->_has;
  v6 = v4;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
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
  PBDataWriterWriteUint32Field();
  v4 = v6;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_4:
    PBDataWriterWriteDoubleField();
    v4 = v6;
  }
LABEL_5:
  if (self->_rawMessage)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }

}

- (void)setType:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_type = a3;
}

- (void)setRawMessage:(id)a3
{
  objc_storeStrong((id *)&self->_rawMessage, a3);
}

- (void)setDatestamp:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_datestamp = a3;
}

- (PETRawMessage)rawMessage
{
  return self->_rawMessage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawMessage, 0);
}

- (int)type
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_type;
  else
    return 0;
}

- (void)setHasType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasType
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)typeAsString:(int)a3
{
  if (a3 < 4)
    return off_1E2A410C8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SCALAR")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DISTRIBUTION")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("HISTOGRAM")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setHasDatestamp:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDatestamp
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setBucket:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_bucket = a3;
}

- (void)setHasBucket:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasBucket
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasRawMessage
{
  return self->_rawMessage != 0;
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
  v8.super_class = (Class)PETAggregationKey;
  -[PETAggregationKey description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PETAggregationKey dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  uint64_t type;
  __CFString *v6;
  void *v7;
  void *v8;
  PETRawMessage *rawMessage;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    type = self->_type;
    if (type >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_type);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = off_1E2A410C8[type];
    }
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("type"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_datestamp);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("datestamp"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_bucket);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("bucket"));

  }
  rawMessage = self->_rawMessage;
  if (rawMessage)
  {
    -[PETRawMessage dictionaryRepresentation](rawMessage, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("raw_message"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PETAggregationKeyReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char has;
  _DWORD *v6;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v4[8] = self->_type;
    *((_BYTE *)v4 + 36) |= 4u;
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
  v4[4] = self->_datestamp;
  *((_BYTE *)v4 + 36) |= 2u;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_4:
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_bucket;
    *((_BYTE *)v4 + 36) |= 1u;
  }
LABEL_5:
  if (self->_rawMessage)
  {
    v6 = v4;
    objc_msgSend(v4, "setRawMessage:");
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
  if ((has & 4) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_3;
LABEL_7:
    *(_DWORD *)(v5 + 16) = self->_datestamp;
    *(_BYTE *)(v5 + 36) |= 2u;
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  *(_DWORD *)(v5 + 32) = self->_type;
  *(_BYTE *)(v5 + 36) |= 4u;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 1) != 0)
  {
LABEL_4:
    *(double *)(v5 + 8) = self->_bucket;
    *(_BYTE *)(v5 + 36) |= 1u;
  }
LABEL_5:
  v8 = -[PETRawMessage copyWithZone:](self->_rawMessage, "copyWithZone:", a3);
  v9 = (void *)v6[3];
  v6[3] = v8;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  PETRawMessage *rawMessage;
  char v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_19;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 4) == 0 || self->_type != *((_DWORD *)v4 + 8))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 36) & 4) != 0)
  {
LABEL_19:
    v6 = 0;
    goto LABEL_20;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 2) == 0 || self->_datestamp != *((_DWORD *)v4 + 4))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 36) & 2) != 0)
  {
    goto LABEL_19;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 1) == 0 || self->_bucket != *((double *)v4 + 1))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 36) & 1) != 0)
  {
    goto LABEL_19;
  }
  rawMessage = self->_rawMessage;
  if ((unint64_t)rawMessage | *((_QWORD *)v4 + 3))
    v6 = -[PETRawMessage isEqual:](rawMessage, "isEqual:");
  else
    v6 = 1;
LABEL_20:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  double bucket;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;

  if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_9:
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_4;
LABEL_10:
    v9 = 0;
    return v4 ^ v3 ^ v9 ^ -[PETRawMessage hash](self->_rawMessage, "hash");
  }
  v3 = 2654435761 * self->_type;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_9;
LABEL_3:
  v4 = 2654435761 * self->_datestamp;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_10;
LABEL_4:
  bucket = self->_bucket;
  v6 = -bucket;
  if (bucket >= 0.0)
    v6 = self->_bucket;
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
  return v4 ^ v3 ^ v9 ^ -[PETRawMessage hash](self->_rawMessage, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  _QWORD *v5;
  char v6;
  PETRawMessage *rawMessage;
  uint64_t v8;
  _QWORD *v9;

  v4 = a3;
  v5 = v4;
  v6 = *((_BYTE *)v4 + 36);
  if ((v6 & 4) != 0)
  {
    self->_type = *((_DWORD *)v4 + 8);
    *(_BYTE *)&self->_has |= 4u;
    v6 = *((_BYTE *)v4 + 36);
    if ((v6 & 2) == 0)
    {
LABEL_3:
      if ((v6 & 1) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*((_BYTE *)v4 + 36) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_datestamp = *((_DWORD *)v4 + 4);
  *(_BYTE *)&self->_has |= 2u;
  if ((*((_BYTE *)v4 + 36) & 1) != 0)
  {
LABEL_4:
    self->_bucket = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
LABEL_5:
  rawMessage = self->_rawMessage;
  v8 = v5[3];
  if (rawMessage)
  {
    if (v8)
    {
      v9 = v5;
      -[PETRawMessage mergeFrom:](rawMessage, "mergeFrom:");
LABEL_13:
      v5 = v9;
    }
  }
  else if (v8)
  {
    v9 = v5;
    -[PETAggregationKey setRawMessage:](self, "setRawMessage:");
    goto LABEL_13;
  }

}

- (unsigned)datestamp
{
  return self->_datestamp;
}

- (double)bucket
{
  return self->_bucket;
}

@end
