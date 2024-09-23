@implementation PSRootController

- (id)aggregateDictionaryPath
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char **v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  char **v27;
  void *v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if ((PSIsRunningInAssistant() & 1) != 0)
    return 0;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v5 = (void *)MEMORY[0x1E0C99DE8];
  -[PSRootController viewControllers](self, "viewControllers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3500], "letterCharacterSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "invertedSet");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = &selRef_categoryLimit;
  v11 = objc_msgSend(v9, "conformsToProtocol:", &unk_1EE6E3CA8);

  if (v11)
  {
    objc_msgSend(v7, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "specifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("id"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
      objc_msgSend(v7, "removeObject:", v12);

  }
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v15 = v7;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v33;
    v30 = CFSTR("id");
    while (2)
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v33 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        if (objc_msgSend(v20, "conformsToProtocol:", v10[190], v30))
        {
          v21 = v4;
          v22 = v20;
          objc_msgSend(v22, "specifier");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "objectForKeyedSubscript:", v30);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v24, "lastPathComponent");
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v25
            || objc_msgSend(v25, "rangeOfString:options:", CFSTR("[0-9A-F]{8}-[0-9A-F]{4}-[0-9A-F]{4}-[0-9A-F]{4}-[0-9A-F]{12}"), 1025) != 0x7FFFFFFFFFFFFFFFLL)
          {

            v29 = 0;
            v4 = v21;
            goto LABEL_20;
          }
          objc_msgSend(v25, "stringByReplacingCharactersInSet:withCharacter:", v31, 95);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "lowercaseString");
          v27 = v10;
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          v4 = v21;
          objc_msgSend(v21, "addObject:", v28);

          v10 = v27;
        }
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      if (v17)
        continue;
      break;
    }
  }

  objc_msgSend(v4, "componentsJoinedByString:", CFSTR("."));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_20:

  return v29;
}

- (void)logSettingsPath
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_fault_impl(&dword_1A3819000, a2, OS_LOG_TYPE_FAULT, "logSettingsPath \"%{public}@\": PSViewController's PSIDKey == nil AND identifier == nil. This breaks Settings' Search.", (uint8_t *)&v2, 0xCu);
}

- (PSRootController)initWithTitle:(id)a3 identifier:(id)a4
{
  id v5;
  NSObject *v6;
  PSRootController *v7;
  PSRootController *v8;
  objc_super v10;
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _PSLoggingFacility();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v12 = "-[PSRootController initWithTitle:identifier:]";
    _os_log_impl(&dword_1A3819000, v6, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v10.receiver = self;
  v10.super_class = (Class)PSRootController;
  v7 = -[PSRootController init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    -[PSRootController setTitle:](v7, "setTitle:", v5);
    -[PSRootController commonInit](v8, "commonInit");
  }

  return v8;
}

- (void)commonInit
{
  void *v3;
  void *v4;
  void *v5;
  NSMutableSet *v6;
  NSMutableSet *tasks;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_sendWillBecomeActive, *MEMORY[0x1E0CEB270], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel_sendWillResignActive, *MEMORY[0x1E0CEB358], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_statusBarWillChangeHeight_, *MEMORY[0x1E0CEB348], 0);

  v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
  tasks = self->_tasks;
  self->_tasks = v6;

  -[PSRootController setDelegate:](self, "setDelegate:", self);
}

- (void)sendWillBecomeActive
{
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  _PSLoggingFacility();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[PSRootController sendWillBecomeActive]";
    _os_log_impl(&dword_1A3819000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }

  -[PSRootController willBecomeActive](self, "willBecomeActive");
  -[PSRootController viewControllers](self, "viewControllers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", &__block_literal_global_141);

}

