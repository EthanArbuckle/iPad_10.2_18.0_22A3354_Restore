@implementation UIPickerColumnView

- (id)_createTableViewWithFrame:(CGRect)a3 containingFrame:(CGRect)a4
{
  double width;
  double x;
  double height;
  double v7;
  double middleBarHeight;
  CGFloat v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  UIPickerTableView *v15;
  id WeakRetained;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;

  width = a4.size.width;
  x = a4.origin.x;
  height = a3.size.height;
  v7 = a3.size.width;
  middleBarHeight = self->_middleBarHeight;
  v10 = a4.origin.y + middleBarHeight * 0.5;
  v11 = a4.size.height + middleBarHeight;
  UIRoundToViewScale(self);
  v13 = v12;
  UIRoundToViewScale(self);
  v15 = -[UIPickerTableView initWithFrame:style:visibleRect:]([UIPickerTableView alloc], "initWithFrame:style:visibleRect:", 0, v13, v14, v7, height, x, v10, width, v11);
  -[UITableView setDataSource:](v15, "setDataSource:", self);
  -[UITableView setRowHeight:](v15, "setRowHeight:", self->_rowHeight);
  -[UIScrollView setShowsVerticalScrollIndicator:](v15, "setShowsVerticalScrollIndicator:", 0);
  -[UIView setClipsToBounds:](v15, "setClipsToBounds:", 0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_pickerView);
  objc_msgSend(WeakRetained, "_style");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "columnContentEdgeInsets");
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;

  -[UITableView _setSectionContentInset:](v15, "_setSectionContentInset:", v19, v21, v23, v25);
  return v15;
}

- (void)_centerTableInContainer:(id)a3
{
  void *v3;
  double v4;
  double v5;
  double v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "center");
  v5 = v4;

  objc_msgSend(v7, "frame");
  objc_msgSend(v7, "setFrame:", v5 + v6 * -0.5);

}

- (id)_createContainerViewWithFrame:(CGRect)a3
{
  UIView *v3;

  v3 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[UIView setClipsToBounds:](v3, "setClipsToBounds:", 1);
  return v3;
}

- (CATransform3D)_transformForTableWithPerspectiveTranslationX:(SEL)a3
{
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  CATransform3D *result;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  CATransform3D v19;
  CATransform3D a;
  CATransform3D v21;

  *(_OWORD *)&retstr->m41 = 0u;
  *(_OWORD *)&retstr->m43 = 0u;
  *(_OWORD *)&retstr->m31 = 0u;
  *(_OWORD *)&retstr->m33 = 0u;
  *(_OWORD *)&retstr->m21 = 0u;
  *(_OWORD *)&retstr->m23 = 0u;
  *(_OWORD *)&retstr->m11 = 0u;
  *(_OWORD *)&retstr->m13 = 0u;
  CATransform3DMakeTranslation(retstr, a4, 0.0, 0.0);
  v6 = *(_OWORD *)&retstr->m33;
  *(_OWORD *)&a.m31 = *(_OWORD *)&retstr->m31;
  *(_OWORD *)&a.m33 = v6;
  v7 = *(_OWORD *)&retstr->m43;
  *(_OWORD *)&a.m41 = *(_OWORD *)&retstr->m41;
  *(_OWORD *)&a.m43 = v7;
  v8 = *(_OWORD *)&retstr->m13;
  *(_OWORD *)&a.m11 = *(_OWORD *)&retstr->m11;
  *(_OWORD *)&a.m13 = v8;
  v9 = *(_OWORD *)&retstr->m23;
  *(_OWORD *)&a.m21 = *(_OWORD *)&retstr->m21;
  *(_OWORD *)&a.m23 = v9;
  v10 = *(_OWORD *)&self->_perspectiveTransform.m33;
  *(_OWORD *)&v19.m31 = *(_OWORD *)&self->_perspectiveTransform.m31;
  *(_OWORD *)&v19.m33 = v10;
  v11 = *(_OWORD *)&self->_perspectiveTransform.m43;
  *(_OWORD *)&v19.m41 = *(_OWORD *)&self->_perspectiveTransform.m41;
  *(_OWORD *)&v19.m43 = v11;
  v12 = *(_OWORD *)&self->_perspectiveTransform.m13;
  *(_OWORD *)&v19.m11 = *(_OWORD *)&self->_perspectiveTransform.m11;
  *(_OWORD *)&v19.m13 = v12;
  v13 = *(_OWORD *)&self->_perspectiveTransform.m23;
  *(_OWORD *)&v19.m21 = *(_OWORD *)&self->_perspectiveTransform.m21;
  *(_OWORD *)&v19.m23 = v13;
  result = CATransform3DConcat(&v21, &a, &v19);
  v15 = *(_OWORD *)&v21.m33;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&v21.m31;
  *(_OWORD *)&retstr->m33 = v15;
  v16 = *(_OWORD *)&v21.m43;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&v21.m41;
  *(_OWORD *)&retstr->m43 = v16;
  v17 = *(_OWORD *)&v21.m13;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&v21.m11;
  *(_OWORD *)&retstr->m13 = v17;
  v18 = *(_OWORD *)&v21.m23;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&v21.m21;
  *(_OWORD *)&retstr->m23 = v18;
  return result;
}

