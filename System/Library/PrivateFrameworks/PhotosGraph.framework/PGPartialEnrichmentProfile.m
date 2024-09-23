@implementation PGPartialEnrichmentProfile

- (id)identifier
{
  return CFSTR("Partial Enrichment Profile");
}

- (unsigned)targetEnrichmentState
{
  return 2;
}

- (BOOL)canEnrichHighlight:(id)a3 withOptions:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  BOOL v11;
  objc_super v13;

  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PGPartialEnrichmentProfile;
  if (-[PGDefaultEnrichmentProfile canEnrichHighlight:withOptions:](&v13, sel_canEnrichHighlight_withOptions_, v6, a4))
  {
    if (a4 >> 31)
    {
      v11 = 1;
    }
    else
    {
      -[PGDefaultEnrichmentProfile curationManager](self, "curationManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "photoLibrary");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "nonDefaultCurationScorePercentageForPhotoLibrary:", v8);
      v10 = v9;

      v11 = v10 >= 0.5;
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

@end
