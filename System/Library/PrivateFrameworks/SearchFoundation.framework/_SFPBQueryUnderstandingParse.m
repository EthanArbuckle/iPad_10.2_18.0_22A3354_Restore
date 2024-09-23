@implementation _SFPBQueryUnderstandingParse

- (_SFPBQueryUnderstandingParse)initWithFacade:(id)a3
{
  id v4;
  _SFPBQueryUnderstandingParse *v5;
  _SFPBQueryUnderstandingParse *v6;

  v4 = a3;
  v5 = -[_SFPBQueryUnderstandingParse init](self, "init");
  if (v5)
  {
    if (objc_msgSend(v4, "hasQueryIntentType"))
      -[_SFPBQueryUnderstandingParse setQueryIntentType:](v5, "setQueryIntentType:", objc_msgSend(v4, "queryIntentType"));
    if (objc_msgSend(v4, "hasHasUnspecifiedTokens"))
      -[_SFPBQueryUnderstandingParse setHasUnspecifiedTokens:](v5, "setHasUnspecifiedTokens:", objc_msgSend(v4, "hasUnspecifiedTokens"));
    if (objc_msgSend(v4, "hasHasSortCriteriaTokens"))
      -[_SFPBQueryUnderstandingParse setHasSortCriteriaTokens:](v5, "setHasSortCriteriaTokens:", objc_msgSend(v4, "hasSortCriteriaTokens"));
    if (objc_msgSend(v4, "hasHasLocationTokens"))
      -[_SFPBQueryUnderstandingParse setHasLocationTokens:](v5, "setHasLocationTokens:", objc_msgSend(v4, "hasLocationTokens"));
    if (objc_msgSend(v4, "hasHasActionTokens"))
      -[_SFPBQueryUnderstandingParse setHasActionTokens:](v5, "setHasActionTokens:", objc_msgSend(v4, "hasActionTokens"));
    if (objc_msgSend(v4, "hasHasMediaTypeTokens"))
      -[_SFPBQueryUnderstandingParse setHasMediaTypeTokens:](v5, "setHasMediaTypeTokens:", objc_msgSend(v4, "hasMediaTypeTokens"));
    if (objc_msgSend(v4, "hasHasVisualQualityTokens"))
      -[_SFPBQueryUnderstandingParse setHasVisualQualityTokens:](v5, "setHasVisualQualityTokens:", objc_msgSend(v4, "hasVisualQualityTokens"));
    if (objc_msgSend(v4, "hasHasNounTokens"))
      -[_SFPBQueryUnderstandingParse setHasNounTokens:](v5, "setHasNounTokens:", objc_msgSend(v4, "hasNounTokens"));
    if (objc_msgSend(v4, "hasHasTimeTokens"))
      -[_SFPBQueryUnderstandingParse setHasTimeTokens:](v5, "setHasTimeTokens:", objc_msgSend(v4, "hasTimeTokens"));
    if (objc_msgSend(v4, "hasHasEventTokens"))
      -[_SFPBQueryUnderstandingParse setHasEventTokens:](v5, "setHasEventTokens:", objc_msgSend(v4, "hasEventTokens"));
    if (objc_msgSend(v4, "hasHasGenericLocationTokens"))
      -[_SFPBQueryUnderstandingParse setHasGenericLocationTokens:](v5, "setHasGenericLocationTokens:", objc_msgSend(v4, "hasGenericLocationTokens"));
    if (objc_msgSend(v4, "hasHasCaptureDeviceTokens"))
      -[_SFPBQueryUnderstandingParse setHasCaptureDeviceTokens:](v5, "setHasCaptureDeviceTokens:", objc_msgSend(v4, "hasCaptureDeviceTokens"));
    if (objc_msgSend(v4, "hasHasFavoritedTokens"))
      -[_SFPBQueryUnderstandingParse setHasFavoritedTokens:](v5, "setHasFavoritedTokens:", objc_msgSend(v4, "hasFavoritedTokens"));
    if (objc_msgSend(v4, "hasHasSourceAppTokens"))
      -[_SFPBQueryUnderstandingParse setHasSourceAppTokens:](v5, "setHasSourceAppTokens:", objc_msgSend(v4, "hasSourceAppTokens"));
    if (objc_msgSend(v4, "hasHasPersonTokens"))
      -[_SFPBQueryUnderstandingParse setHasPersonTokens:](v5, "setHasPersonTokens:", objc_msgSend(v4, "hasPersonTokens"));
    if (objc_msgSend(v4, "hasHasPersonSenderTokens"))
      -[_SFPBQueryUnderstandingParse setHasPersonSenderTokens:](v5, "setHasPersonSenderTokens:", objc_msgSend(v4, "hasPersonSenderTokens"));
    if (objc_msgSend(v4, "hasSpotlightQueryIntent"))
      -[_SFPBQueryUnderstandingParse setSpotlightQueryIntent:](v5, "setSpotlightQueryIntent:", objc_msgSend(v4, "spotlightQueryIntent"));
    if (objc_msgSend(v4, "hasIsUnsafeQuery"))
      -[_SFPBQueryUnderstandingParse setIsUnsafeQuery:](v5, "setIsUnsafeQuery:", objc_msgSend(v4, "isUnsafeQuery"));
    if (objc_msgSend(v4, "hasIsBlocklistedQuery"))
      -[_SFPBQueryUnderstandingParse setIsBlocklistedQuery:](v5, "setIsBlocklistedQuery:", objc_msgSend(v4, "isBlocklistedQuery"));
    v6 = v5;
  }

  return v5;
}

