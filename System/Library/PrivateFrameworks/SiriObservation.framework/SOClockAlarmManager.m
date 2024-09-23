@implementation SOClockAlarmManager

- (id)_registeredObservations
{
  NSMutableDictionary *registeredObservations;
  NSMutableDictionary *v4;
  NSMutableDictionary *v5;

  registeredObservations = self->_registeredObservations;
  if (!registeredObservations)
  {
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    v5 = self->_registeredObservations;
    self->_registeredObservations = v4;

    registeredObservations = self->_registeredObservations;
  }
  return registeredObservations;
}

void __43__SOClockAlarmManager_addHandler_forEvent___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id MTAlarmClass;
  void *v9;
  void *v10;
  void *v11;
  _BYTE v12[24];
  void *v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v12 = 136315394;
    *(_QWORD *)&v12[4] = "-[SOClockAlarmManager addHandler:forEvent:]_block_invoke";
    *(_WORD *)&v12[12] = 2112;
    *(_QWORD *)&v12[14] = v3;
    _os_log_impl(&dword_212A19000, v4, OS_LOG_TYPE_INFO, "%s notification = %@", v12, 0x16u);
  }
  objc_msgSend(v3, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  getMTAlarmManagerAlarmsKey();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    MTAlarmClass = getMTAlarmClass();
    *(_QWORD *)v12 = MEMORY[0x24BDAC760];
    *(_QWORD *)&v12[8] = 3221225472;
    *(_QWORD *)&v12[16] = ___SOClockAlarmManagerGetMTAlarmsFromNotification_block_invoke;
    v13 = &__block_descriptor_40_e24_B32__0__MTAlarm_8Q16_B24lu32l8;
    v14 = MTAlarmClass;
    objc_msgSend(v7, "indexesOfObjectsPassingTest:", v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectsAtIndexes:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = (void *)MEMORY[0x24BDBD1A8];
  }

  SOClockAlarmCreateFromMTAlarms(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (SOClockAlarmManager)init
{
  void *v3;
  SOClockAlarmManager *v4;

  objc_msgSend(MEMORY[0x24BE091F8], "defaultContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SOClockAlarmManager initWithInstanceContext:](self, "initWithInstanceContext:", v3);

  return v4;
}

- (SOClockAlarmManager)initWithInstanceContext:(id)a3
{
  id v4;
  SOClockAlarmManager *v5;
  AFInstanceContext *v6;
  AFInstanceContext *instanceContext;
  NSObject **v8;
  NSObject *v9;
  MTAlarmManager *v10;
  MTAlarmManager *mtAlarmManager;
  MTAlarmManager *v12;
  NSObject *v13;
  NSObject *v14;
  SOClockAlarmManager *v15;
  objc_super v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  MTAlarmManager *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SOClockAlarmManager;
  v5 = -[SOClockAlarmManager init](&v17, sel_init);
  if (!v5)
    goto LABEL_11;
  if (v4)
  {
    v6 = (AFInstanceContext *)v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE091F8], "defaultContext");
    v6 = (AFInstanceContext *)objc_claimAutoreleasedReturnValue();
  }
  instanceContext = v5->_instanceContext;
  v5->_instanceContext = v6;

  v8 = (NSObject **)MEMORY[0x24BE08FB0];
  v9 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v19 = "-[SOClockAlarmManager initWithInstanceContext:]";
    v20 = 2112;
    v21 = (MTAlarmManager *)v4;
    _os_log_impl(&dword_212A19000, v9, OS_LOG_TYPE_INFO, "%s instanceContext = %@", buf, 0x16u);
  }
  if ((objc_msgSend(MEMORY[0x24BE091E0], "isTimerAlarmCoordinationEnabled") & 1) != 0)
    goto LABEL_11;
  v10 = (MTAlarmManager *)objc_alloc_init((Class)getMTAlarmManagerClass());
  mtAlarmManager = v5->_mtAlarmManager;
  v5->_mtAlarmManager = v10;

  v12 = v5->_mtAlarmManager;
  v13 = *v8;
  v14 = *v8;
  if (v12)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v19 = "-[SOClockAlarmManager initWithInstanceContext:]";
      v20 = 2112;
      v21 = v12;
      _os_log_impl(&dword_212A19000, v13, OS_LOG_TYPE_INFO, "%s Initialized for MobileTimer (%@)", buf, 0x16u);
    }