+ (id)readPreferenceValue:(id)a3
{
  id v3;
  __CFString *v4;
  void *v5;
  uint64_t v6;
  __CFString *v7;
  BOOL v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  BOOL v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  uint64_t v29;

  v3 = a3;
  objc_msgSend(v3, "propertyForKey:", CFSTR("defaults"));
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "propertyForKey:", CFSTR("containerBundleID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "propertyForKey:", CFSTR("key"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (__CFString *)v6;
  if (v4)
    v8 = v6 == 0;
  else
    v8 = 1;
  if (v8)
    goto LABEL_6;
  if (!-[__CFString isEqualToString:](v4, "isEqualToString:", CFSTR("STANDARD")))
  {
    objc_msgSend(v3, "propertyForKey:", CFSTR("isPerGizmo"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "BOOLValue");

    if (v16)
    {
      v17 = (void *)objc_msgSend(objc_alloc((Class)getNPSDomainAccessorClass()), "initWithDomain:", v4);
      v18 = v17;
      if (v17)
      {
        objc_msgSend(v17, "objectForKey:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        NSLog(CFSTR("Failed to instantiate NPSDomainAccessor for domain: (%@)"), v4);
        v9 = 0;
      }
    }
    else
    {
      objc_msgSend(v3, "propertyForKey:", CFSTR("appGroupBundleID"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
        v20 = v5 == 0;
      else
        v20 = 1;
      if (v20)
      {
        if (!v5)
        {
          v9 = (void *)CFPreferencesCopyValue(v7, v4, (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
          if (!v9)
          {
LABEL_25:
            objc_msgSend(v3, "propertyForKey:", CFSTR("default"));
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v9)
              goto LABEL_33;
          }
LABEL_29:
          objc_msgSend(v3, "propertyForKey:", CFSTR("negate"));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v27, "BOOLValue");

          if (v28)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v9, "BOOLValue") ^ 1);
            v29 = objc_claimAutoreleasedReturnValue();

            v9 = (void *)v29;
          }
          objc_msgSend(v3, "setProperty:forKey:", v9, CFSTR("value"));
          goto LABEL_32;
        }
        objc_msgSend(MEMORY[0x1E0CA5860], "applicationProxyForIdentifier:placeholder:", v5, 0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "dataContainerURL");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "path");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        v9 = (void *)_CFPreferencesCopyAppValueWithContainer();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CA5860], "applicationProxyForIdentifier:", v4);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "groupContainerURLs");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "propertyForKey:", CFSTR("appGroupBundleID"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "objectForKey:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "path");
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        v9 = (void *)_CFPreferencesCopyAppValueWithContainer();
      }
    }

    if (!v9)
      goto LABEL_25;
    goto LABEL_29;
  }
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v7);
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10 || (objc_msgSend(v3, "propertyForKey:", CFSTR("default")), (v10 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v11 = (void *)v10;
    objc_msgSend(v3, "propertyForKey:", CFSTR("negate"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "BOOLValue");

    if (v13)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v11, "BOOLValue") ^ 1);
      v14 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)v14;
    }
    objc_msgSend(v3, "setProperty:forKey:", v11, CFSTR("value"));

LABEL_32:
    objc_msgSend(v3, "propertyForKey:", CFSTR("value"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_33;
  }

LABEL_6:
  v9 = 0;
LABEL_33:

  return v9;
}

