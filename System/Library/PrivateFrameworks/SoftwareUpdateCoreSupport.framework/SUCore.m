@implementation SUCore

+ (BOOL)stringIsEqual:(id)a3 to:(id)a4
{
  unint64_t v5;
  unint64_t v6;
  void *v7;
  char v8;

  v5 = (unint64_t)a3;
  v6 = (unint64_t)a4;
  v7 = (void *)v6;
  if (v5 | v6)
  {
    v8 = 0;
    if (v5 && v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        v8 = objc_msgSend((id)v5, "isEqualToString:", v7);
      else
        v8 = 0;
    }
  }
  else
  {
    v8 = 1;
  }

  return v8;
}

+ (id)sharedCore
{
  if (sharedCore_coreOnce != -1)
    dispatch_once(&sharedCore_coreOnce, &__block_literal_global_2);
  return (id)sharedCore_core;
}

void __20__SUCore_sharedCore__block_invoke()
{
  SUCore *v0;
  void *v1;

  v0 = objc_alloc_init(SUCore);
  v1 = (void *)sharedCore_core;
  sharedCore_core = (uint64_t)v0;

}

- (SUCore)init
{
  SUCore *v2;
  SUCore *v3;
  NSString *baseDomain;
  NSString *filesystemBaseDir;
  const char *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *completionQueue;
  const char *v10;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *delegateCallbackQueue;
  const char *v14;
  NSObject *v15;
  dispatch_queue_t v16;
  OS_dispatch_queue *waitedOperationQueue;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)SUCore;
  v2 = -[SUCore init](&v19, sel_init);
  v3 = v2;
  if (v2)
  {
    baseDomain = v2->_baseDomain;
    v2->_baseDomain = 0;

    filesystemBaseDir = v3->_filesystemBaseDir;
    v3->_filesystemBaseDir = 0;

    v6 = (const char *)objc_msgSend(CFSTR("com.apple.su.completions"), "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create(v6, v7);
    completionQueue = v3->_completionQueue;
    v3->_completionQueue = (OS_dispatch_queue *)v8;

    v10 = (const char *)objc_msgSend(CFSTR("com.apple.su.delegate_callbacks"), "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = dispatch_queue_create(v10, v11);
    delegateCallbackQueue = v3->_delegateCallbackQueue;
    v3->_delegateCallbackQueue = (OS_dispatch_queue *)v12;

    v14 = (const char *)objc_msgSend(CFSTR("com.apple.su.waited_operations"), "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = dispatch_queue_create(v14, v15);
    waitedOperationQueue = v3->_waitedOperationQueue;
    v3->_waitedOperationQueue = (OS_dispatch_queue *)v16;

  }
  return v3;
}

- (id)commonDomain
{
  __CFString *v2;

  -[SUCore baseDomain](self, "baseDomain");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v2)
    v2 = CFSTR("com.apple.su");
  return v2;
}

- (id)commonFilesystemBaseDir
{
  __CFString *v2;

  -[SUCore filesystemBaseDir](self, "filesystemBaseDir");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v2)
    v2 = CFSTR("/var/tmp/SoftwareUpdateCore");
  return v2;
}

- (id)selectCompletionQueue:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    -[SUCore completionQueue](self, "completionQueue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (id)selectDelegateCallbackQueue:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    -[SUCore delegateCallbackQueue](self, "delegateCallbackQueue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (id)buildError:(int64_t)a3 underlying:(id)a4 description:(id)a5
{
  return (id)objc_msgSend(MEMORY[0x1E0CB35C8], "buildCheckedSUCoreError:underlying:description:", a3, a4, a5);
}

+ (id)beginTransactionWithName:(id)a3
{
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  void *v7;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  +[SUCore sharedSUCoreDomainAppending:](SUCore, "sharedSUCoreDomainAppending:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "oslog");
  v5 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543362;
    v10 = v3;
    _os_log_impl(&dword_1B05B8000, v5, OS_LOG_TYPE_DEFAULT, "[TRANSACTION] BEGIN with domain %{public}@", (uint8_t *)&v9, 0xCu);
  }

  v6 = objc_retainAutorelease(v3);
  objc_msgSend(v6, "UTF8String");
  v7 = (void *)os_transaction_create();

  return v7;
}

+ (void)endTransaction:(id)a3 withName:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  const __CFString *v9;
  int v10;
  void *v11;
  __int16 v12;
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  +[SUCore sharedSUCoreDomainAppending:](SUCore, "sharedSUCoreDomainAppending:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "oslog");
  v8 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = CFSTR("NOTNULL");
    if (!v5)
      v9 = CFSTR("NULL");
    v10 = 138543618;
    v11 = v6;
    v12 = 2114;
    v13 = v9;
    _os_log_impl(&dword_1B05B8000, v8, OS_LOG_TYPE_DEFAULT, "[TRANSACTION] END   with domain %{public}@ (transaction=%{public}@)", (uint8_t *)&v10, 0x16u);
  }

}

