@implementation SBHRootFolderVisualConfiguration

- (double)scrollAccessoryVerticalOffsetAdjustmentForAuxiliaryView
{
  return self->_scrollAccessoryVerticalOffsetAdjustmentForAuxiliaryView;
}

- (double)pageControlVerticalOffset
{
  return self->_pageControlVerticalOffset;
}

- (double)dockBackgroundViewCornerRadius
{
  return self->_dockBackgroundViewCornerRadius;
}

- (double)dockViewHeight
{
  return self->_dockViewHeight;
}

- (CGSize)pageControlFrameInset
{
  double width;
  double height;
  CGSize result;

  width = self->_pageControlFrameInset.width;
  height = self->_pageControlFrameInset.height;
  result.height = height;
  result.width = width;
  return result;
}

- (UIOffset)editModeButtonLayoutOffset
{
  double horizontal;
  double vertical;
  UIOffset result;

  horizontal = self->_editModeButtonLayoutOffset.horizontal;
  vertical = self->_editModeButtonLayoutOffset.vertical;
  result.vertical = vertical;
  result.horizontal = horizontal;
  return result;
}

- (NSDirectionalEdgeInsets)editModeButtonContentEdgeInsets
{
  double top;
  double leading;
  double bottom;
  double trailing;
  NSDirectionalEdgeInsets result;

  top = self->_editModeButtonContentEdgeInsets.top;
  leading = self->_editModeButtonContentEdgeInsets.leading;
  bottom = self->_editModeButtonContentEdgeInsets.bottom;
  trailing = self->_editModeButtonContentEdgeInsets.trailing;
  result.trailing = trailing;
  result.bottom = bottom;
  result.leading = leading;
  result.top = top;
  return result;
}

- (double)editingEntryAreaHorizontalInset
{
  return self->_editingEntryAreaHorizontalInset;
}

- (void)setPageManagementLayoutMetrics:(SBRootFolderViewPageManagementLayoutMetrics *)a3 forLayoutConfiguration:(int64_t)a4
{
  objc_class *v4;
  objc_class *v5;
  objc_class *v6;
  objc_class *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if ((unint64_t)a3 <= 5)
  {
    v8 = qword_1D0195B20[(_QWORD)a3];
    v9 = qword_1D0195B50[(_QWORD)a3];
    v10 = qword_1D0195B80[(_QWORD)a3];
    *(Class *)((char *)&self->super.isa + qword_1D0195AF0[(_QWORD)a3]) = v4;
    *(Class *)((char *)&self->super.isa + v8) = v5;
    *(Class *)((char *)&self->super.isa + v9) = v6;
    *(Class *)((char *)&self->super.isa + v10) = v7;
  }
}

- (void)setScrollAccessoryVerticalOffsetAdjustmentForAuxiliaryView:(double)a3
{
  self->_scrollAccessoryVerticalOffsetAdjustmentForAuxiliaryView = a3;
}

- (void)setPageManagementPageCheckboxVerticalMargin:(double)a3
{
  self->_pageManagementPageCheckboxVerticalMargin = a3;
}

- (void)setPageManagementPageCheckboxDiameter:(double)a3
{
  self->_pageManagementPageCheckboxDiameter = a3;
}

- (void)setPageManagementFocusModeOptionsButtonSize:(CGSize)a3
{
  self->_pageManagementFocusModeOptionsButtonSize = a3;
}

- (void)setPageControlVerticalOffset:(double)a3
{
  self->_pageControlVerticalOffset = a3;
}

- (void)setPageControlFrameInset:(CGSize)a3
{
  self->_pageControlFrameInset = a3;
}

- (void)setPageControlCustomPadding:(CGSize)a3
{
  self->_pageControlCustomPadding = a3;
}

- (void)setIdleTextVerticalOffset:(double)a3
{
  self->_idleTextVerticalOffset = a3;
}

- (void)setEditingEntryAreaHorizontalInset:(double)a3
{
  self->_editingEntryAreaHorizontalInset = a3;
}

