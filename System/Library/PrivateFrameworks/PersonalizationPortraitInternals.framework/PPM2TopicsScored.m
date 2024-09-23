@implementation PPM2TopicsScored

- (BOOL)hasBundleId
{
  return self->_bundleId != 0;
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
  v8.super_class = (Class)PPM2TopicsScored;
  -[PPM2TopicsScored description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPM2TopicsScored dictionaryRepresentation](self, "dictionaryRepresentation");
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
  char has;
  void *v7;
  NSString *activeTreatments;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  bundleId = self->_bundleId;
  if (bundleId)
    objc_msgSend(v3, "setObject:forKey:", bundleId, CFSTR("bundleId"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_resultSizeLog10);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("resultSizeLog10"));

    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_5:
      if ((has & 0x20) == 0)
        goto LABEL_6;
      goto LABEL_15;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_limitHit);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("limitHit"));

  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_timeSpec);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("timeSpec"));

  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 4) == 0)
      goto LABEL_8;
    goto LABEL_17;
  }
LABEL_16:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_timeLimited);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("timeLimited"));

  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 2) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_17:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_exclusionSpec);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("exclusionSpec"));

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_9:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_error);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("error"));

  }
LABEL_10:
  activeTreatments = self->_activeTreatments;
  if (activeTreatments)
    objc_msgSend(v4, "setObject:forKey:", activeTreatments, CFSTR("activeTreatments"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return PPM2TopicsScoredReadFrom((uint64_t)self, (uint64_t)a3);
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
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v6;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_5:
      if ((has & 0x20) == 0)
        goto LABEL_6;
      goto LABEL_15;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteBOOLField();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteBOOLField();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 4) == 0)
      goto LABEL_8;
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteBOOLField();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 2) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_17:
  PBDataWriterWriteBOOLField();
  v4 = v6;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_9:
    PBDataWriterWriteBOOLField();
    v4 = v6;
  }
LABEL_10:
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
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_DWORD *)v4 + 6) = self->_resultSizeLog10;
    *((_BYTE *)v4 + 36) |= 1u;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_5:
      if ((has & 0x20) == 0)
        goto LABEL_6;
      goto LABEL_15;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_5;
  }
  *((_BYTE *)v4 + 30) = self->_limitHit;
  *((_BYTE *)v4 + 36) |= 8u;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  *((_BYTE *)v4 + 32) = self->_timeSpec;
  *((_BYTE *)v4 + 36) |= 0x20u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 4) == 0)
      goto LABEL_8;
    goto LABEL_17;
  }
LABEL_16:
  *((_BYTE *)v4 + 31) = self->_timeLimited;
  *((_BYTE *)v4 + 36) |= 0x10u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 2) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_17:
  *((_BYTE *)v4 + 29) = self->_exclusionSpec;
  *((_BYTE *)v4 + 36) |= 4u;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_9:
    *((_BYTE *)v4 + 28) = self->_error;
    *((_BYTE *)v4 + 36) |= 2u;
  }
LABEL_10:
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
  char has;
  uint64_t v9;
  void *v10;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_bundleId, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_resultSizeLog10;
    *(_BYTE *)(v5 + 36) |= 1u;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *(_BYTE *)(v5 + 30) = self->_limitHit;
  *(_BYTE *)(v5 + 36) |= 8u;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  *(_BYTE *)(v5 + 32) = self->_timeSpec;
  *(_BYTE *)(v5 + 36) |= 0x20u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 4) == 0)
      goto LABEL_6;
LABEL_13:
    *(_BYTE *)(v5 + 29) = self->_exclusionSpec;
    *(_BYTE *)(v5 + 36) |= 4u;
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_12:
  *(_BYTE *)(v5 + 31) = self->_timeLimited;
  *(_BYTE *)(v5 + 36) |= 0x10u;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_13;
LABEL_6:
  if ((has & 2) != 0)
  {
LABEL_7:
    *(_BYTE *)(v5 + 28) = self->_error;
    *(_BYTE *)(v5 + 36) |= 2u;
  }
