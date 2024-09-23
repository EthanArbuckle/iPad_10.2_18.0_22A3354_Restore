@implementation PGHighlightEnrichmentValues

- (PGHighlightEnrichmentValues)initWithHighlight:(id)a3
{
  id v5;
  PGHighlightEnrichmentValues *v6;
  PGHighlightEnrichmentValues *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGHighlightEnrichmentValues;
  v6 = -[PGHighlightEnrichmentValues init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_highlight, a3);
    v7->_mood = -1;
    v7->_promotionScore = -1.0;
    v7->_enrichmentState = -1;
  }

  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  const __CFString *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v9.receiver = self;
  v9.super_class = (Class)PGHighlightEnrichmentValues;
  -[PGHighlightEnrichmentValues description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PGHighlightEnrichmentValues hasChanges](self, "hasChanges");
  v6 = CFSTR("No");
  if (v5)
    v6 = CFSTR("Yes");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ - hasChanges: %@"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)hasChanges
{
  return self->_clearCurations
      || self->_promotionScore != -1.0
      || self->_smartDescriptionPrivate
      || self->_verboseSmartDescriptionPrivate
      || self->_smartDescriptionShared
      || self->_verboseSmartDescriptionShared
      || self->_smartDescriptionMixed
      || self->_verboseSmartDescriptionMixed
      || self->_keyAssetPrivate
      || self->_keyAssetShared
      || self->_mixedSharingCompositionKeyAssetRelationshipValue
      || self->_extendedCuration
      || self->_summaryCuration
      || self->_momentTitleByMomentUUID
      || self->_momentProcessedLocationByMomentUUID
      || self->_mood != -1
      || self->_visibilityScoreByAsset
      || (__int16)self->_enrichmentState != -1;
}

- (BOOL)smartDescriptionPrivateUpdated
{
  return self->_smartDescriptionPrivate != 0;
}

- (BOOL)verboseSmartDescriptionPrivateUpdated
{
  return self->_verboseSmartDescriptionPrivate != 0;
}

- (BOOL)smartDescriptionSharedUpdated
{
  return self->_smartDescriptionShared != 0;
}

- (BOOL)verboseSmartDescriptionSharedUpdated
{
  return self->_verboseSmartDescriptionShared != 0;
}

- (BOOL)smartDescriptionMixedUpdated
{
  return self->_smartDescriptionMixed != 0;
}

- (BOOL)verboseSmartDescriptionMixedUpdated
{
  return self->_verboseSmartDescriptionMixed != 0;
}

- (NSString)smartDescriptionPrivate
{
  if ((__CFString *)self->_smartDescriptionPrivate == CFSTR("\t"))
    return (NSString *)0;
  else
    return self->_smartDescriptionPrivate;
}

- (NSString)verboseSmartDescriptionPrivate
{
  if ((__CFString *)self->_verboseSmartDescriptionPrivate == CFSTR("\t"))
    return (NSString *)0;
  else
    return self->_verboseSmartDescriptionPrivate;
}

- (NSString)smartDescriptionShared
{
  if ((__CFString *)self->_smartDescriptionShared == CFSTR("\t"))
    return (NSString *)0;
  else
    return self->_smartDescriptionShared;
}

- (NSString)verboseSmartDescriptionShared
{
  if ((__CFString *)self->_verboseSmartDescriptionShared == CFSTR("\t"))
    return (NSString *)0;
  else
    return self->_verboseSmartDescriptionShared;
}

- (NSString)smartDescriptionMixed
{
  if ((__CFString *)self->_smartDescriptionMixed == CFSTR("\t"))
    return (NSString *)0;
  else
    return self->_smartDescriptionMixed;
}

- (NSString)verboseSmartDescriptionMixed
{
  if ((__CFString *)self->_verboseSmartDescriptionMixed == CFSTR("\t"))
    return (NSString *)0;
  else
    return self->_verboseSmartDescriptionMixed;
}

- (void)setSmartDescriptionPrivate:(id)a3
{
  NSString *v4;
  NSString *smartDescriptionPrivate;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "length"))
    v4 = (NSString *)objc_msgSend(v6, "copy");
  else
    v4 = (NSString *)CFSTR("\t");
  smartDescriptionPrivate = self->_smartDescriptionPrivate;
  self->_smartDescriptionPrivate = v4;

}

- (void)setVerboseSmartDescriptionPrivate:(id)a3
{
  NSString *v4;
  NSString *verboseSmartDescriptionPrivate;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "length"))
    v4 = (NSString *)objc_msgSend(v6, "copy");
  else
    v4 = (NSString *)CFSTR("\t");
  verboseSmartDescriptionPrivate = self->_verboseSmartDescriptionPrivate;
  self->_verboseSmartDescriptionPrivate = v4;

}

- (void)setSmartDescriptionShared:(id)a3
{
  NSString *v4;
  NSString *smartDescriptionShared;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "length"))
    v4 = (NSString *)objc_msgSend(v6, "copy");
  else
    v4 = (NSString *)CFSTR("\t");
  smartDescriptionShared = self->_smartDescriptionShared;
  self->_smartDescriptionShared = v4;

}