- (CATransform3D)_transformForTableWithTranslationX:(SEL)a3
{
  *(_OWORD *)&retstr->m41 = 0u;
  *(_OWORD *)&retstr->m43 = 0u;
  *(_OWORD *)&retstr->m31 = 0u;
  *(_OWORD *)&retstr->m33 = 0u;
  *(_OWORD *)&retstr->m21 = 0u;
  *(_OWORD *)&retstr->m23 = 0u;
  *(_OWORD *)&retstr->m11 = 0u;
  *(_OWORD *)&retstr->m13 = 0u;
  return CATransform3DMakeTranslation(retstr, a4, 0.0, 0.0);
}

- (UIPickerColumnView)initWithFrame:(CGRect)a3 tableFrame:(CGRect)a4 middleBarHeight:(double)a5 rowHeight:(double)a6 paddingAroundWheels:(double)a7 pickerView:(id)a8 transform:(CATransform3D *)a9
{
  double height;
  double width;
  double y;
  double x;
  double v14;
  double v15;
  double v16;
  double v17;
  id v19;
  UIPickerColumnView *v20;
  UIPickerColumnView *v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  double v29;
  id v30;
  int v31;
  uint64_t v32;
  UIView *topContainerView;
  uint64_t v34;
  UIPickerTableView *topTable;
  uint64_t v36;
  UIView *middleContainerView;
  uint64_t v38;
  UIPickerTableView *middleTable;
  id WeakRetained;
  int v41;
  uint64_t v42;
  UIView *bottomContainerView;
  uint64_t v44;
  UIPickerTableView *bottomTable;
  double v46;
  double v47;
  id v48;
  int v49;
  void *v50;
  double v51;
  void *v52;
  double v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  UIPickerColumnView *v58;
  double v60;
  double v61;
  char v62[128];
  char v63[128];
  char v64[128];
  char v65[128];
  objc_super v66;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v14 = a3.size.height;
  v15 = a3.size.width;
  v16 = a3.origin.y;
  v17 = a3.origin.x;
  v19 = a8;
  v66.receiver = self;
  v66.super_class = (Class)UIPickerColumnView;
  v20 = -[UIView initWithFrame:](&v66, sel_initWithFrame_, v17, v16, v15, v14);
  v21 = v20;
  if (v20)
  {
    v20->_middleBarHeight = a5;
    v20->_rowHeight = a6;
    v22 = objc_storeWeak((id *)&v20->_pickerView, v19);
    v21->_tableFrame.origin.x = x;
    v21->_tableFrame.origin.y = y;
    v21->_tableFrame.size.width = width;
    v21->_tableFrame.size.height = height;
    v23 = *(_OWORD *)&a9->m23;
    v25 = *(_OWORD *)&a9->m11;
    v24 = *(_OWORD *)&a9->m13;
    *(_OWORD *)&v21->_perspectiveTransform.m21 = *(_OWORD *)&a9->m21;
    *(_OWORD *)&v21->_perspectiveTransform.m23 = v23;
    *(_OWORD *)&v21->_perspectiveTransform.m11 = v25;
    *(_OWORD *)&v21->_perspectiveTransform.m13 = v24;
    v26 = *(_OWORD *)&a9->m43;
    v28 = *(_OWORD *)&a9->m31;
    v27 = *(_OWORD *)&a9->m33;
    *(_OWORD *)&v21->_perspectiveTransform.m41 = *(_OWORD *)&a9->m41;
    *(_OWORD *)&v21->_perspectiveTransform.m43 = v26;
    *(_OWORD *)&v21->_perspectiveTransform.m31 = v28;
    *(_OWORD *)&v21->_perspectiveTransform.m33 = v27;
    v21->_paddingAroundWheels = a7;
    v29 = v14 * 0.5 - a5 * 0.5;
    v30 = v22;
    v31 = objc_msgSend(v19, "_magnifierEnabled");

    v61 = v29;
    if (v31)
    {
      v32 = -[UIPickerColumnView _createContainerViewWithFrame:](v21, "_createContainerViewWithFrame:", 0.0, 0.0, v15, v29);
      topContainerView = v21->_topContainerView;
      v21->_topContainerView = (UIView *)v32;

      v34 = -[UIPickerColumnView _createTableViewWithFrame:containingFrame:](v21, "_createTableViewWithFrame:containingFrame:", x, y, width, height, 0.0, 0.0, v15, v29);
      topTable = v21->_topTable;
      v21->_topTable = (UIPickerTableView *)v34;

      -[UIView addSubview:](v21->_topContainerView, "addSubview:", v21->_topTable);
      -[UIPickerColumnView _centerTableInContainer:](v21, "_centerTableInContainer:", v21->_topTable);
      v60 = v29 + 0.0;
      y = y - (v29 + 0.0);
      v14 = a5;
    }
    else
    {
      v60 = 0.0;
      v29 = 0.0;
    }
    v36 = -[UIPickerColumnView _createContainerViewWithFrame:](v21, "_createContainerViewWithFrame:", 0.0, v29, v15, v14);
    middleContainerView = v21->_middleContainerView;
    v21->_middleContainerView = (UIView *)v36;

    v38 = -[UIPickerColumnView _createTableViewWithFrame:containingFrame:](v21, "_createTableViewWithFrame:containingFrame:", x, y, width, height, 0.0, v29, v15, v14);
    middleTable = v21->_middleTable;
    v21->_middleTable = (UIPickerTableView *)v38;

    -[UIPickerTableView _setPlaysFeedback:](v21->_middleTable, "_setPlaysFeedback:", 1);
    -[UIView addSubview:](v21->_middleContainerView, "addSubview:", v21->_middleTable);
    -[UIPickerColumnView _centerTableInContainer:](v21, "_centerTableInContainer:", v21->_middleTable);
    WeakRetained = objc_loadWeakRetained((id *)&v21->_pickerView);
    v41 = objc_msgSend(WeakRetained, "_magnifierEnabled");

    if (v41)
    {
      v42 = -[UIPickerColumnView _createContainerViewWithFrame:](v21, "_createContainerViewWithFrame:", 0.0, v60 + a5, v15, v61);
      bottomContainerView = v21->_bottomContainerView;
      v21->_bottomContainerView = (UIView *)v42;

      v44 = -[UIPickerColumnView _createTableViewWithFrame:containingFrame:](v21, "_createTableViewWithFrame:containingFrame:", x, y - a5, width, height, 0.0, v60 + a5, v15, v61);
      bottomTable = v21->_bottomTable;
      v21->_bottomTable = (UIPickerTableView *)v44;

      -[UIView addSubview:](v21->_bottomContainerView, "addSubview:", v21->_bottomTable);
      -[UIPickerColumnView _centerTableInContainer:](v21, "_centerTableInContainer:", v21->_bottomTable);
      -[UIView addSubview:](v21, "addSubview:", v21->_topContainerView);
      -[UIView addSubview:](v21, "addSubview:", v21->_bottomContainerView);
    }
    -[UIView addSubview:](v21, "addSubview:", v21->_middleContainerView);
    -[UIView center](v21, "center");
    v47 = v21->_paddingAroundWheels + width * 0.5 + x - v46;
    v48 = objc_loadWeakRetained((id *)&v21->_pickerView);
    v49 = objc_msgSend(v48, "_magnifierEnabled");

    if (v49)
    {
      -[UIView layer](v21->_topTable, "layer");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIPickerColumnView _horizontalBiasForEndTables](v21, "_horizontalBiasForEndTables");
      -[UIPickerColumnView _transformForTableWithPerspectiveTranslationX:](v21, "_transformForTableWithPerspectiveTranslationX:", v47 + v51);
      objc_msgSend(v50, "setSublayerTransform:", v65);

      -[UIView layer](v21->_bottomTable, "layer");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIPickerColumnView _horizontalBiasForEndTables](v21, "_horizontalBiasForEndTables");
      -[UIPickerColumnView _transformForTableWithPerspectiveTranslationX:](v21, "_transformForTableWithPerspectiveTranslationX:", v47 + v53);
      objc_msgSend(v52, "setSublayerTransform:", v64);

      -[UIView layer](v21->_middleTable, "layer");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIPickerColumnView _transformForTableWithTranslationX:](v21, "_transformForTableWithTranslationX:", v47);
      objc_msgSend(v54, "setSublayerTransform:", v63);

    }
    else
    {
      -[UIView layer](v21->_middleTable, "layer");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIPickerColumnView _transformForTableWithPerspectiveTranslationX:](v21, "_transformForTableWithPerspectiveTranslationX:", v47);
      objc_msgSend(v55, "setSublayerTransform:", v62);

    }
    -[UIScrollView setScrollEnabled:](v21->_topTable, "setScrollEnabled:", 0);
    -[UIScrollView setScrollEnabled:](v21->_bottomTable, "setScrollEnabled:", 0);
    -[UIScrollView panGestureRecognizer](v21->_middleTable, "panGestureRecognizer");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addGestureRecognizer:](v21, "addGestureRecognizer:", v56);

    objc_msgSend(v19, "_style");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "applyCustomizationsToColumn:", v21);

    v58 = v21;
  }

  return v21;
}

