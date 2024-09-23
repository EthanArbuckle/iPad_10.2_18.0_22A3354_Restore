@implementation UINavigationBarTransitionContextZoom

void __48___UINavigationBarTransitionContextZoom_prepare__block_invoke(uint64_t a1, void *a2, double a3, double a4, double a5, double a6)
{
  id v11;
  id v12;

  v11 = a2;
  objc_msgSend(v11, "snapshotViewAfterScreenUpdates:", 0);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setHidden:", 1);

  objc_msgSend(v12, "setFrame:", a3, a4, a5, a6);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "addSubview:", v12);
  objc_msgSend(*(id *)(a1 + 32), "_addTemporaryView:", v12);

}

void __48___UINavigationBarTransitionContextZoom_prepare__block_invoke_2(uint64_t a1, void *a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  id v11;
  double x;
  double y;
  double width;
  double height;
  double v16;
  double v17;
  UIView *v19;
  id v20;
  CGRect v21;
  CGRect v22;

  v11 = a2;
  objc_msgSend(v11, "snapshotViewAfterScreenUpdates:", 0);
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setHidden:", 1);

  v21.origin.x = a3;
  v21.origin.y = a4;
  v21.size.width = a5;
  v21.size.height = a6;
  v22 = CGRectOffset(v21, 0.0, *(CGFloat *)(a1 + 40));
  x = v22.origin.x;
  y = v22.origin.y;
  width = v22.size.width;
  height = v22.size.height;
  objc_msgSend(v20, "frame");
  if (a5 == v17 && a6 == v16)
  {
    objc_msgSend(v20, "setFrame:", x, y, width, height);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "addSubview:", v20);
  }
  else
  {
    v19 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", x, y, width, height);
    -[UIView setClipsToBounds:](v19, "setClipsToBounds:", 1);
    -[UIView addSubview:](v19, "addSubview:", v20);

    v20 = v19;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "addSubview:", v19);
  }
  objc_msgSend(*(id *)(a1 + 32), "_addTemporaryView:", v20);

}

void __58___UINavigationBarTransitionContextZoom__animateSearchBar__block_invoke(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v2;

  v1 = *(_QWORD **)(*(_QWORD *)(a1 + 32) + 72);
  if (v1)
    v1 = (_QWORD *)v1[30];
  v2 = v1;
  objc_msgSend(v2, "setAlpha:", 0.0);

}

void __58___UINavigationBarTransitionContextZoom__animateSearchBar__block_invoke_2(uint64_t a1)
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

void __58___UINavigationBarTransitionContextZoom__animateSearchBar__block_invoke_3(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v2;

  v1 = *(_QWORD **)(*(_QWORD *)(a1 + 32) + 72);
  if (v1)
    v1 = (_QWORD *)v1[30];
  v2 = v1;
  objc_msgSend(v2, "setAlpha:", 0.0);

}

void __58___UINavigationBarTransitionContextZoom__animateSearchBar__block_invoke_4(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v2;

  v1 = *(_QWORD **)(*(_QWORD *)(a1 + 32) + 80);
  if (v1)
    v1 = (_QWORD *)v1[30];
  v2 = v1;
  objc_msgSend(v2, "setAlpha:", 1.0);

}

uint64_t __103___UINavigationBarTransitionContextZoom__animateFromPalette_fromPaletteFrame_toPalette_toPaletteFrame___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

id __63___UINavigationBarTransitionContextZoom__animateBackgroundView__block_invoke(uint64_t a1)
{
  objc_super v2;

  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)_UINavigationBarTransitionContextZoom;
  return objc_msgSendSuper2(&v2, sel__animateBackgroundView);
}

void __48___UINavigationBarTransitionContextZoom_animate__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  _QWORD v8[6];

  objc_msgSend(*(id *)(a1 + 32), "_animateContentView");
  objc_msgSend(*(id *)(a1 + 32), "_animateLargeTitleView");
  objc_msgSend(*(id *)(a1 + 32), "_animateSearchBar");
  -[_UINavigationBarTransitionContext _animatePalettes](*(_QWORD **)(a1 + 32));
  v2 = *(_QWORD *)(a1 + 32);
  if ((*(_WORD *)(v2 + 160) & 1) != 0)
  {
    objc_msgSend(*(id *)(v2 + 8), "frame");
    v5 = *(_QWORD *)(a1 + 32);
    v3 = *(_QWORD *)(v5 + 80);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __48___UINavigationBarTransitionContextZoom_animate__block_invoke_2;
    v8[3] = &unk_1E16B6490;
    v8[5] = v6;
    v8[4] = v5;
    v4 = v8;
  }
  else
  {
    v3 = *(_QWORD *)(v2 + 80);
    v4 = &__block_literal_global_257;
  }
  -[_UINavigationBarLayout iterateLayoutViews:](v3, v4);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "layer");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAllowsHitTesting:", 0);

}

void __48___UINavigationBarTransitionContextZoom_animate__block_invoke_2(uint64_t a1, void *a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  id v11;
  _UIPortalView *v12;
  CGRect v13;
  CGRect v14;

  v11 = a2;
  v12 = -[_UIPortalView initWithSourceView:]([_UIPortalView alloc], "initWithSourceView:", v11);
  objc_msgSend(v11, "setHidden:", 0);

  v13.origin.x = a3;
  v13.origin.y = a4;
  v13.size.width = a5;
  v13.size.height = a6;
  v14 = CGRectOffset(v13, 0.0, *(CGFloat *)(a1 + 40));
  -[_UIPortalView setFrame:](v12, "setFrame:", v14.origin.x, v14.origin.y, v14.size.width, v14.size.height);
  -[_UIPortalView setHidesSourceView:](v12, "setHidesSourceView:", 1);
  -[_UIPortalView setAllowsHitTesting:](v12, "setAllowsHitTesting:", 1);
  -[_UIPortalView setForwardsClientHitTestingToSourceView:](v12, "setForwardsClientHitTestingToSourceView:", 1);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "addSubview:", v12);
  objc_msgSend(*(id *)(a1 + 32), "_addTemporaryView:", v12);

}

uint64_t __48___UINavigationBarTransitionContextZoom_animate__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setHidden:", 0);
}

uint64_t __63___UINavigationBarTransitionContextZoom_prepareForInterruption__block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "_cleanupZoomContent");
}

uint64_t __60___UINavigationBarTransitionContextZoom__cleanupZoomContent__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setHidden:", 0);
}

uint64_t __60___UINavigationBarTransitionContextZoom__cleanupZoomContent__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setHidden:", 0);
}

@end
