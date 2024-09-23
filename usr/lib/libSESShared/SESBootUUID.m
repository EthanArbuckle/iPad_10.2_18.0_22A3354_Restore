@implementation SESBootUUID

+ (id)getInstance
{
  if (getInstance_onceToken_0 != -1)
    dispatch_once(&getInstance_onceToken_0, &__block_literal_global_2);
  return (id)getInstance_instance_0;
}

void __26__SESBootUUID_getInstance__block_invoke()
{
  uint64_t v0;
  void *v1;
  int v2;
  void *v3;
  size_t v4;
  _BYTE v5[37];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v0 = objc_opt_new();
  v1 = (void *)getInstance_instance_0;
  getInstance_instance_0 = v0;

  memset(v5, 0, sizeof(v5));
  v4 = 37;
  v2 = sysctlbyname("kern.bootsessionuuid", v5, &v4, 0, 0);
  if (v2)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v5);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_storeStrong((id *)(getInstance_instance_0 + 8), v3);
  if (!v2)

}

+ (BOOL)isFirstLaunchAfterBootForKey:(id)a3
{
  id v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  int v9;
  NSObject *v10;
  int v11;
  int v13;
  id v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  +[SESBootUUID getInstance](SESBootUUID, "getInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v4);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.seserviced"));
  objc_msgSend(v5, "valueForKey:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v4[1])
    v8 = v6 == 0;
  else
    v8 = 1;
  if (v8)
    v9 = 0;
  else
    v9 = objc_msgSend(v6, "isEqualToString:");
  SESDefaultLogObject();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v9 ^ 1;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v13 = 138412546;
    v14 = v3;
    v15 = 1024;
    v16 = v11;
    _os_log_impl(&dword_24B9C8000, v10, OS_LOG_TYPE_INFO, "First launch after boot for %@ %d", (uint8_t *)&v13, 0x12u);
  }

  objc_sync_exit(v4);
  return v11;
}

+ (void)setFirstLaunchAfterBootDoneForKey:(id)a3
{
  id v3;
  _QWORD *v4;
  void *v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  +[SESBootUUID getInstance](SESBootUUID, "getInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v4);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.seserviced"));
  objc_msgSend(v5, "setObject:forKey:", v4[1], v3);
  SESDefaultLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = 138412290;
    v8 = v3;
    _os_log_impl(&dword_24B9C8000, v6, OS_LOG_TYPE_INFO, "First launch after boot complete for %@", (uint8_t *)&v7, 0xCu);
  }

  objc_sync_exit(v4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bootUUID, 0);
}

@end
