@implementation NEFlowDirectorFetchFlowStates

void __NEFlowDirectorFetchFlowStates_block_invoke(uint64_t a1)
{
  const void *v2;
  uint64_t v3;
  uint64_t v4;
  const __CFAllocator *v5;
  _DWORD *v6;

  v4 = a1 + 32;
  v2 = *(const void **)(a1 + 32);
  v3 = *(_QWORD *)(v4 + 8);
  if (*(_QWORD *)(v3 + 152))
  {
    _Block_release(v2);
  }
  else
  {
    *(_QWORD *)(v3 + 152) = v2;
    v5 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    v6 = CFAllocatorAllocate((CFAllocatorRef)*MEMORY[0x24BDBD240], 8, 0);
    *(_BYTE *)v6 = 10;
    v6[1] = 0;
    flow_director_msg_send(*(_QWORD *)(a1 + 40), (uint64_t)v6, 8uLL, 1);
    CFAllocatorDeallocate(v5, v6);
  }
}

@end
