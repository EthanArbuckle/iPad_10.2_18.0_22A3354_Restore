@implementation NCSnoozeAlarmNotificationStaticContentProvider

- (NCSnoozeAlarmNotificationStaticContentProvider)initWithNotificationRequest:(id)a3 viewController:(id)a4
{
  id v6;
  id v7;
  NCSnoozeAlarmNotificationStaticContentProvider *v8;
  NCSnoozeAlarmNotificationStaticContentProvider *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  uint64_t v18;
  NSTimer *tickTimer;
  void *v20;
  void *v21;
  objc_super v23;

  v6 = a3;
  v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)NCSnoozeAlarmNotificationStaticContentProvider;
  v8 = -[NCNotificationRequestContentProvider initWithNotificationRequest:](&v23, sel_initWithNotificationRequest_, v6);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_viewController, a4);
    -[NCNotificationViewController addObserver:](v9->_viewController, "addObserver:", v9);
    -[NCNotificationRequestContentProvider setDelegate:](v9, "setDelegate:", v7);
    objc_msgSend(v6, "context");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *MEMORY[0x1E0D4F998];
    objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E0D4F998]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      objc_msgSend(v6, "userNotification");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "request");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "content");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "userInfo");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKey:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v12, "timeIntervalSinceNow");
    v9->_fireTime = v17 + CFAbsoluteTimeGetCurrent();
    objc_msgSend(MEMORY[0x1E0C99E88], "timerWithTimeInterval:target:selector:userInfo:repeats:", v9, sel__tickTimerFired_, 0, 1, 1.0);
    v18 = objc_claimAutoreleasedReturnValue();
    tickTimer = v9->_tickTimer;
    v9->_tickTimer = (NSTimer *)v18;

    objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addTimer:forMode:", v9->_tickTimer, *MEMORY[0x1E0C99860]);

    -[NCSnoozeAlarmNotificationStaticContentProvider _secondaryTextForTime:](v9, "_secondaryTextForTime:", CFAbsoluteTimeGetCurrent());
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCSnoozeAlarmNotificationStaticContentProvider setSecondaryText:](v9, "setSecondaryText:", v21);

  }
  return v9;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  -[NCNotificationViewController view](self->_viewController, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "windowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_alwaysOnEnvironment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:", self);

  -[NCNotificationViewController removeObserver:](self->_viewController, "removeObserver:", self);
  -[NCSnoozeAlarmNotificationStaticContentProvider invalidateTimer](self, "invalidateTimer");
  v7.receiver = self;
  v7.super_class = (Class)NCSnoozeAlarmNotificationStaticContentProvider;
  -[NCSnoozeAlarmNotificationStaticContentProvider dealloc](&v7, sel_dealloc);
}

- (void)invalidateTimer
{
  -[NSTimer invalidate](self->_tickTimer, "invalidate");
}

- (id)title
{
  void *v2;
  void *v3;

  NCUserNotificationsUIKitFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("ALARM_TITLE"), &stru_1E8D21F60, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)date
{
  return 0;
}

- (double)_remainingDurationForTime:(double)a3
{
  return fmax(self->_fireTime - a3, 0.0);
}

- (BOOL)_hasOneMinuteOrLessRemainingForTime:(double)a3
{
  double v3;

  -[NCSnoozeAlarmNotificationStaticContentProvider _remainingDurationForTime:](self, "_remainingDurationForTime:", a3);
  return v3 <= 60.0;
}

