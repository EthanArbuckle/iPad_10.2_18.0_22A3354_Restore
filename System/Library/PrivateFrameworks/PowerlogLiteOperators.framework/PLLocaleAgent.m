@implementation PLLocaleAgent

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLLocaleAgent;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)railDefinitions
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (id)accountingGroupDefinitions
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (id)entryEventPointDefinitions
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (id)entryEventForwardDefinitions
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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[6];
  _QWORD v20[6];
  uint64_t v21;
  void *v22;
  _QWORD v23[2];
  _QWORD v24[2];
  const __CFString *v25;
  _QWORD v26[3];

  v26[1] = *MEMORY[0x1E0C80C00];
  v25 = CFSTR("TimeZone");
  v23[0] = *MEMORY[0x1E0D80298];
  v21 = *MEMORY[0x1E0D80318];
  v22 = &unk_1E8652BB0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v18;
  v23[1] = *MEMORY[0x1E0D802F0];
  v19[0] = CFSTR("LocaleId");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "commonTypeDict_StringFormat");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v16;
  v19[1] = CFSTR("CountryCode");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "commonTypeDict_StringFormat");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v14;
  v19[2] = CFSTR("TimeZoneName");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "commonTypeDict_StringFormat");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v2;
  v19[3] = CFSTR("TimeZoneIsInDST");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_BoolFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v20[3] = v4;
  v19[4] = CFSTR("SecondsFromGMT");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20[4] = v6;
  v19[5] = CFSTR("Trigger");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_StringFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20[5] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)entryEventBackwardDefinitions
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (id)entryEventNoneDefinitions
{
  return (id)MEMORY[0x1E0C9AA70];
}

- (PLLocaleAgent)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PLLocaleAgent;
  return -[PLAgent init](&v3, sel_init);
}

- (void)initOperatorDependancies
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_logEventForwardTimeZoneWithTrigger_, *MEMORY[0x1E0C998A0], 0);

}

- (void)logEventForwardTimeZone
{
  -[PLLocaleAgent logEventForwardTimeZoneWithTrigger:](self, "logEventForwardTimeZoneWithTrigger:", 0);
}

- (void)logTimeZoneEntry:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  objc_msgSend(v4, "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entryDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLOperator logForSubsystem:category:data:date:](self, "logForSubsystem:category:data:date:", CFSTR("LocaleMetrics"), CFSTR("TimeZone"), v5, v6);

  objc_msgSend(v4, "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entryDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLOperator logForSubsystem:category:data:date:](self, "logForSubsystem:category:data:date:", CFSTR("PPTStorageOperator"), CFSTR("Locale"), v7, v8);

  objc_msgSend(v4, "dictionary");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entryDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLOperator logForSubsystem:category:data:date:](self, "logForSubsystem:category:data:date:", CFSTR("BackgroundProcessing"), CFSTR("Locale"), v10, v9);
}

- (void)logEventForwardTimeZoneWithTrigger:(id)a3
{
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
  void *v14;
  id v15;

  v15 = a3;
  objc_msgSend(MEMORY[0x1E0C99E80], "resetSystemTimeZone");
  objc_msgSend(MEMORY[0x1E0D80088], "resetTimestampFormaterTimezone");
  objc_msgSend(MEMORY[0x1E0C99E80], "systemTimeZone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLOperator entryKeyForType:andName:](PLLocaleAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("TimeZone"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v6);
  v8 = (void *)CFPreferencesCopyValue(CFSTR("AppleLocale"), CFSTR("Apple Global Domain"), CFSTR("mobile"), (CFStringRef)*MEMORY[0x1E0C9B250]);
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("LocaleId"));

  objc_msgSend(v7, "setObject:forKeyedSubscript:", CFSTR("Unavailable"), CFSTR("CountryCode"));
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "liteMode"))
  {
    objc_msgSend(v5, "localeIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, CFSTR("LocaleId"));

    objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0C997B0]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, CFSTR("CountryCode"));

  }
  objc_msgSend(v4, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, CFSTR("TimeZoneName"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "isDaylightSavingTime"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v12, CFSTR("TimeZoneIsInDST"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "secondsFromGMT"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v13, CFSTR("SecondsFromGMT"));

  if (v15)
  {
    objc_msgSend(v15, "name");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v14, CFSTR("Trigger"));

  }
  else
  {
    objc_msgSend(v7, "setObject:forKeyedSubscript:", CFSTR("powerlog"), CFSTR("Trigger"));
  }
  -[PLOperator logEntry:](self, "logEntry:", v7);
  -[PLLocaleAgent logTimeZoneEntry:](self, "logTimeZoneEntry:", v7);

}

- (PLNSNotificationOperatorComposition)timeNotification
{
  return (PLNSNotificationOperatorComposition *)objc_getProperty(self, a2, 48, 1);
}

- (void)setTimeNotification:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeNotification, 0);
}

@end
