@implementation _UIStatusBarVisualProvider_PillRegionCoordinator

- (void)setPillRegion:(id)a3
{
  _UIStatusBarRegion *v5;
  _UIStatusBarRegion **p_pillRegion;
  _UIStatusBarRegion *pillRegion;
  _UIStatusBarRegion *v8;

  v5 = (_UIStatusBarRegion *)a3;
  pillRegion = self->_pillRegion;
  p_pillRegion = &self->_pillRegion;
  if (pillRegion != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_pillRegion, a3);
    -[_UIStatusBarRegion disableWithToken:](*p_pillRegion, "disableWithToken:", 11);
    v5 = v8;
  }

}

- (void)setPillIconPlacement:(id)a3
{
  _UIStatusBarDisplayItemPlacement *v5;
  _UIStatusBarDisplayItemPlacement *backgroundActivityDetailPlacement;

  v5 = (_UIStatusBarDisplayItemPlacement *)a3;
  objc_storeStrong((id *)&self->_pillIconPlacement, a3);
  backgroundActivityDetailPlacement = self->_backgroundActivityDetailPlacement;
  self->_backgroundActivityDetailPlacement = v5;

}

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
  _UIStatusBarRegion *pillRegion;
  int v8;
  _UIStatusBarRegion *v9;
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
  int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  id v27;

  v4 = a3;
  if (self->_pillRegion || self->_backgroundActivityDetailPlacement)
  {
    v27 = v4;
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
        -[_UIStatusBarRegion enableWithToken:](v9, "enableWithToken:", 11);
        +[_UIStatusBarActivityAction actionForBackgroundActivityType:](_UIStatusBarActivityAction, "actionForBackgroundActivityType:", objc_msgSend(v6, "type"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIStatusBarRegion setAction:](self->_pillRegion, "setAction:", v10);

        -[_UIStatusBarVisualProvider_PillRegionCoordinator visualProvider](self, "visualProvider");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "statusBar");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "currentAggregatedData");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("backNavigationEntry"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "dataByApplyingUpdate:keys:", v27, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v15, "backNavigationEntry");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v16, "isEnabled"))
        {
          +[_UIStatusBarDataEntry disabledEntry](_UIStatusBarDataStringEntry, "disabledEntry");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "setBackNavigationEntry:", v17);

        }
      }
      else
      {
        -[_UIStatusBarRegion disableWithToken:](v9, "disableWithToken:", 11);
      }
      if (!self->_pillRegion)
        goto LABEL_18;
    }
    else if (!pillRegion)
    {
      goto LABEL_20;
    }
    objc_msgSend(v27, "shortTimeEntry");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v27, "shortTimeEntry");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "isEnabled");
      -[_UIStatusBarVisualProvider_PillRegionCoordinator visualProvider](self, "visualProvider");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "statusBar");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "currentAggregatedData");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "shortTimeEntry");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "isEnabled");

      if (v6 || ((v20 ^ v25) & 1) != 0)
      {
LABEL_18:
        if (self->_backgroundActivityDetailPlacement)
        {
          objc_msgSend(v27, "shortTimeEntry");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[_UIStatusBarVisualProvider_PillRegionCoordinator _updateBackgroundActivityWithEntry:timeEntry:needsUpdate:](self, "_updateBackgroundActivityWithEntry:timeEntry:needsUpdate:", v6, v26, 0);

        }
      }
    }
    else if (v6)
    {
      goto LABEL_18;
    }
LABEL_20:

    v4 = v27;
  }

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
  int v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t);
  void *v26;
  id v27;
  id location;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  -[_UIStatusBarVisualProvider_PillRegionCoordinator backgroundActivityDetailTimer](self, "backgroundActivityDetailTimer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "invalidate");

  -[_UIStatusBarVisualProvider_PillRegionCoordinator setBackgroundActivityDetailTimer:](self, "setBackgroundActivityDetailTimer:", 0);
  if (!v8)
  {
    -[_UIStatusBarVisualProvider_PillRegionCoordinator visualProvider](self, "visualProvider");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "statusBar");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "currentAggregatedData");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "backgroundActivityEntry");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    if (v9)
      goto LABEL_3;
LABEL_9:
    -[_UIStatusBarVisualProvider_PillRegionCoordinator visualProvider](self, "visualProvider");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "statusBar");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "currentAggregatedData");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "shortTimeEntry");
    v9 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_3;
  }
  if (!v9)
    goto LABEL_9;
  if (!objc_msgSend(v8, "isEnabled"))
    goto LABEL_13;
