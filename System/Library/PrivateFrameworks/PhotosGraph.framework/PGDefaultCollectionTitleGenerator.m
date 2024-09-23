@implementation PGDefaultCollectionTitleGenerator

- (PGDefaultCollectionTitleGenerator)initWithCollection:(id)a3 keyAsset:(id)a4 curatedAssetCollection:(id)a5 titleGenerationContext:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  PGDefaultCollectionTitleGenerator *v17;
  objc_super v19;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  objc_msgSend(v11, "eventEnrichmentMomentNodes");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "temporarySet");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v19.receiver = self;
  v19.super_class = (Class)PGDefaultCollectionTitleGenerator;
  v17 = -[PGTitleGenerator initWithMomentNodes:type:titleGenerationContext:](&v19, sel_initWithMomentNodes_type_titleGenerationContext_, v16, 0, v14);

  if (v17)
  {
    objc_storeStrong((id *)&v17->_collection, a3);
    v17->_debug = 0;
    objc_storeStrong((id *)&v17->_keyAsset, a4);
    objc_storeStrong((id *)&v17->_curatedAssetCollection, a5);
  }

  return v17;
}

- (void)_generateTitleAndSubtitleWithManager:(id)a3 curationContext:(id)a4 result:(id)a5
{
  id v8;
  void (**v9)(id, void *, void *);
  void *v10;
  PHAsset *v11;
  PHAssetCollection *v12;
  PGEventEnrichment *collection;
  void *v14;
  PHAssetCollection *curatedAssetCollection;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  PGTitleGenerator *v23;
  void *v24;
  PGTitleGenerator *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;

  v30 = a3;
  v8 = a4;
  v9 = (void (**)(id, void *, void *))a5;
  v29 = v8;
  if (self->_forDiagnostics)
  {
    v10 = 0;
LABEL_3:
    v11 = 0;
    v12 = 0;
    goto LABEL_11;
  }
  collection = self->_collection;
  objc_msgSend(v30, "photoLibrary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGEventEnrichment fetchAssetCollectionInPhotoLibrary:](collection, "fetchAssetCollectionInPhotoLibrary:", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  curatedAssetCollection = self->_curatedAssetCollection;
  if (!curatedAssetCollection)
  {
    if (v10)
    {
      +[PGCurationOptions defaultOptions](PGCurationOptions, "defaultOptions");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[PGTitleGenerator momentNodes](self, "momentNodes");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setIncludesAllFaces:", objc_msgSend(v17, "count") == 1);

      objc_msgSend(v30, "curationManager");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "curatedAssetsForAssetCollection:options:curationContext:progressBlock:", v10, v16, v8, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        objc_msgSend(MEMORY[0x1E0CD13B8], "transientAssetCollectionWithAssets:title:", v19, 0);
        v12 = (PHAssetCollection *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "curationManager");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[PGEventEnrichment uuid](self->_collection, "uuid");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "curatedKeyAssetForCollectionUUID:curatedAssetCollection:options:criteria:curationContext:", v21, v12, 0, 0, v8);
        v11 = (PHAsset *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v11 = 0;
        v12 = 0;
      }

      goto LABEL_11;
    }
    goto LABEL_3;
  }
  v12 = curatedAssetCollection;
  v11 = self->_keyAsset;
LABEL_11:
  -[PGTitleGenerator momentNodes](self, "momentNodes");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = [PGTitleGenerator alloc];
  -[PGTitleGenerator titleGenerationContext](self, "titleGenerationContext");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = -[PGTitleGenerator initWithMomentNodes:referenceDateInterval:keyAsset:curatedAssetCollection:assetCollection:type:titleGenerationContext:](v23, "initWithMomentNodes:referenceDateInterval:keyAsset:curatedAssetCollection:assetCollection:type:titleGenerationContext:", v22, 0, v11, v12, v10, 0, v24);

  -[PGTitleGenerator title](v25, "title");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGTitleGenerator subtitle](v25, "subtitle");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGTitleGenerator usedLocationNodes](v25, "usedLocationNodes");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGTitleGenerator setUsedLocationNodes:](self, "setUsedLocationNodes:", v28);

  if (v9)
    v9[2](v9, v26, v27);

}

- (PGEventEnrichment)collection
{
  return self->_collection;
}

- (BOOL)isDebug
{
  return self->_debug;
}

- (void)setDebug:(BOOL)a3
{
  self->_debug = a3;
}

- (PHAsset)keyAsset
{
  return self->_keyAsset;
}

- (PHAssetCollection)curatedAssetCollection
{
  return self->_curatedAssetCollection;
}

- (BOOL)forDiagnostics
{
  return self->_forDiagnostics;
}

- (void)setForDiagnostics:(BOOL)a3
{
  self->_forDiagnostics = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_curatedAssetCollection, 0);
  objc_storeStrong((id *)&self->_keyAsset, 0);
  objc_storeStrong((id *)&self->_collection, 0);
}

@end
