@implementation CallTimersWithSelector

uint64_t ___CallTimersWithSelector_block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performSelector:", *(_QWORD *)(a1 + 40));
}

@end
