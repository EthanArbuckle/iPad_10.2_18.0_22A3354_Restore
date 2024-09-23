@implementation SBIconListViewLayoutMetrics

- (BOOL)needsHorizontalColumnBumps
{
  return self->_needsHorizontalColumnBumps;
}

- (CGSize)iconSpacing
{
  double width;
  double height;
  CGSize result;

  width = self->_iconSpacing.width;
  height = self->_iconSpacing.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)iconSize
{
  double width;
  double height;
  CGSize result;

  width = self->_iconSize.width;
  height = self->_iconSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (UIEdgeInsets)iconInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_iconInsets.top;
  left = self->_iconInsets.left;
  bottom = self->_iconInsets.bottom;
  right = self->_iconInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (unint64_t)columnsUsedForLayout
{
  return self->_columnsUsedForLayout;
}

- (int64_t)columnOffset
{
  return self->_columnOffset;
}

- (unint64_t)columns
{
  return self->_columns;
}

- (double)iconContentScale
{
  return self->_iconContentScale;
}

- (SBIconListGridCellInfo)gridCellInfo
{
  return self->_gridCellInfo;
}

- (void)setRowsUsedForLayout:(unint64_t)a3
{
  self->_rowsUsedForLayout = a3;
}

- (void)setRows:(unint64_t)a3
{
  self->_rows = a3;
}

- (void)setNeedsHorizontalColumnBumps:(BOOL)a3
{
  self->_needsHorizontalColumnBumps = a3;
}

- (void)setListModel:(id)a3
{
  objc_storeStrong((id *)&self->_listModel, a3);
}

- (void)setIconSpacing:(CGSize)a3
{
  self->_iconSpacing = a3;
}

- (void)setIconSize:(CGSize)a3
{
  self->_iconSize = a3;
}

- (void)setIconInsets:(UIEdgeInsets)a3
{
  self->_iconInsets = a3;
}

- (void)setIconImageSize:(CGSize)a3
{
  self->_iconImageSize = a3;
}

- (void)setIconContentScale:(double)a3
{
  self->_iconContentScale = a3;
}

- (void)setGridCellInfo:(id)a3
{
  objc_storeStrong((id *)&self->_gridCellInfo, a3);
}

- (void)setColumnsUsedForLayout:(unint64_t)a3
{
  self->_columnsUsedForLayout = a3;
}

- (void)setColumns:(unint64_t)a3
{
  self->_columns = a3;
}

- (void)setAlignmentIconSize:(CGSize)a3
{
  self->_alignmentIconSize = a3;
}

- (void)setAdjustedInsetsToFit:(BOOL)a3
{
  self->_adjustedInsetsToFit = a3;
}

- (void)setAdjustedIconContentScaleToFit:(BOOL)a3
{
  self->_adjustedIconContentScaleToFit = a3;
}

- (BOOL)adjustedIconContentScaleToFit
{
  return self->_adjustedIconContentScaleToFit;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gridCellInfo, 0);
  objc_storeStrong((id *)&self->_listModel, 0);
}

