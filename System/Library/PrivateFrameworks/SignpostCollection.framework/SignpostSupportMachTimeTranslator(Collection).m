@implementation SignpostSupportMachTimeTranslator(Collection)

+ (id)_globalNotificationDispatchQueue
{
  if (_globalNotificationDispatchQueue_onceToken != -1)
    dispatch_once(&_globalNotificationDispatchQueue_onceToken, &__block_literal_global_2);
  return (id)_globalNotificationDispatchQueue_notificationQueue;
}

+ (id)_timeTranslationLog
{
  if (_timeTranslationLog_onceToken != -1)
    dispatch_once(&_timeTranslationLog_onceToken, &__block_literal_global_2);
  return (id)_timeTranslationLog_timeTranslationLog;
}

+ (void)_addListeningTimeTranslator:()Collection
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  void *v9;

  v4 = a3;
  objc_msgSend(a1, "_globalNotificationDispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __77__SignpostSupportMachTimeTranslator_Collection___addListeningTimeTranslator___block_invoke;
  block[3] = &unk_24CE7A740;
  v8 = v4;
  v9 = a1;
  v6 = v4;
  dispatch_sync(v5, block);

}

+ (void)_removeListeningTimeTranslator:()Collection
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  objc_msgSend(a1, "_globalNotificationDispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __80__SignpostSupportMachTimeTranslator_Collection___removeListeningTimeTranslator___block_invoke;
  block[3] = &unk_24CE7A768;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

+ (void)_processPowerNotificationOfType:()Collection withNotificationID:
{
  unint64_t v4;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint8_t v24[16];
  uint8_t buf[16];

  HIDWORD(v4) = a3;
  LODWORD(v4) = a3 + 536870288;
  v6 = result;
  switch((v4 >> 4))
  {
    case 0u:
      objc_msgSend(result, "_timeTranslationLog");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_212A37000, v7, OS_LOG_TYPE_DEFAULT, "Got system can sleep notification", buf, 2u);
      }

      return (void *)IOAllowPowerChange(gRootDomainConnect, a4);
    case 1u:
      objc_msgSend(result, "_timeTranslationLog");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v24 = 0;
        _os_log_impl(&dword_212A37000, v8, OS_LOG_TYPE_DEFAULT, "Got system will sleep notification", v24, 2u);
      }

      IOAllowPowerChange(gRootDomainConnect, a4);
      goto LABEL_13;
    case 2u:
      objc_msgSend(MEMORY[0x24BE90680], "_timeTranslationLog");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        +[SignpostSupportMachTimeTranslator(Collection) _processPowerNotificationOfType:withNotificationID:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
      goto LABEL_12;
    case 9u:
      objc_msgSend(MEMORY[0x24BE90680], "_timeTranslationLog");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        +[SignpostSupportMachTimeTranslator(Collection) _processPowerNotificationOfType:withNotificationID:].cold.2(v9, v17, v18, v19, v20, v21, v22, v23);
LABEL_12:

LABEL_13:
      result = (void *)objc_msgSend(v6, "_snapshotMachTimesForAllListeners");
      break;
    default:
      return result;
  }
  return result;
}

+ (void)_snapshotMachTimesForAllListeners
{
  NSObject *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t v14[128];
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v12 = 0;
  v13 = 0;
  mach_get_times();
  objc_msgSend(a1, "_timeTranslationLog");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v2))
  {
    *(_DWORD *)buf = 134349312;
    v16 = v13;
    v17 = 2050;
    v18 = v12;
    _os_signpost_emit_with_name_impl(&dword_212A37000, v2, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "MachTimesSnapshot", "mach_absolute_time=%{signpost.description:attribute,public}llu mach_continuous_time=%{signpost.description:attribute,public}llu", buf, 0x16u);
  }

  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v3 = (id)gListeningTimeTranslators;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "addTimestampPairWithMachAbsoluteTime:machContinuousTime:", v13, v12, (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v14, 16);
    }
    while (v5);
  }

}

- (void)initWithMaxEntries:()Collection
{
  void *v4;
  void *v5;

  v4 = (void *)objc_msgSend(a1, "init");
  v5 = v4;
  if (v4)
    objc_msgSend(v4, "setMaxEntries:", a3);
  return v5;
}

- (uint64_t)_grabMachTimesSnapshot
{
  mach_get_times();
  return objc_msgSend(a1, "addTimestampPairWithMachAbsoluteTime:machContinuousTime:", 0, 0);
}

- (uint64_t)startMonitoringSleepWake
{
  uint64_t result;

  result = objc_msgSend(a1, "isMonitoringSleepWake");
  if ((result & 1) == 0)
  {
    objc_msgSend(a1, "setIsMonitoringSleepWake:", 1);
    objc_msgSend(a1, "_grabMachTimesSnapshot");
    return objc_msgSend((id)objc_opt_class(), "_addListeningTimeTranslator:", a1);
  }
  return result;
}

- (uint64_t)stopMonitoringSleepWake
{
  uint64_t result;

  result = objc_msgSend(a1, "isMonitoringSleepWake");
  if ((_DWORD)result)
  {
    objc_msgSend((id)objc_opt_class(), "_removeListeningTimeTranslator:", a1);
    objc_msgSend(a1, "_grabMachTimesSnapshot");
    return objc_msgSend(a1, "setIsMonitoringSleepWake:", 0);
  }
  return result;
}

- (uint64_t)dataRepresentationDuringMonitoring
{
  objc_msgSend(a1, "_grabMachTimesSnapshot");
  return objc_msgSend(a1, "dataRepresentation");
}

+ (void)_processPowerNotificationOfType:()Collection withNotificationID:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_212A37000, a1, a3, "Got sleep cancel/wake notification", a5, a6, a7, a8, 0);
}

+ (void)_processPowerNotificationOfType:()Collection withNotificationID:.cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_212A37000, a1, a3, "Got system wake notification", a5, a6, a7, a8, 0);
}

@end
