@implementation HKSPAnalyticsDailyReportEvent

- (NSString)eventName
{
  return (NSString *)CFSTR("com.apple.SleepHealth.Daily");
}

- (NSDictionary)eventPayload
{
  void *v3;
  void *v4;
  _BOOL8 v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  _BOOL8 v9;
  void *v10;
  _BOOL8 v11;
  void *v12;
  _BOOL8 v13;
  void *v14;
  _BOOL8 v15;
  void *v16;
  _BOOL8 v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  id v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  _QWORD v118[47];
  _QWORD v119[49];

  v119[47] = *MEMORY[0x1E0C80C00];
  v107 = objc_alloc(MEMORY[0x1E0C99E08]);
  v118[0] = CFSTR("bedTimeWindDownRemindersEnabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HKSPAnalyticsDailyReportEvent bedTimeWindDownRemindersEnabled](self, "bedTimeWindDownRemindersEnabled"));
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  v119[0] = v117;
  v118[1] = CFSTR("chargeRemindersEnabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HKSPAnalyticsDailyReportEvent chargeRemindersEnabled](self, "chargeRemindersEnabled"));
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  v119[1] = v116;
  v118[2] = CFSTR("isIHA");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HKSPAnalyticsDailyReportEvent isImproveHealthAndActivitySubmissionAllowed](self, "isImproveHealthAndActivitySubmissionAllowed"));
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  v119[2] = v115;
  v118[3] = CFSTR("scheduleChangePast24Hours");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HKSPAnalyticsDailyReportEvent scheduleChangePast24Hours](self, "scheduleChangePast24Hours"));
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  v119[3] = v114;
  v118[4] = CFSTR("scheduleChangePast7days");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HKSPAnalyticsDailyReportEvent scheduleChangePast7days](self, "scheduleChangePast7days"));
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  v119[4] = v113;
  v118[5] = CFSTR("scheduleDisabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HKSPAnalyticsDailyReportEvent scheduleDisabled](self, "scheduleDisabled"));
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  v119[5] = v112;
  v118[6] = CFSTR("scheduledSleepModeEnabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HKSPAnalyticsDailyReportEvent scheduledSleepModeEnabled](self, "scheduledSleepModeEnabled"));
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v119[6] = v111;
  v118[7] = CFSTR("scheduleMigration");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HKSPAnalyticsDailyReportEvent scheduleMigration](self, "scheduleMigration"));
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  v119[7] = v110;
  v118[8] = CFSTR("sleepGoal");
  v3 = (void *)MEMORY[0x1E0CB37E8];
  -[HKSPAnalyticsDailyReportEvent sleepGoal](self, "sleepGoal");
  objc_msgSend(v3, "numberWithDouble:");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  v119[8] = v109;
  v118[9] = CFSTR("timeInBedTrackingEnabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HKSPAnalyticsDailyReportEvent timeInBedTrackingEnabled](self, "timeInBedTrackingEnabled"));
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  v119[9] = v108;
  v118[10] = CFSTR("wakeUpResultsEnabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HKSPAnalyticsDailyReportEvent wakeUpResultsEnabled](self, "wakeUpResultsEnabled"));
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v119[10] = v106;
  v118[11] = CFSTR("watchSleepTrackingEnabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HKSPAnalyticsDailyReportEvent watchSleepTrackingEnabled](self, "watchSleepTrackingEnabled"));
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  v119[11] = v105;
  v118[12] = CFSTR("interactedWithWindDownLast24Hrs");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HKSPAnalyticsDailyReportEvent interactedWithWindDownLast24Hrs](self, "interactedWithWindDownLast24Hrs"));
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  v119[12] = v104;
  v118[13] = CFSTR("useSleepScreen");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HKSPAnalyticsDailyReportEvent useSleepScreen](self, "useSleepScreen"));
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v119[13] = v103;
  v118[14] = CFSTR("maxSleepTrackingVersionOnboarded");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HKSPAnalyticsDailyReportEvent maxSleepTrackingVersionOnboarded](self, "maxSleepTrackingVersionOnboarded"));
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  v119[14] = v102;
  v118[15] = CFSTR("maxSleepCoachingVersionOnboarded");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HKSPAnalyticsDailyReportEvent maxSleepCoachingVersionOnboarded](self, "maxSleepCoachingVersionOnboarded"));
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v119[15] = v101;
  v118[16] = CFSTR("hasSleepFocusConfigured");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HKSPAnalyticsDailyReportEvent hasSleepFocusConfigured](self, "hasSleepFocusConfigured"));
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v119[16] = v100;
  v118[17] = CFSTR("alarmFriday");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HKSPAnalyticsDailyReportEvent alarmFriday](self, "alarmFriday"));
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v119[17] = v99;
  v118[18] = CFSTR("alarmMonday");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HKSPAnalyticsDailyReportEvent alarmMonday](self, "alarmMonday"));
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v119[18] = v98;
  v118[19] = CFSTR("alarmSaturday");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HKSPAnalyticsDailyReportEvent alarmSaturday](self, "alarmSaturday"));
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v119[19] = v97;
  v118[20] = CFSTR("alarmSunday");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HKSPAnalyticsDailyReportEvent alarmSunday](self, "alarmSunday"));
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v119[20] = v96;
  v118[21] = CFSTR("alarmThursday");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HKSPAnalyticsDailyReportEvent alarmThursday](self, "alarmThursday"));
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v119[21] = v95;
  v118[22] = CFSTR("alarmTuesday");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HKSPAnalyticsDailyReportEvent alarmTuesday](self, "alarmTuesday"));
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v119[22] = v94;
  v118[23] = CFSTR("alarmWednesday");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HKSPAnalyticsDailyReportEvent alarmWednesday](self, "alarmWednesday"));
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v119[23] = v93;
  v118[24] = CFSTR("scheduleFriday");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HKSPAnalyticsDailyReportEvent scheduleFriday](self, "scheduleFriday"));
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v119[24] = v92;
  v118[25] = CFSTR("scheduleMonday");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HKSPAnalyticsDailyReportEvent scheduleMonday](self, "scheduleMonday"));
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v119[25] = v91;
  v118[26] = CFSTR("scheduleSaturday");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HKSPAnalyticsDailyReportEvent scheduleSaturday](self, "scheduleSaturday"));
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v119[26] = v90;
  v118[27] = CFSTR("scheduleSunday");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HKSPAnalyticsDailyReportEvent scheduleSunday](self, "scheduleSunday"));
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v119[27] = v89;
  v118[28] = CFSTR("scheduleThursday");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HKSPAnalyticsDailyReportEvent scheduleThursday](self, "scheduleThursday"));
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v119[28] = v88;
  v118[29] = CFSTR("scheduleTuesday");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HKSPAnalyticsDailyReportEvent scheduleTuesday](self, "scheduleTuesday"));
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v119[29] = v87;
  v118[30] = CFSTR("scheduleWednesday");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HKSPAnalyticsDailyReportEvent scheduleWednesday](self, "scheduleWednesday"));
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v119[30] = v86;
  v118[31] = CFSTR("defaultScheduleFriday");
  v4 = (void *)MEMORY[0x1E0CB37E8];
  if (-[HKSPAnalyticsDailyReportEvent scheduleFriday](self, "scheduleFriday"))
    v5 = -[HKSPAnalyticsDailyReportEvent isDefaultScheduleFriday](self, "isDefaultScheduleFriday");
  else
    v5 = 0;
  objc_msgSend(v4, "numberWithInt:", v5);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v119[31] = v85;
  v118[32] = CFSTR("defaultScheduleMonday");
  v6 = (void *)MEMORY[0x1E0CB37E8];
  if (-[HKSPAnalyticsDailyReportEvent scheduleMonday](self, "scheduleMonday"))
    v7 = -[HKSPAnalyticsDailyReportEvent isDefaultScheduleMonday](self, "isDefaultScheduleMonday");
  else
    v7 = 0;
  objc_msgSend(v6, "numberWithInt:", v7);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v119[32] = v84;
  v118[33] = CFSTR("defaultScheduleSaturday");
  v8 = (void *)MEMORY[0x1E0CB37E8];
  if (-[HKSPAnalyticsDailyReportEvent scheduleSaturday](self, "scheduleSaturday"))
    v9 = -[HKSPAnalyticsDailyReportEvent isDefaultScheduleSaturday](self, "isDefaultScheduleSaturday");
  else
    v9 = 0;
  objc_msgSend(v8, "numberWithInt:", v9);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v119[33] = v83;
  v118[34] = CFSTR("defaultScheduleSunday");
  v10 = (void *)MEMORY[0x1E0CB37E8];
  if (-[HKSPAnalyticsDailyReportEvent scheduleSunday](self, "scheduleSunday"))
    v11 = -[HKSPAnalyticsDailyReportEvent isDefaultScheduleSunday](self, "isDefaultScheduleSunday");
  else
    v11 = 0;
  objc_msgSend(v10, "numberWithInt:", v11);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v119[34] = v82;
  v118[35] = CFSTR("defaultScheduleThursday");
  v12 = (void *)MEMORY[0x1E0CB37E8];
  if (-[HKSPAnalyticsDailyReportEvent scheduleThursday](self, "scheduleThursday"))
    v13 = -[HKSPAnalyticsDailyReportEvent isDefaultScheduleThursday](self, "isDefaultScheduleThursday");
  else
    v13 = 0;
  objc_msgSend(v12, "numberWithInt:", v13);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v119[35] = v81;
  v118[36] = CFSTR("defaultScheduleTuesday");
  v14 = (void *)MEMORY[0x1E0CB37E8];
  if (-[HKSPAnalyticsDailyReportEvent scheduleTuesday](self, "scheduleTuesday"))
    v15 = -[HKSPAnalyticsDailyReportEvent isDefaultScheduleTuesday](self, "isDefaultScheduleTuesday");
  else
    v15 = 0;
  objc_msgSend(v14, "numberWithInt:", v15);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v119[36] = v80;
  v118[37] = CFSTR("defaultScheduleWednesday");
  v16 = (void *)MEMORY[0x1E0CB37E8];
  if (-[HKSPAnalyticsDailyReportEvent scheduleWednesday](self, "scheduleWednesday"))
    v17 = -[HKSPAnalyticsDailyReportEvent isDefaultScheduleWednesday](self, "isDefaultScheduleWednesday");
  else
    v17 = 0;
  objc_msgSend(v16, "numberWithInt:", v17);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v119[37] = v79;
  v118[38] = CFSTR("daysWornWatchToSleepInLast7Days");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HKSPAnalyticsDailyReportEvent daysWornWatchToSleepInLast7Days](self, "daysWornWatchToSleepInLast7Days"));
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v119[38] = v78;
  v118[39] = CFSTR("daysWornWatchToSleepInLast30Days");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HKSPAnalyticsDailyReportEvent daysWornWatchToSleepInLast30Days](self, "daysWornWatchToSleepInLast30Days"));
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v119[39] = v77;
  v118[40] = CFSTR("weekendDaysWornWatchToSleepInLast7Days");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HKSPAnalyticsDailyReportEvent weekendDaysWornWatchToSleepInLast7Days](self, "weekendDaysWornWatchToSleepInLast7Days"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v119[40] = v18;
  v118[41] = CFSTR("didWearWatchToSleepLastNight");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HKSPAnalyticsDailyReportEvent didWearWatchToSleepLastNight](self, "didWearWatchToSleepLastNight"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v119[41] = v19;
  v118[42] = CFSTR("sleepDurationLastNight");
  v20 = (void *)MEMORY[0x1E0CB37E8];
  -[HKSPAnalyticsDailyReportEvent sleepDurationLastNight](self, "sleepDurationLastNight");
  objc_msgSend(v20, "numberWithDouble:");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v119[42] = v21;
  v118[43] = CFSTR("sleepStagePercentAwakeLastNight");
  v22 = (void *)MEMORY[0x1E0CB37E8];
  -[HKSPAnalyticsDailyReportEvent sleepStagePercentAwakeLastNight](self, "sleepStagePercentAwakeLastNight");
  objc_msgSend(v22, "numberWithDouble:");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v119[43] = v23;
  v118[44] = CFSTR("sleepStagePercentRemLastNight");
  v24 = (void *)MEMORY[0x1E0CB37E8];
  -[HKSPAnalyticsDailyReportEvent sleepStagePercentRemLastNight](self, "sleepStagePercentRemLastNight");
  objc_msgSend(v24, "numberWithDouble:");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v119[44] = v25;
  v118[45] = CFSTR("sleepStagePercentCoreLastNight");
  v26 = (void *)MEMORY[0x1E0CB37E8];
  -[HKSPAnalyticsDailyReportEvent sleepStagePercentCoreLastNight](self, "sleepStagePercentCoreLastNight");
  objc_msgSend(v26, "numberWithDouble:");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v119[45] = v27;
  v118[46] = CFSTR("sleepStagePercentDeepLastNight");
  v28 = (void *)MEMORY[0x1E0CB37E8];
  -[HKSPAnalyticsDailyReportEvent sleepStagePercentDeepLastNight](self, "sleepStagePercentDeepLastNight");
  objc_msgSend(v28, "numberWithDouble:");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v119[46] = v29;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v119, v118, 47);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)objc_msgSend(v107, "initWithDictionary:", v30);

  -[HKSPAnalyticsDailyReportEvent userAge](self, "userAge");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    -[HKSPAnalyticsDailyReportEvent userAge](self, "userAge");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setObject:forKeyedSubscript:", v33, CFSTR("userAge"));

  }
  -[HKSPAnalyticsDailyReportEvent biologicalSex](self, "biologicalSex");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    -[HKSPAnalyticsDailyReportEvent biologicalSex](self, "biologicalSex");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setObject:forKeyedSubscript:", v35, CFSTR("biologicalSex"));

  }
  -[HKSPAnalyticsDailyReportEvent hapticToneIdentifierFriday](self, "hapticToneIdentifierFriday");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    -[HKSPAnalyticsDailyReportEvent hapticToneIdentifierFriday](self, "hapticToneIdentifierFriday");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setObject:forKeyedSubscript:", v37, CFSTR("hapticToneIdentifierFriday"));

  }
  -[HKSPAnalyticsDailyReportEvent hapticToneIdentifierMonday](self, "hapticToneIdentifierMonday");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (v38)
  {
    -[HKSPAnalyticsDailyReportEvent hapticToneIdentifierMonday](self, "hapticToneIdentifierMonday");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setObject:forKeyedSubscript:", v39, CFSTR("hapticToneIdentifierMonday"));

  }
  -[HKSPAnalyticsDailyReportEvent hapticToneIdentifierSaturday](self, "hapticToneIdentifierSaturday");
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  if (v40)
  {
    -[HKSPAnalyticsDailyReportEvent hapticToneIdentifierSaturday](self, "hapticToneIdentifierSaturday");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setObject:forKeyedSubscript:", v41, CFSTR("hapticToneIdentifierSaturday"));

  }
  -[HKSPAnalyticsDailyReportEvent hapticToneIdentifierSunday](self, "hapticToneIdentifierSunday");
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (v42)
  {
    -[HKSPAnalyticsDailyReportEvent hapticToneIdentifierSunday](self, "hapticToneIdentifierSunday");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setObject:forKeyedSubscript:", v43, CFSTR("hapticToneIdentifierSunday"));

  }
  -[HKSPAnalyticsDailyReportEvent hapticToneIdentifierThursday](self, "hapticToneIdentifierThursday");
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  if (v44)
  {
    -[HKSPAnalyticsDailyReportEvent hapticToneIdentifierThursday](self, "hapticToneIdentifierThursday");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setObject:forKeyedSubscript:", v45, CFSTR("hapticToneIdentifierThursday"));

  }
  -[HKSPAnalyticsDailyReportEvent hapticToneIdentifierTuesday](self, "hapticToneIdentifierTuesday");
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  if (v46)
  {
    -[HKSPAnalyticsDailyReportEvent hapticToneIdentifierTuesday](self, "hapticToneIdentifierTuesday");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setObject:forKeyedSubscript:", v47, CFSTR("hapticToneIdentifierTuesday"));

  }
  -[HKSPAnalyticsDailyReportEvent hapticToneIdentifierWednesday](self, "hapticToneIdentifierWednesday");
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  if (v48)
  {
    -[HKSPAnalyticsDailyReportEvent hapticToneIdentifierWednesday](self, "hapticToneIdentifierWednesday");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setObject:forKeyedSubscript:", v49, CFSTR("hapticToneIdentifierWednesday"));

  }
  -[HKSPAnalyticsDailyReportEvent activeWatchProductType](self, "activeWatchProductType");
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  if (v50)
  {
    -[HKSPAnalyticsDailyReportEvent activeWatchProductType](self, "activeWatchProductType");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setObject:forKeyedSubscript:", v51, CFSTR("activeWatchProductType"));

  }
  -[HKSPAnalyticsDailyReportEvent weeksSinceOnboardedSleepSchedule](self, "weeksSinceOnboardedSleepSchedule");
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  if (v52)
  {
    -[HKSPAnalyticsDailyReportEvent weeksSinceOnboardedSleepSchedule](self, "weeksSinceOnboardedSleepSchedule");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setObject:forKeyedSubscript:", v53, CFSTR("weeksSinceOnboardedSleepSchedule"));

  }
  -[HKSPAnalyticsDailyReportEvent weeksSinceOnboardedSleepTracking](self, "weeksSinceOnboardedSleepTracking");
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  if (v54)
  {
    -[HKSPAnalyticsDailyReportEvent weeksSinceOnboardedSleepTracking](self, "weeksSinceOnboardedSleepTracking");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setObject:forKeyedSubscript:", v55, CFSTR("weeksSinceOnboardedSleepTracking"));

  }
  -[HKSPAnalyticsDailyReportEvent weeksSinceOnboardedWindDownActions](self, "weeksSinceOnboardedWindDownActions");
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  if (v56)
  {
    -[HKSPAnalyticsDailyReportEvent weeksSinceOnboardedWindDownActions](self, "weeksSinceOnboardedWindDownActions");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setObject:forKeyedSubscript:", v57, CFSTR("weeksSinceOnboardedWindDownActions"));

  }
  -[HKSPAnalyticsDailyReportEvent stddevActualTimeAsleep](self, "stddevActualTimeAsleep");
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  if (v58)
  {
    -[HKSPAnalyticsDailyReportEvent stddevActualTimeAsleep](self, "stddevActualTimeAsleep");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setObject:forKeyedSubscript:", v59, CFSTR("stddevActualTimeAsleep"));

  }
  -[HKSPAnalyticsDailyReportEvent stddevScheduledTimeAsleep](self, "stddevScheduledTimeAsleep");
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  if (v60)
  {
    -[HKSPAnalyticsDailyReportEvent stddevScheduledTimeAsleep](self, "stddevScheduledTimeAsleep");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setObject:forKeyedSubscript:", v61, CFSTR("stddevScheduledTimeAsleep"));

  }
  -[HKSPAnalyticsDailyReportEvent stddevActualVsScheduledTimeAsleep](self, "stddevActualVsScheduledTimeAsleep");
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  if (v62)
  {
    -[HKSPAnalyticsDailyReportEvent stddevActualVsScheduledTimeAsleep](self, "stddevActualVsScheduledTimeAsleep");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setObject:forKeyedSubscript:", v63, CFSTR("stddevActualVsScheduledTimeAsleep"));

  }
  -[HKSPAnalyticsDailyReportEvent isOnboardedBD](self, "isOnboardedBD");
  v64 = (void *)objc_claimAutoreleasedReturnValue();

  if (v64)
  {
    v65 = (void *)MEMORY[0x1E0CB37E8];
    -[HKSPAnalyticsDailyReportEvent isOnboardedBD](self, "isOnboardedBD");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "numberWithBool:", objc_msgSend(v66, "BOOLValue"));
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setObject:forKeyedSubscript:", v67, CFSTR("isOnboardedBD"));

  }
  -[HKSPAnalyticsDailyReportEvent meanTimeBetweenBDSessionsPastNight](self, "meanTimeBetweenBDSessionsPastNight");
  v68 = (void *)objc_claimAutoreleasedReturnValue();

  if (v68)
  {
    -[HKSPAnalyticsDailyReportEvent meanTimeBetweenBDSessionsPastNight](self, "meanTimeBetweenBDSessionsPastNight");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setObject:forKeyedSubscript:", v69, CFSTR("meanTimeBetweenSessionsPastNight"));

  }
  -[HKSPAnalyticsDailyReportEvent maxTimeBetweenBDSessionsPastNight](self, "maxTimeBetweenBDSessionsPastNight");
  v70 = (void *)objc_claimAutoreleasedReturnValue();

  if (v70)
  {
    -[HKSPAnalyticsDailyReportEvent maxTimeBetweenBDSessionsPastNight](self, "maxTimeBetweenBDSessionsPastNight");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setObject:forKeyedSubscript:", v71, CFSTR("maxTimeBetweenSessionsPastNight"));

  }
  -[HKSPAnalyticsDailyReportEvent minTimeBetweenBDSessionsPastNight](self, "minTimeBetweenBDSessionsPastNight");
  v72 = (void *)objc_claimAutoreleasedReturnValue();

  if (v72)
  {
    -[HKSPAnalyticsDailyReportEvent minTimeBetweenBDSessionsPastNight](self, "minTimeBetweenBDSessionsPastNight");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setObject:forKeyedSubscript:", v73, CFSTR("minTimeBetweenSessionsPastNight"));

  }
  -[HKSPAnalyticsDailyReportEvent numBDValuesInPastNight](self, "numBDValuesInPastNight");
  v74 = (void *)objc_claimAutoreleasedReturnValue();

  if (v74)
  {
    -[HKSPAnalyticsDailyReportEvent numBDValuesInPastNight](self, "numBDValuesInPastNight");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setObject:forKeyedSubscript:", v75, CFSTR("numBDValuesInPastNight"));

  }
  return (NSDictionary *)v31;
}

