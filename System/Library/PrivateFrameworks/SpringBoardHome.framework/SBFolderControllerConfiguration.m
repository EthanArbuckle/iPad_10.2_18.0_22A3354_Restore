@implementation SBFolderControllerConfiguration

- (void)setOriginatingIconLocation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (void)setFolder:(id)a3
{
  objc_storeStrong((id *)&self->_folder, a3);
}

- (SBFolderControllerConfiguration)init
{
  SBFolderControllerConfiguration *v2;
  SBFolderControllerConfiguration *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBFolderControllerConfiguration;
  v2 = -[SBFolderControllerConfiguration init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_allowedOrientations = 30;
    objc_storeStrong((id *)&v2->_originatingIconLocation, CFSTR("SBIconLocationNone"));
    v3->_headerHeight = *(double *)MEMORY[0x1E0DC55F0];
    v3->_snapsToPageBoundariesAfterScrolling = 1;
  }
  return v3;
}

- (void)setOrientation:(int64_t)a3
{
  self->_orientation = a3;
}

- (void)setListLayoutProvider:(id)a3
{
  objc_storeStrong((id *)&self->_listLayoutProvider, a3);
}

- (void)setLegibilitySettings:(id)a3
{
  objc_storeStrong((id *)&self->_legibilitySettings, a3);
}

- (void)setIconViewProvider:(id)a3
{
  objc_storeWeak((id *)&self->_iconViewProvider, a3);
}

- (void)setIconImageCache:(id)a3
{
  objc_storeStrong((id *)&self->_iconImageCache, a3);
}

- (void)setFolderIconImageCache:(id)a3
{
  objc_storeStrong((id *)&self->_folderIconImageCache, a3);
}

- (void)setFolderDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_folderDelegate, a3);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setAllowedOrientations:(unint64_t)a3
{
  self->_allowedOrientations = a3;
}

- (void)setAddsFocusGuidesForWrapping:(BOOL)a3
{
  self->_addsFocusGuidesForWrapping = a3;
}

- (SBFolderControllerConfiguration)initWithConfiguration:(id)a3
{
  id v4;
  SBFolderControllerConfiguration *v5;
  uint64_t v6;
  SBFolder *folder;
  uint64_t v8;
  SBIconListLayoutProvider *listLayoutProvider;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _UILegibilitySettings *legibilitySettings;
  uint64_t v15;
  SBFolderIconImageCache *folderIconImageCache;
  uint64_t v17;
  SBHIconImageCache *iconImageCache;
  uint64_t v19;
  SBFolderControllerAnimationContext *animationContext;
  uint64_t v21;
  UIView *headerView;
  double v23;
  void *v24;
  uint64_t v25;
  NSString *originatingIconLocation;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  void *v31;
  uint64_t v32;
  SBHIconImageAppearance *overrideIconImageAppearance;
  objc_super v35;

  v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)SBFolderControllerConfiguration;
  v5 = -[SBFolderControllerConfiguration init](&v35, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "folder");
    v6 = objc_claimAutoreleasedReturnValue();
    folder = v5->_folder;
    v5->_folder = (SBFolder *)v6;

    v5->_orientation = objc_msgSend(v4, "orientation");
    v5->_allowedOrientations = objc_msgSend(v4, "allowedOrientations");
    objc_msgSend(v4, "listLayoutProvider");
    v8 = objc_claimAutoreleasedReturnValue();
    listLayoutProvider = v5->_listLayoutProvider;
    v5->_listLayoutProvider = (SBIconListLayoutProvider *)v8;

    objc_msgSend(v4, "iconViewProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v5->_iconViewProvider, v10);

    objc_msgSend(v4, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v5->_delegate, v11);

    objc_msgSend(v4, "folderDelegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v5->_folderDelegate, v12);

    objc_msgSend(v4, "legibilitySettings");
    v13 = objc_claimAutoreleasedReturnValue();
    legibilitySettings = v5->_legibilitySettings;
    v5->_legibilitySettings = (_UILegibilitySettings *)v13;

    objc_msgSend(v4, "folderIconImageCache");
    v15 = objc_claimAutoreleasedReturnValue();
    folderIconImageCache = v5->_folderIconImageCache;
    v5->_folderIconImageCache = (SBFolderIconImageCache *)v15;

    objc_msgSend(v4, "iconImageCache");
    v17 = objc_claimAutoreleasedReturnValue();
    iconImageCache = v5->_iconImageCache;
    v5->_iconImageCache = (SBHIconImageCache *)v17;

    objc_msgSend(v4, "animationContext");
    v19 = objc_claimAutoreleasedReturnValue();
    animationContext = v5->_animationContext;
    v5->_animationContext = (SBFolderControllerAnimationContext *)v19;

    objc_msgSend(v4, "headerView");
    v21 = objc_claimAutoreleasedReturnValue();
    headerView = v5->_headerView;
    v5->_headerView = (UIView *)v21;

    objc_msgSend(v4, "headerHeight");
    v5->_headerHeight = v23;
    objc_msgSend(v4, "originatingIconLocation");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "copy");
    originatingIconLocation = v5->_originatingIconLocation;
    v5->_originatingIconLocation = (NSString *)v25;

    v5->_userInterfaceLayoutDirectionHandling = objc_msgSend(v4, "userInterfaceLayoutDirectionHandling");
    v5->_vertical = objc_msgSend(v4, "isVertical");
    objc_msgSend(v4, "initialViewFrame");
    v5->_initialViewFrame.origin.x = v27;
    v5->_initialViewFrame.origin.y = v28;
    v5->_initialViewFrame.size.width = v29;
    v5->_initialViewFrame.size.height = v30;
    v5->_snapsToPageBoundariesAfterScrolling = objc_msgSend(v4, "snapsToPageBoundariesAfterScrolling");
    v5->_addsFocusGuidesForWrapping = objc_msgSend(v4, "addsFocusGuidesForWrapping");
    objc_msgSend(v4, "overrideIconImageAppearance");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "copy");
    overrideIconImageAppearance = v5->_overrideIconImageAppearance;
    v5->_overrideIconImageAppearance = (SBHIconImageAppearance *)v32;

    v5->_iconSpacingAxisMatchingBehavior = objc_msgSend(v4, "iconSpacingAxisMatchingBehavior");
  }

  return v5;
}

