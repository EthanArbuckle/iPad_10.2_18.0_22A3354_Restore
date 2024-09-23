@implementation PGGraphFeatureExtractor

- (PGGraphFeatureExtractor)initWithName:(id)a3 featureNames:(id)a4 relation:(id)a5 labelForTargetBlock:(id)a6
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PGGraphFeatureExtractor;
  return -[MARelationCollectionFeatureExtractor initWithName:featureNames:relation:labelForTargetBlock:](&v7, sel_initWithName_featureNames_relation_labelForTargetBlock_, a3, a4, a5, a6);
}

- (PGGraphFeatureExtractor)initWithError:(id *)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  v5 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("Subclasses must override %@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v7, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v8);
}

- (unint64_t)featureLength
{
  void *v2;
  unint64_t v3;

  -[MARelationCollectionFeatureExtractor featureNames](self, "featureNames");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

+ (id)featureExtractorWithError:(id *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithError:", a3);
}

@end