+ (void)writePreference:(id)a3
{
  id v3;
  __CFString *v4;
  __CFString *v5;
  void *v6;
  BOOL v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  const __CFString *v27;
  const __CFString *v28;
  void *v29;
  int v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v40;
  int v41;
  uint8_t buf[8];
  uint64_t v43;
  PSSetupController *(*v44)(uint64_t);
  void *v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;
  _QWORD v51[2];

  v51[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "propertyForKey:", CFSTR("key"));
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "propertyForKey:", CFSTR("defaults"));
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "propertyForKey:", CFSTR("containerBundleID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v7 = v4 == 0;
  else
    v7 = 1;
  if (v7)
  {
    _PSLoggingFacility();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A3819000, v8, OS_LOG_TYPE_DEFAULT, "writePreference: bad dictionary", buf, 2u);
    }
  }
  else
  {
    objc_msgSend(v3, "propertyForKey:", CFSTR("value"));
    v9 = objc_claimAutoreleasedReturnValue();
    v8 = v9;
    if (v9
      || (objc_msgSend(v3, "propertyForKey:", CFSTR("default")),
          (v8 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_msgSend(v3, "propertyForKey:", CFSTR("negate"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "BOOLValue");

      if (v11)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[NSObject BOOLValue](v8, "BOOLValue") ^ 1);
        v12 = objc_claimAutoreleasedReturnValue();

        v8 = v12;
      }
      if (-[__CFString isEqualToString:](v5, "isEqualToString:", CFSTR("STANDARD")))
      {
        objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKey:", v8, v4);
        objc_msgSend(v13, "synchronize");

      }
      else
      {
        objc_msgSend(v3, "propertyForKey:", CFSTR("isPerGizmo"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "BOOLValue");

        v41 = v15;
        if (v15)
        {
          v16 = (void *)objc_msgSend(objc_alloc((Class)getNPSDomainAccessorClass()), "initWithDomain:", v5);
          v17 = v16;
          if (v16)
          {
            objc_msgSend(v16, "setObject:forKey:", v8, v4);
            v18 = (id)objc_msgSend(v17, "synchronize");
          }
          else
          {
            NSLog(CFSTR("Failed to instantiate NPSDomainAccessor for domain: (%@)"), v5);
          }

        }
        else
        {
          objc_msgSend(v3, "propertyForKey:", CFSTR("appGroupBundleID"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (v19 && v6)
          {
            objc_msgSend(MEMORY[0x1E0CA5860], "applicationProxyForIdentifier:", v5);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "groupContainerURLs");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "propertyForKey:", CFSTR("appGroupBundleID"));
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "objectForKey:", v21);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "path");
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            _CFPreferencesSetAppValueWithContainer();
            _CFPreferencesAppSynchronizeWithContainer();

          }
          else
          {
            if (v6)
            {
              objc_msgSend(MEMORY[0x1E0CA5860], "applicationProxyForIdentifier:", v6);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "dataContainerURL");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "path");
              v26 = (void *)objc_claimAutoreleasedReturnValue();

              _CFPreferencesSetAppValueWithContainer();
              _CFPreferencesAppSynchronizeWithContainer();

            }
            else
            {
              v27 = (const __CFString *)*MEMORY[0x1E0C9B260];
              v28 = (const __CFString *)*MEMORY[0x1E0C9B230];
              CFPreferencesSetValue(v4, v8, v5, (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
              CFPreferencesSynchronize(v5, v27, v28);
            }
            GSSendAppPreferencesChanged();
          }
        }
        objc_msgSend(v3, "propertyForKey:", CFSTR("notifyNano"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v29, "BOOLValue");

        if (v30)
        {
          v47 = 0;
          v48 = &v47;
          v49 = 0x2050000000;
          v31 = (void *)getNPSManagerClass_softClass;
          v50 = getNPSManagerClass_softClass;
          if (!getNPSManagerClass_softClass)
          {
            *(_QWORD *)buf = MEMORY[0x1E0C809B0];
            v43 = 3221225472;
            v44 = __getNPSManagerClass_block_invoke;
            v45 = &unk_1E4A65650;
            v46 = &v47;
            __getNPSManagerClass_block_invoke((uint64_t)buf);
            v31 = (void *)v48[3];
          }
          v32 = objc_retainAutorelease(v31);
          _Block_object_dispose(&v47, 8);
          v33 = (void *)objc_opt_new();
          if (v41)
          {
            v34 = (void *)MEMORY[0x1E0C99E60];
            v51[0] = v4;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 1);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "setWithArray:", v35);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "synchronizeNanoDomain:keys:", v5, v36);
          }
          else
          {
            objc_msgSend(v3, "propertyForKey:", CFSTR("containerBundleID"));
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "propertyForKey:", CFSTR("appGroupBundleID"));
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v4);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "synchronizeUserDefaultsDomain:keys:container:appGroupContainer:", v5, v37, v35, v36);

          }
        }
      }
      objc_msgSend(v3, "propertyForKey:", CFSTR("PostNotification"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      if (v38)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)objc_msgSend(v3, "propertyForKey:", CFSTR("PostNotification")), 0, 0, 1u);
      }
    }
  }

}

