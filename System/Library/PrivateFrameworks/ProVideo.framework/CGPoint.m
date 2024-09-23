@implementation CGPoint

uint64_t __pv_CGPoint_array_from_NSArray_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;

  v3 = (_QWORD *)(*(_QWORD *)(a1 + 32) + 16 * a3);
  result = objc_msgSend(a2, "CGPointValue");
  *v3 = v5;
  v3[1] = v6;
  return result;
}

@end
