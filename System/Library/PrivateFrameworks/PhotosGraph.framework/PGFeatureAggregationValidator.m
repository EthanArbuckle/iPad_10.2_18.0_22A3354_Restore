@implementation PGFeatureAggregationValidator

- (PGFeatureAggregationValidator)initWithPredicate:(id)a3 featureExtractor:(id)a4 featureExtractorType:(int64_t)a5 featureName:(id)a6
{
  PGFeatureAggregationValidator *result;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PGFeatureAggregationValidator;
  result = -[PGFeatureValidator initWithPredicate:featureExtractor:featureName:](&v8, sel_initWithPredicate_featureExtractor_featureName_, a3, a4, a6);
  if (result)
    result->_featureExtractorType = a5;
  return result;
}

- (int64_t)featureValidatorType
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("Subclasses must override %@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (int64_t)isValidEntity:(id)a3 error:(id *)a4
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("isValidEntity:error method is not available. Please use isValidEntity:graph:assetFetchOptionPropertySet."), 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v5);
}

- (int64_t)isValidEntity:(id)a3 graph:(id)a4 assetFetchOptionPropertySet:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void *)MEMORY[0x1E0C99DA0];
  v13 = *MEMORY[0x1E0C99768];
  v14 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("Subclasses must override %@"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "exceptionWithName:reason:userInfo:", v13, v16, 0);
  v17 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v17);
}

- (id)_composeFeatureExtractorWithGraph:(id)a3 error:(id *)a4
{
  id v6;
  const __CFString *v7;
  PGFeatureAggregationValidator *v8;
  id *v9;
  uint64_t v10;
  PGFeatureExtractorGraphRelations *v11;
  void *v12;
  PGFeatureAggregationValidator *v13;
  PGFeatureExtractorFacesFromAssetAverage *v14;

  v6 = a3;
  switch(-[PGFeatureAggregationValidator featureExtractorType](self, "featureExtractorType"))
  {
    case 0:
      v7 = CFSTR("Unknown feature vector type is not supported");
      v8 = self;
      v9 = a4;
      v10 = 2;
      goto LABEL_9;
    case 1:
      -[PGFeatureValidator featureExtractor](self, "featureExtractor");
      self = (PGFeatureAggregationValidator *)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 2:
      if (v6)
      {
        v11 = [PGFeatureExtractorGraphRelations alloc];
        -[PGFeatureValidator featureExtractor](self, "featureExtractor");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = -[PGFeatureExtractorGraphRelations initWithGraph:featureExtractor:](v11, "initWithGraph:featureExtractor:", v6, v12);
LABEL_7:
        self = v13;

      }
      else
      {
        v7 = CFSTR("Graph is invalid");
        v8 = self;
        v9 = a4;
        v10 = 3;
LABEL_9:
        -[PGFeatureValidator _generateError:errorCode:errorMessage:](v8, "_generateError:errorCode:errorMessage:", v9, v10, v7);
        self = 0;
      }
LABEL_10:

      return self;
    case 3:
      v14 = [PGFeatureExtractorFacesFromAssetAverage alloc];
      -[PGFeatureValidator featureExtractor](self, "featureExtractor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[PGFeatureExtractorFacesFromAssetAverage initWithFaceFeatureExtractor:name:](v14, "initWithFaceFeatureExtractor:name:", v12, CFSTR("FacesAverage"));
      goto LABEL_7;
    default:
      goto LABEL_10;
  }
}

- (int64_t)featureExtractorType
{
  return self->_featureExtractorType;
}

@end
