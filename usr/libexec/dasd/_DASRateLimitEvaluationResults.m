@implementation _DASRateLimitEvaluationResults

- (_DASRateLimitEvaluationResults)initWithMaxedRateLimits:(id)a3 withNextEvaluationDate:(id)a4
{
  id v7;
  id v8;
  _DASRateLimitEvaluationResults *v9;
  _DASRateLimitEvaluationResults *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_DASRateLimitEvaluationResults;
  v9 = -[_DASRateLimitEvaluationResults init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_maxedRateLimits, a3);
    objc_storeStrong((id *)&v10->_nextEvaluationDate, a4);
  }

  return v10;
}

+ (id)evaluationResultsWithMaxedRateLimits:(id)a3 withNextEvaluationDate:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = objc_msgSend(objc_alloc((Class)objc_opt_class(a1)), "initWithMaxedRateLimits:withNextEvaluationDate:", v7, v6);

  return v8;
}

- (NSDate)nextEvaluationDate
{
  return self->_nextEvaluationDate;
}

- (void)setNextEvaluationDate:(id)a3
{
  objc_storeStrong((id *)&self->_nextEvaluationDate, a3);
}

- (NSMutableArray)maxedRateLimits
{
  return self->_maxedRateLimits;
}

- (void)setMaxedRateLimits:(id)a3
{
  objc_storeStrong((id *)&self->_maxedRateLimits, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maxedRateLimits, 0);
  objc_storeStrong((id *)&self->_nextEvaluationDate, 0);
}

@end