LABEL_3:
  if (self->_pillRegion)
  {
    if (+[_UIStatusBarPillBackgroundActivityItem shouldKeepIconVisibleForActivityType:](_UIStatusBarPillBackgroundActivityItem, "shouldKeepIconVisibleForActivityType:", objc_msgSend(v8, "type")))
    {
LABEL_14:
      -[_UIStatusBarDisplayItemPlacement setEnabled:](self->_backgroundActivityDetailPlacement, "setEnabled:", 1);
      goto LABEL_15;
    }
    -[_UIStatusBarVisualProvider_PillRegionCoordinator visualProvider](self, "visualProvider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "expanded"))
    {

      goto LABEL_14;
    }
    v18 = objc_msgSend(v9, "isEnabled");

    if (!v18)
      goto LABEL_14;
  }
  objc_msgSend(v8, "displayStartDate");
  v20 = v19 + 3.0 - CACurrentMediaTime();
  if (v20 > 0.0)
  {
    -[_UIStatusBarDisplayItemPlacement setEnabled:](self->_backgroundActivityDetailPlacement, "setEnabled:", 1);
    objc_initWeak(&location, self);
    v21 = (void *)MEMORY[0x1E0C99E88];
    v23 = MEMORY[0x1E0C809B0];
    v24 = 3221225472;
    v25 = __109___UIStatusBarVisualProvider_PillRegionCoordinator__updateBackgroundActivityWithEntry_timeEntry_needsUpdate___block_invoke;
    v26 = &unk_1E16B26E0;
    objc_copyWeak(&v27, &location);
    objc_msgSend(v21, "scheduledTimerWithTimeInterval:repeats:block:", 0, &v23, v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIStatusBarVisualProvider_PillRegionCoordinator setBackgroundActivityDetailTimer:](self, "setBackgroundActivityDetailTimer:", v22, v23, v24, v25, v26);

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }
  else
  {
LABEL_13:
    -[_UIStatusBarVisualProvider_PillRegionCoordinator _hideActivityDetailAndUpdate:](self, "_hideActivityDetailAndUpdate:", v5);
  }
LABEL_15:

}

- (void)updatePill
{
  -[_UIStatusBarVisualProvider_PillRegionCoordinator _updateBackgroundActivityWithEntry:timeEntry:needsUpdate:](self, "_updateBackgroundActivityWithEntry:timeEntry:needsUpdate:", 0, 0, 1);
}

