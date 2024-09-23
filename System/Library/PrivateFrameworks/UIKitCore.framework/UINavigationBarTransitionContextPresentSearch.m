@implementation UINavigationBarTransitionContextPresentSearch

uint64_t __112___UINavigationBarTransitionContextPresentSearch__animateFromPalette_fromPaletteFrame_toPalette_toPaletteFrame___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

uint64_t __57___UINavigationBarTransitionContextPresentSearch_animate__block_invoke(uint64_t a1)
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __57___UINavigationBarTransitionContextPresentSearch_animate__block_invoke_2;
  v2[3] = &unk_1E16B1B28;
  v2[4] = *(_QWORD *)(a1 + 32);
  return +[UIView addKeyframeWithRelativeStartTime:relativeDuration:animations:](UIView, "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v2, 0.7, 0.3);
}

uint64_t __57___UINavigationBarTransitionContextPresentSearch_animate__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 200), "setAlpha:", 1.0);
}

void __57___UINavigationBarTransitionContextPresentSearch_animate__block_invoke_3(uint64_t a1)
{
  void (**v1)(void *, const __CFString *);
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __57___UINavigationBarTransitionContextPresentSearch_animate__block_invoke_4;
  aBlock[3] = &unk_1E16B64F8;
  aBlock[4] = *(_QWORD *)(a1 + 32);
  v1 = (void (**)(void *, const __CFString *))_Block_copy(aBlock);
  v1[2](v1, CFSTR("contentView"));
  v1[2](v1, CFSTR("promptView"));
  v1[2](v1, CFSTR("weeTitleLabel"));
  v1[2](v1, CFSTR("largeTitleView"));

}

void __57___UINavigationBarTransitionContextPresentSearch_animate__block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  id v7;

  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
  v4 = a2;
  objc_msgSend(v3, "valueForKey:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "valueForKey:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v7;
  if (v7 != v5)
  {
    objc_msgSend(v7, "setAlpha:", 0.0);
    v6 = v7;
  }

}

@end
