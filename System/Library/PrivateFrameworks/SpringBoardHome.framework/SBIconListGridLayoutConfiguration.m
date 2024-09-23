@implementation SBIconListGridLayoutConfiguration

- (SBIconImageInfo)iconImageInfo
{
  return -[SBIconListGridLayoutConfiguration iconImageInfoForGridSizeClass:](self, "iconImageInfoForGridSizeClass:", CFSTR("SBHIconGridSizeClassDefault"));
}

- (SBIconImageInfo)iconImageInfoForGridSizeClass:(SEL)a3
{
  return -[SBHIconGridSizeClassIconImageInfoMap iconImageInfoForGridSizeClass:](self->_iconGridSizeClassIconImageInfos, "iconImageInfoForGridSizeClass:", a4);
}

- (unint64_t)numberOfPortraitColumns
{
  return self->_numberOfPortraitColumns;
}

- (unint64_t)numberOfLandscapeColumns
{
  return self->_numberOfLandscapeColumns;
}

- (id)iconLabelVisualConfigurationForContentSizeCategory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _BOOL4 v8;
  BOOL v9;
  SBHIconLabelVisualConfiguration *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;

  v4 = a3;
  v5 = v4;
  if (!self->_iconLabelVisualConfigurations)
  {
LABEL_18:
    v10 = objc_alloc_init(SBHIconLabelVisualConfiguration);
    v6 = v5;
    goto LABEL_19;
  }
  SBHContentSizeCategoryClip(v4, (void *)*MEMORY[0x1E0DC4918], (void *)*MEMORY[0x1E0DC48B8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary objectForKey:](self->_iconLabelVisualConfigurations, "objectForKey:", v6);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7 == 0;
  if (v7)
    v9 = 1;
  else
    v9 = v6 == 0;
  if (!v9)
  {
    v11 = *MEMORY[0x1E0DC4920];
    while ((objc_msgSend(v6, "isEqualToString:", v11) & 1) == 0)
    {
      SBHContentSizeCategoryOneSmallerThanSizeCategory(v6);
      v12 = objc_claimAutoreleasedReturnValue();

      -[NSMutableDictionary objectForKey:](self->_iconLabelVisualConfigurations, "objectForKey:", v12);
      v13 = objc_claimAutoreleasedReturnValue();
      v8 = v13 == 0;
      if (v13)
        v14 = 1;
      else
        v14 = v12 == 0;
      v6 = (void *)v12;
      if (v14)
      {
        v10 = (SBHIconLabelVisualConfiguration *)v13;
        v6 = (void *)v12;
        goto LABEL_15;
      }
    }
    v5 = v6;
    goto LABEL_18;
  }
  v10 = (SBHIconLabelVisualConfiguration *)v7;
LABEL_15:
  v5 = v6;
  if (v8)
    goto LABEL_18;
LABEL_19:

  return v10;
}

- (SBHIconGridSizeClassSizeMap)iconGridSizeClassSizes
{
  return self->_iconGridSizeClassSizes;
}

- (CGSize)listSizeForIconSpacingCalculation
{
  double width;
  double height;
  CGSize result;

  width = self->_listSizeForIconSpacingCalculation.width;
  height = self->_listSizeForIconSpacingCalculation.height;
  result.height = height;
  result.width = width;
  return result;
}

- (UIEdgeInsets)portraitLayoutInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_portraitLayoutInsets.top;
  left = self->_portraitLayoutInsets.left;
  bottom = self->_portraitLayoutInsets.bottom;
  right = self->_portraitLayoutInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (unint64_t)numberOfPortraitRows
{
  return self->_numberOfPortraitRows;
}

- (unint64_t)numberOfLandscapeRows
{
  return self->_numberOfLandscapeRows;
}

- (SBHRootFolderVisualConfiguration)rootFolderVisualConfiguration
{
  return self->_rootFolderVisualConfiguration;
}

- (SBHFloatyFolderVisualConfiguration)floatyFolderVisualConfiguration
{
  return self->_floatyFolderVisualConfiguration;
}

- (SBHIconAccessoryVisualConfiguration)iconAccessoryVisualConfiguration
{
  return self->_iconAccessoryVisualConfiguration;
}

