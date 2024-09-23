@implementation WFActionParameterSummaryValueMatchResult

- (WFActionParameterSummaryValueMatchResult)initWithValue:(id)a3 matchType:(unint64_t)a4 numberOfMatchingParameters:(unint64_t)a5
{
  id v9;
  WFActionParameterSummaryValueMatchResult *v10;
  WFActionParameterSummaryValueMatchResult *v11;
  WFActionParameterSummaryValueMatchResult *v12;
  objc_super v14;

  v9 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WFActionParameterSummaryValueMatchResult;
  v10 = -[WFActionParameterSummaryValueMatchResult init](&v14, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_value, a3);
    v11->_matchType = a4;
    v11->_numberOfMatchingParameters = a5;
    v12 = v11;
  }

  return v11;
}

- (WFActionParameterSummaryValue)value
{
  return self->_value;
}

- (unint64_t)matchType
{
  return self->_matchType;
}

- (unint64_t)numberOfMatchingParameters
{
  return self->_numberOfMatchingParameters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
}

+ (id)noMatchWithValue:(id)a3
{
  id v3;
  WFActionParameterSummaryValueMatchResult *v4;

  v3 = a3;
  v4 = -[WFActionParameterSummaryValueMatchResult initWithValue:matchType:numberOfMatchingParameters:]([WFActionParameterSummaryValueMatchResult alloc], "initWithValue:matchType:numberOfMatchingParameters:", v3, 0, 0);

  return v4;
}

@end