- (id)_formatDuration:(double)a3 includeSeconds:(BOOL)a4
{
  void *v5;
  void *v6;

  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0D01738], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "formatAlarmSnoozeDuration:", a3);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    NCFormatTimeIntervalForMinutesOnly((uint64_t)v5, a3);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_updateContentForTime:(double)a3
{
  void *v4;
  id v5;

  -[NCSnoozeAlarmNotificationStaticContentProvider _secondaryTextForTime:](self, "_secondaryTextForTime:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCSnoozeAlarmNotificationStaticContentProvider setSecondaryText:](self, "setSecondaryText:", v4);

  -[NCSnoozeAlarmNotificationStaticContentProvider viewController](self, "viewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHasUpdatedContent");
  objc_msgSend(v5, "updateContent");

}

- (id)_secondaryTextForTime:(double)a3
{
  double v5;
  double v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _BOOL8 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  -[NCSnoozeAlarmNotificationStaticContentProvider _remainingDurationForTime:](self, "_remainingDurationForTime:");
  v6 = v5;
  -[NCSnoozeAlarmNotificationStaticContentProvider viewController](self, "viewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "_backlightLuminance");

  v10 = v9 != 1
     || -[NCSnoozeAlarmNotificationStaticContentProvider _hasOneMinuteOrLessRemainingForTime:](self, "_hasOneMinuteOrLessRemainingForTime:", a3);
  -[NCSnoozeAlarmNotificationStaticContentProvider _formatDuration:includeSeconds:](self, "_formatDuration:includeSeconds:", v10, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0CB3940];
  NCUserNotificationsUIKitFrameworkBundle();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("ALARM_SNOOZE_TIME_REMAINING"), &stru_1E8D21F60, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", v14, v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v15);
  return v16;
}

- (void)_tickTimerFired:(id)a3
{
  double Current;
  double v5;

  Current = CFAbsoluteTimeGetCurrent();
  -[NCSnoozeAlarmNotificationStaticContentProvider _updateContentForTime:](self, "_updateContentForTime:");
  -[NCSnoozeAlarmNotificationStaticContentProvider _remainingDurationForTime:](self, "_remainingDurationForTime:", Current);
  if (v5 < 0.0)
    -[NCSnoozeAlarmNotificationStaticContentProvider invalidateTimer](self, "invalidateTimer");
}

- (id)_timelinesForDateInterval:(id)a3
{
  id v4;
  void *v5;
  double fireTime;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;
  NSObject *v12;
  void *v13;
  void **v14;
  double v15;
  double v16;
  unint64_t v17;
  unint64_t v18;
  void *v19;
  void *v20;
  double v21;
  uint64_t v22;
  os_log_t *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  os_log_t v29;
  void *v30;
  void *v32;
  double v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint8_t buf[4];
  NCSnoozeAlarmNotificationStaticContentProvider *v49;
  __int16 v50;
  uint64_t v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  double v55;
  __int16 v56;
  double v57;
  __int16 v58;
  double v59;
  __int16 v60;
  double v61;
  __int16 v62;
  double v63;
  __int16 v64;
  void *v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  fireTime = self->_fireTime;
  objc_msgSend(v5, "timeIntervalSinceReferenceDate");
  v8 = fireTime - v7;
  objc_msgSend(v4, "duration");
  v10 = v9;
  v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v8 >= 0.0)
  {
    v15 = v8 + -60.0;
    if (v8 + -60.0 >= v10)
      v16 = v10;
    else
      v16 = v8 + -60.0;
    if (v15 > 0.0)
    {
      v17 = (unint64_t)(v16 / 60.0);
      if (v17)
      {
        v18 = 0;
        do
        {
          objc_msgSend(v5, "dateByAddingTimeInterval:", (double)((uint64_t)v8 % 60) + 1.0 + (double)v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0D00F40], "entryForPresentationTime:withRequestedFidelity:", v19, 1);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v20);

          v18 += 60;
          --v17;
        }
        while (v17);
      }
    }
    if (v8 >= v10)
      v21 = v10;
    else
      v21 = v8;
    v22 = (uint64_t)(v21 - v15);
    v23 = (os_log_t *)MEMORY[0x1E0DC5F70];
    if (v15 < v10)
    {
      if ((unint64_t)v22 >= 0x3D)
      {
        v24 = (void *)*MEMORY[0x1E0DC5F70];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_FAULT))
        {
          v39 = (void *)MEMORY[0x1E0C99D68];
          v40 = self->_fireTime;
          v41 = v24;
          objc_msgSend(v39, "dateWithTimeIntervalSinceReferenceDate:", v40);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "bls_shortLoggingString");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "bls_shortLoggingString");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "bls_boundedDescriptionWithMax:transformer:", 15, &__block_literal_global_10);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134220034;
          v49 = self;
          v50 = 2048;
          v51 = (uint64_t)(v21 - v15);
          v52 = 2114;
          v53 = v42;
          v54 = 2114;
          v55 = *(double *)&v43;
          v56 = 2048;
          v57 = v8;
          v58 = 2048;
          v59 = v8 + -60.0;
          v60 = 2048;
          v61 = v8 + -60.0;
          v62 = 2048;
          v63 = v21;
          v64 = 2114;
          v65 = v44;
          _os_log_fault_impl(&dword_1CFC3D000, v41, OS_LOG_TYPE_FAULT, "%p Alarm snooze timelines — bad endIncrement:%ld — fireTime:%{public}@ interval:%{public}@ untiFireTime:%lf untilSeconds:%lf endMinutes:%lf endSeconds:%lf entries:%{public}@", buf, 0x5Cu);

        }
        v25 = 60;
        if (v22 < 60)
          v25 = (uint64_t)(v21 - v15);
        v22 = v25 & ~(v25 >> 63);
      }
      v26 = 0;
      do
      {
        objc_msgSend(v5, "dateByAddingTimeInterval:", v15 + (double)v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D00F40], "entryForPresentationTime:withRequestedFidelity:", v27, 2);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObject:", v28);

        ++v26;
      }
      while (v22 + 1 != v26);
      v23 = (os_log_t *)MEMORY[0x1E0DC5F70];
    }
    v29 = *v23;
    if (os_log_type_enabled(*v23, OS_LOG_TYPE_DEBUG))
    {
      v32 = (void *)MEMORY[0x1E0C99D68];
      v33 = self->_fireTime;
      v34 = v29;
      objc_msgSend(v32, "dateWithTimeIntervalSinceReferenceDate:", v33);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "bls_shortLoggingString");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "bls_shortLoggingString");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "bls_boundedDescriptionWithMax:transformer:", 15, &__block_literal_global_21_0);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134220034;
      v49 = self;
      v50 = 2114;
      v51 = (uint64_t)v36;
      v52 = 2114;
      v53 = v37;
      v54 = 2048;
      v55 = v8;
      v56 = 2048;
      v57 = v8 + -60.0;
      v58 = 2048;
      v59 = v16;
      v60 = 2048;
      v61 = v21;
      v62 = 2048;
      v63 = *(double *)&v22;
      v64 = 2114;
      v65 = v38;
      _os_log_debug_impl(&dword_1CFC3D000, v34, OS_LOG_TYPE_DEBUG, "%p Alarm snooze timelines — fireTime:%{public}@ interval:%{public}@ untiFireTime:%lf untilSeconds:%lf endMinutes:%lf endSeconds:%lf endIncrement:%ld entries:%{public}@", buf, 0x5Cu);

    }
    objc_msgSend(MEMORY[0x1E0D00F38], "timelineWithEntries:identifier:configure:", v11, CFSTR("NCSnoozeAlarmNotificationStaticContentProvider"), &__block_literal_global_27);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v13;
    v14 = &v47;
  }
  else
  {
    v12 = *MEMORY[0x1E0DC5F70];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEBUG))
      -[NCSnoozeAlarmNotificationStaticContentProvider _timelinesForDateInterval:].cold.1((uint64_t)self, v12);
    objc_msgSend(MEMORY[0x1E0D00F38], "emptyTimelineWithIdentifier:", CFSTR("NCSnoozeAlarmNotificationStaticContentProvider"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v13;
    v14 = &v46;
  }
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  return v30;
}