- (NSArray)keysRequiringIHAGating
{
  return (NSArray *)&unk_1E4E52D68;
}

- (BOOL)isImproveHealthAndActivitySubmissionAllowed
{
  return self->_isImproveHealthAndActivitySubmissionAllowed;
}

- (void)setIsImproveHealthAndActivitySubmissionAllowed:(BOOL)a3
{
  self->_isImproveHealthAndActivitySubmissionAllowed = a3;
}

- (NSNumber)userAge
{
  return self->_userAge;
}

- (void)setUserAge:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)biologicalSex
{
  return self->_biologicalSex;
}

- (void)setBiologicalSex:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSNumber)weeksSinceOnboardedSleepSchedule
{
  return self->_weeksSinceOnboardedSleepSchedule;
}

- (void)setWeeksSinceOnboardedSleepSchedule:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSNumber)weeksSinceOnboardedSleepTracking
{
  return self->_weeksSinceOnboardedSleepTracking;
}

- (void)setWeeksSinceOnboardedSleepTracking:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSNumber)weeksSinceOnboardedWindDownActions
{
  return self->_weeksSinceOnboardedWindDownActions;
}

- (void)setWeeksSinceOnboardedWindDownActions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)activeWatchProductType
{
  return self->_activeWatchProductType;
}

