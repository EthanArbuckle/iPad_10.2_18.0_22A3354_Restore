@implementation TelephonyUSBInterfaceRegistrationHandlePoll

uint64_t ___TelephonyUSBInterfaceRegistrationHandlePoll_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(unsigned int *)(v2 + 24);
  _TelephonyUtilDebugPrint();
  (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 + 32) + 16))(*(_QWORD *)(v2 + 32), v3, v4, v5);
  v6 = *(_QWORD *)(a1 + 32);
  _TelephonyUtilDebugPrint();
  return (*(uint64_t (**)(void))(*(_QWORD *)(v6 + 40) + 16))();
}

@end
