@implementation SBLockScreenPreviewView

- (SBLockScreenPreviewView)initWithFrame:(CGRect)a3 wallpaperController:(id)a4 options:(unint64_t)a5 wallpaperImage:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  id v14;
  id v15;
  SBLockScreenPreviewView *v16;
  SBLockScreenPreviewView *v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  _UILegibilitySettings *legibilitySettings;
  SBLockScreenPreviewView *v22;
  objc_super v24;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v14 = a4;
  v15 = a6;
  v24.receiver = self;
  v24.super_class = (Class)SBLockScreenPreviewView;
  v16 = -[SBLockScreenPreviewView initWithFrame:](&v24, sel_initWithFrame_, x, y, width, height);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_wallpaperController, a4);
    if ((a5 & 0x400) != 0)
    {
      v19 = objc_alloc(MEMORY[0x1E0CEADE8]);
      v20 = 2;
    }
    else
    {
      if ((a5 & 0x800) == 0)
      {
        objc_msgSend(v14, "legibilitySettingsForVariant:", 0);
        v18 = objc_claimAutoreleasedReturnValue();
        goto LABEL_8;
      }
      v19 = objc_alloc(MEMORY[0x1E0CEADE8]);
      v20 = 1;
    }
    v18 = objc_msgSend(v19, "initWithStyle:", v20);
LABEL_8:
    legibilitySettings = v17->_legibilitySettings;
    v17->_legibilitySettings = (_UILegibilitySettings *)v18;

    if ((a5 & 0x40) == 0)
      -[SBLockScreenPreviewView _setupWallpaperViewWithImage:](v17, "_setupWallpaperViewWithImage:", v15);
    -[SBLockScreenPreviewView _setupDateViewWithOptions:](v17, "_setupDateViewWithOptions:", a5);
    if ((a5 & 1) == 0)
      -[SBLockScreenPreviewView _setupStatusBar](v17, "_setupStatusBar");
    if ((a5 & 0x22) == 0x20)
      -[SBLockScreenPreviewView _setupPageControl](v17, "_setupPageControl");
    -[SBLockScreenPreviewView _setupCallToActionLabel](v17, "_setupCallToActionLabel");
    if (SBFEffectiveHomeButtonType() != 2)
      goto LABEL_19;
    if ((a5 & 8) != 0)
    {
      if ((a5 & 0x10) != 0)
        goto LABEL_17;
    }
    else
    {
      -[SBLockScreenPreviewView _setupProudLockIconView](v17, "_setupProudLockIconView");
      if ((a5 & 0x10) != 0)
      {
LABEL_17:
        if ((a5 & 0x20) != 0)
        {
LABEL_19:
          v22 = v17;
          goto LABEL_20;
        }
LABEL_18:
        -[SBLockScreenPreviewView _setupHomeGrabberView](v17, "_setupHomeGrabberView");
        goto LABEL_19;
      }
    }
    -[SBLockScreenPreviewView _setupQuickActionView](v17, "_setupQuickActionView");
    if ((a5 & 0x20) != 0)
      goto LABEL_19;
    goto LABEL_18;
  }
LABEL_20:

  return v17;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[SBLockScreenPreviewView _statusBarReusePool](self, "_statusBarReusePool");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "recycleStatusBar:", self->_statusBar);

  v4.receiver = self;
  v4.super_class = (Class)SBLockScreenPreviewView;
  -[SBLockScreenPreviewView dealloc](&v4, sel_dealloc);
}

