@implementation PPRankableSocialHighlight

- (BOOL)hasHighlightIdentifier
{
  return self->_highlightIdentifier != 0;
}

- (int)highlightType
{
  if ((*(_WORD *)&self->_has & 0x40) != 0)
    return self->_highlightType;
  else
    return 0;
}

- (void)setHighlightType:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_highlightType = a3;
}

- (void)setHasHighlightType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasHighlightType
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (id)highlightTypeAsString:(int)a3
{
  if (a3 < 4)
    return off_1E7E15558[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsHighlightType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Unknown")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Automatic")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Starred")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ManualAndAutomatic")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setSyndicationSecondsSinceReferenceDate:(double)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_syndicationSecondsSinceReferenceDate = a3;
}

- (void)setHasSyndicationSecondsSinceReferenceDate:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasSyndicationSecondsSinceReferenceDate
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (BOOL)hasSourceBundleId
{
  return self->_sourceBundleId != 0;
}

- (void)clearApplicationIdentifiers
{
  -[NSMutableArray removeAllObjects](self->_applicationIdentifiers, "removeAllObjects");
}

- (void)addApplicationIdentifiers:(id)a3
{
  id v4;
  NSMutableArray *applicationIdentifiers;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  applicationIdentifiers = self->_applicationIdentifiers;
  v8 = v4;
  if (!applicationIdentifiers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_applicationIdentifiers;
    self->_applicationIdentifiers = v6;

    v4 = v8;
    applicationIdentifiers = self->_applicationIdentifiers;
  }
  -[NSMutableArray addObject:](applicationIdentifiers, "addObject:", v4);

}

- (unint64_t)applicationIdentifiersCount
{
  return -[NSMutableArray count](self->_applicationIdentifiers, "count");
}

- (id)applicationIdentifiersAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_applicationIdentifiers, "objectAtIndex:", a3);
}

- (BOOL)hasResourceUrl
{
  return self->_resourceUrl != 0;
}

- (BOOL)hasSender
{
  return self->_sender != 0;
}

- (BOOL)hasDomainIdentifier
{
  return self->_domainIdentifier != 0;
}

- (BOOL)hasBatchIdentifier
{
  return self->_batchIdentifier != 0;
}

- (void)clearCalculatedFeatures
{
  -[NSMutableArray removeAllObjects](self->_calculatedFeatures, "removeAllObjects");
}

- (void)addCalculatedFeatures:(id)a3
{
  id v4;
  NSMutableArray *calculatedFeatures;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  calculatedFeatures = self->_calculatedFeatures;
  v8 = v4;
  if (!calculatedFeatures)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_calculatedFeatures;
    self->_calculatedFeatures = v6;

    v4 = v8;
    calculatedFeatures = self->_calculatedFeatures;
  }
  -[NSMutableArray addObject:](calculatedFeatures, "addObject:", v4);

}

- (unint64_t)calculatedFeaturesCount
{
  return -[NSMutableArray count](self->_calculatedFeatures, "count");
}

- (id)calculatedFeaturesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_calculatedFeatures, "objectAtIndex:", a3);
}

- (BOOL)hasClientIdentifier
{
  return self->_clientIdentifier != 0;
}

- (void)setContentCreationSecondsSinceReferenceDate:(double)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_contentCreationSecondsSinceReferenceDate = a3;
}

- (void)setHasContentCreationSecondsSinceReferenceDate:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasContentCreationSecondsSinceReferenceDate
{
  return *(_WORD *)&self->_has & 1;
}

- (BOOL)hasGroupPhotoPathDigest
{
  return self->_groupPhotoPathDigest != 0;
}

- (BOOL)hasDisplayName
{
  return self->_displayName != 0;
}

- (void)setIsPrimary:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_isPrimary = a3;
}

- (void)setHasIsPrimary:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasIsPrimary
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (BOOL)hasAttributionIdentifier
{
  return self->_attributionIdentifier != 0;
}

- (void)setRank:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_rank = a3;
}

- (void)setHasRank:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasRank
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setScore:(double)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_score = a3;
}

- (void)setHasScore:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasScore
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setIsConversationAutoDonating:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_isConversationAutoDonating = a3;
}

- (void)setHasIsConversationAutoDonating:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasIsConversationAutoDonating
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (BOOL)hasOriginatingDeviceId
{
  return self->_originatingDeviceId != 0;
}

- (void)setRankingSecondsSinceReferenceDate:(double)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_rankingSecondsSinceReferenceDate = a3;
}

- (void)setHasRankingSecondsSinceReferenceDate:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasRankingSecondsSinceReferenceDate
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (BOOL)hasResolvedUrl
{
  return self->_resolvedUrl != 0;
}

- (BOOL)hasVariant
{
  return self->_variant != 0;
}

- (void)setIsTopKResult:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_isTopKResult = a3;
}

- (void)setHasIsTopKResult:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasIsTopKResult
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setTopKScore:(double)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_topKScore = a3;
}

- (void)setHasTopKScore:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasTopKScore
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setFirstPassScore:(double)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_firstPassScore = a3;
}

- (void)setHasFirstPassScore:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasFirstPassScore
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setIsCollaboration:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_isCollaboration = a3;
}

- (void)setHasIsCollaboration:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasIsCollaboration
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (BOOL)hasCollaborationIdentifier
{
  return self->_collaborationIdentifier != 0;
}

- (BOOL)hasContentType
{
  return self->_contentType != 0;
}

- (BOOL)hasContentDisplayName
{
  return self->_contentDisplayName != 0;
}

- (BOOL)hasFileProviderId
{
  return self->_fileProviderId != 0;
}

- (BOOL)hasLocalIdentity
{
  return self->_localIdentity != 0;
}

- (BOOL)hasLocalIdentityProof
{
  return self->_localIdentityProof != 0;
}

- (BOOL)hasHandleToIdentityMap
{
  return self->_handleToIdentityMap != 0;
}

- (void)setFromMeEntitlementOverrideIsPresent:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_fromMeEntitlementOverrideIsPresent = a3;
}

- (void)setHasFromMeEntitlementOverrideIsPresent:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasFromMeEntitlementOverrideIsPresent
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)PPRankableSocialHighlight;
  -[PPRankableSocialHighlight description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPRankableSocialHighlight dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *highlightIdentifier;
  __int16 has;
  uint64_t highlightType;
  __CFString *v8;
  void *v9;
  NSString *sourceBundleId;
  NSMutableArray *applicationIdentifiers;
  NSString *resourceUrl;
  PPSocialHighlightContact *sender;
  void *v14;
  NSString *domainIdentifier;
  NSString *batchIdentifier;
  void *v17;
  NSMutableArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  NSString *clientIdentifier;
  void *v25;
  NSString *groupPhotoPathDigest;
  NSString *displayName;
  void *v28;
  NSString *attributionIdentifier;
  __int16 v30;
  void *v31;
  NSString *originatingDeviceId;
  void *v33;
  NSString *resolvedUrl;
  NSString *variant;
  __int16 v36;
  void *v37;
  NSString *collaborationIdentifier;
  NSString *contentType;
  NSString *contentDisplayName;
  NSString *fileProviderId;
  NSData *localIdentity;
  NSData *localIdentityProof;
  NSData *handleToIdentityMap;
  void *v45;
  id v46;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  highlightIdentifier = self->_highlightIdentifier;
  if (highlightIdentifier)
    objc_msgSend(v3, "setObject:forKey:", highlightIdentifier, CFSTR("highlightIdentifier"));
  has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    highlightType = self->_highlightType;
    if (highlightType >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_highlightType);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = off_1E7E15558[highlightType];
    }
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("highlightType"));

    has = (__int16)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_syndicationSecondsSinceReferenceDate);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("syndicationSecondsSinceReferenceDate"));

  }
  sourceBundleId = self->_sourceBundleId;
  if (sourceBundleId)
    objc_msgSend(v4, "setObject:forKey:", sourceBundleId, CFSTR("sourceBundleId"));
  applicationIdentifiers = self->_applicationIdentifiers;
  if (applicationIdentifiers)
    objc_msgSend(v4, "setObject:forKey:", applicationIdentifiers, CFSTR("applicationIdentifiers"));
  resourceUrl = self->_resourceUrl;
  if (resourceUrl)
    objc_msgSend(v4, "setObject:forKey:", resourceUrl, CFSTR("resourceUrl"));
  sender = self->_sender;
  if (sender)
  {
    -[PPSocialHighlightContact dictionaryRepresentation](sender, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("sender"));

  }
  domainIdentifier = self->_domainIdentifier;
  if (domainIdentifier)
    objc_msgSend(v4, "setObject:forKey:", domainIdentifier, CFSTR("domainIdentifier"));
  batchIdentifier = self->_batchIdentifier;
  if (batchIdentifier)
    objc_msgSend(v4, "setObject:forKey:", batchIdentifier, CFSTR("batchIdentifier"));
  if (-[NSMutableArray count](self->_calculatedFeatures, "count"))
  {
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_calculatedFeatures, "count"));
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v18 = self->_calculatedFeatures;
    v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v53, v57, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v54;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v54 != v21)
            objc_enumerationMutation(v18);
          objc_msgSend(*(id *)(*((_QWORD *)&v53 + 1) + 8 * i), "dictionaryRepresentation");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "addObject:", v23);

        }
        v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v53, v57, 16);
      }
      while (v20);
    }

    objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("calculatedFeatures"));
  }
  clientIdentifier = self->_clientIdentifier;
  if (clientIdentifier)
    objc_msgSend(v4, "setObject:forKey:", clientIdentifier, CFSTR("clientIdentifier"));
  if ((*(_WORD *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_contentCreationSecondsSinceReferenceDate);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v25, CFSTR("contentCreationSecondsSinceReferenceDate"));

  }
  groupPhotoPathDigest = self->_groupPhotoPathDigest;
  if (groupPhotoPathDigest)
    objc_msgSend(v4, "setObject:forKey:", groupPhotoPathDigest, CFSTR("groupPhotoPathDigest"));
  displayName = self->_displayName;
  if (displayName)
    objc_msgSend(v4, "setObject:forKey:", displayName, CFSTR("displayName"));
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isPrimary);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v28, CFSTR("isPrimary"));

  }
  attributionIdentifier = self->_attributionIdentifier;
  if (attributionIdentifier)
    objc_msgSend(v4, "setObject:forKey:", attributionIdentifier, CFSTR("attributionIdentifier"));
  v30 = (__int16)self->_has;
  if ((v30 & 0x80) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_rank);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v48, CFSTR("rank"));

    v30 = (__int16)self->_has;
    if ((v30 & 8) == 0)
    {
LABEL_45:
      if ((v30 & 0x400) == 0)
        goto LABEL_47;
      goto LABEL_46;
    }
  }
  else if ((v30 & 8) == 0)
  {
    goto LABEL_45;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_score);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v49, CFSTR("score"));

  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_46:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isConversationAutoDonating);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v31, CFSTR("isConversationAutoDonating"));

  }
