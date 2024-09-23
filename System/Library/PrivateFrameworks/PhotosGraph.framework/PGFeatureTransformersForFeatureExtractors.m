@implementation PGFeatureTransformersForFeatureExtractors

- (PGFeatureTransformersForFeatureExtractors)init
{
  PGFeatureTransformersForFeatureExtractors *v2;
  id v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PGFeatureTransformersForFeatureExtractors;
  v2 = -[PGFeatureTransformersForFeatureExtractors init](&v5, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[PGFeatureTransformersForFeatureExtractors setFeatureTransformersForFeatureExtractors:](v2, "setFeatureTransformersForFeatureExtractors:", v3);

  }
  return v2;
}

- (void)addFeatureTransformers:(id)a3 forFeatureExtractorName:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[PGFeatureTransformersForFeatureExtractors featureTransformersForFeatureExtractors](self, "featureTransformersForFeatureExtractors");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v7, v6);

}

- (id)featureTransformersForFeatureExtractorName:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PGFeatureTransformersForFeatureExtractors featureTransformersForFeatureExtractors](self, "featureTransformersForFeatureExtractors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSMutableDictionary)featureTransformersForFeatureExtractors
{
  return self->featureTransformersForFeatureExtractors;
}

- (void)setFeatureTransformersForFeatureExtractors:(id)a3
{
  objc_storeStrong((id *)&self->featureTransformersForFeatureExtractors, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->featureTransformersForFeatureExtractors, 0);
}

@end
