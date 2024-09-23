@implementation PKSharingCapabilityManageabilitiesToStringArray

const __CFString *__PKSharingCapabilityManageabilitiesToStringArray_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;

  v2 = objc_msgSend(a2, "unsignedIntegerValue");
  if ((unint64_t)(v2 + 1) > 3)
    return CFSTR("none");
  else
    return off_1E2ACBC08[v2 + 1];
}

@end
