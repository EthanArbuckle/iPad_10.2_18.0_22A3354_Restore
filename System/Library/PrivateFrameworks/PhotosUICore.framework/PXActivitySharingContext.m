@implementation PXActivitySharingContext

- (PXActivitySharingContext)initWithAssetCollection:(id)a3 photosDataSource:(id)a4
{
  id v7;
  id v8;
  PXActivitySharingContext *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSString *v20;
  id v21;
  void *v22;
  void *v23;
  PHFetchResult *v24;
  PHFetchResult *assetCollectionsFetchResult;
  PHFetchResult *v26;
  NSString *title;
  id v28;
  NSString *subtitle;
  NSString *v30;
  objc_class *v32;
  void *v33;
  void *v34;
  void *v35;
  objc_class *v36;
  void *v37;
  objc_class *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  objc_super v44;
  _QWORD v45[2];

  v45[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v44.receiver = self;
  v44.super_class = (Class)PXActivitySharingContext;
  v9 = -[PXActivitySharingContext init](&v44, sel_init);
  if (!v9)
    goto LABEL_17;
  objc_msgSend(v7, "localizedTitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedSubtitle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v7;
  if (v12)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = (objc_class *)objc_opt_class();
      NSStringFromClass(v32);
      v43 = v8;
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "px_descriptionForAssertionMessage");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, CFSTR("PXActivitySharingContext.m"), 24, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("assetCollection"), v33, v34);

      v8 = v43;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = v12;
    v42 = v8;
    if (v12)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
LABEL_8:
        if (objc_msgSend(v13, "px_highlightKind") == 2)
        {
          objc_msgSend(MEMORY[0x1E0CD1570], "fetchOptionsWithPhotoLibrary:orObject:", 0, v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CD1390], "fetchAllAssetsInYearRepresentedByYearHighlight:options:", v13, v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = (void *)MEMORY[0x1E0CD13B8];
          objc_msgSend(v13, "localizedTitle");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "transientAssetCollectionWithAssetFetchResult:title:", v15, v17);
          v12 = (id)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          objc_msgSend(v13, "smartDescription");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "stringByReplacingOccurrencesOfString:withString:", *MEMORY[0x1E0D71DA0], &stru_1E5149688);
          v19 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(v13, "dateDescription");
          v14 = v11;
          v12 = v13;
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = (void *)v19;
        }

        v8 = v42;
        goto LABEL_12;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = (objc_class *)objc_opt_class();
      NSStringFromClass(v38);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "px_descriptionForAssertionMessage");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, CFSTR("PXActivitySharingContext.m"), 27, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("assetCollection"), v37, v39);

      v35 = v41;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = (objc_class *)objc_opt_class();
      NSStringFromClass(v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, CFSTR("PXActivitySharingContext.m"), 27, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("assetCollection"), v37);
    }

    goto LABEL_8;
  }
LABEL_12:
  if (objc_msgSend(v10, "length") || !objc_msgSend(v11, "length"))
  {
    v20 = (NSString *)v11;
    v11 = v10;
  }
  else
  {

    v20 = 0;
  }
  v21 = objc_alloc(MEMORY[0x1E0CD1620]);
  v45[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "photoLibrary");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (PHFetchResult *)objc_msgSend(v21, "initWithObjects:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", v22, v23, *MEMORY[0x1E0CD1B98], 0, CFSTR("Share Sheet Photos Collection"), 0);

  assetCollectionsFetchResult = v9->_assetCollectionsFetchResult;
  v9->_assetCollectionsFetchResult = v24;
  v26 = v24;

  title = v9->_title;
  v9->_title = (NSString *)v11;
  v28 = v11;

  subtitle = v9->_subtitle;
  v9->_subtitle = v20;
  v30 = v20;

  objc_storeStrong((id *)&v9->_photosDataSource, a4);
LABEL_17:

  return v9;
}

- (PXActivitySharingContext)initWithAssetCollection:(id)a3 assetsDataSource:(id)a4
{
  id v7;
  id v8;
  void *v9;
  PXActivitySharingContext *v10;
  void *v12;
  objc_class *v13;
  void *v14;
  objc_class *v15;
  void *v16;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXActivitySharingContext.m"), 56, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("assetsDataSource"), v14);
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "px_descriptionForAssertionMessage");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXActivitySharingContext.m"), 56, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("assetsDataSource"), v14, v16);

    goto LABEL_6;
  }
LABEL_3:
  objc_msgSend(v8, "photosDataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PXActivitySharingContext initWithAssetCollection:photosDataSource:](self, "initWithAssetCollection:photosDataSource:", v7, v9);

  return v10;
}

- (PXActivitySharingContext)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXActivitySharingContext.m"), 61, CFSTR("%s is not available as initializer"), "-[PXActivitySharingContext init]");

  abort();
}

- (PHFetchResult)assetCollectionsFetchResult
{
  return self->_assetCollectionsFetchResult;
}

- (PXPhotosDataSource)photosDataSource
{
  return self->_photosDataSource;
}

- (NSArray)activities
{
  return self->_activities;
}

- (void)setActivities:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)excludedActivityTypes
{
  return self->_excludedActivityTypes;
}

- (void)setExcludedActivityTypes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)wantsActionSheet
{
  return self->_wantsActionSheet;
}

- (void)setWantsActionSheet:(BOOL)a3
{
  self->_wantsActionSheet = a3;
}

- (BOOL)excludeShareActivity
{
  return self->_excludeShareActivity;
}

- (void)setExcludeShareActivity:(BOOL)a3
{
  self->_excludeShareActivity = a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (PXDisplayAsset)keyAsset
{
  return self->_keyAsset;
}

- (void)setKeyAsset:(id)a3
{
  objc_storeStrong((id *)&self->_keyAsset, a3);
}

- (PHPerson)person
{
  return self->_person;
}

- (void)setPerson:(id)a3
{
  objc_storeStrong((id *)&self->_person, a3);
}

- (int64_t)sourceOrigin
{
  return self->_sourceOrigin;
}

- (void)setSourceOrigin:(int64_t)a3
{
  self->_sourceOrigin = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_person, 0);
  objc_storeStrong((id *)&self->_keyAsset, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_excludedActivityTypes, 0);
  objc_storeStrong((id *)&self->_activities, 0);
  objc_storeStrong((id *)&self->_photosDataSource, 0);
  objc_storeStrong((id *)&self->_assetCollectionsFetchResult, 0);
}

@end
