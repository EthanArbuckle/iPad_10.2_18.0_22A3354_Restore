@implementation KTLBspShutdown

uint64_t __KTLBspShutdown_block_invoke(uint64_t a1)
{
  int v2;
  NSObject *v3;

  v2 = ARI_CsiBspShutdownRspCb_Extract();
  v3 = *(NSObject **)(a1 + 40);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v2;
  dispatch_semaphore_signal(v3);
  return *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
}

@end
