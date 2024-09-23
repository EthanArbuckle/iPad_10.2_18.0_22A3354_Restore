@implementation KTLGetManifestStatus

uint64_t __KTLGetManifestStatus_block_invoke(uint64_t a1)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = ARI_CsiIceGetManifestStatusResp_Extract();
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
  return *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
}

@end