LABEL_47:
  originatingDeviceId = self->_originatingDeviceId;
  if (originatingDeviceId)
    objc_msgSend(v4, "setObject:forKey:", originatingDeviceId, CFSTR("originatingDeviceId"));
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_rankingSecondsSinceReferenceDate);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v33, CFSTR("rankingSecondsSinceReferenceDate"));

  }
  resolvedUrl = self->_resolvedUrl;
  if (resolvedUrl)
    objc_msgSend(v4, "setObject:forKey:", resolvedUrl, CFSTR("resolvedUrl"));
  variant = self->_variant;
  if (variant)
    objc_msgSend(v4, "setObject:forKey:", variant, CFSTR("variant"));
  v36 = (__int16)self->_has;
  if ((v36 & 0x1000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isTopKResult);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v50, CFSTR("isTopKResult"));

    v36 = (__int16)self->_has;
    if ((v36 & 0x20) == 0)
    {
LABEL_57:
      if ((v36 & 2) == 0)
        goto LABEL_58;
      goto LABEL_82;
    }
  }
  else if ((v36 & 0x20) == 0)
  {
    goto LABEL_57;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_topKScore);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v51, CFSTR("topKScore"));

  v36 = (__int16)self->_has;
  if ((v36 & 2) == 0)
  {
LABEL_58:
    if ((v36 & 0x200) == 0)
      goto LABEL_60;
    goto LABEL_59;
  }
LABEL_82:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_firstPassScore);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v52, CFSTR("firstPassScore"));

  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_59:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isCollaboration);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v37, CFSTR("isCollaboration"));

  }
LABEL_60:
  collaborationIdentifier = self->_collaborationIdentifier;
  if (collaborationIdentifier)
    objc_msgSend(v4, "setObject:forKey:", collaborationIdentifier, CFSTR("collaborationIdentifier"));
  contentType = self->_contentType;
  if (contentType)
    objc_msgSend(v4, "setObject:forKey:", contentType, CFSTR("contentType"));
  contentDisplayName = self->_contentDisplayName;
  if (contentDisplayName)
    objc_msgSend(v4, "setObject:forKey:", contentDisplayName, CFSTR("contentDisplayName"));
  fileProviderId = self->_fileProviderId;
  if (fileProviderId)
    objc_msgSend(v4, "setObject:forKey:", fileProviderId, CFSTR("fileProviderId"));
  localIdentity = self->_localIdentity;
  if (localIdentity)
    objc_msgSend(v4, "setObject:forKey:", localIdentity, CFSTR("localIdentity"));
  localIdentityProof = self->_localIdentityProof;
  if (localIdentityProof)
    objc_msgSend(v4, "setObject:forKey:", localIdentityProof, CFSTR("localIdentityProof"));
  handleToIdentityMap = self->_handleToIdentityMap;
  if (handleToIdentityMap)
    objc_msgSend(v4, "setObject:forKey:", handleToIdentityMap, CFSTR("handleToIdentityMap"));
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_fromMeEntitlementOverrideIsPresent);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v45, CFSTR("fromMeEntitlementOverrideIsPresent"));

  }
  v46 = v4;

  return v46;
}

- (BOOL)readFrom:(id)a3
{
  return PPRankableSocialHighlightReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  __int16 has;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  __int16 v16;
  __int16 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_highlightIdentifier)
    PBDataWriterWriteStringField();
  has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (__int16)self->_has;
  }
  if ((has & 0x10) != 0)
    PBDataWriterWriteDoubleField();
  if (self->_sourceBundleId)
    PBDataWriterWriteStringField();
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v6 = self->_applicationIdentifiers;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v23 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteStringField();
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v8);
  }

  if (self->_resourceUrl)
    PBDataWriterWriteStringField();
  if (self->_sender)
    PBDataWriterWriteSubmessage();
  if (self->_domainIdentifier)
    PBDataWriterWriteStringField();
  if (self->_batchIdentifier)
    PBDataWriterWriteStringField();
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v11 = self->_calculatedFeatures;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v19;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v11);
        PBDataWriterWriteSubmessage();
      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v13);
  }

  if (self->_clientIdentifier)
    PBDataWriterWriteStringField();
  if ((*(_WORD *)&self->_has & 1) != 0)
    PBDataWriterWriteDoubleField();
  if (self->_groupPhotoPathDigest)
    PBDataWriterWriteStringField();
  if (self->_displayName)
    PBDataWriterWriteStringField();
  if ((*(_WORD *)&self->_has & 0x800) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_attributionIdentifier)
    PBDataWriterWriteStringField();
  v16 = (__int16)self->_has;
  if ((v16 & 0x80) != 0)
  {
    PBDataWriterWriteUint32Field();
    v16 = (__int16)self->_has;
    if ((v16 & 8) == 0)
    {
LABEL_45:
      if ((v16 & 0x400) == 0)
        goto LABEL_47;
      goto LABEL_46;
    }
  }
  else if ((v16 & 8) == 0)
  {
    goto LABEL_45;
  }
  PBDataWriterWriteDoubleField();
  if ((*(_WORD *)&self->_has & 0x400) != 0)
LABEL_46:
    PBDataWriterWriteBOOLField();
LABEL_47:
  if (self->_originatingDeviceId)
    PBDataWriterWriteStringField();
  if ((*(_WORD *)&self->_has & 4) != 0)
    PBDataWriterWriteDoubleField();
  if (self->_resolvedUrl)
    PBDataWriterWriteStringField();
  if (self->_variant)
    PBDataWriterWriteStringField();
  v17 = (__int16)self->_has;
  if ((v17 & 0x1000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v17 = (__int16)self->_has;
    if ((v17 & 0x20) == 0)
    {
LABEL_57:
      if ((v17 & 2) == 0)
        goto LABEL_58;
      goto LABEL_82;
    }
  }
  else if ((v17 & 0x20) == 0)
  {
    goto LABEL_57;
  }
  PBDataWriterWriteDoubleField();
  v17 = (__int16)self->_has;
  if ((v17 & 2) == 0)
  {
LABEL_58:
    if ((v17 & 0x200) == 0)
      goto LABEL_60;
    goto LABEL_59;
  }
LABEL_82:
  PBDataWriterWriteDoubleField();
  if ((*(_WORD *)&self->_has & 0x200) != 0)
LABEL_59:
    PBDataWriterWriteBOOLField();
LABEL_60:
  if (self->_collaborationIdentifier)
    PBDataWriterWriteStringField();
  if (self->_contentType)
    PBDataWriterWriteStringField();
  if (self->_contentDisplayName)
    PBDataWriterWriteStringField();
  if (self->_fileProviderId)
    PBDataWriterWriteStringField();
  if (self->_localIdentity)
    PBDataWriterWriteDataField();
  if (self->_localIdentityProof)
    PBDataWriterWriteDataField();
  if (self->_handleToIdentityMap)
    PBDataWriterWriteDataField();
  if ((*(_WORD *)&self->_has & 0x100) != 0)
    PBDataWriterWriteBOOLField();

}