- (void)setActiveWatchProductType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (double)sleepGoal
{
  return self->_sleepGoal;
}

- (void)setSleepGoal:(double)a3
{
  self->_sleepGoal = a3;
}

- (BOOL)watchSleepTrackingEnabled
{
  return self->_watchSleepTrackingEnabled;
}

- (void)setWatchSleepTrackingEnabled:(BOOL)a3
{
  self->_watchSleepTrackingEnabled = a3;
}

- (BOOL)timeInBedTrackingEnabled
{
  return self->_timeInBedTrackingEnabled;
}

- (void)setTimeInBedTrackingEnabled:(BOOL)a3
{
  self->_timeInBedTrackingEnabled = a3;
}

- (BOOL)bedTimeWindDownRemindersEnabled
{
  return self->_bedTimeWindDownRemindersEnabled;
}

- (void)setBedTimeWindDownRemindersEnabled:(BOOL)a3
{
  self->_bedTimeWindDownRemindersEnabled = a3;
}

- (BOOL)wakeUpResultsEnabled
{
  return self->_wakeUpResultsEnabled;
}

- (void)setWakeUpResultsEnabled:(BOOL)a3
{
  self->_wakeUpResultsEnabled = a3;
}

- (BOOL)scheduledSleepModeEnabled
{
  return self->_scheduledSleepModeEnabled;
}