id __76__NCSnoozeAlarmNotificationStaticContentProvider__timelinesForDateInterval___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "presentationTime");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bls_shortLoggingString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __76__NCSnoozeAlarmNotificationStaticContentProvider__timelinesForDateInterval___block_invoke_20(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = a2;
  objc_msgSend(v3, "presentationTime");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bls_shortLoggingString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "requestedFidelity");

  NSStringFromBLSUpdateFidelity();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@ - %@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_timelinesForDateInterval:(id)a3 completion:(id)a4
{
  id v7;
  id v8;

  v7 = a4;
  -[NCSnoozeAlarmNotificationStaticContentProvider _timelinesForDateInterval:](self, "_timelinesForDateInterval:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v7, v8);

}

- (void)_updateWithFrameSpecifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "entrySpecifierForTimelineIdentifier:", CFSTR("NCSnoozeAlarmNotificationStaticContentProvider"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timelineEntry");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "presentationTime");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      v9 = (void *)*MEMORY[0x1E0DC5F70];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_ERROR))
        -[NCSnoozeAlarmNotificationStaticContentProvider _updateWithFrameSpecifier:].cold.1((uint64_t)self, v9, v5);
      objc_msgSend(v5, "presentationInterval");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "startDate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v8, "timeIntervalSinceReferenceDate");
    -[NCSnoozeAlarmNotificationStaticContentProvider _updateContentForTime:](self, "_updateContentForTime:");

  }
  else
  {
    -[NCSnoozeAlarmNotificationStaticContentProvider _updateContentForTime:](self, "_updateContentForTime:", CFAbsoluteTimeGetCurrent());
  }

}

