@implementation RTMotionActivityManager

+ (RTMotionActivityManager)allocWithZone:(_NSZone *)a3
{
  objc_super v6;

  if ((id)objc_opt_class() == a1)
    return (RTMotionActivityManager *)+[RTMotionActivityManager allocWithZone:](RTMotionActivityManager_CoreMotion, "allocWithZone:", a3);
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___RTMotionActivityManager;
  return (RTMotionActivityManager *)objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
}

- (RTMotionActivityManager)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithPlatform_vehicleStore_);
}

- (RTMotionActivityManager)initWithPlatform:(id)a3 vehicleStore:(id)a4
{
  id v7;
  id v8;
  RTMotionActivityManager *v9;
  RTMotionActivityManager *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)RTMotionActivityManager;
  v9 = -[RTNotifier init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_platform, a3);
    objc_storeStrong((id *)&v10->_vehicleStore, a4);
  }

  return v10;
}

+ (id)motionActivityVehicleConnectedStateToString:(unint64_t)a3
{
  if (a3 > 2)
    return CFSTR("Invalid");
  else
    return off_1E929ED80[a3];
}

+ (id)motionSettledStateToString:(unint64_t)a3
{
  if (a3 > 2)
    return CFSTR("Invalid");
  else
    return off_1E929ED98[a3];
}

+ (id)activityAlarmTriggerToString:(int64_t)a3
{
  if ((unint64_t)(a3 + 1) > 0xB)
    return CFSTR("Invalid");
  else
    return off_1E929EDB0[a3 + 1];
}

- (void)internalAddObserver:(id)a3 name:(id)a4
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a4;
  if ((objc_msgSend((id)objc_opt_class(), "supportsNotificationName:", v4) & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityMotionActivity);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 138412290;
      v7 = v4;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "unsupported notification, %@", (uint8_t *)&v6, 0xCu);
    }

  }
}

- (void)internalRemoveObserver:(id)a3 name:(id)a4
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a4;
  if ((objc_msgSend((id)objc_opt_class(), "supportsNotificationName:", v4) & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityMotionActivity);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 138412290;
      v7 = v4;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "unsupported notification, %@", (uint8_t *)&v6, 0xCu);
    }

  }
}

+ (BOOL)supportsNotificationName:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  +[RTNotification notificationName](RTMotionActivityManagerNotificationActivity, "notificationName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", v4) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    +[RTNotification notificationName](RTMotionActivityManagerNotificationDominantMotionActivityChange, "notificationName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "isEqualToString:", v6) & 1) != 0)
    {
      v5 = 1;
    }
    else
    {
      +[RTNotification notificationName](RTMotionActivityManagerNotificationMotionSettledStateChange, "notificationName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v3, "isEqualToString:", v7) & 1) != 0)
      {
        v5 = 1;
      }
      else
      {
        +[RTNotification notificationName](RTMotionActivityManagerNotificationVehicleExit, "notificationName");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v3, "isEqualToString:", v8) & 1) != 0)
        {
          v5 = 1;
        }
        else
        {
          +[RTNotification notificationName](RTMotionActivityManagerNotificationVehicleConnected, "notificationName");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v3, "isEqualToString:", v9) & 1) != 0)
          {
            v5 = 1;
          }
          else
          {
            +[RTNotification notificationName](RTMotionActivityManagerNotificationActivityAlarm, "notificationName");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v5 = objc_msgSend(v3, "isEqualToString:", v10);

          }
        }

      }
    }

  }
  return v5;
}

- (void)fetchMotionActivitiesFromStartDate:(id)a3 endDate:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    -[RTNotifier queue](self, "queue");
    v11 = objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __78__RTMotionActivityManager_fetchMotionActivitiesFromStartDate_endDate_handler___block_invoke;
    v12[3] = &unk_1E9297EB8;
    v12[4] = self;
    v13 = v8;
    v14 = v9;
    v15 = v10;
    dispatch_async(v11, v12);

  }
}

uint64_t __78__RTMotionActivityManager_fetchMotionActivitiesFromStartDate_endDate_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchMotionActivitiesFromStartDate:endDate:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)_fetchMotionActivitiesFromStartDate:(id)a3 endDate:(id)a4 handler:(id)a5
{
  void *v5;
  void (**v6)(id, _QWORD, void *);
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  if (a5)
  {
    v9 = *MEMORY[0x1E0CB2D50];
    v10[0] = CFSTR("Not supported on this platform.");
    v5 = (void *)MEMORY[0x1E0C99D80];
    v6 = (void (**)(id, _QWORD, void *))a5;
    objc_msgSend(v5, "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 1, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, 0, v8);

  }
}

- (void)fetchPredominantMotionActivityTypeFromStartDate:(id)a3 toEndDate:(id)a4 withHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    -[RTNotifier queue](self, "queue");
    v11 = objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __97__RTMotionActivityManager_fetchPredominantMotionActivityTypeFromStartDate_toEndDate_withHandler___block_invoke;
    v12[3] = &unk_1E9297EB8;
    v12[4] = self;
    v13 = v8;
    v14 = v9;
    v15 = v10;
    dispatch_async(v11, v12);

  }
}