- (void)setEditModeButtonSize:(CGSize)a3
{
  self->_editModeButtonSize = a3;
}

- (void)setEditModeButtonLayoutOffset:(UIOffset)a3
{
  self->_editModeButtonLayoutOffset = a3;
}

- (void)setEditModeButtonContentEdgeInsets:(NSDirectionalEdgeInsets)a3
{
  self->_editModeButtonContentEdgeInsets = a3;
}

- (void)setDockViewHeight:(double)a3
{
  self->_dockViewHeight = a3;
}

- (void)setDockListViewInsets:(UIEdgeInsets)a3
{
  self->_dockListViewInsets = a3;
}

- (void)setDockBackgroundViewInsets:(UIEdgeInsets)a3
{
  self->_dockBackgroundViewInsets = a3;
}

- (void)setDockBackgroundViewCornerRadius:(double)a3
{
  self->_dockBackgroundViewCornerRadius = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  CGSize cellSpacing;
  CGSize v6;
  CGSize v7;
  CGSize v8;
  CGSize v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;

  result = objc_alloc_init((Class)objc_opt_class());
  if (result)
  {
    *((_QWORD *)result + 21) = *(_QWORD *)&self->_idleTextVerticalOffset;
    *((_QWORD *)result + 22) = *(_QWORD *)&self->_pageControlVerticalOffset;
    *(CGSize *)((char *)result + 232) = self->_pageControlFrameInset;
    *(CGSize *)((char *)result + 248) = self->_pageControlCustomPadding;
    *((_QWORD *)result + 23) = *(_QWORD *)&self->_scrollAccessoryVerticalOffsetAdjustmentForAuxiliaryView;
    *((_QWORD *)result + 24) = *(_QWORD *)&self->_pageManagementPageCheckboxVerticalMargin;
    *((_QWORD *)result + 25) = *(_QWORD *)&self->_pageManagementPageCheckboxDiameter;
    *(CGSize *)((char *)result + 264) = self->_pageManagementFocusModeOptionsButtonSize;
    cellSpacing = self->_pageManagement1x1LayoutMetrics.cellSpacing;
    *(_OWORD *)((char *)result + 24) = *(_OWORD *)&self->_pageManagement1x1LayoutMetrics.bottomMargin;
    *(CGSize *)((char *)result + 8) = cellSpacing;
    v6 = self->_pageManagement2x1LayoutMetrics.cellSpacing;
    *(_OWORD *)((char *)result + 56) = *(_OWORD *)&self->_pageManagement2x1LayoutMetrics.bottomMargin;
    *(CGSize *)((char *)result + 40) = v6;
    v7 = self->_pageManagement2x2LayoutMetrics.cellSpacing;
    *(_OWORD *)((char *)result + 88) = *(_OWORD *)&self->_pageManagement2x2LayoutMetrics.bottomMargin;
    *(CGSize *)((char *)result + 72) = v7;
    v8 = self->_pageManagement3x2LayoutMetrics.cellSpacing;
    *(_OWORD *)((char *)result + 120) = *(_OWORD *)&self->_pageManagement3x2LayoutMetrics.bottomMargin;
    *(CGSize *)((char *)result + 104) = v8;
    v9 = self->_pageManagement3x3LayoutMetrics.cellSpacing;
    *(_OWORD *)((char *)result + 152) = *(_OWORD *)&self->_pageManagement3x3LayoutMetrics.bottomMargin;
    *(CGSize *)((char *)result + 136) = v9;
    *((_QWORD *)result + 26) = *(_QWORD *)&self->_dockViewHeight;
    *((_QWORD *)result + 27) = *(_QWORD *)&self->_dockBackgroundViewCornerRadius;
    v10 = *(_OWORD *)&self->_dockBackgroundViewInsets.bottom;
    *(_OWORD *)((char *)result + 312) = *(_OWORD *)&self->_dockBackgroundViewInsets.top;
    *(_OWORD *)((char *)result + 328) = v10;
    v11 = *(_OWORD *)&self->_dockListViewInsets.bottom;
    *(_OWORD *)((char *)result + 344) = *(_OWORD *)&self->_dockListViewInsets.top;
    *(_OWORD *)((char *)result + 360) = v11;
    v12 = *(_OWORD *)&self->_editModeButtonContentEdgeInsets.bottom;
    *(_OWORD *)((char *)result + 376) = *(_OWORD *)&self->_editModeButtonContentEdgeInsets.top;
    *(_OWORD *)((char *)result + 392) = v12;
    *(UIOffset *)((char *)result + 280) = self->_editModeButtonLayoutOffset;
    *(CGSize *)((char *)result + 296) = self->_editModeButtonSize;
    *((_QWORD *)result + 28) = *(_QWORD *)&self->_editingEntryAreaHorizontalInset;
  }
  return result;
}

