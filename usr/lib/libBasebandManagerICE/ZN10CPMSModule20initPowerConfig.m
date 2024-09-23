@implementation ZN10CPMSModule20initPowerConfig

NSObject *___ZN10CPMSModule20initPowerConfig_syncEv_block_invoke_41(_QWORD *a1)
{
  std::__shared_weak_count *v2;
  _QWORD *v3;
  capabilities::abs *v4;
  std::__shared_weak_count *v5;
  NSObject *v6;
  NSObject *v7;
  dispatch_time_t v8;
  NSObject *v9;
  NSObject *v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  _QWORD v14[5];
  _QWORD *v15;
  void *aBlock;
  NSObject *v17;
  capabilities::abs *v19;
  _QWORD v20[6];
  _QWORD *v21;
  uint64_t block;
  uint64_t v23;
  uint64_t (*v24)(uint64_t);
  void *v25;
  unint64_t *v26;
  _QWORD *v27;
  unint64_t v28;

  v2 = (std::__shared_weak_count *)a1[6];
  if (!v2)
    return 0;
  v3 = (_QWORD *)a1[4];
  v4 = (capabilities::abs *)std::__shared_weak_count::lock(v2);
  v19 = v4;
  if (!v4)
    return 0;
  v5 = (std::__shared_weak_count *)v4;
  if (!a1[5])
  {
    v7 = 0;
    goto LABEL_25;
  }
  if (!capabilities::abs::supportsCPMSGetPowerFromBB(v4))
    goto LABEL_21;
  v6 = dispatch_group_create();
  v7 = v6;
  if (v6)
  {
    dispatch_retain(v6);
    dispatch_group_enter(v7);
    dispatch_retain(v7);
    dispatch_group_enter(v7);
  }
  aBlock = 0;
  v17 = v7;
  CPMSModule::getCurrentPower((uint64_t)v3, &v17, (uint64_t *)&aBlock);
  if (aBlock)
    _Block_release(aBlock);
  if (v7)
  {
    dispatch_group_leave(v7);
    dispatch_release(v7);
    dispatch_group_leave(v7);
    dispatch_release(v7);
  }
  v8 = dispatch_time(0, 3000000000);
  if (!dispatch_group_wait(v7, v8))
  {
    if (v7)
      dispatch_release(v7);
LABEL_21:
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = ___ZN10CPMSModule20initPowerConfig_syncEv_block_invoke_42;
    v14[3] = &__block_descriptor_40_e19___NSDictionary_8__0l;
    v14[4] = v3;
    v15 = v14;
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = ___ZNK3ctu20SharedSynchronizableI10CPMSModuleE20execute_wrapped_syncIU13block_pointerFP12NSDictionaryvEEEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS8__block_invoke;
    v20[3] = &__block_descriptor_48_e19___NSDictionary_8__0l;
    v20[4] = v3 + 15;
    v20[5] = &v15;
    v21 = v20;
    v11 = v3[17];
    if (v3[18])
    {
      v28 = 0xAAAAAAAAAAAAAAAALL;
      block = MEMORY[0x1E0C809B0];
      v23 = 3221225472;
      v24 = ___ZN8dispatch19async_and_wait_implIRU13block_pointerFP12NSDictionaryvEEENSt3__15decayIDTclfp0_EEE4typeEP16dispatch_queue_sOT_NS6_17integral_constantIbLb0EEE_block_invoke;
      v25 = &__block_descriptor_48_e5_v8__0l;
      v26 = &v28;
      v27 = &v21;
      dispatch_async_and_wait(v11, &block);
    }
    else
    {
      v28 = 0xAAAAAAAAAAAAAAAALL;
      block = MEMORY[0x1E0C809B0];
      v23 = 3221225472;
      v24 = ___ZN8dispatch9sync_implIRU13block_pointerFP12NSDictionaryvEEENSt3__15decayIDTclfp0_EEE4typeEP16dispatch_queue_sOT_NS6_17integral_constantIbLb0EEE_block_invoke;
      v25 = &__block_descriptor_48_e5_v8__0l;
      v26 = &v28;
      v27 = &v21;
      dispatch_sync(v11, &block);
    }
    v7 = v28;
    goto LABEL_25;
  }
  v9 = v3[11];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    LOWORD(block) = 0;
    _os_log_error_impl(&dword_1BF566000, v9, OS_LOG_TYPE_ERROR, "Timeout for getting power estimation", (uint8_t *)&block, 2u);
    if (!v7)
      goto LABEL_25;
    goto LABEL_14;
  }
  if (v7)
  {
LABEL_14:
    dispatch_release(v7);
    v7 = 0;
  }
LABEL_25:
  p_shared_owners = (unint64_t *)&v5->__shared_owners_;
  do
    v13 = __ldaxr(p_shared_owners);
  while (__stlxr(v13 - 1, p_shared_owners));
  if (v13)
    return v7;
  ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
  std::__shared_weak_count::__release_weak(v5);
  return v7;
}

@end