+ (id)sharedSUCoreDomainAppending:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;

  v3 = a3;
  v4 = v3;
  if (v3 && !objc_msgSend(v3, "isEqualToString:", &stru_1E611E1C8))
  {
    v9 = objc_alloc(MEMORY[0x1E0CB3940]);
    +[SUCore sharedCore](SUCore, "sharedCore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "commonDomain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v9, "initWithFormat:", CFSTR("%@.%@"), v7, v4);
  }
  else
  {
    v5 = objc_alloc(MEMORY[0x1E0CB3940]);
    +[SUCore sharedCore](SUCore, "sharedCore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "commonDomain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v5, "initWithString:", v7);
  }
  v10 = (void *)v8;

  return v10;
}

+ (id)errorNameForCode:(int64_t)a3
{
  return +[SUCoreErrorInformation nameForSUCoreCode:](SUCoreErrorInformation, "nameForSUCoreCode:", a3);
}

+ (BOOL)dictionaryIsEqual:(id)a3 to:(id)a4
{
  unint64_t v5;
  unint64_t v6;
  void *v7;
  char v8;

  v5 = (unint64_t)a3;
  v6 = (unint64_t)a4;
  v7 = (void *)v6;
  if (v5 | v6)
  {
    v8 = 0;
    if (v5 && v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        v8 = objc_msgSend((id)v5, "isEqualToDictionary:", v7);
      else
        v8 = 0;
    }
  }
  else
  {
    v8 = 1;
  }

  return v8;
}

+ (BOOL)arrayIsEqual:(id)a3 to:(id)a4
{
  unint64_t v5;
  unint64_t v6;
  void *v7;
  char v8;

  v5 = (unint64_t)a3;
  v6 = (unint64_t)a4;
  v7 = (void *)v6;
  if (v5 | v6)
  {
    v8 = 0;
    if (v5 && v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        v8 = objc_msgSend((id)v5, "isEqualToArray:", v7);
      else
        v8 = 0;
    }
  }
  else
  {
    v8 = 1;
  }

  return v8;
}

+ (BOOL)numberIsEqual:(id)a3 to:(id)a4
{
  unint64_t v5;
  unint64_t v6;
  void *v7;
  char v8;

  v5 = (unint64_t)a3;
  v6 = (unint64_t)a4;
  v7 = (void *)v6;
  if (v5 | v6)
  {
    v8 = 0;
    if (v5 && v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        v8 = objc_msgSend((id)v5, "isEqualToNumber:", v7);
      else
        v8 = 0;
    }
  }
  else
  {
    v8 = 1;
  }

  return v8;
}

+ (BOOL)dataIsEqual:(id)a3 to:(id)a4
{
  unint64_t v5;
  unint64_t v6;
  void *v7;
  char v8;

  v5 = (unint64_t)a3;
  v6 = (unint64_t)a4;
  v7 = (void *)v6;
  if (v5 | v6)
  {
    v8 = 0;
    if (v5 && v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        v8 = objc_msgSend((id)v5, "isEqualToData:", v7);
      else
        v8 = 0;
    }
  }
  else
  {
    v8 = 1;
  }

  return v8;
}

+ (BOOL)dateIsEqual:(id)a3 to:(id)a4
{
  unint64_t v5;
  unint64_t v6;
  void *v7;
  char v8;

  v5 = (unint64_t)a3;
  v6 = (unint64_t)a4;
  v7 = (void *)v6;
  if (v5 | v6)
  {
    v8 = 0;
    if (v5 && v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        v8 = objc_msgSend((id)v5, "isEqualToDate:", v7);
      else
        v8 = 0;
    }
  }
  else
  {
    v8 = 1;
  }

  return v8;
}

+ (BOOL)errorIsEqual:(id)a3 to:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  BOOL v21;

  v5 = a3;
  v6 = a4;
  v7 = v5;
  v8 = v6;
  v9 = *MEMORY[0x1E0CB3388];
  v10 = 10;
  v11 = (uint64_t)v8;
  v12 = (uint64_t)v7;
  while (v12 | v11)
  {
    if (!v12)
      goto LABEL_11;
    if (!v11)
      goto LABEL_11;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_11;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_11;
    objc_msgSend((id)v12, "domain");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v11, "domain");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "isEqualToString:", v14);

    if (!v15 || (v16 = objc_msgSend((id)v12, "code"), v16 != objc_msgSend((id)v11, "code")))
    {
LABEL_11:
      v21 = 0;
      goto LABEL_12;
    }
    objc_msgSend((id)v12, "userInfo");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "safeObjectForKey:ofClass:", v9, objc_opt_class());
    v18 = objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)v11, "userInfo");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "safeObjectForKey:ofClass:", v9, objc_opt_class());
    v20 = objc_claimAutoreleasedReturnValue();

    v11 = v20;
    v12 = v18;
    if (!--v10)
    {
      v21 = 1;
      v12 = v18;
      v11 = v20;
      goto LABEL_12;
    }
  }
  v12 = 0;
  v11 = 0;
  v21 = 1;
LABEL_12:

  return v21;
}