- (void)setScheduledSleepModeEnabled:(BOOL)a3
{
  self->_scheduledSleepModeEnabled = a3;
}

- (BOOL)chargeRemindersEnabled
{
  return self->_chargeRemindersEnabled;
}

- (void)setChargeRemindersEnabled:(BOOL)a3
{
  self->_chargeRemindersEnabled = a3;
}

- (BOOL)scheduleDisabled
{
  return self->_scheduleDisabled;
}

- (void)setScheduleDisabled:(BOOL)a3
{
  self->_scheduleDisabled = a3;
}

- (BOOL)scheduleMigration
{
  return self->_scheduleMigration;
}

- (void)setScheduleMigration:(BOOL)a3
{
  self->_scheduleMigration = a3;
}

- (BOOL)scheduleChangePast24Hours
{
  return self->_scheduleChangePast24Hours;
}

- (void)setScheduleChangePast24Hours:(BOOL)a3
{
  self->_scheduleChangePast24Hours = a3;
}

- (BOOL)scheduleChangePast7days
{
  return self->_scheduleChangePast7days;
}

- (void)setScheduleChangePast7days:(BOOL)a3
{
  self->_scheduleChangePast7days = a3;
}

- (BOOL)interactedWithWindDownLast24Hrs
{
  return self->_interactedWithWindDownLast24Hrs;
}