- (void)copyTo:(id)a3
{
  id v4;
  __int16 has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t j;
  void *v13;
  _BYTE *v14;
  __int16 v15;
  __int16 v16;
  id v17;

  v4 = a3;
  v17 = v4;
  if (self->_highlightIdentifier)
  {
    objc_msgSend(v4, "setHighlightIdentifier:");
    v4 = v17;
  }
  has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    *((_DWORD *)v4 + 42) = self->_highlightType;
    *((_WORD *)v4 + 128) |= 0x40u;
    has = (__int16)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    *((_QWORD *)v4 + 5) = *(_QWORD *)&self->_syndicationSecondsSinceReferenceDate;
    *((_WORD *)v4 + 128) |= 0x10u;
  }
  if (self->_sourceBundleId)
    objc_msgSend(v17, "setSourceBundleId:");
  if (-[PPRankableSocialHighlight applicationIdentifiersCount](self, "applicationIdentifiersCount"))
  {
    objc_msgSend(v17, "clearApplicationIdentifiers");
    v6 = -[PPRankableSocialHighlight applicationIdentifiersCount](self, "applicationIdentifiersCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        -[PPRankableSocialHighlight applicationIdentifiersAtIndex:](self, "applicationIdentifiersAtIndex:", i);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addApplicationIdentifiers:", v9);

      }
    }
  }
  if (self->_resourceUrl)
    objc_msgSend(v17, "setResourceUrl:");
  if (self->_sender)
    objc_msgSend(v17, "setSender:");
  if (self->_domainIdentifier)
    objc_msgSend(v17, "setDomainIdentifier:");
  if (self->_batchIdentifier)
    objc_msgSend(v17, "setBatchIdentifier:");
  if (-[PPRankableSocialHighlight calculatedFeaturesCount](self, "calculatedFeaturesCount"))
  {
    objc_msgSend(v17, "clearCalculatedFeatures");
    v10 = -[PPRankableSocialHighlight calculatedFeaturesCount](self, "calculatedFeaturesCount");
    if (v10)
    {
      v11 = v10;
      for (j = 0; j != v11; ++j)
      {
        -[PPRankableSocialHighlight calculatedFeaturesAtIndex:](self, "calculatedFeaturesAtIndex:", j);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addCalculatedFeatures:", v13);

      }
    }
  }
  if (self->_clientIdentifier)
    objc_msgSend(v17, "setClientIdentifier:");
  v14 = v17;
  if ((*(_WORD *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v17 + 1) = *(_QWORD *)&self->_contentCreationSecondsSinceReferenceDate;
    *((_WORD *)v17 + 128) |= 1u;
  }
  if (self->_groupPhotoPathDigest)
  {
    objc_msgSend(v17, "setGroupPhotoPathDigest:");
    v14 = v17;
  }
  if (self->_displayName)
  {
    objc_msgSend(v17, "setDisplayName:");
    v14 = v17;
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    v14[251] = self->_isPrimary;
    *((_WORD *)v14 + 128) |= 0x800u;
  }
  if (self->_attributionIdentifier)
  {
    objc_msgSend(v17, "setAttributionIdentifier:");
    v14 = v17;
  }
  v15 = (__int16)self->_has;
  if ((v15 & 0x80) != 0)
  {
    *((_DWORD *)v14 + 50) = self->_rank;
    *((_WORD *)v14 + 128) |= 0x80u;
    v15 = (__int16)self->_has;
    if ((v15 & 8) == 0)
    {
LABEL_39:
      if ((v15 & 0x400) == 0)
        goto LABEL_41;
      goto LABEL_40;
    }
  }
  else if ((v15 & 8) == 0)
  {
    goto LABEL_39;
  }
  *((_QWORD *)v14 + 4) = *(_QWORD *)&self->_score;
  *((_WORD *)v14 + 128) |= 8u;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_40:
    v14[250] = self->_isConversationAutoDonating;
    *((_WORD *)v14 + 128) |= 0x400u;
  }
LABEL_41:
  if (self->_originatingDeviceId)
  {
    objc_msgSend(v17, "setOriginatingDeviceId:");
    v14 = v17;
  }
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
    *((_QWORD *)v14 + 3) = *(_QWORD *)&self->_rankingSecondsSinceReferenceDate;
    *((_WORD *)v14 + 128) |= 4u;
  }
  if (self->_resolvedUrl)
  {
    objc_msgSend(v17, "setResolvedUrl:");
    v14 = v17;
  }
  if (self->_variant)
  {
    objc_msgSend(v17, "setVariant:");
    v14 = v17;
  }
  v16 = (__int16)self->_has;
  if ((v16 & 0x1000) != 0)
  {
    v14[252] = self->_isTopKResult;
    *((_WORD *)v14 + 128) |= 0x1000u;
    v16 = (__int16)self->_has;
    if ((v16 & 0x20) == 0)
    {
LABEL_51:
      if ((v16 & 2) == 0)
        goto LABEL_52;
      goto LABEL_76;
    }
  }
  else if ((v16 & 0x20) == 0)
  {
    goto LABEL_51;
  }
  *((_QWORD *)v14 + 6) = *(_QWORD *)&self->_topKScore;
  *((_WORD *)v14 + 128) |= 0x20u;
  v16 = (__int16)self->_has;
  if ((v16 & 2) == 0)
  {
LABEL_52:
    if ((v16 & 0x200) == 0)
      goto LABEL_54;
    goto LABEL_53;
  }
LABEL_76:
  *((_QWORD *)v14 + 2) = *(_QWORD *)&self->_firstPassScore;
  *((_WORD *)v14 + 128) |= 2u;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_53:
    v14[249] = self->_isCollaboration;
    *((_WORD *)v14 + 128) |= 0x200u;
  }
LABEL_54:
  if (self->_collaborationIdentifier)
  {
    objc_msgSend(v17, "setCollaborationIdentifier:");
    v14 = v17;
  }
  if (self->_contentType)
  {
    objc_msgSend(v17, "setContentType:");
    v14 = v17;
  }
  if (self->_contentDisplayName)
  {
    objc_msgSend(v17, "setContentDisplayName:");
    v14 = v17;
  }
  if (self->_fileProviderId)
  {
    objc_msgSend(v17, "setFileProviderId:");
    v14 = v17;
  }
  if (self->_localIdentity)
  {
    objc_msgSend(v17, "setLocalIdentity:");
    v14 = v17;
  }
  if (self->_localIdentityProof)
  {
    objc_msgSend(v17, "setLocalIdentityProof:");
    v14 = v17;
  }
  if (self->_handleToIdentityMap)
  {
    objc_msgSend(v17, "setHandleToIdentityMap:");
    v14 = v17;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    v14[248] = self->_fromMeEntitlementOverrideIsPresent;
    *((_WORD *)v14 + 128) |= 0x100u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int16 has;
  uint64_t v9;
  void *v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  NSMutableArray *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  __int16 v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  __int16 v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  void *v60;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _BYTE v70[128];
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_highlightIdentifier, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 160);
  *(_QWORD *)(v5 + 160) = v6;

  has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    *(_DWORD *)(v5 + 168) = self->_highlightType;
    *(_WORD *)(v5 + 256) |= 0x40u;
    has = (__int16)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    *(double *)(v5 + 40) = self->_syndicationSecondsSinceReferenceDate;
    *(_WORD *)(v5 + 256) |= 0x10u;
  }
  v9 = -[NSString copyWithZone:](self->_sourceBundleId, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 232);
  *(_QWORD *)(v5 + 232) = v9;

  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  v11 = self->_applicationIdentifiers;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v66, v71, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v67;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v67 != v14)
          objc_enumerationMutation(v11);
        v16 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v66 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addApplicationIdentifiers:", v16);

      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v66, v71, 16);
    }
    while (v13);
  }

  v17 = -[NSString copyWithZone:](self->_resourceUrl, "copyWithZone:", a3);
  v18 = *(void **)(v5 + 216);
  *(_QWORD *)(v5 + 216) = v17;

  v19 = -[PPSocialHighlightContact copyWithZone:](self->_sender, "copyWithZone:", a3);
  v20 = *(void **)(v5 + 224);
  *(_QWORD *)(v5 + 224) = v19;

  v21 = -[NSString copyWithZone:](self->_domainIdentifier, "copyWithZone:", a3);
  v22 = *(void **)(v5 + 128);
  *(_QWORD *)(v5 + 128) = v21;

  v23 = -[NSString copyWithZone:](self->_batchIdentifier, "copyWithZone:", a3);
  v24 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v23;

  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  v25 = self->_calculatedFeatures;
  v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v62, v70, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v63;
    do
    {
      for (j = 0; j != v27; ++j)
      {
        if (*(_QWORD *)v63 != v28)
          objc_enumerationMutation(v25);
        v30 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v62 + 1) + 8 * j), "copyWithZone:", a3, (_QWORD)v62);
        objc_msgSend((id)v5, "addCalculatedFeatures:", v30);

      }
      v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v62, v70, 16);
    }
    while (v27);
  }

  v31 = -[NSString copyWithZone:](self->_clientIdentifier, "copyWithZone:", a3);
  v32 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v31;

  if ((*(_WORD *)&self->_has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_contentCreationSecondsSinceReferenceDate;
    *(_WORD *)(v5 + 256) |= 1u;
  }
  v33 = -[NSString copyWithZone:](self->_groupPhotoPathDigest, "copyWithZone:", a3, (_QWORD)v62);
  v34 = *(void **)(v5 + 144);
  *(_QWORD *)(v5 + 144) = v33;

  v35 = -[NSString copyWithZone:](self->_displayName, "copyWithZone:", a3);
  v36 = *(void **)(v5 + 120);
  *(_QWORD *)(v5 + 120) = v35;

  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    *(_BYTE *)(v5 + 251) = self->_isPrimary;
    *(_WORD *)(v5 + 256) |= 0x800u;
  }
  v37 = -[NSString copyWithZone:](self->_attributionIdentifier, "copyWithZone:", a3);
  v38 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v37;

  v39 = (__int16)self->_has;
  if ((v39 & 0x80) != 0)
  {
    *(_DWORD *)(v5 + 200) = self->_rank;
    *(_WORD *)(v5 + 256) |= 0x80u;
    v39 = (__int16)self->_has;
    if ((v39 & 8) == 0)
    {
LABEL_25:
      if ((v39 & 0x400) == 0)
        goto LABEL_27;
      goto LABEL_26;
    }
  }
  else if ((v39 & 8) == 0)
  {
    goto LABEL_25;
  }
  *(double *)(v5 + 32) = self->_score;
  *(_WORD *)(v5 + 256) |= 8u;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_26:
    *(_BYTE *)(v5 + 250) = self->_isConversationAutoDonating;
    *(_WORD *)(v5 + 256) |= 0x400u;
  }
