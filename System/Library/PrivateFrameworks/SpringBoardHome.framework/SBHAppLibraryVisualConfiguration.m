@implementation SBHAppLibraryVisualConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  char *v5;
  _QWORD *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;

  v5 = (char *)objc_alloc_init((Class)objc_opt_class());
  v6 = v5;
  if (v5)
  {
    *(CGSize *)(v5 + 56) = self->_portraitCategoryPodIconSpacing;
    *(CGSize *)(v5 + 72) = self->_landscapeCategoryPodIconSpacing;
    *(CGSize *)(v5 + 88) = self->_expandedCategoryPodIconSpacing;
    v5[8] = self->_usesInsetPlatterSearchAppearance;
    *((_QWORD *)v5 + 2) = *(_QWORD *)&self->_searchContinuousCornerRadius;
    v7 = -[SBHSearchVisualConfiguration copyWithZone:](self->_extendedSearchVisualConfiguration, "copyWithZone:", a3);
    v8 = (void *)v6[3];
    v6[3] = v7;

    v9 = -[SBHSearchVisualConfiguration copyWithZone:](self->_standardSearchVisualConfiguration, "copyWithZone:", a3);
    v10 = (void *)v6[4];
    v6[4] = v9;

    v11 = -[SBHSearchVisualConfiguration copyWithZone:](self->_compactSearchVisualConfiguration, "copyWithZone:", a3);
    v12 = (void *)v6[5];
    v6[5] = v11;

    v13 = -[SBHSearchVisualConfiguration copyWithZone:](self->_activeSearchVisualConfiguration, "copyWithZone:", a3);
    v14 = (void *)v6[6];
    v6[6] = v13;

  }
  return v6;
}

- (SBHAppLibraryVisualConfiguration)init
{
  char *v2;
  SBHAppLibraryVisualConfiguration *v3;
  __int128 v4;
  SBHSearchVisualConfiguration *v5;
  SBHSearchVisualConfiguration *extendedSearchVisualConfiguration;
  SBHSearchVisualConfiguration *v7;
  SBHSearchVisualConfiguration *standardSearchVisualConfiguration;
  SBHSearchVisualConfiguration *v9;
  SBHSearchVisualConfiguration *compactSearchVisualConfiguration;
  SBHSearchVisualConfiguration *v11;
  SBHSearchVisualConfiguration *activeSearchVisualConfiguration;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)SBHAppLibraryVisualConfiguration;
  v2 = -[SBHAppLibraryVisualConfiguration init](&v14, sel_init);
  v3 = (SBHAppLibraryVisualConfiguration *)v2;
  if (v2)
  {
    v4 = *MEMORY[0x1E0C9D820];
    *(_OWORD *)(v2 + 56) = *MEMORY[0x1E0C9D820];
    *(_OWORD *)(v2 + 72) = v4;
    *(_OWORD *)(v2 + 88) = v4;
    v2[8] = 0;
    *((_QWORD *)v2 + 2) = 0x4030000000000000;
    v5 = objc_alloc_init(SBHSearchVisualConfiguration);
    extendedSearchVisualConfiguration = v3->_extendedSearchVisualConfiguration;
    v3->_extendedSearchVisualConfiguration = v5;

    v7 = objc_alloc_init(SBHSearchVisualConfiguration);
    standardSearchVisualConfiguration = v3->_standardSearchVisualConfiguration;
    v3->_standardSearchVisualConfiguration = v7;

    v9 = objc_alloc_init(SBHSearchVisualConfiguration);
    compactSearchVisualConfiguration = v3->_compactSearchVisualConfiguration;
    v3->_compactSearchVisualConfiguration = v9;

    v11 = objc_alloc_init(SBHSearchVisualConfiguration);
    activeSearchVisualConfiguration = v3->_activeSearchVisualConfiguration;
    v3->_activeSearchVisualConfiguration = v11;

  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeSearchVisualConfiguration, 0);
  objc_storeStrong((id *)&self->_compactSearchVisualConfiguration, 0);
  objc_storeStrong((id *)&self->_standardSearchVisualConfiguration, 0);
  objc_storeStrong((id *)&self->_extendedSearchVisualConfiguration, 0);
}

