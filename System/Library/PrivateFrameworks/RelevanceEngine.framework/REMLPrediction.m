@implementation REMLPrediction

+ (id)predictionWithProbability:(float)a3 mean:(float)a4 variance:(float)a5 pessimistic:(float)a6
{
  uint64_t v10;

  v10 = objc_opt_new();
  *(float *)(v10 + 16) = a4;
  *(float *)(v10 + 20) = a5;
  *(float *)(v10 + 24) = a3;
  *(float *)(v10 + 28) = a6;
  *(_DWORD *)(v10 + 32) = 0;
  return (id)v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  *(float *)&v4 = self->_mean;
  *(float *)&v5 = self->_variance;
  *(float *)&v3 = self->_probability;
  *(float *)&v6 = self->_pessimistic;
  +[REMLPrediction predictionWithProbability:mean:variance:pessimistic:](REMLPrediction, "predictionWithProbability:mean:variance:pessimistic:", a3, v3, v4, v5, v6);
  v8 = objc_claimAutoreleasedReturnValue();
  *(float *)(v8 + 32) = self->_bias;
  v9 = objc_msgSend(*(id *)(v8 + 8), "mutableCopy");
  v10 = *(void **)(v8 + 8);
  *(_QWORD *)(v8 + 8) = v9;

  return (id)v8;
}

- (void)addExplanation:(id)a3
{
  id v4;
  NSMutableSet *explanations;
  NSMutableSet *v6;
  NSMutableSet *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    explanations = self->_explanations;
    v8 = v4;
    if (!explanations)
    {
      objc_msgSend(MEMORY[0x24BDBCEF0], "set");
      v6 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
      v7 = self->_explanations;
      self->_explanations = v6;

      explanations = self->_explanations;
    }
    -[NSMutableSet addObject:](explanations, "addObject:", v8);
    v4 = v8;
  }

}

- (id)explanationDescription
{
  REMLExplanationFormatter *v3;
  void *v4;

  v3 = objc_alloc_init(REMLExplanationFormatter);
  -[REMLExplanationFormatter descriptionFromExplanations:](v3, "descriptionFromExplanations:", self->_explanations);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSSet)explanations
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  v2 = (void *)-[NSMutableSet copy](self->_explanations, "copy");
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return (NSSet *)v5;
}

- (float)mean
{
  return self->_mean;
}

- (float)variance
{
  return self->_variance;
}

- (float)probability
{
  return self->_probability;
}

- (float)pessimistic
{
  return self->_pessimistic;
}

- (float)bias
{
  return self->_bias;
}

- (void)setBias:(float)a3
{
  self->_bias = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_explanations, 0);
}

@end