- (SBHFolderIconVisualConfiguration)folderIconVisualConfiguration
{
  return self->_folderIconVisualConfiguration;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  _QWORD *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  void *v35;

  v5 = objc_alloc_init((Class)objc_opt_class());
  v6 = v5;
  if (v5)
  {
    v5[5] = self->_numberOfPortraitColumns;
    v5[6] = self->_numberOfPortraitRows;
    v5[7] = self->_numberOfLandscapeColumns;
    v5[8] = self->_numberOfLandscapeRows;
    v7 = -[SBHIconGridSizeClassSizeMap copyWithZone:](self->_iconGridSizeClassSizes, "copyWithZone:", a3);
    v8 = (void *)v6[9];
    v6[9] = v7;

    v9 = -[SBHIconGridSizeClassSet copyWithZone:](self->_supportedIconGridSizeClasses, "copyWithZone:", a3);
    v10 = (void *)v6[10];
    v6[10] = v9;

    v11 = *(_OWORD *)&self->_portraitLayoutInsets.top;
    *(_OWORD *)(v6 + 25) = *(_OWORD *)&self->_portraitLayoutInsets.bottom;
    *(_OWORD *)(v6 + 23) = v11;
    v12 = *(_OWORD *)&self->_landscapeLayoutInsets.top;
    *(_OWORD *)(v6 + 29) = *(_OWORD *)&self->_landscapeLayoutInsets.bottom;
    *(_OWORD *)(v6 + 27) = v12;
    v13 = *(_OWORD *)&self->_portraitAdditionalWidgetLayoutInsets.top;
    *(_OWORD *)(v6 + 33) = *(_OWORD *)&self->_portraitAdditionalWidgetLayoutInsets.bottom;
    *(_OWORD *)(v6 + 31) = v13;
    v14 = *(_OWORD *)&self->_landscapeAdditionalWidgetLayoutInsets.bottom;
    *(_OWORD *)(v6 + 35) = *(_OWORD *)&self->_landscapeAdditionalWidgetLayoutInsets.top;
    *(_OWORD *)(v6 + 37) = v14;
    v6[11] = self->_layoutInsetsEnforcementAxis;
    v15 = *(_OWORD *)&self->_widgetContentMargins.bottom;
    *(_OWORD *)(v6 + 39) = *(_OWORD *)&self->_widgetContentMargins.top;
    *(_OWORD *)(v6 + 41) = v15;
    *((_BYTE *)v6 + 32) = self->_showsLabels;
    v16 = -[SBHIconGridSizeClassIconImageInfoMap mutableCopyWithZone:](self->_iconGridSizeClassIconImageInfos, "mutableCopyWithZone:", a3);
    v17 = (void *)v6[2];
    v6[2] = v16;

    v18 = -[NSMutableDictionary mutableCopyWithZone:](self->_iconGridSizeClassEditingAnimationStrengths, "mutableCopyWithZone:", a3);
    v19 = (void *)v6[3];
    v6[3] = v18;

    objc_storeStrong((id *)v6 + 12, self->_rotatedLayoutClusterGridSizeClass);
    *(CGSize *)(v6 + 21) = self->_listSizeForIconSpacingCalculation;
    v6[13] = self->_iconSpacingAxisMatchingBehavior;
    v20 = -[SBHIconAccessoryVisualConfiguration copyWithZone:](self->_iconAccessoryVisualConfiguration, "copyWithZone:", a3);
    v21 = (void *)v6[14];
    v6[14] = v20;

    v22 = -[NSMutableDictionary copyWithZone:](self->_iconLabelVisualConfigurations, "copyWithZone:", a3);
    v23 = (void *)v6[1];
    v6[1] = v22;

    v24 = -[SBHFolderIconVisualConfiguration copyWithZone:](self->_folderIconVisualConfiguration, "copyWithZone:", a3);
    v25 = (void *)v6[15];
    v6[15] = v24;

    v26 = -[SBHFloatyFolderVisualConfiguration copyWithZone:](self->_floatyFolderVisualConfiguration, "copyWithZone:", a3);
    v27 = (void *)v6[16];
    v6[16] = v26;

    v28 = -[SBHSidebarVisualConfiguration copyWithZone:](self->_sidebarVisualConfiguration, "copyWithZone:", a3);
    v29 = (void *)v6[18];
    v6[18] = v28;

    v30 = -[SBHRootFolderVisualConfiguration copyWithZone:](self->_rootFolderVisualConfiguration, "copyWithZone:", a3);
    v31 = (void *)v6[19];
    v6[19] = v30;

    v32 = -[SBHAppLibraryVisualConfiguration copyWithZone:](self->_appLibraryVisualConfiguration, "copyWithZone:", a3);
    v33 = (void *)v6[17];
    v6[17] = v32;

    v34 = -[SBHFloatingDockVisualConfiguration copyWithZone:](self->_floatingDockVisualConfiguration, "copyWithZone:", a3);
    v35 = (void *)v6[20];
    v6[20] = v34;

  }
  return v6;
}

