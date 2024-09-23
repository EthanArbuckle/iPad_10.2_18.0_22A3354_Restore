@implementation RTStateTransitionOneTransPred

- (RTStateTransitionOneTransPred)init
{
  RTStateTransitionOneTransPred *v2;
  RTStateTransitionOnePredEl *v3;
  RTStateTransitionOnePredEl *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RTStateTransitionOneTransPred;
  v2 = -[RTStateTransitionOneTransPred init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(RTStateTransitionOnePredEl);
    -[RTStateTransitionOneTransPred setWeekly:](v2, "setWeekly:", v3);

    v4 = objc_alloc_init(RTStateTransitionOnePredEl);
    -[RTStateTransitionOneTransPred setDaily:](v2, "setDaily:", v4);

  }
  return v2;
}

- (RTStateTransitionOnePredEl)weekly
{
  return self->_weekly;
}

- (void)setWeekly:(id)a3
{
  objc_storeStrong((id *)&self->_weekly, a3);
}

- (RTStateTransitionOnePredEl)daily
{
  return self->_daily;
}

- (void)setDaily:(id)a3
{
  objc_storeStrong((id *)&self->_daily, a3);
}

- (NSUUID)stateUUID
{
  return self->_stateUUID;
}

- (void)setStateUUID:(id)a3
{
  objc_storeStrong((id *)&self->_stateUUID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateUUID, 0);
  objc_storeStrong((id *)&self->_daily, 0);
  objc_storeStrong((id *)&self->_weekly, 0);
}

@end
