@implementation UICellAccessoryPositionBeforeAccessoryOfClass

uint64_t __UICellAccessoryPositionBeforeAccessoryOfClass_block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __UICellAccessoryPositionBeforeAccessoryOfClass_block_invoke_2;
  v3[3] = &__block_descriptor_40_e32_B32__0__UICellAccessory_8Q16_B24lu32l8;
  v3[4] = *(_QWORD *)(a1 + 32);
  result = objc_msgSend(a2, "indexOfObjectPassingTest:", v3);
  if (result == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  return result;
}

uint64_t __UICellAccessoryPositionBeforeAccessoryOfClass_block_invoke_2()
{
  return objc_opt_isKindOfClass() & 1;
}

@end
