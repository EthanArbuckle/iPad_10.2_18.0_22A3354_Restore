@implementation NEFlowDirectorSetNewFlowCallback

void __NEFlowDirectorSetNewFlowCallback_block_invoke(uint64_t a1)
{
  uint64_t v2;
  const void *v3;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(const void **)(v2 + 144);
  if (v3)
  {
    _Block_release(v3);
    v2 = *(_QWORD *)(a1 + 40);
  }
  *(_QWORD *)(v2 + 144) = *(_QWORD *)(a1 + 32);
}

@end
