@implementation WKNavigationAction(SafariSharedUIExtras)

- (uint64_t)safari_isEligibleForContinuedTranslationWithPolicy:()SafariSharedUIExtras
{
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v7;

  result = 0;
  if (a3 <= 4 && ((1 << a3) & 0x1A) != 0)
  {
    v7 = objc_msgSend(a1, "navigationType", v3, v4);
    if ((unint64_t)(v7 + 1) <= 5)
      return (0x2Fu >> (v7 + 1)) & 1;
    else
      return 0;
  }
  return result;
}

- (uint64_t)safari_isEligibleToSpawnNewTabFromPinnedTab
{
  unint64_t v1;

  v1 = objc_msgSend(a1, "navigationType");
  return (v1 > 4) | (5u >> v1) & 1;
}

- (BOOL)safari_isNewWindowNavigationActionSpecifiedByAnchorTargetAttribute
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "targetFrame");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 == 0;

  return v2;
}

- (BOOL)safari_shouldDonateWithPolicy:()SafariSharedUIExtras
{
  uint64_t v3;
  uint64_t v4;

  return (a3 & 0xFFFFFFFFFFFFFFFDLL) != 0
      && (unint64_t)(objc_msgSend(a1, "navigationType", v3, v4) - 5) < 0xFFFFFFFFFFFFFFFDLL;
}

@end
