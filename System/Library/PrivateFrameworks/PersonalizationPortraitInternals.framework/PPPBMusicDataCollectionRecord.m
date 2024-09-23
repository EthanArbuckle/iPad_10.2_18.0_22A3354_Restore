@implementation PPPBMusicDataCollectionRecord

- (int)type
{
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    return self->_type;
  else
    return 0;
}

- (void)setType:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasType
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (BOOL)hasLabel
{
  return self->_label != 0;
}

- (void)setSecondsFromUnixEpoch:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_secondsFromUnixEpoch = a3;
}

- (void)setHasSecondsFromUnixEpoch:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSecondsFromUnixEpoch
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setQuantizedScore:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_quantizedScore = a3;
}

- (void)setHasQuantizedScore:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasQuantizedScore
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasSourceBundleId
{
  return self->_sourceBundleId != 0;
}

- (BOOL)hasMediaId
{
  return self->_mediaId != 0;
}

- (void)setMediaType:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_mediaType = a3;
}

- (void)setHasMediaType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasMediaType
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setAlgorithm:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_algorithm = a3;
}

- (void)setHasAlgorithm:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasAlgorithm
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
  v8.super_class = (Class)PPPBMusicDataCollectionRecord;
  -[PPPBMusicDataCollectionRecord description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPPBMusicDataCollectionRecord dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *label;
  char has;
  void *v7;
  void *v8;
  NSString *sourceBundleId;
  NSString *mediaId;
  char v11;
  void *v12;
  void *v13;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_type);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("type"));

  }
  label = self->_label;
  if (label)
    objc_msgSend(v3, "setObject:forKey:", label, CFSTR("label"));
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_secondsFromUnixEpoch);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("secondsFromUnixEpoch"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_quantizedScore);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("quantizedScore"));

  }
  sourceBundleId = self->_sourceBundleId;
  if (sourceBundleId)
    objc_msgSend(v3, "setObject:forKey:", sourceBundleId, CFSTR("sourceBundleId"));
  mediaId = self->_mediaId;
  if (mediaId)
    objc_msgSend(v3, "setObject:forKey:", mediaId, CFSTR("mediaId"));
  v11 = (char)self->_has;
  if ((v11 & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_mediaType);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("mediaType"));

    v11 = (char)self->_has;
  }
  if ((v11 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_algorithm);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("algorithm"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PPPBMusicDataCollectionRecordReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  char v5;
  id v6;

  v6 = a3;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_label)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
    PBDataWriterWriteDoubleField();
  if (self->_sourceBundleId)
    PBDataWriterWriteStringField();
  if (self->_mediaId)
    PBDataWriterWriteStringField();
  v5 = (char)self->_has;
  if ((v5 & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    v5 = (char)self->_has;
  }
  if ((v5 & 4) != 0)
    PBDataWriterWriteInt32Field();

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char has;
  char v6;
  _DWORD *v7;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    v4[16] = self->_type;
    *((_BYTE *)v4 + 68) |= 0x10u;
  }
  v7 = v4;
  if (self->_label)
  {
    objc_msgSend(v4, "setLabel:");
    v4 = v7;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_QWORD *)v4 + 2) = *(_QWORD *)&self->_secondsFromUnixEpoch;
    *((_BYTE *)v4 + 68) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_quantizedScore;
    *((_BYTE *)v4 + 68) |= 1u;
  }
  if (self->_sourceBundleId)
  {
    objc_msgSend(v7, "setSourceBundleId:");
    v4 = v7;
  }
  if (self->_mediaId)
  {
    objc_msgSend(v7, "setMediaId:");
    v4 = v7;
  }
  v6 = (char)self->_has;
  if ((v6 & 8) != 0)
  {
    v4[12] = self->_mediaType;
    *((_BYTE *)v4 + 68) |= 8u;
    v6 = (char)self->_has;
  }
  if ((v6 & 4) != 0)
  {
    v4[6] = self->_algorithm;
    *((_BYTE *)v4 + 68) |= 4u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  char has;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  char v14;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 64) = self->_type;
    *(_BYTE *)(v5 + 68) |= 0x10u;
  }
  v7 = -[NSString copyWithZone:](self->_label, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v7;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(double *)(v6 + 16) = self->_secondsFromUnixEpoch;
    *(_BYTE *)(v6 + 68) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(double *)(v6 + 8) = self->_quantizedScore;
    *(_BYTE *)(v6 + 68) |= 1u;
  }
  v10 = -[NSString copyWithZone:](self->_sourceBundleId, "copyWithZone:", a3);
  v11 = *(void **)(v6 + 56);
  *(_QWORD *)(v6 + 56) = v10;

  v12 = -[NSString copyWithZone:](self->_mediaId, "copyWithZone:", a3);
  v13 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v12;

  v14 = (char)self->_has;
  if ((v14 & 8) != 0)
  {
    *(_DWORD *)(v6 + 48) = self->_mediaType;
    *(_BYTE *)(v6 + 68) |= 8u;
    v14 = (char)self->_has;
  }
  if ((v14 & 4) != 0)
  {
    *(_DWORD *)(v6 + 24) = self->_algorithm;
    *(_BYTE *)(v6 + 68) |= 4u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char has;
  char v6;
  NSString *label;
  NSString *sourceBundleId;
  NSString *mediaId;
  BOOL v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_33;
  has = (char)self->_has;
  v6 = *((_BYTE *)v4 + 68);
  if ((has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 0x10) == 0 || self->_type != *((_DWORD *)v4 + 16))
      goto LABEL_33;
  }
  else if ((*((_BYTE *)v4 + 68) & 0x10) != 0)
  {
    goto LABEL_33;
  }
  label = self->_label;
  if ((unint64_t)label | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](label, "isEqual:"))
    {
LABEL_33:
      v10 = 0;
      goto LABEL_34;
    }
    has = (char)self->_has;
    v6 = *((_BYTE *)v4 + 68);
  }
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_secondsFromUnixEpoch != *((double *)v4 + 2))
      goto LABEL_33;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_33;
  }
  if ((has & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_quantizedScore != *((double *)v4 + 1))
      goto LABEL_33;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_33;
  }
  sourceBundleId = self->_sourceBundleId;
  if ((unint64_t)sourceBundleId | *((_QWORD *)v4 + 7)
    && !-[NSString isEqual:](sourceBundleId, "isEqual:"))
  {
    goto LABEL_33;
  }
  mediaId = self->_mediaId;
  if ((unint64_t)mediaId | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](mediaId, "isEqual:"))
      goto LABEL_33;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 8) == 0 || self->_mediaType != *((_DWORD *)v4 + 12))
      goto LABEL_33;
  }
  else if ((*((_BYTE *)v4 + 68) & 8) != 0)
  {
    goto LABEL_33;
  }
  v10 = (*((_BYTE *)v4 + 68) & 4) == 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 4) == 0 || self->_algorithm != *((_DWORD *)v4 + 6))
      goto LABEL_33;
    v10 = 1;
  }
