@implementation SBIconListViewClusterAnimator

- (SBIconListViewClusterAnimator)init
{
  SBIconListViewClusterAnimator *v2;
  void *v3;
  uint64_t v4;
  SBHIconEditingSettings *iconEditingSettings;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBIconListViewClusterAnimator;
  v2 = -[SBIconListViewClusterAnimator init](&v7, sel_init);
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

- (void)setRemovalDirection:(unint64_t)a3 forIcon:(id)a4
{
  NSMutableDictionary *removalDirectionForIcons;
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a4;
  removalDirectionForIcons = self->_removalDirectionForIcons;
  if (!removalDirectionForIcons)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v8 = self->_removalDirectionForIcons;
    self->_removalDirectionForIcons = v7;

    removalDirectionForIcons = self->_removalDirectionForIcons;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "uniqueIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](removalDirectionForIcons, "setObject:forKey:", v9, v10);

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
  void *v17;
  __CFString *v18;
  __CFString *v19;
  void *v20;
  _BOOL4 v21;
  _BOOL4 var6;
  int64_t row;
  int64_t column;
  double y;
  double x;
  double v27;
  double v28;
  double v29;
  double v30;
  __CFString *v31;
  _BOOL4 v32;
  int64_t v33;
  _BOOL4 v34;
  _BOOL4 v35;
  _BOOL4 v36;
  int64_t v37;
  _BOOL4 v38;
  _BOOL4 v39;
  double v40;
  int64_t v41;
  _BOOL4 v42;
  int v43;
  int v44;
  double v45;
  void *v46;
  unint64_t var7;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  id v51;
  id v52;
  id v53;
  id v54;
  _QWORD v55[4];
  id v56;
  id v57;
  id v58;
  id v59;
  CGPoint var0;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  SBIconCoordinate var4;
  __int128 v65;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  -[SBHIconEditingSettings defaultSpringDuration](self->_iconEditingSettings, "defaultSpringDuration");
  v14 = v13;
  -[SBHIconEditingSettings defaultSpringDampingRatio](self->_iconEditingSettings, "defaultSpringDampingRatio");
  v16 = v15;
  objc_msgSend(v11, "icon");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "gridSizeClass");
  v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18 == CFSTR("SBHIconGridSizeClassDefault"))
  {
    var6 = a5->var6;

    if (!var6)
      goto LABEL_73;
  }
  else
  {
    objc_msgSend(v17, "gridSizeClass");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v20, "isEqualToString:", CFSTR("SBHIconGridSizeClassDefault")) & 1) == 0)
    {

      goto LABEL_12;
    }
    v21 = a5->var6;

    if (!v21)
      goto LABEL_73;
  }
  column = a5->var4.column;
  row = a5->var4.row;
  x = a5->var0.x;
  y = a5->var0.y;
  objc_msgSend(v11, "center");
  v28 = v27;
  v30 = v29;
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    v33 = column & 1;
    if (column < 0)
      v33 = -v33;
    v34 = v33 == 1;
    v35 = (row & 0x8000000000000001) == 1 && v33 == 1;
    v36 = (row & 0x8000000000000001) == 1 && v33 == 0;
    v37 = v33 | row & 1;
    v38 = (row & 1) == 0 && v34;
    v39 = v37 == 0;
    if (BSFloatEqualToFloat())
    {
      if (x > v28)
      {
        if (!v36)
        {
          if (!v39)
          {
            if (v35)
              goto LABEL_67;
            goto LABEL_34;
          }
          goto LABEL_63;
        }
LABEL_42:
        -[SBHIconEditingSettings clusterFastestDuration](self->_iconEditingSettings, "clusterFastestDuration");
LABEL_72:
        v14 = v40;
        goto LABEL_73;
      }
      if (v35)
        goto LABEL_42;
      if (!v38)
      {
        if (!v36)
        {
          if (!v39)
            goto LABEL_73;
LABEL_71:
          -[SBHIconEditingSettings clusterSlowestDuration](self->_iconEditingSettings, "clusterSlowestDuration");
          goto LABEL_72;
        }
        goto LABEL_67;
      }
    }
    else if (x <= v28)
    {
      if (v38)
        goto LABEL_42;
      if (!v39)
      {
        if (!v35)
        {
          if (!v36)
            goto LABEL_73;
          goto LABEL_71;
        }
        goto LABEL_67;
      }
    }
    else
    {
      if (v36)
        goto LABEL_42;
      if (!v35)
      {
        if (!v39)
        {
LABEL_34:
          if (!v38)
            goto LABEL_73;
          goto LABEL_71;
        }
LABEL_67:
        -[SBHIconEditingSettings clusterMiddleSlowDuration](self->_iconEditingSettings, "clusterMiddleSlowDuration");
        goto LABEL_72;
      }
    }
