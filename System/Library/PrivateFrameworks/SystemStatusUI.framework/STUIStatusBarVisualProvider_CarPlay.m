@implementation STUIStatusBarVisualProvider_CarPlay

+ (Class)visualProviderSubclassForScreen:(id)a3 visualProviderInfo:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  char v9;
  void *v10;
  int v11;
  objc_class *v12;

  v4 = a4;
  v5 = (void *)objc_opt_class();
  if (v4)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("STUIStatusBarCarPlayHorizontalLayoutKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "BOOLValue");

    if ((v7 & 1) != 0)
      goto LABEL_5;
    objc_msgSend(v4, "objectForKey:", CFSTR("STUIStatusBarCarPlayDualLayoutDriverKey"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "BOOLValue");

    if ((v9 & 1) != 0
      || (objc_msgSend(v4, "objectForKey:", CFSTR("STUIStatusBarCarPlayDualLayoutPassengerKey")),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v11 = objc_msgSend(v10, "BOOLValue"),
          v10,
          v11))
    {
LABEL_5:
      v5 = (void *)objc_opt_class();
    }
  }
  v12 = v5;

  return v12;
}

+ (CGSize)intrinsicContentSizeForOrientation:(int64_t)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = *MEMORY[0x1E0DC55F0];
  v4 = *MEMORY[0x1E0DC55F0];
  result.height = v4;
  result.width = v3;
  return result;
}

+ (BOOL)scalesWithScreenNativeScale
{
  return 0;
}

+ (BOOL)requiresIterativeOverflowLayout
{
  return 1;
}

- (UIFont)clockFont
{
  return 0;
}

- (STUIStatusBarVisualProvider_CarPlay)init
{
  STUIStatusBarVisualProvider_CarPlay *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)STUIStatusBarVisualProvider_CarPlay;
  v2 = -[STUIStatusBarVisualProvider_CarPlay init](&v6, sel_init);
  if (v2)
  {
    v3 = (void *)objc_opt_new();
    -[STUIStatusBarVisualProvider_CarPlay setPillRegionCoordinator:](v2, "setPillRegionCoordinator:", v3);

    -[STUIStatusBarVisualProvider_CarPlay pillRegionCoordinator](v2, "pillRegionCoordinator");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setVisualProvider:", v2);

  }
  return v2;
}

- (BOOL)expanded
{
  return 0;
}

- (BOOL)supportsIndirectPointerTouchActions
{
  return 0;
}

- (void)itemCreated:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  v8 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v8;
    objc_msgSend(v4, "setReducesFontSize:", 0);
    objc_msgSend(v4, "setTypeStringProvider:", self);
LABEL_5:

    goto LABEL_6;
  }
  objc_msgSend(v8, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[STUIStatusBarItem identifier](STUIStatusBarVoiceControlPillItem, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v6)
  {
    v7 = v8;
    objc_msgSend(v7, "setPillSize:", 15.0, 15.0);
    objc_msgSend(v7, "setPillPadding:", 3.0);
    goto LABEL_5;
  }
LABEL_6:

}

- (id)stringForCellularType:(int64_t)a3 condensed:(BOOL)a4
{
  const __CFString *v4;

  v4 = CFSTR("􀛱");
  if (a3 != 9)
    v4 = 0;
  if (a3 == 8)
    v4 = CFSTR("􀛰");
  if (a4)
    return (id)v4;
  else
    return 0;
}

- (id)condensedFontForCellularType:(int64_t)a3 defaultFont:(id)a4 baselineOffset:(double *)a5
{
  return a4;
}

- (double)animatedTypeDisplayItemSpacingFactorForCellularType:(int64_t)a3
{
  return 1.0;
}

