@implementation SBIconListViewSlideInAnimator

- (void)iconListView:(id)a3 wantsAnimatedLayoutForIconView:(id)a4 withParameters:(SBIconListLayoutAnimationParameters *)a5 alongsideAnimationBlock:(id)a6
{
  id v9;
  id v10;
  id v11;
  double Width;
  double Height;
  uint64_t v14;
  int v15;
  double v16;
  double v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  CGPoint var0;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  SBIconCoordinate var4;
  __int128 v32;
  CGRect v33;
  CGRect v34;

  v9 = a4;
  v10 = a6;
  v11 = a3;
  objc_msgSend(v11, "bounds");
  Width = CGRectGetWidth(v33);
  objc_msgSend(v11, "bounds");
  Height = CGRectGetHeight(v34);
  v14 = objc_msgSend(v11, "userInterfaceLayoutDirection");
  v15 = objc_msgSend(v11, "isVertical");

  v16 = -Width;
  if (v14 != 1)
    v16 = Width;
  if (v15)
    v17 = Height;
  else
    v17 = 0.0;
  if (v15)
    v16 = 0.0;
  objc_msgSend(v9, "setCenter:", a5->var0.x + v16, v17 + a5->var0.y);
  v18 = (void *)MEMORY[0x1E0DC3F10];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __116__SBIconListViewSlideInAnimator_iconListView_wantsAnimatedLayoutForIconView_withParameters_alongsideAnimationBlock___block_invoke;
  v24[3] = &unk_1E8D88918;
  v19 = *(_OWORD *)&a5->var2.continuousCornerRadius;
  v29 = *(_OWORD *)&a5->var2.size.height;
  v30 = v19;
  v20 = *(_OWORD *)&a5->var5;
  var4 = a5->var4;
  v32 = v20;
  v21 = *(_OWORD *)&a5->var1;
  var0 = a5->var0;
  v28 = v21;
  v25 = v9;
  v26 = v10;
  v22 = v10;
  v23 = v9;
  objc_msgSend(v18, "animateWithDuration:animations:", v24, 0.3);

}

uint64_t __116__SBIconListViewSlideInAnimator_iconListView_wantsAnimatedLayoutForIconView_withParameters_alongsideAnimationBlock___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setCenter:", *(double *)(a1 + 48), *(double *)(a1 + 56));
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

@end
