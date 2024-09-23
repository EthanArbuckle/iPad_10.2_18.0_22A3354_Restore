@implementation ATXMPBBlendingClientModelEngagementTracker

- (BOOL)hasLayoutType
{
  return self->_layoutType != 0;
}

- (BOOL)hasClientModelId
{
  return self->_clientModelId != 0;
}

- (void)setNumSuggestionsForClientModelInLayout:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_numSuggestionsForClientModelInLayout = a3;
}

- (void)setHasNumSuggestionsForClientModelInLayout:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasNumSuggestionsForClientModelInLayout
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setPositionInClientModelCacheOfEngagedSuggestion:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_positionInClientModelCacheOfEngagedSuggestion = a3;
}

- (void)setHasPositionInClientModelCacheOfEngagedSuggestion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasPositionInClientModelCacheOfEngagedSuggestion
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (BOOL)hasConsumerSubType
{
  return self->_consumerSubType != 0;
}

- (int)engagementType
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_engagementType;
  else
    return 1;
}

- (void)setEngagementType:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_engagementType = a3;
}

- (void)setHasEngagementType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasEngagementType
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)engagementTypeAsString:(int)a3
{
  if ((a3 - 1) < 8)
    return off_1E57CFC00[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsEngagementType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ExplicitConfirm")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ImplicitAbandon")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ExplicitReject")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ExplicitTap")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ImplicitDwell")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ExplicitUserScroll")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NotSeen")) & 1) != 0)
  {
    v4 = 7;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ExplicitConfirmOnlyIfHigherRankedSuggestionsWereDeduped")))
  {
    v4 = 8;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (void)setConsumerSubTypeCacheAge:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_consumerSubTypeCacheAge = a3;
}

- (void)setHasConsumerSubTypeCacheAge:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasConsumerSubTypeCacheAge
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setClientModelCacheAge:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_clientModelCacheAge = a3;
}

- (void)setHasClientModelCacheAge:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasClientModelCacheAge
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasAbGroup
{
  return self->_abGroup != 0;
}

- (BOOL)hasClientModelABGroup
{
  return self->_clientModelABGroup != 0;
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
  v8.super_class = (Class)ATXMPBBlendingClientModelEngagementTracker;
  -[ATXMPBBlendingClientModelEngagementTracker description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXMPBBlendingClientModelEngagementTracker dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *layoutType;
  NSString *clientModelId;
  char has;
  void *v8;
  void *v9;
  NSString *consumerSubType;
  char v11;
  void *v12;
  NSString *abGroup;
  NSString *clientModelABGroup;
  unsigned int v16;
  __CFString *v17;
  void *v18;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  layoutType = self->_layoutType;
  if (layoutType)
    objc_msgSend(v3, "setObject:forKey:", layoutType, CFSTR("layoutType"));
  clientModelId = self->_clientModelId;
  if (clientModelId)
    objc_msgSend(v4, "setObject:forKey:", clientModelId, CFSTR("clientModelId"));
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_numSuggestionsForClientModelInLayout);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("numSuggestionsForClientModelInLayout"));

    has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_positionInClientModelCacheOfEngagedSuggestion);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("positionInClientModelCacheOfEngagedSuggestion"));

  }
  consumerSubType = self->_consumerSubType;
  if (consumerSubType)
    objc_msgSend(v4, "setObject:forKey:", consumerSubType, CFSTR("consumerSubType"));
  v11 = (char)self->_has;
  if ((v11 & 4) != 0)
  {
    v16 = self->_engagementType - 1;
    if (v16 >= 8)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_engagementType);
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = off_1E57CFC00[v16];
    }
    objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("engagementType"));

    v11 = (char)self->_has;
    if ((v11 & 2) == 0)
    {
LABEL_13:
      if ((v11 & 1) == 0)
        goto LABEL_15;
      goto LABEL_14;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_consumerSubTypeCacheAge);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v18, CFSTR("consumerSubTypeCacheAge"));

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_14:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_clientModelCacheAge);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("clientModelCacheAge"));

  }
