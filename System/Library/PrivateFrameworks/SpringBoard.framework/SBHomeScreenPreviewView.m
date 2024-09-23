@implementation SBHomeScreenPreviewView

- (SBHomeScreenPreviewView)initWithFrame:(CGRect)a3 iconManager:(id)a4 wallpaperController:(id)a5 options:(unint64_t)a6 wallpaperImage:(id)a7 listView:(id)a8
{
  double height;
  double width;
  double y;
  double x;
  id v18;
  id v19;
  id v20;
  id v21;
  SBHomeScreenPreviewView *v22;
  SBHomeScreenPreviewView *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  uint64_t v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  objc_class *v43;
  SBWallpaperEffectView *v44;
  void *v45;
  int v46;
  uint64_t v47;
  UIView *folderContent;
  double v49;
  int v50;
  SBPreviewFloatingDockViewController *v51;
  SBFloatingDockViewController *floatingDockViewController;
  void *v53;
  void *v54;
  void *v55;
  SBWallpaperEffectView *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  SBWindowSceneStatusBarManager *windowSceneStatusBarManager;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  UIStatusBar *statusBar;
  NSObject *v66;
  void *v68;
  objc_super v69;
  uint8_t buf[4];
  void *v71;
  uint64_t v72;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v72 = *MEMORY[0x1E0C80C00];
  v18 = a4;
  v19 = a5;
  v20 = a7;
  v21 = a8;
  v69.receiver = self;
  v69.super_class = (Class)SBHomeScreenPreviewView;
  v22 = -[SBHomeScreenPreviewView initWithFrame:](&v69, sel_initWithFrame_, x, y, width, height);
  v23 = v22;
  if (!v22)
    goto LABEL_43;
  objc_storeStrong((id *)&v22->_iconManager, a4);
  v23->_snapshotOptions = a6;
  if ((a6 & 0x400) != 0)
  {
    v27 = objc_alloc(MEMORY[0x1E0CEADE8]);
    v28 = 2;
LABEL_8:
    v29 = (void *)objc_msgSend(v27, "initWithStyle:", v28);
    goto LABEL_11;
  }
  if ((a6 & 0x800) != 0)
  {
    v27 = objc_alloc(MEMORY[0x1E0CEADE8]);
    v28 = 1;
    goto LABEL_8;
  }
  objc_msgSend(v18, "legibilitySettings");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (v24)
    v26 = v24;
  else
    v26 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CEADE8]), "initWithStyle:", 2);
  v29 = v26;

LABEL_11:
  -[SBHomeScreenPreviewView bounds](v23, "bounds");
  v31 = v30;
  v33 = v32;
  v35 = v34;
  v37 = v36;
  if ((a6 & 0x40) != 0)
  {
    v68 = 0;
    if (!v21)
      goto LABEL_26;
    goto LABEL_15;
  }
  if (v20)
  {
    v68 = 0;
LABEL_24:
    v43 = (objc_class *)MEMORY[0x1E0CEA658];
    v20 = v20;
    v44 = (SBWallpaperEffectView *)objc_msgSend([v43 alloc], "initWithImage:", v20);
    -[SBWallpaperEffectView setContentMode:](v44, "setContentMode:", 2);

    goto LABEL_25;
  }
  if (!v19)
  {
    +[SBWallpaperController sharedInstance](SBWallpaperController, "sharedInstance");
    v19 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v19, "wallpaperConfigurationManager");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "homeScreenWallpaperConfigurationIncludingValuesForTypes:", 4);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = v39;
  if (_os_feature_enabled_impl())
  {
    SBLogWallpaper();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
      -[SBHomeScreenPreviewView initWithFrame:iconManager:wallpaperController:options:wallpaperImage:listView:].cold.1(v68, v40);

  }
  else
  {
    objc_msgSend(v39, "proceduralWallpaperInfo");
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v41)
    {

      goto LABEL_45;
    }
  }
  objc_msgSend(v68, "wallpaperThumbnailImage");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "resizableImageWithCapInsets:resizingMode:", 1, *MEMORY[0x1E0CEB4B0], *(double *)(MEMORY[0x1E0CEB4B0] + 8), *(double *)(MEMORY[0x1E0CEB4B0] + 16), *(double *)(MEMORY[0x1E0CEB4B0] + 24));
  v20 = (id)objc_claimAutoreleasedReturnValue();

  if (v20)
    goto LABEL_24;
