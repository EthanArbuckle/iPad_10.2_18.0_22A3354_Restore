@implementation SUCoreActivity

- (SUCoreActivity)initWithActivityName:(id)a3 options:(id)a4
{
  id v7;
  id v8;
  SUCoreActivity *v9;
  void *v10;
  uint64_t v11;
  NSString *UUID;
  uint64_t v13;
  NSDate *runDate;
  uint64_t v15;
  NSNumber *batteryLevelGreaterThan;
  uint64_t v17;
  NSNumber *batteryLevelLessThan;
  int v19;
  void *v20;
  NSObject *v21;
  uint8_t v23[16];
  objc_super v24;

  v7 = a3;
  v8 = a4;
  v24.receiver = self;
  v24.super_class = (Class)SUCoreActivity;
  v9 = -[SUCoreActivity init](&v24, sel_init);
  if (v9)
  {
    if (objc_opt_class())
    {
      objc_storeStrong((id *)&v9->_activityName, a3);
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "UUIDString");
      v11 = objc_claimAutoreleasedReturnValue();
      UUID = v9->_UUID;
      v9->_UUID = (NSString *)v11;

      objc_msgSend(v8, "runDate");
      v13 = objc_claimAutoreleasedReturnValue();
      runDate = v9->_runDate;
      v9->_runDate = (NSDate *)v13;

      objc_msgSend(v8, "batteryLevelGreaterThan");
      v15 = objc_claimAutoreleasedReturnValue();
      batteryLevelGreaterThan = v9->_batteryLevelGreaterThan;
      v9->_batteryLevelGreaterThan = (NSNumber *)v15;

      objc_msgSend(v8, "batteryLevelLessThan");
      v17 = objc_claimAutoreleasedReturnValue();
      batteryLevelLessThan = v9->_batteryLevelLessThan;
      v9->_batteryLevelLessThan = (NSNumber *)v17;

      if (v8)
      {
        v9->_plugInState = objc_msgSend(v8, "plugInState");
        v9->_screenOnState = objc_msgSend(v8, "screenOnState");
        v9->_networkState = objc_msgSend(v8, "networkState");
        v9->_wifiState = objc_msgSend(v8, "wifiState");
        v9->_phoneCallState = objc_msgSend(v8, "phoneCallState");
        v9->_carplayState = objc_msgSend(v8, "carplayState");
        v9->_mediaPlayingState = objc_msgSend(v8, "mediaPlayingState");
        v19 = objc_msgSend(v8, "waking");
      }
      else
      {
        v19 = 0;
        *(_QWORD *)&v9->_plugInState = 0;
        *(_QWORD *)&v9->_networkState = 0;
        v9->_mediaPlayingState = 0;
        *(_QWORD *)&v9->_phoneCallState = 0;
      }
      v9->_waking = v19;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "oslog");
      v21 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v23 = 0;
        _os_log_impl(&dword_1DDFDD000, v21, OS_LOG_TYPE_DEFAULT, "CoreDuet Context Store symbols not recognized. Returning null SUCoreActivity", v23, 2u);
      }

      v9 = 0;
    }
  }

  return v9;
}

- (id)createRegistrationWithHandler:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  _BOOL8 v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v16;
  uint8_t buf[16];

  v4 = (void *)MEMORY[0x1E0D15C68];
  v5 = a3;
  -[SUCoreActivity activityName](self, "activityName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreActivity createContextualPredicate](self, "createContextualPredicate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreActivity _dismissalPredicate](self, "_dismissalPredicate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SUCoreActivity _deviceSet](self, "_deviceSet");
  -[SUCoreActivity _clientIdentifier](self, "_clientIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[SUCoreActivity _mustWake](self, "_mustWake");
  LODWORD(v16) = -[SUCoreActivity _qualityOfService](self, "_qualityOfService");
  objc_msgSend(v4, "registrationWithIdentifier:contextualPredicate:dismissalPolicy:deviceSet:clientIdentifier:mustWake:qualityOfService:callback:", v6, v7, v8, v9, v10, v11, v16, v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "oslog");
    v14 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DDFDD000, v14, OS_LOG_TYPE_DEFAULT, "Failed to create registration", buf, 2u);
    }

  }
  return v12;
}

- (BOOL)_mustWake
{
  return -[SUCoreActivity _BOOLForTriState:defaultValue:](self, "_BOOLForTriState:defaultValue:", -[SUCoreActivity waking](self, "waking"), 0);
}