- (void)_setupWallpaperViewWithImage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  objc_class *v10;
  UIView *wallpaperView;
  UIView *v12;
  UIView *v13;
  SBWallpaperEffectView *v14;

  v4 = a3;
  if (v4)
    goto LABEL_8;
  -[SBWallpaperController wallpaperConfigurationManager](self->_wallpaperController, "wallpaperConfigurationManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "wallpaperConfigurationForVariant:includingValuesForTypes:", 0, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (_os_feature_enabled_impl())
  {
    SBLogWallpaper();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[SBLockScreenPreviewView _setupWallpaperViewWithImage:].cold.1(v6, v7);

  }
  else
  {
    objc_msgSend(v6, "proceduralWallpaperInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {

      goto LABEL_11;
    }
  }
  objc_msgSend(v6, "wallpaperThumbnailImage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "resizableImageWithCapInsets:resizingMode:", 1, *MEMORY[0x1E0CEB4B0], *(double *)(MEMORY[0x1E0CEB4B0] + 8), *(double *)(MEMORY[0x1E0CEB4B0] + 16), *(double *)(MEMORY[0x1E0CEB4B0] + 24));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
LABEL_11:
    v14 = -[SBWallpaperEffectView initWithWallpaperVariant:transformOptions:]([SBWallpaperEffectView alloc], "initWithWallpaperVariant:transformOptions:", 0, 2);
    -[PBUIWallpaperEffectViewBase setForcesOpaque:](v14, "setForcesOpaque:", 1);
    -[PBUIWallpaperEffectViewBase setStyle:](v14, "setStyle:", 0);
    wallpaperView = self->_wallpaperView;
    self->_wallpaperView = &v14->super.super;
    goto LABEL_9;
  }
LABEL_8:
  v10 = (objc_class *)MEMORY[0x1E0CEA658];
  wallpaperView = (UIView *)v4;
  v12 = (UIView *)objc_msgSend([v10 alloc], "initWithImage:", wallpaperView);
  v13 = self->_wallpaperView;
  self->_wallpaperView = v12;

  -[UIView setContentMode:](self->_wallpaperView, "setContentMode:", 2);
LABEL_9:

  -[SBLockScreenPreviewView addSubview:](self, "addSubview:", self->_wallpaperView);
}

- (void)_setupDateViewWithOptions:(unint64_t)a3
{
  char v3;
  SBFLockScreenDateViewController *v5;
  SBFLockScreenDateViewController *dateViewController;
  SBFLockScreenDateView *v7;
  id v8;
  SBFLockScreenDateView *dateView;
  SBFLockScreenDateView *v10;
  void *v11;
  void *v12;
  void *v13;
  SBFLockScreenDateView *v14;
  void *v15;
  SBFLockScreenDateView *v16;
  void *v17;
  id v18;

  v3 = a3;
  if (_os_feature_enabled_impl())
  {
    v5 = (SBFLockScreenDateViewController *)objc_alloc_init(MEMORY[0x1E0DA9E60]);
    dateViewController = self->_dateViewController;
    self->_dateViewController = v5;

    -[SBFLockScreenDateViewController dateView](self->_dateViewController, "dateView");
    v7 = (SBFLockScreenDateView *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = objc_alloc(MEMORY[0x1E0DA9E58]);
    v7 = (SBFLockScreenDateView *)objc_msgSend(v8, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  }
  dateView = self->_dateView;
  self->_dateView = v7;

  v10 = self->_dateView;
  if ((v3 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFLockScreenDateView setDate:](v10, "setDate:", v11);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", 190057260.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", CFSTR("America/Los_Angeles"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFLockScreenDateView _setDate:inTimeZone:](v10, "_setDate:inTimeZone:", v11, v12);

  }
  objc_msgSend(MEMORY[0x1E0D1BBD8], "rootSettings");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "lookSettings");
  v18 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v18, "useSettingsDateTime") && objc_msgSend(v18, "customizesDateTime"))
  {
    v14 = self->_dateView;
    objc_msgSend(v18, "customTimeFont");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFLockScreenDateView setCustomTimeFont:](v14, "setCustomTimeFont:", v15);

    -[SBFLockScreenDateView setSubtitleOnTop:](self->_dateView, "setSubtitleOnTop:", objc_msgSend(v18, "subtitleAboveTime"));
  }
  v16 = self->_dateView;
  objc_msgSend(MEMORY[0x1E0DA9E58], "timeFont");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFLockScreenDateView setCustomTimeFont:](v16, "setCustomTimeFont:", v17);

  -[SBFLockScreenDateView setLegibilitySettings:](self->_dateView, "setLegibilitySettings:", self->_legibilitySettings);
  -[SBLockScreenPreviewView addSubview:](self, "addSubview:", self->_dateView);

}

