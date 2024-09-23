@implementation SBHLibraryIconViewController

- (SBHLibraryIconViewController)initWithListLayoutProvider:(id)a3
{
  id v5;
  SBHLibraryIconViewController *v6;
  SBHLibraryIconViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBHLibraryIconViewController;
  v6 = -[SBHLibraryIconViewController initWithNibName:bundle:](&v9, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_listLayoutProvider, a3);

  return v7;
}

- (SBHLibraryIconViewController)initWithNibName:(id)a3 bundle:(id)a4
{

  return 0;
}

- (SBHLibraryIconViewController)initWithCoder:(id)a3
{

  return 0;
}

- (void)dealloc
{
  objc_super v3;

  -[SBHLibraryCategoriesFolderDataSource removeObserver:](self->_libraryDataSource, "removeObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)SBHLibraryIconViewController;
  -[SBHLibraryIconViewController dealloc](&v3, sel_dealloc);
}

- (void)viewDidLoad
{
  void *v3;
  SBHLibraryCategoryStackView *v4;
  SBHLibraryCategoryStackView *v5;
  SBHLibraryCategoryStackView *categoryStackView;
  SBHLibraryCategoryStackView *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBHLibraryIconViewController;
  -[SBHLibraryIconViewController viewDidLoad](&v8, sel_viewDidLoad);
  -[SBHLibraryIconViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = [SBHLibraryCategoryStackView alloc];
  objc_msgSend(v3, "bounds");
  v5 = -[SBHLibraryCategoryStackView initWithFrame:](v4, "initWithFrame:");
  -[SBHLibraryCategoryStackView setAutoresizingMask:](v5, "setAutoresizingMask:", 18);
  -[SBHLibraryCategoryStackView setIconImageInfo:](v5, "setIconImageInfo:", self->_iconImageInfo.size.width, self->_iconImageInfo.size.height, self->_iconImageInfo.scale, self->_iconImageInfo.continuousCornerRadius);
  objc_msgSend(v3, "addSubview:", v5);
  categoryStackView = self->_categoryStackView;
  self->_categoryStackView = v5;
  v7 = v5;

  -[SBHLibraryCategoryStackView setAlpha:](v7, "setAlpha:", 1.0);
  -[SBHLibraryIconViewController _reloadCategoryViewsForDataSourceChangeAnimated:](self, "_reloadCategoryViewsForDataSourceChangeAnimated:", 0);

}

- (void)setLibraryDataSource:(id)a3
{
  SBHLibraryCategoriesFolderDataSource *v5;
  SBHLibraryCategoriesFolderDataSource *libraryDataSource;
  int v7;
  SBHLibraryCategoriesFolderDataSource *v8;

  v5 = (SBHLibraryCategoriesFolderDataSource *)a3;
  libraryDataSource = self->_libraryDataSource;
  if (libraryDataSource != v5)
  {
    v8 = v5;
    -[SBHLibraryCategoriesFolderDataSource removeObserver:](self->_libraryDataSource, "removeObserver:", self);
    objc_storeStrong((id *)&self->_libraryDataSource, a3);
    -[SBHLibraryCategoriesFolderDataSource addObserver:](v8, "addObserver:", self);
    v7 = -[SBHLibraryIconViewController isViewLoaded](self, "isViewLoaded");
    v5 = v8;
    if (v7)
    {
      -[SBHLibraryIconViewController _reloadCategoryViewsForDataSourceChangeAnimated:](self, "_reloadCategoryViewsForDataSourceChangeAnimated:", libraryDataSource != 0);
      v5 = v8;
    }
  }

}

- (SBHLibraryCategoryStackView)categoryStackView
{
  -[SBHLibraryIconViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  return self->_categoryStackView;
}

- (UIView)dismissalView
{
  -[SBHLibraryIconViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  return (UIView *)self->_dismissalView;
}

- (void)setIconImageInfo:(SBIconImageInfo *)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  SBIconImageInfo *p_iconImageInfo;

  v7 = v6;
  v8 = v5;
  v9 = v4;
  v10 = v3;
  p_iconImageInfo = &self->_iconImageInfo;
  if (!SBIconImageInfoEqualToIconImageInfo(self->_iconImageInfo.size.width, self->_iconImageInfo.size.height, self->_iconImageInfo.scale, self->_iconImageInfo.continuousCornerRadius, v3, v4, v5, v6))
  {
    p_iconImageInfo->size.width = v10;
    p_iconImageInfo->size.height = v9;
    p_iconImageInfo->scale = v8;
    p_iconImageInfo->continuousCornerRadius = v7;
    -[SBHLibraryCategoryStackView setIconImageInfo:](self->_categoryStackView, "setIconImageInfo:", v10, v9, v8, v7);
    -[SBHLibraryDismissalView setIconImageInfo:](self->_dismissalView, "setIconImageInfo:", v10, v9, v8, v7);
  }
}

- (void)setEditing:(BOOL)a3
{
  -[SBHLibraryIconViewController setEditing:animated:](self, "setEditing:animated:", a3, 0);
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_editing != a3)
  {
    self->_editing = a3;
    -[SBHLibraryCategoryStackView setEditing:](self->_categoryStackView, "setEditing:");
  }
}

- (void)setOverlapping:(BOOL)a3
{
  if (self->_overlapping != a3)
  {
    self->_overlapping = a3;
    -[SBHLibraryCategoryStackView setOverlapping:](self->_categoryStackView, "setOverlapping:");
  }
}

- (BOOL)isUserInteractionEnabled
{
  return 0;
}

- (void)setBrightness:(double)a3
{
  if (self->_brightness != a3)
  {
    self->_brightness = a3;
    -[SBHLibraryCategoryStackView setHighlighted:](self->_categoryStackView, "setHighlighted:", BSFloatIsOne() ^ 1);
    -[SBHLibraryDismissalView setBrightness:](self->_dismissalView, "setBrightness:", a3);
  }
}

- (CGRect)focusEffectBounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[SBHLibraryCategoryStackView visibleContentFrame](self->_categoryStackView, "visibleContentFrame");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGPoint)focusEffectCenter
{
  double v2;
  double v3;
  CGPoint result;

  -[SBHLibraryIconViewController focusEffectBounds](self, "focusEffectBounds");
  UIRectGetCenter();
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGRect)visibleBounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  -[SBHLibraryIconViewController iconImageInfo](self, "iconImageInfo");
  v3 = v2;
  v5 = v4;
  v6 = 0.0;
  v7 = 0.0;
  result.size.height = v5;
  result.size.width = v3;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (double)continuousCornerRadius
{
  double v2;

  -[SBHLibraryIconViewController iconImageInfo](self, "iconImageInfo");
  return v2;
}

- (void)categoriesDataSource:(id)a3 shouldAnimateLayoutForCategories:(id)a4
{
  -[SBHLibraryIconViewController _reloadCategoryViewsForDataSourceChangeAnimated:](self, "_reloadCategoryViewsForDataSourceChangeAnimated:", 1, a4);
}

- (void)categoriesDataSourceNeedsAnimatedReload:(id)a3
{
  -[SBHLibraryIconViewController _reloadCategoryViewsForDataSourceChangeAnimated:](self, "_reloadCategoryViewsForDataSourceChangeAnimated:", 1);
}

- (void)_reloadCategoryViewsForDataSourceChangeAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  SBHLibraryCategoryStackView *categoryStackView;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  SBHLibraryCategoriesFolderDataSource *libraryDataSource;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  SBHLibraryCategoryStackView *v15;
  void *v16;
  int v17;
  SBHLibraryIconViewController *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v3 = a3;
  v21 = *MEMORY[0x1E0C80C00];
  -[SBHLibraryCategoriesFolderDataSource categoryIdentifiers](self->_libraryDataSource, "categoryIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  categoryStackView = self->_categoryStackView;
  v7 = objc_msgSend(v5, "count");
  if (v7 <= 1)
    v8 = 1;
  else
    v8 = v7;
  if (v8 >= 3)
    v9 = 3;
  else
    v9 = v8;
  -[SBHLibraryCategoryStackView setNumberOfCategories:](categoryStackView, "setNumberOfCategories:", v9);
  libraryDataSource = self->_libraryDataSource;
  objc_msgSend(v5, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHLibraryCategoriesFolderDataSource categoryForIdentifier:](libraryDataSource, "categoryForIdentifier:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  SBLogLibrary();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 138412546;
    v18 = self;
    v19 = 2112;
    v20 = v12;
    _os_log_impl(&dword_1CFEF3000, v13, OS_LOG_TYPE_DEFAULT, "[%@] reloading pod icons for updated topmost category: %@", (uint8_t *)&v17, 0x16u);
  }

  objc_msgSend(v12, "compactPodFolder");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = self->_categoryStackView;
  objc_msgSend(v14, "icons");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHLibraryCategoryStackView setInnerIcons:animated:](v15, "setInnerIcons:animated:", v16, v3);

}

