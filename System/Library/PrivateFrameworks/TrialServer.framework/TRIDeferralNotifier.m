@implementation TRIDeferralNotifier

+ (void)forwardDeferralsFromMonitoredActivity:(id)a3 usingDarwinNotificationName:(const char *)a4 whileExecutingBlock:(id)a5
{
  id v9;
  void (**v10)(_QWORD);
  void (**v11)(_QWORD);
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  uint64_t *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, xpc_activity_t);
  void *v26;
  const char *v27;
  uint64_t v28;
  unsigned __int8 *v29;
  uint64_t v30;
  char v31;

  v9 = a3;
  v10 = (void (**)(_QWORD))a5;
  v11 = v10;
  if (a4)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIDeferralNotifier.m"), 23, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("notificationName"));

    if (v11)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIDeferralNotifier.m"), 24, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

LABEL_3:
  v28 = 0;
  v29 = (unsigned __int8 *)&v28;
  v30 = 0x2020000000;
  v31 = 1;
  if (v9)
  {
    v12 = MEMORY[0x1E0C809B0];
    v23 = MEMORY[0x1E0C809B0];
    v24 = 3221225472;
    v25 = __109__TRIDeferralNotifier_forwardDeferralsFromMonitoredActivity_usingDarwinNotificationName_whileExecutingBlock___block_invoke;
    v26 = &__block_descriptor_40_e33_v16__0__NSObject_OS_xpc_object__8l;
    v27 = a4;
    v13 = xpc_activity_add_eligibility_changed_handler();
    v14 = (void *)MEMORY[0x1E0D81598];
    dispatch_get_global_queue(17, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v12;
    v19[1] = 3221225472;
    v19[2] = __109__TRIDeferralNotifier_forwardDeferralsFromMonitoredActivity_usingDarwinNotificationName_whileExecutingBlock___block_invoke_2;
    v19[3] = &unk_1E9331BE8;
    v21 = &v28;
    v20 = v9;
    v22 = a4;
    objc_msgSend(v14, "runAsyncOnQueue:afterDelaySeconds:block:", v15, v19, 1.0);

  }
  else
  {
    v13 = 0;
  }
  v16 = (void *)MEMORY[0x1D8232A5C]();
  v11[2](v11);
  objc_autoreleasePoolPop(v16);
  atomic_store(0, v29 + 24);
  if (v13)
    xpc_activity_remove_eligibility_changed_handler();
  _Block_object_dispose(&v28, 8);

}

uint64_t __109__TRIDeferralNotifier_forwardDeferralsFromMonitoredActivity_usingDarwinNotificationName_whileExecutingBlock___block_invoke(uint64_t a1, xpc_activity_t activity)
{
  uint64_t result;

  result = xpc_activity_should_defer(activity);
  if ((_DWORD)result)
    return notify_post(*(const char **)(a1 + 32));
  return result;
}

uint64_t __109__TRIDeferralNotifier_forwardDeferralsFromMonitoredActivity_usingDarwinNotificationName_whileExecutingBlock___block_invoke_2(uint64_t result)
{
  unsigned __int8 v1;
  uint64_t v2;

  v1 = atomic_load((unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24));
  if ((v1 & 1) != 0)
  {
    v2 = result;
    result = xpc_activity_should_defer(*(xpc_activity_t *)(result + 32));
    if ((_DWORD)result)
      return notify_post(*(const char **)(v2 + 48));
  }
  return result;
}

@end