LABEL_45:
  v44 = -[SBWallpaperEffectView initWithWallpaperVariant:transformOptions:]([SBWallpaperEffectView alloc], "initWithWallpaperVariant:transformOptions:", 1, 2);
  -[PBUIWallpaperEffectViewBase setForcesOpaque:](v44, "setForcesOpaque:", 1);
  -[PBUIWallpaperEffectViewBase setStyle:](v44, "setStyle:", 0);
  v20 = 0;
LABEL_25:
  -[SBWallpaperEffectView setFrame:](v44, "setFrame:", v31, v33, v35, v37);
  -[SBHomeScreenPreviewView addSubview:](v23, "addSubview:", v44);

  if (!v21)
  {
LABEL_26:
    objc_msgSend((id)SBApp, "userSessionController");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v45, "isLoginSession");

    if (!v46)
    {
      -[SBHomeScreenPreviewView makeFolderContentWithWallpaperController:legibilitySettings:options:](v23, "makeFolderContentWithWallpaperController:legibilitySettings:options:", v19, v29, a6);
      v47 = objc_claimAutoreleasedReturnValue();
      folderContent = v23->_folderContent;
      v23->_folderContent = (UIView *)v47;

    }
    goto LABEL_28;
  }
LABEL_15:
  objc_storeStrong((id *)&v23->_folderContent, a8);
LABEL_28:
  v49 = *MEMORY[0x1E0CEBBE0];
  -[UIView setFrame:](v23->_folderContent, "setFrame:", 0.0, *MEMORY[0x1E0CEBBE0], v35, v37 - *MEMORY[0x1E0CEBBE0]);
  -[SBHomeScreenPreviewView addSubview:](v23, "addSubview:", v23->_folderContent);
  v50 = objc_msgSend(v18, "isFloatingDockSupported");
  if ((a6 & 0x2000) == 0 && v50)
  {
    v51 = -[SBFloatingDockViewController initWithIconManager:iconViewProvider:]([SBPreviewFloatingDockViewController alloc], "initWithIconManager:iconViewProvider:", v18, v23);
    floatingDockViewController = v23->_floatingDockViewController;
    v23->_floatingDockViewController = &v51->super;

    -[SBFloatingDockViewController view](v23->_floatingDockViewController, "view");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setFrame:", v31, v33, v35, v37);
    objc_msgSend(v53, "layoutIfNeeded");
    -[SBFloatingDockViewController layoutUserControlledIconListsWithAnimationType:forceRelayout:](v23->_floatingDockViewController, "layoutUserControlledIconListsWithAnimationType:forceRelayout:", -1, 1);
    -[SBHomeScreenPreviewView addSubview:](v23, "addSubview:", v53);
    objc_storeStrong((id *)&v23->_floatingDock, v53);
    if ((a6 & 0x200) != 0)
    {
      objc_msgSend(v53, "layer");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "setAllowsGroupOpacity:", 1);

      objc_msgSend(v53, "setAlpha:", 0.5);
    }
    if ((a6 & 0x40) != 0)
    {
      -[SBFloatingDockViewController dockView](v23->_floatingDockViewController, "dockView");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = -[SBWallpaperEffectView initWithWallpaperVariant:transformOptions:]([SBWallpaperEffectView alloc], "initWithWallpaperVariant:transformOptions:", 1, 2);
      -[SBWallpaperEffectView setClipsToBounds:](v56, "setClipsToBounds:", 1);
      -[PBUIWallpaperEffectViewBase setStyle:](v56, "setStyle:", 28);
      objc_msgSend(v55, "setBackgroundView:", v56);

    }
  }
  if ((a6 & 1) == 0)
  {
    objc_msgSend(v18, "rootFolderController");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "_sbWindowScene");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "statusBarManager");
    v59 = objc_claimAutoreleasedReturnValue();
    windowSceneStatusBarManager = v23->_windowSceneStatusBarManager;
    v23->_windowSceneStatusBarManager = (SBWindowSceneStatusBarManager *)v59;

    -[SBWindowSceneStatusBarManager reusePool](v23->_windowSceneStatusBarManager, "reusePool");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "getReusableStatusBarWithReason:withFrame:", CFSTR("Settings HomeScreen Preview View"), 0.0, 0.0, v35, v49);
    v62 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v62, "requestResolvedStyle:", 0);
    objc_msgSend(v62, "setManager:", 0);
    objc_msgSend(v62, "setLegibilityStyle:", objc_msgSend(v29, "style"));
    objc_msgSend(v29, "primaryColor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "setForegroundColor:", v63);

    if ((a6 & 4) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "sb_setSnapshotOverridesWithTimeEnabled:overriddenDate:", 1, v64);

    }
    else
    {
      objc_msgSend(v62, "sb_setSnapshotOverridesWithTimeEnabled:overriddenDate:", 1, 0);
    }
    -[SBHomeScreenPreviewView addSubview:](v23, "addSubview:", v62);
    statusBar = v23->_statusBar;
    v23->_statusBar = (UIStatusBar *)v62;

  }
  SBLogWallpaper();
  v66 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v71 = v68;
    _os_log_impl(&dword_1D0540000, v66, OS_LOG_TYPE_DEFAULT, "SETTING UP HomeScreenPreviewView WITH WALLPAPER '%{public}@", buf, 0xCu);
  }

