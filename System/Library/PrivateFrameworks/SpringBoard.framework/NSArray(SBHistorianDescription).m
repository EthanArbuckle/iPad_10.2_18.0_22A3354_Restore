@implementation NSArray(SBHistorianDescription)

- (__CFString)sb_switcherModifierDebugTimelineDescription
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  const __CFString *v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *, uint64_t);
  void *v13;
  id v14;

  if (!objc_msgSend(a1, "count"))
    return CFSTR("(Empty array)");
  v2 = (void *)objc_opt_new();
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __78__NSArray_SBHistorianDescription__sb_switcherModifierDebugTimelineDescription__block_invoke;
  v13 = &unk_1E8EBB9B8;
  v14 = v2;
  v3 = v2;
  objc_msgSend(a1, "enumerateObjectsUsingBlock:", &v10);
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = objc_msgSend(a1, "count");
  v6 = objc_msgSend(a1, "count");
  v7 = &stru_1E8EC7EC0;
  if (v6 > 1)
    v7 = CFSTR("s");
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%lu object%@:\n%@"), v5, v7, v3, v10, v11, v12, v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (__CFString *)v8;
}

@end