- (void)setInteractedWithWindDownLast24Hrs:(BOOL)a3
{
  self->_interactedWithWindDownLast24Hrs = a3;
}

- (BOOL)useSleepScreen
{
  return self->_useSleepScreen;
}

- (void)setUseSleepScreen:(BOOL)a3
{
  self->_useSleepScreen = a3;
}

- (int64_t)maxSleepTrackingVersionOnboarded
{
  return self->_maxSleepTrackingVersionOnboarded;
}

- (void)setMaxSleepTrackingVersionOnboarded:(int64_t)a3
{
  self->_maxSleepTrackingVersionOnboarded = a3;
}

- (int64_t)maxSleepCoachingVersionOnboarded
{
  return self->_maxSleepCoachingVersionOnboarded;
}

- (void)setMaxSleepCoachingVersionOnboarded:(int64_t)a3
{
  self->_maxSleepCoachingVersionOnboarded = a3;
}

- (BOOL)hasSleepFocusConfigured
{
  return self->_hasSleepFocusConfigured;
}

- (void)setHasSleepFocusConfigured:(BOOL)a3
{
  self->_hasSleepFocusConfigured = a3;
}

- (BOOL)alarmFriday
{
  return self->_alarmFriday;
}

- (void)setAlarmFriday:(BOOL)a3
{
  self->_alarmFriday = a3;
}