- (SBIconListGridLayoutConfiguration)init
{
  char *v2;
  SBIconListGridLayoutConfiguration *v3;
  SBHIconGridSizeClassSizeMap *v4;
  SBHIconGridSizeClassSizeMap *iconGridSizeClassSizes;
  uint64_t v6;
  SBHIconGridSizeClassSet *supportedIconGridSizeClasses;
  SBHIconAccessoryVisualConfiguration *v8;
  SBHIconAccessoryVisualConfiguration *iconAccessoryVisualConfiguration;
  SBHFolderIconVisualConfiguration *v10;
  SBHFolderIconVisualConfiguration *folderIconVisualConfiguration;
  SBHFloatyFolderVisualConfiguration *v12;
  SBHFloatyFolderVisualConfiguration *floatyFolderVisualConfiguration;
  SBHSidebarVisualConfiguration *v14;
  SBHSidebarVisualConfiguration *sidebarVisualConfiguration;
  SBHRootFolderVisualConfiguration *v16;
  SBHRootFolderVisualConfiguration *rootFolderVisualConfiguration;
  SBHAppLibraryVisualConfiguration *v18;
  SBHAppLibraryVisualConfiguration *appLibraryVisualConfiguration;
  SBHFloatingDockVisualConfiguration *v20;
  SBHFloatingDockVisualConfiguration *floatingDockVisualConfiguration;
  NSMutableDictionary *v22;
  NSMutableDictionary *iconGridSizeClassEditingAnimationStrengths;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)SBIconListGridLayoutConfiguration;
  v2 = -[SBIconListGridLayoutConfiguration init](&v25, sel_init);
  v3 = (SBIconListGridLayoutConfiguration *)v2;
  if (v2)
  {
    *(int64x2_t *)(v2 + 40) = vdupq_n_s64(3uLL);
    v4 = objc_alloc_init(SBHIconGridSizeClassSizeMap);
    iconGridSizeClassSizes = v3->_iconGridSizeClassSizes;
    v3->_iconGridSizeClassSizes = v4;

    +[SBHIconGridSizeClassSet gridSizeClassSetForDefaultGridSizeClass](SBHIconGridSizeClassSet, "gridSizeClassSetForDefaultGridSizeClass");
    v6 = objc_claimAutoreleasedReturnValue();
    supportedIconGridSizeClasses = v3->_supportedIconGridSizeClasses;
    v3->_supportedIconGridSizeClasses = (SBHIconGridSizeClassSet *)v6;

    objc_storeStrong((id *)&v3->_rotatedLayoutClusterGridSizeClass, CFSTR("SBHIconGridSizeClassDefault"));
    v3->_showsLabels = 1;
    v8 = objc_alloc_init(SBHIconAccessoryVisualConfiguration);
    iconAccessoryVisualConfiguration = v3->_iconAccessoryVisualConfiguration;
    v3->_iconAccessoryVisualConfiguration = v8;

    v10 = objc_alloc_init(SBHFolderIconVisualConfiguration);
    folderIconVisualConfiguration = v3->_folderIconVisualConfiguration;
    v3->_folderIconVisualConfiguration = v10;

    v12 = objc_alloc_init(SBHFloatyFolderVisualConfiguration);
    floatyFolderVisualConfiguration = v3->_floatyFolderVisualConfiguration;
    v3->_floatyFolderVisualConfiguration = v12;

    v14 = objc_alloc_init(SBHSidebarVisualConfiguration);
    sidebarVisualConfiguration = v3->_sidebarVisualConfiguration;
    v3->_sidebarVisualConfiguration = v14;

    v16 = objc_alloc_init(SBHRootFolderVisualConfiguration);
    rootFolderVisualConfiguration = v3->_rootFolderVisualConfiguration;
    v3->_rootFolderVisualConfiguration = v16;

    v18 = objc_alloc_init(SBHAppLibraryVisualConfiguration);
    appLibraryVisualConfiguration = v3->_appLibraryVisualConfiguration;
    v3->_appLibraryVisualConfiguration = v18;

    v20 = objc_alloc_init(SBHFloatingDockVisualConfiguration);
    floatingDockVisualConfiguration = v3->_floatingDockVisualConfiguration;
    v3->_floatingDockVisualConfiguration = v20;

    v22 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    iconGridSizeClassEditingAnimationStrengths = v3->_iconGridSizeClassEditingAnimationStrengths;
    v3->_iconGridSizeClassEditingAnimationStrengths = v22;

  }
  return v3;
}