+ (void)setPreferenceValue:(id)a3 specifier:(id)a4
{
  id v5;
  void *v6;
  char v7;
  id v8;

  v8 = a3;
  v5 = a4;
  if (v8)
  {
    objc_msgSend(v5, "propertyForKey:", CFSTR("value"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "isEqual:", v6);

    if ((v7 & 1) == 0)
    {
      objc_msgSend(v5, "setProperty:forKey:", v8, CFSTR("value"));
      +[PSRootController writePreference:](PSRootController, "writePreference:", v5);
    }
  }

}

- (void)setPreferenceValue:(id)a3 specifier:(id)a4
{
  +[PSRootController setPreferenceValue:specifier:](PSRootController, "setPreferenceValue:specifier:", a3, a4);
}

- (id)readPreferenceValue:(id)a3
{
  return +[PSRootController readPreferenceValue:](PSRootController, "readPreferenceValue:", a3);
}

- (PSRootController)initWithCoder:(id)a3
{
  id v4;
  NSObject *v5;
  PSRootController *v6;
  objc_super v8;
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _PSLoggingFacility();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v10 = "-[PSRootController initWithCoder:]";
    _os_log_impl(&dword_1A3819000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v8.receiver = self;
  v8.super_class = (Class)PSRootController;
  v6 = -[PSRootController initWithCoder:](&v8, sel_initWithCoder_, v4);

  if (v6)
    -[PSRootController commonInit](v6, "commonInit");
  return v6;
}

- (PSRootController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  NSObject *v7;
  PSRootController *v8;
  PSRootController *v9;
  objc_super v11;
  uint8_t buf[4];
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  _PSLoggingFacility();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v13 = "-[PSRootController initWithNavigationBarClass:toolbarClass:]";
    _os_log_impl(&dword_1A3819000, v7, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v11.receiver = self;
  v11.super_class = (Class)PSRootController;
  v8 = -[PSRootController initWithNavigationBarClass:toolbarClass:](&v11, sel_initWithNavigationBarClass_toolbarClass_, a3, a4);
  v9 = v8;
  if (v8)
    -[PSRootController commonInit](v8, "commonInit");
  return v9;
}

- (PSRootController)initWithRootViewController:(id)a3
{
  id v4;
  NSObject *v5;
  PSRootController *v6;
  objc_super v8;
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _PSLoggingFacility();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v10 = "-[PSRootController initWithRootViewController:]";
    _os_log_impl(&dword_1A3819000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v8.receiver = self;
  v8.super_class = (Class)PSRootController;
  v6 = -[PSRootController initWithRootViewController:](&v8, sel_initWithRootViewController_, v4);

  if (v6)
    -[PSRootController commonInit](v6, "commonInit");
  return v6;
}

- (id)tasksDescription
{
  void *v3;
  NSMutableSet *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_tasks;
  v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "description");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("%@\n"), v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (BOOL)taskIsRunning:(id)a3
{
  return -[NSMutableSet containsObject:](self->_tasks, "containsObject:", a3);
}

- (void)addTask:(id)a3
{
  id v4;

  v4 = a3;
  -[PSRootController busy](self, "busy");
  -[NSMutableSet addObject:](self->_tasks, "addObject:", v4);

}

- (void)taskFinished:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[NSMutableSet removeObject:](self->_tasks, "removeObject:", a3);
  if (!-[PSRootController busy](self, "busy"))
  {
    objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "performSelector:withObject:afterDelay:", sel_controllerFinished_, self, 0.001);

    }
  }
}

- (BOOL)busy
{
  return -[NSMutableSet count](self->_tasks, "count") != 0;
}

- (id)contentViewForTopController
{
  void *v3;
  void *v4;
  void *v5;

  -[PSRootController topViewController](self, "topViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = self;
  objc_msgSend(v3, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)specifiers
{
  return 0;
}

- (void)setSpecifier:(id)a3
{
  PSSpecifier *v5;
  PSSpecifier *v6;

  v5 = (PSSpecifier *)a3;
  if (self->_specifier != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_specifier, a3);
    v5 = v6;
  }

}

- (id)specifier
{
  return self->_specifier;
}

- (void)showController:(id)a3
{
  -[PSRootController showController:animate:](self, "showController:animate:", a3, 0);
}

- (void)showController:(id)a3 animate:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;

  v4 = a4;
  v6 = a3;
  -[PSRootController childViewControllers](self, "childViewControllers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "containsObject:", v6))
  {
    _PSLoggingFacility();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[PSRootController showController:animate:].cold.3(v8);

    _PSLoggingFacility();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[PSViewController showController:animate:].cold.2();

    _PSLoggingFacility();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[PSViewController showController:animate:].cold.1();

  }
  if (objc_msgSend(v6, "conformsToProtocol:", &unk_1EE6E3CA8))
  {
    objc_msgSend(v6, "setParentController:", self);
    objc_msgSend(v6, "setRootController:", self);
  }
  if (v4)
    -[PSRootController showViewController:sender:](self, "showViewController:sender:", v6, self);
  else
    -[PSRootController pushViewController:animated:](self, "pushViewController:animated:", v6, 0);

}

- (void)handleURL:(id)a3 withCompletion:(id)a4
{
  void *v6;
  id v7;

  v7 = a4;
  -[PSRootController handleURL:](self, "handleURL:", a3);
  v6 = v7;
  if (v7)
  {
    (*((void (**)(id))v7 + 2))(v7);
    v6 = v7;
  }

}

- (void)showLeftButton:(id)a3 withStyle:(int64_t)a4 rightButton:(id)a5 withStyle:(int64_t)a6
{
  objc_class *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v10 = (objc_class *)MEMORY[0x1E0CEA380];
  v11 = a5;
  v12 = a3;
  v18 = objc_alloc_init(v10);
  objc_msgSend(v18, "setTitle:", v12);

  objc_msgSend(v18, "setStyle:", a4);
  v13 = objc_alloc_init(MEMORY[0x1E0CEA380]);
  objc_msgSend(v13, "setTitle:", v11);

  objc_msgSend(v13, "setStyle:", a6);
  -[PSRootController navigationBar](self, "navigationBar");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "topItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setRightBarButtonItem:", v13);

  -[PSRootController navigationBar](self, "navigationBar");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "topItem");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setLeftBarButtonItem:", v18);

}

