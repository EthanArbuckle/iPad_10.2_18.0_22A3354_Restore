@implementation PGWallpaperLibraryAnalysisSummary

- (PGWallpaperLibraryAnalysisSummary)initWithPhotoLibrary:(id)a3
{
  id v4;
  PGWallpaperLibraryAnalysisSummary *v5;
  PGWallpaperLibraryAnalysisSummary *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  BOOL v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PGWallpaperLibraryAnalysisSummary;
  v5 = -[PGWallpaperLibraryAnalysisSummary init](&v17, sel_init);
  v6 = v5;
  if (v5)
  {
    *(_WORD *)&v5->_libraryIsProcessedEnough = 0;
    v5->_ratioOfAssetsAtOrAboveSceneAnalysisVersion = 0.0;
    v5->_ratioOfAssetsAtOrAboveFaceAnalysisVersion = 0.0;
    objc_msgSend(v4, "ratioOfAssetsAtOrAboveSceneAnalysisVersion:", 88);
    v6->_ratioOfAssetsAtOrAboveSceneAnalysisVersion = v7;
    objc_msgSend(v4, "faceAnalysisProgressCounts");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D475E0]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D475F0]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "doubleValue");
    v12 = v11;

    v13 = 0.0;
    if (v12 > 0.0)
    {
      objc_msgSend(v9, "doubleValue", 0.0);
      v13 = v14 / v12;
    }
    v6->_ratioOfAssetsAtOrAboveFaceAnalysisVersion = v13;
    v15 = v6->_ratioOfAssetsAtOrAboveSceneAnalysisVersion >= 0.75;
    if (v13 < 0.75)
      v15 = 0;
    v6->_libraryIsProcessedEnough = v15;
    v6->_libraryIsEmpty = v12 == 0.0;

  }
  return v6;
}

- (double)ratioOfAssetsAtOrAboveSceneAnalysisVersion
{
  return self->_ratioOfAssetsAtOrAboveSceneAnalysisVersion;
}

- (double)ratioOfAssetsAtOrAboveFaceAnalysisVersion
{
  return self->_ratioOfAssetsAtOrAboveFaceAnalysisVersion;
}

- (BOOL)libraryIsProcessedEnough
{
  return self->_libraryIsProcessedEnough;
}

- (BOOL)libraryIsEmpty
{
  return self->_libraryIsEmpty;
}

@end
