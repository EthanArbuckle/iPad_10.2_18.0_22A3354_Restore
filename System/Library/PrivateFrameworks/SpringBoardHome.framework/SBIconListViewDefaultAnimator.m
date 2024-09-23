@implementation SBIconListViewDefaultAnimator

- (SBIconListViewDefaultAnimator)init
{
  SBIconListViewDefaultAnimator *v2;
  void *v3;
  uint64_t v4;
  SBHIconEditingSettings *iconEditingSettings;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBIconListViewDefaultAnimator;
  v2 = -[SBIconListViewDefaultAnimator init](&v7, sel_init);
  if (v2)
  {
    +[SBHHomeScreenDomain rootSettings](SBHHomeScreenDomain, "rootSettings");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "iconEditingSettings");
    v4 = objc_claimAutoreleasedReturnValue();
    iconEditingSettings = v2->_iconEditingSettings;
    v2->_iconEditingSettings = (SBHIconEditingSettings *)v4;

  }
  return v2;
}

- (void)iconListView:(id)a3 wantsAnimatedLayoutForIconView:(id)a4 withParameters:(SBIconListLayoutAnimationParameters *)a5 alongsideAnimationBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  void *v20;
  unint64_t var7;
  id v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  CGPoint var0;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  SBIconCoordinate var4;
  __int128 v34;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  -[SBHIconEditingSettings defaultSpringDuration](self->_iconEditingSettings, "defaultSpringDuration");
  v14 = v13;
  -[SBHIconEditingSettings defaultSpringDampingRatio](self->_iconEditingSettings, "defaultSpringDampingRatio");
  v16 = v15;
  v25[1] = 3221225472;
  v17 = *(_OWORD *)&a5->var2.continuousCornerRadius;
  v31 = *(_OWORD *)&a5->var2.size.height;
  v32 = v17;
  v18 = *(_OWORD *)&a5->var5;
  var4 = a5->var4;
  v34 = v18;
  v19 = *(_OWORD *)&a5->var1;
  var0 = a5->var0;
  v20 = (void *)MEMORY[0x1E0DC3F10];
  var7 = a5->var7;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[2] = __116__SBIconListViewDefaultAnimator_iconListView_wantsAnimatedLayoutForIconView_withParameters_alongsideAnimationBlock___block_invoke;
  v25[3] = &unk_1E8D88FA8;
  v30 = v19;
  v26 = v11;
  v27 = v10;
  v28 = v12;
  v22 = v12;
  v23 = v10;
  v24 = v11;
  objc_msgSend(v20, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", var7, v25, 0, v14, 0.0, v16, 0.0);

}

void __116__SBIconListViewDefaultAnimator_iconListView_wantsAnimatedLayoutForIconView_withParameters_alongsideAnimationBlock___block_invoke(uint64_t a1)
{
  void *v2;
  float minimum;
  float maximum;
  float preferred;
  double v6;
  double v7;
  double v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  CAFrameRateRange v19;

  v2 = (void *)MEMORY[0x1E0DC3F10];
  v19 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  minimum = v19.minimum;
  maximum = v19.maximum;
  preferred = v19.preferred;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __116__SBIconListViewDefaultAnimator_iconListView_wantsAnimatedLayoutForIconView_withParameters_alongsideAnimationBlock___block_invoke_2;
  v9[3] = &unk_1E8D88FA8;
  *(_OWORD *)&v19.minimum = *(_OWORD *)(a1 + 104);
  v15 = *(_OWORD *)(a1 + 88);
  v16 = *(_OWORD *)&v19.minimum;
  *(_OWORD *)&v19.minimum = *(_OWORD *)(a1 + 136);
  v17 = *(_OWORD *)(a1 + 120);
  v18 = *(_OWORD *)&v19.minimum;
  *(_OWORD *)&v19.minimum = *(_OWORD *)(a1 + 72);
  v13 = *(_OWORD *)(a1 + 56);
  v14 = *(_OWORD *)&v19.minimum;
  v10 = *(id *)(a1 + 32);
  v11 = *(id *)(a1 + 40);
  v12 = *(id *)(a1 + 48);
  *(float *)&v6 = minimum;
  *(float *)&v7 = maximum;
  *(float *)&v8 = preferred;
  objc_msgSend(v2, "sb_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1114131, v9, v6, v7, v8);

}

uint64_t __116__SBIconListViewDefaultAnimator_iconListView_wantsAnimatedLayoutForIconView_withParameters_alongsideAnimationBlock___block_invoke_2(uint64_t a1)
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
  uint64_t result;
  _OWORD v13[6];
  _QWORD v14[4];
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;

  v2 = (__int128 *)(a1 + 56);
  if (*(_BYTE *)(a1 + 136))
  {
    v3 = (void *)MEMORY[0x1E0DC3F10];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __116__SBIconListViewDefaultAnimator_iconListView_wantsAnimatedLayoutForIconView_withParameters_alongsideAnimationBlock___block_invoke_3;
    v14[3] = &unk_1E8D85240;
    v15 = *(id *)(a1 + 32);
    v4 = v2[3];
    v18 = v2[2];
    v19 = v4;
    v5 = v2[5];
    v20 = v2[4];
    v21 = v5;
    v6 = v2[1];
    v16 = *v2;
    v17 = v6;
    objc_msgSend(v3, "performWithoutAnimation:", v14);
    objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);

  }
  else
  {
    v8 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(a1 + 40);
    v9 = v2[3];
    v13[2] = v2[2];
    v13[3] = v9;
    v10 = v2[5];
    v13[4] = v2[4];
    v13[5] = v10;
    v11 = v2[1];
    v13[0] = *v2;
    v13[1] = v11;
    objc_msgSend(v7, "performDefaultAnimatedLayoutUpdateForIconView:withParameters:", v8, v13);
  }
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __116__SBIconListViewDefaultAnimator_iconListView_wantsAnimatedLayoutForIconView_withParameters_alongsideAnimationBlock___block_invoke_3(uint64_t a1)
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconEditingSettings, 0);
}

@end
