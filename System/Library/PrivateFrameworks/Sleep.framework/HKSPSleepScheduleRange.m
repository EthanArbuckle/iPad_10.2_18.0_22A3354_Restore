@implementation HKSPSleepScheduleRange

- (HKSPSleepScheduleRange)initWithLatestWakeUpComponents:(id)a3 latestBedtimeComponents:(id)a4 earliestWakeUpComponents:(id)a5 earliestBedtimeComponents:(id)a6 earliestBedtimeIsOnPreviousDay:(BOOL)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  HKSPSleepScheduleRange *v16;
  uint64_t v17;
  NSDateComponents *latestWakeUpComponents;
  uint64_t v19;
  NSDateComponents *latestBedtimeComponents;
  uint64_t v21;
  NSDateComponents *earliestWakeUpComponents;
  uint64_t v23;
  NSDateComponents *earliestBedtimeComponents;
  HKSPSleepScheduleRange *v25;
  objc_super v27;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v27.receiver = self;
  v27.super_class = (Class)HKSPSleepScheduleRange;
  v16 = -[HKSPSleepScheduleRange init](&v27, sel_init);
  if (v16)
  {
    v17 = objc_msgSend(v12, "copy");
    latestWakeUpComponents = v16->_latestWakeUpComponents;
    v16->_latestWakeUpComponents = (NSDateComponents *)v17;

    v19 = objc_msgSend(v13, "copy");
    latestBedtimeComponents = v16->_latestBedtimeComponents;
    v16->_latestBedtimeComponents = (NSDateComponents *)v19;

    v21 = objc_msgSend(v14, "copy");
    earliestWakeUpComponents = v16->_earliestWakeUpComponents;
    v16->_earliestWakeUpComponents = (NSDateComponents *)v21;

    v23 = objc_msgSend(v15, "copy");
    earliestBedtimeComponents = v16->_earliestBedtimeComponents;
    v16->_earliestBedtimeComponents = (NSDateComponents *)v23;

    v16->_earliestBedtimeIsOnPreviousDay = a7;
    v25 = v16;
  }

  return v16;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[HKSPSleepScheduleRange succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HKSPSleepScheduleRange earliestBedtimeComponents](self, "earliestBedtimeComponents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hksp_description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[HKSPSleepScheduleRange earliestBedtimeIsOnPreviousDay](self, "earliestBedtimeIsOnPreviousDay"))
    v6 = CFSTR("(-1)");
  else
    v6 = &stru_1E4E3E220;
  -[HKSPSleepScheduleRange earliestWakeUpComponents](self, "earliestWakeUpComponents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hksp_description");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSPSleepScheduleRange latestBedtimeComponents](self, "latestBedtimeComponents");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hksp_description");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSPSleepScheduleRange latestWakeUpComponents](self, "latestWakeUpComponents");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "hksp_description");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[%@%@ - %@] - [%@ - %@]"), v5, v6, v8, v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "appendString:withName:", v13, CFSTR("range"));

  return v15;
}

- (NSDateComponents)latestWakeUpComponents
{
  return self->_latestWakeUpComponents;
}

- (NSDateComponents)earliestWakeUpComponents
{
  return self->_earliestWakeUpComponents;
}

- (NSDateComponents)latestBedtimeComponents
{
  return self->_latestBedtimeComponents;
}

- (NSDateComponents)earliestBedtimeComponents
{
  return self->_earliestBedtimeComponents;
}

- (BOOL)earliestBedtimeIsOnPreviousDay
{
  return self->_earliestBedtimeIsOnPreviousDay;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_earliestBedtimeComponents, 0);
  objc_storeStrong((id *)&self->_latestBedtimeComponents, 0);
  objc_storeStrong((id *)&self->_earliestWakeUpComponents, 0);
  objc_storeStrong((id *)&self->_latestWakeUpComponents, 0);
}

@end