uint64_t __97__RTMotionActivityManager_fetchPredominantMotionActivityTypeFromStartDate_toEndDate_withHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchPredominantMotionActivityTypeFromStartDate:toEndDate:withHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)_fetchPredominantMotionActivityTypeFromStartDate:(id)a3 toEndDate:(id)a4 withHandler:(id)a5
{
  void *v5;
  void (**v6)(id, _QWORD, void *);
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v9 = *MEMORY[0x1E0CB2D50];
  v10[0] = CFSTR("Not supported on this platform.");
  v5 = (void *)MEMORY[0x1E0C99D80];
  v6 = (void (**)(id, _QWORD, void *))a5;
  objc_msgSend(v5, "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 1, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, 0, v8);

}

- (void)fetchPredominantMotionActivityWithHandler:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if (v4)
  {
    -[RTNotifier queue](self, "queue");
    v5 = objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __69__RTMotionActivityManager_fetchPredominantMotionActivityWithHandler___block_invoke;
    v6[3] = &unk_1E9297650;
    v6[4] = self;
    v7 = v4;
    dispatch_async(v5, v6);

  }
}

uint64_t __69__RTMotionActivityManager_fetchPredominantMotionActivityWithHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchPredominantMotionActivityWithHandler:", *(_QWORD *)(a1 + 40));
}

- (void)_fetchPredominantMotionActivityWithHandler:(id)a3
{
  void *v3;
  void (**v4)(id, _QWORD, void *);
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7 = *MEMORY[0x1E0CB2D50];
  v8[0] = CFSTR("Not supported on this platform.");
  v3 = (void *)MEMORY[0x1E0C99D80];
  v4 = (void (**)(id, _QWORD, void *))a3;
  objc_msgSend(v3, "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 1, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, 0, v6);

}

- (void)subscribeForPedometerDataWithStartDate:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[RTNotifier queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__RTMotionActivityManager_subscribeForPedometerDataWithStartDate_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __74__RTMotionActivityManager_subscribeForPedometerDataWithStartDate_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_subscribeForPedometerDataWithStartDate:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_subscribeForPedometerDataWithStartDate:(id)a3 handler:(id)a4
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v8 = *MEMORY[0x1E0CB2D50];
  v9[0] = CFSTR("Not supported on this platform.");
  v4 = (void *)MEMORY[0x1E0C99D80];
  v5 = a4;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 1, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, _QWORD, void *))v5 + 2))(v5, 0, 0, v7);

}

- (void)unsubscribeForPedometerData:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[RTNotifier queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__RTMotionActivityManager_unsubscribeForPedometerData___block_invoke;
  v7[3] = &unk_1E9297540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __55__RTMotionActivityManager_unsubscribeForPedometerData___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_unsubscribeForPedometerData:", *(_QWORD *)(a1 + 40));
}

- (void)_unsubscribeForPedometerData:(id)a3
{
  void *v3;
  void *v4;
  NSObject *v5;
  int v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v8 = *MEMORY[0x1E0CB2D50];
  v9[0] = CFSTR("Not supported on this platform.");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 1, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _rt_log_facility_get_os_log(RTLogFacilityMotionActivity);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "error, %@", (uint8_t *)&v6, 0xCu);
  }

}

+ (void)removeActivities:(id)a3 stoppedBeforeDate:(id)a4
{
  id v5;
  objc_class *v6;
  id v7;
  void *v8;
  unint64_t v9;
  id v10;

  v5 = a3;
  if (v5 && a4)
  {
    v6 = (objc_class *)MEMORY[0x1E0CB3588];
    v10 = v5;
    v7 = a4;
    v8 = (void *)objc_msgSend([v6 alloc], "initWithStartDate:duration:", v7, 0.0);

    v9 = objc_msgSend(v10, "indexOfObject:inSortedRange:options:usingComparator:", v8, 0, objc_msgSend(v10, "count"), 1280, &__block_literal_global_158);
    if (v9 >= 2)
      objc_msgSend(v10, "removeObjectsInRange:", 0, v9 - 1);

    v5 = v10;
  }

}

uint64_t __62__RTMotionActivityManager_removeActivities_stoppedBeforeDate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