LABEL_8:
  v9 = -[NSString copyWithZone:](self->_activeTreatments, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v9;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *bundleId;
  char v6;
  NSString *activeTreatments;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_45;
  bundleId = self->_bundleId;
  if ((unint64_t)bundleId | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](bundleId, "isEqual:"))
      goto LABEL_45;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 1) == 0 || self->_resultSizeLog10 != *((_DWORD *)v4 + 6))
      goto LABEL_45;
  }
  else if ((*((_BYTE *)v4 + 36) & 1) != 0)
  {
    goto LABEL_45;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 8) == 0)
      goto LABEL_45;
    if (self->_limitHit)
    {
      if (!*((_BYTE *)v4 + 30))
        goto LABEL_45;
    }
    else if (*((_BYTE *)v4 + 30))
    {
      goto LABEL_45;
    }
  }
  else if ((*((_BYTE *)v4 + 36) & 8) != 0)
  {
    goto LABEL_45;
  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 0x20) == 0)
      goto LABEL_45;
    if (self->_timeSpec)
    {
      if (!*((_BYTE *)v4 + 32))
        goto LABEL_45;
    }
    else if (*((_BYTE *)v4 + 32))
    {
      goto LABEL_45;
    }
  }
  else if ((*((_BYTE *)v4 + 36) & 0x20) != 0)
  {
    goto LABEL_45;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 0x10) == 0)
      goto LABEL_45;
    if (self->_timeLimited)
    {
      if (!*((_BYTE *)v4 + 31))
        goto LABEL_45;
    }
    else if (*((_BYTE *)v4 + 31))
    {
      goto LABEL_45;
    }
  }
  else if ((*((_BYTE *)v4 + 36) & 0x10) != 0)
  {
    goto LABEL_45;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 4) == 0)
      goto LABEL_45;
    if (self->_exclusionSpec)
    {
      if (!*((_BYTE *)v4 + 29))
        goto LABEL_45;
    }
    else if (*((_BYTE *)v4 + 29))
    {
      goto LABEL_45;
    }
  }
  else if ((*((_BYTE *)v4 + 36) & 4) != 0)
  {
    goto LABEL_45;
  }
  if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    if ((*((_BYTE *)v4 + 36) & 2) == 0)
      goto LABEL_51;
LABEL_45:
    v6 = 0;
    goto LABEL_46;
  }
  if ((*((_BYTE *)v4 + 36) & 2) == 0)
    goto LABEL_45;
  if (!self->_error)
  {
    if (!*((_BYTE *)v4 + 28))
      goto LABEL_51;
    goto LABEL_45;
  }
  if (!*((_BYTE *)v4 + 28))
    goto LABEL_45;
LABEL_51:
  activeTreatments = self->_activeTreatments;
  if ((unint64_t)activeTreatments | *((_QWORD *)v4 + 1))
    v6 = -[NSString isEqual:](activeTreatments, "isEqual:");
  else
    v6 = 1;
LABEL_46:

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3 = -[NSString hash](self->_bundleId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = 2654435761 * self->_resultSizeLog10;
    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
LABEL_3:
      v5 = 2654435761 * self->_limitHit;
      if ((*(_BYTE *)&self->_has & 0x20) != 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_3;
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
LABEL_4:
    v6 = 2654435761 * self->_timeSpec;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  v6 = 0;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_5:
    v7 = 2654435761 * self->_timeLimited;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_6;
LABEL_12:
    v8 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_7;
LABEL_13:
    v9 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ -[NSString hash](self->_activeTreatments, "hash");
  }
LABEL_11:
  v7 = 0;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_12;
LABEL_6:
  v8 = 2654435761 * self->_exclusionSpec;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_13;
LABEL_7:
  v9 = 2654435761 * self->_error;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ -[NSString hash](self->_activeTreatments, "hash");
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
    -[PPM2TopicsScored setBundleId:](self, "setBundleId:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 36);
  if ((v5 & 1) != 0)
  {
    self->_resultSizeLog10 = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)v4 + 36);
    if ((v5 & 8) == 0)
    {
LABEL_5:
      if ((v5 & 0x20) == 0)
        goto LABEL_6;
      goto LABEL_15;
    }
  }
  else if ((*((_BYTE *)v4 + 36) & 8) == 0)
  {
    goto LABEL_5;
  }
  self->_limitHit = *((_BYTE *)v4 + 30);
  *(_BYTE *)&self->_has |= 8u;
  v5 = *((_BYTE *)v4 + 36);
  if ((v5 & 0x20) == 0)
  {
LABEL_6:
    if ((v5 & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  self->_timeSpec = *((_BYTE *)v4 + 32);
  *(_BYTE *)&self->_has |= 0x20u;
  v5 = *((_BYTE *)v4 + 36);
  if ((v5 & 0x10) == 0)
  {
LABEL_7:
    if ((v5 & 4) == 0)
      goto LABEL_8;
    goto LABEL_17;
  }
LABEL_16:
  self->_timeLimited = *((_BYTE *)v4 + 31);
  *(_BYTE *)&self->_has |= 0x10u;
  v5 = *((_BYTE *)v4 + 36);
  if ((v5 & 4) == 0)
  {
LABEL_8:
    if ((v5 & 2) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_17:
  self->_exclusionSpec = *((_BYTE *)v4 + 29);
  *(_BYTE *)&self->_has |= 4u;
  if ((*((_BYTE *)v4 + 36) & 2) != 0)
  {
LABEL_9:
    self->_error = *((_BYTE *)v4 + 28);
    *(_BYTE *)&self->_has |= 2u;
  }
LABEL_10:
  if (*((_QWORD *)v4 + 1))
  {
    -[PPM2TopicsScored setActiveTreatments:](self, "setActiveTreatments:");
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

- (unsigned)resultSizeLog10
{
  return self->_resultSizeLog10;
}

- (BOOL)limitHit
{
  return self->_limitHit;
}

- (BOOL)timeSpec
{
  return self->_timeSpec;
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
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_activeTreatments, 0);
}

@end
