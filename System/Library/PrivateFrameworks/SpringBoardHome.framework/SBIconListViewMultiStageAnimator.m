@implementation SBIconListViewMultiStageAnimator

- (SBIconListViewMultiStageAnimator)init
{
  SBIconListViewMultiStageAnimator *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBIconListViewMultiStageAnimator;
  result = -[SBIconListViewMultiStageAnimator init](&v3, sel_init);
  if (result)
    result->_iconInitialCenter = (CGPoint)vdupq_n_s64(0xC0C3880000000000);
  return result;
}

- (void)iconListView:(id)a3 wantsAnimatedLayoutForIconView:(id)a4 withParameters:(SBIconListLayoutAnimationParameters *)a5 alongsideAnimationBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  double v13;
  void *v14;
  unint64_t var7;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  CGPoint var0;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  SBIconCoordinate var4;
  __int128 v31;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = dbl_1D0193EE0[!a5->var5];
  v14 = (void *)MEMORY[0x1E0DC3F10];
  var7 = a5->var7;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __119__SBIconListViewMultiStageAnimator_iconListView_wantsAnimatedLayoutForIconView_withParameters_alongsideAnimationBlock___block_invoke;
  v22[3] = &unk_1E8D8BF70;
  v16 = *(_OWORD *)&a5->var2.continuousCornerRadius;
  v28 = *(_OWORD *)&a5->var2.size.height;
  v29 = v16;
  v17 = *(_OWORD *)&a5->var5;
  var4 = a5->var4;
  v31 = v17;
  v18 = *(_OWORD *)&a5->var1;
  var0 = a5->var0;
  v27 = v18;
  v22[4] = self;
  v23 = v11;
  v24 = v10;
  v25 = v12;
  v19 = v12;
  v20 = v10;
  v21 = v11;
  objc_msgSend(v14, "animateWithDuration:delay:options:animations:completion:", var7, v22, 0, 0.3, v13);

}

void __119__SBIconListViewMultiStageAnimator_iconListView_wantsAnimatedLayoutForIconView_withParameters_alongsideAnimationBlock___block_invoke(uint64_t a1)
{
  void *v2;
  float minimum;
  float maximum;
  float preferred;
  void *v6;
  double v7;
  double v8;
  double v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  CAFrameRateRange v20;

  v2 = (void *)MEMORY[0x1E0DC3F10];
  v20 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  minimum = v20.minimum;
  maximum = v20.maximum;
  preferred = v20.preferred;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[2] = __119__SBIconListViewMultiStageAnimator_iconListView_wantsAnimatedLayoutForIconView_withParameters_alongsideAnimationBlock___block_invoke_2;
  v10[3] = &unk_1E8D8BF70;
  v6 = *(void **)(a1 + 40);
  v10[4] = *(_QWORD *)(a1 + 32);
  v10[1] = 3221225472;
  *(_OWORD *)&v20.maximum = *(_OWORD *)(a1 + 112);
  v16 = *(_OWORD *)(a1 + 96);
  v17 = *(_OWORD *)&v20.maximum;
  *(_OWORD *)&v20.maximum = *(_OWORD *)(a1 + 144);
  v18 = *(_OWORD *)(a1 + 128);
  v19 = *(_OWORD *)&v20.maximum;
  *(_OWORD *)&v20.maximum = *(_OWORD *)(a1 + 80);
  v14 = *(_OWORD *)(a1 + 64);
  v15 = *(_OWORD *)&v20.maximum;
  v11 = v6;
  v12 = *(id *)(a1 + 48);
  v13 = *(id *)(a1 + 56);
  *(float *)&v7 = minimum;
  *(float *)&v8 = maximum;
  *(float *)&v9 = preferred;
  objc_msgSend(v2, "sb_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1114131, v10, v7, v8, v9);

}

uint64_t __119__SBIconListViewMultiStageAnimator_iconListView_wantsAnimatedLayoutForIconView_withParameters_alongsideAnimationBlock___block_invoke_2(uint64_t a1)
{
  __int128 *v2;
  void *v3;
  void *v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  void *v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  void *v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t result;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD v25[5];
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;

  v2 = (__int128 *)(a1 + 64);
  if (*(_BYTE *)(a1 + 144))
  {
    v25[0] = MEMORY[0x1E0C809B0];
    v25[2] = __119__SBIconListViewMultiStageAnimator_iconListView_wantsAnimatedLayoutForIconView_withParameters_alongsideAnimationBlock___block_invoke_3;
    v25[3] = &unk_1E8D8D760;
    v3 = *(void **)(a1 + 40);
    v25[4] = *(_QWORD *)(a1 + 32);
    v4 = (void *)MEMORY[0x1E0DC3F10];
    v25[1] = 3221225472;
    v5 = *(_OWORD *)(a1 + 112);
    v29 = *(_OWORD *)(a1 + 96);
    v30 = v5;
    v6 = *(_OWORD *)(a1 + 144);
    v31 = *(_OWORD *)(a1 + 128);
    v32 = v6;
    v7 = *(_OWORD *)(a1 + 80);
    v27 = *v2;
    v28 = v7;
    v26 = v3;
    objc_msgSend(v4, "performWithoutAnimation:", v25);
    objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 1.0);
    v9 = *(_QWORD *)(a1 + 40);
    v8 = *(void **)(a1 + 48);
    v10 = v2[3];
    v21 = v2[2];
    v22 = v10;
    v11 = v2[5];
    v23 = v2[4];
    v24 = v11;
    v12 = v2[1];
    v19 = *v2;
    v20 = v12;
    objc_msgSend(v8, "performDefaultAnimatedLayoutUpdateForIconView:withParameters:", v9, &v19);

  }
  else
  {
    v14 = *(_QWORD *)(a1 + 40);
    v13 = *(void **)(a1 + 48);
    v15 = v2[3];
    v21 = v2[2];
    v22 = v15;
    v16 = v2[5];
    v23 = v2[4];
    v24 = v16;
    v17 = v2[1];
    v19 = *v2;
    v20 = v17;
    objc_msgSend(v13, "performDefaultAnimatedLayoutUpdateForIconView:withParameters:", v14, &v19);
  }
  result = *(_QWORD *)(a1 + 56);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __119__SBIconListViewMultiStageAnimator_iconListView_wantsAnimatedLayoutForIconView_withParameters_alongsideAnimationBlock___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(double *)(v2 + 8) <= -10000.0)
  {
    v3 = *(_QWORD *)(a1 + 56);
    *(_QWORD *)(v2 + 8) = *(_QWORD *)(a1 + 48);
    *(_QWORD *)(v2 + 16) = v3;
  }
  objc_msgSend(*(id *)(a1 + 40), "setCenter:");
  objc_msgSend(*(id *)(a1 + 40), "setIconContentScale:", *(double *)(a1 + 64));
  result = objc_msgSend(*(id *)(a1 + 40), "isDropping");
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 0.0);
  return result;
}

- (void)iconListView:(id)a3 wantsAnimatedRemovalForIconViews:(id)a4 completionHandler:(id)a5
{
  objc_msgSend(a3, "performDefaultAnimatedRemovalForIconViews:completionHandler:", a4, a5);
}

@end
