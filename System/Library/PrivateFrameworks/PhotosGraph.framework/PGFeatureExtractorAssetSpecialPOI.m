@implementation PGFeatureExtractorAssetSpecialPOI

- (PGFeatureExtractorAssetSpecialPOI)initWithGraph:(id)a3
{
  id v5;
  PGFeatureExtractorAssetSpecialPOI *v6;
  PGFeatureExtractorAssetSpecialPOI *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGFeatureExtractorAssetSpecialPOI;
  v6 = -[PGFeatureExtractorAssetSpecialPOI init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_graph, a3);

  return v7;
}

- (id)name
{
  __CFString *v2;

  v2 = CFSTR("SpecialPOI");
  return CFSTR("SpecialPOI");
}

- (id)featureNames
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("Disney");
  v3[1] = CFSTR("Universal");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)featureLength
{
  return 2;
}

- (id)floatVectorWithMoment:(id)a3 error:(id *)a4
{
  id v5;
  PGSpecialPOIResolver *v6;
  void *v7;
  PGSpecialPOIResolver *v8;
  void *v9;
  double v10;
  double v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = [PGSpecialPOIResolver alloc];
  v13[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PGSpecialPOIResolver initWithMomentNodes:](v6, "initWithMomentNodes:", v7);

  objc_msgSend(MEMORY[0x1E0D42A48], "zerosOfCount:", -[PGFeatureExtractorAssetSpecialPOI featureLength](self, "featureLength"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[PGSpecialPOIResolver momentsContainSpecialPOI:withMomentRatio:](v8, "momentsContainSpecialPOI:withMomentRatio:", 1, 1.0))
  {
    LODWORD(v10) = 1.0;
    objc_msgSend(v9, "setFloat:atIndex:", 0, v10);
  }
  if (-[PGSpecialPOIResolver momentsContainSpecialPOI:withMomentRatio:](v8, "momentsContainSpecialPOI:withMomentRatio:", 2, 1.0))
  {
    LODWORD(v11) = 1.0;
    objc_msgSend(v9, "setFloat:atIndex:", 1, v11);
  }

  return v9;
}

- (id)floatVectorWithEntity:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsContainingAsset:withType:options:", v6, 3, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v12 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v6, "localIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("Asset collection could not be fetched from asset %@"), v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGFeatureExtractorAssetSpecialPOI _generateError:withCode:andMessage:](self, "_generateError:withCode:andMessage:", a4, 0, v13);

LABEL_6:
    v11 = 0;
    goto LABEL_7;
  }
  -[PGGraph momentNodeForMoment:](self->_graph, "momentNodeForMoment:", v8);
  v9 = objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    v14 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v6, "localIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("Moment node could not be fetched from asset collection of asset %@"), v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGFeatureExtractorAssetSpecialPOI _generateError:withCode:andMessage:](self, "_generateError:withCode:andMessage:", a4, 1, v16);

    v10 = 0;
    goto LABEL_6;
  }
  v10 = (void *)v9;
  -[PGFeatureExtractorAssetSpecialPOI floatVectorWithMoment:error:](self, "floatVectorWithMoment:error:", v9, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v11;
}

- (BOOL)_generateError:(id *)a3 withCode:(int64_t)a4 andMessage:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v7 = a5;
  v8 = v7;
  if (a3 && !*a3)
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v12 = *MEMORY[0x1E0CB2D50];
    v13[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosGraph.PGFeatureExtractorSpecialPOIDomain"), a4, v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
  return 1;
}

- (PGGraph)graph
{
  return self->_graph;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_graph, 0);
}

@end
