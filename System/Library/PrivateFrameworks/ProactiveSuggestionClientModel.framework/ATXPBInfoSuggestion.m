@implementation ATXPBInfoSuggestion

- (NSString)widgetKind
{
  return self->_widgetKind;
}

- (NSString)widgetBundleIdentifier
{
  return self->_widgetBundleIdentifier;
}

- (NSString)suggestionIdentifier
{
  return self->_suggestionIdentifier;
}

- (double)startDate
{
  return self->_startDate;
}

- (NSString)sourceIdentifier
{
  return self->_sourceIdentifier;
}

- (int64_t)layouts
{
  return self->_layouts;
}

- (BOOL)hasRelevanceScore
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (double)endDate
{
  return self->_endDate;
}

- (NSString)criterion
{
  return self->_criterion;
}

- (int64_t)confidenceLevel
{
  return self->_confidenceLevel;
}

- (NSString)clientModelId
{
  return self->_clientModelId;
}

- (NSData)archivedMetadata
{
  return self->_archivedMetadata;
}

- (NSData)archivedIntent
{
  return self->_archivedIntent;
}

- (NSString)appBundleIdentifier
{
  return self->_appBundleIdentifier;
}

- (double)relevanceScore
{
  return self->_relevanceScore;
}

- (BOOL)hasArchivedIntentDescription
{
  return self->_archivedIntentDescription != 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetKind, 0);
  objc_storeStrong((id *)&self->_widgetBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_suggestionIdentifier, 0);
  objc_storeStrong((id *)&self->_sourceIdentifier, 0);
  objc_storeStrong((id *)&self->_criterion, 0);
  objc_storeStrong((id *)&self->_clientModelId, 0);
  objc_storeStrong((id *)&self->_archivedMetadata, 0);
  objc_storeStrong((id *)&self->_archivedIntentDescription, 0);
  objc_storeStrong((id *)&self->_archivedIntent, 0);
  objc_storeStrong((id *)&self->_appBundleIdentifier, 0);
}

- (BOOL)hasAppBundleIdentifier
{
  return self->_appBundleIdentifier != 0;
}

- (BOOL)hasWidgetBundleIdentifier
{
  return self->_widgetBundleIdentifier != 0;
}

- (BOOL)hasWidgetKind
{
  return self->_widgetKind != 0;
}

- (void)setLayouts:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_layouts = a3;
}

- (void)setHasLayouts:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasLayouts
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasSuggestionIdentifier
{
  return self->_suggestionIdentifier != 0;
}

- (BOOL)hasClientModelId
{
  return self->_clientModelId != 0;
}

- (BOOL)hasArchivedIntent
{
  return self->_archivedIntent != 0;
}

- (BOOL)hasArchivedMetadata
{
  return self->_archivedMetadata != 0;
}

- (BOOL)hasSourceIdentifier
{
  return self->_sourceIdentifier != 0;
}

- (void)setConfidenceLevel:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_confidenceLevel = a3;
}

- (void)setHasConfidenceLevel:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasConfidenceLevel
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setRelevanceScore:(double)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_relevanceScore = a3;
}

- (void)setHasRelevanceScore:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)setStartDate:(double)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_startDate = a3;
}

- (void)setHasStartDate:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasStartDate
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setEndDate:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_endDate = a3;
}

