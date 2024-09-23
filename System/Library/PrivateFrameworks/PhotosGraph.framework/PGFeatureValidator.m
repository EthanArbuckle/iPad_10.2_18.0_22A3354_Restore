@implementation PGFeatureValidator

- (PGFeatureValidator)initWithPredicate:(id)a3 featureExtractor:(id)a4 featureName:(id)a5
{
  id v9;
  id v10;
  id v11;
  PGFeatureValidator *v12;
  PGFeatureValidator *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PGFeatureValidator;
  v12 = -[PGFeatureValidator init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_predicate, a3);
    objc_storeStrong((id *)&v13->_featureExtractor, a4);
    objc_storeStrong((id *)&v13->_featureName, a5);
  }

  return v13;
}

- (int64_t)isValidEntity:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  int64_t v8;

  v6 = a3;
  -[PGFeatureValidator featureExtractor](self, "featureExtractor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PGFeatureValidator _isValidEntity:featureExtractor:error:](self, "_isValidEntity:featureExtractor:error:", v6, v7, a4);

  return v8;
}

- (int64_t)_isValidEntity:(id)a3 featureExtractor:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  uint64_t v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v9, "featureLength") >= 1)
  {
    v10 = 0;
    while (1)
    {
      -[PGFeatureValidator featureName](self, "featureName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "featureNames");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectAtIndexedSubscript:", v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v11, "isEqualToString:", v13);

      if ((v14 & 1) != 0)
        break;
      if (++v10 >= objc_msgSend(v9, "featureLength"))
        goto LABEL_5;
    }
    objc_msgSend(v9, "floatVectorWithEntity:error:", v8, a5);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v20)
    {
      v22 = objc_msgSend(v20, "count");
      if (!a5 || v10 < v22)
      {
        -[PGFeatureValidator predicate](self, "predicate");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v21, "floatAtIndex:", v10);
        objc_msgSend(v29, "numberWithFloat:");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v28, "evaluateWithObject:", v30);

        if (v31)
          v19 = 1;
        else
          v19 = 2;
        goto LABEL_14;
      }
      v23 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v9, "name");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "stringWithFormat:", CFSTR("Feature index %lu out of bounds for feature extractor '%@'"), v10, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      v26 = (void *)MEMORY[0x1E0CB35C8];
      v33 = *MEMORY[0x1E0CB2D50];
      v34[0] = v25;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, &v33, 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosGraph.PGFeatureValidator"), 1, v27);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    v19 = 0;
LABEL_14:

    goto LABEL_15;
  }
LABEL_5:
  v15 = (void *)MEMORY[0x1E0CB3940];
  -[PGFeatureValidator featureName](self, "featureName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "name");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("Feature '%@' not found in feature extractor '%@'"), v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGFeatureValidator _generateError:errorCode:errorMessage:](self, "_generateError:errorCode:errorMessage:", a5, 0, v18);

  v19 = 0;
LABEL_15:

  return v19;
}

- (BOOL)_generateError:(id *)a3 errorCode:(int64_t)a4 errorMessage:(id)a5
{
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v7 = (void *)MEMORY[0x1E0CB35C8];
    v13 = *MEMORY[0x1E0CB2D50];
    v14[0] = a5;
    v8 = (void *)MEMORY[0x1E0C99D80];
    v9 = a5;
    objc_msgSend(v8, "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosGraph.PGFeatureValidator"), a4, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    *a3 = v11;
  }
  return 0;
}

- (int64_t)featureValidatorType
{
  return 1;
}

- (NSPredicate)predicate
{
  return self->_predicate;
}

- (PGFeatureExtractor)featureExtractor
{
  return self->_featureExtractor;
}

- (NSString)featureName
{
  return self->_featureName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureName, 0);
  objc_storeStrong((id *)&self->_featureExtractor, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
}

@end
