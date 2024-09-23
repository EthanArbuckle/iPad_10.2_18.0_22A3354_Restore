@implementation HKSPAnalyticsOnboardingInfo

- (HKSPAnalyticsOnboardingInfo)initWithStep:(unint64_t)a3 action:(unint64_t)a4 entryPoint:(unint64_t)a5
{
  HKSPAnalyticsOnboardingInfo *v8;
  HKSPAnalyticsOnboardingInfo *v9;
  HKSPAnalyticsOnboardingInfo *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)HKSPAnalyticsOnboardingInfo;
  v8 = -[HKSPAnalyticsOnboardingInfo init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_step = a3;
    v8->_action = a4;
    v8->_entryPoint = a5;
    v10 = v8;
  }

  return v9;
}

- (id)stepPayloadValue
{
  unint64_t v2;

  v2 = -[HKSPAnalyticsOnboardingInfo step](self, "step");
  if (v2 > 6)
    return &stru_1E4E3E220;
  else
    return off_1E4E3CCD0[v2];
}

- (id)actionPayloadValue
{
  unint64_t v3;
  unint64_t v4;
  __CFString **v5;

  v3 = -[HKSPAnalyticsOnboardingInfo step](self, "step");
  if (v3 - 3 < 2)
  {
    v4 = -[HKSPAnalyticsOnboardingInfo action](self, "action") - 2;
    if (v4 < 3)
    {
      v5 = off_1E4E3CD08;
      return v5[v4];
    }
  }
  else if (v3 == 1 || v3 == 5)
  {
    v4 = -[HKSPAnalyticsOnboardingInfo action](self, "action") - 2;
    if (v4 < 4)
    {
      v5 = off_1E4E3CD20;
      return v5[v4];
    }
  }
  return 0;
}

- (id)entryPointPayloadValue
{
  unint64_t v2;
  const __CFString *v3;

  v2 = -[HKSPAnalyticsOnboardingInfo entryPoint](self, "entryPoint");
  v3 = &stru_1E4E3E220;
  if (v2 == 1)
    v3 = CFSTR("TrackSleep");
  if (v2)
    return (id)v3;
  else
    return CFSTR("CompleteFlow");
}

- (unint64_t)step
{
  return self->_step;
}

- (unint64_t)action
{
  return self->_action;
}

- (unint64_t)entryPoint
{
  return self->_entryPoint;
}

@end