LABEL_34:

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  char has;
  unint64_t v6;
  double secondsFromUnixEpoch;
  double v8;
  long double v9;
  double v10;
  unint64_t v11;
  double quantizedScore;
  double v13;
  long double v14;
  double v15;
  NSUInteger v16;
  NSUInteger v17;
  uint64_t v18;
  uint64_t v19;

  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    v3 = 2654435761 * self->_type;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_label, "hash");
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    secondsFromUnixEpoch = self->_secondsFromUnixEpoch;
    v8 = -secondsFromUnixEpoch;
    if (secondsFromUnixEpoch >= 0.0)
      v8 = self->_secondsFromUnixEpoch;
    v9 = floor(v8 + 0.5);
    v10 = (v8 - v9) * 1.84467441e19;
    v6 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
    if (v10 >= 0.0)
    {
      if (v10 > 0.0)
        v6 += (unint64_t)v10;
    }
    else
    {
      v6 -= (unint64_t)fabs(v10);
    }
  }
  else
  {
    v6 = 0;
  }
  if ((has & 1) != 0)
  {
    quantizedScore = self->_quantizedScore;
    v13 = -quantizedScore;
    if (quantizedScore >= 0.0)
      v13 = self->_quantizedScore;
    v14 = floor(v13 + 0.5);
    v15 = (v13 - v14) * 1.84467441e19;
    v11 = 2654435761u * (unint64_t)fmod(v14, 1.84467441e19);
    if (v15 >= 0.0)
    {
      if (v15 > 0.0)
        v11 += (unint64_t)v15;
    }
    else
    {
      v11 -= (unint64_t)fabs(v15);
    }
  }
  else
  {
    v11 = 0;
  }
  v16 = -[NSString hash](self->_sourceBundleId, "hash");
  v17 = -[NSString hash](self->_mediaId, "hash");
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    v18 = 2654435761 * self->_mediaType;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_22;
LABEL_24:
    v19 = 0;
    return v4 ^ v3 ^ v6 ^ v11 ^ v16 ^ v17 ^ v18 ^ v19;
  }
  v18 = 0;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_24;
