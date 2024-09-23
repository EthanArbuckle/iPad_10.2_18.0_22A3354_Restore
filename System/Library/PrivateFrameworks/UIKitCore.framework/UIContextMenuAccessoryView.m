@implementation UIContextMenuAccessoryView

uint64_t __51___UIContextMenuAccessoryView_setVisible_animated___block_invoke(uint64_t a1)
{
  double v2;
  __int128 v3;
  void *v4;
  CGAffineTransform v6;
  CGAffineTransform v7;

  v2 = 1.0;
  if (!*(_BYTE *)(a1 + 40))
    v2 = 0.0;
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", v2);
  if (*(_BYTE *)(a1 + 40))
  {
    v3 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v7.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v7.c = v3;
    *(_OWORD *)&v7.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  }
  else
  {
    CGAffineTransformMakeScale(&v7, 0.1, 0.1);
  }
  v4 = *(void **)(a1 + 32);
  v6 = v7;
  return objc_msgSend(v4, "setTransform:", &v6);
}

@end
