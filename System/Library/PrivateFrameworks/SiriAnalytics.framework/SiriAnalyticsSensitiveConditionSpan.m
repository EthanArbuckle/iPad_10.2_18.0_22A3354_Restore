@implementation SiriAnalyticsSensitiveConditionSpan

- (SiriAnalyticsSensitiveConditionSpan)initWithConditionType:(int)a3 startedAt:(unint64_t)a4
{
  SiriAnalyticsSensitiveConditionSpan *v6;
  SiriAnalyticsSensitiveConditionSpan *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SiriAnalyticsSensitiveConditionSpan;
  v6 = -[SiriAnalyticsSensitiveConditionSpan init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_conditionType = a3;
    -[SiriAnalyticsSensitiveConditionSpan setStartedAt:](v6, "setStartedAt:", a4);
  }
  return v7;
}

- (void)setStartedAt:(unint64_t)a3
{
  self->_hasStartedAtValue = 1;
  self->_startedAt = a3;
}

- (void)setEndedAt:(unint64_t)a3
{
  self->_hasEndedAtValue = 1;
  self->_endedAt = a3;
}

- (BOOL)hasEndedAt
{
  return self->_hasEndedAtValue;
}

- (BOOL)containsTimestamp:(unint64_t)a3
{
  return self->_hasStartedAtValue && self->_startedAt <= a3 && (self->_endedAt >= a3 || !self->_hasEndedAtValue);
}

- (int)conditionType
{
  return self->_conditionType;
}

- (void)setConditionType:(int)a3
{
  self->_conditionType = a3;
}

- (unint64_t)startedAt
{
  return self->_startedAt;
}

- (unint64_t)endedAt
{
  return self->_endedAt;
}

@end