LABEL_43:
  return v23;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if (self->_statusBar)
  {
    -[SBWindowSceneStatusBarManager reusePool](self->_windowSceneStatusBarManager, "reusePool");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "recycleStatusBar:", self->_statusBar);

  }
  v4.receiver = self;
  v4.super_class = (Class)SBHomeScreenPreviewView;
  -[SBHomeScreenPreviewView dealloc](&v4, sel_dealloc);
}

- (id)makeFolderContentWithWallpaperController:(id)a3 legibilitySettings:(id)a4 options:(unint64_t)a5
{
  if ((a5 & 0x4000) != 0)
    -[SBHomeScreenPreviewView makeSilhouetteFolderContent](self, "makeSilhouetteFolderContent", a3, a4);
  else
    -[SBHomeScreenPreviewView makeIconFolderContentWithWallpaperController:legibilitySettings:options:](self, "makeIconFolderContentWithWallpaperController:legibilitySettings:options:", a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)makeIconFolderContentWithWallpaperController:(id)a3 legibilitySettings:(id)a4 options:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  _SBHomeScreenFolderDelegate *v11;
  _SBHomeScreenFolderDelegate *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  SBDockOffscreenFractionModifying *v22;
  SBDockOffscreenFractionModifying *dockOffscreenModifier;
  void *v24;

  v8 = a4;
  v9 = a3;
  -[SBHomeScreenPreviewView iconManager](self, "iconManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[_SBHomeScreenFolderDelegate initWithForwardingTarget:]([_SBHomeScreenFolderDelegate alloc], "initWithForwardingTarget:", v10);
  v12 = v11;
  if ((a5 & 0x200) != 0)
  {
    v13 = 3;
    if ((a5 & 0x400) == 0)
      v13 = 1;
    if ((a5 & 0x800) != 0)
      v14 = 2;
    else
      v14 = v13;
    -[_SBHomeScreenFolderDelegate setDockStyle:](v11, "setDockStyle:", v14);
  }
  objc_storeStrong((id *)&self->_folderDelegate, v12);
  v15 = objc_alloc_init(MEMORY[0x1E0DAA650]);
  objc_msgSend(v10, "rootFolder");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFolder:", v16);

  objc_msgSend(v10, "listLayoutProvider");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setListLayoutProvider:", v17);

  objc_msgSend(v15, "setLegibilitySettings:", v8);
  objc_msgSend(v15, "setDockExternal:", +[SBFloatingDockController isFloatingDockSupported](SBFloatingDockController, "isFloatingDockSupported"));
  objc_msgSend(v15, "setFolderDelegate:", v12);
  objc_msgSend(v15, "setIconViewProvider:", self);
  objc_msgSend(v10, "folderIconImageCache");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFolderIconImageCache:", v18);

  objc_msgSend(v10, "iconImageCache");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setIconImageCache:", v19);

  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAA648]), "initWithConfiguration:", v15);
  objc_msgSend(v9, "averageColorForVariant:", 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "setDefaultAccessibilityTintColor:", v21);
  objc_msgSend(v20, "setPageControlHidden:", (a5 >> 1) & 1);
  objc_storeStrong((id *)&self->_rootFolderController, v20);
  if ((a5 & 0x2000) != 0)
  {
    objc_msgSend(v20, "beginModifyingDockOffscreenFractionForReason:", CFSTR("Preview"));
    v22 = (SBDockOffscreenFractionModifying *)objc_claimAutoreleasedReturnValue();
    dockOffscreenModifier = self->_dockOffscreenModifier;
    self->_dockOffscreenModifier = v22;

    -[SBDockOffscreenFractionModifying setDockOffscreenFraction:](self->_dockOffscreenModifier, "setDockOffscreenFraction:", 1.0);
  }
  objc_msgSend(v20, "view");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (id)makeSilhouetteFolderContent
{
  void *v3;
  void *v4;
  id v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  id (*v18)(uint64_t);
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22;

  -[SBHomeScreenPreviewView iconManager](self, "iconManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "silhouetteLayoutForPageAtIndex:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x1E0DAC4A8]);
  -[SBHomeScreenPreviewView bounds](self, "bounds");
  v8 = (void *)objc_msgSend(v5, "initWithSilhouetteLayout:viewSize:", v4, v6, v7);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __54__SBHomeScreenPreviewView_makeSilhouetteFolderContent__block_invoke;
  v21[3] = &unk_1E8EB8598;
  v12 = v10;
  v22 = v12;
  objc_msgSend(v8, "setIconViewBuilder:", v21);
  v16 = v11;
  v17 = 3221225472;
  v18 = __54__SBHomeScreenPreviewView_makeSilhouetteFolderContent__block_invoke_2;
  v19 = &unk_1E8EB8598;
  v20 = v12;
  v13 = v12;
  objc_msgSend(v8, "setDockViewBuilder:", &v16);
  objc_msgSend(v8, "buildView", v16, v17, v18, v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

id __54__SBHomeScreenPreviewView_makeSilhouetteFolderContent__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0D47498], "materialViewWithRecipe:", 3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("homeScreenIconView"), "stringByAppendingString:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setGroupNameBase:", v3);

  return v2;
}

