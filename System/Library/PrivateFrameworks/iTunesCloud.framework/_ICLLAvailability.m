@implementation _ICLLAvailability

- (void)dealloc
{
  objc_super v3;

  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)_ICLLAvailability;
  -[_ICLLAvailability dealloc](&v3, sel_dealloc);
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
  v8.super_class = (Class)_ICLLAvailability;
  -[_ICLLAvailability description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ICLLAvailability dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PBRepeatedInt32NSArray();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("repeatMode"));

  PBRepeatedInt32NSArray();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("shuffleMode"));

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_autoPlay);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("autoPlay"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _ICLLAvailabilityReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  id v7;

  v4 = a3;
  v7 = v4;
  if (self->_repeatModes.count)
  {
    v5 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      v4 = v7;
      ++v5;
    }
    while (v5 < self->_repeatModes.count);
  }
  if (self->_shuffleModes.count)
  {
    v6 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      v4 = v7;
      ++v6;
    }
    while (v6 < self->_shuffleModes.count);
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v7;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _BYTE *v4;

  v4 = (_BYTE *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[56] = self->_autoPlay;
    v4[60] |= 1u;
  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    || !PBRepeatedInt32IsEqual()
    || !PBRepeatedInt32IsEqual())
  {
    goto LABEL_6;
  }
  v5 = (v4[60] & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((v4[60] & 1) == 0)
    {
LABEL_6:
      v5 = 0;
      goto LABEL_7;
    }
    if (self->_autoPlay)
    {
      if (!v4[56])
        goto LABEL_6;
    }
    else if (v4[56])
    {
      goto LABEL_6;
    }
    v5 = 1;
  }
LABEL_7:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = PBRepeatedInt32Hash();
  v4 = PBRepeatedInt32Hash();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v5 = 2654435761 * self->_autoPlay;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5;
}

@end
