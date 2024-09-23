@implementation ODCurarePersonalizationPolicy

- (ODCurarePersonalizationPolicy)initWithModelSelectionParameters:(id)a3 minimumNumberOfSamplesForPersonalization:(id)a4 minimumNumberOfSamplesForPersonalizationSelection:(id)a5
{
  id v8;
  id v9;
  id v10;
  ODCurarePersonalizationPolicy *v11;
  ODCurarePersonalizationPolicy *v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[ODCurarePersonalizationPolicy init](self, "init");
  v12 = v11;
  if (v11)
  {
    -[ODCurarePersonalizationPolicy setHyperparameterSelectionPolicy:](v11, "setHyperparameterSelectionPolicy:", v8);
    -[ODCurarePersonalizationPolicy setMinimumNumberOfSamplesForPersonalization:](v12, "setMinimumNumberOfSamplesForPersonalization:", v9);
    -[ODCurarePersonalizationPolicy setMinimumNumberOfSamplesForPersonalizationSelection:](v12, "setMinimumNumberOfSamplesForPersonalizationSelection:", v10);
  }

  return v12;
}

- (NSArray)hyperparameterSelectionPolicy
{
  return self->_hyperparameterSelectionPolicy;
}

- (void)setHyperparameterSelectionPolicy:(id)a3
{
  objc_storeStrong((id *)&self->_hyperparameterSelectionPolicy, a3);
}

- (NSNumber)minimumNumberOfSamplesForPersonalization
{
  return self->_minimumNumberOfSamplesForPersonalization;
}

- (void)setMinimumNumberOfSamplesForPersonalization:(id)a3
{
  objc_storeStrong((id *)&self->_minimumNumberOfSamplesForPersonalization, a3);
}

- (NSNumber)minimumNumberOfSamplesForPersonalizationSelection
{
  return self->_minimumNumberOfSamplesForPersonalizationSelection;
}

- (void)setMinimumNumberOfSamplesForPersonalizationSelection:(id)a3
{
  objc_storeStrong((id *)&self->_minimumNumberOfSamplesForPersonalizationSelection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minimumNumberOfSamplesForPersonalizationSelection, 0);
  objc_storeStrong((id *)&self->_minimumNumberOfSamplesForPersonalization, 0);
  objc_storeStrong((id *)&self->_hyperparameterSelectionPolicy, 0);
}

@end
