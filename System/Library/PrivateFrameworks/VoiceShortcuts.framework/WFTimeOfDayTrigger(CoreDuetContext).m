@implementation WFTimeOfDayTrigger(CoreDuetContext)

- (uint64_t)contextStoreKeyPathForCurrentState
{
  return objc_msgSend(MEMORY[0x1E0D15C58], "keyPathForSystemTime");
}

- (id)contextStorePredicate
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D15C40], "userContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15C58], "keyPathForSunriseSunsetDataDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D15C58], "currentSunriseKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D15C58], "currentSunsetKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DD9EB0], "nextFireDateFromNowWithTrigger:currentSunriseTime:currentSunsetTime:", a1, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:duration:", v9, 300.0);
    objc_msgSend(MEMORY[0x1E0D15C58], "predicateForSystemTimeInInterval:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    getWFTriggersLogObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v14 = 136315138;
      v15 = "-[WFTimeOfDayTrigger(CoreDuetContext) contextStorePredicate]";
      _os_log_impl(&dword_1C146A000, v12, OS_LOG_TYPE_ERROR, "%s Could not create predicate for WFTimeOfDayTrigger because next fire date was nil", (uint8_t *)&v14, 0xCu);
    }

    v11 = 0;
  }

  return v11;
}

- (uint64_t)contextStoreQualityOfService
{
  return 25;
}

- (uint64_t)needsRegistrationAfterFiring
{
  return 1;
}

@end