- (BOOL)_containsTable:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqual:", self->_topTable) & 1) != 0
    || (objc_msgSend(v4, "isEqual:", self->_middleTable) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v5 = objc_msgSend(v4, "isEqual:", self->_bottomTable);
  }

  return v5;
}

- (id)_preferredTable
{
  return self->_middleTable;
}

- (CGRect)_tableFrame
{
  return CGRectOffset(self->_tableFrame, self->_paddingAroundWheels, 0.0);
}

- (BOOL)_pointLiesWithinEffectiveTableBounds:(CGPoint)a3
{
  double leftHitTestExtension;
  CGRect v6;

  leftHitTestExtension = self->_leftHitTestExtension;
  v6.origin.y = self->_tableFrame.origin.y;
  v6.size.height = self->_tableFrame.size.height;
  v6.origin.x = self->_tableFrame.origin.x - leftHitTestExtension;
  v6.size.width = self->_tableFrame.size.width + leftHitTestExtension + self->_rightHitTestExtension;
  return CGRectContainsPoint(v6, a3);
}

- (double)_horizontalBiasForEndTables
{
  id WeakRetained;
  void *v4;
  double v5;
  double v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_pickerView);
  objc_msgSend(WeakRetained, "_style");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView frame](self, "frame");
  objc_msgSend(v4, "horizontalBiasForEndTablesWithColumnFrame:tableFrame:");
  v6 = v5;

  return v6;
}

