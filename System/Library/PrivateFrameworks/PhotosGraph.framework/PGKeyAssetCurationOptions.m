@implementation PGKeyAssetCurationOptions

- (PGKeyAssetCurationOptions)init
{
  PGKeyAssetCurationOptions *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PGKeyAssetCurationOptions;
  result = -[PGKeyAssetCurationOptions init](&v3, sel_init);
  if (result)
  {
    *(_WORD *)&result->_allowContextualTrip = 257;
    result->_prefilterAssetsWithFaces = 1;
    result->_prefilterAssetsWithFacesThreshold = 0.2;
    result->_minimumNumberOfReferencePersons = 0;
  }
  return result;
}

- (PGKeyAssetCurationOptions)initWithReferenceAsset:(id)a3
{
  id v5;
  PGKeyAssetCurationOptions *v6;
  void *v7;
  void *v8;
  NSSet *v9;
  CLLocation *v10;
  NSSet *referencePersonLocalIdentifiers;
  NSSet *v12;
  CLLocation *referenceLocation;
  CLLocation *v14;

  v5 = a3;
  v6 = -[PGKeyAssetCurationOptions init](self, "init");
  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v5, "clsUnprefetchedPersonLocalIdentifiers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setWithArray:", v8);
    v9 = (NSSet *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "clsLocation");
    v10 = (CLLocation *)objc_claimAutoreleasedReturnValue();
    referencePersonLocalIdentifiers = v6->_referencePersonLocalIdentifiers;
    v6->_referencePersonLocalIdentifiers = v9;
    v12 = v9;

    referenceLocation = v6->_referenceLocation;
    v6->_referenceLocation = v10;
    v14 = v10;

    objc_storeStrong((id *)&v6->_referenceAsset, a3);
  }

  return v6;
}