id __54__SBHomeScreenPreviewView_makeSilhouetteFolderContent__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0D47498], "materialViewWithRecipe:", 19);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("homeScreenDockView"), "stringByAppendingString:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setGroupNameBase:", v3);

  return v2;
}

- (void)layoutSubviews
{
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  CGRect v12;
  CGRect remainder;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)SBHomeScreenPreviewView;
  -[SBHomeScreenPreviewView layoutSubviews](&v14, sel_layoutSubviews);
  -[SBHomeScreenPreviewView bounds](self, "bounds");
  v7 = v3;
  v8 = v4;
  v9 = v5;
  v10 = v6;
  remainder.origin.x = v3;
  remainder.origin.y = v4;
  remainder.size.width = v5;
  remainder.size.height = v6;
  if (self->_statusBar)
  {
    memset(&v12, 0, sizeof(v12));
    CGRectDivide(*(CGRect *)&v3, &v12, &remainder, *MEMORY[0x1E0CEBBE0], CGRectMinYEdge);
    -[UIStatusBar setFrame:](self->_statusBar, "setFrame:", *(_OWORD *)&v12.origin, *(_OWORD *)&v12.size);
  }
  if (self->_floatingDock)
  {
    memset(&v12, 0, sizeof(v12));
    -[SBFloatingDockViewController maximumContentHeight](self->_floatingDockViewController, "maximumContentHeight");
    CGRectDivide(remainder, &v12, &remainder, v11, CGRectMaxYEdge);
    -[UIView setFrame:](self->_floatingDock, "setFrame:", *(_OWORD *)&v12.origin, *(_OWORD *)&v12.size);
  }
  -[UIView setFrame:](self->_folderContent, "setFrame:", v7, v8, v9, v10);
}

