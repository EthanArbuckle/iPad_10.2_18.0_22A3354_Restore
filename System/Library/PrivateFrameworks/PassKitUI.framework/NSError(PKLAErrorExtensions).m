@implementation NSError(PKLAErrorExtensions)

- (uint64_t)pk_isLAErrorUserCancel
{
  void *v2;
  uint64_t v3;

  if (objc_msgSend(a1, "code") != -2)
    return 0;
  objc_msgSend(a1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CC1280]);

  return v3;
}

- (uint64_t)pk_isLAErrorAuthenticationFailed
{
  void *v3;
  uint64_t v4;

  if (objc_msgSend(a1, "code") != -1)
    return 0;
  objc_msgSend(a1, "domain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CC1280]);

  return v4;
}

- (uint64_t)pk_shouldSuppressAfterAuthenticationPolicyWasLocationBased:()PKLAErrorExtensions
{
  uint64_t result;

  result = objc_msgSend(a1, "pk_isLAErrorUserCancel");
  if ((result & 1) == 0)
  {
    if (a3)
      return objc_msgSend(a1, "pk_isLAErrorAuthenticationFailed");
  }
  return result;
}

@end
