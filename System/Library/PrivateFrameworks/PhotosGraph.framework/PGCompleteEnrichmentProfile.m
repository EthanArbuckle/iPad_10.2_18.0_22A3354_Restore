@implementation PGCompleteEnrichmentProfile

- (id)identifier
{
  return CFSTR("Complete Enrichment Profile");
}

- (unsigned)targetEnrichmentState
{
  return 4;
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
  double v11;
  BOOL v12;
  objc_super v14;

  v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PGCompleteEnrichmentProfile;
  if (-[PGDefaultEnrichmentProfile canEnrichHighlight:withOptions:](&v14, sel_canEnrichHighlight_withOptions_, v6, a4))
  {
    if (a4 >> 31)
    {
      v12 = 1;
    }
    else
    {
      -[PGDefaultEnrichmentProfile curationManager](self, "curationManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "photoLibrary");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "faceAnalysisProgressForPhotoLibrary:", v8);
      v10 = v9;
      objc_msgSend(v6, "sceneAnalysisProgressForPhotoLibrary:", v8);
      v12 = v11 >= 0.9 && v10 >= 0.25;

    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (unint64_t)durationForSummary
{
  return 14;
}

@end