- (void)statusBarWillChangeHeight:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "statusBar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0CEB310]);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v6)
    v9 = v7 == 0;
  else
    v9 = 1;
  if (!v9)
  {
    v24 = v4;
    objc_msgSend(v6, "frame");
    v11 = v10;
    objc_msgSend(v6, "frame");
    if (v11 >= v12)
      v13 = v12;
    else
      v13 = v11;
    objc_msgSend(v8, "CGRectValue");
    v15 = v14;
    objc_msgSend(v8, "CGRectValue");
    v25 = 0u;
    v26 = 0u;
    if (v15 >= v16)
      v15 = v16;
    v27 = 0uLL;
    v28 = 0uLL;
    -[PSRootController viewControllers](self, "viewControllers");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v18)
    {
      v19 = v18;
      v20 = v13 - v15;
      v21 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v26 != v21)
            objc_enumerationMutation(v17);
          v23 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          if (objc_msgSend(v23, "conformsToProtocol:", &unk_1EE6E3CA8)
            && (objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend(v23, "statusBarWillAnimateByHeight:", v20);
          }
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v19);
    }

    v4 = v24;
  }

}

- (void)sendWillResignActive
{
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  _PSLoggingFacility();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[PSRootController sendWillResignActive]";
    _os_log_impl(&dword_1A3819000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }

  -[PSRootController willResignActive](self, "willResignActive");
  -[PSRootController viewControllers](self, "viewControllers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", &__block_literal_global_9);

}

void __40__PSRootController_sendWillResignActive__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (objc_msgSend(v2, "conformsToProtocol:", &unk_1EE6E3CA8) && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "willResignActive");

}

void __40__PSRootController_sendWillBecomeActive__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (objc_msgSend(v2, "conformsToProtocol:", &unk_1EE6E3CA8) && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "willBecomeActive");

}

- (void)setSupportedInterfaceOrientations:(unint64_t)a3
{
  self->_supportedOrientationsOverride = a3;
}

- (unint64_t)supportedInterfaceOrientations
{
  unint64_t result;

  result = self->_supportedOrientationsOverride;
  if (!result)
    return PSSupportedOrientations();
  return result;
}

- (void)suspend
{
  id v2;

  -[PSRootController viewControllers](self, "viewControllers");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", &__block_literal_global_143);

}

void __27__PSRootController_suspend__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (objc_msgSend(v2, "conformsToProtocol:", &unk_1EE6E3CA8) && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "suspend");

}

- (void)didLock
{
  id v2;

  -[PSRootController viewControllers](self, "viewControllers");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", &__block_literal_global_145);

}

void __27__PSRootController_didLock__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (objc_msgSend(v2, "conformsToProtocol:", &unk_1EE6E3CA8) && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "didLock");

}

