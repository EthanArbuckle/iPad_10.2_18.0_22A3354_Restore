@implementation _ICLLPlaybackControlSettings

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)_ICLLPlaybackControlSettings;
  -[_ICLLPlaybackControlSettings description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ICLLPlaybackControlSettings dictionaryRepresentation](self, "dictionaryRepresentation");
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
  _ICLLAvailability *availability;
  void *v8;
  _ICLLAutoPlaySource *autoPlay;
  void *v10;
  _ICLLRadioSource *radio;
  void *v12;
  _ICLLNoGenerationSource *noGeneration;
  void *v14;
  void *v15;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_shuffleMode);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("shuffleMode"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_repeatMode);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("repeatMode"));

  }
  availability = self->_availability;
  if (availability)
  {
    -[_ICLLAvailability dictionaryRepresentation](availability, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("availability"));

  }
  autoPlay = self->_autoPlay;
  if (autoPlay)
  {
    -[_ICLLAutoPlaySource dictionaryRepresentation](autoPlay, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("autoPlay"));

  }
  radio = self->_radio;
  if (radio)
  {
    -[_ICLLRadioSource dictionaryRepresentation](radio, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("radio"));

  }
  noGeneration = self->_noGeneration;
  if (noGeneration)
  {
    -[_ICLLNoGenerationSource dictionaryRepresentation](noGeneration, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("noGeneration"));

  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_trackGenerationSource);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("trackGenerationSource"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _ICLLPlaybackControlSettingsReadFrom((uint64_t)self, (uint64_t)a3);
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
    PBDataWriterWriteInt32Field();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }
  if (self->_availability)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_autoPlay)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_radio)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_noGeneration)
  {
    PBDataWriterWriteSubmessage();
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
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_3;
LABEL_7:
    *(_DWORD *)(v5 + 44) = self->_shuffleMode;
    *(_BYTE *)(v5 + 52) |= 2u;
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  *(_DWORD *)(v5 + 48) = self->_trackGenerationSource;
  *(_BYTE *)(v5 + 52) |= 4u;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 1) != 0)
  {
LABEL_4:
    *(_DWORD *)(v5 + 40) = self->_repeatMode;
    *(_BYTE *)(v5 + 52) |= 1u;
  }
LABEL_5:
  v8 = -[_ICLLAvailability copyWithZone:](self->_availability, "copyWithZone:", a3);
  v9 = (void *)v6[2];
  v6[2] = v8;

  v10 = -[_ICLLAutoPlaySource copyWithZone:](self->_autoPlay, "copyWithZone:", a3);
  v11 = (void *)v6[1];
  v6[1] = v10;

  v12 = -[_ICLLRadioSource copyWithZone:](self->_radio, "copyWithZone:", a3);
  v13 = (void *)v6[4];
  v6[4] = v12;

  v14 = -[_ICLLNoGenerationSource copyWithZone:](self->_noGeneration, "copyWithZone:", a3);
  v15 = (void *)v6[3];
  v6[3] = v14;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _ICLLAvailability *availability;
  _ICLLAutoPlaySource *autoPlay;
  _ICLLRadioSource *radio;
  _ICLLNoGenerationSource *noGeneration;
  char v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_25;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 4) == 0 || self->_trackGenerationSource != *((_DWORD *)v4 + 12))
      goto LABEL_25;
  }
  else if ((*((_BYTE *)v4 + 52) & 4) != 0)
  {
LABEL_25:
    v9 = 0;
    goto LABEL_26;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 2) == 0 || self->_shuffleMode != *((_DWORD *)v4 + 11))
      goto LABEL_25;
  }
  else if ((*((_BYTE *)v4 + 52) & 2) != 0)
  {
    goto LABEL_25;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 1) == 0 || self->_repeatMode != *((_DWORD *)v4 + 10))
      goto LABEL_25;
  }
  else if ((*((_BYTE *)v4 + 52) & 1) != 0)
  {
    goto LABEL_25;
  }
  availability = self->_availability;
  if ((unint64_t)availability | *((_QWORD *)v4 + 2) && !-[_ICLLAvailability isEqual:](availability, "isEqual:"))
    goto LABEL_25;
  autoPlay = self->_autoPlay;
  if ((unint64_t)autoPlay | *((_QWORD *)v4 + 1))
  {
    if (!-[_ICLLAutoPlaySource isEqual:](autoPlay, "isEqual:"))
      goto LABEL_25;
  }
  radio = self->_radio;
  if ((unint64_t)radio | *((_QWORD *)v4 + 4))
  {
    if (!-[_ICLLRadioSource isEqual:](radio, "isEqual:"))
      goto LABEL_25;
  }
  noGeneration = self->_noGeneration;
  if ((unint64_t)noGeneration | *((_QWORD *)v4 + 3))
    v9 = -[_ICLLNoGenerationSource isEqual:](noGeneration, "isEqual:");
  else
    v9 = 1;
LABEL_26:

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;

  if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_6:
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_4;
LABEL_7:
    v5 = 0;
    goto LABEL_8;
  }
  v3 = 2654435761 * self->_trackGenerationSource;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v4 = 2654435761 * self->_shuffleMode;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_7;
LABEL_4:
  v5 = 2654435761 * self->_repeatMode;
LABEL_8:
  v6 = v4 ^ v3 ^ v5 ^ -[_ICLLAvailability hash](self->_availability, "hash");
  v7 = -[_ICLLAutoPlaySource hash](self->_autoPlay, "hash");
  v8 = v6 ^ v7 ^ -[_ICLLRadioSource hash](self->_radio, "hash");
  return v8 ^ -[_ICLLNoGenerationSource hash](self->_noGeneration, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_radio, 0);
  objc_storeStrong((id *)&self->_noGeneration, 0);
  objc_storeStrong((id *)&self->_availability, 0);
  objc_storeStrong((id *)&self->_autoPlay, 0);
}

- (void)clearOneofValuesForTrackGenerationSource
{
  void *v2;
  void *v3;
  void *v4;

  if (a1)
  {
    *(_BYTE *)(a1 + 52) &= ~4u;
    *(_DWORD *)(a1 + 48) = 0;
    v2 = *(void **)(a1 + 8);
    *(_QWORD *)(a1 + 8) = 0;

    v3 = *(void **)(a1 + 32);
    *(_QWORD *)(a1 + 32) = 0;

    v4 = *(void **)(a1 + 24);
    *(_QWORD *)(a1 + 24) = 0;

  }
}

@end
