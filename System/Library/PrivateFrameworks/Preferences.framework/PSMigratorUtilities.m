@implementation PSMigratorUtilities

- (void)_migrateKey:(id)a3 domain:(id)a4 toKey:(id)a5 toDomain:(id)a6 migrateCloud:(BOOL)a7
{
  _BOOL4 v7;
  __CFString *v11;
  __CFString *v12;
  __CFString *v13;
  __CFString *v14;
  CFPropertyListRef v15;
  CFPropertyListRef v16;
  NSObject *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  _BOOL4 v24;
  int v25;
  __CFString *v26;
  __int16 v27;
  __CFString *v28;
  __int16 v29;
  __CFString *v30;
  __int16 v31;
  __CFString *v32;
  uint64_t v33;

  v7 = a7;
  v33 = *MEMORY[0x1E0C80C00];
  v11 = (__CFString *)a3;
  v12 = (__CFString *)a4;
  v13 = (__CFString *)a5;
  v14 = (__CFString *)a6;
  v15 = CFPreferencesCopyAppValue(v11, v12);
  v16 = CFPreferencesCopyAppValue(v13, v14);
  if (v15)
  {
    _PSLoggingFacility();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
    if (v16)
    {
      if (v18)
      {
        v25 = 138412546;
        v26 = v12;
        v27 = 2112;
        v28 = v11;
        _os_log_impl(&dword_1A3819000, v17, OS_LOG_TYPE_DEFAULT, "Removing defunct pref '%@' '%@'", (uint8_t *)&v25, 0x16u);
      }

    }
    else
    {
      if (v18)
      {
        v25 = 138413058;
        v26 = v12;
        v27 = 2112;
        v28 = v11;
        v29 = 2112;
        v30 = v14;
        v31 = 2112;
        v32 = v13;
        _os_log_impl(&dword_1A3819000, v17, OS_LOG_TYPE_DEFAULT, "Migrating pref '%@' '%@' => '%@' '%@'", (uint8_t *)&v25, 0x2Au);
      }

      CFPreferencesSetAppValue(v13, v15, v14);
    }
    CFPreferencesSetAppValue(v11, 0, v12);
    CFRelease(v15);
  }
  if (v16)
    CFRelease(v16);
  if (v7)
  {
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", v12);
    objc_msgSend(v19, "objectForKey:", v11);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", v14);
      objc_msgSend(v21, "objectForKey:", v13);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      _PSLoggingFacility();
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
      if (v22)
      {
        if (v24)
        {
          v25 = 138412546;
          v26 = v12;
          v27 = 2112;
          v28 = v11;
          _os_log_impl(&dword_1A3819000, v23, OS_LOG_TYPE_DEFAULT, "Removing defunct cloud pref '%@' '%@'", (uint8_t *)&v25, 0x16u);
        }

      }
      else
      {
        if (v24)
        {
          v25 = 138413058;
          v26 = v12;
          v27 = 2112;
          v28 = v11;
          v29 = 2112;
          v30 = v14;
          v31 = 2112;
          v32 = v13;
          _os_log_impl(&dword_1A3819000, v23, OS_LOG_TYPE_DEFAULT, "Migrating cloud pref from '%@' '%@' => '%@' %@'", (uint8_t *)&v25, 0x2Au);
        }

        objc_msgSend(v21, "setBool:forKey:", objc_msgSend(v20, "BOOLValue"), v13);
      }
      objc_msgSend(v19, "removeObjectForKey:", v11);

    }
  }

}

@end
