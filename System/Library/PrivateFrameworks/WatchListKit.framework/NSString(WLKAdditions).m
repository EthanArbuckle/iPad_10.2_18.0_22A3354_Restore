@implementation NSString(WLKAdditions)

- (id)wlk_stringByAppendingPathComponents:()WLKAdditions
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (wlk_stringByAppendingPathComponents__onceToken != -1)
    dispatch_once(&wlk_stringByAppendingPathComponents__onceToken, &__block_literal_global_20);
  v5 = objc_alloc(MEMORY[0x1E0CB37A0]);
  objc_msgSend(a1, "stringByTrimmingCharactersInSet:", wlk_stringByAppendingPathComponents___slash);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithString:", v6);

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = v4;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "stringByTrimmingCharactersInSet:", wlk_stringByAppendingPathComponents___slash);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "appendFormat:", CFSTR("/%@"), v13);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

  v14 = (void *)objc_msgSend(v7, "copy");
  return v14;
}

- (unint64_t)wlk_unsignedLongLongValue
{
  return strtoull((const char *)objc_msgSend(objc_retainAutorelease(a1), "UTF8String"), 0, 0);
}

@end
