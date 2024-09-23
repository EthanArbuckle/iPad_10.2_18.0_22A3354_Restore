@implementation STUIStatusBarVisualProvider_PillRegionCoordinator

- (void)setVisualProvider:(id)a3
{
  id obj;

  obj = a3;
  self->_visualProviderImplementsBackgroundActivityPillAnimation = objc_opt_respondsToSelector() & 1;
  objc_storeWeak((id *)&self->_visualProvider, obj);

}

- (void)updateDataForBackgroundActivity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  STUIStatusBarRegion *pillRegion;
  int v8;
  STUIStatusBarRegion *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  id v28;

  v4 = a3;
  if (self->_pillRegion || self->_backgroundActivityDetailPlacement)
  {
    v28 = v4;
    objc_msgSend(v4, "backgroundActivityEntry");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    pillRegion = self->_pillRegion;
    if (v5)
    {
      if (!pillRegion)
        goto LABEL_18;
      v8 = objc_msgSend(v5, "isEnabled");
      v9 = self->_pillRegion;
      if (v8)
      {
        -[STUIStatusBarRegion enableWithToken:](v9, "enableWithToken:", 11);
        objc_msgSend(v6, "backgroundActivityIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        +[STUIStatusBarActivityAction actionForBackgroundActivityWithIdentifier:](STUIStatusBarActivityAction, "actionForBackgroundActivityWithIdentifier:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[STUIStatusBarRegion setAction:](self->_pillRegion, "setAction:", v11);

        -[STUIStatusBarVisualProvider_PillRegionCoordinator visualProvider](self, "visualProvider");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "statusBar");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "currentAggregatedData");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0DB0C90]);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "dataByApplyingUpdate:keys:", v28, v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v16, "backNavigationEntry");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v17, "isEnabled"))
        {
          objc_msgSend(MEMORY[0x1E0DB09F0], "disabledEntry");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "setBackNavigationEntry:", v18);

        }
      }
      else
      {
        -[STUIStatusBarRegion disableWithToken:](v9, "disableWithToken:", 11);
      }
      if (!self->_pillRegion)
        goto LABEL_18;
    }
    else if (!pillRegion)
    {
      goto LABEL_20;
    }
    objc_msgSend(v28, "shortTimeEntry");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      objc_msgSend(v28, "shortTimeEntry");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "isEnabled");
      -[STUIStatusBarVisualProvider_PillRegionCoordinator visualProvider](self, "visualProvider");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "statusBar");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "currentAggregatedData");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "shortTimeEntry");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "isEnabled");

      if (v6 || ((v21 ^ v26) & 1) != 0)
      {
LABEL_18:
        if (self->_backgroundActivityDetailPlacement)
        {
          objc_msgSend(v28, "shortTimeEntry");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[STUIStatusBarVisualProvider_PillRegionCoordinator _updateBackgroundActivityWithEntry:timeEntry:needsUpdate:](self, "_updateBackgroundActivityWithEntry:timeEntry:needsUpdate:", v6, v27, 0);

        }
      }
    }
    else if (v6)
    {
      goto LABEL_18;
    }
LABEL_20:

    v4 = v28;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundActivityDetailTimer, 0);
  objc_storeStrong((id *)&self->_pillRegion, 0);
  objc_storeStrong((id *)&self->_pillIconPlacement, 0);
  objc_storeStrong((id *)&self->_backgroundActivityDetailPlacement, 0);
  objc_destroyWeak((id *)&self->_visualProvider);
}

- (void)setPillRegion:(id)a3
{
  STUIStatusBarRegion *v5;
  STUIStatusBarRegion **p_pillRegion;
  STUIStatusBarRegion *pillRegion;
  STUIStatusBarRegion *v8;

  v5 = (STUIStatusBarRegion *)a3;
  pillRegion = self->_pillRegion;
  p_pillRegion = &self->_pillRegion;
  if (pillRegion != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_pillRegion, a3);
    -[STUIStatusBarRegion disableWithToken:](*p_pillRegion, "disableWithToken:", 11);
    v5 = v8;
  }

}

- (void)setPillIconPlacement:(id)a3
{
  STUIStatusBarDisplayItemPlacement *v5;
  STUIStatusBarDisplayItemPlacement *backgroundActivityDetailPlacement;

  v5 = (STUIStatusBarDisplayItemPlacement *)a3;
  objc_storeStrong((id *)&self->_pillIconPlacement, a3);
  backgroundActivityDetailPlacement = self->_backgroundActivityDetailPlacement;
  self->_backgroundActivityDetailPlacement = v5;

}

- (void)_updateBackgroundActivityWithEntry:(id)a3 timeEntry:(id)a4 needsUpdate:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t);
  void *v27;
  id v28;
  id location;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  -[STUIStatusBarVisualProvider_PillRegionCoordinator backgroundActivityDetailTimer](self, "backgroundActivityDetailTimer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "invalidate");

  -[STUIStatusBarVisualProvider_PillRegionCoordinator setBackgroundActivityDetailTimer:](self, "setBackgroundActivityDetailTimer:", 0);
  if (v8)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    -[STUIStatusBarVisualProvider_PillRegionCoordinator visualProvider](self, "visualProvider");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "statusBar");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "currentAggregatedData");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "backgroundActivityEntry");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    if (v9)
      goto LABEL_3;
  }
  -[STUIStatusBarVisualProvider_PillRegionCoordinator visualProvider](self, "visualProvider");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "statusBar");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "currentAggregatedData");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "shortTimeEntry");
  v9 = (id)objc_claimAutoreleasedReturnValue();