- (void)_updateWithFrameSpecifier:(id)a3 completion:(id)a4
{
  void (**v6)(void);

  v6 = (void (**)(void))a4;
  -[NCSnoozeAlarmNotificationStaticContentProvider _updateWithFrameSpecifier:](self, "_updateWithFrameSpecifier:", a3);
  v6[2]();

}

- (void)_beginObservingAlwaysOnEnvironment
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134217984;
  v3 = a1;
  _os_log_error_impl(&dword_1CFC3D000, a2, OS_LOG_TYPE_ERROR, "Alarm snooze provider %p couldn't find alwaysOnEnvironment to observe", (uint8_t *)&v2, 0xCu);
}

- (void)notificationViewControllerWillDismiss:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[NCNotificationViewController view](self->_viewController, "view", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "windowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_alwaysOnEnvironment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:", self);

}

- (NSAttributedString)secondaryText
{
  return self->secondaryText;
}

- (void)setSecondaryText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NCNotificationViewController)viewController
{
  return self->_viewController;
}

- (void)setViewController:(id)a3
{
  objc_storeStrong((id *)&self->_viewController, a3);
}

- (double)fireTime
{
  return self->_fireTime;
}

- (void)setFireTime:(double)a3
{
  self->_fireTime = a3;
}

- (NSTimer)tickTimer
{
  return self->_tickTimer;
}

- (void)setTickTimer:(id)a3
{
  objc_storeStrong((id *)&self->_tickTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tickTimer, 0);
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_storeStrong((id *)&self->secondaryText, 0);
}

- (void)_timelinesForDateInterval:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134217984;
  v3 = a1;
  _os_log_debug_impl(&dword_1CFC3D000, a2, OS_LOG_TYPE_DEBUG, "%p Alarm snooze not running - returning empty timeline", (uint8_t *)&v2, 0xCu);
}

- (void)_updateWithFrameSpecifier:(void *)a3 .cold.1(uint64_t a1, void *a2, void *a3)
{
  NSObject *v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  const __CFString *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(a3, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 134218498;
  v8 = a1;
  v9 = 2114;
  v10 = CFSTR("NCSnoozeAlarmNotificationStaticContentProvider");
  v11 = 2114;
  v12 = v6;
  _os_log_error_impl(&dword_1CFC3D000, v5, OS_LOG_TYPE_ERROR, "%p Could not find id:%{public}@ in frameSpecifier:%{public}@", (uint8_t *)&v7, 0x20u);

}

@end
