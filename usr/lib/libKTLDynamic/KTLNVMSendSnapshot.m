@implementation KTLNVMSendSnapshot

uint64_t __KTLNVMSendSnapshot_block_invoke(uint64_t a1)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = ARI_CsiFpSnapshotRsp_Extract();
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
  return *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
}

@end
