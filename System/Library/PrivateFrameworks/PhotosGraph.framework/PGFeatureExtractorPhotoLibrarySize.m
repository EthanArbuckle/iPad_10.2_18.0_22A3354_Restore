@implementation PGFeatureExtractorPhotoLibrarySize

+ (BOOL)preCalculatePhotoLibrarySizeWithPhotoLibrary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(a1, "resetPreCalculatedPhotoLibrarySize");
  objc_msgSend(v4, "librarySpecificFetchOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setWantsIncrementalChangeDetails:", 0);
  objc_msgSend(v5, "setShouldPrefetchCount:", 1);
  objc_msgSend(v5, "setIsExclusivePredicate:", 1);
  objc_msgSend(a1, "_allAssetsOfType:withOptions:", 1, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_allAssetsOfType:withOptions:", 2, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setPreCalculatedPhotoLibrarySize:", objc_msgSend(v7, "count") + objc_msgSend(v6, "count"));

  return 1;
}

+ (id)_allAssetsOfType:(int64_t)a3 withOptions:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithMediaType:options:", a3, a4);
}

+ (void)resetPreCalculatedPhotoLibrarySize
{
  objc_msgSend(a1, "setPreCalculatedPhotoLibrarySize:", 0);
}

+ (unint64_t)preCalculatedPhotoLibrarySize
{
  return preCalculatedPhotoLibrarySize;
}

+ (void)setPreCalculatedPhotoLibrarySize:(unint64_t)a3
{
  preCalculatedPhotoLibrarySize = a3;
}

- (id)name
{
  __CFString *v2;

  v2 = CFSTR("PhotoLibrarySize");
  return CFSTR("PhotoLibrarySize");
}

- (id)featureNames
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("PhotoLibrarySize");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)featureLength
{
  return 1;
}

- (id)floatVectorWithEntity:(id)a3 error:(id *)a4
{
  id v4;
  unint64_t v5;
  id v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend((id)objc_opt_class(), "preCalculatedPhotoLibrarySize");
  if (!v5)
  {
    if (!objc_msgSend((id)objc_opt_class(), "preCalculatePhotoLibrarySizeWithPhotoLibrary:", v4))
    {
      v10 = 0;
      goto LABEL_5;
    }
    v5 = objc_msgSend((id)objc_opt_class(), "preCalculatedPhotoLibrarySize");
  }
  v6 = objc_alloc(MEMORY[0x1E0D42A20]);
  *(float *)&v7 = (float)v5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v6, "initWithArray:", v9);

LABEL_5:
  return v10;
}

@end