LABEL_3:
  if (!objc_msgSend(v8, "isEnabled"))
    goto LABEL_15;
  if (!self->_pillRegion)
  {
LABEL_13:
    objc_msgSend(v8, "displayStartDate");
    v21 = v20 + 3.0 - CACurrentMediaTime();
    if (v21 > 0.0)
    {
      -[STUIStatusBarDisplayItemPlacement setEnabled:](self->_backgroundActivityDetailPlacement, "setEnabled:", 1);
      objc_initWeak(&location, self);
      v22 = (void *)MEMORY[0x1E0C99E88];
      v24 = MEMORY[0x1E0C809B0];
      v25 = 3221225472;
      v26 = __110__STUIStatusBarVisualProvider_PillRegionCoordinator__updateBackgroundActivityWithEntry_timeEntry_needsUpdate___block_invoke;
      v27 = &unk_1E8D62CB0;
      objc_copyWeak(&v28, &location);
      objc_msgSend(v22, "scheduledTimerWithTimeInterval:repeats:block:", 0, &v24, v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[STUIStatusBarVisualProvider_PillRegionCoordinator setBackgroundActivityDetailTimer:](self, "setBackgroundActivityDetailTimer:", v23, v24, v25, v26, v27);

      objc_destroyWeak(&v28);
      objc_destroyWeak(&location);
      goto LABEL_16;
    }
LABEL_15:
    -[STUIStatusBarVisualProvider_PillRegionCoordinator _hideActivityDetailAndUpdate:](self, "_hideActivityDetailAndUpdate:", v5);
    goto LABEL_16;
  }
  objc_msgSend(v8, "backgroundActivityIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!+[STUIStatusBarPillBackgroundActivityItem shouldKeepIconVisibleForActivityWithIdentifier:](STUIStatusBarPillBackgroundActivityItem, "shouldKeepIconVisibleForActivityWithIdentifier:", v11))
  {
    -[STUIStatusBarVisualProvider_PillRegionCoordinator visualProvider](self, "visualProvider");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "expanded"))
    {

      goto LABEL_8;
    }
    v19 = objc_msgSend(v9, "isEnabled");

    if (!v19)
      goto LABEL_9;
    goto LABEL_13;
  }
LABEL_8:

LABEL_9:
  -[STUIStatusBarDisplayItemPlacement setEnabled:](self->_backgroundActivityDetailPlacement, "setEnabled:", 1);
LABEL_16:

}

- (void)updatePill
{
  -[STUIStatusBarVisualProvider_PillRegionCoordinator _updateBackgroundActivityWithEntry:timeEntry:needsUpdate:](self, "_updateBackgroundActivityWithEntry:timeEntry:needsUpdate:", 0, 0, 1);
}

- (void)_hideActivityDetailAndUpdate:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  char v6;
  void *v7;
  id v8;

  v3 = a3;
  -[STUIStatusBarVisualProvider_PillRegionCoordinator visualProvider](self, "visualProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "expanded");

  if ((v6 & 1) == 0)
  {
    -[STUIStatusBarDisplayItemPlacement setEnabled:](self->_backgroundActivityDetailPlacement, "setEnabled:", 0);
    if (v3)
    {
      -[STUIStatusBarVisualProvider_PillRegionCoordinator visualProvider](self, "visualProvider");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "statusBar");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "updateWithAnimations:", MEMORY[0x1E0C9AA60]);

    }
  }
}

