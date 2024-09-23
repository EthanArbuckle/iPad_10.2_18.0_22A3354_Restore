@implementation SettingsCellularSharedUtils

void __53__SettingsCellularSharedUtils_sharedCTClientWorkloop__block_invoke()
{
  dispatch_workloop_t v0;
  void *v1;

  v0 = dispatch_workloop_create("com.apple.preferences.coretelephony_client_workloop");
  v1 = (void *)_MergedGlobals_6;
  _MergedGlobals_6 = (uint64_t)v0;

}

+ (id)createCTClientSerialQueue:(id)a3
{
  id v4;
  const char *v5;
  NSObject *v6;
  NSObject *v7;
  dispatch_queue_t v8;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.preferences.coretelephony_client_%@_queue"), a3);
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = (const char *)objc_msgSend(v4, "UTF8String");
  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "sharedCTClientWorkloop");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = dispatch_queue_create_with_target_V2(v5, v6, v7);

  return v8;
}

+ (id)sharedCTClientWorkloop
{
  if (qword_253E97658 != -1)
    dispatch_once(&qword_253E97658, &__block_literal_global_3);
  return (id)_MergedGlobals_6;
}

+ (void)logSpecifiers:(id)a3 origin:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  id v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  +[Logger loggerWithCategory:](Logger, "loggerWithCategory:", CFSTR("Specifiers"));
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v24 = v6;
    v25 = 2048;
    v26 = objc_msgSend(v5, "count");
    _os_log_impl(&dword_2188BE000, v7, OS_LOG_TYPE_DEFAULT, "%@ showing %zu specifiers", buf, 0x16u);
  }

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v11 = v9;
    v12 = *(_QWORD *)v19;
    *(_QWORD *)&v10 = 138412546;
    v17 = v10;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v13);
        +[Logger loggerWithCategory:](Logger, "loggerWithCategory:", CFSTR("Specifiers"), v17, (_QWORD)v18);
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v14, "name");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v17;
          v24 = v6;
          v25 = 2112;
          v26 = (uint64_t)v16;
          _os_log_impl(&dword_2188BE000, v15, OS_LOG_TYPE_DEFAULT, "%@ showing specifier: %@", buf, 0x16u);

        }
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }

}

+ (id)usageSizeString:(double)a3
{
  if (qword_253E97668 != -1)
    dispatch_once(&qword_253E97668, &__block_literal_global_6);
  return (id)objc_msgSend((id)qword_253E97660, "stringFromByteCount:", (uint64_t)a3);
}

uint64_t __47__SettingsCellularSharedUtils_usageSizeString___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDD1490]);
  v1 = (void *)qword_253E97660;
  qword_253E97660 = (uint64_t)v0;

  objc_msgSend((id)qword_253E97660, "setZeroPadsFractionDigits:", 1);
  objc_msgSend((id)qword_253E97660, "setAdaptive:", 0);
  return objc_msgSend((id)qword_253E97660, "setCountStyle:", 3);
}

@end