- (void)setHasEndDate:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasEndDate
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasCriterion
{
  return self->_criterion != 0;
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
  v8.super_class = (Class)ATXPBInfoSuggestion;
  -[ATXPBInfoSuggestion description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBInfoSuggestion dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *appBundleIdentifier;
  NSString *widgetBundleIdentifier;
  NSString *widgetKind;
  void *v8;
  NSString *suggestionIdentifier;
  NSString *clientModelId;
  NSData *archivedIntent;
  NSData *archivedMetadata;
  NSString *sourceIdentifier;
  char has;
  void *v15;
  NSString *criterion;
  NSData *archivedIntentDescription;
  void *v19;
  void *v20;
  void *v21;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  appBundleIdentifier = self->_appBundleIdentifier;
  if (appBundleIdentifier)
    objc_msgSend(v3, "setObject:forKey:", appBundleIdentifier, CFSTR("appBundleIdentifier"));
  widgetBundleIdentifier = self->_widgetBundleIdentifier;
  if (widgetBundleIdentifier)
    objc_msgSend(v4, "setObject:forKey:", widgetBundleIdentifier, CFSTR("widgetBundleIdentifier"));
  widgetKind = self->_widgetKind;
  if (widgetKind)
    objc_msgSend(v4, "setObject:forKey:", widgetKind, CFSTR("widgetKind"));
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_layouts);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("layouts"));

  }
  suggestionIdentifier = self->_suggestionIdentifier;
  if (suggestionIdentifier)
    objc_msgSend(v4, "setObject:forKey:", suggestionIdentifier, CFSTR("suggestionIdentifier"));
  clientModelId = self->_clientModelId;
  if (clientModelId)
    objc_msgSend(v4, "setObject:forKey:", clientModelId, CFSTR("clientModelId"));
  archivedIntent = self->_archivedIntent;
  if (archivedIntent)
    objc_msgSend(v4, "setObject:forKey:", archivedIntent, CFSTR("archivedIntent"));
  archivedMetadata = self->_archivedMetadata;
  if (archivedMetadata)
    objc_msgSend(v4, "setObject:forKey:", archivedMetadata, CFSTR("archivedMetadata"));
  sourceIdentifier = self->_sourceIdentifier;
  if (sourceIdentifier)
    objc_msgSend(v4, "setObject:forKey:", sourceIdentifier, CFSTR("sourceIdentifier"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_confidenceLevel);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v19, CFSTR("confidenceLevel"));

    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_21:
      if ((has & 0x10) == 0)
        goto LABEL_22;
      goto LABEL_31;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_21;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_relevanceScore);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("relevanceScore"));

  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_22:
    if ((has & 2) == 0)
      goto LABEL_24;
    goto LABEL_23;
  }
LABEL_31:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_startDate);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v21, CFSTR("startDate"));

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_23:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_endDate);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("endDate"));

  }
LABEL_24:
  criterion = self->_criterion;
  if (criterion)
    objc_msgSend(v4, "setObject:forKey:", criterion, CFSTR("criterion"));
  archivedIntentDescription = self->_archivedIntentDescription;
  if (archivedIntentDescription)
    objc_msgSend(v4, "setObject:forKey:", archivedIntentDescription, CFSTR("archivedIntentDescription"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBInfoSuggestionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_appBundleIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_widgetBundleIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_widgetKind)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v6;
  }
  if (self->_suggestionIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_clientModelId)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_archivedIntent)
  {
    PBDataWriterWriteDataField();
    v4 = v6;
  }
  if (self->_archivedMetadata)
  {
    PBDataWriterWriteDataField();
    v4 = v6;
  }
  if (self->_sourceIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v6;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_21:
      if ((has & 0x10) == 0)
        goto LABEL_22;
      goto LABEL_31;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_21;
  }
  PBDataWriterWriteDoubleField();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_22:
    if ((has & 2) == 0)
      goto LABEL_24;
    goto LABEL_23;
  }
LABEL_31:
  PBDataWriterWriteDoubleField();
  v4 = v6;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_23:
    PBDataWriterWriteDoubleField();
    v4 = v6;
  }
