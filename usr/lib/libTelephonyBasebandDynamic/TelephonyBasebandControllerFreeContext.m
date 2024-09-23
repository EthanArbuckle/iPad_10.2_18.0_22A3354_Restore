@implementation TelephonyBasebandControllerFreeContext

uint64_t __TelephonyBasebandControllerFreeContext_block_invoke(uint64_t a1)
{
  uint64_t v2;
  kern_return_t v3;
  char v4;
  io_object_t v5;
  uint64_t v6;
  const __CFString *v7;
  IONotificationPort *v8;
  io_object_t v9;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 40);
  if (*(_DWORD *)v2 && (v3 = IOServiceClose(*(_DWORD *)v2), *(_DWORD *)v2 = 0, v3))
  {
    _TelephonyUtilDebugPrintError();
    v4 = 0;
  }
  else
  {
    v4 = 1;
  }
  v5 = *(_DWORD *)(v2 + 4);
  if (v5)
  {
    IOObjectRelease(v5);
    *(_DWORD *)(v2 + 4) = 0;
  }
  if (*(_QWORD *)(v2 + 40))
  {
    v6 = *(_QWORD *)(v2 + 48);
    if (v6)
    {
      _TelephonyBasebandControllerRemoveFromEventQueue_sync(*(uint64_t **)(v2 + 96), v6);
      v7 = (const __CFString *)*MEMORY[0x24BDBD598];
      if (CFRunLoopContainsSource(*(CFRunLoopRef *)(v2 + 48), *(CFRunLoopSourceRef *)(v2 + 40), (CFRunLoopMode)*MEMORY[0x24BDBD598]))
      {
        CFRunLoopRemoveSource(*(CFRunLoopRef *)(v2 + 48), *(CFRunLoopSourceRef *)(v2 + 40), v7);
      }
    }
    *(_QWORD *)(v2 + 40) = 0;
  }
  v8 = *(IONotificationPort **)(v2 + 24);
  if (v8)
  {
    IONotificationPortDestroy(v8);
    *(_QWORD *)(v2 + 24) = 0;
  }
  v9 = *(_DWORD *)(v2 + 32);
  if (v9)
  {
    IOObjectRelease(v9);
    *(_DWORD *)(v2 + 32) = 0;
  }
  result = *(unsigned int *)(v2 + 8);
  if ((_DWORD)result)
  {
    result = IOObjectRelease(result);
    *(_DWORD *)(v2 + 8) = 0;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v4;
  return result;
}

intptr_t __TelephonyBasebandControllerFreeContext_block_invoke_13(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __TelephonyBasebandControllerFreeContext_block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  const void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(const void **)(v2 + 80);
  if (v3)
  {
    _Block_release(v3);
    v2 = *(_QWORD *)(a1 + 32);
    *(_QWORD *)(v2 + 80) = 0;
  }
  *(_QWORD *)(v2 + 88) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104) = 0;
}

@end
