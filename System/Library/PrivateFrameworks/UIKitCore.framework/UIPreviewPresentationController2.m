@implementation UIPreviewPresentationController2

uint64_t __68___UIPreviewPresentationController2_presentationTransitionWillBegin__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performPresentationAnimationsWithTransitionContext:", 0);
}

uint64_t __65___UIPreviewPresentationController2_dismissalTransitionWillBegin__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performDismissAnimationsWithTransitionContext:", 0);
}

uint64_t __56___UIPreviewPresentationController2__layoutContentViews__block_invoke(uint64_t a1)
{
  void *v1;
  __int128 v2;
  _OWORD v4[3];

  v1 = *(void **)(a1 + 32);
  v2 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v4[0] = *MEMORY[0x1E0C9BAA8];
  v4[1] = v2;
  v4[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  return objc_msgSend(v1, "setTransform:", v4);
}

void __89___UIPreviewPresentationController2__performPresentationAnimationsWithTransitionContext___block_invoke(uint64_t a1)
{
  uint64_t v2;
  double v3;
  id v4;
  uint64_t v5;
  void *v6;
  double v7;
  double v8;
  id v9;
  uint64_t v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD v32[4];
  id v33;
  id v34;
  uint64_t v35;
  id v36;

  v2 = MEMORY[0x1E0C809B0];
  v3 = *(double *)(a1 + 72);
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __89___UIPreviewPresentationController2__performPresentationAnimationsWithTransitionContext___block_invoke_2;
  v32[3] = &unk_1E16B51E8;
  v33 = *(id *)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v6 = *(void **)(a1 + 56);
  v34 = v4;
  v35 = v5;
  v36 = v6;
  +[UIView addKeyframeWithRelativeStartTime:relativeDuration:animations:](UIView, "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v32, 0.0, v3);
  v7 = *(double *)(a1 + 72);
  v8 = *(double *)(a1 + 80);
  v22[0] = v2;
  v22[1] = 3221225472;
  v22[2] = __89___UIPreviewPresentationController2__performPresentationAnimationsWithTransitionContext___block_invoke_3;
  v22[3] = &unk_1E16DAA48;
  v23 = *(id *)(a1 + 32);
  v28 = *(_OWORD *)(a1 + 88);
  v29 = *(_OWORD *)(a1 + 104);
  v30 = *(_OWORD *)(a1 + 120);
  v31 = *(_OWORD *)(a1 + 136);
  v24 = *(id *)(a1 + 64);
  v9 = *(id *)(a1 + 40);
  v10 = *(_QWORD *)(a1 + 48);
  v11 = *(void **)(a1 + 56);
  v25 = v9;
  v26 = v10;
  v27 = v11;
  +[UIView addKeyframeWithRelativeStartTime:relativeDuration:animations:](UIView, "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v22, v7, v8);
  v12 = *(double *)(a1 + 72);
  v13 = *(double *)(a1 + 80);
  v19[0] = v2;
  v19[1] = 3221225472;
  v19[2] = __89___UIPreviewPresentationController2__performPresentationAnimationsWithTransitionContext___block_invoke_4;
  v19[3] = &unk_1E16B1B50;
  v20 = *(id *)(a1 + 32);
  v21 = *(id *)(a1 + 64);
  +[UIView addKeyframeWithRelativeStartTime:relativeDuration:animations:](UIView, "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v19, v12, v13);
  v14 = *(double *)(a1 + 72);
  v17[0] = v2;
  v17[1] = 3221225472;
  v17[2] = __89___UIPreviewPresentationController2__performPresentationAnimationsWithTransitionContext___block_invoke_5;
  v17[3] = &unk_1E16B1B28;
  v18 = *(id *)(a1 + 64);
  +[UIView addKeyframeWithRelativeStartTime:relativeDuration:animations:](UIView, "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v17, v14, 0.1);
  v15[0] = v2;
  v15[1] = 3221225472;
  v15[2] = __89___UIPreviewPresentationController2__performPresentationAnimationsWithTransitionContext___block_invoke_6;
  v15[3] = &unk_1E16B1B28;
  v16 = *(id *)(a1 + 32);
  +[UIView addKeyframeWithRelativeStartTime:relativeDuration:animations:](UIView, "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v15, 0.98, 0.02);

}

void __89___UIPreviewPresentationController2__performPresentationAnimationsWithTransitionContext___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  CGAffineTransform v4;
  CGAffineTransform v5;

  CGAffineTransformMakeScale(&v5, 1.0175, 1.0175);
  v2 = *(void **)(a1 + 32);
  v4 = v5;
  objc_msgSend(v2, "setTransform:", &v4);
  objc_msgSend((id)objc_opt_class(), "_backgroundEffectForTraitCollection:interactive:", *(_QWORD *)(a1 + 56), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setEffect:", v3);

}

void __89___UIPreviewPresentationController2__performPresentationAnimationsWithTransitionContext___block_invoke_3(uint64_t a1)
{
  double MidX;
  CGFloat v3;
  double MidY;
  CGFloat v5;
  double Width;
  CGFloat v7;
  double Height;
  CGFloat v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _OWORD v15[3];
  CGAffineTransform v16;
  CGAffineTransform v17;
  CGAffineTransform v18;
  CGAffineTransform v19;

  v14 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&v19.a = *MEMORY[0x1E0C9BAA8];
  v13 = *(_OWORD *)&v19.a;
  *(_OWORD *)&v19.c = v14;
  *(_OWORD *)&v19.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  v12 = *(_OWORD *)&v19.tx;
  MidX = CGRectGetMidX(*(CGRect *)(a1 + 72));
  v3 = MidX - CGRectGetMidX(*(CGRect *)(a1 + 104));
  MidY = CGRectGetMidY(*(CGRect *)(a1 + 72));
  v5 = CGRectGetMidY(*(CGRect *)(a1 + 104));
  *(_OWORD *)&v18.a = *(_OWORD *)&v19.a;
  *(_OWORD *)&v18.c = v14;
  *(_OWORD *)&v18.tx = *(_OWORD *)&v19.tx;
  CGAffineTransformTranslate(&v19, &v18, v3, MidY - v5);
  Width = CGRectGetWidth(*(CGRect *)(a1 + 72));
  v7 = Width / CGRectGetWidth(*(CGRect *)(a1 + 104));
  Height = CGRectGetHeight(*(CGRect *)(a1 + 72));
  v9 = CGRectGetHeight(*(CGRect *)(a1 + 104));
  v17 = v19;
  CGAffineTransformScale(&v18, &v17, v7, Height / v9);
  *(_OWORD *)&v19.tx = *(_OWORD *)&v18.tx;
  v16 = v18;
  objc_msgSend(*(id *)(a1 + 32), "setTransform:", &v16);
  v10 = *(void **)(a1 + 40);
  v15[0] = v13;
  v15[1] = v14;
  v15[2] = v12;
  objc_msgSend(v10, "setTransform:", v15);
  objc_msgSend(*(id *)(a1 + 40), "setDropShadowEnabled:", 1);
  objc_msgSend((id)objc_opt_class(), "_backgroundEffectForTraitCollection:interactive:", *(_QWORD *)(a1 + 64), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "setEffect:", v11);

}

uint64_t __89___UIPreviewPresentationController2__performPresentationAnimationsWithTransitionContext___block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setBlurRadius:", 16.0);
  return objc_msgSend(*(id *)(a1 + 40), "setBlurRadius:", 0.0);
}

uint64_t __89___UIPreviewPresentationController2__performPresentationAnimationsWithTransitionContext___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

uint64_t __89___UIPreviewPresentationController2__performPresentationAnimationsWithTransitionContext___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

void __84___UIPreviewPresentationController2__performDismissAnimationsWithTransitionContext___block_invoke(uint64_t a1)
{
  uint64_t v2;
  __int128 v3;
  __int128 v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;

  v2 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __84___UIPreviewPresentationController2__performDismissAnimationsWithTransitionContext___block_invoke_2;
  v9[3] = &unk_1E16B7030;
  v10 = *(id *)(a1 + 32);
  v11 = *(id *)(a1 + 40);
  v3 = *(_OWORD *)(a1 + 64);
  v12 = *(_OWORD *)(a1 + 48);
  v13 = v3;
  v4 = *(_OWORD *)(a1 + 96);
  v14 = *(_OWORD *)(a1 + 80);
  v15 = v4;
  +[UIView addKeyframeWithRelativeStartTime:relativeDuration:animations:](UIView, "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v9, 0.0, 1.0);
  v7[0] = v2;
  v7[1] = 3221225472;
  v7[2] = __84___UIPreviewPresentationController2__performDismissAnimationsWithTransitionContext___block_invoke_3;
  v7[3] = &unk_1E16B1B28;
  v8 = *(id *)(a1 + 40);
  +[UIView addKeyframeWithRelativeStartTime:relativeDuration:animations:](UIView, "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v7, 0.2, 1.0);
  v5[0] = v2;
  v5[1] = 3221225472;
  v5[2] = __84___UIPreviewPresentationController2__performDismissAnimationsWithTransitionContext___block_invoke_4;
  v5[3] = &unk_1E16B1B28;
  v6 = *(id *)(a1 + 40);
  +[UIView addKeyframeWithRelativeStartTime:relativeDuration:animations:](UIView, "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v5, 0.0, 0.2);

}

uint64_t __84___UIPreviewPresentationController2__performDismissAnimationsWithTransitionContext___block_invoke_2(uint64_t a1)
{
  double MidX;
  CGFloat v3;
  double MidY;
  CGFloat v5;
  double Height;
  CGFloat v7;
  __int128 v9;
  CGAffineTransform v10;
  CGAffineTransform v11;
  CGAffineTransform v12;
  CGAffineTransform v13;

  objc_msgSend(*(id *)(a1 + 32), "setEffect:", 0);
  v9 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&v13.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&v13.c = v9;
  *(_OWORD *)&v13.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  MidX = CGRectGetMidX(*(CGRect *)(a1 + 48));
  v3 = MidX - CGRectGetMidX(*(CGRect *)(a1 + 80));
  MidY = CGRectGetMidY(*(CGRect *)(a1 + 48));
  v5 = CGRectGetMidY(*(CGRect *)(a1 + 80));
  *(_OWORD *)&v12.a = *(_OWORD *)&v13.a;
  *(_OWORD *)&v12.c = v9;
  *(_OWORD *)&v12.tx = *(_OWORD *)&v13.tx;
  CGAffineTransformTranslate(&v13, &v12, v3, MidY - v5);
  Height = CGRectGetHeight(*(CGRect *)(a1 + 48));
  v7 = CGRectGetHeight(*(CGRect *)(a1 + 80));
  v11 = v13;
  CGAffineTransformScale(&v12, &v11, Height / v7, Height / v7);
  *(_OWORD *)&v13.tx = *(_OWORD *)&v12.tx;
  v10 = v12;
  return objc_msgSend(*(id *)(a1 + 40), "setTransform:", &v10);
}

uint64_t __84___UIPreviewPresentationController2__performDismissAnimationsWithTransitionContext___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setBlurRadius:", 128.0);
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __84___UIPreviewPresentationController2__performDismissAnimationsWithTransitionContext___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setDropShadowEnabled:", 0);
}

@end
