@implementation ModelHyperparameters

- (ModelHyperparameters)initWithNumTrees:(id)a3 learningRate:(id)a4 minChildWeight:(id)a5 adaptationStrategy:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  ModelHyperparameters *v15;
  ModelHyperparameters *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)ModelHyperparameters;
  v15 = -[ModelHyperparameters init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_numTrees, a3);
    objc_storeStrong((id *)&v16->_learningRate, a4);
    objc_storeStrong((id *)&v16->_minChildWeight, a5);
    v16->_adaptationStrategy = (int)objc_msgSend(v14, "intValue");
  }

  return v16;
}

- (NSNumber)numTrees
{
  return self->_numTrees;
}

- (void)setNumTrees:(id)a3
{
  objc_storeStrong((id *)&self->_numTrees, a3);
}

- (NSNumber)learningRate
{
  return self->_learningRate;
}

- (void)setLearningRate:(id)a3
{
  objc_storeStrong((id *)&self->_learningRate, a3);
}

- (NSNumber)minChildWeight
{
  return self->_minChildWeight;
}

- (void)setMinChildWeight:(id)a3
{
  objc_storeStrong((id *)&self->_minChildWeight, a3);
}

- (int64_t)adaptationStrategy
{
  return self->_adaptationStrategy;
}

- (void)setAdaptationStrategy:(int64_t)a3
{
  self->_adaptationStrategy = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minChildWeight, 0);
  objc_storeStrong((id *)&self->_learningRate, 0);
  objc_storeStrong((id *)&self->_numTrees, 0);
}

@end
