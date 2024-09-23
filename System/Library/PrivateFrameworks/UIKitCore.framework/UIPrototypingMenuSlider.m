@implementation UIPrototypingMenuSlider

uint64_t __63___UIPrototypingMenuSlider_thumbRectForBounds_trackRect_value___block_invoke(uint64_t a1)
{
  CGRect v3;
  CGRect v4;

  v3.size.width = *(CGFloat *)(a1 + 48);
  v3.size.height = *(CGFloat *)(a1 + 56);
  v3.origin.x = round(*(double *)(a1 + 64) + (*(double *)(a1 + 80) - v3.size.width) * 0.5);
  v3.origin.y = round(*(double *)(a1 + 72) + (*(double *)(a1 + 88) - v3.size.height) * 0.5);
  v4 = CGRectOffset(v3, 0.0, -3.0);
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", v4.origin.x, v4.origin.y, v4.size.width, v4.size.height);
  return objc_msgSend(*(id *)(a1 + 40), "setBounds:", *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
}

uint64_t __59___UIPrototypingMenuSlider__setKnobViewProminent_animated___block_invoke(uint64_t a1)
{
  __int128 v2;
  CGAffineTransform v4;
  CGAffineTransform v5;
  CGAffineTransform v6;
  CGAffineTransform v7;

  v2 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&v7.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&v7.c = v2;
  *(_OWORD *)&v7.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  if (*(_BYTE *)(a1 + 40))
  {
    memset(&v6, 0, sizeof(v6));
    CGAffineTransformMakeScale(&v6, 1.25, 1.25);
    v5 = v6;
    CGAffineTransformTranslate(&v7, &v5, 0.0, -35.0);
  }
  v4 = v7;
  return objc_msgSend(*(id *)(a1 + 32), "setTransform:", &v4);
}

uint64_t __59___UIPrototypingMenuSlider__setKnobViewProminent_animated___block_invoke_2(uint64_t result)
{
  uint64_t v1;
  void *v2;

  if (!*(_BYTE *)(result + 40))
  {
    v1 = result;
    objc_msgSend(*(id *)(result + 32), "knobPortal");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "removeFromSuperview");

    return objc_msgSend(*(id *)(v1 + 32), "setKnobPortal:", 0);
  }
  return result;
}

@end
