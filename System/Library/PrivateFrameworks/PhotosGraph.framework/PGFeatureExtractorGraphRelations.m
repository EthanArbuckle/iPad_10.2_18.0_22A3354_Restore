@implementation PGFeatureExtractorGraphRelations

- (PGFeatureExtractorGraphRelations)initWithGraph:(id)a3 featureExtractor:(id)a4
{
  id v7;
  id v8;
  PGFeatureExtractorGraphRelations *v9;
  PGFeatureExtractorGraphRelations *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PGFeatureExtractorGraphRelations;
  v9 = -[PGFeatureExtractorGraphRelations init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_graph, a3);
    objc_storeStrong((id *)&v10->_featureExtractor, a4);
  }

  return v10;
}

- (id)name
{
  void *v2;
  void *v3;

  -[PGFeatureExtractorGraphRelations featureExtractor](self, "featureExtractor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)featureNames
{
  void *v2;
  void *v3;

  -[PGFeatureExtractorGraphRelations featureExtractor](self, "featureExtractor");
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

  -[PGFeatureExtractorGraphRelations featureExtractor](self, "featureExtractor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "featureNames");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (id)floatVectorWithMomentNodeCollection:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[PGFeatureExtractorGraphRelations featureExtractor](self, "featureExtractor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "floatVectorWithEntity:error:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)floatVectorWithEntity:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsContainingAsset:withType:options:", v6, 3, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v8, "uuid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setWithObject:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGGraphMomentNodeCollection momentNodesForUUIDs:inGraph:](PGGraphMomentNodeCollection, "momentNodesForUUIDs:inGraph:", v12, self->_graph);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v13, "isEmpty"))
    {
      -[PGFeatureExtractorGraphRelations floatVectorWithMomentNodeCollection:error:](self, "floatVectorWithMomentNodeCollection:error:", v13, a4);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    v14 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v6, "localIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("Moment node could not be fetched from asset collection of asset %@"), v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGFeatureExtractorGraphRelations _generateError:withCode:andMessage:](self, "_generateError:withCode:andMessage:", a4, 1, v16);

  }
  else
  {
    v17 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v6, "localIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", CFSTR("Asset collection could not be fetched from asset %@"), v13);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGFeatureExtractorGraphRelations _generateError:withCode:andMessage:](self, "_generateError:withCode:andMessage:", a4, 0, v18);

  }
  v19 = 0;
LABEL_7:

  return v19;
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
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosGraph.PGFeatureExtractorGraphRelations"), a4, v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
  return 1;
}

- (PGGraph)graph
{
  return self->_graph;
}

- (MAFeatureExtractor)featureExtractor
{
  return self->_featureExtractor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureExtractor, 0);
  objc_storeStrong((id *)&self->_graph, 0);
}

@end
