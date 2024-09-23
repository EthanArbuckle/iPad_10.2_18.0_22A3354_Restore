@implementation WCM_CoexMonitorIOS

- (WCM_CoexMonitorIOS)init
{
  WCM_CoexMonitorIOS *result;
  uint64_t i;
  objc_super v5;

  if (ADClientIsEnabled(self, a2))
  {
    v5.receiver = self;
    v5.super_class = (Class)WCM_CoexMonitorIOS;
    result = -[WCM_CoexMonitor init](&v5, "init");
    for (i = 0; i != 4; ++i)
    {
      result->lteCoexStart[i] = 0;
      result->lteCoexConditionBand[i] = -1;
    }
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("Aggd is not enabled"));
    return 0;
  }
  return result;
}

- (void)updateCoexCondition:(int)a3 inBand:(int)a4 state:(BOOL)a5
{
  uint64_t v6;
  unint64_t v7;
  unint64_t *lteCoexStart;
  uint64_t i;
  uint64_t v10;

  if (a3 < 4 || !a5)
  {
    if (a5)
    {
      v6 = a3;
      if (!self->lteCoexStart[a3] || self->lteCoexConditionBand[a3] != a4)
      {
        v7 = a4;
        self->lteCoexStart[a3] = ADMonotonicTimeGetCurrent();
        ++self->lteCoexCount[v6];
        self->lteCoexConditionBand[v6] = v7;
        ADClientAddValueForScalarKey(off_100203058[v6], 1);
        ADClientAddValueForScalarKey(off_100203078[v7], 1);
      }
    }
    else
    {
      lteCoexStart = self->lteCoexStart;
      if (a3 == 4)
      {
        for (i = 0; i != 4; ++i)
        {
          if (lteCoexStart[i])
          {
            ADPushTimeIntervalForDistributionKeySinceStartTime(off_1002030B8[i]);
            -[WCM_CoexMonitorIOS updateCoexDurationCount:](self, "updateCoexDurationCount:");
            lteCoexStart[i] = 0;
            self->lteCoexConditionBand[i] = -1;
          }
        }
      }
      else if (lteCoexStart[a3])
      {
        v10 = a3;
        ADPushTimeIntervalForDistributionKeySinceStartTime(off_1002030B8[a3]);
        -[WCM_CoexMonitorIOS updateCoexDurationCount:](self, "updateCoexDurationCount:");
        lteCoexStart[v10] = 0;
        self->lteCoexConditionBand[v10] = -1;
      }
    }
  }
}

- (void)updateCoexDurationCount:(double)a3
{
  uint64_t v3;

  if (a3 <= 5.0)
  {
    v3 = 0;
  }
  else if (a3 <= 30.0)
  {
    v3 = 1;
  }
  else if (a3 <= 120.0)
  {
    v3 = 2;
  }
  else if (a3 <= 300.0)
  {
    v3 = 3;
  }
  else
  {
    v3 = 4;
    if (a3 > 1800.0)
      v3 = 5;
  }
  ++self->lteCoexDurationsCount[v3];
  ADClientAddValueForScalarKey(off_1002030D8[v3], 1);
}

- (void)updateCoexErrorFor:(int)a3 inBand:(int)a4
{
  if (a3 <= 4)
  {
    if (a3 != 4)
    {
      ++self->lteCoexConditionErrors[a3];
      ADClientAddValueForScalarKey(off_100203108[a3], 1);
    }
    ++self->lteCoexBandErrors[a4];
    ADClientAddValueForScalarKey(off_100203128[a4], 1);
  }
}

- (unint64_t)getCoexCountFor:(int)a3
{
  return self->lteCoexCount[a3];
}

- (unint64_t)getCoexCountDurationFor:(int)a3
{
  return self->lteCoexDurationsCount[a3];
}

- (unint64_t)getCoexErrorCountFor:(int)a3
{
  return self->lteCoexConditionErrors[a3];
}

- (unint64_t)getCoexBandErrorCountFor:(int)a3
{
  return self->lteCoexBandErrors[a3];
}

@end