- (id)styleAttributesForStyle:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *CopyOfSystemUIFontWithGrade;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  -[STUIStatusBarVisualProvider_CarPlay statusBar](self, "statusBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[STUIStatusBarStyleAttributes styleAttributesForStatusBar:style:](STUIStatusBarStyleAttributes, "styleAttributesForStatusBar:style:", v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3 == 2)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTextColor:", v7);

    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTextColor:", v8);

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setImageTintColor:", v9);

  v10 = (void *)MEMORY[0x1E0DC1350];
  v11 = *MEMORY[0x1E0DC4A98];
  -[STUIStatusBarVisualProvider_CarPlay statusBar](self, "statusBar");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "traitCollection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "preferredFontForTextStyle:compatibleWithTraitCollection:", v11, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
    CopyOfSystemUIFontWithGrade = (void *)CTFontCreateCopyOfSystemUIFontWithGrade();
  else
    CopyOfSystemUIFontWithGrade = 0;
  objc_msgSend(v6, "setFont:", CopyOfSystemUIFontWithGrade);
  objc_msgSend(v6, "setSmallFont:", CopyOfSystemUIFontWithGrade);
  v16 = (void *)MEMORY[0x1E0DC1350];
  -[STUIStatusBarVisualProvider_CarPlay statusBar](self, "statusBar");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "traitCollection");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "_preferredFontForTextStyle:design:variant:compatibleWithTraitCollection:", v11, 0, 1024, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEmphasizedFont:", v19);

  objc_msgSend(v6, "imageTintColor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "colorWithAlphaComponent:", 0.2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setImageDimmedTintColor:", v21);

  return v6;
}

- (id)willUpdateWithData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  objc_msgSend(v4, "sensorActivityEntry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    -[STUIStatusBarVisualProvider_CarPlay setShowingSensorActivityIndicator:](self, "setShowingSensorActivityIndicator:", objc_msgSend(v5, "isEnabled"));
  objc_msgSend(v4, "backgroundActivityEntry");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarVisualProvider_CarPlay pillRegionCoordinator](self, "pillRegionCoordinator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateDataForBackgroundActivity:", v4);

  if (v7)
    -[STUIStatusBarVisualProvider_CarPlay setShowingPill:](self, "setShowingPill:", objc_msgSend(v7, "isEnabled"));
  objc_msgSend(v4, "radarEntry");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    if (objc_msgSend(v9, "isEnabled"))
    {
      +[STUIStatusBarActivityAction actionForBackgroundActivityWithIdentifier:](STUIStatusBarActivityAction, "actionForBackgroundActivityWithIdentifier:", *MEMORY[0x1E0DB0BE8]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[STUIStatusBarVisualProvider_CarPlay radarRegion](self, "radarRegion");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setAction:", v11);

    }
    else
    {
      -[STUIStatusBarVisualProvider_CarPlay radarRegion](self, "radarRegion");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setAction:", 0);
    }

  }
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)additionAnimationForDisplayItemWithIdentifier:(id)a3 itemAnimation:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;

  v6 = a3;
  v7 = a4;
  +[STUIStatusBarBackgroundActivityItem backgroundDisplayIdentifier](STUIStatusBarPillBackgroundActivityItem, "backgroundDisplayIdentifier");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 != v6)
  {
    +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarIndicatorQuietModeItem, "defaultDisplayIdentifier");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v6;
    if ((id)v9 != v6)
    {
      v11 = (void *)v9;
      +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarIndicatorAnnounceNotificationsItem, "defaultDisplayIdentifier");
      v12 = objc_claimAutoreleasedReturnValue();
      if ((id)v12 != v6)
      {
        v13 = (void *)v12;
        +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarIndicatorQuietModeAnnounceItem, "defaultDisplayIdentifier");
        v14 = (id)objc_claimAutoreleasedReturnValue();

        if (v14 != v6)
        {
          +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarSensorActivityItem, "defaultDisplayIdentifier");
          v15 = (id)objc_claimAutoreleasedReturnValue();

          if (v15 == v6)
          {
            -[STUIStatusBarVisualProvider_CarPlay _animationForSensorIndicator](self, "_animationForSensorIndicator");
            v18 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            +[STUIStatusBarTimeItem pillTimeDisplayIdentifier](STUIStatusBarTimeItem, "pillTimeDisplayIdentifier");
            v16 = (id)objc_claimAutoreleasedReturnValue();

            if (v16 == v6
              || (+[STUIStatusBarTimeItem shortTimeDisplayIdentifier](STUIStatusBarTimeItem, "shortTimeDisplayIdentifier"), v17 = (id)objc_claimAutoreleasedReturnValue(), v17, v17 == v6))
            {
              -[STUIStatusBarVisualProvider_CarPlay _animationForPillTime](self, "_animationForPillTime");
              v18 = (id)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v18 = v7;
            }
          }
          goto LABEL_13;
        }
