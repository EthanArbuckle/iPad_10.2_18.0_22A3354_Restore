@implementation SBLayoutRoleMaskDescription

void __SBLayoutRoleMaskDescription_block_invoke(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = 1 << a2;
  if (a2 - 1 >= 0xA)
    v2 = 0;
  if (a2 - 1 <= 9 && (*(_QWORD *)(a1 + 40) & v2) == v2)
  {
    v3 = *(void **)(a1 + 32);
    SBLayoutRoleDescription(a2);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v4);

  }
}

@end
