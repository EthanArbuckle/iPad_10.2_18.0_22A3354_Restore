@implementation PPM2TopicsScoredForMapping

- (BOOL)hasBundleId
{
  return self->_bundleId != 0;
}

- (BOOL)hasMappingId
{
  return self->_mappingId != 0;
}

- (void)setResultSizeLog10:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_resultSizeLog10 = a3;
}

- (void)setHasResultSizeLog10:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasResultSizeLog10
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setTimeLimited:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_timeLimited = a3;
}

- (void)setHasTimeLimited:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasTimeLimited
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setExclusionSpec:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_exclusionSpec = a3;
}

- (void)setHasExclusionSpec:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasExclusionSpec
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setError:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_error = a3;
}

- (void)setHasError:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasError
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setTimeSpec:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_timeSpec = a3;
}

- (void)setHasTimeSpec:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasTimeSpec
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setLimitHit:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_limitHit = a3;
}

- (void)setHasLimitHit:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasLimitHit
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (BOOL)hasActiveTreatments
{
  return self->_activeTreatments != 0;
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
  v8.super_class = (Class)PPM2TopicsScoredForMapping;
  -[PPM2TopicsScoredForMapping description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPM2TopicsScoredForMapping dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *bundleId;
  NSString *mappingId;
  char has;
  void *v8;
  NSString *activeTreatments;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  bundleId = self->_bundleId;
  if (bundleId)
    objc_msgSend(v3, "setObject:forKey:", bundleId, CFSTR("bundleId"));
  mappingId = self->_mappingId;
  if (mappingId)
    objc_msgSend(v4, "setObject:forKey:", mappingId, CFSTR("mappingId"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_resultSizeLog10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("resultSizeLog10"));

    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_7:
      if ((has & 4) == 0)
        goto LABEL_8;
      goto LABEL_17;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_timeLimited);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("timeLimited"));

  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 2) == 0)
      goto LABEL_9;
    goto LABEL_18;
  }
LABEL_17:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_exclusionSpec);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("exclusionSpec"));

  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_9:
    if ((has & 0x20) == 0)
      goto LABEL_10;
    goto LABEL_19;
  }
LABEL_18:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_error);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("error"));

  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_10:
    if ((has & 8) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_19:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_timeSpec);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("timeSpec"));

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_11:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_limitHit);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("limitHit"));

  }
LABEL_12:
  activeTreatments = self->_activeTreatments;
  if (activeTreatments)
    objc_msgSend(v4, "setObject:forKey:", activeTreatments, CFSTR("activeTreatments"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return PPM2TopicsScoredForMappingReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_bundleId)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_mappingId)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v6;
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_7:
      if ((has & 4) == 0)
        goto LABEL_8;
      goto LABEL_17;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteBOOLField();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 2) == 0)
      goto LABEL_9;
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteBOOLField();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_9:
    if ((has & 0x20) == 0)
      goto LABEL_10;
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteBOOLField();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_10:
    if ((has & 8) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_19:
  PBDataWriterWriteBOOLField();
  v4 = v6;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_11:
    PBDataWriterWriteBOOLField();
    v4 = v6;
  }
LABEL_12:
  if (self->_activeTreatments)
  {
    PBDataWriterWriteStringField();
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
  if (self->_bundleId)
  {
    objc_msgSend(v4, "setBundleId:");
    v4 = v6;
  }
  if (self->_mappingId)
  {
    objc_msgSend(v6, "setMappingId:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_DWORD *)v4 + 8) = self->_resultSizeLog10;
    *((_BYTE *)v4 + 44) |= 1u;
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_7:
      if ((has & 4) == 0)
        goto LABEL_8;
      goto LABEL_17;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_7;
  }
  *((_BYTE *)v4 + 39) = self->_timeLimited;
  *((_BYTE *)v4 + 44) |= 0x10u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 2) == 0)
      goto LABEL_9;
    goto LABEL_18;
  }
LABEL_17:
  *((_BYTE *)v4 + 37) = self->_exclusionSpec;
  *((_BYTE *)v4 + 44) |= 4u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_9:
    if ((has & 0x20) == 0)
      goto LABEL_10;
    goto LABEL_19;
  }
LABEL_18:
  *((_BYTE *)v4 + 36) = self->_error;
  *((_BYTE *)v4 + 44) |= 2u;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_10:
    if ((has & 8) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_19:
  *((_BYTE *)v4 + 40) = self->_timeSpec;
  *((_BYTE *)v4 + 44) |= 0x20u;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_11:
    *((_BYTE *)v4 + 38) = self->_limitHit;
    *((_BYTE *)v4 + 44) |= 8u;
  }
