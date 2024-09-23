@implementation NETRBClientSendNotification

void __NETRBClientSendNotification_block_invoke(uint64_t a1)
{
  _QWORD block[5];
  __int128 v3;
  _QWORD v4[3];
  int v5;

  v4[0] = 0;
  v4[1] = v4;
  v4[2] = 0x2000000000;
  v5 = 0;
  if (__NETRBClientGetQueue_predQueue != -1)
    dispatch_once(&__NETRBClientGetQueue_predQueue, &__block_literal_global_174);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = __NETRBClientSendNotification_block_invoke_2;
  block[3] = &unk_24DC36840;
  block[4] = v4;
  v3 = *(_OWORD *)(a1 + 32);
  dispatch_sync((dispatch_queue_t)__NETRBClientGetQueue___netrbQueue, block);
  xpc_release(*(xpc_object_t *)(a1 + 40));
  CFRelease(*(CFTypeRef *)(a1 + 32));
  _Block_object_dispose(v4, 8);
}

uint64_t __NETRBClientSendNotification_block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = __NETRBClientValidateClient(*(_BYTE **)(a1 + 40));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!(_DWORD)result)
    return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 24) + 16))();
  return result;
}

@end
