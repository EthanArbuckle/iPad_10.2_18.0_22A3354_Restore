@implementation SBIconListGridLayout

- (SBIconImageInfo)iconImageInfo
{
  return -[SBIconListGridLayoutConfiguration iconImageInfo](self->_layoutConfiguration, "iconImageInfo");
}

- (unint64_t)numberOfColumnsForOrientation:(int64_t)a3
{
  SBIconListGridLayoutConfiguration *layoutConfiguration;
  unint64_t result;

  layoutConfiguration = self->_layoutConfiguration;
  if ((unint64_t)(a3 - 3) > 1)
    return -[SBIconListGridLayoutConfiguration numberOfPortraitColumns](layoutConfiguration, "numberOfPortraitColumns");
  result = -[SBIconListGridLayoutConfiguration numberOfLandscapeColumns](layoutConfiguration, "numberOfLandscapeColumns");
  if (!result)
    return -[SBIconListGridLayoutConfiguration numberOfPortraitRows](self->_layoutConfiguration, "numberOfPortraitRows");
  return result;
}

- (id)labelVisualConfigurationForContentSizeCategory:(id)a3 options:(unint64_t)a4
{
  return -[SBIconListGridLayoutConfiguration iconLabelVisualConfigurationForContentSizeCategory:](self->_layoutConfiguration, "iconLabelVisualConfigurationForContentSizeCategory:", a3, a4);
}

