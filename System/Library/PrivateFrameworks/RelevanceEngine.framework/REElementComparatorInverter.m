@implementation REElementComparatorInverter

uint64_t __REElementComparatorInverter_block_invoke(uint64_t a1)
{
  uint64_t v1;

  v1 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if (v1 == 1)
    return -1;
  else
    return v1 == -1;
}

@end
