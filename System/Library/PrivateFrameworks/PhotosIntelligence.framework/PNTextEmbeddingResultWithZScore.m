@implementation PNTextEmbeddingResultWithZScore

- (PNTextEmbeddingResultWithZScore)initWithEmbedding:(id)a3 mean:(id)a4 standardDeviation:(id)a5
{
  id v9;
  id v10;
  id v11;
  PNTextEmbeddingResultWithZScore *v12;
  PNTextEmbeddingResultWithZScore *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PNTextEmbeddingResultWithZScore;
  v12 = -[PNTextEmbeddingResultWithZScore init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_embedding, a3);
    objc_storeStrong((id *)&v13->_mean, a4);
    objc_storeStrong((id *)&v13->_standardDeviation, a5);
  }

  return v13;
}

- (id)defaultThresholdForImageSearch
{
  double v2;
  void *v4;
  void *v5;

  LODWORD(v2) = 3.75;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PNTextEmbeddingResultWithZScore calibratedThresholdForImageSearchWithBaseThreshold:](self, "calibratedThresholdForImageSearchWithBaseThreshold:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)calibratedThresholdForImageSearchWithBaseThreshold:(id)a3
{
  float v4;
  float v5;
  float v6;
  float v7;
  float v8;
  double v9;

  objc_msgSend(a3, "floatValue");
  v5 = v4;
  -[NSNumber floatValue](self->_standardDeviation, "floatValue");
  v7 = v6;
  -[NSNumber floatValue](self->_mean, "floatValue");
  *(float *)&v9 = v8 + (float)(v5 * v7);
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v9);
}

- (NSArray)embedding
{
  return self->_embedding;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_embedding, 0);
  objc_storeStrong((id *)&self->_standardDeviation, 0);
  objc_storeStrong((id *)&self->_mean, 0);
}

@end