LABEL_27:
  v40 = -[NSString copyWithZone:](self->_originatingDeviceId, "copyWithZone:", a3);
  v41 = *(void **)(v5 + 192);
  *(_QWORD *)(v5 + 192) = v40;

  if ((*(_WORD *)&self->_has & 4) != 0)
  {
    *(double *)(v5 + 24) = self->_rankingSecondsSinceReferenceDate;
    *(_WORD *)(v5 + 256) |= 4u;
  }
  v42 = -[NSString copyWithZone:](self->_resolvedUrl, "copyWithZone:", a3);
  v43 = *(void **)(v5 + 208);
  *(_QWORD *)(v5 + 208) = v42;

  v44 = -[NSString copyWithZone:](self->_variant, "copyWithZone:", a3);
  v45 = *(void **)(v5 + 240);
  *(_QWORD *)(v5 + 240) = v44;

  v46 = (__int16)self->_has;
  if ((v46 & 0x1000) != 0)
  {
    *(_BYTE *)(v5 + 252) = self->_isTopKResult;
    *(_WORD *)(v5 + 256) |= 0x1000u;
    v46 = (__int16)self->_has;
    if ((v46 & 0x20) == 0)
    {
LABEL_31:
      if ((v46 & 2) == 0)
        goto LABEL_32;
      goto LABEL_42;
    }
  }
  else if ((v46 & 0x20) == 0)
  {
    goto LABEL_31;
  }
  *(double *)(v5 + 48) = self->_topKScore;
  *(_WORD *)(v5 + 256) |= 0x20u;
  v46 = (__int16)self->_has;
  if ((v46 & 2) == 0)
  {
LABEL_32:
    if ((v46 & 0x200) == 0)
      goto LABEL_34;
    goto LABEL_33;
  }
LABEL_42:
  *(double *)(v5 + 16) = self->_firstPassScore;
  *(_WORD *)(v5 + 256) |= 2u;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_33:
    *(_BYTE *)(v5 + 249) = self->_isCollaboration;
    *(_WORD *)(v5 + 256) |= 0x200u;
  }
