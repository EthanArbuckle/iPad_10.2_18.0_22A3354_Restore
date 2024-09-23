@implementation NSPointerArray(SafariCoreExtras)

- (uint64_t)safari_firstIndexOfPointer:()SafariCoreExtras
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = a1;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      v9 = 0;
      v10 = v7 + v6;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v4);
        if (*(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9) == a3)
        {
          v11 = v7 + v9;
          goto LABEL_11;
        }
        ++v9;
      }
      while (v6 != v9);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      v7 = v10;
      if (v6)
        continue;
      break;
    }
  }
  v11 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_11:

  return v11;
}

@end
