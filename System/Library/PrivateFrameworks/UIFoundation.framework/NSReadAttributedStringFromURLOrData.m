@implementation NSReadAttributedStringFromURLOrData

id ___NSReadAttributedStringFromURLOrData_block_invoke(_QWORD *a1, void *a2, void *a3, void *a4)
{
  id result;

  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 40) = a2;
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40) = a3;
  result = a4;
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) = result;
  return result;
}

@end