- (void)setVerboseSmartDescriptionShared:(id)a3
{
  NSString *v4;
  NSString *verboseSmartDescriptionShared;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "length"))
    v4 = (NSString *)objc_msgSend(v6, "copy");
  else
    v4 = (NSString *)CFSTR("\t");
  verboseSmartDescriptionShared = self->_verboseSmartDescriptionShared;
  self->_verboseSmartDescriptionShared = v4;

}

- (void)setSmartDescriptionMixed:(id)a3
{
  NSString *v4;
  NSString *smartDescriptionMixed;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "length"))
    v4 = (NSString *)objc_msgSend(v6, "copy");
  else
    v4 = (NSString *)CFSTR("\t");
  smartDescriptionMixed = self->_smartDescriptionMixed;
  self->_smartDescriptionMixed = v4;

}

- (void)setVerboseSmartDescriptionMixed:(id)a3
{
  NSString *v4;
  NSString *verboseSmartDescriptionMixed;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "length"))
    v4 = (NSString *)objc_msgSend(v6, "copy");
  else
    v4 = (NSString *)CFSTR("\t");
  verboseSmartDescriptionMixed = self->_verboseSmartDescriptionMixed;
  self->_verboseSmartDescriptionMixed = v4;

}

- (PGHighlightModel)highlight
{
  return self->_highlight;
}

- (BOOL)clearCurations
{
  return self->_clearCurations;
}

- (void)setClearCurations:(BOOL)a3
{
  self->_clearCurations = a3;
}

- (double)promotionScore
{
  return self->_promotionScore;
}

- (void)setPromotionScore:(double)a3
{
  self->_promotionScore = a3;
}

- (PHAsset)keyAssetPrivate
{
  return self->_keyAssetPrivate;
}

- (void)setKeyAssetPrivate:(id)a3
{
  objc_storeStrong((id *)&self->_keyAssetPrivate, a3);
}

- (PHAsset)keyAssetShared
{
  return self->_keyAssetShared;
}

- (void)setKeyAssetShared:(id)a3
{
  objc_storeStrong((id *)&self->_keyAssetShared, a3);
}

- (NSNumber)mixedSharingCompositionKeyAssetRelationshipValue
{
  return self->_mixedSharingCompositionKeyAssetRelationshipValue;
}

- (void)setMixedSharingCompositionKeyAssetRelationshipValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSArray)extendedCuration
{
  return self->_extendedCuration;
}

- (void)setExtendedCuration:(id)a3
{
  objc_storeStrong((id *)&self->_extendedCuration, a3);
}

- (NSArray)summaryCuration
{
  return self->_summaryCuration;
}

- (void)setSummaryCuration:(id)a3
{
  objc_storeStrong((id *)&self->_summaryCuration, a3);
}

- (NSDictionary)momentTitleByMomentUUID
{
  return self->_momentTitleByMomentUUID;
}

- (void)setMomentTitleByMomentUUID:(id)a3
{
  objc_storeStrong((id *)&self->_momentTitleByMomentUUID, a3);
}

- (NSDictionary)momentProcessedLocationByMomentUUID
{
  return self->_momentProcessedLocationByMomentUUID;
}

- (void)setMomentProcessedLocationByMomentUUID:(id)a3
{
  objc_storeStrong((id *)&self->_momentProcessedLocationByMomentUUID, a3);
}

- (unint64_t)mood
{
  return self->_mood;
}

- (void)setMood:(unint64_t)a3
{
  self->_mood = a3;
}

- (NSMapTable)visibilityScoreByAsset
{
  return self->_visibilityScoreByAsset;
}

- (void)setVisibilityScoreByAsset:(id)a3
{
  objc_storeStrong((id *)&self->_visibilityScoreByAsset, a3);
}

- (unsigned)enrichmentState
{
  return self->_enrichmentState;
}

- (void)setEnrichmentState:(unsigned __int16)a3
{
  self->_enrichmentState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visibilityScoreByAsset, 0);
  objc_storeStrong((id *)&self->_momentProcessedLocationByMomentUUID, 0);
  objc_storeStrong((id *)&self->_momentTitleByMomentUUID, 0);
  objc_storeStrong((id *)&self->_summaryCuration, 0);
  objc_storeStrong((id *)&self->_extendedCuration, 0);
  objc_storeStrong((id *)&self->_mixedSharingCompositionKeyAssetRelationshipValue, 0);
  objc_storeStrong((id *)&self->_keyAssetShared, 0);
  objc_storeStrong((id *)&self->_keyAssetPrivate, 0);
  objc_storeStrong((id *)&self->_verboseSmartDescriptionMixed, 0);
  objc_storeStrong((id *)&self->_smartDescriptionMixed, 0);
  objc_storeStrong((id *)&self->_verboseSmartDescriptionShared, 0);
  objc_storeStrong((id *)&self->_smartDescriptionShared, 0);
  objc_storeStrong((id *)&self->_verboseSmartDescriptionPrivate, 0);
  objc_storeStrong((id *)&self->_smartDescriptionPrivate, 0);
  objc_storeStrong((id *)&self->_highlight, 0);
}

@end