- (void)willUnlock
{
  id v2;

  -[PSRootController viewControllers](self, "viewControllers");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", &__block_literal_global_147);

}

void __30__PSRootController_willUnlock__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (objc_msgSend(v2, "conformsToProtocol:", &unk_1EE6E3CA8) && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "willUnlock");

}

- (void)didUnlock
{
  id v2;

  -[PSRootController viewControllers](self, "viewControllers");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", &__block_literal_global_149);

}

void __29__PSRootController_didUnlock__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (objc_msgSend(v2, "conformsToProtocol:", &unk_1EE6E3CA8) && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "didUnlock");

}

- (void)didWake
{
  id v2;

  -[PSRootController viewControllers](self, "viewControllers");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", &__block_literal_global_151);

}

void __27__PSRootController_didWake__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (objc_msgSend(v2, "conformsToProtocol:", &unk_1EE6E3CA8) && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "didWake");

}

- (BOOL)deallocating
{
  return self->_deallocating;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  objc_super v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  self->_deallocating = 1;
  if (-[PSRootController isViewLoaded](self, "isViewLoaded"))
  {
    -[PSRootController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstResponder");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "resignFirstResponder");

  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[PSRootController viewControllers](self, "viewControllers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v11, "conformsToProtocol:", &unk_1EE6E3CA8))
          objc_msgSend(v11, "setRootController:", 0);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeObserver:", self);

  v13.receiver = self;
  v13.super_class = (Class)PSRootController;
  -[PSRootController dealloc](&v13, sel_dealloc);
}

- (id)parentController
{
  return 0;
}

+ (BOOL)processedBundle:(id)a3 parentController:(id)a4 parentSpecifier:(id)a5 bundleControllers:(id *)a6 settings:(id)a7
{
  return ProcessedSpecifierBundle(a3, a4, a4, a6, a7);
}

- (void)willDismissPopupView
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[PSRootController topViewController](self, "topViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v2, "popupViewWillDisappear");
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  objc_msgSend(v2, "childViewControllers", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v7);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v8, "popupViewWillDisappear");
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (void)didDismissPopupView
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[PSRootController topViewController](self, "topViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v2, "popupViewDidDisappear");
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  objc_msgSend(v2, "childViewControllers", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v7);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v8, "popupViewDidDisappear");
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (void)willDismissFormSheetView
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[PSRootController topViewController](self, "topViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v2, "formSheetViewWillDisappear");
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  objc_msgSend(v2, "childViewControllers", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v7);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v8, "formSheetViewWillDisappear");
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (void)didDismissFormSheetView
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[PSRootController topViewController](self, "topViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v2, "formSheetViewDidDisappear");
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  objc_msgSend(v2, "childViewControllers", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v7);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v8, "formSheetViewDidDisappear");
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (BOOL)canBeShownFromSuspendedState
{
  return 1;
}

- (void)_delayedControllerReleaseAfterPop:(id)a3
{
  id v3;
  void *v4;
  dispatch_time_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  int v15;
  dispatch_time_t v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD block[4];
  id v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_msgSend(v3, "mutableCopy");
  v5 = dispatch_time(0, 360000000);
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__PSRootController__delayedControllerReleaseAfterPop___block_invoke;
  block[3] = &unk_1E4A654F0;
  v7 = v4;
  v25 = v7;
  dispatch_after(v5, MEMORY[0x1E0C80D38], block);
  objc_msgSend(MEMORY[0x1E0CB3868], "weakObjectsPointerArray");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v9 = v3;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v21;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(v8, "addPointer:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v13++));
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    }
    while (v11);
  }

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "sf_isInternalInstall");

  if (v15)
  {
    v16 = dispatch_time(0, 15000000000);
    v18[0] = v6;
    v18[1] = 3221225472;
    v18[2] = __54__PSRootController__delayedControllerReleaseAfterPop___block_invoke_171;
    v18[3] = &unk_1E4A654F0;
    v19 = v8;
    v17 = (void *)MEMORY[0x1E0C80D38];
    dispatch_after(v16, MEMORY[0x1E0C80D38], v18);

  }
}

uint64_t __54__PSRootController__delayedControllerReleaseAfterPop___block_invoke(uint64_t a1)
{
  uint64_t result;
  __int128 v3;
  void *v4;
  NSObject *v5;
  void *v6;
  id v7;
  __int128 v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  result = objc_msgSend(*(id *)(a1 + 32), "count");
  if (result)
  {
    *(_QWORD *)&v3 = 138543362;
    v8 = v3;
    do
    {
      objc_msgSend(*(id *)(a1 + 32), "lastObject", v8);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      _PSLoggingFacility();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v6 = (void *)objc_opt_class();
        *(_DWORD *)buf = v8;
        v10 = v6;
        v7 = v6;
        _os_log_impl(&dword_1A3819000, v5, OS_LOG_TYPE_DEFAULT, "Delayed release after nav pop: %{public}@", buf, 0xCu);

      }
      objc_msgSend(*(id *)(a1 + 32), "removeLastObject");

      result = objc_msgSend(*(id *)(a1 + 32), "count");
    }
    while (result);
  }
  return result;
}