- (id)dequeueReusableIconViewOfClass:(Class)a3
{
  return 0;
}

- (BOOL)isIconViewRecycled:(id)a3
{
  return 0;
}

- (void)configureIconView:(id)a3 forIcon:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[SBHomeScreenPreviewView iconManager](self, "iconManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "configureIconView:forIcon:", v8, v6);

  objc_msgSend(v8, "setDelegate:", self);
  objc_msgSend(v8, "setLabelAccessoryHidden:", 1);
  objc_msgSend(v8, "setAllowsBlockedForScreenTimeExpiration:", 0);
  objc_msgSend(v8, "setImageLoadingBehavior:", 0);
  if ((-[SBHomeScreenPreviewView snapshotOptions](self, "snapshotOptions") & 0x1000) != 0)
    objc_msgSend(v8, "setHidden:", 1);

}

- (id)iconView:(id)a3 backgroundViewForComponentsOfType:(int64_t)a4
{
  void *v4;
  char v5;
  SBWallpaperEffectView *v6;

  objc_msgSend(a3, "location");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = SBIconLocationGroupContainsLocation();

  if ((v5 & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    v6 = -[SBWallpaperEffectView initWithWallpaperVariant:]([SBWallpaperEffectView alloc], "initWithWallpaperVariant:", 1);
    -[PBUIWallpaperEffectViewBase setStyle:](v6, "setStyle:", 29);
  }
  return v6;
}

- (SBHIconManager)iconManager
{
  return self->_iconManager;
}

- (SBFloatingDockViewController)floatingDockViewController
{
  return self->_floatingDockViewController;
}

- (unint64_t)snapshotOptions
{
  return self->_snapshotOptions;
}

- (SBDockOffscreenFractionModifying)dockOffscreenModifier
{
  return self->_dockOffscreenModifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dockOffscreenModifier, 0);
  objc_storeStrong((id *)&self->_floatingDockViewController, 0);
  objc_storeStrong((id *)&self->_iconManager, 0);
  objc_storeStrong((id *)&self->_windowSceneStatusBarManager, 0);
  objc_storeStrong((id *)&self->_folderDelegate, 0);
  objc_storeStrong((id *)&self->_rootFolderController, 0);
  objc_storeStrong((id *)&self->_statusBar, 0);
  objc_storeStrong((id *)&self->_floatingDock, 0);
  objc_storeStrong((id *)&self->_folderContent, 0);
}

- (void)initWithFrame:(void *)a1 iconManager:(NSObject *)a2 wallpaperController:options:wallpaperImage:listView:.cold.1(void *a1, NSObject *a2)
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
  _os_log_debug_impl(&dword_1D0540000, a2, OS_LOG_TYPE_DEBUG, "WooP is on, using wallpaper thumbnail image from home screen wallpaper configuration: %{public}@", (uint8_t *)&v4, 0xCu);

}

@end