- (unsigned)_qualityOfService
{
  void *v2;
  unsigned int v3;

  -[SUCoreActivity runDate](self, "runDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = 25;
  else
    v3 = 9;

  return v3;
}

- (unint64_t)_deviceSet
{
  return 0;
}

- (id)_dismissalPredicate
{
  return 0;
}

- (id)_clientIdentifier
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_BOOLForTriState:(int)a3 defaultValue:(BOOL)a4
{
  if (a3 == 1)
    a4 = 0;
  return a3 == 2 || a4;
}

- (id)createContextualPredicate
{
  void *v3;
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  NSObject *v24;
  int v26;
  SUCoreActivity *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreActivity runDate](self, "runDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SUCoreActivity runDate](self, "runDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[SUCoreActivity systemDatePredicate:](SUCoreActivity, "systemDatePredicate:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v6);

  }
  -[SUCoreActivity batteryLevelGreaterThan](self, "batteryLevelGreaterThan");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[SUCoreActivity batteryLevelGreaterThan](self, "batteryLevelGreaterThan");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[SUCoreActivity batteryLevelPredicateGreaterThan:](SUCoreActivity, "batteryLevelPredicateGreaterThan:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v9);

  }
  -[SUCoreActivity batteryLevelLessThan](self, "batteryLevelLessThan");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[SUCoreActivity batteryLevelLessThan](self, "batteryLevelLessThan");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[SUCoreActivity batteryLevelPredicateLessThan:](SUCoreActivity, "batteryLevelPredicateLessThan:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v12);

  }
  if (-[SUCoreActivity plugInState](self, "plugInState"))
  {
    +[SUCoreActivity pluggedInPredicate:](SUCoreActivity, "pluggedInPredicate:", -[SUCoreActivity plugInState](self, "plugInState") == 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v13);

  }
  if (-[SUCoreActivity screenOnState](self, "screenOnState"))
  {
    +[SUCoreActivity backlightOnPredicate:](SUCoreActivity, "backlightOnPredicate:", -[SUCoreActivity screenOnState](self, "screenOnState") != 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v14);

  }
  if (-[SUCoreActivity networkState](self, "networkState"))
  {
    +[SUCoreActivity networkPredicate:](SUCoreActivity, "networkPredicate:", -[SUCoreActivity networkState](self, "networkState") != 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v15);

  }
  if (-[SUCoreActivity wifiState](self, "wifiState"))
  {
    +[SUCoreActivity wifiAvailablePredicate:](SUCoreActivity, "wifiAvailablePredicate:", -[SUCoreActivity wifiState](self, "wifiState") != 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v16);

  }
  if (-[SUCoreActivity phoneCallState](self, "phoneCallState"))
  {
    +[SUCoreActivity phoneCallPredicate:](SUCoreActivity, "phoneCallPredicate:", -[SUCoreActivity phoneCallState](self, "phoneCallState") != 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v17);

  }
  if (-[SUCoreActivity carplayState](self, "carplayState"))
  {
    +[SUCoreActivity carplayPredicate:](SUCoreActivity, "carplayPredicate:", -[SUCoreActivity carplayState](self, "carplayState") != 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v18);

  }
  if (-[SUCoreActivity mediaPlayingState](self, "mediaPlayingState"))
  {
    +[SUCoreActivity mediaPlayingPredicate:](SUCoreActivity, "mediaPlayingPredicate:", -[SUCoreActivity mediaPlayingState](self, "mediaPlayingState") != 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v19);

  }
  objc_msgSend(MEMORY[0x1E0D15C88], "andPredicateWithSubpredicates:", v3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v20)
  {
    v22 = v20;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "oslog");
    v24 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v26 = 138543362;
      v27 = self;
      _os_log_impl(&dword_1DDFDD000, v24, OS_LOG_TYPE_DEFAULT, "Failed to create _CDContextualPredicate for SUActivity: %{public}@", (uint8_t *)&v26, 0xCu);
    }

  }
  return v21;
}