void __54__PSRootController__delayedControllerReleaseAfterPop___block_invoke_171(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v1 = (void *)MEMORY[0x1E0CEABB8];
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __54__PSRootController__delayedControllerReleaseAfterPop___block_invoke_2;
  v2[3] = &unk_1E4A66598;
  v3 = *(id *)(a1 + 32);
  objc_msgSend(v1, "_traverseViewControllerHierarchy:", v2);

}

void __54__PSRootController__delayedControllerReleaseAfterPop___block_invoke_2(uint64_t a1, void *a2, int a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  id v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a3)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "allObjects");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          if (*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10) == v5)
          {
            _PSLoggingFacility();
            v11 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              v18 = "-[PSRootController _delayedControllerReleaseAfterPop:]_block_invoke_2";
              v19 = 2112;
              v20 = v5;
              _os_log_error_impl(&dword_1A3819000, v11, OS_LOG_TYPE_ERROR, "%s: View controller %@ still exists 15s after being popped from nav stack.", buf, 0x16u);
            }

            _PSLoggingFacility();
            v12 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 136315394;
              v18 = "-[PSRootController _delayedControllerReleaseAfterPop:]_block_invoke";
              v19 = 2112;
              v20 = v5;
              _os_log_fault_impl(&dword_1A3819000, v12, OS_LOG_TYPE_FAULT, "%s: View controller %@ still exists 15s after being popped from nav stack.", buf, 0x16u);
            }

          }
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
      }
      while (v8);
    }

  }
}

- (id)popViewControllerAnimated:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PSRootController;
  -[PSRootController popViewControllerAnimated:](&v13, sel_popViewControllerAnimated_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_1EE6E3CA8))
  {
    objc_msgSend(v4, "parentController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rootController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setParentController:", 0);
    objc_msgSend(v4, "setRootController:", 0);
    -[PSRootController transitionCoordinator](self, "transitionCoordinator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __46__PSRootController_popViewControllerAnimated___block_invoke;
      v9[3] = &unk_1E4A665C0;
      v10 = v4;
      v11 = v5;
      v12 = v6;
      objc_msgSend(v7, "notifyWhenInteractionChangesUsingBlock:", v9);

    }
  }
  return v4;
}

uint64_t __46__PSRootController_popViewControllerAnimated___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "isCancelled");
  if ((_DWORD)result)
  {
    objc_msgSend(*(id *)(a1 + 32), "setParentController:", *(_QWORD *)(a1 + 40));
    return objc_msgSend(*(id *)(a1 + 32), "setRootController:", *(_QWORD *)(a1 + 48));
  }
  return result;
}

- (id)popToViewController:(id)a3 animated:(BOOL)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  objc_super v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)PSRootController;
  -[PSRootController popToViewController:animated:](&v16, sel_popToViewController_animated_, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v10, "conformsToProtocol:", &unk_1EE6E3CA8))
        {
          objc_msgSend(v10, "setRootController:", 0);
          objc_msgSend(v10, "setParentController:", 0);
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    }
    while (v7);
  }
  -[PSRootController _delayedControllerReleaseAfterPop:](self, "_delayedControllerReleaseAfterPop:", v5);
  return v5;
}

