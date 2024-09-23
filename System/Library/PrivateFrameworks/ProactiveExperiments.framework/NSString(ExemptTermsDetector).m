@implementation NSString(ExemptTermsDetector)

- (id)removeCharactersWithCharacterSet:()ExemptTermsDetector
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "componentsSeparatedByCharactersInSet:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "componentsJoinedByString:", &stru_1E7D9F210);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)removeApostrophes
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v1 = (void *)objc_msgSend(a1, "copy");
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = objc_msgSend(&unk_1E7DA4948, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v9;
    do
    {
      v5 = 0;
      v6 = v1;
      do
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(&unk_1E7DA4948);
        objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v5), &stru_1E7D9F210);
        v1 = (void *)objc_claimAutoreleasedReturnValue();

        ++v5;
        v6 = v1;
      }
      while (v3 != v5);
      v3 = objc_msgSend(&unk_1E7DA4948, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v3);
  }
  return v1;
}

- (id)tokens
{
  void *v2;
  uint64_t v3;
  id v4;
  _QWORD v6[4];
  id v7;

  v2 = (void *)objc_opt_new();
  v3 = objc_msgSend(a1, "length");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __39__NSString_ExemptTermsDetector__tokens__block_invoke;
  v6[3] = &unk_1E7D9DFD8;
  v4 = v2;
  v7 = v4;
  objc_msgSend(a1, "enumerateSubstringsInRange:options:usingBlock:", 0, v3, 3, v6);

  return v4;
}

@end