LABEL_15:
  abGroup = self->_abGroup;
  if (abGroup)
    objc_msgSend(v4, "setObject:forKey:", abGroup, CFSTR("abGroup"));
  clientModelABGroup = self->_clientModelABGroup;
  if (clientModelABGroup)
    objc_msgSend(v4, "setObject:forKey:", clientModelABGroup, CFSTR("clientModelABGroup"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ATXMPBBlendingClientModelEngagementTrackerReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  char v6;
  id v7;

  v4 = a3;
  v7 = v4;
  if (self->_layoutType)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }
  if (self->_clientModelId)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v7;
    has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v7;
  }
  if (self->_consumerSubType)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }
  v6 = (char)self->_has;
  if ((v6 & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v7;
    v6 = (char)self->_has;
    if ((v6 & 2) == 0)
    {
LABEL_13:
      if ((v6 & 1) == 0)
        goto LABEL_15;
      goto LABEL_14;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_13;
  }
  PBDataWriterWriteUint32Field();
  v4 = v7;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_14:
    PBDataWriterWriteUint32Field();
    v4 = v7;
  }
LABEL_15:
  if (self->_abGroup)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }
  if (self->_clientModelABGroup)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  char v6;
  id v7;

  v4 = a3;
  v7 = v4;
  if (self->_layoutType)
  {
    objc_msgSend(v4, "setLayoutType:");
    v4 = v7;
  }
  if (self->_clientModelId)
  {
    objc_msgSend(v7, "setClientModelId:");
    v4 = v7;
  }
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((_DWORD *)v4 + 16) = self->_numSuggestionsForClientModelInLayout;
    *((_BYTE *)v4 + 72) |= 8u;
    has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    *((_DWORD *)v4 + 17) = self->_positionInClientModelCacheOfEngagedSuggestion;
    *((_BYTE *)v4 + 72) |= 0x10u;
  }
  if (self->_consumerSubType)
  {
    objc_msgSend(v7, "setConsumerSubType:");
    v4 = v7;
  }
  v6 = (char)self->_has;
  if ((v6 & 4) != 0)
  {
    *((_DWORD *)v4 + 13) = self->_engagementType;
    *((_BYTE *)v4 + 72) |= 4u;
    v6 = (char)self->_has;
    if ((v6 & 2) == 0)
    {
LABEL_13:
      if ((v6 & 1) == 0)
        goto LABEL_15;
      goto LABEL_14;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_13;
  }
  *((_DWORD *)v4 + 12) = self->_consumerSubTypeCacheAge;
  *((_BYTE *)v4 + 72) |= 2u;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_14:
    *((_DWORD *)v4 + 6) = self->_clientModelCacheAge;
    *((_BYTE *)v4 + 72) |= 1u;
  }
