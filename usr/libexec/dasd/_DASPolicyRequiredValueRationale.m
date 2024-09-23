@implementation _DASPolicyRequiredValueRationale

- (_DASPolicyRequiredValueRationale)initWithCondition:(id)a3 withRequiredValue:(double)a4 withCurrentValue:(double)a5
{
  id v9;
  _DASPolicyRequiredValueRationale *v10;
  _DASPolicyRequiredValueRationale *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_DASPolicyRequiredValueRationale;
  v10 = -[_DASPolicyRequiredValueRationale init](&v13, "init");
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_condition, a3);
    v11->_currentValue = a5;
    v11->_requiredValue = a4;
  }

  return v11;
}

- (id)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[%@]: Required:%3.2f, Observed:%3.2f"), self->_condition, *(_QWORD *)&self->_requiredValue, *(_QWORD *)&self->_currentValue);
}

- (NSString)condition
{
  return self->_condition;
}

- (void)setCondition:(id)a3
{
  objc_storeStrong((id *)&self->_condition, a3);
}

- (double)currentValue
{
  return self->_currentValue;
}

- (void)setCurrentValue:(double)a3
{
  self->_currentValue = a3;
}

- (double)requiredValue
{
  return self->_requiredValue;
}

- (void)setRequiredValue:(double)a3
{
  self->_requiredValue = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_condition, 0);
}

@end
