@implementation ODCurareEvaluationResult

- (ODCurareEvaluationResult)initWithEvaluationName:(id)a3 numberOfSamplesPositive:(int64_t)a4 numberOfSamplesTotal:(int64_t)a5
{
  id v8;
  ODCurareEvaluationResult *v9;
  ODCurareEvaluationResult *v10;
  objc_super v12;

  v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ODCurareEvaluationResult;
  v9 = -[ODCurareEvaluationResult init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    -[ODCurareEvaluationResult setEvaluationName:](v9, "setEvaluationName:", v8);
    -[ODCurareEvaluationResult setNumberOfSamplesPositive:](v10, "setNumberOfSamplesPositive:", a4);
    -[ODCurareEvaluationResult setNumberOfSamplesTotal:](v10, "setNumberOfSamplesTotal:", a5);
  }

  return v10;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[ODCurareEvaluationResult evaluationName](self, "evaluationName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("name: %@, numSampPos: %ld, numSampTot: %ld"), v4, -[ODCurareEvaluationResult numberOfSamplesPositive](self, "numberOfSamplesPositive"), -[ODCurareEvaluationResult numberOfSamplesTotal](self, "numberOfSamplesTotal"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSString)evaluationName
{
  return self->_evaluationName;
}

- (void)setEvaluationName:(id)a3
{
  objc_storeStrong((id *)&self->_evaluationName, a3);
}

- (int64_t)numberOfSamplesPositive
{
  return self->_numberOfSamplesPositive;
}

- (void)setNumberOfSamplesPositive:(int64_t)a3
{
  self->_numberOfSamplesPositive = a3;
}

- (int64_t)numberOfSamplesTotal
{
  return self->_numberOfSamplesTotal;
}

- (void)setNumberOfSamplesTotal:(int64_t)a3
{
  self->_numberOfSamplesTotal = a3;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_evaluationName, 0);
}

@end
