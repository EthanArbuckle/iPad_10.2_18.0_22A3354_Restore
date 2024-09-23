@implementation PXStoryDefaultDisplayAssetCroppingContext

- (PXStoryDefaultDisplayAssetCroppingContext)init
{
  return -[PXStoryDefaultDisplayAssetCroppingContext initWithAssetCollection:detailedSaliency:](self, "initWithAssetCollection:detailedSaliency:", 0, 0);
}

- (PXStoryDefaultDisplayAssetCroppingContext)initWithAssetCollection:(id)a3 detailedSaliency:(id)a4
{
  id v7;
  id v8;
  PXStoryDefaultDisplayAssetCroppingContext *v9;
  PXStoryDefaultDisplayAssetCroppingContext *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXStoryDefaultDisplayAssetCroppingContext;
  v9 = -[PXStoryBaseDisplayAssetCroppingContext init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_assetCollection, a3);
    objc_storeStrong((id *)&v10->_detailedSaliency, a4);
  }

  return v10;
}

- (NSSet)featuredPersonLocalIdentifiers
{
  PXStoryDefaultDisplayAssetCroppingContext *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  NSSet *featuredPersonLocalIdentifiers;
  NSSet *v9;
  NSSet *v10;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_featuredPersonLocalIdentifiers)
  {
    -[PXStoryDefaultDisplayAssetCroppingContext assetCollection](v2, "assetCollection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v3, "featuredPersonLocalIdentifiers");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_alloc(MEMORY[0x1E0C99E60]);
      PXMap();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "initWithArray:", v6);
      featuredPersonLocalIdentifiers = v2->_featuredPersonLocalIdentifiers;
      v2->_featuredPersonLocalIdentifiers = (NSSet *)v7;

    }
    if (!v2->_featuredPersonLocalIdentifiers)
    {
      v9 = (NSSet *)objc_alloc_init(MEMORY[0x1E0C99E60]);
      v10 = v2->_featuredPersonLocalIdentifiers;
      v2->_featuredPersonLocalIdentifiers = v9;

    }
  }
  objc_sync_exit(v2);

  return v2->_featuredPersonLocalIdentifiers;
}

- (id)orderFaces:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  id v18;
  void *v19;
  uint64_t i;
  void *v21;
  uint64_t v22;

  v3 = a3;
  v4 = objc_msgSend(v3, "count");
  if (v4 < 1)
  {
    v18 = v3;
  }
  else
  {
    v5 = v4;
    v6 = 0;
    v7 = -1.79769313e308;
    do
    {
      objc_msgSend(v3, "objectAtIndexedSubscript:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "size");
      v10 = v9;

      if (v7 < v10)
        v7 = v10;
      ++v6;
    }
    while (v5 != v6);
    v11 = 0;
    v12 = v7 * 0.9;
    v13 = 0x7FFFFFFFFFFFFFFFLL;
    v14 = -1.79769313e308;
    do
    {
      objc_msgSend(v3, "objectAtIndexedSubscript:", v11);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "size");
      if (v16 >= v12)
      {
        objc_msgSend(v15, "quality");
        if (v17 > v14)
        {
          v13 = v11;
          v14 = v17;
        }
      }

      ++v11;
    }
    while (v5 != v11);
    v18 = v3;
    if (v13 && v13 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v5);
      for (i = 0; i != v5; ++i)
      {
        objc_msgSend(v18, "objectAtIndexedSubscript:", i);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13 == i)
          objc_msgSend(v19, "insertObject:atIndex:", v21, 0);
        else
          objc_msgSend(v19, "addObject:", v21);

      }
      v22 = objc_msgSend(v19, "copy");

      v18 = (id)v22;
    }
  }

  return v18;
}

- (id)adjustOrderedFaces:(id)a3 featuredFaceCount:(int64_t *)a4 forFeaturedPersonWithLocalIdentifiers:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  int64_t *v23;

  v7 = a3;
  v8 = a5;
  v9 = v7;
  v10 = objc_msgSend(v9, "count");
  if (v10 < 1 || (v11 = v10, !objc_msgSend(v8, "count")))
  {
    v13 = 0;
    v21 = v9;
    if (!a4)
      goto LABEL_16;
LABEL_15:
    *a4 = v13;
    goto LABEL_16;
  }
  v23 = a4;
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v11);
  v13 = 0;
  for (i = 0; i != v11; ++i)
  {
    objc_msgSend(v9, "objectAtIndexedSubscript:", i);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "personLocalIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD16C0], "uuidFromLocalIdentifier:", v16);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v17;
    if (v17)
      v19 = (void *)v17;
    else
      v19 = v16;
    v20 = v19;

    if (v20 && objc_msgSend(v8, "containsObject:", v20))
      objc_msgSend(v12, "insertObject:atIndex:", v15, v13++);
    else
      objc_msgSend(v12, "addObject:", v15);

  }
  v21 = (void *)objc_msgSend(v12, "copy");

  a4 = v23;
  if (v23)
    goto LABEL_15;
LABEL_16:

  return v21;
}

- (id)adjustOrderedFaces:(id)a3 featuredFaceCount:(int64_t *)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;
  int64_t v12;

  v11.receiver = self;
  v11.super_class = (Class)PXStoryDefaultDisplayAssetCroppingContext;
  v12 = 0;
  -[PXStoryBaseDisplayAssetCroppingContext adjustOrderedFaces:featuredFaceCount:](&v11, sel_adjustOrderedFaces_featuredFaceCount_, a3, &v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryDefaultDisplayAssetCroppingContext orderFaces:](self, "orderFaces:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXStoryDefaultDisplayAssetCroppingContext featuredPersonLocalIdentifiers](self, "featuredPersonLocalIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryDefaultDisplayAssetCroppingContext adjustOrderedFaces:featuredFaceCount:forFeaturedPersonWithLocalIdentifiers:](self, "adjustOrderedFaces:featuredFaceCount:forFeaturedPersonWithLocalIdentifiers:", v7, &v12, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
    v12 = objc_msgSend(v9, "count") != 0;
  if (a4)
    *a4 = v12;
  return v9;
}

- (id)cropContentRectsForMultipartPanoramaAsset:(id)a3 axis:(int64_t)a4 cropContentsRectsApectRatio:(double)a5
{
  id v8;
  void *v9;
  void *v10;
  PXStoryMultipartPanoramaCropFinder *v11;
  void *v12;

  v8 = a3;
  -[PXStoryDefaultDisplayAssetCroppingContext detailedSaliency](self, "detailedSaliency");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "saliencyAreasForDisplayAsset:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[PXStoryMultipartPanoramaCropFinder initWithSaliencyAreas:]([PXStoryMultipartPanoramaCropFinder alloc], "initWithSaliencyAreas:", v10);
  -[PXStoryMultipartPanoramaCropFinder bestCropContentsRectsWithAspectRatio:axis:](v11, "bestCropContentsRectsWithAspectRatio:axis:", a4, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (PXDisplayAssetCollection)assetCollection
{
  return self->_assetCollection;
}

- (PXStorySaliencyDataSource)detailedSaliency
{
  return self->_detailedSaliency;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detailedSaliency, 0);
  objc_storeStrong((id *)&self->_assetCollection, 0);
  objc_storeStrong((id *)&self->_featuredPersonLocalIdentifiers, 0);
}

uint64_t __75__PXStoryDefaultDisplayAssetCroppingContext_featuredPersonLocalIdentifiers__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0CD16C0], "uuidFromLocalIdentifier:", a2);
}

@end