LABEL_63:
    -[SBHIconEditingSettings clusterMiddleFastDuration](self->_iconEditingSettings, "clusterMiddleFastDuration");
    goto LABEL_72;
  }
  if (BSFloatEqualToFloat() && (BSFloatEqualToFloat() & 1) == 0)
  {
    objc_msgSend(v10, "layoutMetrics");
    v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v19 = v31;
    v32 = column == 1 || column == -[__CFString columns](v31, "columns");
    if (row >= 0)
      v41 = row & 1;
    else
      v41 = -(row & 1);
    v42 = v41 == 1 && v32;
    v43 = v41 == 1 && !v32;
    if (v41)
    {
      v32 = 0;
      v44 = 0;
    }
    else
    {
      v44 = !v32;
    }
    if (y >= v30)
    {
      if (!v44)
      {
        if (!v43)
        {
          if (!v32)
          {
            if (v42)
            {
LABEL_77:
              -[SBHIconEditingSettings clusterSlowestDuration](self->_iconEditingSettings, "clusterSlowestDuration");
              goto LABEL_78;
            }
LABEL_12:

            goto LABEL_73;
          }
          goto LABEL_75;
        }
        goto LABEL_69;
      }
    }
    else if (!v43)
    {
      if (!v44)
      {
        if (!v42)
        {
          if (v32)
            goto LABEL_77;
          goto LABEL_12;
        }
LABEL_75:
        -[SBHIconEditingSettings clusterMiddleSlowDuration](self->_iconEditingSettings, "clusterMiddleSlowDuration");
        goto LABEL_78;
      }
LABEL_69:
      -[SBHIconEditingSettings clusterMiddleFastDuration](self->_iconEditingSettings, "clusterMiddleFastDuration");
      goto LABEL_78;
    }
    -[SBHIconEditingSettings clusterFastestDuration](self->_iconEditingSettings, "clusterFastestDuration");
LABEL_78:
    v14 = v45;
    goto LABEL_12;
  }
LABEL_73:
  v46 = (void *)MEMORY[0x1E0DC3F10];
  var7 = a5->var7;
  v55[0] = MEMORY[0x1E0C809B0];
  v55[1] = 3221225472;
  v55[2] = __116__SBIconListViewClusterAnimator_iconListView_wantsAnimatedLayoutForIconView_withParameters_alongsideAnimationBlock___block_invoke;
  v55[3] = &unk_1E8D8BF70;
  v48 = *(_OWORD *)&a5->var2.continuousCornerRadius;
  v62 = *(_OWORD *)&a5->var2.size.height;
  v63 = v48;
  v49 = *(_OWORD *)&a5->var5;
  var4 = a5->var4;
  v65 = v49;
  v50 = *(_OWORD *)&a5->var1;
  var0 = a5->var0;
  v61 = v50;
  v56 = v11;
  v57 = v17;
  v58 = v10;
  v59 = v12;
  v51 = v12;
  v52 = v10;
  v53 = v17;
  v54 = v11;
  objc_msgSend(v46, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", var7, v55, 0, v14, 0.0, v16, 0.0);

}

void __116__SBIconListViewClusterAnimator_iconListView_wantsAnimatedLayoutForIconView_withParameters_alongsideAnimationBlock___block_invoke(uint64_t a1)
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
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __116__SBIconListViewClusterAnimator_iconListView_wantsAnimatedLayoutForIconView_withParameters_alongsideAnimationBlock___block_invoke_2;
  v9[3] = &unk_1E8D8BF70;
  *(_OWORD *)&v20.maximum = *(_OWORD *)(a1 + 112);
  v16 = *(_OWORD *)(a1 + 96);
  v17 = *(_OWORD *)&v20.maximum;
  *(_OWORD *)&v20.maximum = *(_OWORD *)(a1 + 144);
  v18 = *(_OWORD *)(a1 + 128);
  v19 = *(_OWORD *)&v20.maximum;
  *(_OWORD *)&v20.maximum = *(_OWORD *)(a1 + 80);
  v14 = *(_OWORD *)(a1 + 64);
  v15 = *(_OWORD *)&v20.maximum;
  v10 = *(id *)(a1 + 32);
  v11 = *(id *)(a1 + 40);
  v12 = *(id *)(a1 + 48);
  v13 = *(id *)(a1 + 56);
  *(float *)&v6 = minimum;
  *(float *)&v7 = maximum;
  *(float *)&v8 = preferred;
  objc_msgSend(v2, "sb_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1114131, v9, v6, v7, v8);

}

