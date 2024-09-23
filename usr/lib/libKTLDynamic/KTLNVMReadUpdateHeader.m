@implementation KTLNVMReadUpdateHeader

uint64_t __KTLNVMReadUpdateHeader_block_invoke(_QWORD *a1, AriMsg *a2, unsigned int a3)
{
  int BufCtx;
  NSObject *v7;

  *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = ARI_CsiFpUpdateHeaderData_Extract();
  BufCtx = AriMsg::GetBufCtx(a2, (const unsigned __int8 *)a3);
  v7 = a1[9];
  *(_DWORD *)(*(_QWORD *)(a1[8] + 8) + 24) = BufCtx;
  dispatch_semaphore_signal(v7);
  return *(unsigned int *)(*(_QWORD *)(a1[4] + 8) + 24);
}

@end
