@implementation PGGraphRelationsFeatureValidator

- (int64_t)isValidEntity:(id)a3 error:(id *)a4
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("[PGGraphRelationsFeatureValidator isValidEntity] method is not available. Please use [PGGraphRelationsFeatureValidator isValidEntity:graph]."), 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v5);
}

- (int64_t)isValidEntity:(id)a3 graph:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  PGFeatureExtractorGraphRelations *v10;
  void *v11;
  PGFeatureExtractorGraphRelations *v12;
  int64_t v13;

  v8 = a3;
  v9 = a4;
  if (v9)
  {
    v10 = [PGFeatureExtractorGraphRelations alloc];
    -[PGFeatureValidator featureExtractor](self, "featureExtractor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[PGFeatureExtractorGraphRelations initWithGraph:featureExtractor:](v10, "initWithGraph:featureExtractor:", v9, v11);

    v13 = -[PGFeatureValidator _isValidEntity:featureExtractor:error:](self, "_isValidEntity:featureExtractor:error:", v8, v12, a5);
  }
  else
  {
    -[PGFeatureValidator _generateError:errorCode:errorMessage:](self, "_generateError:errorCode:errorMessage:", a5, 3, CFSTR("Graph is invalid"));
    v13 = 0;
  }

  return v13;
}

- (int64_t)featureValidatorType
{
  return 2;
}

@end
