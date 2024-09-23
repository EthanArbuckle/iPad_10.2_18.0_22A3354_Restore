@implementation OSISleepScheduleMonitor

- (OSISleepScheduleMonitor)init
{
  OSISleepScheduleMonitor *v2;
  HKSPSleepStore *v3;
  HKSPSleepStore *sleepStore;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)OSISleepScheduleMonitor;
  v2 = -[OSISleepScheduleMonitor init](&v6, "init");
  if (v2)
  {
    v3 = (HKSPSleepStore *)objc_msgSend(objc_alloc((Class)HKSPSleepStore), "initWithIdentifier:", CFSTR("com.apple.osintelligence.spn"));
    sleepStore = v2->_sleepStore;
    v2->_sleepStore = v3;

  }
  return v2;
}

- (BOOL)date:(id)a3 inSleepWindowWithSecondsBeforeStart:(double)a4 secondsBeforeEnd:(double)a5
{
  return -[OSISleepScheduleMonitor date:inSleepWindowWithSecondsBeforeStart:secondsBeforeEnd:withSleepStore:](self, "date:inSleepWindowWithSecondsBeforeStart:secondsBeforeEnd:withSleepStore:", a3, self->_sleepStore, a4, a5);
}

- (BOOL)date:(id)a3 inSleepWindowWithSecondsBeforeStart:(double)a4 secondsBeforeEnd:(double)a5 withSleepStore:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  NSObject *v25;
  void *v26;
  const char *v27;
  BOOL v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  const char *v33;
  void *v34;
  unsigned __int8 v35;
  _BOOL4 v36;
  NSObject *v37;
  uint32_t v38;
  void *v40;
  void *v41;
  uint8_t buf[4];
  id v43;

  v10 = a3;
  v11 = a6;
  v12 = (void *)os_transaction_create("com.apple.osintelligence.sleep");
  v13 = objc_autoreleasePoolPush();
  v14 = os_log_create("com.apple.osintelligence", "inactivity.sleepschedule");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    sub_10003E2D4((uint64_t)v10, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "currentSleepScheduleWithError:", 0));
  v16 = v15;
  if (v15)
  {
    if ((objc_msgSend(v15, "isEnabled") & 1) != 0)
    {
      v17 = objc_msgSend(v11, "currentSleepScheduleStateWithError:", 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "nextEventDueAfterDate:error:", v10, 0));
      v19 = v18;
      if (v17 == (id)3)
        goto LABEL_22;
      if (v17 == (id)2)
      {
        if (!v18)
        {
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            sub_10003E294(v14);
          goto LABEL_39;
        }
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "identifier"));
        if ((objc_msgSend(v20, "isEqual:", HKSPSleepEventIdentifierWakeUp) & 1) != 0)
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "dueDate"));
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "dateByAddingTimeInterval:", -a5));
          objc_msgSend(v22, "timeIntervalSinceDate:", v10);
          v24 = v23;

          if (v24 < 0.0)
          {
            v25 = v14;
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "dueDate"));
              *(_DWORD *)buf = 138412290;
              v43 = v26;
              _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, " Wake upcoming at %@. Do not engage", buf, 0xCu);

            }
LABEL_34:
            v28 = 0;
LABEL_40:

            goto LABEL_41;
          }
        }
        else
        {

        }
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v33 = " In schedule and far from wakeup -> in sleep window";
          goto LABEL_37;
        }
        goto LABEL_39;
      }
      if (v18)
      {
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "identifier"));
        if ((objc_msgSend(v29, "isEqual:", HKSPSleepEventIdentifierBedtime) & 1) != 0)
        {
          v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "dueDate"));
          v41 = v19;
          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "dateByAddingTimeInterval:", -a4));
          objc_msgSend(v30, "timeIntervalSinceDate:", v10);
          v32 = v31;

          v19 = v41;
          if (v32 < 0.0)
          {
LABEL_22:
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              v33 = " Sleep upcoming or already in wind-down -> in sleep window";
LABEL_37:
              v37 = v14;
              v38 = 2;
LABEL_38:
              _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, v33, buf, v38);
            }
LABEL_39:
            v28 = 1;
            goto LABEL_40;
          }
        }
        else
        {

        }
      }
      if (v17)
      {
        v34 = v19;
        v35 = -[OSISleepScheduleMonitor date:coveredByAnyWeekdayWithOccurrences:](self, "date:coveredByAnyWeekdayWithOccurrences:", v10, objc_msgSend(v16, "weekdaysWithOccurrences"));
        v36 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
        if ((v35 & 1) != 0)
        {
          v19 = v34;
          if (v36)
          {
            *(_DWORD *)buf = 138412290;
            v43 = v10;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%@ NOT in sleep window", buf, 0xCu);
          }
          goto LABEL_34;
        }
        v19 = v34;
        if (v36)
        {
          *(_DWORD *)buf = 138412290;
          v43 = v10;
          v33 = " Date %@ not covered by any occurrences -> in sleep window";
          v37 = v14;
          v38 = 12;
          goto LABEL_38;
        }
      }
      else if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v33 = " Sleep schedule is set but disabled -> always in sleep window";
        goto LABEL_37;
      }
      goto LABEL_39;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v27 = "Sleep schedule exists but disabled -> always in sleep window";
      goto LABEL_17;
    }
  }
  else if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    v27 = "No sleep schedule found -> always in sleep window";
LABEL_17:
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, v27, buf, 2u);
  }
  v28 = 1;
LABEL_41:

  objc_autoreleasePoolPop(v13);
  return v28;
}

- (BOOL)date:(id)a3 coveredByAnyWeekdayWithOccurrences:(unint64_t)a4
{
  id v5;
  double v6;
  int v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;

  v5 = a3;
  +[OSIntelligenceUtilities hourFromDate:](OSIntelligenceUtilities, "hourFromDate:", v5);
  v7 = (int)v6;
  v8 = +[OSIntelligenceUtilities pandasWeekdayOf:](OSIntelligenceUtilities, "pandasWeekdayOf:", v5);

  if (v7 >= 21)
    v9 = 0;
  else
    v9 = 1 << v8;
  v10 = v9 | (1 << ((int)(v8 + 1) % 7));
  if (v7 < 5)
    v10 = 1 << v8;
  return (v10 & a4) != 0;
}

- (HKSPSleepStore)sleepStore
{
  return self->_sleepStore;
}

- (void)setSleepStore:(id)a3
{
  objc_storeStrong((id *)&self->_sleepStore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sleepStore, 0);
}

@end