- (SBHRootFolderVisualConfiguration)init
{
  SBHRootFolderVisualConfiguration *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBHRootFolderVisualConfiguration;
  result = -[SBHRootFolderVisualConfiguration init](&v3, sel_init);
  if (result)
    result->_idleTextVerticalOffset = 23.0;
  return result;
}

- (SBRootFolderViewPageManagementLayoutMetrics)pageManagementLayoutMetricsForLayoutConfiguration:(SEL)a3
{
  return self;
}

- (BOOL)isEqual:(id)a3
{
  SBHRootFolderVisualConfiguration *v4;
  void *v5;
  char isKindOfClass;
  SBHRootFolderVisualConfiguration *v7;
  BOOL v9;
  BOOL v10;

  v4 = (SBHRootFolderVisualConfiguration *)a3;
  if (v4 == self)
  {
    v10 = 1;
    goto LABEL_22;
  }
  objc_opt_self();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v10 = 0;
    goto LABEL_22;
  }
  v7 = v4;
  if (self->_idleTextVerticalOffset == v7->_idleTextVerticalOffset
    && self->_pageControlVerticalOffset == v7->_pageControlVerticalOffset
    && self->_pageControlFrameInset.width == v7->_pageControlFrameInset.width
    && self->_pageControlFrameInset.height == v7->_pageControlFrameInset.height)
  {
    v9 = self->_pageControlCustomPadding.width == v7->_pageControlCustomPadding.width
      && self->_pageControlCustomPadding.height == v7->_pageControlCustomPadding.height;
    if (v9
      && self->_scrollAccessoryVerticalOffsetAdjustmentForAuxiliaryView == v7->_scrollAccessoryVerticalOffsetAdjustmentForAuxiliaryView
      && self->_pageManagementPageCheckboxVerticalMargin == v7->_pageManagementPageCheckboxVerticalMargin
      && self->_pageManagementPageCheckboxDiameter == v7->_pageManagementPageCheckboxDiameter)
    {
      v10 = 0;
      if (self->_pageManagementFocusModeOptionsButtonSize.width != v7->_pageManagementFocusModeOptionsButtonSize.width)
        goto LABEL_19;
      if (self->_pageManagementFocusModeOptionsButtonSize.height != v7->_pageManagementFocusModeOptionsButtonSize.height)
        goto LABEL_19;
      v10 = 0;
      if (self->_pageManagement2x2LayoutMetrics.cellSpacing.width != v7->_pageManagement2x2LayoutMetrics.cellSpacing.width)
        goto LABEL_19;
      if (self->_pageManagement2x2LayoutMetrics.cellSpacing.height != v7->_pageManagement2x2LayoutMetrics.cellSpacing.height)
        goto LABEL_19;
      if (self->_pageManagement2x2LayoutMetrics.bottomMargin != v7->_pageManagement2x2LayoutMetrics.bottomMargin)
        goto LABEL_19;
      v10 = 0;
      if (self->_pageManagement3x2LayoutMetrics.cellSpacing.width != v7->_pageManagement3x2LayoutMetrics.cellSpacing.width)
        goto LABEL_19;
      if (self->_pageManagement3x2LayoutMetrics.cellSpacing.height != v7->_pageManagement3x2LayoutMetrics.cellSpacing.height)
        goto LABEL_19;
      if (self->_pageManagement3x2LayoutMetrics.bottomMargin != v7->_pageManagement3x2LayoutMetrics.bottomMargin)
        goto LABEL_19;
      v10 = 0;
      if (self->_pageManagement3x3LayoutMetrics.cellSpacing.width != v7->_pageManagement3x3LayoutMetrics.cellSpacing.width
        || self->_pageManagement3x3LayoutMetrics.cellSpacing.height != v7->_pageManagement3x3LayoutMetrics.cellSpacing.height
        || self->_pageManagement3x3LayoutMetrics.bottomMargin != v7->_pageManagement3x3LayoutMetrics.bottomMargin)
      {
        goto LABEL_19;
      }
      if (self->_dockViewHeight == v7->_dockViewHeight
        && self->_dockBackgroundViewCornerRadius == v7->_dockBackgroundViewCornerRadius
        && (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)&self->_dockBackgroundViewInsets.top, *(float64x2_t *)&v7->_dockBackgroundViewInsets.top), (int32x4_t)vceqq_f64(*(float64x2_t *)&self->_dockBackgroundViewInsets.bottom, *(float64x2_t *)&v7->_dockBackgroundViewInsets.bottom))), 0xFuLL))) & 1) != 0&& (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)&self->_dockListViewInsets.top, *(float64x2_t *)&v7->_dockListViewInsets.top), (int32x4_t)vceqq_f64(*(float64x2_t *)&self->_dockListViewInsets.bottom,
                                                       *(float64x2_t *)&v7->_dockListViewInsets.bottom))),
                                      0xFuLL))) & 1) != 0
        && (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)&self->_editModeButtonContentEdgeInsets.top, *(float64x2_t *)&v7->_editModeButtonContentEdgeInsets.top), (int32x4_t)vceqq_f64(*(float64x2_t *)&self->_editModeButtonContentEdgeInsets.bottom, *(float64x2_t *)&v7->_editModeButtonContentEdgeInsets.bottom))), 0xFuLL))) & 1) != 0)
      {
        v10 = 0;
        if (self->_editModeButtonLayoutOffset.horizontal == v7->_editModeButtonLayoutOffset.horizontal
          && self->_editModeButtonLayoutOffset.vertical == v7->_editModeButtonLayoutOffset.vertical)
        {
          v10 = 0;
          if (self->_editModeButtonSize.width == v7->_editModeButtonSize.width
            && self->_editModeButtonSize.height == v7->_editModeButtonSize.height)
          {
            v10 = self->_editingEntryAreaHorizontalInset == v7->_editingEntryAreaHorizontalInset;
          }
        }
        goto LABEL_19;
      }
    }
  }
  v10 = 0;