- (BOOL)selectRow:(int64_t)a3 animated:(BOOL)a4 notify:(BOOL)a5
{
  return -[UIPickerColumnView selectRow:animated:notify:updateChecked:](self, "selectRow:animated:notify:updateChecked:", a3, a4, a5, 1);
}

- (BOOL)selectRow:(int64_t)a3 animated:(BOOL)a4 notify:(BOOL)a5 updateChecked:(BOOL)a6
{
  return -[UIPickerTableView selectRow:animated:notify:updateChecked:](self->_middleTable, "selectRow:animated:notify:updateChecked:", a3, a4, a5, a6);
}

- (BOOL)isRowChecked:(int64_t)a3
{
  return -[UIPickerTableView isRowChecked:](self->_middleTable, "isRowChecked:", a3);
}

- (BOOL)_scrollRowAtIndexPathToSelectionBar:(id)a3 animated:(BOOL)a4
{
  return -[UIPickerTableView _scrollRowAtIndexPathToSelectionBar:animated:](self->_middleTable, "_scrollRowAtIndexPathToSelectionBar:animated:", a3, a4);
}

- (int64_t)selectionBarRow
{
  return -[UIPickerTableView selectionBarRow](self->_middleTable, "selectionBarRow");
}

- (void)setSelectionBarRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  id WeakRetained;
  int v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  WeakRetained = objc_loadWeakRetained((id *)&self->_pickerView);
  v9 = objc_msgSend(WeakRetained, "_magnifierEnabled");

  if (v9)
  {
    -[UIPickerTableView setSelectionBarRect:](self->_topTable, "setSelectionBarRect:", x, y, width, height);
    -[UIPickerTableView setSelectionBarRect:](self->_bottomTable, "setSelectionBarRect:", x, y, width, height);
  }
  -[UIPickerTableView setSelectionBarRect:](self->_middleTable, "setSelectionBarRect:", x, y, width, height);
}