+ (BOOL)objectIsEqual:(id)a3 to:(id)a4
{
  unint64_t v5;
  unint64_t v6;
  void *v7;
  char v8;

  v5 = (unint64_t)a3;
  v6 = (unint64_t)a4;
  v7 = (void *)v6;
  if (v5 | v6)
  {
    v8 = 0;
    if (v5 && v6)
      v8 = objc_msgSend((id)v5, "isEqual:", v6);
  }
  else
  {
    v8 = 1;
  }

  return v8;
}

+ (id)limitString:(id)a3 toMaxLength:(unint64_t)a4 providingSubstitutionMap:(id)a5
{
  id v7;
  id v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;

  v7 = a3;
  v8 = a5;
  v9 = (__CFString *)v7;
  v10 = v9;
  v11 = v9;
  if (a4)
  {
    v11 = v9;
    if (-[__CFString length](v9, "length") > a4)
    {
      if (v8)
      {
        v12 = objc_msgSend(v8, "count") + 1;
        v11 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("KEYMAP(%llu)"), v12);

        v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("  %@ = %@"), v11, v10);
        if (v13)
          objc_msgSend(v8, "addObject:", v13);

      }
      else
      {
        v11 = CFSTR("(present)");
        v14 = objc_msgSend(CFSTR("(present)"), "length");

        if (v14 > a4)
          v11 = CFSTR("X");
      }
    }
  }

  return v11;
}

+ (id)stringFromDate:(id)a3
{
  id v3;
  void *v4;
  __CFString *v5;

  v3 = a3;
  v4 = v3;
  if (stringFromDate__onceToken != -1)
  {
    dispatch_once(&stringFromDate__onceToken, &__block_literal_global_39);
    if (v4)
      goto LABEL_3;
LABEL_5:
    v5 = CFSTR("none");
    goto LABEL_6;
  }
  if (!v3)
    goto LABEL_5;
LABEL_3:
  objc_msgSend((id)stringFromDate____dateFormatter, "stringFromDate:", v4);
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_6:

  return v5;
}

void __25__SUCore_stringFromDate___block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  id v4;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)stringFromDate____dateFormatter;
  stringFromDate____dateFormatter = (uint64_t)v0;

  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)stringFromDate____dateFormatter, "setLocale:", v4);
  objc_msgSend((id)stringFromDate____dateFormatter, "setDateFormat:", CFSTR("yyyy-MM-dd'T'HH:mm:ssZZZZZ"));
  v2 = (void *)stringFromDate____dateFormatter;
  objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCalendar:", v3);

}

+ (id)stringFromTriState:(int64_t)a3
{
  if ((unint64_t)a3 > 2)
    return CFSTR("SUCoreTriStateUnknown");
  else
    return off_1E611C6C0[a3];
}

+ (id)getFileMetadata:(const char *)a3 forKey:(id)a4
{
  const char *v5;
  ssize_t v6;
  size_t v7;
  id v8;
  ssize_t v9;
  id v10;

  v5 = (const char *)objc_msgSend(objc_retainAutorelease(a4), "UTF8String");
  v6 = getxattr(a3, v5, 0, 0, 0, 1);
  if (v6 < 0)
  {
    v10 = 0;
  }
  else
  {
    v7 = v6;
    objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", v6);
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v9 = getxattr(a3, v5, (void *)objc_msgSend(v8, "mutableBytes"), v7, 0, 1);
    if (v9 < 0)
    {
      v10 = 0;
    }
    else
    {
      objc_msgSend(v8, "setLength:", v9);
      v10 = v8;
    }

  }
  return v10;
}

+ (BOOL)setFileMetadata:(const char *)a3 forKey:(id)a4 value:(id)a5
{
  id v7;
  id v8;
  const char *v9;
  id v10;
  const void *v11;
  size_t v12;

  v7 = objc_retainAutorelease(a4);
  v8 = a5;
  v9 = (const char *)objc_msgSend(v7, "UTF8String");
  v10 = objc_retainAutorelease(v8);
  v11 = (const void *)objc_msgSend(v10, "bytes");
  v12 = objc_msgSend(v10, "length");

  return setxattr(a3, v9, v11, v12, 0, 1) == 0;
}

- (NSString)baseDomain
{
  return self->_baseDomain;
}

- (void)setBaseDomain:(id)a3
{
  objc_storeStrong((id *)&self->_baseDomain, a3);
}

- (NSString)filesystemBaseDir
{
  return self->_filesystemBaseDir;
}

- (void)setFilesystemBaseDir:(id)a3
{
  objc_storeStrong((id *)&self->_filesystemBaseDir, a3);
}

- (OS_dispatch_queue)completionQueue
{
  return self->_completionQueue;
}

- (OS_dispatch_queue)delegateCallbackQueue
{
  return self->_delegateCallbackQueue;
}

- (OS_dispatch_queue)waitedOperationQueue
{
  return self->_waitedOperationQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waitedOperationQueue, 0);
  objc_storeStrong((id *)&self->_delegateCallbackQueue, 0);
  objc_storeStrong((id *)&self->_completionQueue, 0);
  objc_storeStrong((id *)&self->_filesystemBaseDir, 0);
  objc_storeStrong((id *)&self->_baseDomain, 0);
}

@end
