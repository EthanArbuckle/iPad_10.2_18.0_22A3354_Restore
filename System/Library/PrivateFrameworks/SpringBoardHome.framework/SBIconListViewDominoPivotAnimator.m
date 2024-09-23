@implementation SBIconListViewDominoPivotAnimator

- (SBIconListViewDominoPivotAnimator)initWithPivotIcon:(id)a3
{
  id v5;
  SBIconListViewDominoPivotAnimator *v6;
  SBIconListViewDominoPivotAnimator *v7;
  void *v8;
  uint64_t v9;
  SBHIconEditingSettings *iconEditingSettings;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SBIconListViewDominoPivotAnimator;
  v6 = -[SBIconListViewDominoPivotAnimator init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_pivotIcon, a3);
    v7->_pivotIconIndex = 0x7FFFFFFFFFFFFFFFLL;
    +[SBHHomeScreenDomain rootSettings](SBHHomeScreenDomain, "rootSettings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "iconEditingSettings");
    v9 = objc_claimAutoreleasedReturnValue();
    iconEditingSettings = v7->_iconEditingSettings;
    v7->_iconEditingSettings = (SBHIconEditingSettings *)v9;

  }
  return v7;
}

- (void)iconListView:(id)a3 wantsAnimatedLayoutForIconView:(id)a4 withParameters:(SBIconListLayoutAnimationParameters *)a5 alongsideAnimationBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  unint64_t v15;
  unint64_t v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  void *v27;
  unint64_t var7;
  id v29;
  id v30;
  id v31;
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  SBIconListViewDominoPivotAnimator *v37;
  id v38;
  CGPoint var0;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  SBIconCoordinate var4;
  __int128 v44;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  objc_msgSend(v10, "model");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "icon");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "indexForIcon:", v14);
  v16 = -[SBIconListViewDominoPivotAnimator pivotIconIndex](self, "pivotIconIndex");
  if (v16 == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[SBIconListViewDominoPivotAnimator pivotIcon](self, "pivotIcon");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
      v16 = objc_msgSend(v13, "indexForIcon:", v17);
    else
      v16 = 0x7FFFFFFFFFFFFFFFLL;
    -[SBIconListViewDominoPivotAnimator setPivotIconIndex:](self, "setPivotIconIndex:", v16);

  }
  -[SBIconListViewDominoPivotAnimator delegate](self, "delegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHIconEditingSettings defaultSpringDuration](self->_iconEditingSettings, "defaultSpringDuration");
  v20 = v19;
  -[SBHIconEditingSettings defaultSpringDampingRatio](self->_iconEditingSettings, "defaultSpringDampingRatio");
  v22 = v21 + -0.03;
  v23 = vabdd_f64((double)v15, (double)v16) * 0.05;
  v33[1] = 3221225472;
  v24 = *(_OWORD *)&a5->var2.continuousCornerRadius;
  v41 = *(_OWORD *)&a5->var2.size.height;
  v42 = v24;
  v25 = *(_OWORD *)&a5->var5;
  var4 = a5->var4;
  v44 = v25;
  v26 = *(_OWORD *)&a5->var1;
  var0 = a5->var0;
  v27 = (void *)MEMORY[0x1E0DC3F10];
  var7 = a5->var7;
  v33[0] = MEMORY[0x1E0C809B0];
  v33[2] = __120__SBIconListViewDominoPivotAnimator_iconListView_wantsAnimatedLayoutForIconView_withParameters_alongsideAnimationBlock___block_invoke;
  v33[3] = &unk_1E8D85998;
  v40 = v26;
  v34 = v11;
  v35 = v10;
  v37 = self;
  v38 = v12;
  v36 = v18;
  v29 = v18;
  v30 = v12;
  v31 = v10;
  v32 = v11;
  objc_msgSend(v27, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", var7, v33, 0, v20, v23, v22, 0.0);

}

void __120__SBIconListViewDominoPivotAnimator_iconListView_wantsAnimatedLayoutForIconView_withParameters_alongsideAnimationBlock___block_invoke(uint64_t a1)
{
  void *v2;
  float minimum;
  float maximum;
  float preferred;
  id v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  CAFrameRateRange v23;

  v2 = (void *)MEMORY[0x1E0DC3F10];
  v23 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  minimum = v23.minimum;
  maximum = v23.maximum;
  preferred = v23.preferred;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __120__SBIconListViewDominoPivotAnimator_iconListView_wantsAnimatedLayoutForIconView_withParameters_alongsideAnimationBlock___block_invoke_2;
  v11[3] = &unk_1E8D85998;
  *(_OWORD *)&v23.minimum = *(_OWORD *)(a1 + 120);
  v19 = *(_OWORD *)(a1 + 104);
  v20 = *(_OWORD *)&v23.minimum;
  v21 = *(_OWORD *)(a1 + 136);
  v22 = *(_OWORD *)(a1 + 152);
  *(_OWORD *)&v23.minimum = *(_OWORD *)(a1 + 88);
  v17 = *(_OWORD *)(a1 + 72);
  v18 = *(_OWORD *)&v23.minimum;
  v12 = *(id *)(a1 + 32);
  v13 = *(id *)(a1 + 40);
  v16 = *(id *)(a1 + 64);
  v6 = *(id *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 56);
  v14 = v6;
  v15 = v7;
  *(float *)&v8 = minimum;
  *(float *)&v9 = maximum;
  *(float *)&v10 = preferred;
  objc_msgSend(v2, "sb_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1114131, v11, v8, v9, v10);

}

uint64_t __120__SBIconListViewDominoPivotAnimator_iconListView_wantsAnimatedLayoutForIconView_withParameters_alongsideAnimationBlock___block_invoke_2(uint64_t a1)
{
  __int128 *v2;
  void *v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  void *v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  _OWORD v14[6];
  _QWORD v15[4];
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;

  v2 = (__int128 *)(a1 + 72);
  if (*(_BYTE *)(a1 + 152))
  {
    v3 = (void *)MEMORY[0x1E0DC3F10];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __120__SBIconListViewDominoPivotAnimator_iconListView_wantsAnimatedLayoutForIconView_withParameters_alongsideAnimationBlock___block_invoke_3;
    v15[3] = &unk_1E8D85240;
    v16 = *(id *)(a1 + 32);
    v4 = v2[3];
    v19 = v2[2];
    v20 = v4;
    v5 = v2[5];
    v21 = v2[4];
    v22 = v5;
    v6 = v2[1];
    v17 = *v2;
    v18 = v6;
    objc_msgSend(v3, "performWithoutAnimation:", v15);
    objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);

  }
  else
  {
    v8 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(a1 + 40);
    v9 = v2[3];
    v14[2] = v2[2];
    v14[3] = v9;
    v10 = v2[5];
    v14[4] = v2[4];
    v14[5] = v10;
    v11 = v2[1];
    v14[0] = *v2;
    v14[1] = v11;
    objc_msgSend(v7, "performDefaultAnimatedLayoutUpdateForIconView:withParameters:", v8, v14);
  }
  v12 = *(_QWORD *)(a1 + 64);
  if (v12)
    (*(void (**)(void))(v12 + 16))();
  return objc_msgSend(*(id *)(a1 + 48), "dominoPivotAnimator:didLayOutIconView:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32));
}

uint64_t __120__SBIconListViewDominoPivotAnimator_iconListView_wantsAnimatedLayoutForIconView_withParameters_alongsideAnimationBlock___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setCenter:", *(double *)(a1 + 40), *(double *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "setIconContentScale:", *(double *)(a1 + 56));
  result = objc_msgSend(*(id *)(a1 + 32), "isDropping");
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
  return result;
}

- (void)iconListView:(id)a3 wantsAnimatedRemovalForIconViews:(id)a4 completionHandler:(id)a5
{
  objc_msgSend(a3, "performDefaultAnimatedRemovalForIconViews:completionHandler:", a4, a5);
}

- (SBIcon)pivotIcon
{
  return self->_pivotIcon;
}

- (SBIconListViewDominoPivotAnimatorDelegate)delegate
{
  return (SBIconListViewDominoPivotAnimatorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)pivotIconIndex
{
  return self->_pivotIconIndex;
}

- (void)setPivotIconIndex:(unint64_t)a3
{
  self->_pivotIconIndex = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_pivotIcon, 0);
  objc_storeStrong((id *)&self->_iconEditingSettings, 0);
}

@end