- (id)_stringForTriState:(int)a3
{
  if (a3 > 2)
    return CFSTR("UNKNOWN");
  else
    return off_1EA879438[a3];
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v15 = (id)MEMORY[0x1E0CB3940];
  -[SUCoreActivity activityName](self, "activityName");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreActivity UUID](self, "UUID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB3578];
  -[SUCoreActivity runDate](self, "runDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringFromDate:dateStyle:timeStyle:", v17, 1, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreActivity batteryLevelLessThan](self, "batteryLevelLessThan");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreActivity batteryLevelLessThan](self, "batteryLevelLessThan");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreActivity _stringForTriState:](self, "_stringForTriState:", -[SUCoreActivity plugInState](self, "plugInState"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreActivity _stringForTriState:](self, "_stringForTriState:", -[SUCoreActivity screenOnState](self, "screenOnState"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreActivity _stringForTriState:](self, "_stringForTriState:", -[SUCoreActivity networkState](self, "networkState"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreActivity _stringForTriState:](self, "_stringForTriState:", -[SUCoreActivity wifiState](self, "wifiState"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreActivity _stringForTriState:](self, "_stringForTriState:", -[SUCoreActivity phoneCallState](self, "phoneCallState"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreActivity _stringForTriState:](self, "_stringForTriState:", -[SUCoreActivity carplayState](self, "carplayState"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreActivity _stringForTriState:](self, "_stringForTriState:", -[SUCoreActivity mediaPlayingState](self, "mediaPlayingState"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreActivity _stringForTriState:](self, "_stringForTriState:", -[SUCoreActivity waking](self, "waking"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("\n            ActivityName:       %@\n            UUID:               %@\n            runDate:            %@\n            batteryLevelGT:     %@\n            batteryLevelLT:     %@\n            plugInState:        %@\n            screenOnState:      %@\n            networkState:       %@\n            wifiState:          %@\n            phonecallState:     %@\n            carplayState:       %@\n            mediaPlayingState:  %@\n            waking:             %@\n"), v20, v19, v18, v4, v14, v5, v6, v7, v8, v9, v10, v11, v12);
  v16 = (id)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  SUCoreActivity *v4;
  SUCoreActivity *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  int v24;
  void *v25;
  int v26;
  int v27;
  void *v28;
  int v29;
  int v30;
  int v31;
  int v32;
  int v33;
  BOOL v34;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;

  v4 = (SUCoreActivity *)a3;
  if (v4 == self)
  {
    v34 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = (void *)MEMORY[0x1E0DA8920];
      -[SUCoreActivity activityName](self, "activityName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreActivity activityName](v5, "activityName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v6, "stringIsEqual:to:", v7, v8))
      {
        v34 = 0;
LABEL_29:

        goto LABEL_30;
      }
      v9 = (void *)MEMORY[0x1E0DA8920];
      -[SUCoreActivity UUID](self, "UUID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreActivity UUID](v5, "UUID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v9, "stringIsEqual:to:", v10, v11))
      {
        v34 = 0;
LABEL_28:

        goto LABEL_29;
      }
      v12 = (void *)MEMORY[0x1E0DA8920];
      -[SUCoreActivity runDate](self, "runDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreActivity runDate](v5, "runDate");
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = v12;
      v16 = (void *)v14;
      if (!objc_msgSend(v15, "dateIsEqual:to:", v13))
      {
        v34 = 0;
        v25 = v16;
LABEL_27:

        goto LABEL_28;
      }
      v40 = v10;
      v38 = v13;
      v17 = (void *)MEMORY[0x1E0DA8920];
      -[SUCoreActivity batteryLevelGreaterThan](self, "batteryLevelGreaterThan");
      v18 = objc_claimAutoreleasedReturnValue();
      -[SUCoreActivity batteryLevelGreaterThan](v5, "batteryLevelGreaterThan");
      v19 = objc_claimAutoreleasedReturnValue();
      v39 = (void *)v18;
      v20 = v18;
      v21 = (void *)v19;
      if (!objc_msgSend(v17, "numberIsEqual:to:", v20))
      {
        v34 = 0;
        v13 = v38;
        v25 = v16;
LABEL_26:

        v10 = v40;
        goto LABEL_27;
      }
      v22 = (void *)MEMORY[0x1E0DA8920];
      -[SUCoreActivity batteryLevelLessThan](self, "batteryLevelLessThan");
      v23 = objc_claimAutoreleasedReturnValue();
      -[SUCoreActivity batteryLevelLessThan](v5, "batteryLevelLessThan");
      v36 = (void *)v23;
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v22, "numberIsEqual:to:", v23))
      {
        v24 = -[SUCoreActivity plugInState](self, "plugInState");
        v25 = v16;
        if (v24 == -[SUCoreActivity plugInState](v5, "plugInState"))
        {
          v26 = -[SUCoreActivity screenOnState](self, "screenOnState");
          if (v26 == -[SUCoreActivity screenOnState](v5, "screenOnState"))
          {
            v27 = -[SUCoreActivity networkState](self, "networkState");
            v28 = v36;
            if (v27 == -[SUCoreActivity networkState](v5, "networkState")
              && (v29 = -[SUCoreActivity wifiState](self, "wifiState"),
                  v29 == -[SUCoreActivity wifiState](v5, "wifiState"))
              && (v30 = -[SUCoreActivity waking](self, "waking"), v30 == -[SUCoreActivity waking](v5, "waking"))
              && (v31 = -[SUCoreActivity phoneCallState](self, "phoneCallState"),
                  v31 == -[SUCoreActivity phoneCallState](v5, "phoneCallState"))
              && (v32 = -[SUCoreActivity carplayState](self, "carplayState"),
                  v32 == -[SUCoreActivity carplayState](v5, "carplayState")))
            {
              v33 = -[SUCoreActivity mediaPlayingState](self, "mediaPlayingState");
              v34 = v33 == -[SUCoreActivity mediaPlayingState](v5, "mediaPlayingState");
            }
            else
            {
              v34 = 0;
            }
            v13 = v38;
            goto LABEL_25;
          }
        }
        v34 = 0;
        v13 = v38;
      }
      else
      {
        v34 = 0;
        v13 = v38;
        v25 = v16;
      }
      v28 = v36;
LABEL_25:

      goto LABEL_26;
    }
    v34 = 0;
  }
LABEL_30:

  return v34;
}

+ (id)pluggedInPredicate:(BOOL)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  uint8_t v9[16];

  objc_msgSend(MEMORY[0x1E0D15C50], "predicateForPluginStatus:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "oslog");
    v7 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1DDFDD000, v7, OS_LOG_TYPE_DEFAULT, "Failed to create plugged in _CDContextualPredicate", v9, 2u);
    }

  }
  return v4;
}

