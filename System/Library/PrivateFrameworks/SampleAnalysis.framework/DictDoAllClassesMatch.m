@implementation DictDoAllClassesMatch

void __DictDoAllClassesMatch_block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v6;

  v6 = a3;
  if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_isKindOfClass() & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }

}

@end