LABEL_34:
  v47 = -[NSString copyWithZone:](self->_collaborationIdentifier, "copyWithZone:", a3);
  v48 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v47;

  v49 = -[NSString copyWithZone:](self->_contentType, "copyWithZone:", a3);
  v50 = *(void **)(v5 + 112);
  *(_QWORD *)(v5 + 112) = v49;

  v51 = -[NSString copyWithZone:](self->_contentDisplayName, "copyWithZone:", a3);
  v52 = *(void **)(v5 + 104);
  *(_QWORD *)(v5 + 104) = v51;

  v53 = -[NSString copyWithZone:](self->_fileProviderId, "copyWithZone:", a3);
  v54 = *(void **)(v5 + 136);
  *(_QWORD *)(v5 + 136) = v53;

  v55 = -[NSData copyWithZone:](self->_localIdentity, "copyWithZone:", a3);
  v56 = *(void **)(v5 + 176);
  *(_QWORD *)(v5 + 176) = v55;

  v57 = -[NSData copyWithZone:](self->_localIdentityProof, "copyWithZone:", a3);
  v58 = *(void **)(v5 + 184);
  *(_QWORD *)(v5 + 184) = v57;

  v59 = -[NSData copyWithZone:](self->_handleToIdentityMap, "copyWithZone:", a3);
  v60 = *(void **)(v5 + 152);
  *(_QWORD *)(v5 + 152) = v59;

  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    *(_BYTE *)(v5 + 248) = self->_fromMeEntitlementOverrideIsPresent;
    *(_WORD *)(v5 + 256) |= 0x100u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *highlightIdentifier;
  __int16 has;
  __int16 v7;
  NSString *sourceBundleId;
  NSMutableArray *applicationIdentifiers;
  NSString *resourceUrl;
  PPSocialHighlightContact *sender;
  NSString *domainIdentifier;
  NSString *batchIdentifier;
  NSMutableArray *calculatedFeatures;
  NSString *clientIdentifier;
  __int16 v16;
  NSString *groupPhotoPathDigest;
  NSString *displayName;
  __int16 v19;
  __int16 v20;
  NSString *attributionIdentifier;
  NSString *originatingDeviceId;
  NSString *resolvedUrl;
  NSString *variant;
  __int16 v25;
  __int16 v26;
  NSString *collaborationIdentifier;
  NSString *contentType;
  NSString *contentDisplayName;
  NSString *fileProviderId;
  NSData *localIdentity;
  NSData *localIdentityProof;
  NSData *handleToIdentityMap;
  BOOL v34;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_123;
  highlightIdentifier = self->_highlightIdentifier;
  if ((unint64_t)highlightIdentifier | *((_QWORD *)v4 + 20))
  {
    if (!-[NSString isEqual:](highlightIdentifier, "isEqual:"))
      goto LABEL_123;
  }
  has = (__int16)self->_has;
  v7 = *((_WORD *)v4 + 128);
  if ((has & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0 || self->_highlightType != *((_DWORD *)v4 + 42))
      goto LABEL_123;
  }
  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_123;
  }
  if ((has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_syndicationSecondsSinceReferenceDate != *((double *)v4 + 5))
      goto LABEL_123;
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_123;
  }
  sourceBundleId = self->_sourceBundleId;
  if ((unint64_t)sourceBundleId | *((_QWORD *)v4 + 29)
    && !-[NSString isEqual:](sourceBundleId, "isEqual:"))
  {
    goto LABEL_123;
  }
  applicationIdentifiers = self->_applicationIdentifiers;
  if ((unint64_t)applicationIdentifiers | *((_QWORD *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](applicationIdentifiers, "isEqual:"))
      goto LABEL_123;
  }
  resourceUrl = self->_resourceUrl;
  if ((unint64_t)resourceUrl | *((_QWORD *)v4 + 27))
  {
    if (!-[NSString isEqual:](resourceUrl, "isEqual:"))
      goto LABEL_123;
  }
  sender = self->_sender;
  if ((unint64_t)sender | *((_QWORD *)v4 + 28))
  {
    if (!-[PPSocialHighlightContact isEqual:](sender, "isEqual:"))
      goto LABEL_123;
  }
  domainIdentifier = self->_domainIdentifier;
  if ((unint64_t)domainIdentifier | *((_QWORD *)v4 + 16))
  {
    if (!-[NSString isEqual:](domainIdentifier, "isEqual:"))
      goto LABEL_123;
  }
  batchIdentifier = self->_batchIdentifier;
  if ((unint64_t)batchIdentifier | *((_QWORD *)v4 + 9))
  {
    if (!-[NSString isEqual:](batchIdentifier, "isEqual:"))
      goto LABEL_123;
  }
  calculatedFeatures = self->_calculatedFeatures;
  if ((unint64_t)calculatedFeatures | *((_QWORD *)v4 + 10))
  {
    if (!-[NSMutableArray isEqual:](calculatedFeatures, "isEqual:"))
      goto LABEL_123;
  }
  clientIdentifier = self->_clientIdentifier;
  if ((unint64_t)clientIdentifier | *((_QWORD *)v4 + 11))
  {
    if (!-[NSString isEqual:](clientIdentifier, "isEqual:"))
      goto LABEL_123;
  }
  v16 = *((_WORD *)v4 + 128);
  if ((*(_WORD *)&self->_has & 1) != 0)
  {
    if ((v16 & 1) == 0 || self->_contentCreationSecondsSinceReferenceDate != *((double *)v4 + 1))
      goto LABEL_123;
  }
  else if ((v16 & 1) != 0)
  {
    goto LABEL_123;
  }
  groupPhotoPathDigest = self->_groupPhotoPathDigest;
  if ((unint64_t)groupPhotoPathDigest | *((_QWORD *)v4 + 18)
    && !-[NSString isEqual:](groupPhotoPathDigest, "isEqual:"))
  {
    goto LABEL_123;
  }
  displayName = self->_displayName;
  if ((unint64_t)displayName | *((_QWORD *)v4 + 15))
  {
    if (!-[NSString isEqual:](displayName, "isEqual:"))
      goto LABEL_123;
  }
  v19 = (__int16)self->_has;
  v20 = *((_WORD *)v4 + 128);
  if ((v19 & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 128) & 0x800) == 0)
      goto LABEL_123;
    if (self->_isPrimary)
    {
      if (!*((_BYTE *)v4 + 251))
        goto LABEL_123;
    }
    else if (*((_BYTE *)v4 + 251))
    {
      goto LABEL_123;
    }
  }
  else if ((*((_WORD *)v4 + 128) & 0x800) != 0)
  {
    goto LABEL_123;
  }
  attributionIdentifier = self->_attributionIdentifier;
  if ((unint64_t)attributionIdentifier | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](attributionIdentifier, "isEqual:"))
      goto LABEL_123;
    v19 = (__int16)self->_has;
    v20 = *((_WORD *)v4 + 128);
  }
  if ((v19 & 0x80) != 0)
  {
    if ((v20 & 0x80) == 0 || self->_rank != *((_DWORD *)v4 + 50))
      goto LABEL_123;
  }
  else if ((v20 & 0x80) != 0)
  {
    goto LABEL_123;
  }
  if ((v19 & 8) != 0)
  {
    if ((v20 & 8) == 0 || self->_score != *((double *)v4 + 4))
      goto LABEL_123;
  }
  else if ((v20 & 8) != 0)
  {
    goto LABEL_123;
  }
  if ((v19 & 0x400) != 0)
  {
    if ((v20 & 0x400) == 0)
      goto LABEL_123;
    if (self->_isConversationAutoDonating)
    {
      if (!*((_BYTE *)v4 + 250))
        goto LABEL_123;
    }
    else if (*((_BYTE *)v4 + 250))
    {
      goto LABEL_123;
    }
  }
  else if ((v20 & 0x400) != 0)
  {
    goto LABEL_123;
  }
  originatingDeviceId = self->_originatingDeviceId;
  if ((unint64_t)originatingDeviceId | *((_QWORD *)v4 + 24))
  {
    if (!-[NSString isEqual:](originatingDeviceId, "isEqual:"))
      goto LABEL_123;
    v19 = (__int16)self->_has;
    v20 = *((_WORD *)v4 + 128);
  }
  if ((v19 & 4) != 0)
  {
    if ((v20 & 4) == 0 || self->_rankingSecondsSinceReferenceDate != *((double *)v4 + 3))
      goto LABEL_123;
  }
  else if ((v20 & 4) != 0)
  {
    goto LABEL_123;
  }
  resolvedUrl = self->_resolvedUrl;
  if ((unint64_t)resolvedUrl | *((_QWORD *)v4 + 26)
    && !-[NSString isEqual:](resolvedUrl, "isEqual:"))
  {
    goto LABEL_123;
  }
  variant = self->_variant;
  if ((unint64_t)variant | *((_QWORD *)v4 + 30))
  {
    if (!-[NSString isEqual:](variant, "isEqual:"))
      goto LABEL_123;
  }
  v25 = (__int16)self->_has;
  v26 = *((_WORD *)v4 + 128);
  if ((v25 & 0x1000) != 0)
  {
    if ((*((_WORD *)v4 + 128) & 0x1000) == 0)
      goto LABEL_123;
    if (self->_isTopKResult)
    {
      if (!*((_BYTE *)v4 + 252))
        goto LABEL_123;
    }
    else if (*((_BYTE *)v4 + 252))
    {
      goto LABEL_123;
    }
  }
  else if ((*((_WORD *)v4 + 128) & 0x1000) != 0)
  {
    goto LABEL_123;
  }
  if ((v25 & 0x20) != 0)
  {
    if ((v26 & 0x20) == 0 || self->_topKScore != *((double *)v4 + 6))
      goto LABEL_123;
  }
  else if ((v26 & 0x20) != 0)
  {
    goto LABEL_123;
  }
  if ((v25 & 2) != 0)
  {
    if ((v26 & 2) == 0 || self->_firstPassScore != *((double *)v4 + 2))
      goto LABEL_123;
  }
  else if ((v26 & 2) != 0)
  {
    goto LABEL_123;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 128) & 0x200) == 0)
      goto LABEL_123;
    if (self->_isCollaboration)
    {
      if (!*((_BYTE *)v4 + 249))
        goto LABEL_123;
    }
    else if (*((_BYTE *)v4 + 249))
    {
      goto LABEL_123;
    }
  }
  else if ((*((_WORD *)v4 + 128) & 0x200) != 0)
  {
    goto LABEL_123;
  }
  collaborationIdentifier = self->_collaborationIdentifier;
  if ((unint64_t)collaborationIdentifier | *((_QWORD *)v4 + 12)
    && !-[NSString isEqual:](collaborationIdentifier, "isEqual:"))
  {
    goto LABEL_123;
  }
  contentType = self->_contentType;
  if ((unint64_t)contentType | *((_QWORD *)v4 + 14))
  {
    if (!-[NSString isEqual:](contentType, "isEqual:"))
      goto LABEL_123;
  }
  contentDisplayName = self->_contentDisplayName;
  if ((unint64_t)contentDisplayName | *((_QWORD *)v4 + 13))
  {
    if (!-[NSString isEqual:](contentDisplayName, "isEqual:"))
      goto LABEL_123;
  }
  fileProviderId = self->_fileProviderId;
  if ((unint64_t)fileProviderId | *((_QWORD *)v4 + 17))
  {
    if (!-[NSString isEqual:](fileProviderId, "isEqual:"))
      goto LABEL_123;
  }
  localIdentity = self->_localIdentity;
  if ((unint64_t)localIdentity | *((_QWORD *)v4 + 22))
  {
    if (!-[NSData isEqual:](localIdentity, "isEqual:"))
      goto LABEL_123;
  }
  localIdentityProof = self->_localIdentityProof;
  if ((unint64_t)localIdentityProof | *((_QWORD *)v4 + 23))
  {
    if (!-[NSData isEqual:](localIdentityProof, "isEqual:"))
      goto LABEL_123;
  }
  handleToIdentityMap = self->_handleToIdentityMap;
  if ((unint64_t)handleToIdentityMap | *((_QWORD *)v4 + 19))
  {
    if (!-[NSData isEqual:](handleToIdentityMap, "isEqual:"))
      goto LABEL_123;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 128) & 0x100) != 0)
    {
      if (self->_fromMeEntitlementOverrideIsPresent)
      {
        if (!*((_BYTE *)v4 + 248))
          goto LABEL_123;
      }
      else if (*((_BYTE *)v4 + 248))
      {
        goto LABEL_123;
      }
      v34 = 1;
      goto LABEL_124;
    }
LABEL_123:
    v34 = 0;
    goto LABEL_124;
  }
  v34 = (*((_WORD *)v4 + 128) & 0x100) == 0;
LABEL_124:

  return v34;
}

