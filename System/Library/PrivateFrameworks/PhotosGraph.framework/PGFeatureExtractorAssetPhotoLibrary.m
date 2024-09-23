@implementation PGFeatureExtractorAssetPhotoLibrary

- (PGFeatureExtractorAssetPhotoLibrary)initWithPhotoLibraryFeatureExtractor:(id)a3
{
  id v5;
  PGFeatureExtractorAssetPhotoLibrary *v6;
  PGFeatureExtractorAssetPhotoLibrary *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGFeatureExtractorAssetPhotoLibrary;
  v6 = -[PGFeatureExtractorAssetPhotoLibrary init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_photoLibraryFeatureExtractor, a3);

  return v7;
}

- (id)name
{
  void *v2;
  void *v3;

  -[PGFeatureExtractorAssetPhotoLibrary photoLibraryFeatureExtractor](self, "photoLibraryFeatureExtractor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)featureNames
{
  void *v2;
  void *v3;

  -[PGFeatureExtractorAssetPhotoLibrary photoLibraryFeatureExtractor](self, "photoLibraryFeatureExtractor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "featureNames");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)featureLength
{
  void *v2;
  void *v3;
  int64_t v4;

  -[PGFeatureExtractorAssetPhotoLibrary photoLibraryFeatureExtractor](self, "photoLibraryFeatureExtractor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "featureNames");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (id)floatVectorWithEntity:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  -[PGFeatureExtractorAssetPhotoLibrary photoLibraryFeatureExtractor](self, "photoLibraryFeatureExtractor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "photoLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "floatVectorWithEntity:error:", v8, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (MAFeatureExtractor)photoLibraryFeatureExtractor
{
  return self->_photoLibraryFeatureExtractor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoLibraryFeatureExtractor, 0);
}

@end