LABEL_19:

LABEL_22:
  return v10;
}

- (unint64_t)hash
{
  double bottom;
  CGFloat v3;

  bottom = self->_editModeButtonContentEdgeInsets.bottom;
  v3 = self->_editModeButtonContentEdgeInsets.leading
     + bottom
     + self->_editModeButtonContentEdgeInsets.trailing
     + self->_editModeButtonContentEdgeInsets.top
     + self->_dockListViewInsets.left
     + self->_dockListViewInsets.bottom
     + self->_dockListViewInsets.right
     + self->_dockListViewInsets.top
     + self->_dockBackgroundViewInsets.left
     + self->_dockBackgroundViewInsets.bottom
     + self->_dockBackgroundViewInsets.right
     + self->_dockBackgroundViewInsets.top
     + self->_dockBackgroundViewCornerRadius
     + self->_dockViewHeight
     + self->_idleTextVerticalOffset
     + self->_pageControlVerticalOffset
     + self->_scrollAccessoryVerticalOffsetAdjustmentForAuxiliaryView
     + self->_pageControlFrameInset.width
     + self->_pageControlFrameInset.height
     + self->_pageControlCustomPadding.width
     + self->_pageControlCustomPadding.height
     + self->_pageManagementPageCheckboxVerticalMargin
     + self->_pageManagementPageCheckboxDiameter
     + self->_pageManagementFocusModeOptionsButtonSize.width
     + self->_pageManagementFocusModeOptionsButtonSize.height
     + (double)(unint64_t)(self->_pageManagement1x1LayoutMetrics.bottomMargin
                                + self->_pageManagement1x1LayoutMetrics.cellSpacing.width
                                + self->_pageManagement1x1LayoutMetrics.cellSpacing.height)
     + (double)(unint64_t)(self->_pageManagement2x1LayoutMetrics.bottomMargin
                                + self->_pageManagement2x1LayoutMetrics.cellSpacing.width
                                + self->_pageManagement2x1LayoutMetrics.cellSpacing.height)
     + (double)(unint64_t)(self->_pageManagement2x2LayoutMetrics.bottomMargin
                                + self->_pageManagement2x2LayoutMetrics.cellSpacing.width
                                + self->_pageManagement2x2LayoutMetrics.cellSpacing.height)
     + (double)(unint64_t)(self->_pageManagement3x2LayoutMetrics.bottomMargin
                                + self->_pageManagement3x2LayoutMetrics.cellSpacing.width
                                + self->_pageManagement3x2LayoutMetrics.cellSpacing.height)
     + (double)(unint64_t)(self->_pageManagement3x3LayoutMetrics.bottomMargin
                                + self->_pageManagement3x3LayoutMetrics.cellSpacing.width
                                + self->_pageManagement3x3LayoutMetrics.cellSpacing.height);
  return (unint64_t)(self->_editingEntryAreaHorizontalInset
                          + self->_editModeButtonSize.height
                          + self->_editModeButtonSize.width
                          + self->_editModeButtonLayoutOffset.vertical
                          + self->_editModeButtonLayoutOffset.horizontal
                          + v3);
}