- (id)animationForBackgroundActivityIcon
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  +[STUIStatusBarAnimationFactory fadeAnimationWithDuration:](STUIStatusBarAnimationFactory, "fadeAnimationWithDuration:", 0.5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[STUIStatusBarAnimationFactory fadeAnimationWithDuration:](STUIStatusBarAnimationFactory, "fadeAnimationWithDuration:", 0.5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPriority:", 15);
  +[STUIStatusBarBackgroundActivityItem secondaryIconDisplayIdentifier](STUIStatusBarBackgroundActivityItem, "secondaryIconDisplayIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addSubAnimation:forDisplayItemWithIdentifier:", v3, v4);

  +[STUIStatusBarAnimationFactory fadeAnimationWithDuration:](STUIStatusBarAnimationFactory, "fadeAnimationWithDuration:", 0.5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPriority:", 10);
  +[STUIStatusBarTimeItem pillTimeDisplayIdentifier](STUIStatusBarTimeItem, "pillTimeDisplayIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addSubAnimation:forDisplayItemWithIdentifier:", v5, v6);

  +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarVoiceControlItem, "defaultDisplayIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addSubAnimation:forDisplayItemWithIdentifier:", v5, v7);

  objc_msgSend(v2, "setDelaysDependentItems:", 1);
  return v2;
}

- (id)animationForBackgroundActivityPill
{
  return -[STUIStatusBarVisualProvider_PillRegionCoordinator animationForBackgroundActivityPillWithDuration:scale:](self, "animationForBackgroundActivityPillWithDuration:scale:", 0.5, 0.5);
}

- (id)animationForBackgroundActivityPillWithDuration:(double)a3 scale:(double)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;

  +[STUIStatusBarAnimationFactory fadeAnimationWithDuration:scale:](STUIStatusBarAnimationFactory, "fadeAnimationWithDuration:scale:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[STUIStatusBarAnimationFactory fadeAnimationWithDuration:scale:](STUIStatusBarAnimationFactory, "fadeAnimationWithDuration:scale:", a3, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPriority:", 20);
  +[STUIStatusBarAnimationFactory fadeAnimationWithDuration:scale:offset:](STUIStatusBarAnimationFactory, "fadeAnimationWithDuration:scale:offset:", a3, a4, 0.0, 0.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPriority:", 20);
  +[STUIStatusBarAnimationFactory fadeAnimationWithDuration:scale:offset:](STUIStatusBarAnimationFactory, "fadeAnimationWithDuration:scale:offset:", a3, a4, -0.0, 0.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPriority:", 20);
  +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarPillBackgroundActivityItem, "defaultDisplayIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubAnimation:forDisplayItemWithIdentifier:", v9, v11);

  +[STUIStatusBarBackgroundActivityItem secondaryIconDisplayIdentifier](STUIStatusBarPillBackgroundActivityItem, "secondaryIconDisplayIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubAnimation:forDisplayItemWithIdentifier:", v10, v12);

  +[STUIStatusBarTimeItem pillTimeDisplayIdentifier](STUIStatusBarTimeItem, "pillTimeDisplayIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubAnimation:forDisplayItemWithIdentifier:", v8, v13);

  objc_msgSend(v7, "setDelaysDependentItems:", 1);
  if (self->_visualProviderImplementsBackgroundActivityPillAnimation)
  {
    -[STUIStatusBarVisualProvider_PillRegionCoordinator visualProvider](self, "visualProvider");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "animationForBackgroundActivityPillAnimation:duration:scale:", v7, a3, a4);
    v15 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v15;
  }

  return v7;
}

- (void)updateRegion:(id)a3 highlighted:(BOOL)a4 initialPress:(BOOL)a5 cornerRadius:(double)a6
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v9;
  STUIStatusBarRoundedCornerView *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  BOOL v14;
  _QWORD v15[2];

  v7 = a5;
  v8 = a4;
  v15[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  objc_msgSend(v9, "highlightView");
  v10 = (STUIStatusBarRoundedCornerView *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    v10 = objc_alloc_init(STUIStatusBarRoundedCornerView);
    -[STUIStatusBarRoundedCornerView setCornerRadius:](v10, "setCornerRadius:", a6);
    objc_msgSend(v9, "setHighlightView:", v10);
  }
  v11 = (void *)MEMORY[0x1E0DC3518];
  v15[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __104__STUIStatusBarVisualProvider_PillRegionCoordinator_updateRegion_highlighted_initialPress_cornerRadius___block_invoke;
  v13[3] = &__block_descriptor_33_e16_v16__0__UIView_8l;
  v14 = v8;
  objc_msgSend(v11, "_setVisuallyHighlighted:forViews:initialPress:highlightBlock:", v8, v12, v7, v13);

}

- (BOOL)handledUpdateOfActionable:(id)a3 highlighted:(BOOL)a4 initialPress:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  id v9;
  id v10;
  BOOL v11;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v9 = 0;
LABEL_6:
    v11 = 0;
    goto LABEL_7;
  }
  v9 = v8;
  if (!v9)
    goto LABEL_6;
  -[STUIStatusBarVisualProvider_PillRegionCoordinator pillRegion](self, "pillRegion");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10 != v9)
    goto LABEL_6;
  -[STUIStatusBarVisualProvider_PillRegionCoordinator updateRegion:highlighted:initialPress:cornerRadius:](self, "updateRegion:highlighted:initialPress:cornerRadius:", v9, v6, v5, -1.0);
  v11 = 1;
LABEL_7:

  return v11;
}

- (STUIStatusBarPillRegionVisualProvider)visualProvider
{
  return (STUIStatusBarPillRegionVisualProvider *)objc_loadWeakRetained((id *)&self->_visualProvider);
}

- (STUIStatusBarDisplayItemPlacement)backgroundActivityDetailPlacement
{
  return self->_backgroundActivityDetailPlacement;
}

- (void)setBackgroundActivityDetailPlacement:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundActivityDetailPlacement, a3);
}

- (STUIStatusBarDisplayItemPlacement)pillIconPlacement
{
  return self->_pillIconPlacement;
}

- (STUIStatusBarRegion)pillRegion
{
  return self->_pillRegion;
}

- (NSTimer)backgroundActivityDetailTimer
{
  return self->_backgroundActivityDetailTimer;
}

- (void)setBackgroundActivityDetailTimer:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundActivityDetailTimer, a3);
}

@end
