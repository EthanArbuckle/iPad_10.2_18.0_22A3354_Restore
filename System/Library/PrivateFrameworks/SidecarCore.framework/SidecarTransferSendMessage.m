@implementation SidecarTransferSendMessage

void __SidecarTransferSendMessage_block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  void *v4;

  v2 = atomic_load((unsigned int *)(*(_QWORD *)(a1 + 32) + 40));
  v3 = *(void **)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  if (v2 < 1)
    __SidecarTransferSendMessage(v3, v4);
  else
    SidecarTransferMessageEnqueue(v3, v4);
}

uint64_t ____SidecarTransferSendMessage_block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendCompletion:", a2);
}

@end