- (unint64_t)hash
{
  __int16 has;
  double syndicationSecondsSinceReferenceDate;
  double v5;
  long double v6;
  double v7;
  double v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  double contentCreationSecondsSinceReferenceDate;
  double v13;
  long double v14;
  double v15;
  double v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  __int16 v20;
  double score;
  double v22;
  long double v23;
  double v24;
  unint64_t v25;
  double rankingSecondsSinceReferenceDate;
  double v27;
  long double v28;
  double v29;
  double v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  __int16 v34;
  double topKScore;
  double v36;
  long double v37;
  double v38;
  unint64_t v39;
  unint64_t v40;
  double firstPassScore;
  double v42;
  long double v43;
  double v44;
  NSUInteger v45;
  NSUInteger v46;
  NSUInteger v47;
  NSUInteger v48;
  NSUInteger v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v55;
  uint64_t v56;
  NSUInteger v57;
  NSUInteger v58;
  unint64_t v59;
  NSUInteger v60;
  uint64_t v61;
  unint64_t v62;
  uint64_t v63;
  NSUInteger v64;
  uint64_t v65;
  NSUInteger v66;
  NSUInteger v67;
  unint64_t v68;
  NSUInteger v69;
  uint64_t v70;
  NSUInteger v71;
  NSUInteger v72;
  unint64_t v73;
  NSUInteger v74;
  uint64_t v75;
  NSUInteger v76;
  unint64_t v77;
  uint64_t v78;
  NSUInteger v79;

  v79 = -[NSString hash](self->_highlightIdentifier, "hash");
  has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    v78 = 2654435761 * self->_highlightType;
    if ((has & 0x10) != 0)
      goto LABEL_3;
LABEL_11:
    v77 = 0;
    goto LABEL_12;
  }
  v78 = 0;
  if ((has & 0x10) == 0)
    goto LABEL_11;
LABEL_3:
  syndicationSecondsSinceReferenceDate = self->_syndicationSecondsSinceReferenceDate;
  v5 = -syndicationSecondsSinceReferenceDate;
  if (syndicationSecondsSinceReferenceDate >= 0.0)
    v5 = self->_syndicationSecondsSinceReferenceDate;
  v6 = floor(v5 + 0.5);
  v7 = (v5 - v6) * 1.84467441e19;
  v8 = fmod(v6, 1.84467441e19);
  v9 = 2654435761u * (unint64_t)v8;
  v10 = v9 + (unint64_t)v7;
  if (v7 <= 0.0)
    v10 = 2654435761u * (unint64_t)v8;
  v11 = v9 - (unint64_t)fabs(v7);
  if (v7 >= 0.0)
    v11 = v10;
  v77 = v11;
LABEL_12:
  v76 = -[NSString hash](self->_sourceBundleId, "hash");
  v75 = -[NSMutableArray hash](self->_applicationIdentifiers, "hash");
  v74 = -[NSString hash](self->_resourceUrl, "hash");
  v73 = -[PPSocialHighlightContact hash](self->_sender, "hash");
  v72 = -[NSString hash](self->_domainIdentifier, "hash");
  v71 = -[NSString hash](self->_batchIdentifier, "hash");
  v70 = -[NSMutableArray hash](self->_calculatedFeatures, "hash");
  v69 = -[NSString hash](self->_clientIdentifier, "hash");
  if ((*(_WORD *)&self->_has & 1) != 0)
  {
    contentCreationSecondsSinceReferenceDate = self->_contentCreationSecondsSinceReferenceDate;
    v13 = -contentCreationSecondsSinceReferenceDate;
    if (contentCreationSecondsSinceReferenceDate >= 0.0)
      v13 = self->_contentCreationSecondsSinceReferenceDate;
    v14 = floor(v13 + 0.5);
    v15 = (v13 - v14) * 1.84467441e19;
    v16 = fmod(v14, 1.84467441e19);
    v17 = 2654435761u * (unint64_t)v16;
    v18 = v17 + (unint64_t)v15;
    if (v15 <= 0.0)
      v18 = 2654435761u * (unint64_t)v16;
    v19 = v17 - (unint64_t)fabs(v15);
    if (v15 >= 0.0)
      v19 = v18;
    v68 = v19;
  }
  else
  {
    v68 = 0;
  }
  v67 = -[NSString hash](self->_groupPhotoPathDigest, "hash");
  v66 = -[NSString hash](self->_displayName, "hash");
  if ((*(_WORD *)&self->_has & 0x800) != 0)
    v65 = 2654435761 * self->_isPrimary;
  else
    v65 = 0;
  v64 = -[NSString hash](self->_attributionIdentifier, "hash");
  v20 = (__int16)self->_has;
  if ((v20 & 0x80) != 0)
  {
    v63 = 2654435761 * self->_rank;
    if ((v20 & 8) != 0)
    {
LABEL_26:
      score = self->_score;
      v22 = -score;
      if (score >= 0.0)
        v22 = self->_score;
      v23 = floor(v22 + 0.5);
      v24 = (v22 - v23) * 1.84467441e19;
      v25 = 2654435761u * (unint64_t)fmod(v23, 1.84467441e19);
      if (v24 >= 0.0)
      {
        if (v24 > 0.0)
          v25 += (unint64_t)v24;
      }
      else
      {
        v25 -= (unint64_t)fabs(v24);
      }
      v62 = v25;
      if ((v20 & 0x400) == 0)
        goto LABEL_36;
LABEL_32:
      v61 = 2654435761 * self->_isConversationAutoDonating;
      goto LABEL_37;
    }
  }
  else
  {
    v63 = 0;
    if ((v20 & 8) != 0)
      goto LABEL_26;
  }
  v62 = 0;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
    goto LABEL_32;
LABEL_36:
  v61 = 0;
LABEL_37:
  v60 = -[NSString hash](self->_originatingDeviceId, "hash");
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
    rankingSecondsSinceReferenceDate = self->_rankingSecondsSinceReferenceDate;
    v27 = -rankingSecondsSinceReferenceDate;
    if (rankingSecondsSinceReferenceDate >= 0.0)
      v27 = self->_rankingSecondsSinceReferenceDate;
    v28 = floor(v27 + 0.5);
    v29 = (v27 - v28) * 1.84467441e19;
    v30 = fmod(v28, 1.84467441e19);
    v31 = 2654435761u * (unint64_t)v30;
    v32 = v31 + (unint64_t)v29;
    if (v29 <= 0.0)
      v32 = 2654435761u * (unint64_t)v30;
    v33 = v31 - (unint64_t)fabs(v29);
    if (v29 >= 0.0)
      v33 = v32;
    v59 = v33;
  }
  else
  {
    v59 = 0;
  }
  v58 = -[NSString hash](self->_resolvedUrl, "hash");
  v57 = -[NSString hash](self->_variant, "hash");
  v34 = (__int16)self->_has;
  if ((v34 & 0x1000) != 0)
  {
    v56 = 2654435761 * self->_isTopKResult;
    if ((v34 & 0x20) != 0)
      goto LABEL_48;
LABEL_53:
    v39 = 0;
    goto LABEL_56;
  }
  v56 = 0;
  if ((v34 & 0x20) == 0)
    goto LABEL_53;
LABEL_48:
  topKScore = self->_topKScore;
  v36 = -topKScore;
  if (topKScore >= 0.0)
    v36 = self->_topKScore;
  v37 = floor(v36 + 0.5);
  v38 = (v36 - v37) * 1.84467441e19;
  v39 = 2654435761u * (unint64_t)fmod(v37, 1.84467441e19);
  if (v38 >= 0.0)
  {
    if (v38 > 0.0)
      v39 += (unint64_t)v38;
  }
  else
  {
    v39 -= (unint64_t)fabs(v38);
  }
