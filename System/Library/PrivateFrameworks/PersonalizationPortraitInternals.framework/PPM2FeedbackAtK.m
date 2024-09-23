@implementation PPM2FeedbackAtK

- (void)setK:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_k = a3;
}

- (void)setHasK:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasK
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setEvaluatedCount:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_evaluatedCount = a3;
}

- (void)setHasEvaluatedCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasEvaluatedCount
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (int)domain
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_domain;
  else
    return 0;
}

- (void)setDomain:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_domain = a3;
}

- (void)setHasDomain:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDomain
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)domainAsString:(int)a3
{
  if (a3 < 8)
    return off_1E7E188A0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsDomain:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Topics")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NamedEntities")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Locations")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Events")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ContactsDomain")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Connections")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("QuickTypeBroker")) & 1) != 0)
  {
    v4 = 6;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("UniversalSearchSpotlightTopics")))
  {
    v4 = 7;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)feedbackType
{
  if ((*(_BYTE *)&self->_has & 8) != 0)
    return self->_feedbackType;
  else
    return 0;
}

- (void)setFeedbackType:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_feedbackType = a3;
}

- (void)setHasFeedbackType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasFeedbackType
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (id)feedbackTypeAsString:(int)a3
{
  if (a3 < 6)
    return off_1E7E188E0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsFeedbackType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Invalid")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EngagedExplicit")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EngagedImplicit")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RejectedExplicit")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RejectedImplicit")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Offered")))
  {
    v4 = 5;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasActiveTreatments
{
  return self->_activeTreatments != 0;
}

- (void)setBucket:(unsigned int)a3
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

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)PPM2FeedbackAtK;
  -[PPM2FeedbackAtK description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPM2FeedbackAtK dictionaryRepresentation](self, "dictionaryRepresentation");
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
  uint64_t domain;
  __CFString *v8;
  uint64_t feedbackType;
  __CFString *v10;
  NSString *activeTreatments;
  void *v12;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_k);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("k"));

    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
      goto LABEL_8;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_evaluatedCount);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("evaluatedCount"));

  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_16;
    goto LABEL_12;
  }
LABEL_8:
  domain = self->_domain;
  if (domain >= 8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_domain);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = off_1E7E188A0[domain];
  }
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("domain"));

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_12:
    feedbackType = self->_feedbackType;
    if (feedbackType >= 6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_feedbackType);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = off_1E7E188E0[feedbackType];
    }
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("feedbackType"));

  }
LABEL_16:
  activeTreatments = self->_activeTreatments;
  if (activeTreatments)
    objc_msgSend(v3, "setObject:forKey:", activeTreatments, CFSTR("activeTreatments"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_bucket);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("bucket"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PPM2FeedbackAtKReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_13:
  PBDataWriterWriteInt32Field();
  if ((*(_BYTE *)&self->_has & 8) != 0)
LABEL_5:
    PBDataWriterWriteInt32Field();
LABEL_6:
  if (self->_activeTreatments)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint32Field();

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char has;
  _DWORD *v6;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    v4[8] = self->_k;
    *((_BYTE *)v4 + 36) |= 0x10u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  v4[6] = self->_evaluatedCount;
  *((_BYTE *)v4 + 36) |= 4u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_13:
  v4[5] = self->_domain;
  *((_BYTE *)v4 + 36) |= 2u;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_5:
    v4[7] = self->_feedbackType;
    *((_BYTE *)v4 + 36) |= 8u;
  }
LABEL_6:
  if (self->_activeTreatments)
  {
    v6 = v4;
    objc_msgSend(v4, "setActiveTreatments:");
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[4] = self->_bucket;
    *((_BYTE *)v4 + 36) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char has;
  uint64_t v8;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 32) = self->_k;
    *(_BYTE *)(v5 + 36) |= 0x10u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 24) = self->_evaluatedCount;
  *(_BYTE *)(v5 + 36) |= 4u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_11:
  *(_DWORD *)(v5 + 20) = self->_domain;
  *(_BYTE *)(v5 + 36) |= 2u;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_5:
    *(_DWORD *)(v5 + 28) = self->_feedbackType;
    *(_BYTE *)(v5 + 36) |= 8u;
  }
