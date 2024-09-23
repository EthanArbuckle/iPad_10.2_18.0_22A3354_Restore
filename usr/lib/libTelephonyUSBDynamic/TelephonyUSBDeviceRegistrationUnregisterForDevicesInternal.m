@implementation TelephonyUSBDeviceRegistrationUnregisterForDevicesInternal

void ___TelephonyUSBDeviceRegistrationUnregisterForDevicesInternal_block_invoke(uint64_t a1)
{
  _QWORD *v2;
  const void *v3;
  IONotificationPort *v4;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = (const void *)v2[1];
  if (v3)
  {
    if (*v2)
    {
      _TelephonyUtilDebugPrint();
      CFRunLoopRemoveSource(**(CFRunLoopRef **)(a1 + 32), *(CFRunLoopSourceRef *)(*(_QWORD *)(a1 + 32) + 8), (CFRunLoopMode)*MEMORY[0x24BDBD5A0]);
      v3 = *(const void **)(*(_QWORD *)(a1 + 32) + 8);
    }
    CFRelease(v3);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) = 0;
    v2 = *(_QWORD **)(a1 + 32);
  }
  v4 = (IONotificationPort *)v2[2];
  if (v4)
  {
    IONotificationPortDestroy(v4);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = 0;
  }
}

@end