- (NSString)description
{
  return (NSString *)-[SBIconListViewLayoutMetrics descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  void *v8;
  id v9;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = v4;
  if (v4)
  {
    *(_QWORD *)(v4 + 16) = self->_columns;
    *(_QWORD *)(v4 + 24) = self->_rows;
    *(_QWORD *)(v4 + 32) = self->_rowsUsedForLayout;
    *(_QWORD *)(v4 + 40) = self->_columnsUsedForLayout;
    *(_QWORD *)(v4 + 48) = self->_columnOffset;
    *(CGSize *)(v4 + 80) = self->_iconSpacing;
    *(CGSize *)(v4 + 96) = self->_iconSize;
    *(CGSize *)(v4 + 112) = self->_alignmentIconSize;
    *(CGSize *)(v4 + 128) = self->_iconImageSize;
    *(double *)(v4 + 56) = self->_iconContentScale;
    v6 = *(_OWORD *)&self->_iconInsets.bottom;
    *(_OWORD *)(v4 + 144) = *(_OWORD *)&self->_iconInsets.top;
    *(_OWORD *)(v4 + 160) = v6;
    objc_storeStrong((id *)(v4 + 64), self->_listModel);
    v7 = -[SBIconListGridCellInfo copy](self->_gridCellInfo, "copy");
    v8 = *(void **)(v5 + 72);
    *(_QWORD *)(v5 + 72) = v7;

    *(_BYTE *)(v5 + 8) = self->_adjustedInsetsToFit;
    *(_BYTE *)(v5 + 9) = self->_adjustedIconContentScaleToFit;
    *(_BYTE *)(v5 + 10) = self->_needsHorizontalColumnBumps;
    v9 = (id)v5;
  }

  return (id)v5;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBIconListViewLayoutMetrics succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
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

  -[SBIconListViewLayoutMetrics descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
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
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;

  -[SBIconListViewLayoutMetrics succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "appendUnsignedInteger:withName:", self->_columns, CFSTR("columns"));
  v6 = (id)objc_msgSend(v4, "appendUnsignedInteger:withName:", self->_rows, CFSTR("rows"));
  v7 = (id)objc_msgSend(v4, "appendUnsignedInteger:withName:", self->_rowsUsedForLayout, CFSTR("rowsUsedForLayout"));
  v8 = (id)objc_msgSend(v4, "appendUnsignedInteger:withName:", self->_columnsUsedForLayout, CFSTR("columnsUsedForLayout"));
  v9 = (id)objc_msgSend(v4, "appendInteger:withName:", self->_columnOffset, CFSTR("columnOffset"));
  v10 = (id)objc_msgSend(v4, "appendSize:withName:", CFSTR("iconSpacing"), self->_iconSpacing.width, self->_iconSpacing.height);
  v11 = (id)objc_msgSend(v4, "appendSize:withName:", CFSTR("alignmentIconSize"), self->_alignmentIconSize.width, self->_alignmentIconSize.height);
  v12 = (id)objc_msgSend(v4, "appendSize:withName:", CFSTR("iconImageSize"), self->_iconImageSize.width, self->_iconImageSize.height);
  v13 = (id)objc_msgSend(v4, "appendFloat:withName:", CFSTR("iconContentScale"), self->_iconContentScale);
  NSStringFromUIEdgeInsets(self->_iconInsets);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", v14, CFSTR("iconInsets"));

  v15 = (id)objc_msgSend(v4, "appendObject:withName:", self->_gridCellInfo, CFSTR("gridCellInfo"));
  v16 = (id)objc_msgSend(v4, "appendBool:withName:", self->_adjustedInsetsToFit, CFSTR("adjustedInsetsToFit"));
  v17 = (id)objc_msgSend(v4, "appendBool:withName:", self->_adjustedIconContentScaleToFit, CFSTR("adjustedIconContentScaleToFit"));
  v18 = (id)objc_msgSend(v4, "appendBool:withName:", self->_needsHorizontalColumnBumps, CFSTR("needsHorizontalColumnBumps"));
  return v4;
}

- (unint64_t)rows
{
  return self->_rows;
}

- (unint64_t)rowsUsedForLayout
{
  return self->_rowsUsedForLayout;
}

- (void)setColumnOffset:(int64_t)a3
{
  self->_columnOffset = a3;
}

- (CGSize)alignmentIconSize
{
  double width;
  double height;
  CGSize result;

  width = self->_alignmentIconSize.width;
  height = self->_alignmentIconSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)iconImageSize
{
  double width;
  double height;
  CGSize result;

  width = self->_iconImageSize.width;
  height = self->_iconImageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (SBIconListModel)listModel
{
  return self->_listModel;
}

- (BOOL)adjustedInsetsToFit
{
  return self->_adjustedInsetsToFit;
}

@end
