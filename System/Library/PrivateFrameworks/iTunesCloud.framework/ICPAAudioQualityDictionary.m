@implementation ICPAAudioQualityDictionary

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)ICPAAudioQualityDictionary;
  -[ICPAAudioQualityDictionary description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICPAAudioQualityDictionary dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSString *channelLayoutDescription;
  char v8;
  void *v9;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_bitRate);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("bitRate"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_bitDepth);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("bitDepth"));

  }
  channelLayoutDescription = self->_channelLayoutDescription;
  if (channelLayoutDescription)
    objc_msgSend(v3, "setObject:forKey:", channelLayoutDescription, CFSTR("channelLayoutDescription"));
  v8 = (char)self->_has;
  if ((v8 & 8) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_9;
LABEL_13:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_sampleRate);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("sampleRate"));

    if ((*(_BYTE *)&self->_has & 0x10) == 0)
      return v3;
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_codec);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("codec"));

  v8 = (char)self->_has;
  if ((v8 & 4) != 0)
    goto LABEL_13;
LABEL_9:
  if ((v8 & 0x10) != 0)
  {
LABEL_10:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isSpatialized);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("isSpatialized"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ICPAAudioQualityDictionaryReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  char v5;
  id v6;

  v6 = a3;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
    PBDataWriterWriteInt64Field();
  if (self->_channelLayoutDescription)
    PBDataWriterWriteStringField();
  v5 = (char)self->_has;
  if ((v5 & 8) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_9;
LABEL_13:
    PBDataWriterWriteInt64Field();
    if ((*(_BYTE *)&self->_has & 0x10) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
  PBDataWriterWriteUint32Field();
  v5 = (char)self->_has;
  if ((v5 & 4) != 0)
    goto LABEL_13;
LABEL_9:
  if ((v5 & 0x10) != 0)
LABEL_10:
    PBDataWriterWriteBOOLField();
LABEL_11:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char has;
  uint64_t v8;
  void *v9;
  char v10;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_bitRate;
    *(_BYTE *)(v5 + 48) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_bitDepth;
    *(_BYTE *)(v5 + 48) |= 1u;
  }
  v8 = -[NSString copyWithZone:](self->_channelLayoutDescription, "copyWithZone:", a3);
  v9 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v8;

  v10 = (char)self->_has;
  if ((v10 & 8) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_7;
LABEL_11:
    *(_QWORD *)(v6 + 24) = self->_sampleRate;
    *(_BYTE *)(v6 + 48) |= 4u;
    if ((*(_BYTE *)&self->_has & 0x10) == 0)
      return (id)v6;
    goto LABEL_8;
  }
  *(_DWORD *)(v6 + 40) = self->_codec;
  *(_BYTE *)(v6 + 48) |= 8u;
  v10 = (char)self->_has;
  if ((v10 & 4) != 0)
    goto LABEL_11;
LABEL_7:
  if ((v10 & 0x10) != 0)
  {
LABEL_8:
    *(_BYTE *)(v6 + 44) = self->_isSpatialized;
    *(_BYTE *)(v6 + 48) |= 0x10u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char has;
  char v6;
  NSString *channelLayoutDescription;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_27;
  has = (char)self->_has;
  v6 = *((_BYTE *)v4 + 48);
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 2) == 0 || self->_bitRate != *((_QWORD *)v4 + 2))
      goto LABEL_27;
  }
  else if ((*((_BYTE *)v4 + 48) & 2) != 0)
  {
    goto LABEL_27;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) == 0 || self->_bitDepth != *((_QWORD *)v4 + 1))
      goto LABEL_27;
  }
  else if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
    goto LABEL_27;
  }
  channelLayoutDescription = self->_channelLayoutDescription;
  if ((unint64_t)channelLayoutDescription | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](channelLayoutDescription, "isEqual:"))
      goto LABEL_27;
    has = (char)self->_has;
    v6 = *((_BYTE *)v4 + 48);
  }
  if ((has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_codec != *((_DWORD *)v4 + 10))
      goto LABEL_27;
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_27;
  }
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_sampleRate != *((_QWORD *)v4 + 3))
      goto LABEL_27;
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_27;
  }
  v8 = (v6 & 0x10) == 0;
  if ((has & 0x10) != 0)
  {
    if ((v6 & 0x10) != 0)
    {
      if (self->_isSpatialized)
      {
        if (!*((_BYTE *)v4 + 44))
          goto LABEL_27;
      }
      else if (*((_BYTE *)v4 + 44))
      {
        goto LABEL_27;
      }
      v8 = 1;
      goto LABEL_28;
    }
LABEL_27:
    v8 = 0;
  }
LABEL_28:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  NSUInteger v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v3 = 2654435761 * self->_bitRate;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_bitDepth;
      goto LABEL_6;
    }
  }
  v4 = 0;
LABEL_6:
  v5 = -[NSString hash](self->_channelLayoutDescription, "hash");
  if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    v6 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_8;
LABEL_11:
    v7 = 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_9;
LABEL_12:
    v8 = 0;
    return v4 ^ v3 ^ v6 ^ v7 ^ v8 ^ v5;
  }
  v6 = 2654435761 * self->_codec;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_11;
LABEL_8:
  v7 = 2654435761 * self->_sampleRate;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    goto LABEL_12;
LABEL_9:
  v8 = 2654435761 * self->_isSpatialized;
  return v4 ^ v3 ^ v6 ^ v7 ^ v8 ^ v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_channelLayoutDescription, 0);
}

- (void)setChannelLayoutDescription:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 32), a2);
}

@end
