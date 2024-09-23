@implementation SBHLibraryPodCategoryFolderView

+ (Class)defaultIconListViewClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isLibraryPodCategoryFolderView
{
  return 1;
}

- (CGSize)_iconSpacingForIconListView
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  -[SBFolderView listLayoutProvider](self, "listLayoutProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutForIconLocation:", CFSTR("SBIconLocationAppLibrary"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "appLibraryVisualConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "expandedCategoryPodIconSpacing");
  v6 = v5;
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)_configureIconListView:(id)a3
{
  id v4;
  double v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)SBHLibraryPodCategoryFolderView;
  -[SBHLibraryPodFolderView _configureIconListView:](&v6, sel__configureIconListView_, v4);
  objc_msgSend(v4, "iconSpacing");
  if (v5 == -123.0)
    objc_msgSend(v4, "setAutoresizingMask:", 2);

}

- (void)_orientationDidChange:(int64_t)a3
{
  void *v5;
  objc_super v6;

  -[SBHLibraryPodFolderView navigationBar](self, "navigationBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHLibraryPodFolderView _layoutMarginsforNavigationBar:](self, "_layoutMarginsforNavigationBar:", v5);
  objc_msgSend(v5, "setDirectionalLayoutMargins:");
  v6.receiver = self;
  v6.super_class = (Class)SBHLibraryPodCategoryFolderView;
  -[SBHLibraryPodFolderView _orientationDidChange:](&v6, sel__orientationDidChange_, a3);

}

- (CGSize)_scrollViewContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  objc_super v8;
  CGSize result;

  -[SBHLibraryPodCategoryFolderView bounds](self, "bounds");
  v4 = v3;
  v8.receiver = self;
  v8.super_class = (Class)SBHLibraryPodCategoryFolderView;
  -[SBHLibraryPodFolderView _scrollViewContentSize](&v8, sel__scrollViewContentSize);
  v7 = fmax(v6, 0.0);
  if (v4 <= v7)
    v7 = v4;
  result.height = v5;
  result.width = v7;
  return result;
}

@end
