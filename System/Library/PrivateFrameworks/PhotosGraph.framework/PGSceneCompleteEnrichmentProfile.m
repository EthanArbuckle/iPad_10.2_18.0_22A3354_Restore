@implementation PGSceneCompleteEnrichmentProfile

- (id)identifier
{
  return CFSTR("Complete Scene Enrichment Profile");
}

- (unsigned)targetEnrichmentState
{
  return 3;
}

- (id)curationOptions
{
  PGCurationOptions *v2;

  v2 = -[PGCurationOptions initWithDuration:]([PGCurationOptions alloc], "initWithDuration:", 0);
  -[PGCurationOptions setSemanticalDedupingEnabled:](v2, "setSemanticalDedupingEnabled:", 1);
  -[PGCurationOptions setMovieDedupingEnabled:](v2, "setMovieDedupingEnabled:", 1);
  -[PGCurationOptions setLastPassMovieAdditionEnabled:](v2, "setLastPassMovieAdditionEnabled:", 0);
  return v2;
}

- (BOOL)canEnrichHighlight:(id)a3 withOptions:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  BOOL v16;
  BOOL v17;
  objc_super v19;

  v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PGSceneCompleteEnrichmentProfile;
  if (-[PGDefaultEnrichmentProfile canEnrichHighlight:withOptions:](&v19, sel_canEnrichHighlight_withOptions_, v6, a4))
  {
    if (a4 >> 31)
    {
      v17 = 1;
    }
    else
    {
      -[PGDefaultEnrichmentProfile curationManager](self, "curationManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "photoLibrary");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "sceneAnalysisProgressForPhotoLibrary:", v8);
      v10 = v9;

      objc_msgSend(v6, "assetCollection");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "estimatedAssetCount");

      v13 = llround(v10 * (double)v12);
      v16 = v12 < 0xA && v13 != 0 && v12 - v13 < 3;
      v17 = v10 >= 0.9 || v16;
    }
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

+ (unint64_t)durationForSummary
{
  return 14;
}

@end
