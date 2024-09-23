@implementation SBLegacyServices

+ (void)_configure
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__SBLegacyServices__configure__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_configure_onceToken != -1)
    dispatch_once(&_configure_onceToken, block);
}

void __30__SBLegacyServices__configure__block_invoke(uint64_t a1)
{
  dispatch_workloop_t inactive;
  void *v3;
  uint64_t v4;
  void *v5;

  inactive = dispatch_workloop_create_inactive("SBMigServices");
  v3 = (void *)__SharedWorkloop;
  __SharedWorkloop = (uint64_t)inactive;

  dispatch_workloop_set_autorelease_frequency((dispatch_workloop_t)__SharedWorkloop, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_set_qos_class_fallback();
  dispatch_activate((dispatch_object_t)__SharedWorkloop);
  objc_msgSend(*(id *)(a1 + 32), "checkInPorts");
  objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 770, 258);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)__FunctionMap;
  __FunctionMap = v4;

}

+ (void)checkInPorts
{
  if (checkInPorts_onceToken != -1)
    dispatch_once(&checkInPorts_onceToken, &__block_literal_global_57);
}

void __32__SBLegacyServices_checkInPorts__block_invoke()
{
  const char *v0;
  __int128 v1;
  __int128 v2;
  __int128 v3;

  v3 = 0u;
  *(_QWORD *)&v1 = 0;
  v0 = "com.apple.springboard.services";
  bootstrap_check_in2();
  *((_QWORD *)&v2 + 1) = SpringBoardUser_server;
  *((_QWORD *)&v1 + 1) = 2112;
  *(_QWORD *)&v2 = _SBMigSpringBoardUser_subsystem;
  __copy_assignment_8_8_t0w40_s40_s48((uint64_t)&__ForegroundMigService, (__int128 *)&v0);

  v2 = 0u;
  v3 = 0u;
  v1 = 0u;
  v0 = "com.apple.springboard.blockableservices";
  bootstrap_check_in2();
  *(_QWORD *)&v2 = _SBMigSpringBoardUser_subsystem;
  *((_QWORD *)&v2 + 1) = SpringBoardUser_server;
  *((_QWORD *)&v1 + 1) = 2112;
  __copy_assignment_8_8_t0w40_s40_s48((uint64_t)&__ForegroundBlockableMigService, (__int128 *)&v0);

  v2 = 0u;
  v3 = 0u;
  v1 = 0u;
  v0 = "com.apple.springboard.backgroundappservices";
  bootstrap_check_in2();
  *((_QWORD *)&v2 + 1) = SpringBoardUtility_server;
  *((_QWORD *)&v1 + 1) = 2096;
  *(_QWORD *)&v2 = _SBMigSpringBoardUtility_subsystem;
  __copy_assignment_8_8_t0w40_s40_s48((uint64_t)&__BackgroundMigService, (__int128 *)&v0);

}

+ (void)start
{
  NSObject *v2;
  uint8_t v3[16];

  objc_msgSend(a1, "_configure");
  SBLogCommon();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_18EB52000, v2, OS_LOG_TYPE_INFO, "[SBMig] Starting services.", v3, 2u);
  }

  dispatch_async((dispatch_queue_t)__SharedWorkloop, &__block_literal_global_8_2);
}

void __25__SBLegacyServices_start__block_invoke()
{
  SBMachServiceInitialize((uint64_t)&__ForegroundMigService);
  SBMachServiceInitialize((uint64_t)&__ForegroundBlockableMigService);
  SBMachServiceInitialize((uint64_t)&__BackgroundMigService);
}

+ (id)workloop
{
  objc_msgSend(a1, "_configure");
  return (id)__SharedWorkloop;
}

+ (void)setFunction:(void *)a3 forSymbol:(const char *)a4
{
  _QWORD v6[6];

  objc_msgSend(a1, "_configure");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __42__SBLegacyServices_setFunction_forSymbol___block_invoke;
  v6[3] = &__block_descriptor_48_e5_v8__0l;
  v6[4] = a4;
  v6[5] = a3;
  dispatch_async((dispatch_queue_t)__SharedWorkloop, v6);
}

void __42__SBLegacyServices_setFunction_forSymbol___block_invoke(uint64_t a1)
{
  NSObject *v2;

  SBLogCommon();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __42__SBLegacyServices_setFunction_forSymbol___block_invoke_cold_1(a1, v2);

  NSMapInsert((NSMapTable *)__FunctionMap, *(const void **)(a1 + 32), *(const void **)(a1 + 40));
}

void __42__SBLegacyServices_setFunction_forSymbol___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = 136446466;
  v5 = v2;
  v6 = 2048;
  v7 = v3;
  _os_log_debug_impl(&dword_18EB52000, a2, OS_LOG_TYPE_DEBUG, "[SBMig] Host caching implementation of %{public}s at %p", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_3();
}

@end
