@implementation SidecarRequestEnsureTransferReceiver

void __SidecarRequestEnsureTransferReceiver_block_invoke(_QWORD *a1)
{
  SidecarTransferReceiver *v2;
  uint64_t v3;
  void *v4;

  objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), *(id *)(a1[4] + 88));
  if (!*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
  {
    v2 = -[SidecarTransferReceiver initWithSession:requestID:]([SidecarTransferReceiver alloc], "initWithSession:requestID:", a1[5], a1[7]);
    v3 = *(_QWORD *)(a1[6] + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

    objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "setDelegate:", a1[4]);
    objc_storeStrong((id *)(a1[4] + 88), *(id *)(*(_QWORD *)(a1[6] + 8) + 40));
  }
}

@end
