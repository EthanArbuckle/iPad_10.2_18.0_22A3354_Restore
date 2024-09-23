@implementation RTStateDepcitionOneStatePred

- (RTStateDepcitionOneStatePred)init
{
  RTStateDepcitionOneStatePred *v2;
  RTStateDepictionOnePredEl *v3;
  RTStateDepictionOnePredEl *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RTStateDepcitionOneStatePred;
  v2 = -[RTStateDepcitionOneStatePred init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(RTStateDepictionOnePredEl);
    -[RTStateDepcitionOneStatePred setWeekly:](v2, "setWeekly:", v3);

    v4 = objc_alloc_init(RTStateDepictionOnePredEl);
    -[RTStateDepcitionOneStatePred setDaily:](v2, "setDaily:", v4);

  }
  return v2;
}

- (RTStateDepictionOnePredEl)weekly
{
  return self->_weekly;
}

- (void)setWeekly:(id)a3
{
  objc_storeStrong((id *)&self->_weekly, a3);
}

- (RTStateDepictionOnePredEl)daily
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
