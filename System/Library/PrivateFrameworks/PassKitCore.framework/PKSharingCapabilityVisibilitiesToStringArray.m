@implementation PKSharingCapabilityVisibilitiesToStringArray

__CFString *__PKSharingCapabilityVisibilitiesToStringArray_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  __CFString *v3;

  v2 = objc_msgSend(a2, "unsignedIntegerValue");
  v3 = CFSTR("none");
  if (v2 == 1)
    v3 = CFSTR("propagate");
  if (v2 == 2)
    return CFSTR("all");
  else
    return v3;
}

@end
