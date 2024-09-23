@implementation _HKSPDefaultScheduleProvider

- (void)hksp_suggestedSleepScheduleWithCompletion:(id)a3
{
  void (**v3)(id, void *, _QWORD);
  HKSPMutableSleepScheduleOccurrence *v4;
  id v5;
  id v6;
  HKSPMutableAlarmConfiguration *v7;
  void *v8;
  HKSPMutableSleepSchedule *v9;

  v3 = (void (**)(id, void *, _QWORD))a3;
  v9 = objc_alloc_init(HKSPMutableSleepSchedule);
  -[HKSPMutableSleepSchedule setEnabled:](v9, "setEnabled:", 1);
  -[HKSPMutableSleepSchedule setSleepDurationGoal:](v9, "setSleepDurationGoal:", *(double *)&HKSPSleepDurationGoalHoursDefault * 3600.0);
  v4 = objc_alloc_init(HKSPMutableSleepScheduleOccurrence);
  -[HKSPMutableSleepScheduleOccurrence setWeekdays:](v4, "setWeekdays:", 127);
  v5 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  objc_msgSend(v5, "setHour:", HKSPBedtimeHourDefault);
  objc_msgSend(v5, "setMinute:", HKSPBedtimeMinuteDefault);
  -[HKSPMutableSleepScheduleOccurrence setBedtimeComponents:](v4, "setBedtimeComponents:", v5);
  v6 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  objc_msgSend(v6, "setHour:", HKSPWakeUpHourDefault);
  objc_msgSend(v6, "setMinute:", HKSPWakeUpMinuteDefault);
  -[HKSPMutableSleepScheduleOccurrence setWakeUpComponents:](v4, "setWakeUpComponents:", v6);
  v7 = objc_alloc_init(HKSPMutableAlarmConfiguration);
  -[HKSPMutableAlarmConfiguration setEnabled:](v7, "setEnabled:", 0);
  -[HKSPMutableSleepScheduleOccurrence setAlarmConfiguration:](v4, "setAlarmConfiguration:", v7);
  -[HKSPMutableSleepSchedule saveOccurrence:](v9, "saveOccurrence:", v4);
  v8 = (void *)-[HKSPMutableSleepSchedule copy](v9, "copy");
  v3[2](v3, v8, 0);

}

@end
