@implementation SBIconListViewDominoAnimator

- (void)reset
{
  self->_delay = 0.0;
}

- (void)iconListView:(id)a3 wantsAnimatedLayoutForIconView:(id)a4 withParameters:(SBIconListLayoutAnimationParameters *)a5 alongsideAnimationBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  double delay;
  unint64_t var7;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
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
  v13 = (void *)MEMORY[0x1E0DC3F10];
  v22[1] = 3221225472;
  v14 = *(_OWORD *)&a5->var2.continuousCornerRadius;
  v28 = *(_OWORD *)&a5->var2.size.height;
  v29 = v14;
  v15 = *(_OWORD *)&a5->var5;
  var4 = a5->var4;
  v31 = v15;
  v16 = *(_OWORD *)&a5->var1;
  var0 = a5->var0;
  delay = self->_delay;
  var7 = a5->var7;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[2] = __115__SBIconListViewDominoAnimator_iconListView_wantsAnimatedLayoutForIconView_withParameters_alongsideAnimationBlock___block_invoke;
  v22[3] = &unk_1E8D88FA8;
  v27 = v16;
  v23 = v11;
  v24 = v10;
  v25 = v12;
  v19 = v12;
  v20 = v10;
  v21 = v11;
  objc_msgSend(v13, "animateWithDuration:delay:options:animations:completion:", var7, v22, 0, 0.3, delay);
  if (a5->var6)
    self->_delay = self->_delay + 0.045;

}

void __115__SBIconListViewDominoAnimator_iconListView_wantsAnimatedLayoutForIconView_withParameters_alongsideAnimationBlock___block_invoke(uint64_t a1)
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
  v9[2] = __115__SBIconListViewDominoAnimator_iconListView_wantsAnimatedLayoutForIconView_withParameters_alongsideAnimationBlock___block_invoke_2;
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

uint64_t __115__SBIconListViewDominoAnimator_iconListView_wantsAnimatedLayoutForIconView_withParameters_alongsideAnimationBlock___block_invoke_2(uint64_t a1)
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
    v14[2] = __115__SBIconListViewDominoAnimator_iconListView_wantsAnimatedLayoutForIconView_withParameters_alongsideAnimationBlock___block_invoke_3;
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

uint64_t __115__SBIconListViewDominoAnimator_iconListView_wantsAnimatedLayoutForIconView_withParameters_alongsideAnimationBlock___block_invoke_3(uint64_t a1)
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

@end
