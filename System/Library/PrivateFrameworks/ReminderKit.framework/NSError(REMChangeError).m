@implementation NSError(REMChangeError)

+ (__CFString)_defaultDescriptionForREMChangeErrorCode:()REMChangeError
{
  NSObject *v4;

  if (a3 < 0xC)
    return off_1E67F8338[a3];
  +[REMLog changeTracking](REMLog, "changeTracking");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    +[NSError(REMChangeError) _defaultDescriptionForREMChangeErrorCode:].cold.1(v4);

  return 0;
}

+ (id)errorWithREMChangeErrorCode:()REMChangeError
{
  void *v5;
  void *v6;

  objc_msgSend(a1, "_defaultDescriptionForREMChangeErrorCode:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "errorWithREMChangeErrorCode:description:underlyingError:", a3, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)errorWithREMChangeErrorCode:()REMChangeError debugDescription:
{
  void *v6;
  __CFString *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;

  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = a4;
  objc_msgSend(a1, "_defaultDescriptionForREMChangeErrorCode:", a3);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  v10 = &stru_1E67FB1F0;
  if (v7)
    v10 = v7;
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@ {%@}"), v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "errorWithREMChangeErrorCode:description:underlyingError:", a3, v11, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)errorWithREMChangeErrorCode:()REMChangeError underlyingError:
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  objc_msgSend(a1, "_defaultDescriptionForREMChangeErrorCode:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "errorWithREMChangeErrorCode:description:underlyingError:", a3, v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)errorWithREMChangeErrorCode:()REMChangeError description:underlyingError:
{
  unint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  unint64_t v19;
  __int16 v20;
  unint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  if (v7 | v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v7)
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0CB2D50]);
    if (v8)
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0CB3388]);
    v11 = (void *)objc_msgSend(v10, "copy");

  }
  else
  {
    v11 = 0;
  }
  v12 = os_log_create("com.apple.reminderkit", "default");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138412802;
    v17 = v15;
    v18 = 2112;
    v19 = v7;
    v20 = 2112;
    v21 = v8;
    _os_log_debug_impl(&dword_1B4A39000, v12, OS_LOG_TYPE_DEBUG, "ERROR: REMChangeError occurred - code=%@, desc=%@, nserror=%@", (uint8_t *)&v16, 0x20u);

  }
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("com.apple.ReminderKit.REMChangeErrorDomain"), a3, v11);

  return v13;
}

+ (void)_defaultDescriptionForREMChangeErrorCode:()REMChangeError .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1B4A39000, log, OS_LOG_TYPE_FAULT, "Unknown ReminderKit change tracking error code.", v1, 2u);
}

@end