- (void)setIconImageInfo:(SBIconImageInfo *)a3 forGridSizeClass:(id)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  SBIconImageInfo *v13;
  SBHMutableIconGridSizeClassIconImageInfoMap *iconGridSizeClassIconImageInfos;
  SBHMutableIconGridSizeClassIconImageInfoMap *v15;
  SBHMutableIconGridSizeClassIconImageInfoMap *v16;
  SBIconImageInfo *v17;

  v8 = v7;
  v9 = v6;
  v10 = v5;
  v11 = v4;
  v13 = a3;
  iconGridSizeClassIconImageInfos = self->_iconGridSizeClassIconImageInfos;
  v17 = v13;
  if (!iconGridSizeClassIconImageInfos)
  {
    v15 = objc_alloc_init(SBHMutableIconGridSizeClassIconImageInfoMap);
    v16 = self->_iconGridSizeClassIconImageInfos;
    self->_iconGridSizeClassIconImageInfos = v15;

    v13 = v17;
    iconGridSizeClassIconImageInfos = self->_iconGridSizeClassIconImageInfos;
  }
  -[SBHMutableIconGridSizeClassIconImageInfoMap setIconImageInfo:forGridSizeClass:](iconGridSizeClassIconImageInfos, "setIconImageInfo:forGridSizeClass:", v13, v11, v10, v9, v8);

}

- (void)setEditingAnimationStrength:(double)a3 forGridSizeClass:(id)a4
{
  NSMutableDictionary *iconGridSizeClassEditingAnimationStrengths;
  void *v6;
  id v7;
  id v8;

  iconGridSizeClassEditingAnimationStrengths = self->_iconGridSizeClassEditingAnimationStrengths;
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  objc_msgSend(v6, "numberWithDouble:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](iconGridSizeClassEditingAnimationStrengths, "setObject:forKey:", v8, v7);

}

- (SBHSidebarVisualConfiguration)sidebarVisualConfiguration
{
  return self->_sidebarVisualConfiguration;
}

- (void)setWidgetContentMargins:(UIEdgeInsets)a3
{
  self->_widgetContentMargins = a3;
}

- (void)setSupportedIconGridSizeClasses:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void)setRotatedLayoutClusterGridSizeClass:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void)setPortraitLayoutInsets:(UIEdgeInsets)a3
{
  self->_portraitLayoutInsets = a3;
}

- (void)setNumberOfPortraitRows:(unint64_t)a3
{
  self->_numberOfPortraitRows = a3;
}

- (void)setNumberOfPortraitColumns:(unint64_t)a3
{
  self->_numberOfPortraitColumns = a3;
}

- (void)setListSizeForIconSpacingCalculation:(CGSize)a3
{
  self->_listSizeForIconSpacingCalculation = a3;
}

- (void)setLandscapeLayoutInsets:(UIEdgeInsets)a3
{
  self->_landscapeLayoutInsets = a3;
}

- (void)setIconGridSizeClassSizes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (SBHFloatingDockVisualConfiguration)floatingDockVisualConfiguration
{
  return self->_floatingDockVisualConfiguration;
}

- (void)setIconLabelVisualConfiguration:(id)a3 forContentSizeCategory:(id)a4
{
  void *v6;
  NSMutableDictionary *iconLabelVisualConfigurations;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  void *v10;
  id v11;

  v11 = a3;
  SBHContentSizeCategoryClip(a4, (void *)*MEMORY[0x1E0DC4918], (void *)*MEMORY[0x1E0DC48B8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  iconLabelVisualConfigurations = self->_iconLabelVisualConfigurations;
  if (!iconLabelVisualConfigurations)
  {
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v9 = self->_iconLabelVisualConfigurations;
    self->_iconLabelVisualConfigurations = v8;

    iconLabelVisualConfigurations = self->_iconLabelVisualConfigurations;
  }
  v10 = (void *)objc_msgSend(v11, "copy");
  -[NSMutableDictionary setObject:forKey:](iconLabelVisualConfigurations, "setObject:forKey:", v10, v6);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_floatingDockVisualConfiguration, 0);
  objc_storeStrong((id *)&self->_rootFolderVisualConfiguration, 0);
  objc_storeStrong((id *)&self->_sidebarVisualConfiguration, 0);
  objc_storeStrong((id *)&self->_appLibraryVisualConfiguration, 0);
  objc_storeStrong((id *)&self->_floatyFolderVisualConfiguration, 0);
  objc_storeStrong((id *)&self->_folderIconVisualConfiguration, 0);
  objc_storeStrong((id *)&self->_iconAccessoryVisualConfiguration, 0);
  objc_storeStrong((id *)&self->_rotatedLayoutClusterGridSizeClass, 0);
  objc_storeStrong((id *)&self->_supportedIconGridSizeClasses, 0);
  objc_storeStrong((id *)&self->_iconGridSizeClassSizes, 0);
  objc_storeStrong((id *)&self->_iconGridSizeClassEditingAnimationStrengths, 0);
  objc_storeStrong((id *)&self->_iconGridSizeClassIconImageInfos, 0);
  objc_storeStrong((id *)&self->_iconLabelVisualConfigurations, 0);
}

- (void)setIconImageInfo:(SBIconImageInfo *)a3
{
  -[SBIconListGridLayoutConfiguration setIconImageInfo:forGridSizeClass:](self, "setIconImageInfo:forGridSizeClass:", CFSTR("SBHIconGridSizeClassDefault"));
}

- (double)editingAnimationStrengthForGridSizeClass:(id)a3
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  -[NSMutableDictionary objectForKey:](self->_iconGridSizeClassEditingAnimationStrengths, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "doubleValue");
    v6 = v5;
  }
  else
  {
    v6 = 1.0;
  }

  return v6;
}

