@implementation PKPayLaterValidateAmount

uint64_t __PKPayLaterValidateAmount_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, a2 == 0);
  return result;
}

@end
