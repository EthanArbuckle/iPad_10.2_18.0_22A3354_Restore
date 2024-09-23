@implementation UIAutologgingBackgroundFetchBlock

uint64_t ___UIAutologgingBackgroundFetchBlock_block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setCalled:", 1);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

@end