- (BOOL)alarmMonday
{
  return self->_alarmMonday;
}

- (void)setAlarmMonday:(BOOL)a3
{
  self->_alarmMonday = a3;
}

- (BOOL)alarmSaturday
{
  return self->_alarmSaturday;
}

- (void)setAlarmSaturday:(BOOL)a3
{
  self->_alarmSaturday = a3;
}

- (BOOL)alarmSunday
{
  return self->_alarmSunday;
}

- (void)setAlarmSunday:(BOOL)a3
{
  self->_alarmSunday = a3;
}

- (BOOL)alarmThursday
{
  return self->_alarmThursday;
}

- (void)setAlarmThursday:(BOOL)a3
{
  self->_alarmThursday = a3;
}

- (BOOL)alarmTuesday
{
  return self->_alarmTuesday;
}

- (void)setAlarmTuesday:(BOOL)a3
{
  self->_alarmTuesday = a3;
}

- (BOOL)alarmWednesday
{
  return self->_alarmWednesday;
}

- (void)setAlarmWednesday:(BOOL)a3
{
  self->_alarmWednesday = a3;
}

- (BOOL)scheduleFriday
{
  return self->_scheduleFriday;
}

- (void)setScheduleFriday:(BOOL)a3
{
  self->_scheduleFriday = a3;
}