LABEL_12:
        -[STUIStatusBarVisualProvider_CarPlay _defaultScaleAnimationWithIdentifier:](self, "_defaultScaleAnimationWithIdentifier:", v6);
        v18 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:
        v20 = v18;
        goto LABEL_14;
      }

      v10 = v11;
    }

    goto LABEL_12;
  }
  -[STUIStatusBarVisualProvider_CarPlay pillRegionCoordinator](self, "pillRegionCoordinator");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "animationForBackgroundActivityPillWithDuration:scale:", 0.25, 0.25);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_14:
  return v20;
}

- (id)removalAnimationForDisplayItemWithIdentifier:(id)a3 itemAnimation:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;

  v6 = a3;
  v7 = a4;
  +[STUIStatusBarBackgroundActivityItem backgroundDisplayIdentifier](STUIStatusBarPillBackgroundActivityItem, "backgroundDisplayIdentifier");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 != v6)
  {
    +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarIndicatorQuietModeItem, "defaultDisplayIdentifier");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v6;
    if ((id)v9 != v6)
    {
      v11 = (void *)v9;
      +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarIndicatorAnnounceNotificationsItem, "defaultDisplayIdentifier");
      v12 = objc_claimAutoreleasedReturnValue();
      if ((id)v12 != v6)
      {
        v13 = (void *)v12;
        +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarIndicatorQuietModeAnnounceItem, "defaultDisplayIdentifier");
        v14 = (id)objc_claimAutoreleasedReturnValue();

        if (v14 != v6)
        {
          +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarSensorActivityItem, "defaultDisplayIdentifier");
          v15 = (id)objc_claimAutoreleasedReturnValue();

          if (v15 == v6)
          {
            -[STUIStatusBarVisualProvider_CarPlay _animationForSensorIndicator](self, "_animationForSensorIndicator");
            v18 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            +[STUIStatusBarTimeItem pillTimeDisplayIdentifier](STUIStatusBarTimeItem, "pillTimeDisplayIdentifier");
            v16 = (id)objc_claimAutoreleasedReturnValue();

            if (v16 == v6
              || (+[STUIStatusBarTimeItem shortTimeDisplayIdentifier](STUIStatusBarTimeItem, "shortTimeDisplayIdentifier"), v17 = (id)objc_claimAutoreleasedReturnValue(), v17, v17 == v6))
            {
              -[STUIStatusBarVisualProvider_CarPlay _animationForPillTime](self, "_animationForPillTime");
              v18 = (id)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v18 = v7;
            }
          }
          goto LABEL_13;
        }
LABEL_12:
        -[STUIStatusBarVisualProvider_CarPlay _defaultScaleAnimationWithIdentifier:](self, "_defaultScaleAnimationWithIdentifier:", v6);
        v18 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:
        v20 = v18;
        goto LABEL_14;
      }

      v10 = v11;
    }

    goto LABEL_12;
  }
  -[STUIStatusBarVisualProvider_CarPlay pillRegionCoordinator](self, "pillRegionCoordinator");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "animationForBackgroundActivityPillWithDuration:scale:", 0.25, 0.25);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_14:
  return v20;
}

