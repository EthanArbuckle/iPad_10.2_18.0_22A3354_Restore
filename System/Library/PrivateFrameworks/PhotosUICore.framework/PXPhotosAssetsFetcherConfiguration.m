@implementation PXPhotosAssetsFetcherConfiguration

- (PXPhotosAssetsFetcherConfiguration)init
{
  PXPhotosAssetsFetcherConfiguration *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXPhotosAssetsFetcherConfiguration;
  result = -[PXPhotosAssetsFetcherConfiguration init](&v3, sel_init);
  if (result)
  {
    *(_WORD *)&result->_includeUnsavedSyndicatedAssets = 0;
    result->_reverseSortOrder = 0;
    result->_curationType = 0;
    result->_includeOthersInSocialGroupAssets = 0;
    *(_OWORD *)&result->_curationKind = 0u;
    *(_OWORD *)&result->_options = 0u;
    result->_fetchLimit = 0;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PXPhotosAssetsFetcherConfiguration *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = objc_alloc_init(PXPhotosAssetsFetcherConfiguration);
  -[PXPhotosAssetsFetcherConfiguration setCurationKind:](v4, "setCurationKind:", -[PXPhotosAssetsFetcherConfiguration curationKind](self, "curationKind"));
  -[PXPhotosAssetsFetcherConfiguration setCurationLength:](v4, "setCurationLength:", -[PXPhotosAssetsFetcherConfiguration curationLength](self, "curationLength"));
  -[PXPhotosAssetsFetcherConfiguration setOptions:](v4, "setOptions:", -[PXPhotosAssetsFetcherConfiguration options](self, "options"));
  -[PXPhotosAssetsFetcherConfiguration setLibraryFilter:](v4, "setLibraryFilter:", -[PXPhotosAssetsFetcherConfiguration libraryFilter](self, "libraryFilter"));
  -[PXPhotosAssetsFetcherConfiguration setFetchLimit:](v4, "setFetchLimit:", -[PXPhotosAssetsFetcherConfiguration fetchLimit](self, "fetchLimit"));
  -[PXPhotosAssetsFetcherConfiguration filterPredicate](self, "filterPredicate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosAssetsFetcherConfiguration setFilterPredicate:](v4, "setFilterPredicate:", v5);

  -[PXPhotosAssetsFetcherConfiguration inclusionPredicate](self, "inclusionPredicate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosAssetsFetcherConfiguration setInclusionPredicate:](v4, "setInclusionPredicate:", v6);

  -[PXPhotosAssetsFetcherConfiguration sortDescriptors](self, "sortDescriptors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosAssetsFetcherConfiguration setSortDescriptors:](v4, "setSortDescriptors:", v7);

  -[PXPhotosAssetsFetcherConfiguration fetchPropertySets](self, "fetchPropertySets");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosAssetsFetcherConfiguration setFetchPropertySets:](v4, "setFetchPropertySets:", v8);

  -[PXPhotosAssetsFetcherConfiguration setIncludeUnsavedSyndicatedAssets:](v4, "setIncludeUnsavedSyndicatedAssets:", -[PXPhotosAssetsFetcherConfiguration includeUnsavedSyndicatedAssets](self, "includeUnsavedSyndicatedAssets"));
  -[PXPhotosAssetsFetcherConfiguration setIncludeAllBurstAssets:](v4, "setIncludeAllBurstAssets:", -[PXPhotosAssetsFetcherConfiguration includeAllBurstAssets](self, "includeAllBurstAssets"));
  -[PXPhotosAssetsFetcherConfiguration setReverseSortOrder:](v4, "setReverseSortOrder:", -[PXPhotosAssetsFetcherConfiguration reverseSortOrder](self, "reverseSortOrder"));
  -[PXPhotosAssetsFetcherConfiguration setHideHiddenAssets:](v4, "setHideHiddenAssets:", -[PXPhotosAssetsFetcherConfiguration hideHiddenAssets](self, "hideHiddenAssets"));
  -[PXPhotosAssetsFetcherConfiguration setCurationType:](v4, "setCurationType:", -[PXPhotosAssetsFetcherConfiguration curationType](self, "curationType"));
  -[PXPhotosAssetsFetcherConfiguration referencePersons](self, "referencePersons");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosAssetsFetcherConfiguration setReferencePersons:](v4, "setReferencePersons:", v9);

  -[PXPhotosAssetsFetcherConfiguration referenceAsset](self, "referenceAsset");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosAssetsFetcherConfiguration setReferenceAsset:](v4, "setReferenceAsset:", v10);

  -[PXPhotosAssetsFetcherConfiguration setIncludeOthersInSocialGroupAssets:](v4, "setIncludeOthersInSocialGroupAssets:", -[PXPhotosAssetsFetcherConfiguration includeOthersInSocialGroupAssets](self, "includeOthersInSocialGroupAssets"));
  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PXDisplayAssetCollectionCurationKindDescription(self->_curationKind);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PXDisplayAssetCollectionCurationLengthDescription();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p; curationKind:%@, curationLength:%@>"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (int64_t)curationKind
{
  return self->_curationKind;
}

- (void)setCurationKind:(int64_t)a3
{
  self->_curationKind = a3;
}

- (int64_t)curationLength
{
  return self->_curationLength;
}

- (void)setCurationLength:(int64_t)a3
{
  self->_curationLength = a3;
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (int64_t)libraryFilter
{
  return self->_libraryFilter;
}

- (void)setLibraryFilter:(int64_t)a3
{
  self->_libraryFilter = a3;
}

- (int64_t)fetchLimit
{
  return self->_fetchLimit;
}

- (void)setFetchLimit:(int64_t)a3
{
  self->_fetchLimit = a3;
}

- (NSPredicate)filterPredicate
{
  return self->_filterPredicate;
}

- (void)setFilterPredicate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSPredicate)inclusionPredicate
{
  return self->_inclusionPredicate;
}

- (void)setInclusionPredicate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSArray)sortDescriptors
{
  return self->_sortDescriptors;
}

- (void)setSortDescriptors:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSArray)fetchPropertySets
{
  return self->_fetchPropertySets;
}

