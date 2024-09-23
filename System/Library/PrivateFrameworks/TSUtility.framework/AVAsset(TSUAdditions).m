@implementation AVAsset(TSUAdditions)

- (double)naturalSizeWithPreferredTransforms
{
  CGFloat *v1;
  CGFloat height;
  double width;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  CGFloat x;
  CGFloat y;
  uint64_t v9;
  uint64_t i;
  void *v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  CGAffineTransform v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;

  v23 = *MEMORY[0x24BDAC8D0];
  v1 = (CGFloat *)MEMORY[0x24BDBF090];
  width = *(double *)(MEMORY[0x24BDBF090] + 16);
  height = *(double *)(MEMORY[0x24BDBF090] + 24);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v4 = (void *)objc_msgSend(a1, "tracksWithMediaType:", *MEMORY[0x24BDB1D50]);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v5)
  {
    v6 = v5;
    x = *v1;
    y = v1[1];
    v9 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v4);
        v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if (objc_msgSend(v11, "isEnabled", *(_OWORD *)&v17.a, *(_OWORD *)&v17.c, *(_OWORD *)&v17.tx))
        {
          objc_msgSend(v11, "naturalSize");
          v13 = v12;
          v15 = v14;
          if (v11)
            objc_msgSend(v11, "preferredTransform");
          else
            memset(&v17, 0, sizeof(v17));
          v24.origin.x = 0.0;
          v24.origin.y = 0.0;
          v24.size.width = v13;
          v24.size.height = v15;
          v27 = CGRectApplyAffineTransform(v24, &v17);
          v25.origin.x = x;
          v25.origin.y = y;
          v25.size.width = width;
          v25.size.height = height;
          v26 = CGRectUnion(v25, v27);
          x = v26.origin.x;
          y = v26.origin.y;
          width = v26.size.width;
          height = v26.size.height;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v6);
  }
  return width;
}

+ (uint64_t)keyPathsForValuesAffectingNaturalSizeWithPreferredTransforms
{
  return objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("tracks"));
}

@end
