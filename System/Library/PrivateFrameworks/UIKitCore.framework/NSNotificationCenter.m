@implementation NSNotificationCenter

+ (id)uikitInternalCenter
{
  objc_opt_self();
  if (qword_1ECD7F808 != -1)
    dispatch_once(&qword_1ECD7F808, &__block_literal_global_445);
  return (id)_MergedGlobals_1187;
}

- (void)_uiRemoveObserver:(void *)a3 names:
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (a1)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(a1, "removeObserver:name:object:", v5, *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++), 0);
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }
  }

}

void __59__NSNotificationCenter_UIKitAdditions__uikitInternalCenter__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB37D0]);
  v1 = (void *)_MergedGlobals_1187;
  _MergedGlobals_1187 = (uint64_t)v0;

}

void __51__NSNotificationCenter_UIKitAdditions__uikitCenter__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB37D0]);
  v1 = (void *)qword_1ECD7F810;
  qword_1ECD7F810 = (uint64_t)v0;

}

@end
