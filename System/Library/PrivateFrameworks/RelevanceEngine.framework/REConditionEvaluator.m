@implementation REConditionEvaluator

- (REConditionEvaluator)initWithCondition:(id)a3
{
  id v5;
  REConditionEvaluator *v6;
  REConditionEvaluator *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REConditionEvaluator;
  v6 = -[REConditionEvaluator init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_condition, a3);
    v7->_mode = -[RECondition _validForRanking](v7->_condition, "_validForRanking");
  }

  return v7;
}

- (BOOL)acceptsFeatureMap:(id)a3 predictionSet:(id)a4 explanation:(id *)a5
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  BOOL v16;
  uint64_t v18;

  v8 = a3;
  v15 = a4;
  if (self->_mode)
    RERaiseInternalException((void *)*MEMORY[0x24BDBCAB0], CFSTR("Cannot call -acceptsFeatureMap: when not configured for filtering"), v9, v10, v11, v12, v13, v14, v18);
  v16 = -[RECondition _acceptsFeatureMap:predictionSet:explanation:](self->_condition, "_acceptsFeatureMap:predictionSet:explanation:", v8, v15, a5);

  return v16;
}

- (BOOL)compareFeatureMap:(id)a3 toFeatureMap:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  BOOL v14;
  uint64_t v16;

  v6 = a3;
  v13 = a4;
  if (self->_mode != 1)
    RERaiseInternalException((void *)*MEMORY[0x24BDBCAB0], CFSTR("Cannot call -acceptsFeatureMap: when not configured for ranking"), v7, v8, v9, v10, v11, v12, v16);
  v14 = -[RECondition _acceptsLeftFeatureMap:rightFeatureMap:](self->_condition, "_acceptsLeftFeatureMap:rightFeatureMap:", v6, v13);

  return v14;
}

- (BOOL)needsPredictionSet
{
  return -[RECondition _needsProbability](self->_condition, "_needsProbability");
}

- (unint64_t)mode
{
  return self->_mode;
}

- (RECondition)condition
{
  return self->_condition;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_condition, 0);
}

@end
