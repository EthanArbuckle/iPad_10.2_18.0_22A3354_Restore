@implementation WFAlarmTrigger(BiomeContext)

- (id)publisherWithScheduler:()BiomeContext
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0D027B8];
  v4 = a3;
  objc_msgSend(v3, "alarmStream");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "publisher");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "subscribeOn:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)shouldFireInResponseToEvent:()BiomeContext triggerIdentifier:completion:
{
  void (**v7)(id, _BOOL8);
  void *v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  _BOOL8 v13;
  void *v14;
  void *v15;
  uint64_t v16;
  _BOOL8 v17;
  int v18;
  const char *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a5;
  objc_msgSend(a3, "eventBody");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    getWFTriggersLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 136315394;
      v19 = "-[WFAlarmTrigger(BiomeContext) shouldFireInResponseToEvent:triggerIdentifier:completion:]";
      v20 = 2112;
      v21 = v8;
      _os_log_impl(&dword_1C146A000, v9, OS_LOG_TYPE_DEFAULT, "%s Received alarm event %@ for trigger", (uint8_t *)&v18, 0x16u);
    }

    v10 = objc_msgSend(a1, "alarmType");
    switch(v10)
    {
      case 2:
        if (!objc_msgSend(v8, "isSleepAlarm"))
        {
          v13 = 0;
          goto LABEL_18;
        }
LABEL_14:
        v12 = objc_msgSend(v8, "eventType");
        v13 = v12 == objc_msgSend(a1, "alarmEventForCurrentAlarmState");
LABEL_18:
        v7[2](v7, v13);
        break;
      case 1:
        objc_msgSend(a1, "alarmIDs");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "alarmID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v14, "containsObject:", v15))
        {
          v16 = objc_msgSend(v8, "eventType");
          v17 = v16 == objc_msgSend(a1, "alarmEventForCurrentAlarmState");
        }
        else
        {
          v17 = 0;
        }
        v7[2](v7, v17);

        break;
      case 0:
        goto LABEL_14;
    }
  }
  else
  {

    getWFTriggersLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 136315138;
      v19 = "-[WFAlarmTrigger(BiomeContext) shouldFireInResponseToEvent:triggerIdentifier:completion:]";
      _os_log_impl(&dword_1C146A000, v11, OS_LOG_TYPE_DEFAULT, "%s No Alarm event received for trigger; not firing.",
        (uint8_t *)&v18,
        0xCu);
    }

    v7[2](v7, 0);
    v8 = 0;
  }

}

- (uint64_t)alarmEventForCurrentAlarmState
{
  uint64_t v1;

  v1 = objc_msgSend(a1, "alarmState");
  if (v1 == 2)
    return 1;
  else
    return 2 * (v1 == 1);
}

@end
