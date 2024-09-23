@implementation _DASPolicyResponse

- (int64_t)policyDecision
{
  return self->_policyDecision;
}

+ (id)policyResponseWithDecision:(int64_t)a3 validityDuration:(double)a4 rationale:(id)a5
{
  double v8;
  id v9;
  _DASPolicyResponse *v10;

  if (a3 == 100 || a3 == 33)
    v8 = 0.0;
  else
    v8 = 1.0;
  v9 = a5;
  v10 = -[_DASPolicyResponse initWithScore:decision:validityDuration:rationale:]([_DASPolicyResponse alloc], "initWithScore:decision:validityDuration:rationale:", a3, v9, v8, a4);

  return v10;
}

- (_DASPolicyResponse)initWithScore:(double)a3 decision:(int64_t)a4 validityDuration:(double)a5 rationale:(id)a6
{
  id v11;
  _DASPolicyResponse *v12;
  _DASPolicyResponse *v13;
  objc_super v15;

  v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)_DASPolicyResponse;
  v12 = -[_DASPolicyResponse init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    v12->_score = a3;
    v12->_policyDecision = a4;
    v12->_validityDuration = a5;
    objc_storeStrong((id *)&v12->_rationale, a6);
  }

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rationale, 0);
}

+ (id)prettyDecisionDescription:(int64_t)a3
{
  if (a3 <= 66)
  {
    if (!a3)
      return CFSTR("Can Proceed");
    if (a3 == 33)
      return CFSTR("Must Not Proceed");
  }
  else
  {
    switch(a3)
    {
      case 67:
        return CFSTR("Must Proceed");
      case 100:
        return CFSTR("Absolutely Must Not Proceed");
      case 200:
        return CFSTR("Absolutely Must Proceed");
    }
  }
  return CFSTR("Unknown Decision (Proceed)");
}

+ (id)abbreviatedDecision:(int64_t)a3
{
  if (a3 <= 66)
  {
    if (!a3)
      return CFSTR("CP");
    if (a3 == 33)
      return CFSTR("MNP");
  }
  else
  {
    switch(a3)
    {
      case 67:
        return CFSTR("MP");
      case 100:
        return CFSTR("AMNP");
      case 200:
        return CFSTR("AMP");
    }
  }
  return CFSTR("UD(P)");
}

- (id)description
{
  int64_t policyDecision;
  double score;
  void *v4;
  void *v5;

  policyDecision = self->_policyDecision;
  score = self->_score;
  if (self->_rationale)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(", %@"), self->_rationale));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("{%ld, %2.2lf%@}"), policyDecision, *(_QWORD *)&score, v4));

  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("{%ld, %2.2lf%@}"), policyDecision, *(_QWORD *)&score, &stru_1001617C8));
  }
  return v5;
}

+ (id)policyResponseWithScore:(double)a3 validityDuration:(double)a4 rationale:(id)a5
{
  id v7;
  _DASPolicyResponse *v8;
  uint64_t v9;
  _DASPolicyResponse *v10;

  v7 = a5;
  v8 = [_DASPolicyResponse alloc];
  if (a3 <= 0.0)
    v9 = 33;
  else
    v9 = 0;
  v10 = -[_DASPolicyResponse initWithScore:decision:validityDuration:rationale:](v8, "initWithScore:decision:validityDuration:rationale:", v9, v7, a3, a4);

  return v10;
}

+ (BOOL)isScoreBlocking:(double)a3
{
  return a3 < 0.00000999999975;
}

+ (BOOL)isPolicyDecisionProceedable:(int64_t)a3
{
  BOOL v3;

  v3 = a3 == 200;
  if (a3 == 67)
    v3 = 1;
  return !a3 || v3;
}

- (double)score
{
  return self->_score;
}

- (void)setPolicyDecision:(int64_t)a3
{
  self->_policyDecision = a3;
}

- (double)validityDuration
{
  return self->_validityDuration;
}

- (void)setValidityDuration:(double)a3
{
  self->_validityDuration = a3;
}

- (_DASPolicyResponseRationale)rationale
{
  return self->_rationale;
}

- (void)setRationale:(id)a3
{
  objc_storeStrong((id *)&self->_rationale, a3);
}

@end
