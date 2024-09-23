@implementation PKSharingCapabilityShareabilitiesToStringArray

const __CFString *__PKSharingCapabilityShareabilitiesToStringArray_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  const __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;

  v2 = objc_msgSend(a2, "unsignedIntegerValue");
  v3 = CFSTR("none");
  v4 = CFSTR("max_depth_3");
  v5 = CFSTR("all");
  if (v2 != 999)
    v5 = CFSTR("none");
  if (v2 != 3)
    v4 = v5;
  if (v2 == 2)
    v3 = CFSTR("propagate");
  if (v2 == 1)
    v3 = CFSTR("direct");
  if (v2 <= 2)
    return v3;
  else
    return v4;
}

@end
