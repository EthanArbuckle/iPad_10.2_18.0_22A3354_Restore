@implementation ODCurareModelSelectionPolicy

- (ODCurareModelSelectionPolicy)initWithModelSelectionParameters:(id)a3 minimumNumberOfEvaluations:(id)a4 minimumNumberOfSamples:(id)a5
{
  id v8;
  id v9;
  id v10;
  ODCurareModelSelectionPolicy *v11;
  ODCurareModelSelectionPolicy *v12;
  void *v13;
  ODCurareModelSelectionPolicy *v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[ODCurareModelSelectionPolicy init](self, "init");
  v12 = v11;
  if (v11)
  {
    -[ODCurareModelSelectionPolicy setModelSelectionParameters:](v11, "setModelSelectionParameters:", v8);
    -[ODCurareModelSelectionPolicy setMinimumNumberOfSamples:](v12, "setMinimumNumberOfSamples:", v10);
    -[ODCurareModelSelectionPolicy setMinimumNumberOfEvaluations:](v12, "setMinimumNumberOfEvaluations:", v9);
    -[ODCurareModelSelectionPolicy minimumNumberOfSamples](v12, "minimumNumberOfSamples");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {

    }
    else
    {
      -[ODCurareModelSelectionPolicy minimumNumberOfEvaluations](v12, "minimumNumberOfEvaluations");
      v14 = (ODCurareModelSelectionPolicy *)objc_claimAutoreleasedReturnValue();

      if (!v14)
      {
        NSLog(CFSTR("[ODCurareModelSelectionPolicy init:] Was expecting one of the two NSNumbers to be non-nil..."));
        goto LABEL_6;
      }
    }
  }
  v14 = v12;
LABEL_6:

  return v14;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[ODCurareModelSelectionPolicy modelSelectionParameters](self, "modelSelectionParameters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ODCurareModelSelectionPolicy minimumNumberOfSamples](self, "minimumNumberOfSamples");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ODCurareModelSelectionPolicy minimumNumberOfEvaluations](self, "minimumNumberOfEvaluations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("ODCurareModelSelectionPolicy, modelSelectionParameters: %@, minimumNumberOfSamples: %@, minimumNumberOfEvaluations: %@"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSArray)modelSelectionParameters
{
  return self->_modelSelectionParameters;
}

- (void)setModelSelectionParameters:(id)a3
{
  objc_storeStrong((id *)&self->_modelSelectionParameters, a3);
}

- (NSNumber)minimumNumberOfEvaluations
{
  return self->_minimumNumberOfEvaluations;
}

- (void)setMinimumNumberOfEvaluations:(id)a3
{
  objc_storeStrong((id *)&self->_minimumNumberOfEvaluations, a3);
}

- (NSNumber)minimumNumberOfSamples
{
  return self->_minimumNumberOfSamples;
}

- (void)setMinimumNumberOfSamples:(id)a3
{
  objc_storeStrong((id *)&self->_minimumNumberOfSamples, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minimumNumberOfSamples, 0);
  objc_storeStrong((id *)&self->_minimumNumberOfEvaluations, 0);
  objc_storeStrong((id *)&self->_modelSelectionParameters, 0);
}

@end