- (void)markAsNoLongerInUse
{
  -[UIPickerColumnView setIsNoLongerInUse:](self, "setIsNoLongerInUse:", 1);
  -[UIPickerColumnView reloadData](self, "reloadData");
}

- (CGRect)selectionBarRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[UIPickerTableView selectionBarRect](self->_middleTable, "selectionBarRect");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)_sendCheckedRow:(int64_t)a3 inTableView:(id)a4 checked:(BOOL)a5
{
  id WeakRetained;
  id v7;

  v7 = a4;
  if (objc_msgSend(v7, "isEqual:", self->_middleTable))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_pickerView);
    objc_msgSend(WeakRetained, "_sendSelectionChangedFromTable:notify:", v7, 1);

  }
}

- (BOOL)_soundsEnabled
{
  id WeakRetained;
  char v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_pickerView);
  v3 = objc_msgSend(WeakRetained, "_soundsEnabled");

  return v3;
}

- (BOOL)_usesCheckSelection
{
  id WeakRetained;
  char v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_pickerView);
  v3 = objc_msgSend(WeakRetained, "_usesCheckSelection");

  return v3;
}

- (int64_t)numberOfRowsInSection:(int64_t)a3
{
  return -[UITableView numberOfRowsInSection:](self->_middleTable, "numberOfRowsInSection:", a3);
}

- (id)cellForRowAtIndexPath:(id)a3
{
  return -[UITableView cellForRowAtIndexPath:](self->_middleTable, "cellForRowAtIndexPath:", a3);
}

- (void)setRowHeight:(double)a3
{
  id WeakRetained;
  int v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_pickerView);
  v6 = objc_msgSend(WeakRetained, "_magnifierEnabled");

  if (v6)
  {
    -[UITableView setRowHeight:](self->_topTable, "setRowHeight:", a3);
    -[UITableView setRowHeight:](self->_bottomTable, "setRowHeight:", a3);
  }
  -[UITableView setRowHeight:](self->_middleTable, "setRowHeight:", a3);
}

- (void)reloadData
{
  id WeakRetained;
  int v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_pickerView);
  v4 = objc_msgSend(WeakRetained, "_magnifierEnabled");

  if (v4)
  {
    -[UITableView reloadData](self->_topTable, "reloadData");
    -[UITableView reloadData](self->_bottomTable, "reloadData");
  }
  -[UITableView reloadData](self->_middleTable, "reloadData");
}

