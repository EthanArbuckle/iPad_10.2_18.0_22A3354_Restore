@implementation UIResizableView

- (CGSize)sizeThatFits:(CGSize)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  float v7;
  float v8;
  uint64_t i;
  double v10;
  double v11;
  float v12;
  double v13;
  double v14;
  float v15;
  double v16;
  double v17;
  double v18;
  double v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;
  CGSize result;

  v25 = *MEMORY[0x1E0C80C00];
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[UIResizableView subviews](self, "subviews", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v21;
    v7 = 0.0;
    v8 = 0.0;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v21 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "frame");
        v12 = v10 + v11;
        v15 = v13 + v14;
        if (v8 <= v12)
          v8 = v12;
        if (v7 <= v15)
          v7 = v15;
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v5);
    v16 = v8;
    v17 = v7;
  }
  else
  {
    v17 = 0.0;
    v16 = 0.0;
  }

  v18 = v16;
  v19 = v17;
  result.height = v19;
  result.width = v18;
  return result;
}

@end