- (void)setEditingAnimationStrengths:(id)a3
{
  NSMutableDictionary *v4;
  NSMutableDictionary *iconGridSizeClassEditingAnimationStrengths;

  v4 = (NSMutableDictionary *)objc_msgSend(a3, "mutableCopy");
  iconGridSizeClassEditingAnimationStrengths = self->_iconGridSizeClassEditingAnimationStrengths;
  self->_iconGridSizeClassEditingAnimationStrengths = v4;

}

- (BOOL)isEqual:(id)a3
{
  SBIconListGridLayoutConfiguration *v4;
  void *v5;
  char isKindOfClass;
  SBIconListGridLayoutConfiguration *v7;
  SBIconListGridLayoutConfiguration *v8;
  NSString *rotatedLayoutClusterGridSizeClass;
  char v10;

  v4 = (SBIconListGridLayoutConfiguration *)a3;
  if (v4 == self)
  {
    v10 = 1;
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
      if (self->_numberOfPortraitColumns != v7->_numberOfPortraitColumns)
        goto LABEL_32;
      if (self->_numberOfPortraitRows != v7->_numberOfPortraitRows)
        goto LABEL_32;
      if (self->_numberOfLandscapeColumns != v7->_numberOfLandscapeColumns)
        goto LABEL_32;
      if (self->_numberOfLandscapeRows != v7->_numberOfLandscapeRows)
        goto LABEL_32;
      if (!BSEqualObjects())
        goto LABEL_32;
      if (!BSEqualObjects())
        goto LABEL_32;
      if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)&self->_portraitLayoutInsets.top, *(float64x2_t *)&v8->_portraitLayoutInsets.top), (int32x4_t)vceqq_f64(*(float64x2_t *)&self->_portraitLayoutInsets.bottom, *(float64x2_t *)&v8->_portraitLayoutInsets.bottom))), 0xFuLL))) & 1) == 0)goto LABEL_32;
      if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)&self->_landscapeLayoutInsets.top, *(float64x2_t *)&v8->_landscapeLayoutInsets.top), (int32x4_t)vceqq_f64(*(float64x2_t *)&self->_landscapeLayoutInsets.bottom, *(float64x2_t *)&v8->_landscapeLayoutInsets.bottom))), 0xFuLL))) & 1) == 0)goto LABEL_32;
      if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)&self->_portraitAdditionalWidgetLayoutInsets.top, *(float64x2_t *)&v8->_portraitAdditionalWidgetLayoutInsets.top), (int32x4_t)vceqq_f64(*(float64x2_t *)&self->_portraitAdditionalWidgetLayoutInsets.bottom, *(float64x2_t *)&v8->_portraitAdditionalWidgetLayoutInsets.bottom))), 0xFuLL))) & 1) == 0)goto LABEL_32;
      if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)&self->_landscapeAdditionalWidgetLayoutInsets.top, *(float64x2_t *)&v8->_landscapeAdditionalWidgetLayoutInsets.top), (int32x4_t)vceqq_f64(*(float64x2_t *)&self->_landscapeAdditionalWidgetLayoutInsets.bottom, *(float64x2_t *)&v8->_landscapeAdditionalWidgetLayoutInsets.bottom))), 0xFuLL))) & 1) == 0)goto LABEL_32;
      if (self->_layoutInsetsEnforcementAxis != v8->_layoutInsetsEnforcementAxis)
        goto LABEL_32;
      if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)&self->_widgetContentMargins.top, *(float64x2_t *)&v8->_widgetContentMargins.top), (int32x4_t)vceqq_f64(*(float64x2_t *)&self->_widgetContentMargins.bottom, *(float64x2_t *)&v8->_widgetContentMargins.bottom))), 0xFuLL))) & 1) == 0)goto LABEL_32;
      if (!BSEqualObjects())
        goto LABEL_32;
      if (!BSEqualDictionaries())
        goto LABEL_32;
      rotatedLayoutClusterGridSizeClass = self->_rotatedLayoutClusterGridSizeClass;
      if (rotatedLayoutClusterGridSizeClass != v8->_rotatedLayoutClusterGridSizeClass
        && !-[NSString isEqualToString:](rotatedLayoutClusterGridSizeClass, "isEqualToString:"))
      {
        goto LABEL_32;
      }
      v10 = 0;
      if (self->_listSizeForIconSpacingCalculation.width != v8->_listSizeForIconSpacingCalculation.width
        || self->_listSizeForIconSpacingCalculation.height != v8->_listSizeForIconSpacingCalculation.height)
      {
        goto LABEL_33;
      }
      if (self->_showsLabels == v8->_showsLabels
        && BSEqualObjects()
        && BSEqualObjects()
        && BSEqualObjects()
        && BSEqualObjects()
        && BSEqualObjects()
        && BSEqualObjects()
        && BSEqualObjects())
      {
        v10 = BSEqualObjects();
      }
      else
      {
LABEL_32:
        v10 = 0;
      }