LABEL_12:
  if (self->_activeTreatments)
  {
    objc_msgSend(v6, "setActiveTreatments:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  char has;
  uint64_t v11;
  void *v12;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_bundleId, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  v8 = -[NSString copyWithZone:](self->_mappingId, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_DWORD *)(v5 + 32) = self->_resultSizeLog10;
    *(_BYTE *)(v5 + 44) |= 1u;
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *(_BYTE *)(v5 + 39) = self->_timeLimited;
  *(_BYTE *)(v5 + 44) |= 0x10u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 2) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  *(_BYTE *)(v5 + 37) = self->_exclusionSpec;
  *(_BYTE *)(v5 + 44) |= 4u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0)
      goto LABEL_6;
LABEL_13:
    *(_BYTE *)(v5 + 40) = self->_timeSpec;
    *(_BYTE *)(v5 + 44) |= 0x20u;
    if ((*(_BYTE *)&self->_has & 8) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_12:
  *(_BYTE *)(v5 + 36) = self->_error;
  *(_BYTE *)(v5 + 44) |= 2u;
  has = (char)self->_has;
  if ((has & 0x20) != 0)
    goto LABEL_13;
LABEL_6:
  if ((has & 8) != 0)
  {
LABEL_7:
    *(_BYTE *)(v5 + 38) = self->_limitHit;
    *(_BYTE *)(v5 + 44) |= 8u;
  }
LABEL_8:
  v11 = -[NSString copyWithZone:](self->_activeTreatments, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v11;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *bundleId;
  NSString *mappingId;
  char v7;
  NSString *activeTreatments;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_47;
  bundleId = self->_bundleId;
  if ((unint64_t)bundleId | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](bundleId, "isEqual:"))
      goto LABEL_47;
  }
  mappingId = self->_mappingId;
  if ((unint64_t)mappingId | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](mappingId, "isEqual:"))
      goto LABEL_47;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 1) == 0 || self->_resultSizeLog10 != *((_DWORD *)v4 + 8))
      goto LABEL_47;
  }
  else if ((*((_BYTE *)v4 + 44) & 1) != 0)
  {
    goto LABEL_47;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 0x10) == 0)
      goto LABEL_47;
    if (self->_timeLimited)
    {
      if (!*((_BYTE *)v4 + 39))
        goto LABEL_47;
    }
    else if (*((_BYTE *)v4 + 39))
    {
      goto LABEL_47;
    }
  }
  else if ((*((_BYTE *)v4 + 44) & 0x10) != 0)
  {
    goto LABEL_47;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 4) == 0)
      goto LABEL_47;
    if (self->_exclusionSpec)
    {
      if (!*((_BYTE *)v4 + 37))
        goto LABEL_47;
    }
    else if (*((_BYTE *)v4 + 37))
    {
      goto LABEL_47;
    }
  }
  else if ((*((_BYTE *)v4 + 44) & 4) != 0)
  {
    goto LABEL_47;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 2) == 0)
      goto LABEL_47;
    if (self->_error)
    {
      if (!*((_BYTE *)v4 + 36))
        goto LABEL_47;
    }
    else if (*((_BYTE *)v4 + 36))
    {
      goto LABEL_47;
    }
  }
  else if ((*((_BYTE *)v4 + 44) & 2) != 0)
  {
    goto LABEL_47;
  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 0x20) == 0)
      goto LABEL_47;
    if (self->_timeSpec)
    {
      if (!*((_BYTE *)v4 + 40))
        goto LABEL_47;
    }
    else if (*((_BYTE *)v4 + 40))
    {
      goto LABEL_47;
    }
  }
  else if ((*((_BYTE *)v4 + 44) & 0x20) != 0)
  {
    goto LABEL_47;
  }
  if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    if ((*((_BYTE *)v4 + 44) & 8) == 0)
      goto LABEL_53;
LABEL_47:
    v7 = 0;
    goto LABEL_48;
  }
  if ((*((_BYTE *)v4 + 44) & 8) == 0)
    goto LABEL_47;
  if (!self->_limitHit)
  {
    if (!*((_BYTE *)v4 + 38))
      goto LABEL_53;
    goto LABEL_47;
  }
  if (!*((_BYTE *)v4 + 38))
    goto LABEL_47;