uint64_t __116__SBIconListViewClusterAnimator_iconListView_wantsAnimatedLayoutForIconView_withParameters_alongsideAnimationBlock___block_invoke_2(uint64_t a1)
{
  __int128 *v2;
  void *v3;
  id v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  void *v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t result;
  _OWORD v14[6];
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;

  v2 = (__int128 *)(a1 + 64);
  if (*(_BYTE *)(a1 + 144))
  {
    v3 = (void *)MEMORY[0x1E0DC3F10];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __116__SBIconListViewClusterAnimator_iconListView_wantsAnimatedLayoutForIconView_withParameters_alongsideAnimationBlock___block_invoke_3;
    v15[3] = &unk_1E8D8BF48;
    v4 = *(id *)(a1 + 32);
    v5 = v2[3];
    v21 = v2[2];
    v22 = v5;
    v6 = v2[5];
    v23 = v2[4];
    v24 = v6;
    v7 = v2[1];
    v19 = *v2;
    v16 = v4;
    v20 = v7;
    v17 = *(id *)(a1 + 40);
    v18 = *(id *)(a1 + 48);
    objc_msgSend(v3, "performWithoutAnimation:", v15);
    objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
    objc_msgSend(*(id *)(a1 + 32), "setCenter:", *(double *)(a1 + 64), *(double *)(a1 + 72));

  }
  else
  {
    v8 = *(void **)(a1 + 48);
    v9 = *(_QWORD *)(a1 + 32);
    v10 = v2[3];
    v14[2] = v2[2];
    v14[3] = v10;
    v11 = v2[5];
    v14[4] = v2[4];
    v14[5] = v11;
    v12 = v2[1];
    v14[0] = *v2;
    v14[1] = v12;
    objc_msgSend(v8, "performDefaultAnimatedLayoutUpdateForIconView:withParameters:", v9, v14);
  }
  result = *(_QWORD *)(a1 + 56);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __116__SBIconListViewClusterAnimator_iconListView_wantsAnimatedLayoutForIconView_withParameters_alongsideAnimationBlock___block_invoke_3(uint64_t a1)
{
  uint64_t result;
  double v3;
  double v4;
  uint64_t v5;
  double v6;
  double v7;

  objc_msgSend(*(id *)(a1 + 32), "setCenter:", *(double *)(a1 + 56), *(double *)(a1 + 64));
  objc_msgSend(*(id *)(a1 + 32), "setIconContentScale:", *(double *)(a1 + 72));
  result = objc_msgSend(*(id *)(a1 + 32), "isDropping");
  if ((result & 1) == 0)
  {
    result = objc_msgSend(*(id *)(a1 + 40), "isPlaceholder");
    if ((result & 1) == 0)
    {
      v4 = *(double *)(a1 + 56);
      v3 = *(double *)(a1 + 64);
      v5 = objc_msgSend((id)*MEMORY[0x1E0DC4730], "userInterfaceLayoutDirection");
      objc_msgSend(*(id *)(a1 + 48), "bounds");
      v7 = -v6;
      if (v5 != 1)
        v7 = v6;
      return objc_msgSend(*(id *)(a1 + 32), "setCenter:", v4 + v7, v3);
    }
  }
  return result;
}

- (void)iconListView:(id)a3 wantsAnimatedRemovalForIconViews:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  char v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  SBIconListViewClusterAnimator *v24;
  id v25;
  char v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[SBHIconEditingSettings defaultSpringDuration](self->_iconEditingSettings, "defaultSpringDuration");
  v12 = v11;
  -[SBHIconEditingSettings defaultSpringDampingRatio](self->_iconEditingSettings, "defaultSpringDampingRatio");
  v14 = v13;
  v15 = objc_msgSend(v8, "isVertical");
  v16 = (void *)MEMORY[0x1E0DC3F10];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __97__SBIconListViewClusterAnimator_iconListView_wantsAnimatedRemovalForIconViews_completionHandler___block_invoke;
  v22[3] = &unk_1E8D8BF98;
  v23 = v9;
  v24 = self;
  v26 = v15;
  v25 = v8;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __97__SBIconListViewClusterAnimator_iconListView_wantsAnimatedRemovalForIconViews_completionHandler___block_invoke_2;
  v20[3] = &unk_1E8D86600;
  v21 = v10;
  v17 = v10;
  v18 = v8;
  v19 = v9;
  objc_msgSend(v16, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 4, v22, v20, v12, 0.0, v14, 0.0);

}

void __97__SBIconListViewClusterAnimator_iconListView_wantsAnimatedRemovalForIconViews_completionHandler___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  double v17;
  int v18;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v25 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v7, "icon", (_QWORD)v24);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "isPlaceholder"))
        {
          objc_msgSend(v7, "setAlpha:", 0.0);
        }
        else
        {
          objc_msgSend(v7, "center");
          v10 = v9;
          v12 = v11;
          v13 = *(void **)(*(_QWORD *)(a1 + 40) + 16);
          objc_msgSend(v8, "uniqueIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectForKey:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "unsignedIntegerValue");

          if (v16 == 1)
            v17 = -1.0;
          else
            v17 = 1.0;
          v18 = *(unsigned __int8 *)(a1 + 56);
          v19 = objc_msgSend((id)*MEMORY[0x1E0DC4730], "userInterfaceLayoutDirection");
          objc_msgSend(*(id *)(a1 + 48), "bounds");
          if (v18)
          {
            v22 = -v21;
            if (v19 != 1)
              v22 = v21;
            v12 = v12 + v17 * v22;
          }
          else
          {
            v23 = -v20;
            if (v19 != 1)
              v23 = v20;
            v10 = v10 + v17 * v23;
          }
          objc_msgSend(v7, "setCenter:", v10, v12);
        }

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v4);
  }

}

uint64_t __97__SBIconListViewClusterAnimator_iconListView_wantsAnimatedRemovalForIconViews_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removalDirectionForIcons, 0);
  objc_storeStrong((id *)&self->_iconEditingSettings, 0);
}

@end
