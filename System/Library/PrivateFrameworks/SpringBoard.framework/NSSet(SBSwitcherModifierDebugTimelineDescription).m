@implementation NSSet(SBSwitcherModifierDebugTimelineDescription)

- (__CFString)sb_switcherModifierDebugTimelineDescription
{
  void *v2;
  void *v3;
  uint64_t v4;
  unint64_t v5;
  const __CFString *v6;
  __CFString *v7;

  if (objc_msgSend(a1, "count"))
  {
    objc_msgSend(a1, "bs_map:", &__block_literal_global_535);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (void *)MEMORY[0x1E0CB3940];
    v4 = objc_msgSend(a1, "count");
    v5 = objc_msgSend(a1, "count");
    v6 = &stru_1E8EC7EC0;
    if (v5 > 1)
      v6 = CFSTR("s");
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%lu object%@:\n%@"), v4, v6, v2);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = CFSTR("(Empty set)");
  }
  return v7;
}

@end