- (void)beginUpdates
{
  id WeakRetained;
  int v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_pickerView);
  v4 = objc_msgSend(WeakRetained, "_magnifierEnabled");

  if (v4)
  {
    -[UITableView beginUpdates](self->_topTable, "beginUpdates");
    -[UITableView beginUpdates](self->_bottomTable, "beginUpdates");
  }
  -[UITableView beginUpdates](self->_middleTable, "beginUpdates");
}

- (void)endUpdates
{
  id WeakRetained;
  int v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_pickerView);
  v4 = objc_msgSend(WeakRetained, "_magnifierEnabled");

  if (v4)
  {
    -[UITableView endUpdates](self->_topTable, "endUpdates");
    -[UITableView endUpdates](self->_bottomTable, "endUpdates");
  }
  -[UITableView endUpdates](self->_middleTable, "endUpdates");
}

- (void)setAllowsMultipleSelection:(BOOL)a3
{
  _BOOL8 v3;
  id WeakRetained;
  int v6;

  v3 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_pickerView);
  v6 = objc_msgSend(WeakRetained, "_magnifierEnabled");

  if (v6)
  {
    -[UITableView setAllowsMultipleSelection:](self->_topTable, "setAllowsMultipleSelection:", v3);
    -[UITableView setAllowsMultipleSelection:](self->_bottomTable, "setAllowsMultipleSelection:", v3);
  }
  -[UITableView setAllowsMultipleSelection:](self->_middleTable, "setAllowsMultipleSelection:", v3);
}

- (void)_moveTableViewIfNecessary:(id)a3 toContentOffset:(CGPoint)a4
{
  double y;
  double x;
  double v6;
  double v7;
  id v9;

  y = a4.y;
  x = a4.x;
  v9 = a3;
  objc_msgSend(v9, "contentOffset");
  if (v7 != x || v6 != y)
    objc_msgSend(v9, "_setContentOffset:notify:", 0, x, y);

}

- (void)_pickerTableViewDidChangeContentOffset:(id)a3
{
  id WeakRetained;
  int v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;

  v10 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_pickerView);
  v5 = objc_msgSend(WeakRetained, "_magnifierEnabled");

  if (v5)
  {
    objc_msgSend(v10, "contentOffset");
    v7 = v6;
    v9 = v8;
    if (objc_msgSend(v10, "isEqual:", self->_topTable))
    {
      -[UIPickerColumnView _moveTableViewIfNecessary:toContentOffset:](self, "_moveTableViewIfNecessary:toContentOffset:", self->_middleTable, v7, v9);
      -[UIPickerColumnView _moveTableViewIfNecessary:toContentOffset:](self, "_moveTableViewIfNecessary:toContentOffset:", self->_bottomTable, v7, v9);
    }
    if ((objc_msgSend(v10, "isEqual:", self->_middleTable) & 1) != 0)
    {
      -[UIPickerColumnView _moveTableViewIfNecessary:toContentOffset:](self, "_moveTableViewIfNecessary:toContentOffset:", self->_topTable, v7, v9);
      -[UIPickerColumnView _moveTableViewIfNecessary:toContentOffset:](self, "_moveTableViewIfNecessary:toContentOffset:", self->_bottomTable, v7, v9);
    }
    if (objc_msgSend(v10, "isEqual:", self->_bottomTable))
    {
      -[UIPickerColumnView _moveTableViewIfNecessary:toContentOffset:](self, "_moveTableViewIfNecessary:toContentOffset:", self->_topTable, v7, v9);
      -[UIPickerColumnView _moveTableViewIfNecessary:toContentOffset:](self, "_moveTableViewIfNecessary:toContentOffset:", self->_middleTable, v7, v9);
    }
  }

}

- (void)pickerTableView:(id)a3 didChangeSelectionBarRowFrom:(int64_t)a4 to:(int64_t)a5
{
  id WeakRetained;
  char v9;
  id v10;

  if (objc_msgSend(a3, "isEqual:", self->_middleTable))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_pickerView);
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      v10 = objc_loadWeakRetained((id *)&self->_pickerView);
      objc_msgSend(v10, "pickerTableView:didChangeSelectionBarRowFrom:to:", self->_middleTable, a4, a5);

    }
  }
}

