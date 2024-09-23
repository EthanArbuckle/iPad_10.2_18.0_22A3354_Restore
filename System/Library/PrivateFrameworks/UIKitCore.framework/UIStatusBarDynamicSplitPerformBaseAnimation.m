@implementation UIStatusBarDynamicSplitPerformBaseAnimation

uint64_t ___UIStatusBarDynamicSplitPerformBaseAnimation_block_invoke(uint64_t a1)
{
  int v2;
  int v3;
  void *v4;
  void *v5;
  CGAffineTransform *v6;
  __int128 v7;
  void *v9;
  CGAffineTransform *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _OWORD v15[3];
  CGAffineTransform v16;
  CGAffineTransform v17;
  CGAffineTransform v18;
  CGAffineTransform v19;

  v2 = *(unsigned __int8 *)(a1 + 48);
  v3 = *(unsigned __int8 *)(a1 + 49);
  v4 = *(void **)(a1 + 32);
  if (v2)
  {
    if (v3)
    {
      objc_msgSend(v4, "setDynamicHidingAlpha:", 0.0);
      CGAffineTransformMakeScale(&v19, *(CGFloat *)(a1 + 40), *(CGFloat *)(a1 + 40));
      v5 = *(void **)(a1 + 32);
      v18 = v19;
      v6 = &v18;
      return objc_msgSend(v5, "setDynamicHidingTransform:", v6);
    }
    objc_msgSend(v4, "setAlpha:", 0.0);
    CGAffineTransformMakeScale(&v17, *(CGFloat *)(a1 + 40), *(CGFloat *)(a1 + 40));
    v9 = *(void **)(a1 + 32);
    v16 = v17;
    v10 = &v16;
  }
  else
  {
    if (v3)
    {
      objc_msgSend(v4, "setDynamicHidingAlpha:", 1.0);
      v5 = *(void **)(a1 + 32);
      v7 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      v15[0] = *MEMORY[0x1E0C9BAA8];
      v15[1] = v7;
      v15[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
      v6 = (CGAffineTransform *)v15;
      return objc_msgSend(v5, "setDynamicHidingTransform:", v6);
    }
    objc_msgSend(v4, "setAlpha:", 1.0);
    v9 = *(void **)(a1 + 32);
    v11 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v12 = *MEMORY[0x1E0C9BAA8];
    v13 = v11;
    v14 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    v10 = (CGAffineTransform *)&v12;
  }
  return objc_msgSend(v9, "setTransform:", v10, v12, v13, v14);
}

@end