- (void)_setupStatusBar
{
  void *v3;
  UIStatusBar *v4;
  UIStatusBar *statusBar;
  UIStatusBar *v6;
  void *v7;

  -[SBLockScreenPreviewView _statusBarReusePool](self, "_statusBarReusePool");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBLockScreenPreviewView bounds](self, "bounds");
  objc_msgSend(v3, "getReusableStatusBarWithReason:withFrame:", CFSTR("Lock Screen Preview Status Bar"), 0.0, 0.0);
  v4 = (UIStatusBar *)objc_claimAutoreleasedReturnValue();
  statusBar = self->_statusBar;
  self->_statusBar = v4;

  -[UIStatusBar setOrientation:](self->_statusBar, "setOrientation:", 1);
  -[UIStatusBar setLegibilityStyle:](self->_statusBar, "setLegibilityStyle:", -[_UILegibilitySettings style](self->_legibilitySettings, "style"));
  v6 = self->_statusBar;
  -[_UILegibilitySettings primaryColor](self->_legibilitySettings, "primaryColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStatusBar setForegroundColor:](v6, "setForegroundColor:", v7);

  -[UIStatusBar requestStyle:](self->_statusBar, "requestStyle:", -[_UILegibilitySettings style](self->_legibilitySettings, "style") != 2);
  -[UIStatusBar sb_setSnapshotOverridesWithTimeEnabled:overriddenDate:](self->_statusBar, "sb_setSnapshotOverridesWithTimeEnabled:overriddenDate:", 0, 0);
  -[SBLockScreenPreviewView addSubview:](self, "addSubview:", self->_statusBar);
}

