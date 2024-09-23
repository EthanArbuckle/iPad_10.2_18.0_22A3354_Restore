@implementation PNTextEmbeddingResultWithBiasScale

- (PNTextEmbeddingResultWithBiasScale)initWithEmbedding:(id)a3 bias:(id)a4 scale:(id)a5
{
  id v9;
  id v10;
  id v11;
  PNTextEmbeddingResultWithBiasScale *v12;
  PNTextEmbeddingResultWithBiasScale *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PNTextEmbeddingResultWithBiasScale;
  v12 = -[PNTextEmbeddingResultWithBiasScale init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_embedding, a3);
    objc_storeStrong((id *)&v13->_bias, a4);
    objc_storeStrong((id *)&v13->_scale, a5);
  }

  return v13;
}

- (id)defaultThresholdForImageSearch
{
  return -[PNTextEmbeddingResultWithBiasScale calibratedThresholdForImageSearchWithBaseThreshold:](self, "calibratedThresholdForImageSearchWithBaseThreshold:", &unk_25149A068);
}

- (id)calibratedThresholdForImageSearchWithBaseThreshold:(id)a3
{
  long double v4;
  double v5;
  double v6;
  long double v7;
  double v8;
  long double v9;
  double v10;

  objc_msgSend(a3, "doubleValue");
  v5 = v4;
  v6 = log(v4);
  v7 = v6 - log(1.0 - v5);
  -[NSNumber doubleValue](self->_bias, "doubleValue");
  v9 = v7 - v8;
  -[NSNumber doubleValue](self->_scale, "doubleValue");
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", (double)(v9 / v10));
}

- (NSArray)embedding
{
  return self->_embedding;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_embedding, 0);
  objc_storeStrong((id *)&self->_scale, 0);
  objc_storeStrong((id *)&self->_bias, 0);
}

@end