- (int64_t)orientation
{
  int64_t orientation;
  unint64_t allowedOrientations;
  int v4;
  unint64_t v5;

  orientation = self->_orientation;
  allowedOrientations = self->_allowedOrientations;
  v4 = SBFInterfaceOrientationMaskContainsInterfaceOrientation();
  v5 = __clz(__rbit64(allowedOrientations));
  if (v5 <= 1)
    v5 = 1;
  if (v4)
    return orientation;
  else
    return v5;
}

- (SBIconListLayoutProvider)listLayoutProvider
{
  return self->_listLayoutProvider;
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (SBIconViewProviding)iconViewProvider
{
  return (SBIconViewProviding *)objc_loadWeakRetained((id *)&self->_iconViewProvider);
}

- (SBHIconImageCache)iconImageCache
{
  return self->_iconImageCache;
}

- (UIView)headerView
{
  return self->_headerView;
}

- (SBFolder)folder
{
  return self->_folder;
}

- (SBFolderIconImageCache)folderIconImageCache
{
  return self->_folderIconImageCache;
}

- (unint64_t)allowedOrientations
{
  return self->_allowedOrientations;
}

- (BOOL)addsFocusGuidesForWrapping
{
  return self->_addsFocusGuidesForWrapping;
}

- (unint64_t)userInterfaceLayoutDirectionHandling
{
  return self->_userInterfaceLayoutDirectionHandling;
}

- (BOOL)snapsToPageBoundariesAfterScrolling
{
  return self->_snapsToPageBoundariesAfterScrolling;
}

- (NSString)originatingIconLocation
{
  return self->_originatingIconLocation;
}

- (CGRect)initialViewFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_initialViewFrame.origin.x;
  y = self->_initialViewFrame.origin.y;
  width = self->_initialViewFrame.size.width;
  height = self->_initialViewFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (double)headerHeight
{
  return self->_headerHeight;
}

- (SBFolderControllerDelegate)folderDelegate
{
  return (SBFolderControllerDelegate *)objc_loadWeakRetained((id *)&self->_folderDelegate);
}

- (SBNestingViewControllerDelegate)delegate
{
  return (SBNestingViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (SBFolderControllerAnimationContext)animationContext
{
  return self->_animationContext;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithConfiguration:", self);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideIconImageAppearance, 0);
  objc_storeStrong((id *)&self->_originatingIconLocation, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_animationContext, 0);
  objc_storeStrong((id *)&self->_iconImageCache, 0);
  objc_storeStrong((id *)&self->_folderIconImageCache, 0);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_destroyWeak((id *)&self->_folderDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_iconViewProvider);
  objc_storeStrong((id *)&self->_listLayoutProvider, 0);
  objc_storeStrong((id *)&self->_folder, 0);
}

- (NSString)description
{
  return (NSString *)-[SBFolderControllerConfiguration descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", CFSTR("\t"));
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBFolderControllerConfiguration descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  id v36;
  void *v37;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFolderControllerConfiguration folder](self, "folder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v4, "appendObject:withName:", v5, CFSTR("folder"));

  v7 = (id)objc_msgSend(v4, "appendInteger:withName:", -[SBFolderControllerConfiguration orientation](self, "orientation"), CFSTR("orientation"));
  v8 = (id)objc_msgSend(v4, "appendUnsignedInteger:withName:", -[SBFolderControllerConfiguration allowedOrientations](self, "allowedOrientations"), CFSTR("allowedOrientations"));
  -[SBFolderControllerConfiguration listLayoutProvider](self, "listLayoutProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v4, "appendObject:withName:", v9, CFSTR("listLayoutProvider"));

  -[SBFolderControllerConfiguration iconViewProvider](self, "iconViewProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v4, "appendObject:withName:", v11, CFSTR("iconViewProvider"));

  -[SBFolderControllerConfiguration delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (id)objc_msgSend(v4, "appendObject:withName:", v13, CFSTR("delegate"));

  -[SBFolderControllerConfiguration folderDelegate](self, "folderDelegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (id)objc_msgSend(v4, "appendObject:withName:", v15, CFSTR("folderDelegate"));

  -[SBFolderControllerConfiguration legibilitySettings](self, "legibilitySettings");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (id)objc_msgSend(v4, "appendObject:withName:", v17, CFSTR("legibilitySettings"));

  -[SBFolderControllerConfiguration folderIconImageCache](self, "folderIconImageCache");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (id)objc_msgSend(v4, "appendObject:withName:", v19, CFSTR("folderIconImageCache"));

  -[SBFolderControllerConfiguration iconImageCache](self, "iconImageCache");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (id)objc_msgSend(v4, "appendObject:withName:", v21, CFSTR("iconImageCache"));

  -[SBFolderControllerConfiguration animationContext](self, "animationContext");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (id)objc_msgSend(v4, "appendObject:withName:", v23, CFSTR("animationContext"));

  -[SBFolderControllerConfiguration headerView](self, "headerView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (id)objc_msgSend(v4, "appendObject:withName:", v25, CFSTR("headerView"));

  -[SBFolderControllerConfiguration headerHeight](self, "headerHeight");
  v27 = (id)objc_msgSend(v4, "appendFloat:withName:", CFSTR("headerHeight"));
  -[SBFolderControllerConfiguration originatingIconLocation](self, "originatingIconLocation");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (id)objc_msgSend(v4, "appendObject:withName:", v28, CFSTR("originatingIconLocation"));

  v30 = (id)objc_msgSend(v4, "appendInteger:withName:", -[SBFolderControllerConfiguration userInterfaceLayoutDirectionHandling](self, "userInterfaceLayoutDirectionHandling"), CFSTR("userInterfaceLayoutDirectionHandling"));
  v31 = (id)objc_msgSend(v4, "appendBool:withName:", -[SBFolderControllerConfiguration isVertical](self, "isVertical"), CFSTR("isVertical"));
  -[SBFolderControllerConfiguration initialViewFrame](self, "initialViewFrame");
  v32 = (id)objc_msgSend(v4, "appendRect:withName:", CFSTR("initialViewFrame"));
  v33 = (id)objc_msgSend(v4, "appendBool:withName:", -[SBFolderControllerConfiguration snapsToPageBoundariesAfterScrolling](self, "snapsToPageBoundariesAfterScrolling"), CFSTR("snapsToPageBoundariesAfterScrolling"));
  v34 = (id)objc_msgSend(v4, "appendBool:withName:", -[SBFolderControllerConfiguration addsFocusGuidesForWrapping](self, "addsFocusGuidesForWrapping"), CFSTR("addsFocusGuidesForWrapping"));
  -[SBFolderControllerConfiguration overrideIconImageAppearance](self, "overrideIconImageAppearance");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (id)objc_msgSend(v4, "appendObject:withName:", v35, CFSTR("overrideIconImageAppearance"));

  SBHStringForIconListIconSpacingAxisMatchingBehavior(-[SBFolderControllerConfiguration iconSpacingAxisMatchingBehavior](self, "iconSpacingAxisMatchingBehavior"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", v37, CFSTR("iconSpacingAxisMatchingBehavior"));

  return v4;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBFolderControllerConfiguration succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (void)setAnimationContext:(id)a3
{
  objc_storeStrong((id *)&self->_animationContext, a3);
}

- (void)setHeaderView:(id)a3
{
  objc_storeStrong((id *)&self->_headerView, a3);
}

- (void)setHeaderHeight:(double)a3
{
  self->_headerHeight = a3;
}

- (void)setUserInterfaceLayoutDirectionHandling:(unint64_t)a3
{
  self->_userInterfaceLayoutDirectionHandling = a3;
}

- (BOOL)isVertical
{
  return self->_vertical;
}

- (void)setVertical:(BOOL)a3
{
  self->_vertical = a3;
}

- (void)setInitialViewFrame:(CGRect)a3
{
  self->_initialViewFrame = a3;
}

- (void)setSnapsToPageBoundariesAfterScrolling:(BOOL)a3
{
  self->_snapsToPageBoundariesAfterScrolling = a3;
}

- (SBHIconImageAppearance)overrideIconImageAppearance
{
  return self->_overrideIconImageAppearance;
}

- (void)setOverrideIconImageAppearance:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (int64_t)iconSpacingAxisMatchingBehavior
{
  return self->_iconSpacingAxisMatchingBehavior;
}

- (void)setIconSpacingAxisMatchingBehavior:(int64_t)a3
{
  self->_iconSpacingAxisMatchingBehavior = a3;
}

@end