LABEL_11:
    v15 = v5;
    goto LABEL_12;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v19 = "-[SOClockAlarmManager initWithInstanceContext:]";
    _os_log_error_impl(&dword_212A19000, v13, OS_LOG_TYPE_ERROR, "%s Unable to get an instance of MTAlarmManager", buf, 0xCu);
  }
  v15 = 0;
LABEL_12:

  return v15;
}

- (void)checkIn
{
  MTAlarmManager *mtAlarmManager;

  if ((objc_msgSend(MEMORY[0x24BE091E0], "isTimerAlarmCoordinationEnabled") & 1) == 0)
  {
    mtAlarmManager = self->_mtAlarmManager;
    if (mtAlarmManager)
      -[MTAlarmManager checkIn](mtAlarmManager, "checkIn");
  }
}

- (void)addHandler:(id)a3 forEvent:(int64_t)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  AFClockAlarmManagerEventGetName();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v22 = "-[SOClockAlarmManager addHandler:forEvent:]";
    v23 = 2112;
    v24 = v7;
    _os_log_impl(&dword_212A19000, v8, OS_LOG_TYPE_INFO, "%s event = %@", buf, 0x16u);
  }
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __43__SOClockAlarmManager_addHandler_forEvent___block_invoke;
  v19[3] = &unk_24CE76008;
  v9 = v6;
  v20 = v9;
  v10 = (void *)MEMORY[0x212BF7D48](v19);
  if ((objc_msgSend(MEMORY[0x24BE091E0], "isTimerAlarmCoordinationEnabled") & 1) == 0)
  {
    -[SOClockAlarmManager _registeredObservations](self, "_registeredObservations");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v12)
      objc_msgSend(v13, "removeObserver:", v12);
    if ((unint64_t)(a4 - 1) <= 7)
    {
      ((void (*)(void))*off_24CE75778[a4 - 1])();
      v15 = objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        v16 = (void *)v15;
        objc_msgSend(v14, "addObserverForName:object:queue:usingBlock:", v15, self->_mtAlarmManager, 0, v10);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[SOClockAlarmManager _registeredObservations](self, "_registeredObservations");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setObject:forKey:", v17, v7);

      }
    }

  }
}

- (void)removeHandlerForEvent:(int64_t)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  AFClockAlarmManagerEventGetName();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v11 = 136315394;
    v12 = "-[SOClockAlarmManager removeHandlerForEvent:]";
    v13 = 2112;
    v14 = v4;
    _os_log_impl(&dword_212A19000, v5, OS_LOG_TYPE_INFO, "%s event = %@", (uint8_t *)&v11, 0x16u);
  }
  if ((objc_msgSend(MEMORY[0x24BE091E0], "isTimerAlarmCoordinationEnabled") & 1) == 0)
  {
    -[SOClockAlarmManager _registeredObservations](self, "_registeredObservations");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v7)
    {
      objc_msgSend(v8, "removeObserver:", v7);
      -[SOClockAlarmManager _registeredObservations](self, "_registeredObservations");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "removeObjectForKey:", v4);

    }
  }

}

- (id)alarms
{
  NSObject *v3;
  void *mtAlarmManager;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v6 = 136315138;
    v7 = "-[SOClockAlarmManager alarms]";
    _os_log_impl(&dword_212A19000, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v6, 0xCu);
  }
  if ((objc_msgSend(MEMORY[0x24BE091E0], "isTimerAlarmCoordinationEnabled") & 1) != 0)
    return 0;
  mtAlarmManager = self->_mtAlarmManager;
  if (mtAlarmManager)
  {
    objc_msgSend(mtAlarmManager, "alarms");
    mtAlarmManager = (void *)objc_claimAutoreleasedReturnValue();
  }
  return mtAlarmManager;
}

