@implementation UINavigationBarTransitionContextDismissSearch

uint64_t __112___UINavigationBarTransitionContextDismissSearch__animateFromPalette_fromPaletteFrame_toPalette_toPaletteFrame___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

uint64_t __57___UINavigationBarTransitionContextDismissSearch_animate__block_invoke(uint64_t a1)
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __57___UINavigationBarTransitionContextDismissSearch_animate__block_invoke_2;
  v2[3] = &unk_1E16B1B28;
  v2[4] = *(_QWORD *)(a1 + 32);
  return +[UIView addKeyframeWithRelativeStartTime:relativeDuration:animations:](UIView, "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v2, 0.0, 0.3);
}

uint64_t __57___UINavigationBarTransitionContextDismissSearch_animate__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "setAlpha:", 0.0);
}

uint64_t __57___UINavigationBarTransitionContextDismissSearch_animate__block_invoke_3(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;

  v2 = *(_QWORD **)(*(_QWORD *)(a1 + 32) + 80);
  if (v2)
    v2 = (_QWORD *)v2[16];
  v3 = v2;
  objc_msgSend(v3, "setAlpha:", 1.0);

  v4 = *(_QWORD **)(*(_QWORD *)(a1 + 32) + 80);
  if (v4)
    v4 = (_QWORD *)v4[15];
  v5 = v4;
  objc_msgSend(v5, "setAlpha:", 1.0);

  v6 = *(_QWORD **)(*(_QWORD *)(a1 + 32) + 80);
  if (v6)
    v6 = (_QWORD *)v6[29];
  v7 = v6;
  objc_msgSend(v7, "setAlpha:", 1.0);

  return objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 1.0);
}

uint64_t __58___UINavigationBarTransitionContextDismissSearch_complete__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "layoutIfNeeded");
}

@end