LABEL_15:
  if (self->_abGroup)
  {
    objc_msgSend(v7, "setAbGroup:");
    v4 = v7;
  }
  if (self->_clientModelABGroup)
  {
    objc_msgSend(v7, "setClientModelABGroup:");
    v4 = v7;
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
  char v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_layoutType, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v6;

  v8 = -[NSString copyWithZone:](self->_clientModelId, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v8;

  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(_DWORD *)(v5 + 64) = self->_numSuggestionsForClientModelInLayout;
    *(_BYTE *)(v5 + 72) |= 8u;
    has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 68) = self->_positionInClientModelCacheOfEngagedSuggestion;
    *(_BYTE *)(v5 + 72) |= 0x10u;
  }
  v11 = -[NSString copyWithZone:](self->_consumerSubType, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v11;

  v13 = (char)self->_has;
  if ((v13 & 4) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_7;
LABEL_11:
    *(_DWORD *)(v5 + 48) = self->_consumerSubTypeCacheAge;
    *(_BYTE *)(v5 + 72) |= 2u;
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
  *(_DWORD *)(v5 + 52) = self->_engagementType;
  *(_BYTE *)(v5 + 72) |= 4u;
  v13 = (char)self->_has;
  if ((v13 & 2) != 0)
    goto LABEL_11;
LABEL_7:
  if ((v13 & 1) != 0)
  {
LABEL_8:
    *(_DWORD *)(v5 + 24) = self->_clientModelCacheAge;
    *(_BYTE *)(v5 + 72) |= 1u;
  }
LABEL_9:
  v14 = -[NSString copyWithZone:](self->_abGroup, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v14;

  v16 = -[NSString copyWithZone:](self->_clientModelABGroup, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v16;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *layoutType;
  NSString *clientModelId;
  char has;
  NSString *consumerSubType;
  NSString *abGroup;
  NSString *clientModelABGroup;
  char v11;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_38;
  layoutType = self->_layoutType;
  if ((unint64_t)layoutType | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](layoutType, "isEqual:"))
      goto LABEL_38;
  }
  clientModelId = self->_clientModelId;
  if ((unint64_t)clientModelId | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](clientModelId, "isEqual:"))
      goto LABEL_38;
  }
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 8) == 0 || self->_numSuggestionsForClientModelInLayout != *((_DWORD *)v4 + 16))
      goto LABEL_38;
  }
  else if ((*((_BYTE *)v4 + 72) & 8) != 0)
  {
    goto LABEL_38;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 0x10) == 0
      || self->_positionInClientModelCacheOfEngagedSuggestion != *((_DWORD *)v4 + 17))
    {
      goto LABEL_38;
    }
  }
  else if ((*((_BYTE *)v4 + 72) & 0x10) != 0)
  {
    goto LABEL_38;
  }
  consumerSubType = self->_consumerSubType;
  if ((unint64_t)consumerSubType | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](consumerSubType, "isEqual:"))
    {
LABEL_38:
      v11 = 0;
      goto LABEL_39;
    }
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 4) == 0 || self->_engagementType != *((_DWORD *)v4 + 13))
      goto LABEL_38;
  }
  else if ((*((_BYTE *)v4 + 72) & 4) != 0)
  {
    goto LABEL_38;
  }
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 2) == 0 || self->_consumerSubTypeCacheAge != *((_DWORD *)v4 + 12))
      goto LABEL_38;
  }
  else if ((*((_BYTE *)v4 + 72) & 2) != 0)
  {
    goto LABEL_38;
  }
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 1) == 0 || self->_clientModelCacheAge != *((_DWORD *)v4 + 6))
      goto LABEL_38;
  }
  else if ((*((_BYTE *)v4 + 72) & 1) != 0)
  {
    goto LABEL_38;
  }
  abGroup = self->_abGroup;
  if ((unint64_t)abGroup | *((_QWORD *)v4 + 1) && !-[NSString isEqual:](abGroup, "isEqual:"))
    goto LABEL_38;
  clientModelABGroup = self->_clientModelABGroup;
  if ((unint64_t)clientModelABGroup | *((_QWORD *)v4 + 2))
    v11 = -[NSString isEqual:](clientModelABGroup, "isEqual:");
  else
    v11 = 1;
LABEL_39:

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  uint64_t v5;
  uint64_t v6;
  NSUInteger v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSUInteger v11;
  NSUInteger v12;

  v3 = -[NSString hash](self->_layoutType, "hash");
  v4 = -[NSString hash](self->_clientModelId, "hash");
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    v5 = 2654435761 * self->_numSuggestionsForClientModelInLayout;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_3;
  }
  else
  {
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
    {
LABEL_3:
      v6 = 2654435761 * self->_positionInClientModelCacheOfEngagedSuggestion;
      goto LABEL_6;
    }
  }
  v6 = 0;
LABEL_6:
  v7 = -[NSString hash](self->_consumerSubType, "hash");
  if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    v8 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_8;
LABEL_11:
    v9 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_9;
LABEL_12:
    v10 = 0;
    goto LABEL_13;
  }
  v8 = 2654435761 * self->_engagementType;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_11;
LABEL_8:
  v9 = 2654435761 * self->_consumerSubTypeCacheAge;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_12;
LABEL_9:
  v10 = 2654435761 * self->_clientModelCacheAge;