- (id)alarmsIncludingSleepAlarm:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *mtAlarmManager;
  int v8;
  const char *v9;
  uint64_t v10;

  v3 = a3;
  v10 = *MEMORY[0x24BDAC8D0];
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v8 = 136315138;
    v9 = "-[SOClockAlarmManager alarmsIncludingSleepAlarm:]";
    _os_log_impl(&dword_212A19000, v5, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v8, 0xCu);
  }
  if ((objc_msgSend(MEMORY[0x24BE091E0], "isTimerAlarmCoordinationEnabled") & 1) != 0)
    return 0;
  mtAlarmManager = self->_mtAlarmManager;
  if (mtAlarmManager)
  {
    objc_msgSend(mtAlarmManager, "alarmsIncludingSleepAlarm:", v3);
    mtAlarmManager = (void *)objc_claimAutoreleasedReturnValue();
  }
  return mtAlarmManager;
}

- (id)addAlarm:(id)a3
{
  id v4;
  NSObject *v5;
  MTAlarmManager *mtAlarmManager;
  void *v7;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v9 = 136315138;
    v10 = "-[SOClockAlarmManager addAlarm:]";
    _os_log_impl(&dword_212A19000, v5, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v9, 0xCu);
  }
  if ((objc_msgSend(MEMORY[0x24BE091E0], "isTimerAlarmCoordinationEnabled") & 1) != 0
    || (mtAlarmManager = self->_mtAlarmManager) == 0)
  {
    v7 = 0;
  }
  else
  {
    -[MTAlarmManager addAlarm:](mtAlarmManager, "addAlarm:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (id)updateAlarm:(id)a3
{
  id v4;
  NSObject *v5;
  MTAlarmManager *mtAlarmManager;
  void *v7;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v9 = 136315138;
    v10 = "-[SOClockAlarmManager updateAlarm:]";
    _os_log_impl(&dword_212A19000, v5, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v9, 0xCu);
  }
  if ((objc_msgSend(MEMORY[0x24BE091E0], "isTimerAlarmCoordinationEnabled") & 1) != 0
    || (mtAlarmManager = self->_mtAlarmManager) == 0)
  {
    v7 = 0;
  }
  else
  {
    -[MTAlarmManager updateAlarm:](mtAlarmManager, "updateAlarm:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (id)removeAlarm:(id)a3
{
  id v4;
  NSObject *v5;
  MTAlarmManager *mtAlarmManager;
  void *v7;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v9 = 136315138;
    v10 = "-[SOClockAlarmManager removeAlarm:]";
    _os_log_impl(&dword_212A19000, v5, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v9, 0xCu);
  }
  if ((objc_msgSend(MEMORY[0x24BE091E0], "isTimerAlarmCoordinationEnabled") & 1) != 0
    || (mtAlarmManager = self->_mtAlarmManager) == 0)
  {
    v7 = 0;
  }
  else
  {
    -[MTAlarmManager removeAlarm:](mtAlarmManager, "removeAlarm:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (id)dismissAlarmWithIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  MTAlarmManager *mtAlarmManager;
  void *v7;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v9 = 136315138;
    v10 = "-[SOClockAlarmManager dismissAlarmWithIdentifier:]";
    _os_log_impl(&dword_212A19000, v5, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v9, 0xCu);
  }
  if ((objc_msgSend(MEMORY[0x24BE091E0], "isTimerAlarmCoordinationEnabled") & 1) != 0
    || (mtAlarmManager = self->_mtAlarmManager) == 0)
  {
    v7 = 0;
  }
  else
  {
    -[MTAlarmManager dismissAlarmWithIdentifier:](mtAlarmManager, "dismissAlarmWithIdentifier:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mtAlarmManager, 0);
  objc_storeStrong((id *)&self->_registeredObservations, 0);
  objc_storeStrong((id *)&self->_instanceContext, 0);
}

+ (void)warmUp
{
  if ((objc_msgSend(MEMORY[0x24BE091E0], "isTimerAlarmCoordinationEnabled") & 1) == 0)
    objc_msgSend(getMTAlarmManagerClass(), "warmUp");
}

@end