- (BOOL)scheduleMonday
{
  return self->_scheduleMonday;
}

- (void)setScheduleMonday:(BOOL)a3
{
  self->_scheduleMonday = a3;
}

- (BOOL)scheduleSaturday
{
  return self->_scheduleSaturday;
}

- (void)setScheduleSaturday:(BOOL)a3
{
  self->_scheduleSaturday = a3;
}

- (BOOL)scheduleSunday
{
  return self->_scheduleSunday;
}

- (void)setScheduleSunday:(BOOL)a3
{
  self->_scheduleSunday = a3;
}

- (BOOL)scheduleThursday
{
  return self->_scheduleThursday;
}

- (void)setScheduleThursday:(BOOL)a3
{
  self->_scheduleThursday = a3;
}

- (BOOL)scheduleTuesday
{
  return self->_scheduleTuesday;
}

- (void)setScheduleTuesday:(BOOL)a3
{
  self->_scheduleTuesday = a3;
}

- (BOOL)scheduleWednesday
{
  return self->_scheduleWednesday;
}

- (void)setScheduleWednesday:(BOOL)a3
{
  self->_scheduleWednesday = a3;
}

- (NSString)hapticToneIdentifierFriday
{
  return self->_hapticToneIdentifierFriday;
}

- (void)setHapticToneIdentifierFriday:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)hapticToneIdentifierMonday
{
  return self->_hapticToneIdentifierMonday;
}

- (void)setHapticToneIdentifierMonday:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSString)hapticToneIdentifierSaturday
{
  return self->_hapticToneIdentifierSaturday;
}

- (void)setHapticToneIdentifierSaturday:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSString)hapticToneIdentifierSunday
{
  return self->_hapticToneIdentifierSunday;
}

- (void)setHapticToneIdentifierSunday:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSString)hapticToneIdentifierThursday
{
  return self->_hapticToneIdentifierThursday;
}

- (void)setHapticToneIdentifierThursday:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSString)hapticToneIdentifierTuesday
{
  return self->_hapticToneIdentifierTuesday;
}

- (void)setHapticToneIdentifierTuesday:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSString)hapticToneIdentifierWednesday
{
  return self->_hapticToneIdentifierWednesday;
}

- (void)setHapticToneIdentifierWednesday:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (BOOL)isDefaultScheduleFriday
{
  return self->_isDefaultScheduleFriday;
}

- (void)setIsDefaultScheduleFriday:(BOOL)a3
{
  self->_isDefaultScheduleFriday = a3;
}

- (BOOL)isDefaultScheduleMonday
{
  return self->_isDefaultScheduleMonday;
}

- (void)setIsDefaultScheduleMonday:(BOOL)a3
{
  self->_isDefaultScheduleMonday = a3;
}

- (BOOL)isDefaultScheduleSaturday
{
  return self->_isDefaultScheduleSaturday;
}

- (void)setIsDefaultScheduleSaturday:(BOOL)a3
{
  self->_isDefaultScheduleSaturday = a3;
}

- (BOOL)isDefaultScheduleSunday
{
  return self->_isDefaultScheduleSunday;
}

- (void)setIsDefaultScheduleSunday:(BOOL)a3
{
  self->_isDefaultScheduleSunday = a3;
}

- (BOOL)isDefaultScheduleThursday
{
  return self->_isDefaultScheduleThursday;
}

- (void)setIsDefaultScheduleThursday:(BOOL)a3
{
  self->_isDefaultScheduleThursday = a3;
}

- (BOOL)isDefaultScheduleTuesday
{
  return self->_isDefaultScheduleTuesday;
}

- (void)setIsDefaultScheduleTuesday:(BOOL)a3
{
  self->_isDefaultScheduleTuesday = a3;
}

- (BOOL)isDefaultScheduleWednesday
{
  return self->_isDefaultScheduleWednesday;
}

- (void)setIsDefaultScheduleWednesday:(BOOL)a3
{
  self->_isDefaultScheduleWednesday = a3;
}

- (NSNumber)stddevActualTimeAsleep
{
  return self->_stddevActualTimeAsleep;
}

- (void)setStddevActualTimeAsleep:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (NSNumber)stddevScheduledTimeAsleep
{
  return self->_stddevScheduledTimeAsleep;
}

- (void)setStddevScheduledTimeAsleep:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (NSNumber)stddevActualVsScheduledTimeAsleep
{
  return self->_stddevActualVsScheduledTimeAsleep;
}

- (void)setStddevActualVsScheduledTimeAsleep:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (int64_t)daysWornWatchToSleepInLast7Days
{
  return self->_daysWornWatchToSleepInLast7Days;
}

- (void)setDaysWornWatchToSleepInLast7Days:(int64_t)a3
{
  self->_daysWornWatchToSleepInLast7Days = a3;
}

