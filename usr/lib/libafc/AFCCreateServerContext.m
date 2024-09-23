@implementation AFCCreateServerContext

void __AFCCreateServerContext_block_invoke(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v1 + 40))
    __AFCFlushServerBuffers(v1);
}

@end