LABEL_24:
  if (self->_criterion)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_archivedIntentDescription)
  {
    PBDataWriterWriteDataField();
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
  if (self->_appBundleIdentifier)
  {
    objc_msgSend(v4, "setAppBundleIdentifier:");
    v4 = v6;
  }
  if (self->_widgetBundleIdentifier)
  {
    objc_msgSend(v6, "setWidgetBundleIdentifier:");
    v4 = v6;
  }
  if (self->_widgetKind)
  {
    objc_msgSend(v6, "setWidgetKind:");
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *((_QWORD *)v4 + 3) = self->_layouts;
    *((_BYTE *)v4 + 128) |= 4u;
  }
  if (self->_suggestionIdentifier)
  {
    objc_msgSend(v6, "setSuggestionIdentifier:");
    v4 = v6;
  }
  if (self->_clientModelId)
  {
    objc_msgSend(v6, "setClientModelId:");
    v4 = v6;
  }
  if (self->_archivedIntent)
  {
    objc_msgSend(v6, "setArchivedIntent:");
    v4 = v6;
  }
  if (self->_archivedMetadata)
  {
    objc_msgSend(v6, "setArchivedMetadata:");
    v4 = v6;
  }
  if (self->_sourceIdentifier)
  {
    objc_msgSend(v6, "setSourceIdentifier:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = self->_confidenceLevel;
    *((_BYTE *)v4 + 128) |= 1u;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_21:
      if ((has & 0x10) == 0)
        goto LABEL_22;
      goto LABEL_31;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_21;
  }
  *((_QWORD *)v4 + 4) = *(_QWORD *)&self->_relevanceScore;
  *((_BYTE *)v4 + 128) |= 8u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_22:
    if ((has & 2) == 0)
      goto LABEL_24;
    goto LABEL_23;
  }
LABEL_31:
  *((_QWORD *)v4 + 5) = *(_QWORD *)&self->_startDate;
  *((_BYTE *)v4 + 128) |= 0x10u;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_23:
    *((_QWORD *)v4 + 2) = *(_QWORD *)&self->_endDate;
    *((_BYTE *)v4 + 128) |= 2u;
  }