LABEL_53:
  activeTreatments = self->_activeTreatments;
  if ((unint64_t)activeTreatments | *((_QWORD *)v4 + 1))
    v7 = -[NSString isEqual:](activeTreatments, "isEqual:");
  else
    v7 = 1;
LABEL_48:

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = -[NSString hash](self->_bundleId, "hash");
  v4 = -[NSString hash](self->_mappingId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v5 = 2654435761 * self->_resultSizeLog10;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
    {
LABEL_3:
      v6 = 2654435761 * self->_timeLimited;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else
  {
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_3;
  }
  v6 = 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_4:
    v7 = 2654435761 * self->_exclusionSpec;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  v7 = 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_5:
    v8 = 2654435761 * self->_error;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
      goto LABEL_6;
LABEL_12:
    v9 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_7;
LABEL_13:
    v10 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ -[NSString hash](self->_activeTreatments, "hash");
  }
LABEL_11:
  v8 = 0;
  if ((*(_BYTE *)&self->_has & 0x20) == 0)
    goto LABEL_12;
LABEL_6:
  v9 = 2654435761 * self->_timeSpec;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_13;
LABEL_7:
  v10 = 2654435761 * self->_limitHit;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ -[NSString hash](self->_activeTreatments, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  v6 = v4;
  if (*((_QWORD *)v4 + 2))
  {
    -[PPM2TopicsScoredForMapping setBundleId:](self, "setBundleId:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[PPM2TopicsScoredForMapping setMappingId:](self, "setMappingId:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 44);
  if ((v5 & 1) != 0)
  {
    self->_resultSizeLog10 = *((_DWORD *)v4 + 8);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)v4 + 44);
    if ((v5 & 0x10) == 0)
    {
LABEL_7:
      if ((v5 & 4) == 0)
        goto LABEL_8;
      goto LABEL_17;
    }
  }
  else if ((*((_BYTE *)v4 + 44) & 0x10) == 0)
  {
    goto LABEL_7;
  }
  self->_timeLimited = *((_BYTE *)v4 + 39);
  *(_BYTE *)&self->_has |= 0x10u;
  v5 = *((_BYTE *)v4 + 44);
  if ((v5 & 4) == 0)
  {
LABEL_8:
    if ((v5 & 2) == 0)
      goto LABEL_9;
    goto LABEL_18;
  }
LABEL_17:
  self->_exclusionSpec = *((_BYTE *)v4 + 37);
  *(_BYTE *)&self->_has |= 4u;
  v5 = *((_BYTE *)v4 + 44);
  if ((v5 & 2) == 0)
  {
LABEL_9:
    if ((v5 & 0x20) == 0)
      goto LABEL_10;
    goto LABEL_19;
  }
LABEL_18:
  self->_error = *((_BYTE *)v4 + 36);
  *(_BYTE *)&self->_has |= 2u;
  v5 = *((_BYTE *)v4 + 44);
  if ((v5 & 0x20) == 0)
  {
LABEL_10:
    if ((v5 & 8) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_19:
  self->_timeSpec = *((_BYTE *)v4 + 40);
  *(_BYTE *)&self->_has |= 0x20u;
  if ((*((_BYTE *)v4 + 44) & 8) != 0)
  {
LABEL_11:
    self->_limitHit = *((_BYTE *)v4 + 38);
    *(_BYTE *)&self->_has |= 8u;
  }
LABEL_12:
  if (*((_QWORD *)v4 + 1))
  {
    -[PPM2TopicsScoredForMapping setActiveTreatments:](self, "setActiveTreatments:");
    v4 = v6;
  }

}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
  objc_storeStrong((id *)&self->_bundleId, a3);
}

- (NSString)mappingId
{
  return self->_mappingId;
}

- (void)setMappingId:(id)a3
{
  objc_storeStrong((id *)&self->_mappingId, a3);
}

- (unsigned)resultSizeLog10
{
  return self->_resultSizeLog10;
}

- (BOOL)timeLimited
{
  return self->_timeLimited;
}

- (BOOL)exclusionSpec
{
  return self->_exclusionSpec;
}

- (BOOL)error
{
  return self->_error;
}

- (BOOL)timeSpec
{
  return self->_timeSpec;
}

- (BOOL)limitHit
{
  return self->_limitHit;
}

- (NSString)activeTreatments
{
  return self->_activeTreatments;
}

- (void)setActiveTreatments:(id)a3
{
  objc_storeStrong((id *)&self->_activeTreatments, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mappingId, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_activeTreatments, 0);
}

@end