+ (id)networkPredicate:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  uint8_t v13[8];
  _QWORD v14[3];

  v3 = a3;
  v14[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D15C50], "predicateForCellConnectionAvailability:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15C50], "predicateForWiFiConnectionAvailability:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0D15C88];
  v14[0] = v4;
  v14[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "orPredicateWithSubpredicates:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = v8;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "oslog");
    v11 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_1DDFDD000, v11, OS_LOG_TYPE_DEFAULT, "Failed to create network available _CDContextualPredicate", v13, 2u);
    }

  }
  return v8;
}

+ (id)wifiAvailablePredicate:(BOOL)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  uint8_t v9[16];

  objc_msgSend(MEMORY[0x1E0D15C50], "predicateForWiFiConnectionAvailability:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "oslog");
    v7 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1DDFDD000, v7, OS_LOG_TYPE_DEFAULT, "Failed to create wifi available _CDContextualPredicate", v9, 2u);
    }

  }
  return v4;
}

+ (id)backlightOnPredicate:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D15C50], "keyPathForBacklightOnStatus");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_predicateForKeyPath:equalToValue:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)phoneCallPredicate:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  NSObject *v16;
  uint8_t v18[8];
  _QWORD v19[3];

  v3 = a3;
  v19[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D15C50], "keyPathForCallInProgressStatus");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_predicateForKeyPath:equalToValue:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D15C50], "keyPathForCallInProgressStatus");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_predicateForKeyPath:equalToValue:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0D15C88];
  v19[0] = v7;
  v19[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "orPredicateWithSubpredicates:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = v13;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "oslog");
    v16 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_1DDFDD000, v16, OS_LOG_TYPE_DEFAULT, "Failed to create call in progress _CDContextualPredicate", v18, 2u);
    }

  }
  return v13;
}

+ (id)batteryLevelPredicateGreaterThan:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  uint8_t buf[16];

  v3 = (void *)MEMORY[0x1E0D15C88];
  v4 = (void *)MEMORY[0x1E0D15C50];
  v5 = a3;
  objc_msgSend(v4, "keyPathForBatteryLevel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15C50], "keyPathForBatteryLevel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateForKeyPath:withFormat:", v6, CFSTR("self.%@.value > %@"), v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = v8;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "oslog");
    v11 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DDFDD000, v11, OS_LOG_TYPE_DEFAULT, "Failed to create battery level greater than _CDContextualPredicate", buf, 2u);
    }

  }
  return v8;
}

