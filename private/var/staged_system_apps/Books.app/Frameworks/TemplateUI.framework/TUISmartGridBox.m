@implementation TUISmartGridBox

+ (unint64_t)layoutModeFromString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  v4 = v3;
  if (qword_2CB798 != -1)
  {
    dispatch_once(&qword_2CB798, &stru_2420F0);
    if (v4)
      goto LABEL_3;
LABEL_5:
    v6 = 0;
    goto LABEL_6;
  }
  if (!v3)
    goto LABEL_5;
LABEL_3:
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_2CB790, "objectForKeyedSubscript:", v4));
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

LABEL_6:
  return (unint64_t)v6;
}

- (Class)layoutClass
{
  return (Class)objc_opt_class(TUISmartGridLayout, a2);
}

- (void)updateWithContents:(id)a3
{
  id v4;
  __objc2_class *v5;
  TUIScrollingBox *v6;
  TUIScrollingBox *scrollBox;
  void *v8;
  void *v9;
  void *v10;
  TUISmartGridContentBox *content;
  TUISmartGridContentBox *v12;
  TUISmartGridContentBox *v13;
  void *v14;
  void *v15;
  TUIScrollingBox *v16;
  void *v17;
  void *v18;
  TUIScrollingBox *v19;
  TUISmartGridContentBox *v20;

  v4 = a3;
  if ((self->_layoutMode | 4) == 4)
    v5 = TUIHScrollBox;
  else
    v5 = TUIVScrollBox;
  v6 = (TUIScrollingBox *)objc_alloc_init(v5);
  scrollBox = self->_scrollBox;
  self->_scrollBox = v6;

  -[TUIScrollingBox setAcceptsDrop:](self->_scrollBox, "setAcceptsDrop:", self->_acceptsDrop);
  -[TUIScrollingBox setDropHandler:](self->_scrollBox, "setDropHandler:", self->_dropHandler);
  -[TUIScrollingBox setDecelerationRate:](self->_scrollBox, "setDecelerationRate:", self->_decelerationRate);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TUIBox identifier](self, "identifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "tui_identifierByAppendingString:", CFSTR("scrollable")));
  -[TUIScrollingBox setIdentifier:](self->_scrollBox, "setIdentifier:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TUISmartGridBox modelIdentifierForScrollable](self, "modelIdentifierForScrollable"));
  -[TUIScrollingBox setModelIdentifierForScrollable:](self->_scrollBox, "setModelIdentifierForScrollable:", v10);

  content = self->_content;
  if (!content)
  {
    v12 = objc_alloc_init(TUISmartGridContentBox);
    v13 = self->_content;
    self->_content = v12;

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[TUIBox identifier](self, "identifier"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "tui_identifierByAppendingString:", CFSTR("content")));
    -[TUIBox setIdentifier:](self->_content, "setIdentifier:", v15);

    content = self->_content;
  }
  -[TUIContainerBox updateModelChildren:](content, "updateModelChildren:", v4);
  v16 = self->_scrollBox;
  v20 = self->_content;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v20, 1));
  -[TUIScrollingBox updateModelChildren:](v16, "updateModelChildren:", v17);

  v19 = self->_scrollBox;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v19, 1));
  -[TUIContainerBox updateModelChildren:](self, "updateModelChildren:", v18);

}

+ (unint64_t)verticalPlacementFromString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  v4 = v3;
  if (qword_2CB7A8 != -1)
  {
    dispatch_once(&qword_2CB7A8, &stru_242110);
    if (v4)
      goto LABEL_3;
LABEL_5:
    v6 = 0;
    goto LABEL_6;
  }
  if (!v3)
    goto LABEL_5;
LABEL_3:
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_2CB7A0, "objectForKeyedSubscript:", v4));
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

LABEL_6:
  return (unint64_t)v6;
}