LABEL_33:

      goto LABEL_34;
    }
    v10 = 0;
  }
LABEL_34:

  return v10;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  unint64_t v8;
  double width;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;

  v3 = self->_numberOfPortraitRows
     + self->_numberOfPortraitColumns
     + self->_numberOfLandscapeColumns
     + self->_numberOfLandscapeRows;
  v4 = -[SBHIconGridSizeClassSizeMap hash](self->_iconGridSizeClassSizes, "hash");
  v5 = self->_widgetContentMargins.left
     + self->_widgetContentMargins.bottom
     + self->_widgetContentMargins.right
     + self->_widgetContentMargins.top
     + self->_landscapeAdditionalWidgetLayoutInsets.left
     + self->_landscapeAdditionalWidgetLayoutInsets.bottom
     + self->_landscapeAdditionalWidgetLayoutInsets.right
     + self->_landscapeAdditionalWidgetLayoutInsets.top
     + self->_portraitAdditionalWidgetLayoutInsets.left
     + self->_portraitAdditionalWidgetLayoutInsets.bottom
     + self->_portraitAdditionalWidgetLayoutInsets.right
     + self->_portraitAdditionalWidgetLayoutInsets.top
     + self->_landscapeLayoutInsets.left
     + self->_landscapeLayoutInsets.bottom
     + self->_landscapeLayoutInsets.right
     + self->_landscapeLayoutInsets.top
     + self->_portraitLayoutInsets.left
     + self->_portraitLayoutInsets.bottom
     + self->_portraitLayoutInsets.right
     + self->_portraitLayoutInsets.top
     + (double)(v3 + v4 + -[SBHIconGridSizeClassSet hash](self->_supportedIconGridSizeClasses, "hash"))
     + (double)self->_layoutInsetsEnforcementAxis;
  v6 = v5 + (double)-[SBHIconGridSizeClassIconImageInfoMap hash](self->_iconGridSizeClassIconImageInfos, "hash");
  v7 = v6
     + (double)(unint64_t)-[NSMutableDictionary hash](self->_iconGridSizeClassEditingAnimationStrengths, "hash");
  v8 = -[NSString hash](self->_rotatedLayoutClusterGridSizeClass, "hash");
  width = self->_listSizeForIconSpacingCalculation.width;
  v10 = self->_listSizeForIconSpacingCalculation.height + width + v7 + (double)v8;
  LOBYTE(width) = self->_showsLabels;
  v11 = v10
      + (double)*(unint64_t *)&width
      + (double)-[SBHIconAccessoryVisualConfiguration hash](self->_iconAccessoryVisualConfiguration, "hash");
  v12 = v11 + (double)(unint64_t)-[NSMutableDictionary hash](self->_iconLabelVisualConfigurations, "hash");
  v13 = v12 + (double)-[SBHFolderIconVisualConfiguration hash](self->_folderIconVisualConfiguration, "hash");
  v14 = v13 + (double)-[SBHFloatyFolderVisualConfiguration hash](self->_floatyFolderVisualConfiguration, "hash");
  v15 = v14 + (double)-[SBHSidebarVisualConfiguration hash](self->_sidebarVisualConfiguration, "hash");
  v16 = v15 + (double)-[SBHRootFolderVisualConfiguration hash](self->_rootFolderVisualConfiguration, "hash");
  v17 = v16 + (double)-[SBHAppLibraryVisualConfiguration hash](self->_appLibraryVisualConfiguration, "hash");
  return (unint64_t)(v17
                          + (double)-[SBHFloatingDockVisualConfiguration hash](self->_floatingDockVisualConfiguration, "hash"));
}

