@implementation PPM2EngagementRatio

- (void)setK:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_k = a3;
}

- (void)setHasK:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasK
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
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

- (void)setEngagedCount:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_engagedCount = a3;
}

- (void)setHasEngagedCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasEngagedCount
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setRejectedCount:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_rejectedCount = a3;
}

- (void)setHasRejectedCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasRejectedCount
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (int)domain
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_domain;
  else
    return 0;
}

- (void)setDomain:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_domain = a3;
}

- (void)setHasDomain:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDomain
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)domainAsString:(int)a3
{
  if (a3 < 8)
    return off_1E7E1C5C8[a3];
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

- (BOOL)hasActiveTreatments
{
  return self->_activeTreatments != 0;
}

- (void)setOfferedCount:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_offeredCount = a3;
}

- (void)setHasOfferedCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasOfferedCount
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (BOOL)hasMappingId
{
  return self->_mappingId != 0;
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
  v8.super_class = (Class)PPM2EngagementRatio;
  -[PPM2EngagementRatio description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPM2EngagementRatio dictionaryRepresentation](self, "dictionaryRepresentation");
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
  void *v7;
  void *v8;
  uint64_t domain;
  __CFString *v10;
  NSString *activeTreatments;
  void *v12;
  NSString *mappingId;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 8) != 0)
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
      goto LABEL_9;
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
    if ((has & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_10;
  }
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_engagedCount);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("engagedCount"));

  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 1) == 0)
      goto LABEL_15;
    goto LABEL_11;
  }
LABEL_10:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_rejectedCount);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("rejectedCount"));

  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_15;
LABEL_11:
  domain = self->_domain;
  if (domain >= 8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_domain);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = off_1E7E1C5C8[domain];
  }
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("domain"));

LABEL_15:
  activeTreatments = self->_activeTreatments;
  if (activeTreatments)
    objc_msgSend(v3, "setObject:forKey:", activeTreatments, CFSTR("activeTreatments"));
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_offeredCount);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("offeredCount"));

  }
  mappingId = self->_mappingId;
  if (mappingId)
    objc_msgSend(v3, "setObject:forKey:", mappingId, CFSTR("mappingId"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PPM2EngagementRatioReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  has = (char)self->_has;
  v6 = v4;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v6;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteUint32Field();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 1) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_17:
  PBDataWriterWriteUint32Field();
  v4 = v6;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_6:
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }
LABEL_7:
  if (self->_activeTreatments)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v6;
  }
  if (self->_mappingId)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char has;
  _DWORD *v6;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v4[7] = self->_k;
    *((_BYTE *)v4 + 48) |= 8u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  v4[6] = self->_evaluatedCount;
  *((_BYTE *)v4 + 48) |= 4u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_17;
  }
LABEL_16:
  v4[5] = self->_engagedCount;
  *((_BYTE *)v4 + 48) |= 2u;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 1) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_17:
  v4[11] = self->_rejectedCount;
  *((_BYTE *)v4 + 48) |= 0x20u;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_6:
    v4[4] = self->_domain;
    *((_BYTE *)v4 + 48) |= 1u;
  }
LABEL_7:
  v6 = v4;
  if (self->_activeTreatments)
  {
    objc_msgSend(v4, "setActiveTreatments:");
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    v4[10] = self->_offeredCount;
    *((_BYTE *)v4 + 48) |= 0x10u;
  }
  if (self->_mappingId)
  {
    objc_msgSend(v6, "setMappingId:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char has;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(_DWORD *)(v5 + 28) = self->_k;
    *(_BYTE *)(v5 + 48) |= 8u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 24) = self->_evaluatedCount;
  *(_BYTE *)(v5 + 48) |= 4u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  *(_DWORD *)(v5 + 20) = self->_engagedCount;
  *(_BYTE *)(v5 + 48) |= 2u;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 1) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_13:
  *(_DWORD *)(v5 + 44) = self->_rejectedCount;
  *(_BYTE *)(v5 + 48) |= 0x20u;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_6:
    *(_DWORD *)(v5 + 16) = self->_domain;
    *(_BYTE *)(v5 + 48) |= 1u;
  }