LABEL_24:
  if (self->_criterion)
  {
    objc_msgSend(v6, "setCriterion:");
    v4 = v6;
  }
  if (self->_archivedIntentDescription)
  {
    objc_msgSend(v6, "setArchivedIntentDescription:");
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
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  char has;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_appBundleIdentifier, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v6;

  v8 = -[NSString copyWithZone:](self->_widgetBundleIdentifier, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 112);
  *(_QWORD *)(v5 + 112) = v8;

  v10 = -[NSString copyWithZone:](self->_widgetKind, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 120);
  *(_QWORD *)(v5 + 120) = v10;

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *(_QWORD *)(v5 + 24) = self->_layouts;
    *(_BYTE *)(v5 + 128) |= 4u;
  }
  v12 = -[NSString copyWithZone:](self->_suggestionIdentifier, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 104);
  *(_QWORD *)(v5 + 104) = v12;

  v14 = -[NSString copyWithZone:](self->_clientModelId, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v14;

  v16 = -[NSData copyWithZone:](self->_archivedIntent, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v16;

  v18 = -[NSData copyWithZone:](self->_archivedMetadata, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v18;

  v20 = -[NSString copyWithZone:](self->_sourceIdentifier, "copyWithZone:", a3);
  v21 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v20;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_confidenceLevel;
    *(_BYTE *)(v5 + 128) |= 1u;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_5:
      if ((has & 0x10) == 0)
        goto LABEL_6;
LABEL_11:
      *(double *)(v5 + 40) = self->_startDate;
      *(_BYTE *)(v5 + 128) |= 0x10u;
      if ((*(_BYTE *)&self->_has & 2) == 0)
        goto LABEL_8;
      goto LABEL_7;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_5;
  }
  *(double *)(v5 + 32) = self->_relevanceScore;
  *(_BYTE *)(v5 + 128) |= 8u;
  has = (char)self->_has;
  if ((has & 0x10) != 0)
    goto LABEL_11;
LABEL_6:
  if ((has & 2) != 0)
  {
LABEL_7:
    *(double *)(v5 + 16) = self->_endDate;
    *(_BYTE *)(v5 + 128) |= 2u;
  }
LABEL_8:
  v23 = -[NSString copyWithZone:](self->_criterion, "copyWithZone:", a3);
  v24 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v23;

  v25 = -[NSData copyWithZone:](self->_archivedIntentDescription, "copyWithZone:", a3);
  v26 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v25;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *appBundleIdentifier;
  NSString *widgetBundleIdentifier;
  NSString *widgetKind;
  NSString *suggestionIdentifier;
  NSString *clientModelId;
  NSData *archivedIntent;
  NSData *archivedMetadata;
  NSString *sourceIdentifier;
  NSString *criterion;
  NSData *archivedIntentDescription;
  char v15;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_47;
  appBundleIdentifier = self->_appBundleIdentifier;
  if ((unint64_t)appBundleIdentifier | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](appBundleIdentifier, "isEqual:"))
      goto LABEL_47;
  }
  widgetBundleIdentifier = self->_widgetBundleIdentifier;
  if ((unint64_t)widgetBundleIdentifier | *((_QWORD *)v4 + 14))
  {
    if (!-[NSString isEqual:](widgetBundleIdentifier, "isEqual:"))
      goto LABEL_47;
  }
  widgetKind = self->_widgetKind;
  if ((unint64_t)widgetKind | *((_QWORD *)v4 + 15))
  {
    if (!-[NSString isEqual:](widgetKind, "isEqual:"))
      goto LABEL_47;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 128) & 4) == 0 || self->_layouts != *((_QWORD *)v4 + 3))
      goto LABEL_47;
  }
  else if ((*((_BYTE *)v4 + 128) & 4) != 0)
  {
LABEL_47:
    v15 = 0;
    goto LABEL_48;
  }
  suggestionIdentifier = self->_suggestionIdentifier;
  if ((unint64_t)suggestionIdentifier | *((_QWORD *)v4 + 13)
    && !-[NSString isEqual:](suggestionIdentifier, "isEqual:"))
  {
    goto LABEL_47;
  }
  clientModelId = self->_clientModelId;
  if ((unint64_t)clientModelId | *((_QWORD *)v4 + 10))
  {
    if (!-[NSString isEqual:](clientModelId, "isEqual:"))
      goto LABEL_47;
  }
  archivedIntent = self->_archivedIntent;
  if ((unint64_t)archivedIntent | *((_QWORD *)v4 + 7))
  {
    if (!-[NSData isEqual:](archivedIntent, "isEqual:"))
      goto LABEL_47;
  }
  archivedMetadata = self->_archivedMetadata;
  if ((unint64_t)archivedMetadata | *((_QWORD *)v4 + 9))
  {
    if (!-[NSData isEqual:](archivedMetadata, "isEqual:"))
      goto LABEL_47;
  }
  sourceIdentifier = self->_sourceIdentifier;
  if ((unint64_t)sourceIdentifier | *((_QWORD *)v4 + 12))
  {
    if (!-[NSString isEqual:](sourceIdentifier, "isEqual:"))
      goto LABEL_47;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 128) & 1) == 0 || self->_confidenceLevel != *((_QWORD *)v4 + 1))
      goto LABEL_47;
  }
  else if ((*((_BYTE *)v4 + 128) & 1) != 0)
  {
    goto LABEL_47;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 128) & 8) == 0 || self->_relevanceScore != *((double *)v4 + 4))
      goto LABEL_47;
  }
  else if ((*((_BYTE *)v4 + 128) & 8) != 0)
  {
    goto LABEL_47;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 128) & 0x10) == 0 || self->_startDate != *((double *)v4 + 5))
      goto LABEL_47;
  }
  else if ((*((_BYTE *)v4 + 128) & 0x10) != 0)
  {
    goto LABEL_47;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 128) & 2) == 0 || self->_endDate != *((double *)v4 + 2))
      goto LABEL_47;
  }
  else if ((*((_BYTE *)v4 + 128) & 2) != 0)
  {
    goto LABEL_47;
  }
  criterion = self->_criterion;
  if ((unint64_t)criterion | *((_QWORD *)v4 + 11) && !-[NSString isEqual:](criterion, "isEqual:"))
    goto LABEL_47;
  archivedIntentDescription = self->_archivedIntentDescription;
  if ((unint64_t)archivedIntentDescription | *((_QWORD *)v4 + 8))
    v15 = -[NSData isEqual:](archivedIntentDescription, "isEqual:");
  else
    v15 = 1;