+ (double)ratioOfMotionActivityType:(unint64_t)a3 forActivities:(id)a4 startDate:(id)a5 endDate:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  double v13;
  RTMotionActivityHistogram *v14;
  void *v15;
  double v16;
  double v17;
  double v18;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  v12 = v11;
  v13 = 0.0;
  if (v10 && v11 && objc_msgSend(v10, "compare:", v11) == -1)
  {
    v14 = -[RTMotionActivityHistogram initWithActivites:betweenDate:andDate:]([RTMotionActivityHistogram alloc], "initWithActivites:betweenDate:andDate:", v9, v10, v12);
    -[RTMotionActivityHistogram binForType:](v14, "binForType:", a3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "interval");
    v17 = v16;
    objc_msgSend(v12, "timeIntervalSinceDate:", v10);
    v13 = v17 / v18;

  }
  return v13;
}

- (RTPlatform)platform
{
  return self->_platform;
}

- (RTVehicleStore)vehicleStore
{
  return self->_vehicleStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vehicleStore, 0);
  objc_storeStrong((id *)&self->_platform, 0);
}

void __68__RTMotionActivityManager_CoreMotion_initWithPlatform_vehicleStore___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_processDominantActivity");

}

void __68__RTMotionActivityManager_CoreMotion_initWithPlatform_vehicleStore___block_invoke_69(uint64_t a1)
{
  RTMotionActivityManagerNotificationVehicleConnected *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = -[RTMotionActivityManagerNotificationVehicleConnected initWithVehicleConnectedState:deviceId:]([RTMotionActivityManagerNotificationVehicleConnected alloc], "initWithVehicleConnectedState:deviceId:", 2, CFSTR("Simulated vehicle"));
  objc_msgSend(WeakRetained, "postNotification:", v1);

}

void __68__RTMotionActivityManager_CoreMotion_initWithPlatform_vehicleStore___block_invoke_2(uint64_t a1)
{
  RTMotionActivityManagerNotificationVehicleConnected *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = -[RTMotionActivityManagerNotificationVehicleConnected initWithVehicleConnectedState:deviceId:]([RTMotionActivityManagerNotificationVehicleConnected alloc], "initWithVehicleConnectedState:deviceId:", 1, CFSTR("Simulated vehicle"));
  objc_msgSend(WeakRetained, "postNotification:", v1);

}

uint64_t __68__RTMotionActivityManager_CoreMotion__fetchMotionActivitiesIfNeeded__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_bootstrapDominantActivityWithMotionActivites:", a2);
}

void __90__RTMotionActivityManager_CoreMotion__fetchMotionActivitiesFromStartDate_endDate_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  _RTMap *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  id v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1D8231EA8]();
  _rt_log_facility_get_os_log(RTLogFacilityMotionActivity);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "stringFromDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "stringFromDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v5, "count");
    +[RTRuntime footprint](RTRuntime, "footprint");
    v15 = 138413314;
    v16 = v9;
    v17 = 2112;
    v18 = v10;
    v19 = 2048;
    v20 = v11;
    v21 = 2112;
    v22 = v6;
    v23 = 2048;
    v24 = v12;
    _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "Querying CoreMotion for motionActivity between startDate, %@, endDate, %@, returned %lu activities, error, %@, footprint, %.2f MB", (uint8_t *)&v15, 0x34u);

  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a3);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", &__block_literal_global_121);
  v13 = -[_RTMap initWithInput:]([_RTMap alloc], "initWithInput:", v5);
  -[_RTMap withBlock:](v13, "withBlock:", &__block_literal_global_105_0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "addObjectsFromArray:", v14);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
  objc_autoreleasePoolPop(v7);

}

void __90__RTMotionActivityManager_CoreMotion__fetchMotionActivitiesFromStartDate_endDate_handler___block_invoke_100(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityMotionActivity);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = 134218242;
    v7 = a3 + 1;
    v8 = 2112;
    v9 = v4;
    _os_log_debug_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_DEBUG, "motionActivity %lu, %@", (uint8_t *)&v6, 0x16u);
  }

}

id __90__RTMotionActivityManager_CoreMotion__fetchMotionActivitiesFromStartDate_endDate_handler___block_invoke_103(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v2 = (objc_class *)MEMORY[0x1E0D18400];
  v3 = a2;
  v4 = [v2 alloc];
  v5 = objc_msgSend(v3, "rtMotionActivityType");
  v6 = objc_msgSend(v3, "rtMotionActivityConfidence");
  objc_msgSend(v3, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(v4, "initWithType:confidence:startDate:", v5, v6, v7);
  return v8;
}

void __109__RTMotionActivityManager_CoreMotion__fetchPredominantMotionActivityTypeFromStartDate_toEndDate_withHandler___block_invoke(_QWORD *a1, void *a2, uint64_t a3)
{
  RTMotionActivityHistogram *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  if (a3)
  {
    (*(void (**)(void))(a1[6] + 16))();
  }
  else
  {
    v5 = -[RTMotionActivityHistogram initWithActivites:betweenDate:andDate:]([RTMotionActivityHistogram alloc], "initWithActivites:betweenDate:andDate:", v9, a1[4], a1[5]);
    -[RTMotionActivityHistogram binsSortedByInterval](v5, "binsSortedByInterval");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = a1[6];
    objc_msgSend(v6, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, _QWORD))(v7 + 16))(v7, objc_msgSend(v8, "type"), 0);

  }
}