LABEL_7:
  v8 = -[NSString copyWithZone:](self->_activeTreatments, "copyWithZone:", a3);
  v9 = *(void **)(v6 + 8);
  *(_QWORD *)(v6 + 8) = v8;

  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    *(_DWORD *)(v6 + 40) = self->_offeredCount;
    *(_BYTE *)(v6 + 48) |= 0x10u;
  }
  v10 = -[NSString copyWithZone:](self->_mappingId, "copyWithZone:", a3);
  v11 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v10;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char has;
  char v6;
  NSString *activeTreatments;
  NSString *mappingId;
  char v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_37;
  has = (char)self->_has;
  v6 = *((_BYTE *)v4 + 48);
  if ((has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 8) == 0 || self->_k != *((_DWORD *)v4 + 7))
      goto LABEL_37;
  }
  else if ((*((_BYTE *)v4 + 48) & 8) != 0)
  {
    goto LABEL_37;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 4) == 0 || self->_evaluatedCount != *((_DWORD *)v4 + 6))
      goto LABEL_37;
  }
  else if ((*((_BYTE *)v4 + 48) & 4) != 0)
  {
    goto LABEL_37;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 2) == 0 || self->_engagedCount != *((_DWORD *)v4 + 5))
      goto LABEL_37;
  }
  else if ((*((_BYTE *)v4 + 48) & 2) != 0)
  {
    goto LABEL_37;
  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 0x20) == 0 || self->_rejectedCount != *((_DWORD *)v4 + 11))
      goto LABEL_37;
  }
  else if ((*((_BYTE *)v4 + 48) & 0x20) != 0)
  {
    goto LABEL_37;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) == 0 || self->_domain != *((_DWORD *)v4 + 4))
      goto LABEL_37;
  }
  else if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
    goto LABEL_37;
  }
  activeTreatments = self->_activeTreatments;
  if ((unint64_t)activeTreatments | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](activeTreatments, "isEqual:"))
    {
LABEL_37:
      v9 = 0;
      goto LABEL_38;
    }
    has = (char)self->_has;
    v6 = *((_BYTE *)v4 + 48);
  }
  if ((has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_offeredCount != *((_DWORD *)v4 + 10))
      goto LABEL_37;
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_37;
  }
  mappingId = self->_mappingId;
  if ((unint64_t)mappingId | *((_QWORD *)v4 + 4))
    v9 = -[NSString isEqual:](mappingId, "isEqual:");
  else
    v9 = 1;
LABEL_38:

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSUInteger v8;
  uint64_t v9;

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    v3 = 2654435761 * self->_k;
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_evaluatedCount;
      if ((*(_BYTE *)&self->_has & 2) != 0)
        goto LABEL_4;
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
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_4:
    v5 = 2654435761 * self->_engagedCount;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
      goto LABEL_5;
LABEL_10:
    v6 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_6;
    goto LABEL_11;
  }
LABEL_9:
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 0x20) == 0)
    goto LABEL_10;
LABEL_5:
  v6 = 2654435761 * self->_rejectedCount;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_6:
    v7 = 2654435761 * self->_domain;
    goto LABEL_12;
  }
LABEL_11:
  v7 = 0;
LABEL_12:
  v8 = -[NSString hash](self->_activeTreatments, "hash");
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    v9 = 2654435761 * self->_offeredCount;
  else
    v9 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v9 ^ v8 ^ -[NSString hash](self->_mappingId, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 48);
  if ((v5 & 8) != 0)
  {
    self->_k = *((_DWORD *)v4 + 7);
    *(_BYTE *)&self->_has |= 8u;
    v5 = *((_BYTE *)v4 + 48);
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else if ((*((_BYTE *)v4 + 48) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_evaluatedCount = *((_DWORD *)v4 + 6);
  *(_BYTE *)&self->_has |= 4u;
  v5 = *((_BYTE *)v4 + 48);
  if ((v5 & 2) == 0)
  {
LABEL_4:
    if ((v5 & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_17;
  }
LABEL_16:
  self->_engagedCount = *((_DWORD *)v4 + 5);
  *(_BYTE *)&self->_has |= 2u;
  v5 = *((_BYTE *)v4 + 48);
  if ((v5 & 0x20) == 0)
  {
LABEL_5:
    if ((v5 & 1) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_17:
  self->_rejectedCount = *((_DWORD *)v4 + 11);
  *(_BYTE *)&self->_has |= 0x20u;
  if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
LABEL_6:
    self->_domain = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 1u;
  }
LABEL_7:
  v6 = v4;
  if (*((_QWORD *)v4 + 1))
  {
    -[PPM2EngagementRatio setActiveTreatments:](self, "setActiveTreatments:");
    v4 = v6;
  }
  if ((*((_BYTE *)v4 + 48) & 0x10) != 0)
  {
    self->_offeredCount = *((_DWORD *)v4 + 10);
    *(_BYTE *)&self->_has |= 0x10u;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[PPM2EngagementRatio setMappingId:](self, "setMappingId:");
    v4 = v6;
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

- (unsigned)engagedCount
{
  return self->_engagedCount;
}

- (unsigned)rejectedCount
{
  return self->_rejectedCount;
}

- (NSString)activeTreatments
{
  return self->_activeTreatments;
}

- (void)setActiveTreatments:(id)a3
{
  objc_storeStrong((id *)&self->_activeTreatments, a3);
}

- (unsigned)offeredCount
{
  return self->_offeredCount;
}

- (NSString)mappingId
{
  return self->_mappingId;
}

- (void)setMappingId:(id)a3
{
  objc_storeStrong((id *)&self->_mappingId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mappingId, 0);
  objc_storeStrong((id *)&self->_activeTreatments, 0);
}

@end
