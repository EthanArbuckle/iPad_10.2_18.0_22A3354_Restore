@implementation ZNK3ctu20SharedSynchronizableI12ARIXpcServerE20execute

_QWORD *___ZNK3ctu20SharedSynchronizableI12ARIXpcServerE20execute_wrapped_syncIZNS1_6createEvE3__0EEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS5__block_invoke(uint64_t a1)
{
  NSObject *v1;
  _QWORD *result;
  uint64_t v3;
  _QWORD v4[3];
  _QWORD *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v1 = *(NSObject **)(**(_QWORD **)(a1 + 40) + 40);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v4[0]) = 0;
    _os_log_impl(&dword_1BF566000, v1, OS_LOG_TYPE_DEFAULT, "#I XPC Listener: Setting up entitlement checker", (uint8_t *)v4, 2u);
  }
  v4[0] = off_1E7916858;
  v4[1] = sValidateConnection;
  v5 = v4;
  AriHostRt::RegisterEntitlementChecker();
  result = v5;
  if (v5 == v4)
  {
    v3 = 4;
    result = v4;
  }
  else
  {
    if (!v5)
      return result;
    v3 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v3))();
}

@end