+ (id)batteryLevelPredicateLessThan:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  uint8_t buf[16];

  v3 = (void *)MEMORY[0x1E0D15C88];
  v4 = (void *)MEMORY[0x1E0D15C50];
  v5 = a3;
  objc_msgSend(v4, "keyPathForBatteryLevel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15C50], "keyPathForBatteryLevel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateForKeyPath:withFormat:", v6, CFSTR("self.%@.value < %@"), v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = v8;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "oslog");
    v11 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DDFDD000, v11, OS_LOG_TYPE_DEFAULT, "Failed to create battery level less than _CDContextualPredicate", buf, 2u);
    }

  }
  return v8;
}

+ (id)carplayPredicate:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D15C50], "keyPathForCarplayConnectedStatus");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_predicateForKeyPath:equalToValue:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)systemDatePredicate:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  uint8_t v9[16];

  objc_msgSend(MEMORY[0x1E0D15C50], "predicateForSystemTime:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "oslog");
    v7 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1DDFDD000, v7, OS_LOG_TYPE_DEFAULT, "Failed to create system date _CDContextualPredicate", v9, 2u);
    }

  }
  return v4;
}

+ (id)mediaPlayingPredicate:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D15C50], "keyPathForMediaPlayingStatus");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_predicateForKeyPath:equalToValue:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)_predicateForKeyPath:(id)a3 equalToValue:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0D15C88], "predicateForKeyPath:equalToValue:", v5, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "oslog");
    v10 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "description");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v11;
      _os_log_impl(&dword_1DDFDD000, v10, OS_LOG_TYPE_DEFAULT, "Failed to create _CDContextualPredicate for keyPath: %{public}@", (uint8_t *)&v13, 0xCu);

    }
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SUCoreActivity)initWithCoder:(id)a3
{
  id v4;
  SUCoreActivity *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SUCoreActivity;
  v5 = -[SUCoreActivity init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("activityKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreActivity setActivityName:](v5, "setActivityName:", v6);

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("uuid"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreActivity setUUID:](v5, "setUUID:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("runDate"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreActivity setRunDate:](v5, "setRunDate:", v8);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("batteryLessThan"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreActivity setBatteryLevelGreaterThan:](v5, "setBatteryLevelGreaterThan:", v9);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("batteryGreaterThan"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreActivity setBatteryLevelLessThan:](v5, "setBatteryLevelLessThan:", v10);

    -[SUCoreActivity setWaking:](v5, "setWaking:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("waking")));
    -[SUCoreActivity setPlugInState:](v5, "setPlugInState:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("plugInState")));
    -[SUCoreActivity setScreenOnState:](v5, "setScreenOnState:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("screenOn")));
    -[SUCoreActivity setNetworkState:](v5, "setNetworkState:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("network")));
    -[SUCoreActivity setWifiState:](v5, "setWifiState:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("wifi")));
    -[SUCoreActivity setPhoneCallState:](v5, "setPhoneCallState:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("phoneCall")));
    -[SUCoreActivity setCarplayState:](v5, "setCarplayState:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("carplay")));
    -[SUCoreActivity setMediaPlayingState:](v5, "setMediaPlayingState:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("media")));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[SUCoreActivity activityName](self, "activityName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v4, CFSTR("activityKey"));

  -[SUCoreActivity UUID](self, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v5, CFSTR("uuid"));

  -[SUCoreActivity runDate](self, "runDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v6, CFSTR("runDate"));

  -[SUCoreActivity batteryLevelGreaterThan](self, "batteryLevelGreaterThan");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v7, CFSTR("batteryGreaterThan"));

  -[SUCoreActivity batteryLevelLessThan](self, "batteryLevelLessThan");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v8, CFSTR("batteryLessThan"));

  objc_msgSend(v9, "encodeInteger:forKey:", -[SUCoreActivity waking](self, "waking"), CFSTR("waking"));
  objc_msgSend(v9, "encodeInteger:forKey:", -[SUCoreActivity plugInState](self, "plugInState"), CFSTR("plugInState"));
  objc_msgSend(v9, "encodeInteger:forKey:", -[SUCoreActivity screenOnState](self, "screenOnState"), CFSTR("screenOn"));
  objc_msgSend(v9, "encodeInteger:forKey:", -[SUCoreActivity networkState](self, "networkState"), CFSTR("network"));
  objc_msgSend(v9, "encodeInteger:forKey:", -[SUCoreActivity wifiState](self, "wifiState"), CFSTR("wifi"));
  objc_msgSend(v9, "encodeInteger:forKey:", -[SUCoreActivity phoneCallState](self, "phoneCallState"), CFSTR("phoneCall"));
  objc_msgSend(v9, "encodeInteger:forKey:", -[SUCoreActivity carplayState](self, "carplayState"), CFSTR("carplay"));
  objc_msgSend(v9, "encodeInteger:forKey:", -[SUCoreActivity mediaPlayingState](self, "mediaPlayingState"), CFSTR("media"));

}

- (id)copyWithZone:(_NSZone *)a3
{
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
  void *v15;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[SUCoreActivity activityName](self, "activityName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setActivityName:", v7);

  -[SUCoreActivity UUID](self, "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copyWithZone:", a3);
  objc_msgSend(v5, "setUUID:", v9);

  -[SUCoreActivity runDate](self, "runDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copyWithZone:", a3);
  objc_msgSend(v5, "setRunDate:", v11);

  -[SUCoreActivity batteryLevelGreaterThan](self, "batteryLevelGreaterThan");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "copyWithZone:", a3);
  objc_msgSend(v5, "setBatteryLevelGreaterThan:", v13);

  -[SUCoreActivity batteryLevelLessThan](self, "batteryLevelLessThan");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "copyWithZone:", a3);
  objc_msgSend(v5, "setBatteryLevelLessThan:", v15);

  objc_msgSend(v5, "setWaking:", -[SUCoreActivity waking](self, "waking"));
  objc_msgSend(v5, "setPlugInState:", -[SUCoreActivity plugInState](self, "plugInState"));
  objc_msgSend(v5, "setScreenOnState:", -[SUCoreActivity screenOnState](self, "screenOnState"));
  objc_msgSend(v5, "setNetworkState:", -[SUCoreActivity networkState](self, "networkState"));
  objc_msgSend(v5, "setWifiState:", -[SUCoreActivity wifiState](self, "wifiState"));
  objc_msgSend(v5, "setPhoneCallState:", -[SUCoreActivity phoneCallState](self, "phoneCallState"));
  objc_msgSend(v5, "setCarplayState:", -[SUCoreActivity carplayState](self, "carplayState"));
  objc_msgSend(v5, "setMediaPlayingState:", -[SUCoreActivity mediaPlayingState](self, "mediaPlayingState"));
  return v5;
}

- (NSString)activityName
{
  return self->_activityName;
}

- (void)setActivityName:(id)a3
{
  objc_storeStrong((id *)&self->_activityName, a3);
}

- (NSString)UUID
{
  return self->_UUID;
}

- (void)setUUID:(id)a3
{
  objc_storeStrong((id *)&self->_UUID, a3);
}

- (NSDate)runDate
{
  return self->_runDate;
}

- (void)setRunDate:(id)a3
{
  objc_storeStrong((id *)&self->_runDate, a3);
}

- (NSNumber)batteryLevelGreaterThan
{
  return self->_batteryLevelGreaterThan;
}

- (void)setBatteryLevelGreaterThan:(id)a3
{
  objc_storeStrong((id *)&self->_batteryLevelGreaterThan, a3);
}

- (NSNumber)batteryLevelLessThan
{
  return self->_batteryLevelLessThan;
}

- (void)setBatteryLevelLessThan:(id)a3
{
  objc_storeStrong((id *)&self->_batteryLevelLessThan, a3);
}

- (int)plugInState
{
  return self->_plugInState;
}

- (void)setPlugInState:(int)a3
{
  self->_plugInState = a3;
}

- (int)screenOnState
{
  return self->_screenOnState;
}

- (void)setScreenOnState:(int)a3
{
  self->_screenOnState = a3;
}

- (int)networkState
{
  return self->_networkState;
}

- (void)setNetworkState:(int)a3
{
  self->_networkState = a3;
}

- (int)wifiState
{
  return self->_wifiState;
}

- (void)setWifiState:(int)a3
{
  self->_wifiState = a3;
}

- (int)phoneCallState
{
  return self->_phoneCallState;
}

- (void)setPhoneCallState:(int)a3
{
  self->_phoneCallState = a3;
}

- (int)carplayState
{
  return self->_carplayState;
}

- (void)setCarplayState:(int)a3
{
  self->_carplayState = a3;
}

- (int)mediaPlayingState
{
  return self->_mediaPlayingState;
}

- (void)setMediaPlayingState:(int)a3
{
  self->_mediaPlayingState = a3;
}

- (int)waking
{
  return self->_waking;
}

- (void)setWaking:(int)a3
{
  self->_waking = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_batteryLevelLessThan, 0);
  objc_storeStrong((id *)&self->_batteryLevelGreaterThan, 0);
  objc_storeStrong((id *)&self->_runDate, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_activityName, 0);
}

@end