- (_NSRange)_visibleGlobalRows
{
  NSUInteger v2;
  NSUInteger v3;
  _NSRange result;

  v2 = -[UITableView _visibleGlobalRows](self->_middleTable, "_visibleGlobalRows");
  result.length = v3;
  result.location = v2;
  return result;
}

- (id)_allVisibleCells
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0C99E20];
  -[UITableView visibleCells](self->_topTable, "visibleCells");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[UITableView visibleCells](self->_middleTable, "visibleCells");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v6);

  -[UITableView visibleCells](self->_bottomTable, "visibleCells");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v7);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithSet:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_visibleCellClosestToPoint:(CGPoint)a3 inView:(id)a4
{
  CGFloat y;
  CGFloat x;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  double v13;
  uint64_t i;
  void *v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  double v20;
  double v21;
  id v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  y = a3.y;
  x = a3.x;
  v29 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  -[UIPickerColumnView _allVisibleCells](self, "_allVisibleCells", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v25;
    v13 = 1.79769313e308;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v25 != v12)
          objc_enumerationMutation(v8);
        v15 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v15, "bounds");
        objc_msgSend(v15, "convertRect:toView:", v7);
        UIDistanceBetweenPointAndRect(x, y, v16, v17, v18, v19);
        v21 = v20;
        if (!v11 || v13 >= v20)
        {
          v22 = v15;

          v13 = v21;
          v11 = v22;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v10);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6;
  int64_t v7;
  id WeakRetained;

  v6 = a3;
  if (-[UIPickerColumnView isNoLongerInUse](self, "isNoLongerInUse"))
  {
    v7 = 0;
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_pickerView);
    v7 = objc_msgSend(WeakRetained, "tableView:numberOfRowsInSection:", v6, a4);

  }
  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  UIPickerTableViewCell *v8;
  UIPickerView **p_pickerView;
  id WeakRetained;
  id v11;
  uint64_t v12;
  id v13;

  v6 = a3;
  v7 = a4;
  if (-[UIPickerColumnView isNoLongerInUse](self, "isNoLongerInUse"))
  {
    v8 = -[UIPickerTableViewCell initWithStyle:reuseIdentifier:]([UIPickerTableViewCell alloc], "initWithStyle:reuseIdentifier:", 0, 0);
  }
  else
  {
    p_pickerView = &self->_pickerView;
    WeakRetained = objc_loadWeakRetained((id *)&self->_pickerView);
    objc_msgSend(WeakRetained, "tableView:cellForRowAtIndexPath:", v6, v7);
    v8 = (UIPickerTableViewCell *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "isEqual:", self->_middleTable))
    {
      v11 = objc_loadWeakRetained((id *)&self->_pickerView);
      v12 = objc_msgSend(v11, "_magnifierEnabled");

    }
    else
    {
      v12 = 0;
    }
    v13 = objc_loadWeakRetained((id *)p_pickerView);
    -[UIPickerTableViewCell _setIsCenterCell:shouldModifyAlphaOfView:](v8, "_setIsCenterCell:shouldModifyAlphaOfView:", v12, objc_msgSend(v13, "_magnifierEnabled"));

  }
  return v8;
}

- (BOOL)canBecomeFocused
{
  return _AXSFullKeyboardAccessEnabled() != 0;
}