+ (unint64_t)columnsWithConfiguration:(id)a3
{
  id v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;
  uint64_t v12;
  double v13;
  id v14;
  uint64_t v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  id v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  id v24;

  v3 = a3;
  v4 = objc_msgSend(v3, "columns");
  objc_msgSend(v3, "width");
  v6 = v5;
  objc_msgSend(v3, "contentInsets");
  v8 = v7;
  v10 = v9;
  v11 = objc_msgSend(v3, "columnSpacing");
  v13 = TUILengthValueWithDefault((uint64_t)v11, v12, 0.0);
  if (v4 == (id)0x7FFFFFFFFFFFFFFFLL || !v4)
  {
    v14 = objc_msgSend(v3, "columnWidth");
    v16 = TUILengthValueWithDefault((uint64_t)v14, v15, 100.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "widthSnap"));

    if (v17)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "widthSnap"));
      objc_msgSend(v18, "valueForValue:", v6);
      v6 = v19;

    }
    v4 = (id)vcvtmd_u64_f64((v13 + v6 - v8 - v10) / (v13 + v16));
  }
  v20 = objc_msgSend(v3, "columnMultiple");
  if ((unint64_t)v20 <= 1)
    v21 = 1;
  else
    v21 = (unint64_t)v20;
  if ((unint64_t)v4 <= v21)
    v22 = v21;
  else
    v22 = (unint64_t)v4;
  v23 = v22 / v21 * v21;
  if (objc_msgSend(v3, "maxColumns") != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v24 = objc_msgSend(v3, "maxColumns");
    if ((unint64_t)v24 < v23)
      v23 = (unint64_t)v24;
  }

  return v23;
}

+ (double)columnWidthWithConfiguration:(id)a3 columns:(unint64_t)a4 spacing:(double)a5
{
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  int v13;

  v7 = a3;
  objc_msgSend(v7, "width");
  v9 = v8;
  objc_msgSend(v7, "contentInsets");
  v12 = (v9 - v10 - v11 + a5) / (double)a4 - a5;
  objc_msgSend(v7, "columnWidth");
  LODWORD(a4) = v13;

  return fmin(v12, *(float *)&a4);
}

- (TUIIdentifier)modelIdentifierForScrollable
{
  return self->_modelIdentifierForScrollable;
}

- (void)setModelIdentifierForScrollable:(id)a3
{
  objc_storeStrong((id *)&self->_modelIdentifierForScrollable, a3);
}

- (UIEdgeInsets)insets
{
  double v2;
  double v3;
  double top;
  double left;
  UIEdgeInsets result;

  v2 = *(double *)&self->_rowSpacing.max;
  v3 = *(double *)&self->_rowSpacing._flags;
  top = self->_insets.top;
  left = self->_insets.left;
  result.right = left;
  result.bottom = top;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)setInsets:(UIEdgeInsets)a3
{
  *(UIEdgeInsets *)&self->_rowSpacing.max = a3;
}

- (NSObject)columns
{
  return self->_columns;
}

- (void)setColumns:(id)a3
{
  objc_storeStrong((id *)&self->_columns, a3);
}

- (unint64_t)maxColumns
{
  return self->_maxColumns;
}

- (void)setMaxColumns:(unint64_t)a3
{
  self->_maxColumns = a3;
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)columnWidth
{
  return *($881BB7C90C7D0DFCC1492E3DC022A30F **)&self->_columnWidth.value;
}

- (void)setColumnWidth:(id *)a3
{
  uint64_t v3;

  *(_QWORD *)&self->_columnWidth.value = a3;
  *(_QWORD *)&self->_columnWidth.max = v3;
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)columnSpacing
{
  return *($881BB7C90C7D0DFCC1492E3DC022A30F **)&self->_columnWidth._flags;
}

- (void)setColumnSpacing:(id *)a3
{
  uint64_t v3;

  *(_QWORD *)&self->_columnWidth._flags = a3;
  *(_QWORD *)&self->_columnSpacing.min = v3;
}

- (unint64_t)columnMultiple
{
  return self->_columnMultiple;
}

