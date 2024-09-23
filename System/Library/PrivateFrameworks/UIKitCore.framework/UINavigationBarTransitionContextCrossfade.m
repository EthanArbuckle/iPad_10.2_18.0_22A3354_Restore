@implementation UINavigationBarTransitionContextCrossfade

void __65___UINavigationBarTransitionContextCrossfade__animateContentView__block_invoke(uint64_t a1)
{
  id v2;

  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "setContentHidden:", 1);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "augmentedTitleView");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_performNavigationBarTransition:willBeDisplayed:", 2, 0);

  }
}

void __65___UINavigationBarTransitionContextCrossfade__animateContentView__block_invoke_2(uint64_t a1)
{
  id v2;

  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "setBackButtonHidden:titleLabelHidden:titleViewHidden:barsHidden:", 0, (*(unsigned __int16 *)(*(_QWORD *)(a1 + 32) + 160) >> 6) & 1, 0, 0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "augmentedTitleView");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_performNavigationBarTransition:willBeDisplayed:", 2, 1);

  }
}

uint64_t __68___UINavigationBarTransitionContextCrossfade__animateLargeTitleView__block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 32);
  if ((*(_WORD *)(v1 + 160) & 0x20) != 0)
    return objc_msgSend(*(id *)(v1 + 104), "setContentHidden:", 1);
  return result;
}

uint64_t __68___UINavigationBarTransitionContextCrossfade__animateLargeTitleView__block_invoke_2(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 32);
  if ((*(_WORD *)(v1 + 160) & 0x40) != 0)
    return objc_msgSend(*(id *)(v1 + 112), "setContentHidden:", 0);
  return result;
}

void __63___UINavigationBarTransitionContextCrossfade__animateSearchBar__block_invoke(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v2;

  v1 = *(_QWORD **)(*(_QWORD *)(a1 + 32) + 72);
  if (v1)
    v1 = (_QWORD *)v1[30];
  v2 = v1;
  objc_msgSend(v2, "setAlpha:", 0.0);

}

void __63___UINavigationBarTransitionContextCrossfade__animateSearchBar__block_invoke_2(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  _QWORD *v11;
  _QWORD *v12;

  v2 = *(_QWORD **)(*(_QWORD *)(a1 + 32) + 80);
  if (v2)
    v2 = (_QWORD *)v2[30];
  v3 = v2;
  objc_msgSend(v3, "setAlpha:", 1.0);

  v4 = -[_UINavigationBarLayout searchBarLayoutFrame](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80));
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = *(_QWORD **)(*(_QWORD *)(a1 + 32) + 80);
  if (v11)
    v11 = (_QWORD *)v11[30];
  v12 = v11;
  objc_msgSend(v12, "setFrame:", v4, v6, v8, v10);

}

void __63___UINavigationBarTransitionContextCrossfade__animateSearchBar__block_invoke_3(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v2;

  v1 = *(_QWORD **)(*(_QWORD *)(a1 + 32) + 72);
  if (v1)
    v1 = (_QWORD *)v1[30];
  v2 = v1;
  objc_msgSend(v2, "setAlpha:", 0.0);

}

void __63___UINavigationBarTransitionContextCrossfade__animateSearchBar__block_invoke_4(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v2;

  v1 = *(_QWORD **)(*(_QWORD *)(a1 + 32) + 80);
  if (v1)
    v1 = (_QWORD *)v1[30];
  v2 = v1;
  objc_msgSend(v2, "setAlpha:", 1.0);

}

uint64_t __108___UINavigationBarTransitionContextCrossfade__animateFromPalette_fromPaletteFrame_toPalette_toPaletteFrame___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

@end