LABEL_48:

  return v15;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;
  NSUInteger v6;
  char has;
  uint64_t v8;
  double relevanceScore;
  double v10;
  long double v11;
  double v12;
  unint64_t v13;
  unint64_t v14;
  double startDate;
  double v16;
  long double v17;
  double v18;
  unint64_t v19;
  double endDate;
  double v21;
  long double v22;
  double v23;
  NSUInteger v24;
  NSUInteger v25;
  NSUInteger v27;
  uint64_t v28;
  NSUInteger v29;
  NSUInteger v30;
  NSUInteger v31;

  v31 = -[NSString hash](self->_appBundleIdentifier, "hash");
  v30 = -[NSString hash](self->_widgetBundleIdentifier, "hash");
  v29 = -[NSString hash](self->_widgetKind, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
    v28 = 2654435761 * self->_layouts;
  else
    v28 = 0;
  v27 = -[NSString hash](self->_suggestionIdentifier, "hash");
  v3 = -[NSString hash](self->_clientModelId, "hash");
  v4 = -[NSData hash](self->_archivedIntent, "hash");
  v5 = -[NSData hash](self->_archivedMetadata, "hash");
  v6 = -[NSString hash](self->_sourceIdentifier, "hash");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v8 = 2654435761 * self->_confidenceLevel;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_6;
LABEL_11:
    v13 = 0;
    goto LABEL_14;
  }
  v8 = 0;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_11;
LABEL_6:
  relevanceScore = self->_relevanceScore;
  v10 = -relevanceScore;
  if (relevanceScore >= 0.0)
    v10 = self->_relevanceScore;
  v11 = floor(v10 + 0.5);
  v12 = (v10 - v11) * 1.84467441e19;
  v13 = 2654435761u * (unint64_t)fmod(v11, 1.84467441e19);
  if (v12 >= 0.0)
  {
    if (v12 > 0.0)
      v13 += (unint64_t)v12;
  }
  else
  {
    v13 -= (unint64_t)fabs(v12);
  }
