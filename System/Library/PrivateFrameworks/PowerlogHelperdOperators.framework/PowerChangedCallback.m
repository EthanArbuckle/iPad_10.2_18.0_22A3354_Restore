@implementation PowerChangedCallback

uint64_t __PowerChangedCallback_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  PowerChangedCallback_classDebugEnabled = result;
  return result;
}

uint64_t __PowerChangedCallback_block_invoke_394(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  PowerChangedCallback_classDebugEnabled_393 = result;
  return result;
}

uint64_t __PowerChangedCallback_block_invoke_399(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  PowerChangedCallback_classDebugEnabled_398 = result;
  return result;
}

void __PowerChangedCallback_block_invoke_402(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t block;
  uint64_t v12;
  uint64_t (*v13)(uint64_t);
  void *v14;
  uint64_t v15;

  IOAllowPowerChange(objc_msgSend(*(id *)(*(_QWORD *)(a1[4] + 8) + 40), "rootDomainConnect"), a1[6]);
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v2 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __PowerChangedCallback_block_invoke_2;
    v14 = &__block_descriptor_40_e5_v8__0lu32l8;
    v15 = v2;
    if (kPLSleepWakeAgentEventPointNameScheduledWakeProcessName_block_invoke_4_defaultOnce != -1)
      dispatch_once(&kPLSleepWakeAgentEventPointNameScheduledWakeProcessName_block_invoke_4_defaultOnce, &block);
    if (kPLSleepWakeAgentEventPointNameScheduledWakeProcessName_block_invoke_4_classDebugEnabled)
    {
      v3 = (void *)MEMORY[0x1E0CB3940];
      v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "entryID");
      objc_msgSend(v3, "stringWithFormat:", CFSTR("Sleep: block Done entry.id=%lld"), v4, block, v12, v13, v14, v15);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSleepWakeAgent.m");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastPathComponent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "PowerChangedCallback_block_invoke");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v8, v9, 1134);

      PLLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

    }
  }
}

uint64_t __PowerChangedCallback_block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  kPLSleepWakeAgentEventPointNameScheduledWakeProcessName_block_invoke_4_classDebugEnabled = result;
  return result;
}

uint64_t __PowerChangedCallback_block_invoke_407(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  PowerChangedCallback_classDebugEnabled_406 = result;
  return result;
}

uint64_t __PowerChangedCallback_block_invoke_412(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  PowerChangedCallback_classDebugEnabled_411 = result;
  return result;
}

@end
