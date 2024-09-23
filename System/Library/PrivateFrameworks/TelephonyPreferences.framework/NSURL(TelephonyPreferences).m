@implementation NSURL(TelephonyPreferences)

+ (id)tps_telephonyTapToRadarURLForError:()TelephonyPreferences
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v3 = a3;
  objc_msgSend(v3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2938]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "localizedFailureReason");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "length") && objc_msgSend(v6, "length"))
  {
    v7 = objc_alloc_init(MEMORY[0x1E0CB3998]);
    v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("Classification"), CFSTR("Other Bug"));
    objc_msgSend(v8, "addObject:", v9);
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("ComponentID"), CFSTR("230851"));

    objc_msgSend(v8, "addObject:", v10);
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("ComponentName"), CFSTR("Telephony"));

    objc_msgSend(v8, "addObject:", v11);
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("ComponentVersion"), CFSTR("iOS"));

    objc_msgSend(v8, "addObject:", v12);
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("DeviceClasses"), CFSTR("iPhone"));

    objc_msgSend(v8, "addObject:", v13);
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("Reproducibility"), CFSTR("Always"));

    objc_msgSend(v8, "addObject:", v14);
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("Title"), v6);

    objc_msgSend(v8, "addObject:", v15);
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("Description"), v5);

    objc_msgSend(v8, "addObject:", v16);
    objc_msgSend(v7, "setScheme:", CFSTR("tap-to-radar"));
    objc_msgSend(v7, "setHost:", CFSTR("new"));
    objc_msgSend(v7, "setQueryItems:", v8);
    objc_msgSend(v7, "URL");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

@end
