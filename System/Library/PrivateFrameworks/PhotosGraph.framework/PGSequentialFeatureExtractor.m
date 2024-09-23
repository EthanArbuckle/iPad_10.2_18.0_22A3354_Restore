@implementation PGSequentialFeatureExtractor

- (PGSequentialFeatureExtractor)initWithFeatureExtractor:(id)a3 featureTransformers:(id)a4
{
  id v7;
  id v8;
  PGSequentialFeatureExtractor *v9;
  PGSequentialFeatureExtractor *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PGSequentialFeatureExtractor;
  v9 = -[PGSequentialFeatureExtractor init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_featureExtractor, a3);
    objc_storeStrong((id *)&v10->_featureTransformers, a4);
  }

  return v10;
}

- (id)name
{
  void *v2;
  void *v3;

  -[PGSequentialFeatureExtractor featureExtractor](self, "featureExtractor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)featureNames
{
  void *v2;
  void *v3;

  -[PGSequentialFeatureExtractor featureExtractor](self, "featureExtractor");
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

  -[PGSequentialFeatureExtractor featureExtractor](self, "featureExtractor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "featureNames");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (id)defaultFloatVectorWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;

  -[PGSequentialFeatureExtractor featureExtractor](self, "featureExtractor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "defaultFloatVectorWithError:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[PGSequentialFeatureExtractor _transformFloatVector:error:](self, "_transformFloatVector:error:", v6, a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)floatVectorWithEntity:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v15;

  v6 = a3;
  -[PGSequentialFeatureExtractor featureExtractor](self, "featureExtractor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(v7, "floatVectorWithEntity:error:", v6, &v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v15;
  if (v8)
  {
    -[PGSequentialFeatureExtractor _transformFloatVector:error:](self, "_transformFloatVector:error:", v8, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = (void *)MEMORY[0x1E0CB3940];
    -[PGSequentialFeatureExtractor featureExtractor](self, "featureExtractor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("Feature Extraction for %@ returned nil."), objc_opt_class());
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGSequentialFeatureExtractor _generateError:code:message:underlyingError:](self, "_generateError:code:message:underlyingError:", a4, 0, v13, v9);

    v10 = 0;
  }

  return v10;
}

- (id)_transformFloatVector:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[PGSequentialFeatureExtractor featureTransformers](self, "featureTransformers", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
LABEL_3:
    v11 = 0;
    v12 = v6;
    while (1)
    {
      if (*(_QWORD *)v15 != v10)
        objc_enumerationMutation(v7);
      objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v11), "floatVectorWithFloatVector:error:", v12, a4);
      v6 = (id)objc_claimAutoreleasedReturnValue();

      if (!v6)
        break;
      ++v11;
      v12 = v6;
      if (v9 == v11)
      {
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v9)
          goto LABEL_3;
        break;
      }
    }
  }

  return v6;
}

- (BOOL)_generateError:(id *)a3 code:(int64_t)a4 message:(id)a5 underlyingError:(id)a6
{
  id v9;
  objc_class *v10;
  id v11;
  id v12;

  v9 = a6;
  if (a3)
  {
    v10 = (objc_class *)MEMORY[0x1E0C99E08];
    v11 = a5;
    v12 = objc_alloc_init(v10);
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0CB2D50]);

    if (v9)
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0CB3388]);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosGraph.PGSequentialFeatureExtractor"), a4, v12);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
  return 0;
}

- (MAFeatureExtractor)featureExtractor
{
  return self->_featureExtractor;
}

- (NSArray)featureTransformers
{
  return self->_featureTransformers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureTransformers, 0);
  objc_storeStrong((id *)&self->_featureExtractor, 0);
}

@end