- (void)_setupPageControl
{
  id v3;
  CSPageControl *v4;
  CSPageControl *dashBoardPageControl;

  v3 = objc_alloc(MEMORY[0x1E0D1BC00]);
  v4 = (CSPageControl *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  dashBoardPageControl = self->_dashBoardPageControl;
  self->_dashBoardPageControl = v4;

  -[CSPageControl setLegibilitySettings:](self->_dashBoardPageControl, "setLegibilitySettings:", self->_legibilitySettings);
  -[CSPageControl setCameraPageIndex:](self->_dashBoardPageControl, "setCameraPageIndex:", 2);
  -[CSPageControl setNumberOfPages:](self->_dashBoardPageControl, "setNumberOfPages:", 3);
  -[CSPageControl setCurrentPage:](self->_dashBoardPageControl, "setCurrentPage:", 1);
  -[SBLockScreenPreviewView addSubview:](self, "addSubview:", self->_dashBoardPageControl);
}

- (void)_setupCallToActionLabel
{
  SBUICallToActionLabel *v3;
  SBUICallToActionLabel *callToActionLabel;

  v3 = (SBUICallToActionLabel *)objc_opt_new();
  callToActionLabel = self->_callToActionLabel;
  self->_callToActionLabel = v3;

  -[SBUICallToActionLabel setVisible:animated:](self->_callToActionLabel, "setVisible:animated:", 1, 0);
  -[SBUICallToActionLabel setLegibilitySettings:](self->_callToActionLabel, "setLegibilitySettings:", self->_legibilitySettings);
  -[SBLockScreenPreviewView addSubview:](self, "addSubview:", self->_callToActionLabel);
}

- (void)_setupProudLockIconView
{
  SBUIProudLockIconView *v3;
  SBUIProudLockIconView *proudLockIconView;

  v3 = (SBUIProudLockIconView *)objc_alloc_init(MEMORY[0x1E0DAC650]);
  proudLockIconView = self->_proudLockIconView;
  self->_proudLockIconView = v3;

  -[SBUIProudLockIconView setLegibilitySettings:](self->_proudLockIconView, "setLegibilitySettings:", self->_legibilitySettings);
  -[SBUIProudLockIconView setState:](self->_proudLockIconView, "setState:", 1);
  -[SBLockScreenPreviewView addSubview:](self, "addSubview:", self->_proudLockIconView);
}

- (void)_setupQuickActionView
{
  CSQuickActionsView *v3;
  CSQuickActionsView *quickActionsView;
  id v5;

  v5 = objc_alloc_init(MEMORY[0x1E0D1BC38]);
  objc_msgSend(v5, "view");
  v3 = (CSQuickActionsView *)objc_claimAutoreleasedReturnValue();
  quickActionsView = self->_quickActionsView;
  self->_quickActionsView = v3;

  -[CSQuickActionsView setLegibilitySettings:](self->_quickActionsView, "setLegibilitySettings:", self->_legibilitySettings);
  -[SBLockScreenPreviewView addSubview:](self, "addSubview:", self->_quickActionsView);

}

- (void)_setupHomeGrabberView
{
  SBHomeGrabberView *v3;
  SBHomeGrabberView *v4;
  SBHomeGrabberView *homeGrabberView;
  uint64_t v6;

  v3 = [SBHomeGrabberView alloc];
  v4 = -[SBHomeGrabberView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  homeGrabberView = self->_homeGrabberView;
  self->_homeGrabberView = v4;

  if (-[_UILegibilitySettings style](self->_legibilitySettings, "style") == 2)
    v6 = 1;
  else
    v6 = 2;
  -[SBHomeGrabberView setColorBias:](self->_homeGrabberView, "setColorBias:", v6);
  -[SBLockScreenPreviewView addSubview:](self, "addSubview:", self->_homeGrabberView);
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBLockScreenPreviewView;
  -[SBLockScreenPreviewView layoutSubviews](&v3, sel_layoutSubviews);
  -[SBLockScreenPreviewView _layoutWallpaperView](self, "_layoutWallpaperView");
  -[SBLockScreenPreviewView _layoutStatusBar](self, "_layoutStatusBar");
  -[SBLockScreenPreviewView _layoutDateView](self, "_layoutDateView");
  -[SBLockScreenPreviewView _layoutPageControl](self, "_layoutPageControl");
  -[SBLockScreenPreviewView _layoutCallToActionLabel](self, "_layoutCallToActionLabel");
  -[SBLockScreenPreviewView _layoutProudLockIconView](self, "_layoutProudLockIconView");
  -[SBLockScreenPreviewView _layoutQuickActionsView](self, "_layoutQuickActionsView");
  -[SBLockScreenPreviewView _layoutHomeGrabberView](self, "_layoutHomeGrabberView");
}

- (void)_layoutStatusBar
{
  -[SBLockScreenPreviewView bounds](self, "bounds");
  -[UIStatusBar setFrame:](self->_statusBar, "setFrame:", 0.0, 0.0);
}

- (void)_layoutDateView
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;

  -[SBFLockScreenDateView layoutIfNeeded](self->_dateView, "layoutIfNeeded");
  -[SBLockScreenPreviewView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    v11 = (void *)MEMORY[0x1E0DA9DE0];
    -[SBLockScreenPreviewView bounds](self, "bounds");
    objc_msgSend(v11, "suggestedFrameForDateTimeViewInScreenCoordinates:centeredX:", 0);
    v4 = v12;
    v6 = v13;
    v8 = v14;
    v10 = v15;
  }
  -[SBFLockScreenDateView setFrame:](self->_dateView, "setFrame:", v4, v6, v8, v10);
}

- (void)_layoutWallpaperView
{
  -[SBLockScreenPreviewView bounds](self, "bounds");
  -[UIView setFrame:](self->_wallpaperView, "setFrame:");
}

- (void)_layoutPageControl
{
  void *v3;

  -[CSPageControl sizeForNumberOfPages:](self->_dashBoardPageControl, "sizeForNumberOfPages:", -[CSPageControl numberOfPages](self->_dashBoardPageControl, "numberOfPages"));
  v3 = (void *)MEMORY[0x1E0D1BC00];
  -[SBLockScreenPreviewView bounds](self, "bounds");
  objc_msgSend(v3, "suggestedFrameForPageBounds:desiredSize:");
  -[CSPageControl setFrame:](self->_dashBoardPageControl, "setFrame:");
}

- (void)_layoutCallToActionLabel
{
  double MaxY;
  double v4;
  double v5;
  double v6;
  double v7;
  SBUICallToActionLabel *callToActionLabel;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGRect v14;

  -[SBLockScreenPreviewView bounds](self, "bounds");
  MaxY = CGRectGetMaxY(v14);
  -[CSPageControl frame](self->_dashBoardPageControl, "frame");
  v5 = MaxY - (v4 + 5.0);
  -[SBUICallToActionLabel baselineOffset](self->_callToActionLabel, "baselineOffset");
  v7 = v6 + v5;
  callToActionLabel = self->_callToActionLabel;
  v9 = (void *)MEMORY[0x1E0DA9DE0];
  -[SBLockScreenPreviewView bounds](self, "bounds");
  objc_msgSend(v9, "suggestedFrameForCallToActionLabel:yOffset:inBounds:", callToActionLabel, v7, v10, v11, v12, v13);
  -[SBUICallToActionLabel setFrame:](callToActionLabel, "setFrame:");
}

- (void)_layoutProudLockIconView
{
  -[SBLockScreenPreviewView bounds](self, "bounds");
  -[SBUIProudLockIconView setFrame:](self->_proudLockIconView, "setFrame:");
}

- (void)_layoutQuickActionsView
{
  -[SBLockScreenPreviewView bounds](self, "bounds");
  -[CSQuickActionsView setFrame:](self->_quickActionsView, "setFrame:");
}

- (void)_layoutHomeGrabberView
{
  -[SBLockScreenPreviewView bounds](self, "bounds");
  -[SBHomeGrabberView setFrame:](self->_homeGrabberView, "setFrame:");
}

- (id)_statusBarReusePool
{
  void *v2;
  void *v3;

  +[SBWindowSceneStatusBarManager windowSceneStatusBarManagerForEmbeddedDisplay](SBWindowSceneStatusBarManager, "windowSceneStatusBarManagerForEmbeddedDisplay");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reusePool");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateViewController, 0);
  objc_storeStrong((id *)&self->_homeGrabberView, 0);
  objc_storeStrong((id *)&self->_quickActionsView, 0);
  objc_storeStrong((id *)&self->_proudLockIconView, 0);
  objc_storeStrong((id *)&self->_callToActionLabel, 0);
  objc_storeStrong((id *)&self->_dashBoardPageControl, 0);
  objc_storeStrong((id *)&self->_slideToUnlockView, 0);
  objc_storeStrong((id *)&self->_cameraView, 0);
  objc_storeStrong((id *)&self->_wallpaperController, 0);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_statusBar, 0);
  objc_storeStrong((id *)&self->_slideToUnlockLegibilityLabel, 0);
  objc_storeStrong((id *)&self->_dateView, 0);
  objc_storeStrong((id *)&self->_wallpaperView, 0);
}

- (void)_setupWallpaperViewWithImage:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "debugDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138543362;
  v5 = v3;
  _os_log_debug_impl(&dword_1D0540000, a2, OS_LOG_TYPE_DEBUG, "WooP is on, using wallpaper thumbnail image from lock screen wallpaper configuration: %{public}@", (uint8_t *)&v4, 0xCu);

}

@end
