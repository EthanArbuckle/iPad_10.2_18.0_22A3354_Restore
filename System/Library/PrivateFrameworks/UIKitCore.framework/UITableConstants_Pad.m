@implementation UITableConstants_Pad

+ (id)sharedConstants
{
  void *v3;
  id v4;
  void *v5;

  v3 = (void *)sharedConstants___sharedConstants_1;
  if (!sharedConstants___sharedConstants_1)
  {
    v4 = objc_alloc_init((Class)a1);
    v5 = (void *)sharedConstants___sharedConstants_1;
    sharedConstants___sharedConstants_1 = (uint64_t)v4;

    v3 = (void *)sharedConstants___sharedConstants_1;
  }
  return v3;
}

- (BOOL)supportsUserInterfaceStyles
{
  return 0;
}

- (double)defaultRowHeightForTableView:(id)a3 cellStyle:(int64_t)a4
{
  double v5;
  double v6;
  int ShouldUseExtraPaddingForCells;
  double result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)UITableConstants_Pad;
  -[UITableConstants_IOS defaultRowHeightForTableView:cellStyle:](&v9, sel_defaultRowHeightForTableView_cellStyle_, a3, a4);
  v6 = v5;
  ShouldUseExtraPaddingForCells = TableShouldUseExtraPaddingForCells(a3);
  result = v6 + 8.0;
  if (!ShouldUseExtraPaddingForCells)
    return v6;
  return result;
}

- (double)defaultRowHeightForTableView:(id)a3
{
  double result;

  -[UITableConstants_Pad defaultRowHeightForTableView:cellStyle:](self, "defaultRowHeightForTableView:cellStyle:", a3, 0);
  return result;
}

- (double)minimumContentViewHeightForFont:(id)a3 traitCollection:(id)a4
{
  double result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UITableConstants_Pad;
  -[UITableConstants_IOS minimumContentViewHeightForFont:traitCollection:](&v5, sel_minimumContentViewHeightForFont_traitCollection_, a3, a4);
  return result;
}

- (UIEdgeInsets)defaultLayoutMarginsForCell:(id)a3 inTableView:(id)a4
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  int ShouldUseExtraPaddingForCells;
  double v14;
  double v15;
  double v16;
  double v17;
  objc_super v18;
  UIEdgeInsets result;

  v18.receiver = self;
  v18.super_class = (Class)UITableConstants_Pad;
  -[UITableConstants_IOS defaultLayoutMarginsForCell:inTableView:](&v18, sel_defaultLayoutMarginsForCell_inTableView_, a3);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  ShouldUseExtraPaddingForCells = TableShouldUseExtraPaddingForCells(a4);
  if (ShouldUseExtraPaddingForCells)
    v14 = v10 + 4.0;
  else
    v14 = v10;
  if (ShouldUseExtraPaddingForCells)
    v15 = v6 + 4.0;
  else
    v15 = v6;
  v16 = v8;
  v17 = v12;
  result.right = v17;
  result.bottom = v14;
  result.left = v16;
  result.top = v15;
  return result;
}

- (_UITableConstantsBackgroundProperties)defaultCellBackgroundPropertiesForTableViewStyle:(SEL)a3 state:(int64_t)a4 traitCollection:(id)a5
{
  objc_super v7;

  retstr->var13.trailing = 0.0;
  *(_OWORD *)&retstr->var12 = 0u;
  *(_OWORD *)&retstr->var13.leading = 0u;
  *(_OWORD *)&retstr->var8 = 0u;
  *(_OWORD *)&retstr->var10 = 0u;
  *(_OWORD *)&retstr->var4 = 0u;
  *(_OWORD *)&retstr->var6 = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  v7.receiver = self;
  v7.super_class = (Class)UITableConstants_Pad;
  return (_UITableConstantsBackgroundProperties *)-[_UITableConstantsBackgroundProperties defaultCellBackgroundPropertiesForTableViewStyle:state:traitCollection:](&v7, sel_defaultCellBackgroundPropertiesForTableViewStyle_state_traitCollection_, a4, a5, a6);
}

- (_UITableConstantsBackgroundProperties)defaultSidebarCellBackgroundPropertiesForStyle:(SEL)a3 state:(int64_t)a4 traitCollection:(id)a5
{
  objc_super v7;

  retstr->var13.trailing = 0.0;
  *(_OWORD *)&retstr->var12 = 0u;
  *(_OWORD *)&retstr->var13.leading = 0u;
  *(_OWORD *)&retstr->var8 = 0u;
  *(_OWORD *)&retstr->var10 = 0u;
  *(_OWORD *)&retstr->var4 = 0u;
  *(_OWORD *)&retstr->var6 = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  v7.receiver = self;
  v7.super_class = (Class)UITableConstants_Pad;
  return (_UITableConstantsBackgroundProperties *)-[_UITableConstantsBackgroundProperties defaultSidebarCellBackgroundPropertiesForStyle:state:traitCollection:](&v7, sel_defaultSidebarCellBackgroundPropertiesForStyle_state_traitCollection_, a4, a5, a6);
}

@end