- (NSString)description
{
  return (NSString *)-[SBIconListGridLayoutConfiguration descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBIconListGridLayoutConfiguration succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
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

  -[SBIconListGridLayoutConfiguration descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
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
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  id v23;
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
  id v35;
  id v36;
  id v37;
  _QWORD v39[4];
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;

  -[SBIconListGridLayoutConfiguration succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "appendUnsignedInteger:withName:", self->_numberOfPortraitColumns, CFSTR("numberOfPortraitColumns"));
  v6 = (id)objc_msgSend(v4, "appendUnsignedInteger:withName:", self->_numberOfPortraitRows, CFSTR("numberOfPortraitRows"));
  v7 = (id)objc_msgSend(v4, "appendUnsignedInteger:withName:", self->_numberOfLandscapeColumns, CFSTR("numberOfLandscapeColumns"));
  v8 = (id)objc_msgSend(v4, "appendUnsignedInteger:withName:", self->_numberOfLandscapeRows, CFSTR("numberOfLandscapeRows"));
  NSStringFromUIEdgeInsets(self->_portraitLayoutInsets);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", v9, CFSTR("portraitLayoutInsets"));

  NSStringFromUIEdgeInsets(self->_landscapeLayoutInsets);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", v10, CFSTR("landscapeLayoutInsets"));

  NSStringFromUIEdgeInsets(self->_widgetContentMargins);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", v11, CFSTR("widgetContentMargins"));

  NSStringFromUIEdgeInsets(self->_portraitAdditionalWidgetLayoutInsets);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", v12, CFSTR("portraitAdditionalWidgetLayoutInsets"));

  NSStringFromUIEdgeInsets(self->_landscapeAdditionalWidgetLayoutInsets);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", v13, CFSTR("landscapeAdditionalWidgetLayoutInsets"));

  -[SBIconListGridLayoutConfiguration iconImageInfo](self, "iconImageInfo");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __75__SBIconListGridLayoutConfiguration_descriptionBuilderWithMultilinePrefix___block_invoke;
  v39[3] = &unk_1E8D84E58;
  v22 = v4;
  v40 = v22;
  v41 = v15;
  v42 = v17;
  v43 = v19;
  v44 = v21;
  objc_msgSend(v22, "appendBodySectionWithName:multilinePrefix:block:", CFSTR("iconImageInfo"), 0, v39);
  v23 = (id)objc_msgSend(v22, "appendObject:withName:", self->_iconGridSizeClassSizes, CFSTR("iconGridSizeClassSizes"));
  v24 = (id)objc_msgSend(v22, "appendObject:withName:", self->_supportedIconGridSizeClasses, CFSTR("supportedIconGridSizeClasses"));
  SBHStringForIconGridSizeClass(self->_rotatedLayoutClusterGridSizeClass);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "appendString:withName:", v25, CFSTR("rotatedLayoutClusterGridSizeClass"));

  v26 = (id)objc_msgSend(v22, "appendSize:withName:", CFSTR("listSizeForIconSpacingCalculation"), self->_listSizeForIconSpacingCalculation.width, self->_listSizeForIconSpacingCalculation.height);
  v27 = (id)objc_msgSend(v22, "appendObject:withName:", self->_iconGridSizeClassIconImageInfos, CFSTR("iconGridSizeClassIconImageInfos"));
  SBHStringForIconListIconSpacingAxisMatchingBehavior(self->_iconSpacingAxisMatchingBehavior);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "appendString:withName:", v28, CFSTR("iconSpacingAxisMatchingBehavior"));

  v29 = (id)objc_msgSend(v22, "appendBool:withName:", self->_showsLabels, CFSTR("showsLabels"));
  v30 = (id)objc_msgSend(v22, "appendObject:withName:", self->_iconAccessoryVisualConfiguration, CFSTR("iconAccessoryConfiguration"));
  v31 = (id)objc_msgSend(v22, "appendObject:withName:", self->_iconLabelVisualConfigurations, CFSTR("iconLabelVisualConfigurations"));
  v32 = (id)objc_msgSend(v22, "appendObject:withName:", self->_folderIconVisualConfiguration, CFSTR("folderIconVisualConfiguration"));
  v33 = (id)objc_msgSend(v22, "appendObject:withName:", self->_floatyFolderVisualConfiguration, CFSTR("floatyFolderVisualConfiguration"));
  v34 = (id)objc_msgSend(v22, "appendObject:withName:", self->_sidebarVisualConfiguration, CFSTR("sidebarVisualConfiguration"));
  v35 = (id)objc_msgSend(v22, "appendObject:withName:", self->_rootFolderVisualConfiguration, CFSTR("rootFolderVisualConfiguration"));
  v36 = (id)objc_msgSend(v22, "appendObject:withName:", self->_appLibraryVisualConfiguration, CFSTR("appLibraryVisualConfiguration"));
  v37 = (id)objc_msgSend(v22, "appendObject:withName:", self->_floatingDockVisualConfiguration, CFSTR("floatingDockVisualConfiguration"));

  return v22;
}

