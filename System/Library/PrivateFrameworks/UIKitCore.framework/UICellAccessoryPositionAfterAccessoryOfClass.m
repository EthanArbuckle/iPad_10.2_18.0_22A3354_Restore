@implementation UICellAccessoryPositionAfterAccessoryOfClass

uint64_t __UICellAccessoryPositionAfterAccessoryOfClass_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v7[5];

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __UICellAccessoryPositionAfterAccessoryOfClass_block_invoke_2;
  v7[3] = &__block_descriptor_40_e32_B32__0__UICellAccessory_8Q16_B24lu32l8;
  v7[4] = *(_QWORD *)(a1 + 32);
  v4 = objc_msgSend(v3, "indexOfObjectWithOptions:passingTest:", 2, v7);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
    v5 = objc_msgSend(v3, "count");
  else
    v5 = v4 + 1;

  return v5;
}

uint64_t __UICellAccessoryPositionAfterAccessoryOfClass_block_invoke_2()
{
  return objc_opt_isKindOfClass() & 1;
}

@end