- (id)_systemDefaultFocusGroupIdentifier
{
  void *v3;
  char v4;
  void *v6;
  void *v7;
  objc_super v8;

  -[UIView _focusBehavior](self, "_focusBehavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "focusGroupContainmentBehavior");

  if ((v4 & 0x10) != 0)
  {
    _UIFocusNearestAncestorEnvironmentScrollableContainer(self, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = 0;
    }
    else
    {
      _UIFocusGroupIdentifierForInstance(self);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }

    return v7;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)UIPickerColumnView;
    -[UIView _systemDefaultFocusGroupIdentifier](&v8, sel__systemDefaultFocusGroupIdentifier);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (CGRect)_defaultFocusRegionFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_tableFrame.origin.x;
  y = self->_tableFrame.origin.y;
  width = self->_tableFrame.size.width;
  height = self->_tableFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)accessibilityFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_tableFrame.origin.x;
  y = self->_tableFrame.origin.y;
  width = self->_tableFrame.size.width;
  height = self->_tableFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (id)_defaultFocusEffect
{
  return +[UIFocusHaloEffect effectWithRoundedRect:cornerRadius:curve:](UIFocusHaloEffect, "effectWithRoundedRect:cornerRadius:curve:", *MEMORY[0x1E0CD2A68], self->_tableFrame.origin.x, self->_tableFrame.origin.y, self->_tableFrame.size.width, self->_tableFrame.size.height, 5.0);
}

- (UIView)highlightedRegion
{
  return self->_middleContainerView;
}

- (double)rowHeight
{
  return self->_rowHeight;
}

- (CATransform3D)perspectiveTransform
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;

  v3 = *(_OWORD *)&self[4].m41;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&self[4].m33;
  *(_OWORD *)&retstr->m33 = v3;
  v4 = *(_OWORD *)&self[5].m11;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&self[4].m43;
  *(_OWORD *)&retstr->m43 = v4;
  v5 = *(_OWORD *)&self[4].m21;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&self[4].m13;
  *(_OWORD *)&retstr->m13 = v5;
  v6 = *(_OWORD *)&self[4].m31;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&self[4].m23;
  *(_OWORD *)&retstr->m23 = v6;
  return self;
}

- (void)setPerspectiveTransform:(CATransform3D *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;

  v3 = *(_OWORD *)&a3->m23;
  v5 = *(_OWORD *)&a3->m11;
  v4 = *(_OWORD *)&a3->m13;
  *(_OWORD *)&self->_perspectiveTransform.m21 = *(_OWORD *)&a3->m21;
  *(_OWORD *)&self->_perspectiveTransform.m23 = v3;
  *(_OWORD *)&self->_perspectiveTransform.m11 = v5;
  *(_OWORD *)&self->_perspectiveTransform.m13 = v4;
  v6 = *(_OWORD *)&a3->m43;
  v8 = *(_OWORD *)&a3->m31;
  v7 = *(_OWORD *)&a3->m33;
  *(_OWORD *)&self->_perspectiveTransform.m41 = *(_OWORD *)&a3->m41;
  *(_OWORD *)&self->_perspectiveTransform.m43 = v6;
  *(_OWORD *)&self->_perspectiveTransform.m31 = v8;
  *(_OWORD *)&self->_perspectiveTransform.m33 = v7;
}

- (UIColor)_textColor
{
  return self->__textColor;
}

- (void)_setTextColor:(id)a3
{
  objc_storeStrong((id *)&self->__textColor, a3);
}

- (double)leftHitTestExtension
{
  return self->_leftHitTestExtension;
}

- (void)setLeftHitTestExtension:(double)a3
{
  self->_leftHitTestExtension = a3;
}

- (double)rightHitTestExtension
{
  return self->_rightHitTestExtension;
}

- (void)setRightHitTestExtension:(double)a3
{
  self->_rightHitTestExtension = a3;
}

- (BOOL)isNoLongerInUse
{
  return self->_isNoLongerInUse;
}

- (void)setIsNoLongerInUse:(BOOL)a3
{
  self->_isNoLongerInUse = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__textColor, 0);
  objc_destroyWeak((id *)&self->_pickerView);
  objc_storeStrong((id *)&self->_bottomContainerView, 0);
  objc_storeStrong((id *)&self->_middleContainerView, 0);
  objc_storeStrong((id *)&self->_topContainerView, 0);
  objc_storeStrong((id *)&self->_bottomTable, 0);
  objc_storeStrong((id *)&self->_middleTable, 0);
  objc_storeStrong((id *)&self->_topTable, 0);
}

@end
