@implementation DPCHandleNewQuestion

uint64_t __DPCHandleNewQuestion_block_invoke(uint64_t a1, void *a2)
{
  _DPCSubscribe(*(_QWORD *)(a1 + 32), a2);
  return 1;
}

@end