LABEL_56:
  if ((v34 & 2) != 0)
  {
    firstPassScore = self->_firstPassScore;
    v42 = -firstPassScore;
    if (firstPassScore >= 0.0)
      v42 = self->_firstPassScore;
    v43 = floor(v42 + 0.5);
    v44 = (v42 - v43) * 1.84467441e19;
    v40 = 2654435761u * (unint64_t)fmod(v43, 1.84467441e19);
    if (v44 >= 0.0)
    {
      if (v44 > 0.0)
        v40 += (unint64_t)v44;
    }
    else
    {
      v40 -= (unint64_t)fabs(v44);
    }
  }
  else
  {
    v40 = 0;
  }
  if ((v34 & 0x200) != 0)
    v45 = -[NSString hash](self->_collaborationIdentifier, "hash", 2654435761 * self->_isCollaboration);
  else
    v45 = -[NSString hash](self->_collaborationIdentifier, "hash", 0);
  v46 = v45;
  v47 = -[NSString hash](self->_contentType, "hash");
  v48 = -[NSString hash](self->_contentDisplayName, "hash");
  v49 = -[NSString hash](self->_fileProviderId, "hash");
  v50 = -[NSData hash](self->_localIdentity, "hash");
  v51 = -[NSData hash](self->_localIdentityProof, "hash");
  v52 = -[NSData hash](self->_handleToIdentityMap, "hash");
  if ((*(_WORD *)&self->_has & 0x100) != 0)
    v53 = 2654435761 * self->_fromMeEntitlementOverrideIsPresent;
  else
    v53 = 0;
  return v78 ^ v79 ^ v77 ^ v76 ^ v75 ^ v74 ^ v73 ^ v72 ^ v71 ^ v70 ^ v69 ^ v68 ^ v67 ^ v66 ^ v65 ^ v64 ^ v63 ^ v62 ^ v61 ^ v60 ^ v59 ^ v58 ^ v57 ^ v56 ^ v39 ^ v40 ^ v55 ^ v46 ^ v47 ^ v48 ^ v49 ^ v50 ^ v51 ^ v52 ^ v53;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  __int16 v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  PPSocialHighlightContact *sender;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  __int16 v18;
  __int16 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (*((_QWORD *)v4 + 20))
    -[PPRankableSocialHighlight setHighlightIdentifier:](self, "setHighlightIdentifier:");
  v5 = *((_WORD *)v4 + 128);
  if ((v5 & 0x40) != 0)
  {
    self->_highlightType = *((_DWORD *)v4 + 42);
    *(_WORD *)&self->_has |= 0x40u;
    v5 = *((_WORD *)v4 + 128);
  }
  if ((v5 & 0x10) != 0)
  {
    self->_syndicationSecondsSinceReferenceDate = *((double *)v4 + 5);
    *(_WORD *)&self->_has |= 0x10u;
  }
  if (*((_QWORD *)v4 + 29))
    -[PPRankableSocialHighlight setSourceBundleId:](self, "setSourceBundleId:");
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v6 = *((id *)v4 + 7);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v25 != v9)
          objc_enumerationMutation(v6);
        -[PPRankableSocialHighlight addApplicationIdentifiers:](self, "addApplicationIdentifiers:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i));
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v8);
  }

  if (*((_QWORD *)v4 + 27))
    -[PPRankableSocialHighlight setResourceUrl:](self, "setResourceUrl:");
  sender = self->_sender;
  v12 = *((_QWORD *)v4 + 28);
  if (sender)
  {
    if (v12)
      -[PPSocialHighlightContact mergeFrom:](sender, "mergeFrom:");
  }
  else if (v12)
  {
    -[PPRankableSocialHighlight setSender:](self, "setSender:");
  }
  if (*((_QWORD *)v4 + 16))
    -[PPRankableSocialHighlight setDomainIdentifier:](self, "setDomainIdentifier:");
  if (*((_QWORD *)v4 + 9))
    -[PPRankableSocialHighlight setBatchIdentifier:](self, "setBatchIdentifier:");
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v13 = *((id *)v4 + 10);
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v21;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v21 != v16)
          objc_enumerationMutation(v13);
        -[PPRankableSocialHighlight addCalculatedFeatures:](self, "addCalculatedFeatures:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * j), (_QWORD)v20);
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v15);
  }

  if (*((_QWORD *)v4 + 11))
    -[PPRankableSocialHighlight setClientIdentifier:](self, "setClientIdentifier:");
  if ((*((_WORD *)v4 + 128) & 1) != 0)
  {
    self->_contentCreationSecondsSinceReferenceDate = *((double *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 18))
    -[PPRankableSocialHighlight setGroupPhotoPathDigest:](self, "setGroupPhotoPathDigest:");
  if (*((_QWORD *)v4 + 15))
    -[PPRankableSocialHighlight setDisplayName:](self, "setDisplayName:");
  if ((*((_WORD *)v4 + 128) & 0x800) != 0)
  {
    self->_isPrimary = *((_BYTE *)v4 + 251);
    *(_WORD *)&self->_has |= 0x800u;
  }
  if (*((_QWORD *)v4 + 8))
    -[PPRankableSocialHighlight setAttributionIdentifier:](self, "setAttributionIdentifier:");
  v18 = *((_WORD *)v4 + 128);
  if ((v18 & 0x80) != 0)
  {
    self->_rank = *((_DWORD *)v4 + 50);
    *(_WORD *)&self->_has |= 0x80u;
    v18 = *((_WORD *)v4 + 128);
    if ((v18 & 8) == 0)
    {
LABEL_48:
      if ((v18 & 0x400) == 0)
        goto LABEL_50;
      goto LABEL_49;
    }
  }
  else if ((v18 & 8) == 0)
  {
    goto LABEL_48;
  }
  self->_score = *((double *)v4 + 4);
  *(_WORD *)&self->_has |= 8u;
  if ((*((_WORD *)v4 + 128) & 0x400) != 0)
  {
LABEL_49:
    self->_isConversationAutoDonating = *((_BYTE *)v4 + 250);
    *(_WORD *)&self->_has |= 0x400u;
  }
LABEL_50:
  if (*((_QWORD *)v4 + 24))
    -[PPRankableSocialHighlight setOriginatingDeviceId:](self, "setOriginatingDeviceId:");
  if ((*((_WORD *)v4 + 128) & 4) != 0)
  {
    self->_rankingSecondsSinceReferenceDate = *((double *)v4 + 3);
    *(_WORD *)&self->_has |= 4u;
  }
  if (*((_QWORD *)v4 + 26))
    -[PPRankableSocialHighlight setResolvedUrl:](self, "setResolvedUrl:");
  if (*((_QWORD *)v4 + 30))
    -[PPRankableSocialHighlight setVariant:](self, "setVariant:");
  v19 = *((_WORD *)v4 + 128);
  if ((v19 & 0x1000) != 0)
  {
    self->_isTopKResult = *((_BYTE *)v4 + 252);
    *(_WORD *)&self->_has |= 0x1000u;
    v19 = *((_WORD *)v4 + 128);
    if ((v19 & 0x20) == 0)
    {
LABEL_60:
      if ((v19 & 2) == 0)
        goto LABEL_61;
      goto LABEL_85;
    }
  }
  else if ((v19 & 0x20) == 0)
  {
    goto LABEL_60;
  }
  self->_topKScore = *((double *)v4 + 6);
  *(_WORD *)&self->_has |= 0x20u;
  v19 = *((_WORD *)v4 + 128);
  if ((v19 & 2) == 0)
  {
LABEL_61:
    if ((v19 & 0x200) == 0)
      goto LABEL_63;
    goto LABEL_62;
  }
LABEL_85:
  self->_firstPassScore = *((double *)v4 + 2);
  *(_WORD *)&self->_has |= 2u;
  if ((*((_WORD *)v4 + 128) & 0x200) != 0)
  {
LABEL_62:
    self->_isCollaboration = *((_BYTE *)v4 + 249);
    *(_WORD *)&self->_has |= 0x200u;
  }
LABEL_63:
  if (*((_QWORD *)v4 + 12))
    -[PPRankableSocialHighlight setCollaborationIdentifier:](self, "setCollaborationIdentifier:");
  if (*((_QWORD *)v4 + 14))
    -[PPRankableSocialHighlight setContentType:](self, "setContentType:");
  if (*((_QWORD *)v4 + 13))
    -[PPRankableSocialHighlight setContentDisplayName:](self, "setContentDisplayName:");
  if (*((_QWORD *)v4 + 17))
    -[PPRankableSocialHighlight setFileProviderId:](self, "setFileProviderId:");
  if (*((_QWORD *)v4 + 22))
    -[PPRankableSocialHighlight setLocalIdentity:](self, "setLocalIdentity:");
  if (*((_QWORD *)v4 + 23))
    -[PPRankableSocialHighlight setLocalIdentityProof:](self, "setLocalIdentityProof:");
  if (*((_QWORD *)v4 + 19))
    -[PPRankableSocialHighlight setHandleToIdentityMap:](self, "setHandleToIdentityMap:");
  if ((*((_WORD *)v4 + 128) & 0x100) != 0)
  {
    self->_fromMeEntitlementOverrideIsPresent = *((_BYTE *)v4 + 248);
    *(_WORD *)&self->_has |= 0x100u;
  }

}

- (NSString)highlightIdentifier
{
  return self->_highlightIdentifier;
}

- (void)setHighlightIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_highlightIdentifier, a3);
}

- (double)syndicationSecondsSinceReferenceDate
{
  return self->_syndicationSecondsSinceReferenceDate;
}

- (NSString)sourceBundleId
{
  return self->_sourceBundleId;
}

- (void)setSourceBundleId:(id)a3
{
  objc_storeStrong((id *)&self->_sourceBundleId, a3);
}

- (NSMutableArray)applicationIdentifiers
{
  return self->_applicationIdentifiers;
}

- (void)setApplicationIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_applicationIdentifiers, a3);
}

- (NSString)resourceUrl
{
  return self->_resourceUrl;
}

- (void)setResourceUrl:(id)a3
{
  objc_storeStrong((id *)&self->_resourceUrl, a3);
}

- (PPSocialHighlightContact)sender
{
  return self->_sender;
}

- (void)setSender:(id)a3
{
  objc_storeStrong((id *)&self->_sender, a3);
}

- (NSString)domainIdentifier
{
  return self->_domainIdentifier;
}

- (void)setDomainIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_domainIdentifier, a3);
}

- (NSString)batchIdentifier
{
  return self->_batchIdentifier;
}

- (void)setBatchIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_batchIdentifier, a3);
}

- (NSMutableArray)calculatedFeatures
{
  return self->_calculatedFeatures;
}