LABEL_14:
  if ((has & 0x10) != 0)
  {
    startDate = self->_startDate;
    v16 = -startDate;
    if (startDate >= 0.0)
      v16 = self->_startDate;
    v17 = floor(v16 + 0.5);
    v18 = (v16 - v17) * 1.84467441e19;
    v14 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0)
        v14 += (unint64_t)v18;
    }
    else
    {
      v14 -= (unint64_t)fabs(v18);
    }
  }
  else
  {
    v14 = 0;
  }
  if ((has & 2) != 0)
  {
    endDate = self->_endDate;
    v21 = -endDate;
    if (endDate >= 0.0)
      v21 = self->_endDate;
    v22 = floor(v21 + 0.5);
    v23 = (v21 - v22) * 1.84467441e19;
    v19 = 2654435761u * (unint64_t)fmod(v22, 1.84467441e19);
    if (v23 >= 0.0)
    {
      if (v23 > 0.0)
        v19 += (unint64_t)v23;
    }
    else
    {
      v19 -= (unint64_t)fabs(v23);
    }
  }
  else
  {
    v19 = 0;
  }
  v24 = v30 ^ v31 ^ v29 ^ v28 ^ v27 ^ v3 ^ v4 ^ v5 ^ v6 ^ v8 ^ v13;
  v25 = v14 ^ v19 ^ -[NSString hash](self->_criterion, "hash");
  return v24 ^ v25 ^ -[NSData hash](self->_archivedIntentDescription, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  v6 = v4;
  if (*((_QWORD *)v4 + 6))
  {
    -[ATXPBInfoSuggestion setAppBundleIdentifier:](self, "setAppBundleIdentifier:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 14))
  {
    -[ATXPBInfoSuggestion setWidgetBundleIdentifier:](self, "setWidgetBundleIdentifier:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 15))
  {
    -[ATXPBInfoSuggestion setWidgetKind:](self, "setWidgetKind:");
    v4 = v6;
  }
  if ((*((_BYTE *)v4 + 128) & 4) != 0)
  {
    self->_layouts = *((_QWORD *)v4 + 3);
    *(_BYTE *)&self->_has |= 4u;
  }
  if (*((_QWORD *)v4 + 13))
  {
    -[ATXPBInfoSuggestion setSuggestionIdentifier:](self, "setSuggestionIdentifier:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 10))
  {
    -[ATXPBInfoSuggestion setClientModelId:](self, "setClientModelId:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 7))
  {
    -[ATXPBInfoSuggestion setArchivedIntent:](self, "setArchivedIntent:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 9))
  {
    -[ATXPBInfoSuggestion setArchivedMetadata:](self, "setArchivedMetadata:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 12))
  {
    -[ATXPBInfoSuggestion setSourceIdentifier:](self, "setSourceIdentifier:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 128);
  if ((v5 & 1) != 0)
  {
    self->_confidenceLevel = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)v4 + 128);
    if ((v5 & 8) == 0)
    {
LABEL_21:
      if ((v5 & 0x10) == 0)
        goto LABEL_22;
      goto LABEL_31;
    }
  }
  else if ((*((_BYTE *)v4 + 128) & 8) == 0)
  {
    goto LABEL_21;
  }
  self->_relevanceScore = *((double *)v4 + 4);
  *(_BYTE *)&self->_has |= 8u;
  v5 = *((_BYTE *)v4 + 128);
  if ((v5 & 0x10) == 0)
  {
LABEL_22:
    if ((v5 & 2) == 0)
      goto LABEL_24;
    goto LABEL_23;
  }
LABEL_31:
  self->_startDate = *((double *)v4 + 5);
  *(_BYTE *)&self->_has |= 0x10u;
  if ((*((_BYTE *)v4 + 128) & 2) != 0)
  {
LABEL_23:
    self->_endDate = *((double *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
  }
LABEL_24:
  if (*((_QWORD *)v4 + 11))
  {
    -[ATXPBInfoSuggestion setCriterion:](self, "setCriterion:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 8))
  {
    -[ATXPBInfoSuggestion setArchivedIntentDescription:](self, "setArchivedIntentDescription:");
    v4 = v6;
  }

}

- (void)setAppBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_appBundleIdentifier, a3);
}

- (void)setWidgetBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_widgetBundleIdentifier, a3);
}

- (void)setWidgetKind:(id)a3
{
  objc_storeStrong((id *)&self->_widgetKind, a3);
}

- (void)setSuggestionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionIdentifier, a3);
}

- (void)setClientModelId:(id)a3
{
  objc_storeStrong((id *)&self->_clientModelId, a3);
}

- (void)setArchivedIntent:(id)a3
{
  objc_storeStrong((id *)&self->_archivedIntent, a3);
}

- (void)setArchivedMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_archivedMetadata, a3);
}

- (void)setSourceIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_sourceIdentifier, a3);
}

- (void)setCriterion:(id)a3
{
  objc_storeStrong((id *)&self->_criterion, a3);
}

- (NSData)archivedIntentDescription
{
  return self->_archivedIntentDescription;
}

- (void)setArchivedIntentDescription:(id)a3
{
  objc_storeStrong((id *)&self->_archivedIntentDescription, a3);
}

@end