id __75__SBIconListGridLayoutConfiguration_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2;
  id v3;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendSize:withName:", CFSTR("size"), *(double *)(a1 + 40), *(double *)(a1 + 48));
  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "appendFloat:withName:", CFSTR("scale"), *(double *)(a1 + 56));
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendFloat:withName:", CFSTR("continuousCornerRadius"), *(double *)(a1 + 64));
}

- (void)setNumberOfLandscapeColumns:(unint64_t)a3
{
  self->_numberOfLandscapeColumns = a3;
}

- (void)setNumberOfLandscapeRows:(unint64_t)a3
{
  self->_numberOfLandscapeRows = a3;
}

- (SBHIconGridSizeClassSet)supportedIconGridSizeClasses
{
  return self->_supportedIconGridSizeClasses;
}

- (UIEdgeInsets)landscapeLayoutInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_landscapeLayoutInsets.top;
  left = self->_landscapeLayoutInsets.left;
  bottom = self->_landscapeLayoutInsets.bottom;
  right = self->_landscapeLayoutInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (UIEdgeInsets)portraitAdditionalWidgetLayoutInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_portraitAdditionalWidgetLayoutInsets.top;
  left = self->_portraitAdditionalWidgetLayoutInsets.left;
  bottom = self->_portraitAdditionalWidgetLayoutInsets.bottom;
  right = self->_portraitAdditionalWidgetLayoutInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setPortraitAdditionalWidgetLayoutInsets:(UIEdgeInsets)a3
{
  self->_portraitAdditionalWidgetLayoutInsets = a3;
}

- (UIEdgeInsets)landscapeAdditionalWidgetLayoutInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_landscapeAdditionalWidgetLayoutInsets.top;
  left = self->_landscapeAdditionalWidgetLayoutInsets.left;
  bottom = self->_landscapeAdditionalWidgetLayoutInsets.bottom;
  right = self->_landscapeAdditionalWidgetLayoutInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setLandscapeAdditionalWidgetLayoutInsets:(UIEdgeInsets)a3
{
  self->_landscapeAdditionalWidgetLayoutInsets = a3;
}

- (unint64_t)layoutInsetsEnforcementAxis
{
  return self->_layoutInsetsEnforcementAxis;
}

- (void)setLayoutInsetsEnforcementAxis:(unint64_t)a3
{
  self->_layoutInsetsEnforcementAxis = a3;
}

- (UIEdgeInsets)widgetContentMargins
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_widgetContentMargins.top;
  left = self->_widgetContentMargins.left;
  bottom = self->_widgetContentMargins.bottom;
  right = self->_widgetContentMargins.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (NSString)rotatedLayoutClusterGridSizeClass
{
  return self->_rotatedLayoutClusterGridSizeClass;
}

- (int64_t)iconSpacingAxisMatchingBehavior
{
  return self->_iconSpacingAxisMatchingBehavior;
}

- (void)setIconSpacingAxisMatchingBehavior:(int64_t)a3
{
  self->_iconSpacingAxisMatchingBehavior = a3;
}

- (void)setIconAccessoryVisualConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (BOOL)showsLabels
{
  return self->_showsLabels;
}

- (void)setShowsLabels:(BOOL)a3
{
  self->_showsLabels = a3;
}

- (void)setFolderIconVisualConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (void)setFloatyFolderVisualConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (SBHAppLibraryVisualConfiguration)appLibraryVisualConfiguration
{
  return self->_appLibraryVisualConfiguration;
}

- (void)setAppLibraryVisualConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (void)setSidebarVisualConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

@end