- (void)setQueryIntentType:(int)a3
{
  self->_queryIntentType = a3;
}

- (void)setHasUnspecifiedTokens:(BOOL)a3
{
  self->_hasUnspecifiedTokens = a3;
}

- (void)setHasSortCriteriaTokens:(BOOL)a3
{
  self->_hasSortCriteriaTokens = a3;
}

- (void)setHasLocationTokens:(BOOL)a3
{
  self->_hasLocationTokens = a3;
}

- (void)setHasActionTokens:(BOOL)a3
{
  self->_hasActionTokens = a3;
}

- (void)setHasMediaTypeTokens:(BOOL)a3
{
  self->_hasMediaTypeTokens = a3;
}

- (void)setHasVisualQualityTokens:(BOOL)a3
{
  self->_hasVisualQualityTokens = a3;
}

- (void)setHasNounTokens:(BOOL)a3
{
  self->_hasNounTokens = a3;
}

- (void)setHasTimeTokens:(BOOL)a3
{
  self->_hasTimeTokens = a3;
}

- (void)setHasEventTokens:(BOOL)a3
{
  self->_hasEventTokens = a3;
}

- (void)setHasGenericLocationTokens:(BOOL)a3
{
  self->_hasGenericLocationTokens = a3;
}

- (void)setHasCaptureDeviceTokens:(BOOL)a3
{
  self->_hasCaptureDeviceTokens = a3;
}

- (void)setHasFavoritedTokens:(BOOL)a3
{
  self->_hasFavoritedTokens = a3;
}

- (void)setHasSourceAppTokens:(BOOL)a3
{
  self->_hasSourceAppTokens = a3;
}

- (void)setHasPersonTokens:(BOOL)a3
{
  self->_hasPersonTokens = a3;
}

- (void)setHasPersonSenderTokens:(BOOL)a3
{
  self->_hasPersonSenderTokens = a3;
}

- (void)setSpotlightQueryIntent:(int)a3
{
  self->_spotlightQueryIntent = a3;
}

- (void)setIsUnsafeQuery:(BOOL)a3
{
  self->_isUnsafeQuery = a3;
}

