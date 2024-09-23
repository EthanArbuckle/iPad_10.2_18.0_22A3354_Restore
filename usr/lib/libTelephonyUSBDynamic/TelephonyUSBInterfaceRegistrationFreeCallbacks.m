@implementation TelephonyUSBInterfaceRegistrationFreeCallbacks

void ___TelephonyUSBInterfaceRegistrationFreeCallbacks_block_invoke(uint64_t a1)
{
  uint64_t v2;
  const void *v3;
  const void *v4;

  _TelephonyUtilDebugPrint();
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(const void **)(v2 + 32);
  if (v3)
  {
    _Block_release(v3);
    v2 = *(_QWORD *)(a1 + 32);
    *(_QWORD *)(v2 + 32) = 0;
  }
  v4 = *(const void **)(v2 + 40);
  if (v4)
  {
    _Block_release(v4);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = 0;
  }
}

@end
