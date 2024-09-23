@implementation Logger

+ (id)loggerWithCategory:(id)a3 instance:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  const char *v11;
  id v12;

  v5 = a3;
  v6 = a4;
  if (qword_253E97688 != -1)
    dispatch_once(&qword_253E97688, &__block_literal_global_5);
  v7 = v5;
  v8 = v7;
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%@"), v7, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v9 = (id)_MergedGlobals_8;
  objc_sync_enter(v9);
  objc_msgSend((id)_MergedGlobals_8, "objectForKey:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    v11 = (const char *)kCellularSettingsLogSubsystem;
    v12 = objc_retainAutorelease(v8);
    v10 = os_log_create(v11, (const char *)objc_msgSend(v12, "UTF8String"));
    objc_msgSend((id)_MergedGlobals_8, "setObject:forKey:", v10, v12);
  }
  objc_sync_exit(v9);

  return v10;
}

+ (id)loggerWithCategory:(id)a3
{
  return +[Logger loggerWithCategory:instance:](Logger, "loggerWithCategory:instance:", a3, 0);
}

void __38__Logger_loggerWithCategory_instance___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v1 = (void *)_MergedGlobals_8;
  _MergedGlobals_8 = (uint64_t)v0;

}

@end
