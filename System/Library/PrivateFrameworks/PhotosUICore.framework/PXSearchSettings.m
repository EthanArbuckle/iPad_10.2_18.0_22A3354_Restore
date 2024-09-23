@implementation PXSearchSettings

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXSearchSettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[PXSearchSettings setIndexingBannerPercentageThreshold:](self, "setIndexingBannerPercentageThreshold:", 95);
}

- (id)parentSettings
{
  return +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
}

- (unint64_t)maxNumberOfSuggestionsToShow
{
  if (self->_maxNumberOfSuggestionsToShow)
    return self->_maxNumberOfSuggestionsToShow;
  else
    return 5;
}

- (unint64_t)maxNumberOfTopAssetColumns
{
  if (self->_maxNumberOfTopAssetColumns)
    return self->_maxNumberOfTopAssetColumns;
  else
    return 6;
}

- (unint64_t)maxNumberOfResultColumns
{
  if (self->_maxNumberOfResultColumns)
    return self->_maxNumberOfResultColumns;
  else
    return 6;
}

- (unint64_t)standardNumberOfTopAssetRows
{
  if (self->_standardNumberOfTopAssetRows)
    return self->_standardNumberOfTopAssetRows;
  else
    return 2;
}

- (unint64_t)maxNumberOfTopAssetRows
{
  if (self->_maxNumberOfTopAssetRows)
    return self->_maxNumberOfTopAssetRows;
  else
    return 3;
}

- (void)setMaxNumberOfSuggestionsToShow:(unint64_t)a3
{
  self->_maxNumberOfSuggestionsToShow = a3;
}

- (void)setMaxNumberOfTopAssetColumns:(unint64_t)a3
{
  self->_maxNumberOfTopAssetColumns = a3;
}

- (void)setMaxNumberOfResultColumns:(unint64_t)a3
{
  self->_maxNumberOfResultColumns = a3;
}

- (void)setMaxNumberOfTopAssetRows:(unint64_t)a3
{
  self->_maxNumberOfTopAssetRows = a3;
}

- (void)setStandardNumberOfTopAssetRows:(unint64_t)a3
{
  self->_standardNumberOfTopAssetRows = a3;
}

- (BOOL)disableTopAssetCuration
{
  return self->_disableTopAssetCuration;
}

- (void)setDisableTopAssetCuration:(BOOL)a3
{
  self->_disableTopAssetCuration = a3;
}

- (BOOL)forceIndexingFooter
{
  return self->_forceIndexingFooter;
}

- (void)setForceIndexingFooter:(BOOL)a3
{
  self->_forceIndexingFooter = a3;
}

- (unint64_t)indexingBannerPercentageThreshold
{
  return self->_indexingBannerPercentageThreshold;
}

- (void)setIndexingBannerPercentageThreshold:(unint64_t)a3
{
  self->_indexingBannerPercentageThreshold = a3;
}

- (BOOL)forceIndexingPausedTitle
{
  return self->_forceIndexingPausedTitle;
}

- (void)setForceIndexingPausedTitle:(BOOL)a3
{
  self->_forceIndexingPausedTitle = a3;
}

- (NSString)overrideMatchedQueryText
{
  return self->_overrideMatchedQueryText;
}

- (void)setOverrideMatchedQueryText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (BOOL)enableAutoCorrect
{
  return self->_enableAutoCorrect;
}

- (void)setEnableAutoCorrect:(BOOL)a3
{
  self->_enableAutoCorrect = a3;
}

- (BOOL)enableEmbeddingSearch
{
  return self->_enableEmbeddingSearch;
}

- (void)setEnableEmbeddingSearch:(BOOL)a3
{
  self->_enableEmbeddingSearch = a3;
}

- (double)embeddingVectorDistanceThreshold
{
  return self->_embeddingVectorDistanceThreshold;
}

- (void)setEmbeddingVectorDistanceThreshold:(double)a3
{
  self->_embeddingVectorDistanceThreshold = a3;
}

- (unint64_t)queryDepersonalizationType
{
  return self->_queryDepersonalizationType;
}

- (void)setQueryDepersonalizationType:(unint64_t)a3
{
  self->_queryDepersonalizationType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideMatchedQueryText, 0);
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_15960 != -1)
    dispatch_once(&sharedInstance_onceToken_15960, &__block_literal_global_15961);
  return (id)sharedInstance_sharedInstance_15962;
}

void __34__PXSearchSettings_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "searchSettings");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sharedInstance_sharedInstance_15962;
  sharedInstance_sharedInstance_15962 = v0;

}

@end