- (PGKeyAssetCurationOptions)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  PGKeyAssetCurationOptions *v5;
  void *v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  uint64_t v13;
  CLLocation *referenceLocation;
  void *v15;
  void *v16;
  uint64_t v17;
  NSSet *referencePersonLocalIdentifiers;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  objc_super v34;

  v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)PGKeyAssetCurationOptions;
  v5 = -[PGKeyAssetCurationOptions init](&v34, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("referenceLocation"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = objc_alloc(MEMORY[0x1E0C9E3B8]);
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("latitude"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "doubleValue");
      v10 = v9;
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("longitude"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "doubleValue");
      v13 = objc_msgSend(v7, "initWithLatitude:longitude:", v10, v12);
      referenceLocation = v5->_referenceLocation;
      v5->_referenceLocation = (CLLocation *)v13;

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("minimumNumberOfReferencePersons"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_minimumNumberOfReferencePersons = objc_msgSend(v15, "unsignedIntegerValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("referencePersonLocalIdentifiers"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16
      || (objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("referencePersonUUIDs")),
          (v16 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v16);
      v17 = objc_claimAutoreleasedReturnValue();
      referencePersonLocalIdentifiers = v5->_referencePersonLocalIdentifiers;
      v5->_referencePersonLocalIdentifiers = (NSSet *)v17;

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("focusOnPeople"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_focusOnPeople = objc_msgSend(v19, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("complete"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_complete = objc_msgSend(v20, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("allowContextualTrip"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_allowContextualTrip = objc_msgSend(v21, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("useSummarizer"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_useSummarizer = objc_msgSend(v22, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("useContextualCurationOnly"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_useContextualCurationOnly = objc_msgSend(v23, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("prefilterAssetsWithFaces"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_prefilterAssetsWithFaces = objc_msgSend(v24, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("prefilterAssetsWithFacesThreshold"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "doubleValue");
    v5->_prefilterAssetsWithFacesThreshold = v26;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("promoteAutoplayableItems"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_promoteAutoplayableItems = objc_msgSend(v27, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isForMemories"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_isForMemories = objc_msgSend(v28, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("allowGuestAsset"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_allowGuestAsset = objc_msgSend(v29, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("wantsGoodSquareCropScore"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_wantsGoodSquareCropScore = objc_msgSend(v30, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("useIconicScore"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_useIconicScore = objc_msgSend(v31, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("avoidPromotingAutoplayableItemsWhenUsingIconicScore"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_avoidPromotingAutoplayableItemsWhenUsingIconicScore = objc_msgSend(v32, "BOOLValue");

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PGKeyAssetCurationOptions *v4;

  v4 = objc_alloc_init(PGKeyAssetCurationOptions);
  objc_storeStrong((id *)&v4->_referenceLocation, self->_referenceLocation);
  v4->_minimumNumberOfReferencePersons = self->_minimumNumberOfReferencePersons;
  objc_storeStrong((id *)&v4->_referencePersonLocalIdentifiers, self->_referencePersonLocalIdentifiers);
  v4->_focusOnPeople = self->_focusOnPeople;
  v4->_complete = self->_complete;
  v4->_allowContextualTrip = self->_allowContextualTrip;
  v4->_useSummarizer = self->_useSummarizer;
  v4->_useContextualCurationOnly = self->_useContextualCurationOnly;
  v4->_prefilterAssetsWithFaces = self->_prefilterAssetsWithFaces;
  v4->_prefilterAssetsWithFacesThreshold = self->_prefilterAssetsWithFacesThreshold;
  v4->_promoteAutoplayableItems = self->_promoteAutoplayableItems;
  v4->_isForMemories = self->_isForMemories;
  v4->_allowGuestAsset = self->_allowGuestAsset;
  v4->_wantsGoodSquareCropScore = self->_wantsGoodSquareCropScore;
  v4->_useIconicScore = self->_useIconicScore;
  v4->_avoidPromotingAutoplayableItemsWhenUsingIconicScore = self->_avoidPromotingAutoplayableItemsWhenUsingIconicScore;
  objc_storeStrong((id *)&v4->_referenceAsset, self->_referenceAsset);
  objc_storeStrong((id *)&v4->_curationCriteria, self->_curationCriteria);
  return v4;
}

- (id)dictionaryRepresentation
{
  id v3;
  CLLocation *referenceLocation;
  double v5;
  double v6;
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
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v26[2];
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  referenceLocation = self->_referenceLocation;
  if (referenceLocation)
  {
    -[CLLocation coordinate](referenceLocation, "coordinate");
    v6 = v5;
    v26[0] = CFSTR("latitude");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v26[1] = CFSTR("longitude");
    v27[0] = v7;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v27[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("referenceLocation"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_minimumNumberOfReferencePersons);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("minimumNumberOfReferencePersons"));

  -[NSSet allObjects](self->_referencePersonLocalIdentifiers, "allObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("referencePersonLocalIdentifiers"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_focusOnPeople);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("focusOnPeople"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_complete);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("complete"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_allowContextualTrip);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("allowContextualTrip"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_useSummarizer);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("useSummarizer"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_useContextualCurationOnly);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("useContextualCurationOnly"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_prefilterAssetsWithFaces);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("prefilterAssetsWithFaces"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_prefilterAssetsWithFacesThreshold);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("prefilterAssetsWithFacesThreshold"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_promoteAutoplayableItems);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("promoteAutoplayableItems"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isForMemories);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("isForMemories"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_allowGuestAsset);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("allowGuestAsset"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_wantsGoodSquareCropScore);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("wantsGoodSquareCropScore"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_useIconicScore);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("useIconicScore"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_avoidPromotingAutoplayableItemsWhenUsingIconicScore);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("avoidPromotingAutoplayableItemsWhenUsingIconicScore"));

  return v3;
}

- (CLLocation)referenceLocation
{
  return self->_referenceLocation;
}

- (void)setReferenceLocation:(id)a3
{
  objc_storeStrong((id *)&self->_referenceLocation, a3);
}

- (unint64_t)minimumNumberOfReferencePersons
{
  return self->_minimumNumberOfReferencePersons;
}

- (void)setMinimumNumberOfReferencePersons:(unint64_t)a3
{
  self->_minimumNumberOfReferencePersons = a3;
}

- (NSSet)referencePersonLocalIdentifiers
{
  return self->_referencePersonLocalIdentifiers;
}

- (void)setReferencePersonLocalIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_referencePersonLocalIdentifiers, a3);
}

- (BOOL)focusOnPeople
{
  return self->_focusOnPeople;
}

- (void)setFocusOnPeople:(BOOL)a3
{
  self->_focusOnPeople = a3;
}

- (BOOL)complete
{
  return self->_complete;
}

- (void)setComplete:(BOOL)a3
{
  self->_complete = a3;
}

- (BOOL)allowContextualTrip
{
  return self->_allowContextualTrip;
}

- (void)setAllowContextualTrip:(BOOL)a3
{
  self->_allowContextualTrip = a3;
}

- (BOOL)useSummarizer
{
  return self->_useSummarizer;
}

- (void)setUseSummarizer:(BOOL)a3
{
  self->_useSummarizer = a3;
}

- (BOOL)useContextualCurationOnly
{
  return self->_useContextualCurationOnly;
}

- (void)setUseContextualCurationOnly:(BOOL)a3
{
  self->_useContextualCurationOnly = a3;
}

- (BOOL)prefilterAssetsWithFaces
{
  return self->_prefilterAssetsWithFaces;
}

- (void)setPrefilterAssetsWithFaces:(BOOL)a3
{
  self->_prefilterAssetsWithFaces = a3;
}

- (double)prefilterAssetsWithFacesThreshold
{
  return self->_prefilterAssetsWithFacesThreshold;
}

- (void)setPrefilterAssetsWithFacesThreshold:(double)a3
{
  self->_prefilterAssetsWithFacesThreshold = a3;
}

- (BOOL)promoteAutoplayableItems
{
  return self->_promoteAutoplayableItems;
}

- (void)setPromoteAutoplayableItems:(BOOL)a3
{
  self->_promoteAutoplayableItems = a3;
}

- (BOOL)isForMemories
{
  return self->_isForMemories;
}

- (void)setIsForMemories:(BOOL)a3
{
  self->_isForMemories = a3;
}

- (BOOL)allowGuestAsset
{
  return self->_allowGuestAsset;
}

- (void)setAllowGuestAsset:(BOOL)a3
{
  self->_allowGuestAsset = a3;
}

- (BOOL)wantsGoodSquareCropScore
{
  return self->_wantsGoodSquareCropScore;
}

- (void)setWantsGoodSquareCropScore:(BOOL)a3
{
  self->_wantsGoodSquareCropScore = a3;
}

- (BOOL)useIconicScore
{
  return self->_useIconicScore;
}

- (void)setUseIconicScore:(BOOL)a3
{
  self->_useIconicScore = a3;
}

- (BOOL)avoidPromotingAutoplayableItemsWhenUsingIconicScore
{
  return self->_avoidPromotingAutoplayableItemsWhenUsingIconicScore;
}

- (void)setAvoidPromotingAutoplayableItemsWhenUsingIconicScore:(BOOL)a3
{
  self->_avoidPromotingAutoplayableItemsWhenUsingIconicScore = a3;
}

- (PHAsset)referenceAsset
{
  return self->_referenceAsset;
}

- (PGCurationCriteria)curationCriteria
{
  return self->_curationCriteria;
}

- (void)setCurationCriteria:(id)a3
{
  objc_storeStrong((id *)&self->_curationCriteria, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_curationCriteria, 0);
  objc_storeStrong((id *)&self->_referenceAsset, 0);
  objc_storeStrong((id *)&self->_referencePersonLocalIdentifiers, 0);
  objc_storeStrong((id *)&self->_referenceLocation, 0);
}

@end