- (void)setFetchPropertySets:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (BOOL)includeUnsavedSyndicatedAssets
{
  return self->_includeUnsavedSyndicatedAssets;
}

- (void)setIncludeUnsavedSyndicatedAssets:(BOOL)a3
{
  self->_includeUnsavedSyndicatedAssets = a3;
}

- (BOOL)includeAllBurstAssets
{
  return self->_includeAllBurstAssets;
}

- (void)setIncludeAllBurstAssets:(BOOL)a3
{
  self->_includeAllBurstAssets = a3;
}

- (BOOL)reverseSortOrder
{
  return self->_reverseSortOrder;
}

- (void)setReverseSortOrder:(BOOL)a3
{
  self->_reverseSortOrder = a3;
}

- (BOOL)hideHiddenAssets
{
  return self->_hideHiddenAssets;
}

- (void)setHideHiddenAssets:(BOOL)a3
{
  self->_hideHiddenAssets = a3;
}

- (int64_t)curationType
{
  return self->_curationType;
}

- (void)setCurationType:(int64_t)a3
{
  self->_curationType = a3;
}

- (NSArray)referencePersons
{
  return self->_referencePersons;
}

- (void)setReferencePersons:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (PHAsset)referenceAsset
{
  return self->_referenceAsset;
}

- (void)setReferenceAsset:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (BOOL)includeOthersInSocialGroupAssets
{
  return self->_includeOthersInSocialGroupAssets;
}

- (void)setIncludeOthersInSocialGroupAssets:(BOOL)a3
{
  self->_includeOthersInSocialGroupAssets = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referenceAsset, 0);
  objc_storeStrong((id *)&self->_referencePersons, 0);
  objc_storeStrong((id *)&self->_fetchPropertySets, 0);
  objc_storeStrong((id *)&self->_sortDescriptors, 0);
  objc_storeStrong((id *)&self->_inclusionPredicate, 0);
  objc_storeStrong((id *)&self->_filterPredicate, 0);
}

@end