- (void)actionable:(id)a3 highlighted:(BOOL)a4 initialPress:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  char isKindOfClass;
  void *v10;
  id v11;
  void *v12;
  id v13;

  v5 = a5;
  v6 = a4;
  v13 = a3;
  -[STUIStatusBarVisualProvider_CarPlay pillRegionCoordinator](self, "pillRegionCoordinator");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "handledUpdateOfActionable:highlighted:initialPress:", v13, v6, v5) & 1) != 0)
  {
LABEL_5:

    v10 = v13;
    goto LABEL_6;
  }
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  v10 = v13;
  if ((isKindOfClass & 1) != 0)
  {
    v8 = v13;
    -[STUIStatusBarVisualProvider_CarPlay radarRegion](self, "radarRegion");
    v11 = (id)objc_claimAutoreleasedReturnValue();

    if (v11 == v8)
    {
      -[STUIStatusBarVisualProvider_CarPlay pillRegionCoordinator](self, "pillRegionCoordinator");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "updateRegion:highlighted:initialPress:cornerRadius:", v8, v6, v5, 8.0);

    }
    goto LABEL_5;
  }
LABEL_6:

}

- (id)_defaultScaleAnimationWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  CGAffineTransform v7;

  v4 = a3;
  CGAffineTransformMakeScale(&v7, 0.25, 0.25);
  STUIStatusBarDefaultAnimation(self, v4, (__int128 *)&v7, 0.25, 0.25, 0.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_animationForSensorIndicator
{
  void *v3;
  void *v4;
  CGAffineTransform v6;

  +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarSensorActivityItem, "defaultDisplayIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CGAffineTransformMakeScale(&v6, 0.25, 0.25);
  STUIStatusBarDefaultAnimation(self, v3, (__int128 *)&v6, 0.25, 0.25, 0.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_animationForPillTime
{
  return +[STUIStatusBarAnimationFactory fadeAnimationWithDuration:scale:](STUIStatusBarAnimationFactory, "fadeAnimationWithDuration:scale:", 0.25, 0.25);
}

- (id)orderedDisplayItemPlacementsInRegionWithIdentifier:(id)a3
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)overriddenStyleAttributesForDisplayItemWithIdentifier:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  +[STUIStatusBarTimeItem pillTimeDisplayIdentifier](STUIStatusBarTimeItem, "pillTimeDisplayIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    +[STUIStatusBarStyleAttributes overriddenStyleAttributes](STUIStatusBarStyleAttributes, "overriddenStyleAttributes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0DC1350];
    v8 = *MEMORY[0x1E0DC4AA0];
    -[STUIStatusBarVisualProvider_CarPlay statusBar](self, "statusBar");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "traitCollection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_preferredFontForTextStyle:design:variant:compatibleWithTraitCollection:", v8, 0, 1024, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setEmphasizedFont:", v11);

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTextColor:", v12);

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)setupInContainerView:(id)a3
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (BOOL)showSensorActivityIndicatorWithoutPortalView
{
  return 1;
}

- (STUIStatusBar)statusBar
{
  return (STUIStatusBar *)objc_loadWeakRetained((id *)&self->_statusBar);
}

- (void)setStatusBar:(id)a3
{
  objc_storeWeak((id *)&self->_statusBar, a3);
}

- (STUIStatusBarVisualProvider_PillRegionCoordinator)pillRegionCoordinator
{
  return self->_pillRegionCoordinator;
}

- (void)setPillRegionCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_pillRegionCoordinator, a3);
}

- (STUIStatusBarRegion)timeRegion
{
  return self->_timeRegion;
}

- (void)setTimeRegion:(id)a3
{
  objc_storeStrong((id *)&self->_timeRegion, a3);
}

- (STUIStatusBarRegion)radarRegion
{
  return self->_radarRegion;
}

- (void)setRadarRegion:(id)a3
{
  objc_storeStrong((id *)&self->_radarRegion, a3);
}

- (BOOL)showingSensorActivityIndicator
{
  return self->_showingSensorActivityIndicator;
}

- (void)setShowingSensorActivityIndicator:(BOOL)a3
{
  self->_showingSensorActivityIndicator = a3;
}

- (BOOL)showingPill
{
  return self->_showingPill;
}

- (void)setShowingPill:(BOOL)a3
{
  self->_showingPill = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_radarRegion, 0);
  objc_storeStrong((id *)&self->_timeRegion, 0);
  objc_storeStrong((id *)&self->_pillRegionCoordinator, 0);
  objc_destroyWeak((id *)&self->_statusBar);
}

@end