LABEL_22:
  v19 = 2654435761 * self->_algorithm;
  return v4 ^ v3 ^ v6 ^ v11 ^ v16 ^ v17 ^ v18 ^ v19;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  char v6;
  id v7;

  v4 = a3;
  if ((*((_BYTE *)v4 + 68) & 0x10) != 0)
  {
    self->_type = *((_DWORD *)v4 + 16);
    *(_BYTE *)&self->_has |= 0x10u;
  }
  v7 = v4;
  if (*((_QWORD *)v4 + 4))
  {
    -[PPPBMusicDataCollectionRecord setLabel:](self, "setLabel:");
    v4 = v7;
  }
  v5 = *((_BYTE *)v4 + 68);
  if ((v5 & 2) != 0)
  {
    self->_secondsFromUnixEpoch = *((double *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)v4 + 68);
  }
  if ((v5 & 1) != 0)
  {
    self->_quantizedScore = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 7))
  {
    -[PPPBMusicDataCollectionRecord setSourceBundleId:](self, "setSourceBundleId:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 5))
  {
    -[PPPBMusicDataCollectionRecord setMediaId:](self, "setMediaId:");
    v4 = v7;
  }
  v6 = *((_BYTE *)v4 + 68);
  if ((v6 & 8) != 0)
  {
    self->_mediaType = *((_DWORD *)v4 + 12);
    *(_BYTE *)&self->_has |= 8u;
    v6 = *((_BYTE *)v4 + 68);
  }
  if ((v6 & 4) != 0)
  {
    self->_algorithm = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 4u;
  }

}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (double)secondsFromUnixEpoch
{
  return self->_secondsFromUnixEpoch;
}

- (double)quantizedScore
{
  return self->_quantizedScore;
}

- (NSString)sourceBundleId
{
  return self->_sourceBundleId;
}

- (void)setSourceBundleId:(id)a3
{
  objc_storeStrong((id *)&self->_sourceBundleId, a3);
}

- (NSString)mediaId
{
  return self->_mediaId;
}

- (void)setMediaId:(id)a3
{
  objc_storeStrong((id *)&self->_mediaId, a3);
}

- (int)mediaType
{
  return self->_mediaType;
}

- (int)algorithm
{
  return self->_algorithm;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceBundleId, 0);
  objc_storeStrong((id *)&self->_mediaId, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

+ (id)options
{
  if (options_once_4450 != -1)
    dispatch_once(&options_once_4450, &__block_literal_global_4451);
  return (id)options_sOptions_4452;
}

void __40__PPPBMusicDataCollectionRecord_options__block_invoke()
{
  void *v0;

  v0 = (void *)options_sOptions_4452;
  options_sOptions_4452 = (uint64_t)&unk_1E7E5BEC8;

}

@end
