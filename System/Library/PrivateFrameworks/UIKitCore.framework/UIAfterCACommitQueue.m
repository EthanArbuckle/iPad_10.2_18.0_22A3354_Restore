@implementation UIAfterCACommitQueue

uint64_t __57___UIAfterCACommitQueue__enqueueCommitResponse_forPhase___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "flush");
}

void __57___UIAfterCACommitQueue__enqueueCommitResponse_forPhase___block_invoke(uint64_t a1)
{
  uint64_t v1;
  unsigned __int8 *v2;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    v2 = (unsigned __int8 *)(v1 + 24);
    while (!__ldxr(v2))
    {
      if (!__stxr(1u, v2))
        goto LABEL_7;
    }
    __clrex();
  }
LABEL_7:
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57___UIAfterCACommitQueue__enqueueCommitResponse_forPhase___block_invoke_2;
  block[3] = &unk_1E16B1B28;
  block[4] = *(_QWORD *)(a1 + 40);
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

@end