LABEL_13:
  v11 = v4 ^ v3 ^ v5 ^ v6 ^ v7;
  v12 = v8 ^ v9 ^ v10 ^ -[NSString hash](self->_abGroup, "hash");
  return v11 ^ v12 ^ -[NSString hash](self->_clientModelABGroup, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  char v6;
  id v7;

  v4 = a3;
  v7 = v4;
  if (*((_QWORD *)v4 + 7))
  {
    -[ATXMPBBlendingClientModelEngagementTracker setLayoutType:](self, "setLayoutType:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[ATXMPBBlendingClientModelEngagementTracker setClientModelId:](self, "setClientModelId:");
    v4 = v7;
  }
  v5 = *((_BYTE *)v4 + 72);
  if ((v5 & 8) != 0)
  {
    self->_numSuggestionsForClientModelInLayout = *((_DWORD *)v4 + 16);
    *(_BYTE *)&self->_has |= 8u;
    v5 = *((_BYTE *)v4 + 72);
  }
  if ((v5 & 0x10) != 0)
  {
    self->_positionInClientModelCacheOfEngagedSuggestion = *((_DWORD *)v4 + 17);
    *(_BYTE *)&self->_has |= 0x10u;
  }
  if (*((_QWORD *)v4 + 5))
  {
    -[ATXMPBBlendingClientModelEngagementTracker setConsumerSubType:](self, "setConsumerSubType:");
    v4 = v7;
  }
  v6 = *((_BYTE *)v4 + 72);
  if ((v6 & 4) != 0)
  {
    self->_engagementType = *((_DWORD *)v4 + 13);
    *(_BYTE *)&self->_has |= 4u;
    v6 = *((_BYTE *)v4 + 72);
    if ((v6 & 2) == 0)
    {
LABEL_13:
      if ((v6 & 1) == 0)
        goto LABEL_15;
      goto LABEL_14;
    }
  }
  else if ((*((_BYTE *)v4 + 72) & 2) == 0)
  {
    goto LABEL_13;
  }
  self->_consumerSubTypeCacheAge = *((_DWORD *)v4 + 12);
  *(_BYTE *)&self->_has |= 2u;
  if ((*((_BYTE *)v4 + 72) & 1) != 0)
  {
LABEL_14:
    self->_clientModelCacheAge = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 1u;
  }
LABEL_15:
  if (*((_QWORD *)v4 + 1))
  {
    -[ATXMPBBlendingClientModelEngagementTracker setAbGroup:](self, "setAbGroup:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[ATXMPBBlendingClientModelEngagementTracker setClientModelABGroup:](self, "setClientModelABGroup:");
    v4 = v7;
  }

}

- (NSString)layoutType
{
  return self->_layoutType;
}

- (void)setLayoutType:(id)a3
{
  objc_storeStrong((id *)&self->_layoutType, a3);
}

- (NSString)clientModelId
{
  return self->_clientModelId;
}

- (void)setClientModelId:(id)a3
{
  objc_storeStrong((id *)&self->_clientModelId, a3);
}

- (unsigned)numSuggestionsForClientModelInLayout
{
  return self->_numSuggestionsForClientModelInLayout;
}

- (unsigned)positionInClientModelCacheOfEngagedSuggestion
{
  return self->_positionInClientModelCacheOfEngagedSuggestion;
}

- (NSString)consumerSubType
{
  return self->_consumerSubType;
}

- (void)setConsumerSubType:(id)a3
{
  objc_storeStrong((id *)&self->_consumerSubType, a3);
}

- (unsigned)consumerSubTypeCacheAge
{
  return self->_consumerSubTypeCacheAge;
}

- (unsigned)clientModelCacheAge
{
  return self->_clientModelCacheAge;
}

- (NSString)abGroup
{
  return self->_abGroup;
}

- (void)setAbGroup:(id)a3
{
  objc_storeStrong((id *)&self->_abGroup, a3);
}

- (NSString)clientModelABGroup
{
  return self->_clientModelABGroup;
}

- (void)setClientModelABGroup:(id)a3
{
  objc_storeStrong((id *)&self->_clientModelABGroup, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutType, 0);
  objc_storeStrong((id *)&self->_consumerSubType, 0);
  objc_storeStrong((id *)&self->_clientModelId, 0);
  objc_storeStrong((id *)&self->_clientModelABGroup, 0);
  objc_storeStrong((id *)&self->_abGroup, 0);
}

@end