- (NSString)description
{
  return (NSString *)-[SBHRootFolderVisualConfiguration descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBHRootFolderVisualConfiguration succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
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

  -[SBHRootFolderVisualConfiguration descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
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
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  UIOffset v22;
  CGSize v23;
  UIEdgeInsets v24;
  UIEdgeInsets v25;
  NSDirectionalEdgeInsets v26;

  -[SBHRootFolderVisualConfiguration succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHRootFolderVisualConfiguration idleTextVerticalOffset](self, "idleTextVerticalOffset");
  v5 = (id)objc_msgSend(v4, "appendFloat:withName:", CFSTR("idleTextVerticalOffset"));
  -[SBHRootFolderVisualConfiguration pageControlVerticalOffset](self, "pageControlVerticalOffset");
  v6 = (id)objc_msgSend(v4, "appendFloat:withName:", CFSTR("pageControlVerticalOffset"));
  -[SBHRootFolderVisualConfiguration pageControlFrameInset](self, "pageControlFrameInset");
  v7 = (id)objc_msgSend(v4, "appendSize:withName:", CFSTR("pageControlFrameInset"));
  -[SBHRootFolderVisualConfiguration pageControlCustomPadding](self, "pageControlCustomPadding");
  v8 = (id)objc_msgSend(v4, "appendSize:withName:", CFSTR("pageControlCustomPadding"));
  -[SBHRootFolderVisualConfiguration scrollAccessoryVerticalOffsetAdjustmentForAuxiliaryView](self, "scrollAccessoryVerticalOffsetAdjustmentForAuxiliaryView");
  v9 = (id)objc_msgSend(v4, "appendFloat:withName:", CFSTR("scrollAccessoryVerticalOffsetAdjustmentForAuxiliaryView"));
  -[SBHRootFolderVisualConfiguration pageManagementPageCheckboxVerticalMargin](self, "pageManagementPageCheckboxVerticalMargin");
  v10 = (id)objc_msgSend(v4, "appendFloat:withName:", CFSTR("pageManagementPageCheckboxVerticalMargin"));
  -[SBHRootFolderVisualConfiguration pageManagementPageCheckboxDiameter](self, "pageManagementPageCheckboxDiameter");
  v11 = (id)objc_msgSend(v4, "appendFloat:withName:", CFSTR("pageManagementPageCheckboxDiameter"));
  -[SBHRootFolderVisualConfiguration pageManagementFocusModeOptionsButtonSize](self, "pageManagementFocusModeOptionsButtonSize");
  v12 = (id)objc_msgSend(v4, "appendSize:withName:", CFSTR("pageManagementFocusModeOptionsButtonSize"));
  -[SBHRootFolderVisualConfiguration dockViewHeight](self, "dockViewHeight");
  v13 = (id)objc_msgSend(v4, "appendFloat:withName:", CFSTR("dockViewHeight"));
  -[SBHRootFolderVisualConfiguration dockBackgroundViewCornerRadius](self, "dockBackgroundViewCornerRadius");
  v14 = (id)objc_msgSend(v4, "appendFloat:withName:", CFSTR("dockBackgroundViewCornerRadius"));
  -[SBHRootFolderVisualConfiguration dockBackgroundViewInsets](self, "dockBackgroundViewInsets");
  NSStringFromUIEdgeInsets(v24);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", v15, CFSTR("dockBackgroundViewInsets"));

  -[SBHRootFolderVisualConfiguration dockListViewInsets](self, "dockListViewInsets");
  NSStringFromUIEdgeInsets(v25);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", v16, CFSTR("dockListViewInsets"));

  -[SBHRootFolderVisualConfiguration editModeButtonContentEdgeInsets](self, "editModeButtonContentEdgeInsets");
  NSStringFromDirectionalEdgeInsets(v26);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", v17, CFSTR("editModeButtonContentEdgeInsets"));

  -[SBHRootFolderVisualConfiguration editModeButtonLayoutOffset](self, "editModeButtonLayoutOffset");
  NSStringFromUIOffset(v22);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", v18, CFSTR("editModeButtonLayoutOffset"));

  -[SBHRootFolderVisualConfiguration editModeButtonSize](self, "editModeButtonSize");
  NSStringFromCGSize(v23);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", v19, CFSTR("editModeButtonSize"));

  -[SBHRootFolderVisualConfiguration editingEntryAreaHorizontalInset](self, "editingEntryAreaHorizontalInset");
  v20 = (id)objc_msgSend(v4, "appendFloat:withName:", CFSTR("editingEntryAreaHorizontalInset"));
  return v4;
}

- (double)idleTextVerticalOffset
{
  return self->_idleTextVerticalOffset;
}

- (CGSize)pageControlCustomPadding
{
  double width;
  double height;
  CGSize result;

  width = self->_pageControlCustomPadding.width;
  height = self->_pageControlCustomPadding.height;
  result.height = height;
  result.width = width;
  return result;
}

- (double)pageManagementPageCheckboxVerticalMargin
{
  return self->_pageManagementPageCheckboxVerticalMargin;
}

- (double)pageManagementPageCheckboxDiameter
{
  return self->_pageManagementPageCheckboxDiameter;
}

- (CGSize)pageManagementFocusModeOptionsButtonSize
{
  double width;
  double height;
  CGSize result;

  width = self->_pageManagementFocusModeOptionsButtonSize.width;
  height = self->_pageManagementFocusModeOptionsButtonSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (UIEdgeInsets)dockBackgroundViewInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_dockBackgroundViewInsets.top;
  left = self->_dockBackgroundViewInsets.left;
  bottom = self->_dockBackgroundViewInsets.bottom;
  right = self->_dockBackgroundViewInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (UIEdgeInsets)dockListViewInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_dockListViewInsets.top;
  left = self->_dockListViewInsets.left;
  bottom = self->_dockListViewInsets.bottom;
  right = self->_dockListViewInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (CGSize)editModeButtonSize
{
  double width;
  double height;
  CGSize result;

  width = self->_editModeButtonSize.width;
  height = self->_editModeButtonSize.height;
  result.height = height;
  result.width = width;
  return result;
}

@end