- (id)labelFontForContentSizeCategory:(id)a3 options:(unint64_t)a4
{
  char v4;
  id v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;

  v4 = a4;
  v6 = a3;
  v7 = objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%lu"), v6, v4 & 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7
    || (-[NSMutableDictionary objectForKey:](self->_labelFonts, "objectForKey:", v8),
        (v9 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    -[SBIconListGridLayoutConfiguration iconLabelVisualConfigurationForContentSizeCategory:](self->_layoutConfiguration, "iconLabelVisualConfigurationForContentSizeCategory:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "fontSize");
    if (v11 <= 0.0)
      +[SBIconLabelImageParametersBuilder defaultFontForContentSizeCategory:languageInsets:](SBIconLabelImageParametersBuilder, "defaultFontForContentSizeCategory:languageInsets:", v6, 0);
    else
      objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      -[NSMutableDictionary setObject:forKey:](self->_labelFonts, "setObject:forKey:", v9, v8);

  }
  return v9;
}

- (SBHIconGridSizeClassSizeMap)iconGridSizeClassSizes
{
  return -[SBIconListGridLayoutConfiguration iconGridSizeClassSizes](self->_layoutConfiguration, "iconGridSizeClassSizes");
}

- (SBIconListGridLayoutConfiguration)layoutConfiguration
{
  return self->_layoutConfiguration;
}

- (UIEdgeInsets)layoutInsetsForOrientation:(int64_t)a3
{
  SBIconListGridLayoutConfiguration *layoutConfiguration;
  double v4;
  double v5;
  double v6;
  double v7;
  UIEdgeInsets result;

  layoutConfiguration = self->_layoutConfiguration;
  if ((unint64_t)(a3 - 3) > 1)
    -[SBIconListGridLayoutConfiguration portraitLayoutInsets](layoutConfiguration, "portraitLayoutInsets");
  else
    -[SBIconListGridLayoutConfiguration landscapeLayoutInsets](layoutConfiguration, "landscapeLayoutInsets");
  result.right = v7;
  result.bottom = v6;
  result.left = v5;
  result.top = v4;
  return result;
}

- (unint64_t)numberOfRowsForOrientation:(int64_t)a3
{
  SBIconListGridLayoutConfiguration *layoutConfiguration;
  unint64_t result;

  layoutConfiguration = self->_layoutConfiguration;
  if ((unint64_t)(a3 - 3) > 1)
    return -[SBIconListGridLayoutConfiguration numberOfPortraitRows](layoutConfiguration, "numberOfPortraitRows");
  result = -[SBIconListGridLayoutConfiguration numberOfLandscapeRows](layoutConfiguration, "numberOfLandscapeRows");
  if (!result)
    return -[SBIconListGridLayoutConfiguration numberOfPortraitColumns](self->_layoutConfiguration, "numberOfPortraitColumns");
  return result;
}

- (SBHRootFolderVisualConfiguration)rootFolderVisualConfiguration
{
  return -[SBIconListGridLayoutConfiguration rootFolderVisualConfiguration](self->_layoutConfiguration, "rootFolderVisualConfiguration");
}

- (SBHFloatyFolderVisualConfiguration)floatyFolderVisualConfiguration
{
  return -[SBIconListGridLayoutConfiguration floatyFolderVisualConfiguration](self->_layoutConfiguration, "floatyFolderVisualConfiguration");
}

- (SBHIconAccessoryVisualConfiguration)iconAccessoryVisualConfiguration
{
  return -[SBIconListGridLayoutConfiguration iconAccessoryVisualConfiguration](self->_layoutConfiguration, "iconAccessoryVisualConfiguration");
}

- (id)accessoryFontForContentSizeCategory:(id)a3 options:(unint64_t)a4
{
  if ((a4 & 1) != 0)
    -[SBIconListGridLayout accessoryBoldFont](self, "accessoryBoldFont", a3);
  else
    -[SBIconListGridLayout accessoryFont](self, "accessoryFont", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)accessoryFont
{
  int v3;
  UIFont *v4;
  void *v5;
  double v6;
  double v7;
  double v8;

  v3 = objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  if (!v3 || (v4 = self->_accessoryFont) == 0)
  {
    -[SBIconListGridLayoutConfiguration iconAccessoryVisualConfiguration](self->_layoutConfiguration, "iconAccessoryVisualConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fontSize");
    v7 = v6;

    v8 = 16.0;
    if (v7 > 0.0)
      v8 = v7;
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", v8);
    v4 = (UIFont *)objc_claimAutoreleasedReturnValue();
    if (v3)
      objc_storeStrong((id *)&self->_accessoryFont, v4);
  }
  return v4;
}

- (SBHFolderIconVisualConfiguration)folderIconVisualConfiguration
{
  return -[SBIconListGridLayoutConfiguration folderIconVisualConfiguration](self->_layoutConfiguration, "folderIconVisualConfiguration");
}

- (SBIconListGridLayout)initWithLayoutConfiguration:(id)a3
{
  id v4;
  SBIconListGridLayout *v5;
  uint64_t v6;
  SBIconListGridLayoutConfiguration *layoutConfiguration;
  NSMutableDictionary *v8;
  NSMutableDictionary *labelFonts;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBIconListGridLayout;
  v5 = -[SBIconListGridLayout init](&v11, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    layoutConfiguration = v5->_layoutConfiguration;
    v5->_layoutConfiguration = (SBIconListGridLayoutConfiguration *)v6;

    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    labelFonts = v5->_labelFonts;
    v5->_labelFonts = v8;

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutConfiguration, 0);
  objc_storeStrong((id *)&self->_accessoryBoldFont, 0);
  objc_storeStrong((id *)&self->_accessoryFont, 0);
  objc_storeStrong((id *)&self->_labelFonts, 0);
}

- (SBIconListGridLayout)init
{
  SBIconListGridLayoutConfiguration *v3;
  SBIconListGridLayout *v4;

  v3 = objc_alloc_init(SBIconListGridLayoutConfiguration);
  -[SBIconListGridLayoutConfiguration setIconImageInfo:](v3, "setIconImageInfo:", 70.0, 70.0, 2.0, 20.0);
  v4 = -[SBIconListGridLayout initWithLayoutConfiguration:](self, "initWithLayoutConfiguration:", v3);

  return v4;
}

- (SBIconImageInfo)iconImageInfoForGridSizeClass:(SEL)a3
{
  return -[SBIconListGridLayoutConfiguration iconImageInfoForGridSizeClass:](self->_layoutConfiguration, "iconImageInfoForGridSizeClass:", a4);
}

- (double)editingAnimationStrengthForGridSizeClass:(id)a3
{
  double result;

  -[SBIconListGridLayoutConfiguration editingAnimationStrengthForGridSizeClass:](self->_layoutConfiguration, "editingAnimationStrengthForGridSizeClass:", a3);
  return result;
}

- (UIEdgeInsets)additionalWidgetLayoutInsetsForOrientation:(int64_t)a3
{
  SBIconListGridLayoutConfiguration *layoutConfiguration;
  double v4;
  double v5;
  double v6;
  double v7;
  UIEdgeInsets result;

  layoutConfiguration = self->_layoutConfiguration;
  if ((unint64_t)(a3 - 3) > 1)
    -[SBIconListGridLayoutConfiguration portraitAdditionalWidgetLayoutInsets](layoutConfiguration, "portraitAdditionalWidgetLayoutInsets");
  else
    -[SBIconListGridLayoutConfiguration landscapeAdditionalWidgetLayoutInsets](layoutConfiguration, "landscapeAdditionalWidgetLayoutInsets");
  result.right = v7;
  result.bottom = v6;
  result.left = v5;
  result.top = v4;
  return result;
}

- (BOOL)enforceLayoutInsetsForAxis:(unint64_t)a3
{
  return (-[SBIconListGridLayoutConfiguration layoutInsetsEnforcementAxis](self->_layoutConfiguration, "layoutInsetsEnforcementAxis") & a3) != 0;
}

- (SBHIconGridSizeClassSet)supportedIconGridSizeClasses
{
  return -[SBIconListGridLayoutConfiguration supportedIconGridSizeClasses](self->_layoutConfiguration, "supportedIconGridSizeClasses");
}

- (NSString)rotatedLayoutClusterGridSizeClass
{
  return -[SBIconListGridLayoutConfiguration rotatedLayoutClusterGridSizeClass](self->_layoutConfiguration, "rotatedLayoutClusterGridSizeClass");
}

- (UIEdgeInsets)widgetContentMargins
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  -[SBIconListGridLayoutConfiguration widgetContentMargins](self->_layoutConfiguration, "widgetContentMargins");
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (BOOL)widgetsSupportDynamicText
{
  return 1;
}

- (int64_t)iconSpacingAxisMatchingBehavior
{
  return -[SBIconListGridLayoutConfiguration iconSpacingAxisMatchingBehavior](self->_layoutConfiguration, "iconSpacingAxisMatchingBehavior");
}

- (BOOL)showsLabels
{
  return -[SBIconListGridLayoutConfiguration showsLabels](self->_layoutConfiguration, "showsLabels");
}

- (id)accessoryBoldFont
{
  int v3;
  UIFont *v4;
  void *v5;
  double v6;
  double v7;
  double v8;

  v3 = objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  if (!v3 || (v4 = self->_accessoryBoldFont) == 0)
  {
    -[SBIconListGridLayoutConfiguration iconAccessoryVisualConfiguration](self->_layoutConfiguration, "iconAccessoryVisualConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fontSize");
    v7 = v6;

    v8 = 16.0;
    if (v7 > 0.0)
      v8 = v7;
    objc_msgSend(MEMORY[0x1E0DC1350], "boldSystemFontOfSize:", v8);
    v4 = (UIFont *)objc_claimAutoreleasedReturnValue();
    if (v3)
      objc_storeStrong((id *)&self->_accessoryBoldFont, v4);
  }
  return v4;
}

- (SBHSidebarVisualConfiguration)sidebarVisualConfiguration
{
  return -[SBIconListGridLayoutConfiguration sidebarVisualConfiguration](self->_layoutConfiguration, "sidebarVisualConfiguration");
}

- (SBHAppLibraryVisualConfiguration)appLibraryVisualConfiguration
{
  return -[SBIconListGridLayoutConfiguration appLibraryVisualConfiguration](self->_layoutConfiguration, "appLibraryVisualConfiguration");
}

- (SBHFloatingDockVisualConfiguration)floatingDockVisualConfiguration
{
  return -[SBIconListGridLayoutConfiguration floatingDockVisualConfiguration](self->_layoutConfiguration, "floatingDockVisualConfiguration");
}

- (BOOL)isEqual:(id)a3
{
  SBIconListGridLayout *v4;
  void *v5;
  char isKindOfClass;
  char v7;

  v4 = (SBIconListGridLayout *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_self();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
      v7 = BSEqualObjects();
    else
      v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  return -[SBIconListGridLayoutConfiguration hash](self->_layoutConfiguration, "hash");
}

- (NSString)description
{
  return (NSString *)-[SBIconListGridLayout descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBIconListGridLayout succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
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

  -[SBIconListGridLayout descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;

  -[SBIconListGridLayout succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "appendObject:withName:", self->_layoutConfiguration, CFSTR("layoutConfiguration"));
  return v4;
}

@end