- (void)_hideActivityDetailAndUpdate:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  char v6;
  void *v7;
  id v8;

  v3 = a3;
  -[_UIStatusBarVisualProvider_PillRegionCoordinator visualProvider](self, "visualProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "expanded");

  if ((v6 & 1) == 0)
  {
    -[_UIStatusBarDisplayItemPlacement setEnabled:](self->_backgroundActivityDetailPlacement, "setEnabled:", 0);
    if (v3)
    {
      -[_UIStatusBarVisualProvider_PillRegionCoordinator visualProvider](self, "visualProvider");
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

  +[_UIStatusBarAnimationFactory fadeAnimationWithDuration:](_UIStatusBarAnimationFactory, "fadeAnimationWithDuration:", 0.5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIStatusBarAnimationFactory fadeAnimationWithDuration:](_UIStatusBarAnimationFactory, "fadeAnimationWithDuration:", 0.5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPriority:", 15);
  +[_UIStatusBarBackgroundActivityItem secondaryIconDisplayIdentifier](_UIStatusBarBackgroundActivityItem, "secondaryIconDisplayIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addSubAnimation:forDisplayItemWithIdentifier:", v3, v4);

  +[_UIStatusBarAnimationFactory fadeAnimationWithDuration:](_UIStatusBarAnimationFactory, "fadeAnimationWithDuration:", 0.5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPriority:", 10);
  +[_UIStatusBarTimeItem pillTimeDisplayIdentifier](_UIStatusBarTimeItem, "pillTimeDisplayIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addSubAnimation:forDisplayItemWithIdentifier:", v5, v6);

  +[_UIStatusBarItem defaultDisplayIdentifier](_UIStatusBarVoiceControlItem, "defaultDisplayIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addSubAnimation:forDisplayItemWithIdentifier:", v5, v7);

  objc_msgSend(v2, "setDelaysDependentItems:", 1);
  return v2;
}

- (id)animationForBackgroundActivityPill
{
  return -[_UIStatusBarVisualProvider_PillRegionCoordinator animationForBackgroundActivityPillWithDuration:scale:](self, "animationForBackgroundActivityPillWithDuration:scale:", 0.5, 0.5);
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

  +[_UIStatusBarAnimationFactory fadeAnimationWithDuration:scale:](_UIStatusBarAnimationFactory, "fadeAnimationWithDuration:scale:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIStatusBarAnimationFactory fadeAnimationWithDuration:scale:](_UIStatusBarAnimationFactory, "fadeAnimationWithDuration:scale:", a3, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPriority:", 20);
  +[_UIStatusBarAnimationFactory fadeAnimationWithDuration:scale:offset:](_UIStatusBarAnimationFactory, "fadeAnimationWithDuration:scale:offset:", a3, a4, 0.0, 0.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPriority:", 20);
  +[_UIStatusBarAnimationFactory fadeAnimationWithDuration:scale:offset:](_UIStatusBarAnimationFactory, "fadeAnimationWithDuration:scale:offset:", a3, a4, -0.0, 0.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPriority:", 20);
  +[_UIStatusBarItem defaultDisplayIdentifier](_UIStatusBarPillBackgroundActivityItem, "defaultDisplayIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubAnimation:forDisplayItemWithIdentifier:", v9, v11);

  +[_UIStatusBarBackgroundActivityItem secondaryIconDisplayIdentifier](_UIStatusBarPillBackgroundActivityItem, "secondaryIconDisplayIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubAnimation:forDisplayItemWithIdentifier:", v10, v12);

  +[_UIStatusBarTimeItem pillTimeDisplayIdentifier](_UIStatusBarTimeItem, "pillTimeDisplayIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubAnimation:forDisplayItemWithIdentifier:", v8, v13);

  objc_msgSend(v7, "setDelaysDependentItems:", 1);
  if (self->_visualProviderImplementsBackgroundActivityPillAnimation)
  {
    -[_UIStatusBarVisualProvider_PillRegionCoordinator visualProvider](self, "visualProvider");
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
  _UIStatusBarRoundedCornerView *v10;
  void *v11;
  _QWORD v12[4];
  BOOL v13;
  _QWORD v14[2];

  v7 = a5;
  v8 = a4;
  v14[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  objc_msgSend(v9, "highlightView");
  v10 = (_UIStatusBarRoundedCornerView *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    v10 = objc_alloc_init(_UIStatusBarRoundedCornerView);
    -[_UIStatusBarRoundedCornerView setCornerRadius:](v10, "setCornerRadius:", a6);
    objc_msgSend(v9, "setHighlightView:", v10);
  }
  v14[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __103___UIStatusBarVisualProvider_PillRegionCoordinator_updateRegion_highlighted_initialPress_cornerRadius___block_invoke;
  v12[3] = &__block_descriptor_33_e16_v16__0__UIView_8l;
  v13 = v8;
  +[UIButton _setVisuallyHighlighted:forViews:initialPress:highlightBlock:](UIButton, "_setVisuallyHighlighted:forViews:initialPress:highlightBlock:", v8, v11, v7, v12);

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
  -[_UIStatusBarVisualProvider_PillRegionCoordinator pillRegion](self, "pillRegion");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10 != v9)
    goto LABEL_6;
  -[_UIStatusBarVisualProvider_PillRegionCoordinator updateRegion:highlighted:initialPress:cornerRadius:](self, "updateRegion:highlighted:initialPress:cornerRadius:", v9, v6, v5, -1.0);
  v11 = 1;
LABEL_7:

  return v11;
}

- (_UIStatusBarPillRegionVisualProvider)visualProvider
{
  return (_UIStatusBarPillRegionVisualProvider *)objc_loadWeakRetained((id *)&self->_visualProvider);
}

- (_UIStatusBarDisplayItemPlacement)backgroundActivityDetailPlacement
{
  return self->_backgroundActivityDetailPlacement;
}

- (void)setBackgroundActivityDetailPlacement:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundActivityDetailPlacement, a3);
}

- (_UIStatusBarDisplayItemPlacement)pillIconPlacement
{
  return self->_pillIconPlacement;
}

- (_UIStatusBarRegion)pillRegion
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundActivityDetailTimer, 0);
  objc_storeStrong((id *)&self->_pillRegion, 0);
  objc_storeStrong((id *)&self->_pillIconPlacement, 0);
  objc_storeStrong((id *)&self->_backgroundActivityDetailPlacement, 0);
  objc_destroyWeak((id *)&self->_visualProvider);
}

@end