- (id)popToRootViewControllerAnimated:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  objc_super v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)PSRootController;
  -[PSRootController popToRootViewControllerAnimated:](&v15, sel_popToRootViewControllerAnimated_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v9, "conformsToProtocol:", &unk_1EE6E3CA8))
        {
          objc_msgSend(v9, "setRootController:", 0);
          objc_msgSend(v9, "setParentController:", 0);
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    }
    while (v6);
  }
  -[PSRootController _delayedControllerReleaseAfterPop:](self, "_delayedControllerReleaseAfterPop:", v4);
  return v4;
}

- (void)setViewControllers:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  PSRootController *v13;
  id v14;
  uint64_t v15;
  PSRootController *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  PSRootController *v21;
  void *v22;
  objc_super v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v4 = a4;
  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  -[PSRootController viewControllers](self, "viewControllers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v29 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        if (objc_msgSend(v12, "conformsToProtocol:", &unk_1EE6E3CA8))
        {
          objc_msgSend(v12, "setRootController:", 0);
          objc_msgSend(v12, "setParentController:", 0);
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v9);
  }

  v13 = self;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v14 = v6;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  v16 = v13;
  if (v15)
  {
    v17 = v15;
    v18 = *(_QWORD *)v25;
    v16 = v13;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v25 != v18)
          objc_enumerationMutation(v14);
        v20 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * j);
        if (objc_msgSend(v20, "conformsToProtocol:", &unk_1EE6E3CA8))
        {
          objc_msgSend(v20, "setRootController:", v13);
          objc_msgSend(v20, "setParentController:", v16);
          v21 = v20;

          v16 = v21;
        }
      }
      v17 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v17);
  }

  -[PSRootController viewControllers](v13, "viewControllers");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSRootController _delayedControllerReleaseAfterPop:](v13, "_delayedControllerReleaseAfterPop:", v22);

  v23.receiver = v13;
  v23.super_class = (Class)PSRootController;
  -[PSRootController setViewControllers:animated:](&v23, sel_setViewControllers_animated_, v14, v4);

}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_class *v18;
  void *v19;
  id v20;

  v20 = a4;
  v7 = (void *)MEMORY[0x1E0CB37C0];
  v8 = (void *)MEMORY[0x1E0C99D80];
  v9 = a3;
  objc_msgSend(v9, "disappearingViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0CB37E8];
  v12 = objc_msgSend(v9, "lastOperation");

  objc_msgSend(v11, "numberWithInt:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dictionaryWithObjectsAndKeys:", v20, CFSTR("appearing"), v10, CFSTR("disappearing"), v13, CFSTR("operation"), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "notificationWithName:object:userInfo:", CFSTR("PSNavigationControllerWillShow"), self, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "postNotification:", v15);

  -[PSRootController viewControllers](self, "viewControllers");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v17, "containsObject:", v20);

  if ((_DWORD)v7)
  {
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D8D658], "trackingViewControllersVisitedInRootController:", v19);
    -[PSRootController logSettingsPath](self, "logSettingsPath");

  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  if (-[PSRootController isMovingFromParentViewController](self, "isMovingFromParentViewController")
    && !v3)
  {
    -[PSRootController topViewController](self, "topViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "navigationItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSearchController:", 0);

  }
  v7.receiver = self;
  v7.super_class = (Class)PSRootController;
  -[PSRootController viewWillDisappear:](&v7, sel_viewWillDisappear_, v3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  if (-[PSRootController isMovingFromParentViewController](self, "isMovingFromParentViewController"))
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[PSRootController viewControllers](self, "viewControllers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "reverseObjectEnumerator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v10++), "viewDidDisappear:", v3);
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }

    -[PSRootController setViewControllers:](self, "setViewControllers:", MEMORY[0x1E0C9AA60]);
  }
  v11.receiver = self;
  v11.super_class = (Class)PSRootController;
  -[PSRootController viewDidDisappear:](&v11, sel_viewDidDisappear_, v3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tasks, 0);
  objc_storeStrong((id *)&self->_specifier, 0);
}

- (void)showController:(os_log_t)log animate:.cold.3(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = "-[PSRootController showController:animate:]";
  _os_log_error_impl(&dword_1A3819000, log, OS_LOG_TYPE_ERROR, "%s: pushing a view controller that's already in the stack.", (uint8_t *)&v1, 0xCu);
}

@end