- (int64_t)daysWornWatchToSleepInLast30Days
{
  return self->_daysWornWatchToSleepInLast30Days;
}

- (void)setDaysWornWatchToSleepInLast30Days:(int64_t)a3
{
  self->_daysWornWatchToSleepInLast30Days = a3;
}

- (int64_t)weekendDaysWornWatchToSleepInLast7Days
{
  return self->_weekendDaysWornWatchToSleepInLast7Days;
}

- (void)setWeekendDaysWornWatchToSleepInLast7Days:(int64_t)a3
{
  self->_weekendDaysWornWatchToSleepInLast7Days = a3;
}

- (BOOL)didWearWatchToSleepLastNight
{
  return self->_didWearWatchToSleepLastNight;
}

- (void)setDidWearWatchToSleepLastNight:(BOOL)a3
{
  self->_didWearWatchToSleepLastNight = a3;
}

- (double)sleepDurationLastNight
{
  return self->_sleepDurationLastNight;
}

- (void)setSleepDurationLastNight:(double)a3
{
  self->_sleepDurationLastNight = a3;
}

- (double)sleepStagePercentAwakeLastNight
{
  return self->_sleepStagePercentAwakeLastNight;
}

- (void)setSleepStagePercentAwakeLastNight:(double)a3
{
  self->_sleepStagePercentAwakeLastNight = a3;
}

- (double)sleepStagePercentRemLastNight
{
  return self->_sleepStagePercentRemLastNight;
}

- (void)setSleepStagePercentRemLastNight:(double)a3
{
  self->_sleepStagePercentRemLastNight = a3;
}

- (double)sleepStagePercentCoreLastNight
{
  return self->_sleepStagePercentCoreLastNight;
}

- (void)setSleepStagePercentCoreLastNight:(double)a3
{
  self->_sleepStagePercentCoreLastNight = a3;
}

- (double)sleepStagePercentDeepLastNight
{
  return self->_sleepStagePercentDeepLastNight;
}

- (void)setSleepStagePercentDeepLastNight:(double)a3
{
  self->_sleepStagePercentDeepLastNight = a3;
}

- (NSNumber)isOnboardedBD
{
  return self->_isOnboardedBD;
}

- (void)setIsOnboardedBD:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (NSNumber)meanTimeBetweenBDSessionsPastNight
{
  return self->_meanTimeBetweenBDSessionsPastNight;
}

- (void)setMeanTimeBetweenBDSessionsPastNight:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (NSNumber)maxTimeBetweenBDSessionsPastNight
{
  return self->_maxTimeBetweenBDSessionsPastNight;
}

- (void)setMaxTimeBetweenBDSessionsPastNight:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (NSNumber)minTimeBetweenBDSessionsPastNight
{
  return self->_minTimeBetweenBDSessionsPastNight;
}

- (void)setMinTimeBetweenBDSessionsPastNight:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 288);
}

- (NSNumber)numBDValuesInPastNight
{
  return self->_numBDValuesInPastNight;
}

- (void)setNumBDValuesInPastNight:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 296);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_numBDValuesInPastNight, 0);
  objc_storeStrong((id *)&self->_minTimeBetweenBDSessionsPastNight, 0);
  objc_storeStrong((id *)&self->_maxTimeBetweenBDSessionsPastNight, 0);
  objc_storeStrong((id *)&self->_meanTimeBetweenBDSessionsPastNight, 0);
  objc_storeStrong((id *)&self->_isOnboardedBD, 0);
  objc_storeStrong((id *)&self->_stddevActualVsScheduledTimeAsleep, 0);
  objc_storeStrong((id *)&self->_stddevScheduledTimeAsleep, 0);
  objc_storeStrong((id *)&self->_stddevActualTimeAsleep, 0);
  objc_storeStrong((id *)&self->_hapticToneIdentifierWednesday, 0);
  objc_storeStrong((id *)&self->_hapticToneIdentifierTuesday, 0);
  objc_storeStrong((id *)&self->_hapticToneIdentifierThursday, 0);
  objc_storeStrong((id *)&self->_hapticToneIdentifierSunday, 0);
  objc_storeStrong((id *)&self->_hapticToneIdentifierSaturday, 0);
  objc_storeStrong((id *)&self->_hapticToneIdentifierMonday, 0);
  objc_storeStrong((id *)&self->_hapticToneIdentifierFriday, 0);
  objc_storeStrong((id *)&self->_activeWatchProductType, 0);
  objc_storeStrong((id *)&self->_weeksSinceOnboardedWindDownActions, 0);
  objc_storeStrong((id *)&self->_weeksSinceOnboardedSleepTracking, 0);
  objc_storeStrong((id *)&self->_weeksSinceOnboardedSleepSchedule, 0);
  objc_storeStrong((id *)&self->_biologicalSex, 0);
  objc_storeStrong((id *)&self->_userAge, 0);
}

@end
