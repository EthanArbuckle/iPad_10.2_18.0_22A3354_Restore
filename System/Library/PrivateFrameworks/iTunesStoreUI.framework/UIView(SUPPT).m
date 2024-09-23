@implementation UIView(SUPPT)

- (void)_firstDescendantOfKind:()SUPPT
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)objc_msgSend(a1, "subviews");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = *(_QWORD *)v13;
LABEL_3:
  v8 = 0;
  while (1)
  {
    if (*(_QWORD *)v13 != v7)
      objc_enumerationMutation(v4);
    v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v8);
    if ((objc_opt_isKindOfClass() & 1) != 0)
      return v9;
    v10 = objc_msgSend(v9, "_firstDescendantOfKind:", a3);
    if (v10)
      return (void *)v10;
    if (v6 == ++v8)
    {
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      v9 = 0;
      if (v6)
        goto LABEL_3;
      return v9;
    }
  }
}

- (uint64_t)firstScrollViewDescendant
{
  return objc_msgSend(a1, "_firstDescendantOfKind:", objc_opt_class());
}

@end