- (NSString)description
{
  return (NSString *)-[SBHLibraryIconViewController descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBHLibraryIconViewController succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBHLibraryIconViewController descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  SBHLibraryIconViewController *v11;

  v4 = a3;
  -[SBHLibraryIconViewController succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __70__SBHLibraryIconViewController_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E8D84EF0;
  v6 = v5;
  v10 = v6;
  v11 = self;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v9);

  v7 = v6;
  return v7;
}

id __70__SBHLibraryIconViewController_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "libraryDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "appendObject:withName:", v3, CFSTR("libraryDataSource"));

  v5 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "categoryStackView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v5, "appendObject:withName:", v6, CFSTR("categoryStackView"));

  v8 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:ifEqualTo:", objc_msgSend(*(id *)(a1 + 40), "isEditing"), CFSTR("isEditing"), 1);
  v9 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "brightness");
  return (id)objc_msgSend(v9, "appendFloat:withName:", CFSTR("brightness"));
}

- (SBIconImageInfo)iconImageInfo
{
  return self;
}

- (BOOL)isEditing
{
  return self->_editing;
}

- (BOOL)isOverlapping
{
  return self->_overlapping;
}

- (double)brightness
{
  return self->_brightness;
}

- (BOOL)showsSquareCorners
{
  return self->_showsSquareCorners;
}

- (SBHLibraryCategoriesFolderDataSource)libraryDataSource
{
  return self->_libraryDataSource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryDataSource, 0);
  objc_storeStrong((id *)&self->_dismissalView, 0);
  objc_storeStrong((id *)&self->_categoryStackView, 0);
  objc_storeStrong((id *)&self->_listLayoutProvider, 0);
}

@end
