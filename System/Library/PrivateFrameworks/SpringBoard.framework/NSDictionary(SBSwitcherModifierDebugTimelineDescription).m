@implementation NSDictionary(SBSwitcherModifierDebugTimelineDescription)

- (__CFString)sb_switcherModifierDebugTimelineDescription
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  const __CFString *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a1, "count"))
    return CFSTR("(Empty dict)");
  v2 = (void *)objc_opt_new();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v3 = a1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v3, "objectForKey:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "sb_switcherModifierDebugTimelineDescription");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "setObject:forKey:", v10, v8);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v5);
  }

  v11 = (void *)MEMORY[0x1E0CB3940];
  v12 = objc_msgSend(v3, "count");
  v13 = objc_msgSend(v3, "count");
  v14 = &stru_1E8EC7EC0;
  if (v13 > 1)
    v14 = CFSTR("s");
  objc_msgSend(v11, "stringWithFormat:", CFSTR("%lu object%@:\n%@"), v12, v14, v2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return (__CFString *)v15;
}

@end