- (void)setColumnMultiple:(unint64_t)a3
{
  self->_columnMultiple = a3;
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)rowSpacing
{
  return *($881BB7C90C7D0DFCC1492E3DC022A30F **)&self->_columnSpacing.priority;
}

- (void)setRowSpacing:(id *)a3
{
  uint64_t v3;

  *(_QWORD *)&self->_columnSpacing.priority = a3;
  *(_QWORD *)&self->_rowSpacing.value = v3;
}

- (unint64_t)rows
{
  return self->_rows;
}

- (void)setRows:(unint64_t)a3
{
  self->_rows = a3;
}

- (unint64_t)layoutMode
{
  return self->_layoutMode;
}

- (void)setLayoutMode:(unint64_t)a3
{
  self->_layoutMode = a3;
}

- (BOOL)paginated
{
  return self->_paginated;
}

- (void)setPaginated:(BOOL)a3
{
  self->_paginated = a3;
}

- (unint64_t)verticalPlacement
{
  return self->_verticalPlacement;
}

- (void)setVerticalPlacement:(unint64_t)a3
{
  self->_verticalPlacement = a3;
}

- (UIEdgeInsets)gradientInsets
{
  double bottom;
  double right;
  double top;
  double left;
  UIEdgeInsets result;

  bottom = self->_insets.bottom;
  right = self->_insets.right;
  top = self->_gradientInsets.top;
  left = self->_gradientInsets.left;
  result.right = left;
  result.bottom = top;
  result.left = right;
  result.top = bottom;
  return result;
}

- (void)setGradientInsets:(UIEdgeInsets)a3
{
  *(UIEdgeInsets *)&self->_insets.bottom = a3;
}

- (UIEdgeInsets)gradientFraction
{
  double bottom;
  double right;
  double top;
  double left;
  UIEdgeInsets result;

  bottom = self->_gradientInsets.bottom;
  right = self->_gradientInsets.right;
  top = self->_gradientFraction.top;
  left = self->_gradientFraction.left;
  result.right = left;
  result.bottom = top;
  result.left = right;
  result.top = bottom;
  return result;
}

- (void)setGradientFraction:(UIEdgeInsets)a3
{
  *(UIEdgeInsets *)&self->_gradientInsets.bottom = a3;
}

- (TUISnap)widthSnap
{
  return self->_widthSnap;
}

- (void)setWidthSnap:(id)a3
{
  objc_storeStrong((id *)&self->_widthSnap, a3);
}

- (BOOL)balanceSections
{
  return self->_balanceSections;
}

- (void)setBalanceSections:(BOOL)a3
{
  self->_balanceSections = a3;
}

- (BOOL)truncate
{
  return self->_truncate;
}

- (void)setTruncate:(BOOL)a3
{
  self->_truncate = a3;
}

- (unint64_t)maxPages
{
  return self->_maxPages;
}

- (void)setMaxPages:(unint64_t)a3
{
  self->_maxPages = a3;
}

- (BOOL)acceptsDrop
{
  return self->_acceptsDrop;
}

- (void)setAcceptsDrop:(BOOL)a3
{
  self->_acceptsDrop = a3;
}

- (TUIElementActionTriggerHandler)dropHandler
{
  return self->_dropHandler;
}

- (void)setDropHandler:(id)a3
{
  objc_storeStrong((id *)&self->_dropHandler, a3);
}

- (double)decelerationRate
{
  return self->_decelerationRate;
}

- (void)setDecelerationRate:(double)a3
{
  self->_decelerationRate = a3;
}

- (NSDictionary)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (TUIScrollingBox)scrollBox
{
  return self->_scrollBox;
}

- (TUISmartGridContentBox)content
{
  return self->_content;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_scrollBox, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_dropHandler, 0);
  objc_storeStrong((id *)&self->_widthSnap, 0);
  objc_storeStrong((id *)&self->_columns, 0);
  objc_storeStrong((id *)&self->_modelIdentifierForScrollable, 0);
}

@end