LABEL_6:
  v8 = -[NSString copyWithZone:](self->_activeTreatments, "copyWithZone:", a3);
  v9 = *(void **)(v6 + 8);
  *(_QWORD *)(v6 + 8) = v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v6 + 16) = self->_bucket;
    *(_BYTE *)(v6 + 36) |= 1u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char has;
  char v6;
  NSString *activeTreatments;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_29;
  has = (char)self->_has;
  v6 = *((_BYTE *)v4 + 36);
  if ((has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 0x10) == 0 || self->_k != *((_DWORD *)v4 + 8))
      goto LABEL_29;
  }
  else if ((*((_BYTE *)v4 + 36) & 0x10) != 0)
  {
    goto LABEL_29;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 4) == 0 || self->_evaluatedCount != *((_DWORD *)v4 + 6))
      goto LABEL_29;
  }
  else if ((*((_BYTE *)v4 + 36) & 4) != 0)
  {
    goto LABEL_29;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 2) == 0 || self->_domain != *((_DWORD *)v4 + 5))
      goto LABEL_29;
  }
  else if ((*((_BYTE *)v4 + 36) & 2) != 0)
  {
    goto LABEL_29;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 8) == 0 || self->_feedbackType != *((_DWORD *)v4 + 7))
      goto LABEL_29;
  }
  else if ((*((_BYTE *)v4 + 36) & 8) != 0)
  {
    goto LABEL_29;
  }
  activeTreatments = self->_activeTreatments;
  if ((unint64_t)activeTreatments | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](activeTreatments, "isEqual:"))
    {
LABEL_29:
      v8 = 0;
      goto LABEL_30;
    }
    has = (char)self->_has;
    v6 = *((_BYTE *)v4 + 36);
  }
  v8 = (v6 & 1) == 0;
  if ((has & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_bucket != *((_DWORD *)v4 + 4))
      goto LABEL_29;
    v8 = 1;
  }
LABEL_30:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSUInteger v7;
  uint64_t v8;

  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    v3 = 2654435761 * self->_k;
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_evaluatedCount;
      if ((*(_BYTE *)&self->_has & 2) != 0)
        goto LABEL_4;
LABEL_8:
      v5 = 0;
      if ((*(_BYTE *)&self->_has & 8) != 0)
        goto LABEL_5;
      goto LABEL_9;
    }
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_8;
LABEL_4:
  v5 = 2654435761 * self->_domain;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_5:
    v6 = 2654435761 * self->_feedbackType;
    goto LABEL_10;
  }
LABEL_9:
  v6 = 0;
LABEL_10:
  v7 = -[NSString hash](self->_activeTreatments, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v8 = 2654435761 * self->_bucket;
  else
    v8 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v8 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 36);
  if ((v5 & 0x10) != 0)
  {
    self->_k = *((_DWORD *)v4 + 8);
    *(_BYTE *)&self->_has |= 0x10u;
    v5 = *((_BYTE *)v4 + 36);
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((*((_BYTE *)v4 + 36) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_evaluatedCount = *((_DWORD *)v4 + 6);
  *(_BYTE *)&self->_has |= 4u;
  v5 = *((_BYTE *)v4 + 36);
  if ((v5 & 2) == 0)
  {
LABEL_4:
    if ((v5 & 8) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_13:
  self->_domain = *((_DWORD *)v4 + 5);
  *(_BYTE *)&self->_has |= 2u;
  if ((*((_BYTE *)v4 + 36) & 8) != 0)
  {
LABEL_5:
    self->_feedbackType = *((_DWORD *)v4 + 7);
    *(_BYTE *)&self->_has |= 8u;
  }
LABEL_6:
  if (*((_QWORD *)v4 + 1))
  {
    v6 = v4;
    -[PPM2FeedbackAtK setActiveTreatments:](self, "setActiveTreatments:");
    v4 = v6;
  }
  if ((*((_BYTE *)v4 + 36) & 1) != 0)
  {
    self->_bucket = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (unsigned)k
{
  return self->_k;
}

- (unsigned)evaluatedCount
{
  return self->_evaluatedCount;
}

- (NSString)activeTreatments
{
  return self->_activeTreatments;
}

- (void)setActiveTreatments:(id)a3
{
  objc_storeStrong((id *)&self->_activeTreatments, a3);
}

- (unsigned)bucket
{
  return self->_bucket;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeTreatments, 0);
}

@end
