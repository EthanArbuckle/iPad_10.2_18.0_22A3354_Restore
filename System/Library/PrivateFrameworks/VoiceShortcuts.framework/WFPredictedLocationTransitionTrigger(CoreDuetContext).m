@implementation WFPredictedLocationTransitionTrigger(CoreDuetContext)

- (uint64_t)contextStoreKeyPathForCurrentState
{
  return objc_msgSend(MEMORY[0x1E0D15C58], "keyPathForPredictedLocationOfInterestTransitions");
}

- (id)contextStorePredicate
{
  _BOOL8 v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v2 = objc_msgSend(a1, "destinationType") == 1;
  objc_msgSend(a1, "contextStoreKeyPathForCurrentState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0D15C90];
  objc_msgSend(MEMORY[0x1E0D15C58], "locationOfInterestTypeKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15C58], "transitionWithinTimeIntervalKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a1, "timeIntervalUpperBound");
  objc_msgSend(v8, "numberWithDouble:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15C58], "transitionWithinTimeIntervalKey");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a1, "timeIntervalLowerBound");
  objc_msgSend(v11, "numberWithDouble:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "predicateForKeyPath:withFormat:", v3, CFSTR("SUBQUERY(SELF.%@.value, $prediction, $prediction.%K = %@ AND $prediction.%K <= %@ AND $prediction.%K > %@).@count > 0"), v3, v5, v6, v7, v9, v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (uint64_t)contextStoreQualityOfService
{
  return 25;
}

- (double)timeIntervalUpperBound
{
  uint64_t v1;

  v1 = objc_msgSend(a1, "minutesBefore");
  if ((unint64_t)(v1 - 1) > 4)
    return 60.0;
  else
    return dbl_1C15666B8[v1 - 1];
}

- (double)timeIntervalLowerBound
{
  uint64_t v1;

  v1 = objc_msgSend(a1, "minutesBefore");
  if ((unint64_t)(v1 - 1) > 4)
    return -60.0;
  else
    return dbl_1C15666E0[v1 - 1];
}

@end
