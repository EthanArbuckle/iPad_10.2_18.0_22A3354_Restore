@implementation NSArray(Accessibility)

- (double)accessibilityFrame
{
  double x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;

  v20 = *MEMORY[0x1E0C80C00];
  x = *MEMORY[0x1E0C9D628];
  y = *(double *)(MEMORY[0x1E0C9D628] + 8);
  width = *(double *)(MEMORY[0x1E0C9D628] + 16);
  height = *(double *)(MEMORY[0x1E0C9D628] + 24);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = a1;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v9), "accessibilityFrame", (_QWORD)v15);
        v24.origin.x = v10;
        v24.origin.y = v11;
        v24.size.width = v12;
        v24.size.height = v13;
        v21.origin.x = x;
        v21.origin.y = y;
        v21.size.width = width;
        v21.size.height = height;
        v22 = CGRectUnion(v21, v24);
        x = v22.origin.x;
        y = v22.origin.y;
        width = v22.size.width;
        height = v22.size.height;
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  v23.origin.x = x;
  v23.origin.y = y;
  v23.size.width = width;
  v23.size.height = height;
  if (CGRectIsNull(v23))
    return *MEMORY[0x1E0C9D648];
  return x;
}

@end