void __84__RTMotionActivityManager_CoreMotion__bootstrapDominantActivityWithMotionActivites___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  objc_class *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityMotionActivity);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412546;
    v7 = v5;
    v8 = 2112;
    v9 = v2;
    _os_log_debug_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_DEBUG, "bootstrapping %@, %@", (uint8_t *)&v6, 0x16u);

  }
}

uint64_t __68__RTMotionActivityManager_CoreMotion_onVehicleConnectedNotification__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onVehicleConnectedNotification");
}

void __72__RTMotionActivityManager_CoreMotion__onVehicleDisconnectedNotification__block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "description");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = 138412290;
      v6 = v4;
      _os_log_error_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_ERROR, "Error storing Vehicle: %@", (uint8_t *)&v5, 0xCu);

    }
  }
}

uint64_t __71__RTMotionActivityManager_CoreMotion_onVehicleDisconnectedNotification__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onVehicleDisconnectedNotification");
}

void __63__RTMotionActivityManager_CoreMotion_onVehicleExitNotification__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_new();
  objc_msgSend(*(id *)(a1 + 32), "postNotification:", v2);
  _rt_log_facility_get_os_log(RTLogFacilityMotionActivity);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = *MEMORY[0x1E0CA5750];
    v5 = 138412290;
    v6 = v4;
    _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "received darwin notification, %@", (uint8_t *)&v5, 0xCu);
  }

}

void __62__RTMotionActivityManager_CoreMotion_setInterestedInActivity___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id WeakRetained;
  id v10;

  v3 = (objc_class *)MEMORY[0x1E0D18400];
  v4 = a2;
  v5 = [v3 alloc];
  v6 = objc_msgSend(v4, "rtMotionActivityType");
  v7 = objc_msgSend(v4, "rtMotionActivityConfidence");
  objc_msgSend(v4, "startDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (id)objc_msgSend(v5, "initWithType:confidence:startDate:", v6, v7, v8);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "onActivity:", v10);

}

void __62__RTMotionActivityManager_CoreMotion__processDominantActivity__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityMotionActivity);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = 134218242;
    v7 = a3 + 1;
    v8 = 2112;
    v9 = v4;
    _os_log_debug_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_DEBUG, "%lu, %@", (uint8_t *)&v6, 0x16u);
  }

}

uint64_t __49__RTMotionActivityManager_CoreMotion_onActivity___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onActivity:", *(_QWORD *)(a1 + 40));
}

uint64_t __57__RTMotionActivityManager_CoreMotion__rtAlarmForTrigger___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_processActivityAlarm:error:", a2, a3);
}

void __86__RTMotionActivityManager_CoreMotion__subscribeForPedometerDataWithStartDate_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  RTMotionActivityPedometerData *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  objc_class *v21;
  void *v22;
  void *v23;
  objc_class *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  id v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "endDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "compare:", v8);

  if (v9 == -1)
  {
    v11 = [RTMotionActivityPedometerData alloc];
    v12 = objc_alloc(MEMORY[0x1E0CB3588]);
    objc_msgSend(v5, "startDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "endDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v12, "initWithStartDate:endDate:", v13, v14);
    objc_msgSend(v5, "numberOfSteps");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "integerValue");
    objc_msgSend(v5, "distance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "doubleValue");
    v19 = -[RTMotionActivityPedometerData initWithDateInterval:numberOfSteps:distance:](v11, "initWithDateInterval:numberOfSteps:distance:", v15, v17);

    _rt_log_facility_get_os_log(RTLogFacilityMotionActivity);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v21 = (objc_class *)objc_opt_class();
      NSStringFromClass(v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 56));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138413314;
      v28 = v22;
      v29 = 2112;
      v30 = v23;
      v31 = 2112;
      v32 = v19;
      v33 = 2112;
      v34 = v5;
      v35 = 2112;
      v36 = v6;
      _os_log_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_INFO, "%@, %@, routine pedometer data, %@, core motion pedometer data, %@, error, %@,", (uint8_t *)&v27, 0x34u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v5 = (id)v19;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityMotionActivity);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v24 = (objc_class *)objc_opt_class();
      NSStringFromClass(v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 56));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138413058;
      v28 = v25;
      v29 = 2112;
      v30 = v26;
      v31 = 2112;
      v32 = (uint64_t)v5;
      v33 = 2112;
      v34 = v6;
      _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "%@, %@, invalid start and end date, core motion pedometer data, %@, error, %@,", (uint8_t *)&v27, 0x2Au);

    }
  }

}

@end
