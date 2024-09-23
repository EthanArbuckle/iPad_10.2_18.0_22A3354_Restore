@implementation REMLPredictionSet

- (REMLPredictionSet)initWithPrediction:(id)a3
{
  return -[REMLPredictionSet initWithPrediction:predictionMap:](self, "initWithPrediction:predictionMap:", a3, MEMORY[0x24BDBD1B8]);
}

- (REMLPredictionSet)initWithPrediction:(id)a3 predictionMap:(id)a4
{
  id v7;
  id v8;
  REMLPredictionSet *v9;
  REMLPredictionSet *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)REMLPredictionSet;
  v9 = -[REMLPredictionSet init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_prediction, a3);
    objc_storeStrong((id *)&v10->_predictionsByKey, a4);
  }

  return v10;
}

- (id)predictionForKey:(id)a3
{
  return -[NSDictionary objectForKeyedSubscript:](self->_predictionsByKey, "objectForKeyedSubscript:", a3);
}

- (REMLPrediction)prediction
{
  return self->_prediction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prediction, 0);
  objc_storeStrong((id *)&self->_predictionsByKey, 0);
}

@end