- (BOOL)isEqual:(id)a3
{
  SBHAppLibraryVisualConfiguration *v4;
  void *v5;
  char isKindOfClass;
  SBHAppLibraryVisualConfiguration *v7;
  SBHAppLibraryVisualConfiguration *v8;
  BOOL v9;
  BOOL v10;
  BOOL v11;
  char v12;

  v4 = (SBHAppLibraryVisualConfiguration *)a3;
  if (v4 == self)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_self();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v7 = v4;
      v8 = v7;
      v9 = self->_portraitCategoryPodIconSpacing.width == v7->_portraitCategoryPodIconSpacing.width
        && self->_portraitCategoryPodIconSpacing.height == v7->_portraitCategoryPodIconSpacing.height;
      if (v9
        && (self->_landscapeCategoryPodIconSpacing.width == v7->_landscapeCategoryPodIconSpacing.width
          ? (v10 = self->_landscapeCategoryPodIconSpacing.height == v7->_landscapeCategoryPodIconSpacing.height)
          : (v10 = 0),
            v10
         && (self->_expandedCategoryPodIconSpacing.width == v7->_expandedCategoryPodIconSpacing.width
           ? (v11 = self->_expandedCategoryPodIconSpacing.height == v7->_expandedCategoryPodIconSpacing.height)
           : (v11 = 0),
             v11
          && self->_usesInsetPlatterSearchAppearance == v7->_usesInsetPlatterSearchAppearance
          && self->_searchContinuousCornerRadius == v7->_searchContinuousCornerRadius
          && BSEqualObjects()
          && BSEqualObjects()
          && BSEqualObjects())))
      {
        v12 = BSEqualObjects();
      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

- (unint64_t)hash
{
  double width;
  CGFloat v4;
  double v5;
  double v6;
  double v7;
  double v8;

  width = self->_expandedCategoryPodIconSpacing.width;
  v4 = self->_portraitCategoryPodIconSpacing.width
     + self->_portraitCategoryPodIconSpacing.height
     + self->_landscapeCategoryPodIconSpacing.width
     + self->_landscapeCategoryPodIconSpacing.height
     + width
     + self->_expandedCategoryPodIconSpacing.height;
  LOBYTE(width) = self->_usesInsetPlatterSearchAppearance;
  v5 = self->_searchContinuousCornerRadius + v4 + (double)*(unint64_t *)&width;
  v6 = v5 + (double)-[SBHSearchVisualConfiguration hash](self->_extendedSearchVisualConfiguration, "hash");
  v7 = v6 + (double)-[SBHSearchVisualConfiguration hash](self->_standardSearchVisualConfiguration, "hash");
  v8 = v7 + (double)-[SBHSearchVisualConfiguration hash](self->_compactSearchVisualConfiguration, "hash");
  return (unint64_t)(v8
                          + (double)-[SBHSearchVisualConfiguration hash](self->_activeSearchVisualConfiguration, "hash"));
}

- (NSString)description
{
  return (NSString *)-[SBHAppLibraryVisualConfiguration descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBHAppLibraryVisualConfiguration succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
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

  -[SBHAppLibraryVisualConfiguration descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;

  -[SBHAppLibraryVisualConfiguration succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHAppLibraryVisualConfiguration portraitCategoryPodIconSpacing](self, "portraitCategoryPodIconSpacing");
  v5 = (id)objc_msgSend(v4, "appendSize:withName:", CFSTR("portraitCategoryPodIconSpacing"));
  -[SBHAppLibraryVisualConfiguration landscapeCategoryPodIconSpacing](self, "landscapeCategoryPodIconSpacing");
  v6 = (id)objc_msgSend(v4, "appendSize:withName:", CFSTR("landscapeCategoryPodIconSpacing"));
  -[SBHAppLibraryVisualConfiguration expandedCategoryPodIconSpacing](self, "expandedCategoryPodIconSpacing");
  v7 = (id)objc_msgSend(v4, "appendSize:withName:", CFSTR("expandedCategoryPodIconSpacing"));
  v8 = (id)objc_msgSend(v4, "appendBool:withName:", -[SBHAppLibraryVisualConfiguration usesInsetPlatterSearchAppearance](self, "usesInsetPlatterSearchAppearance"), CFSTR("usesInsetPlatterSearchAppearance"));
  -[SBHAppLibraryVisualConfiguration searchContinuousCornerRadius](self, "searchContinuousCornerRadius");
  v9 = (id)objc_msgSend(v4, "appendFloat:withName:", CFSTR("searchContinuousCornerRadius"));
  -[SBHAppLibraryVisualConfiguration extendedSearchVisualConfiguration](self, "extendedSearchVisualConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v4, "appendObject:withName:", v10, CFSTR("extendedSearchVisualConfiguration"));

  -[SBHAppLibraryVisualConfiguration standardSearchVisualConfiguration](self, "standardSearchVisualConfiguration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v4, "appendObject:withName:", v12, CFSTR("standardSearchVisualConfiguration"));

  -[SBHAppLibraryVisualConfiguration compactSearchVisualConfiguration](self, "compactSearchVisualConfiguration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (id)objc_msgSend(v4, "appendObject:withName:", v14, CFSTR("compactSearchVisualConfiguration"));

  -[SBHAppLibraryVisualConfiguration activeSearchVisualConfiguration](self, "activeSearchVisualConfiguration");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (id)objc_msgSend(v4, "appendObject:withName:", v16, CFSTR("activeSearchVisualConfiguration"));

  return v4;
}

- (CGSize)portraitCategoryPodIconSpacing
{
  double width;
  double height;
  CGSize result;

  width = self->_portraitCategoryPodIconSpacing.width;
  height = self->_portraitCategoryPodIconSpacing.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setPortraitCategoryPodIconSpacing:(CGSize)a3
{
  self->_portraitCategoryPodIconSpacing = a3;
}

- (CGSize)landscapeCategoryPodIconSpacing
{
  double width;
  double height;
  CGSize result;

  width = self->_landscapeCategoryPodIconSpacing.width;
  height = self->_landscapeCategoryPodIconSpacing.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setLandscapeCategoryPodIconSpacing:(CGSize)a3
{
  self->_landscapeCategoryPodIconSpacing = a3;
}

- (CGSize)expandedCategoryPodIconSpacing
{
  double width;
  double height;
  CGSize result;

  width = self->_expandedCategoryPodIconSpacing.width;
  height = self->_expandedCategoryPodIconSpacing.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setExpandedCategoryPodIconSpacing:(CGSize)a3
{
  self->_expandedCategoryPodIconSpacing = a3;
}

- (BOOL)usesInsetPlatterSearchAppearance
{
  return self->_usesInsetPlatterSearchAppearance;
}

- (void)setUsesInsetPlatterSearchAppearance:(BOOL)a3
{
  self->_usesInsetPlatterSearchAppearance = a3;
}

- (double)searchContinuousCornerRadius
{
  return self->_searchContinuousCornerRadius;
}

- (void)setSearchContinuousCornerRadius:(double)a3
{
  self->_searchContinuousCornerRadius = a3;
}

- (SBHSearchVisualConfiguration)extendedSearchVisualConfiguration
{
  return self->_extendedSearchVisualConfiguration;
}

- (void)setExtendedSearchVisualConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_extendedSearchVisualConfiguration, a3);
}

- (SBHSearchVisualConfiguration)standardSearchVisualConfiguration
{
  return self->_standardSearchVisualConfiguration;
}

- (void)setStandardSearchVisualConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_standardSearchVisualConfiguration, a3);
}

- (SBHSearchVisualConfiguration)compactSearchVisualConfiguration
{
  return self->_compactSearchVisualConfiguration;
}

- (void)setCompactSearchVisualConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_compactSearchVisualConfiguration, a3);
}

- (SBHSearchVisualConfiguration)activeSearchVisualConfiguration
{
  return self->_activeSearchVisualConfiguration;
}

- (void)setActiveSearchVisualConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_activeSearchVisualConfiguration, a3);
}

@end