- (void)setCalculatedFeatures:(id)a3
{
  objc_storeStrong((id *)&self->_calculatedFeatures, a3);
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void)setClientIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_clientIdentifier, a3);
}

- (double)contentCreationSecondsSinceReferenceDate
{
  return self->_contentCreationSecondsSinceReferenceDate;
}

- (NSString)groupPhotoPathDigest
{
  return self->_groupPhotoPathDigest;
}

- (void)setGroupPhotoPathDigest:(id)a3
{
  objc_storeStrong((id *)&self->_groupPhotoPathDigest, a3);
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_storeStrong((id *)&self->_displayName, a3);
}

- (BOOL)isPrimary
{
  return self->_isPrimary;
}

- (NSString)attributionIdentifier
{
  return self->_attributionIdentifier;
}

- (void)setAttributionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_attributionIdentifier, a3);
}

- (unsigned)rank
{
  return self->_rank;
}

- (double)score
{
  return self->_score;
}

- (BOOL)isConversationAutoDonating
{
  return self->_isConversationAutoDonating;
}

- (NSString)originatingDeviceId
{
  return self->_originatingDeviceId;
}

- (void)setOriginatingDeviceId:(id)a3
{
  objc_storeStrong((id *)&self->_originatingDeviceId, a3);
}

- (double)rankingSecondsSinceReferenceDate
{
  return self->_rankingSecondsSinceReferenceDate;
}

- (NSString)resolvedUrl
{
  return self->_resolvedUrl;
}

- (void)setResolvedUrl:(id)a3
{
  objc_storeStrong((id *)&self->_resolvedUrl, a3);
}

- (NSString)variant
{
  return self->_variant;
}

- (void)setVariant:(id)a3
{
  objc_storeStrong((id *)&self->_variant, a3);
}

- (BOOL)isTopKResult
{
  return self->_isTopKResult;
}

- (double)topKScore
{
  return self->_topKScore;
}

- (double)firstPassScore
{
  return self->_firstPassScore;
}

- (BOOL)isCollaboration
{
  return self->_isCollaboration;
}

- (NSString)collaborationIdentifier
{
  return self->_collaborationIdentifier;
}

- (void)setCollaborationIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_collaborationIdentifier, a3);
}

- (NSString)contentType
{
  return self->_contentType;
}

- (void)setContentType:(id)a3
{
  objc_storeStrong((id *)&self->_contentType, a3);
}

- (NSString)contentDisplayName
{
  return self->_contentDisplayName;
}

- (void)setContentDisplayName:(id)a3
{
  objc_storeStrong((id *)&self->_contentDisplayName, a3);
}

- (NSString)fileProviderId
{
  return self->_fileProviderId;
}

- (void)setFileProviderId:(id)a3
{
  objc_storeStrong((id *)&self->_fileProviderId, a3);
}

- (NSData)localIdentity
{
  return self->_localIdentity;
}

- (void)setLocalIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_localIdentity, a3);
}

- (NSData)localIdentityProof
{
  return self->_localIdentityProof;
}

- (void)setLocalIdentityProof:(id)a3
{
  objc_storeStrong((id *)&self->_localIdentityProof, a3);
}

- (NSData)handleToIdentityMap
{
  return self->_handleToIdentityMap;
}

- (void)setHandleToIdentityMap:(id)a3
{
  objc_storeStrong((id *)&self->_handleToIdentityMap, a3);
}

- (BOOL)fromMeEntitlementOverrideIsPresent
{
  return self->_fromMeEntitlementOverrideIsPresent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_variant, 0);
  objc_storeStrong((id *)&self->_sourceBundleId, 0);
  objc_storeStrong((id *)&self->_sender, 0);
  objc_storeStrong((id *)&self->_resourceUrl, 0);
  objc_storeStrong((id *)&self->_resolvedUrl, 0);
  objc_storeStrong((id *)&self->_originatingDeviceId, 0);
  objc_storeStrong((id *)&self->_localIdentityProof, 0);
  objc_storeStrong((id *)&self->_localIdentity, 0);
  objc_storeStrong((id *)&self->_highlightIdentifier, 0);
  objc_storeStrong((id *)&self->_handleToIdentityMap, 0);
  objc_storeStrong((id *)&self->_groupPhotoPathDigest, 0);
  objc_storeStrong((id *)&self->_fileProviderId, 0);
  objc_storeStrong((id *)&self->_domainIdentifier, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_contentType, 0);
  objc_storeStrong((id *)&self->_contentDisplayName, 0);
  objc_storeStrong((id *)&self->_collaborationIdentifier, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_calculatedFeatures, 0);
  objc_storeStrong((id *)&self->_batchIdentifier, 0);
  objc_storeStrong((id *)&self->_attributionIdentifier, 0);
  objc_storeStrong((id *)&self->_applicationIdentifiers, 0);
}

+ (Class)applicationIdentifiersType
{
  return (Class)objc_opt_class();
}

+ (Class)calculatedFeaturesType
{
  return (Class)objc_opt_class();
}

- (id)calculatedFeatureValueForKey:(id)a3
{
  id v4;
  NSMutableArray *v5;
  void *v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = self->_calculatedFeatures;
  v6 = (void *)-[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "name", (_QWORD)v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v4);

        if ((v11 & 1) != 0)
        {
          v12 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v9, "value");
          objc_msgSend(v12, "numberWithDouble:");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }
      v6 = (void *)-[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)setCalculatedFeaturesFromDictionary:(id)a3
{
  id v4;
  NSMutableArray *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSMutableArray *calculatedFeatures;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (NSMutableArray *)objc_opt_new();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v4, "allKeys", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v10);
        v12 = (void *)objc_opt_new();
        objc_msgSend(v12, "setName:", v11);
        objc_msgSend(v4, "objectForKeyedSubscript:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "doubleValue");
        objc_msgSend(v12, "setValue:");

        -[NSMutableArray addObject:](v5, "addObject:", v12);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  calculatedFeatures = self->_calculatedFeatures;
  self->_calculatedFeatures = v5;

}

- (NSSet)featureNames
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = self->_calculatedFeatures;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v9, "hasName", (_QWORD)v13))
        {
          objc_msgSend(v9, "name");
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          if (v10)
          {
            objc_msgSend(v9, "name");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "addObject:", v11);

          }
        }
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  return (NSSet *)v3;
}

- (id)featureValueForName:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  void *v12;
  uint64_t v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[PPRankableSocialHighlight calculatedFeatureValueForKey:](self, "calculatedFeatureValueForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    pp_default_log_handle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v5;
      _os_log_fault_impl(&dword_1C392E000, v7, OS_LOG_TYPE_FAULT, "Social Highlight Scorer fetched feature %@, which was not precomputed.", buf, 0xCu);
    }

    v6 = &unk_1E7E5C078;
  }
  v8 = objc_alloc(MEMORY[0x1E0C9E970]);
  objc_autoreleasePoolPop((void *)MEMORY[0x1C3BD6630]());
  v13 = 0;
  v9 = (void *)objc_msgSend(v8, "initWithShape:dataType:error:", &unk_1E7E5B2D8, 65600, &v13);
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPRankableSocialHighlight+FeatureRanks.m"), 63, CFSTR("Could not allocate memory for array"));

  }
  objc_msgSend(v9, "setObject:atIndexedSubscript:", v6, 0);
  objc_msgSend(MEMORY[0x1E0C9E918], "featureValueWithMultiArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)features
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (self->_calculatedFeatures)
  {
    v3 = (void *)objc_opt_new();
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v4 = self->_calculatedFeatures;
    v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v18 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          if (objc_msgSend(v9, "hasName", (_QWORD)v17))
          {
            objc_msgSend(v9, "name");
            v10 = objc_claimAutoreleasedReturnValue();
            if (v10)
            {
              v11 = (void *)v10;
              v12 = objc_msgSend(v9, "hasValue");

              if (v12)
              {
                v13 = (void *)MEMORY[0x1E0CB37E8];
                objc_msgSend(v9, "value");
                objc_msgSend(v13, "numberWithDouble:");
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v9, "name");
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, v15);

              }
            }
          }
        }
        v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v6);
    }

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (unsigned)dataVersion
{
  return 1;
}

- (id)json
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB36D8];
  -[PPRankableSocialHighlight dictionaryRepresentation](self, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataWithJSONObject:options:error:", v3, 8, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    pp_social_highlights_log_handle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = 138412290;
      v8 = 0;
      _os_log_error_impl(&dword_1C392E000, v5, OS_LOG_TYPE_ERROR, "Unable to serialize feedback to json: %@", (uint8_t *)&v7, 0xCu);
    }

  }
  return v4;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v4;
  PPRankableSocialHighlight *v5;

  if (a4 == 1)
  {
    v4 = a3;
    v5 = -[PPRankableSocialHighlight initWithData:]([PPRankableSocialHighlight alloc], "initWithData:", v4);

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

@end