- (void)setIsBlocklistedQuery:(BOOL)a3
{
  self->_isBlocklistedQuery = a3;
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBQueryUnderstandingParseReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (-[_SFPBQueryUnderstandingParse queryIntentType](self, "queryIntentType"))
    PBDataWriterWriteInt32Field();
  if (-[_SFPBQueryUnderstandingParse hasUnspecifiedTokens](self, "hasUnspecifiedTokens"))
    PBDataWriterWriteBOOLField();
  if (-[_SFPBQueryUnderstandingParse hasSortCriteriaTokens](self, "hasSortCriteriaTokens"))
    PBDataWriterWriteBOOLField();
  if (-[_SFPBQueryUnderstandingParse hasLocationTokens](self, "hasLocationTokens"))
    PBDataWriterWriteBOOLField();
  if (-[_SFPBQueryUnderstandingParse hasActionTokens](self, "hasActionTokens"))
    PBDataWriterWriteBOOLField();
  if (-[_SFPBQueryUnderstandingParse hasMediaTypeTokens](self, "hasMediaTypeTokens"))
    PBDataWriterWriteBOOLField();
  if (-[_SFPBQueryUnderstandingParse hasVisualQualityTokens](self, "hasVisualQualityTokens"))
    PBDataWriterWriteBOOLField();
  if (-[_SFPBQueryUnderstandingParse hasNounTokens](self, "hasNounTokens"))
    PBDataWriterWriteBOOLField();
  if (-[_SFPBQueryUnderstandingParse hasTimeTokens](self, "hasTimeTokens"))
    PBDataWriterWriteBOOLField();
  if (-[_SFPBQueryUnderstandingParse hasEventTokens](self, "hasEventTokens"))
    PBDataWriterWriteBOOLField();
  if (-[_SFPBQueryUnderstandingParse hasGenericLocationTokens](self, "hasGenericLocationTokens"))
    PBDataWriterWriteBOOLField();
  if (-[_SFPBQueryUnderstandingParse hasCaptureDeviceTokens](self, "hasCaptureDeviceTokens"))
    PBDataWriterWriteBOOLField();
  if (-[_SFPBQueryUnderstandingParse hasFavoritedTokens](self, "hasFavoritedTokens"))
    PBDataWriterWriteBOOLField();
  if (-[_SFPBQueryUnderstandingParse hasSourceAppTokens](self, "hasSourceAppTokens"))
    PBDataWriterWriteBOOLField();
  if (-[_SFPBQueryUnderstandingParse hasPersonTokens](self, "hasPersonTokens"))
    PBDataWriterWriteBOOLField();
  if (-[_SFPBQueryUnderstandingParse hasPersonSenderTokens](self, "hasPersonSenderTokens"))
    PBDataWriterWriteBOOLField();
  if (-[_SFPBQueryUnderstandingParse spotlightQueryIntent](self, "spotlightQueryIntent"))
    PBDataWriterWriteInt32Field();
  if (-[_SFPBQueryUnderstandingParse isUnsafeQuery](self, "isUnsafeQuery"))
    PBDataWriterWriteBOOLField();
  if (-[_SFPBQueryUnderstandingParse isBlocklistedQuery](self, "isBlocklistedQuery"))
    PBDataWriterWriteBOOLField();

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int queryIntentType;
  int hasUnspecifiedTokens;
  int hasSortCriteriaTokens;
  int hasLocationTokens;
  int hasActionTokens;
  int hasMediaTypeTokens;
  int hasVisualQualityTokens;
  int hasNounTokens;
  int hasTimeTokens;
  int hasEventTokens;
  int hasGenericLocationTokens;
  int hasCaptureDeviceTokens;
  int hasFavoritedTokens;
  int hasSourceAppTokens;
  int hasPersonTokens;
  int hasPersonSenderTokens;
  int spotlightQueryIntent;
  int isUnsafeQuery;
  int isBlocklistedQuery;
  BOOL v24;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_21;
  queryIntentType = self->_queryIntentType;
  if (queryIntentType != objc_msgSend(v4, "queryIntentType"))
    goto LABEL_21;
  hasUnspecifiedTokens = self->_hasUnspecifiedTokens;
  if (hasUnspecifiedTokens != objc_msgSend(v4, "hasUnspecifiedTokens"))
    goto LABEL_21;
  hasSortCriteriaTokens = self->_hasSortCriteriaTokens;
  if (hasSortCriteriaTokens != objc_msgSend(v4, "hasSortCriteriaTokens"))
    goto LABEL_21;
  hasLocationTokens = self->_hasLocationTokens;
  if (hasLocationTokens != objc_msgSend(v4, "hasLocationTokens"))
    goto LABEL_21;
  hasActionTokens = self->_hasActionTokens;
  if (hasActionTokens != objc_msgSend(v4, "hasActionTokens"))
    goto LABEL_21;
  hasMediaTypeTokens = self->_hasMediaTypeTokens;
  if (hasMediaTypeTokens != objc_msgSend(v4, "hasMediaTypeTokens"))
    goto LABEL_21;
  hasVisualQualityTokens = self->_hasVisualQualityTokens;
  if (hasVisualQualityTokens != objc_msgSend(v4, "hasVisualQualityTokens"))
    goto LABEL_21;
  hasNounTokens = self->_hasNounTokens;
  if (hasNounTokens != objc_msgSend(v4, "hasNounTokens"))
    goto LABEL_21;
  hasTimeTokens = self->_hasTimeTokens;
  if (hasTimeTokens != objc_msgSend(v4, "hasTimeTokens"))
    goto LABEL_21;
  hasEventTokens = self->_hasEventTokens;
  if (hasEventTokens != objc_msgSend(v4, "hasEventTokens"))
    goto LABEL_21;
  hasGenericLocationTokens = self->_hasGenericLocationTokens;
  if (hasGenericLocationTokens != objc_msgSend(v4, "hasGenericLocationTokens"))
    goto LABEL_21;
  hasCaptureDeviceTokens = self->_hasCaptureDeviceTokens;
  if (hasCaptureDeviceTokens == objc_msgSend(v4, "hasCaptureDeviceTokens")
    && (hasFavoritedTokens = self->_hasFavoritedTokens,
        hasFavoritedTokens == objc_msgSend(v4, "hasFavoritedTokens"))
    && (hasSourceAppTokens = self->_hasSourceAppTokens,
        hasSourceAppTokens == objc_msgSend(v4, "hasSourceAppTokens"))
    && (hasPersonTokens = self->_hasPersonTokens, hasPersonTokens == objc_msgSend(v4, "hasPersonTokens"))
    && (hasPersonSenderTokens = self->_hasPersonSenderTokens,
        hasPersonSenderTokens == objc_msgSend(v4, "hasPersonSenderTokens"))
    && (spotlightQueryIntent = self->_spotlightQueryIntent,
        spotlightQueryIntent == objc_msgSend(v4, "spotlightQueryIntent"))
    && (isUnsafeQuery = self->_isUnsafeQuery, isUnsafeQuery == objc_msgSend(v4, "isUnsafeQuery")))
  {
    isBlocklistedQuery = self->_isBlocklistedQuery;
    v24 = isBlocklistedQuery == objc_msgSend(v4, "isBlocklistedQuery");
  }
  else
  {
LABEL_21:
    v24 = 0;
  }

  return v24;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v2 = 2654435761;
  if (self->_hasUnspecifiedTokens)
    v3 = 2654435761;
  else
    v3 = 0;
  if (self->_hasSortCriteriaTokens)
    v4 = 2654435761;
  else
    v4 = 0;
  if (self->_hasLocationTokens)
    v5 = 2654435761;
  else
    v5 = 0;
  if (self->_hasActionTokens)
    v6 = 2654435761;
  else
    v6 = 0;
  if (self->_hasMediaTypeTokens)
    v7 = 2654435761;
  else
    v7 = 0;
  if (self->_hasVisualQualityTokens)
    v8 = 2654435761;
  else
    v8 = 0;
  if (self->_hasNounTokens)
    v9 = 2654435761;
  else
    v9 = 0;
  if (self->_hasTimeTokens)
    v10 = 2654435761;
  else
    v10 = 0;
  if (self->_hasEventTokens)
    v11 = 2654435761;
  else
    v11 = 0;
  if (self->_hasGenericLocationTokens)
    v12 = 2654435761;
  else
    v12 = 0;
  if (self->_hasCaptureDeviceTokens)
    v13 = 2654435761;
  else
    v13 = 0;
  if (self->_hasFavoritedTokens)
    v14 = 2654435761;
  else
    v14 = 0;
  if (self->_hasSourceAppTokens)
    v15 = 2654435761;
  else
    v15 = 0;
  if (self->_hasPersonTokens)
    v16 = 2654435761;
  else
    v16 = 0;
  if (self->_hasPersonSenderTokens)
    v17 = 2654435761;
  else
    v17 = 0;
  if (self->_isUnsafeQuery)
    v18 = 2654435761;
  else
    v18 = 0;
  if (!self->_isBlocklistedQuery)
    v2 = 0;
  return v3 ^ v4 ^ v5 ^ v6 ^ (2654435761 * self->_queryIntentType) ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ (2654435761 * self->_spotlightQueryIntent) ^ v18 ^ v2;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_hasActionTokens)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBQueryUnderstandingParse hasActionTokens](self, "hasActionTokens"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("hasActionTokens"));

  }
  if (self->_hasCaptureDeviceTokens)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBQueryUnderstandingParse hasCaptureDeviceTokens](self, "hasCaptureDeviceTokens"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("hasCaptureDeviceTokens"));

  }
  if (self->_hasEventTokens)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBQueryUnderstandingParse hasEventTokens](self, "hasEventTokens"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("hasEventTokens"));

  }
  if (self->_hasFavoritedTokens)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBQueryUnderstandingParse hasFavoritedTokens](self, "hasFavoritedTokens"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("hasFavoritedTokens"));

  }
  if (self->_hasGenericLocationTokens)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBQueryUnderstandingParse hasGenericLocationTokens](self, "hasGenericLocationTokens"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("hasGenericLocationTokens"));

  }
  if (self->_hasLocationTokens)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBQueryUnderstandingParse hasLocationTokens](self, "hasLocationTokens"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("hasLocationTokens"));

  }
  if (self->_hasMediaTypeTokens)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBQueryUnderstandingParse hasMediaTypeTokens](self, "hasMediaTypeTokens"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("hasMediaTypeTokens"));

  }
  if (self->_hasNounTokens)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBQueryUnderstandingParse hasNounTokens](self, "hasNounTokens"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("hasNounTokens"));

  }
  if (self->_hasPersonSenderTokens)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBQueryUnderstandingParse hasPersonSenderTokens](self, "hasPersonSenderTokens"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("hasPersonSenderTokens"));

  }
  if (self->_hasPersonTokens)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBQueryUnderstandingParse hasPersonTokens](self, "hasPersonTokens"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("hasPersonTokens"));

  }
  if (self->_hasSortCriteriaTokens)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBQueryUnderstandingParse hasSortCriteriaTokens](self, "hasSortCriteriaTokens"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("hasSortCriteriaTokens"));

  }
  if (self->_hasSourceAppTokens)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBQueryUnderstandingParse hasSourceAppTokens](self, "hasSourceAppTokens"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("hasSourceAppTokens"));

  }
  if (self->_hasTimeTokens)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBQueryUnderstandingParse hasTimeTokens](self, "hasTimeTokens"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("hasTimeTokens"));

  }
  if (self->_hasUnspecifiedTokens)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBQueryUnderstandingParse hasUnspecifiedTokens](self, "hasUnspecifiedTokens"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("hasUnspecifiedTokens"));

  }
  if (self->_hasVisualQualityTokens)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBQueryUnderstandingParse hasVisualQualityTokens](self, "hasVisualQualityTokens"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("hasVisualQualityTokens"));

  }
  if (self->_isBlocklistedQuery)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBQueryUnderstandingParse isBlocklistedQuery](self, "isBlocklistedQuery"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("isBlocklistedQuery"));

  }
  if (self->_isUnsafeQuery)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBQueryUnderstandingParse isUnsafeQuery](self, "isUnsafeQuery"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("isUnsafeQuery"));

  }
  if (self->_queryIntentType)
  {
    v21 = -[_SFPBQueryUnderstandingParse queryIntentType](self, "queryIntentType");
    if (v21 >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = *(&off_1E4042190 + v21);
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("queryIntentType"));

  }
  if (self->_spotlightQueryIntent)
  {
    v23 = -[_SFPBQueryUnderstandingParse spotlightQueryIntent](self, "spotlightQueryIntent");
    if (v23 >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v24 = *(&off_1E4042078 + v23);
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("spotlightQueryIntent"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBQueryUnderstandingParse dictionaryRepresentation](self, "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", v2))
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v2, 0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (_SFPBQueryUnderstandingParse)initWithJSON:(id)a3
{
  void *v4;
  _SFPBQueryUnderstandingParse *v5;
  uint64_t v7;

  v7 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", a3, 0, &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = -[_SFPBQueryUnderstandingParse initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBQueryUnderstandingParse)initWithDictionary:(id)a3
{
  id v4;
  _SFPBQueryUnderstandingParse *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _SFPBQueryUnderstandingParse *v30;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  objc_super v44;

  v4 = a3;
  v44.receiver = self;
  v44.super_class = (Class)_SFPBQueryUnderstandingParse;
  v5 = -[_SFPBQueryUnderstandingParse init](&v44, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("queryIntentType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBQueryUnderstandingParse setQueryIntentType:](v5, "setQueryIntentType:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasUnspecifiedTokens"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBQueryUnderstandingParse setHasUnspecifiedTokens:](v5, "setHasUnspecifiedTokens:", objc_msgSend(v7, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasSortCriteriaTokens"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBQueryUnderstandingParse setHasSortCriteriaTokens:](v5, "setHasSortCriteriaTokens:", objc_msgSend(v8, "BOOLValue"));
    v33 = v8;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasLocationTokens"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBQueryUnderstandingParse setHasLocationTokens:](v5, "setHasLocationTokens:", objc_msgSend(v9, "BOOLValue"));
    v37 = v9;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasActionTokens"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBQueryUnderstandingParse setHasActionTokens:](v5, "setHasActionTokens:", objc_msgSend(v10, "BOOLValue"));
    v11 = v7;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasMediaTypeTokens"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBQueryUnderstandingParse setHasMediaTypeTokens:](v5, "setHasMediaTypeTokens:", objc_msgSend(v12, "BOOLValue"));
    v13 = v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasVisualQualityTokens"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBQueryUnderstandingParse setHasVisualQualityTokens:](v5, "setHasVisualQualityTokens:", objc_msgSend(v14, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasNounTokens"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v43 = v15;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBQueryUnderstandingParse setHasNounTokens:](v5, "setHasNounTokens:", objc_msgSend(v15, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasTimeTokens"));
    v16 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v42 = (void *)v16;
    v17 = v13;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBQueryUnderstandingParse setHasTimeTokens:](v5, "setHasTimeTokens:", objc_msgSend(v42, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasEventTokens"));
    v18 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v41 = (void *)v18;
    v19 = v11;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBQueryUnderstandingParse setHasEventTokens:](v5, "setHasEventTokens:", objc_msgSend(v41, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasGenericLocationTokens"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBQueryUnderstandingParse setHasGenericLocationTokens:](v5, "setHasGenericLocationTokens:", objc_msgSend(v20, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasCaptureDeviceTokens"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v40 = v21;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBQueryUnderstandingParse setHasCaptureDeviceTokens:](v5, "setHasCaptureDeviceTokens:", objc_msgSend(v21, "BOOLValue"));
    v36 = v10;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasFavoritedTokens"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBQueryUnderstandingParse setHasFavoritedTokens:](v5, "setHasFavoritedTokens:", objc_msgSend(v22, "BOOLValue"));
    v35 = v12;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasSourceAppTokens"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBQueryUnderstandingParse setHasSourceAppTokens:](v5, "setHasSourceAppTokens:", objc_msgSend(v23, "BOOLValue"));
    v34 = v14;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasPersonTokens"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBQueryUnderstandingParse setHasPersonTokens:](v5, "setHasPersonTokens:", objc_msgSend(v24, "BOOLValue"));
    v39 = v17;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasPersonSenderTokens"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBQueryUnderstandingParse setHasPersonSenderTokens:](v5, "setHasPersonSenderTokens:", objc_msgSend(v25, "BOOLValue"));
    v38 = v19;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("spotlightQueryIntent"), v22);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBQueryUnderstandingParse setSpotlightQueryIntent:](v5, "setSpotlightQueryIntent:", objc_msgSend(v26, "intValue"));
    v27 = v20;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isUnsafeQuery"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBQueryUnderstandingParse setIsUnsafeQuery:](v5, "setIsUnsafeQuery:", objc_msgSend(v28, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isBlocklistedQuery"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBQueryUnderstandingParse setIsBlocklistedQuery:](v5, "setIsBlocklistedQuery:", objc_msgSend(v29, "BOOLValue"));
    v30 = v5;

  }
  return v5;
}

- (int)queryIntentType
{
  return self->_queryIntentType;
}

- (BOOL)hasUnspecifiedTokens
{
  return self->_hasUnspecifiedTokens;
}

- (BOOL)hasSortCriteriaTokens
{
  return self->_hasSortCriteriaTokens;
}

- (BOOL)hasLocationTokens
{
  return self->_hasLocationTokens;
}

- (BOOL)hasActionTokens
{
  return self->_hasActionTokens;
}

- (BOOL)hasMediaTypeTokens
{
  return self->_hasMediaTypeTokens;
}

- (BOOL)hasVisualQualityTokens
{
  return self->_hasVisualQualityTokens;
}

- (BOOL)hasNounTokens
{
  return self->_hasNounTokens;
}

- (BOOL)hasTimeTokens
{
  return self->_hasTimeTokens;
}

- (BOOL)hasEventTokens
{
  return self->_hasEventTokens;
}

- (BOOL)hasGenericLocationTokens
{
  return self->_hasGenericLocationTokens;
}

- (BOOL)hasCaptureDeviceTokens
{
  return self->_hasCaptureDeviceTokens;
}

- (BOOL)hasFavoritedTokens
{
  return self->_hasFavoritedTokens;
}

- (BOOL)hasSourceAppTokens
{
  return self->_hasSourceAppTokens;
}

- (BOOL)hasPersonTokens
{
  return self->_hasPersonTokens;
}

- (BOOL)hasPersonSenderTokens
{
  return self->_hasPersonSenderTokens;
}

- (int)spotlightQueryIntent
{
  return self->_spotlightQueryIntent;
}

- (BOOL)isUnsafeQuery
{
  return self->_isUnsafeQuery;
}

- (BOOL)isBlocklistedQuery
{
  return self->_isBlocklistedQuery;
}

@end
