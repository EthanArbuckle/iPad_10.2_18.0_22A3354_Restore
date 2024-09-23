@implementation WBSCalculationResult

- (WBSCalculationResult)initWithCalculateResult:(id)a3
{
  id v5;
  WBSCalculationResult *v6;
  WBSCalculationResult *v7;
  uint64_t *v8;
  WBSCalculationResult *v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)WBSCalculationResult;
  v6 = -[WBSCalculationResult init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_result, a3);
    if (-[WBSCalculationResult isCalculation](v7, "isCalculation"))
    {
      if (calculationResultNumberFormatter_onceToken != -1)
        dispatch_once(&calculationResultNumberFormatter_onceToken, &__block_literal_global_8);
      v8 = &calculationResultNumberFormatter_formatter;
    }
    else
    {
      if (conversionResultNumberFormatter_onceToken != -1)
        dispatch_once(&conversionResultNumberFormatter_onceToken, &__block_literal_global_33);
      v8 = &conversionResultNumberFormatter_formatter;
    }
    -[CalculateResult setNumberFormatter:](v7->_result, "setNumberFormatter:", *v8);
    v9 = v7;
  }

  return v7;
}

- (BOOL)isCalculation
{
  void *v3;
  BOOL v4;
  void *v5;

  -[CalculateResult conversions](self->_result, "conversions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = 0;
  }
  else
  {
    -[CalculateResult inputValueAndUnit](self->_result, "inputValueAndUnit");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5 == 0;

  }
  return v4;
}

- (BOOL)isCurrencyConversion
{
  return -[CalculateResult unitType](self->_result, "unitType") == 16;
}

- (NSString)sectionTitle
{
  -[WBSCalculationResult isCalculation](self, "isCalculation");
  _WBSLocalizedString();
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSString)formattedExpression
{
  return (NSString *)-[CalculateResult formattedExpression](self->_result, "formattedExpression");
}

- (NSString)formattedResult
{
  return (NSString *)-[CalculateResult formattedResult](self->_result, "formattedResult");
}

- (NSString)formattedEquation
{
  void *v3;
  void *v4;

  -[CalculateResult formattedExpression](self->_result, "formattedExpression");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSCalculationResult reflectedStringForQueryString:](self, "reflectedStringForQueryString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (id)reflectedStringForQueryString:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = a3;
  _WBSLocalizedString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalculateResult formattedResult](self->_result, "formattedResult");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", v6, v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[WBSCalculationResult formattedEquation](self, "formattedEquation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "formattedEquation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToString:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_result, 0);
}

@end
