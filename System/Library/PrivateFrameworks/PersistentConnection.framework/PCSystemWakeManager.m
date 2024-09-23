@implementation PCSystemWakeManager

+ (void)scheduleWake:(BOOL)a3 wakeDate:(id)a4 acceptableDelay:(double)a5 userVisible:(BOOL)a6 serviceIdentifier:(id)a7 uniqueIdentifier:(void *)a8
{
  _BOOL8 v10;
  _BOOL8 v12;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  id v17;
  _DWORD v18[2];
  __int16 v19;
  void *v20;
  __int16 v21;
  double v22;
  __int16 v23;
  id v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v10 = a6;
  v12 = a3;
  v27 = *MEMORY[0x1E0C80C00];
  v13 = a4;
  v14 = a7;
  if (scheduleWake_wakeDate_acceptableDelay_userVisible_serviceIdentifier_uniqueIdentifier__pred != -1)
    dispatch_once(&scheduleWake_wakeDate_acceptableDelay_userVisible_serviceIdentifier_uniqueIdentifier__pred, &__block_literal_global_3);
  +[PCLog wakeManager](PCLog, "wakeManager");
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    PCStringFromDate(v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = 67110146;
    v18[1] = v12;
    v19 = 2114;
    v20 = v16;
    v21 = 2048;
    v22 = a5;
    v23 = 2114;
    v24 = v14;
    v25 = 2114;
    v26 = a8;
    _os_log_impl(&dword_1CBC1B000, v15, OS_LOG_TYPE_DEFAULT, "Request to schedule wake %d date %{public}@ leeway %g service identifier %{public}@ unique identifier %{public}@", (uint8_t *)v18, 0x30u);

  }
  v17 = -[PCScheduleSystemWakeOperation initForScheduledWake:wakeDate:acceptableDelay:userVisible:serviceIdentifier:uniqueIdentifier:]([PCScheduleSystemWakeOperation alloc], "initForScheduledWake:wakeDate:acceptableDelay:userVisible:serviceIdentifier:uniqueIdentifier:", v12, v13, v10, v14, a8, a5);
  objc_msgSend((id)scheduleWake_wakeDate_acceptableDelay_userVisible_serviceIdentifier_uniqueIdentifier__queue, "addOperation:", v17);

}

void __108__PCSystemWakeManager_scheduleWake_wakeDate_acceptableDelay_userVisible_serviceIdentifier_uniqueIdentifier___block_invoke()
{
  id v0;
  void *v1;
  PCCancelAllProcessWakesOperation *v2;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3828]);
  v1 = (void *)scheduleWake_wakeDate_acceptableDelay_userVisible_serviceIdentifier_uniqueIdentifier__queue;
  scheduleWake_wakeDate_acceptableDelay_userVisible_serviceIdentifier_uniqueIdentifier__queue = (uint64_t)v0;

  objc_msgSend((id)scheduleWake_wakeDate_acceptableDelay_userVisible_serviceIdentifier_uniqueIdentifier__queue, "setMaxConcurrentOperationCount:", 1);
  v2 = objc_alloc_init(PCCancelAllProcessWakesOperation);
  objc_msgSend((id)scheduleWake_wakeDate_acceptableDelay_userVisible_serviceIdentifier_uniqueIdentifier__queue, "addOperation:", v2);

}

@end
