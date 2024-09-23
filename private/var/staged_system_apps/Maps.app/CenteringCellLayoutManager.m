@implementation CenteringCellLayoutManager

+ (id)layoutManagerForTableViewCellStyle:(int64_t)a3
{
  return objc_msgSend(objc_alloc((Class)a1), "initWithTableViewCellStyle:", a3);
}

- (CenteringCellLayoutManager)initWithTableViewCellStyle:(int64_t)a3
{
  CenteringCellLayoutManager *v3;
  CenteringCellLayoutManager *v4;
  CenteringCellLayoutManager *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CenteringCellLayoutManager;
  v3 = -[CenteringCellLayoutManager init](&v7, "init", a3);
  v4 = v3;
  if (v3)
  {
    v3->_maximumCellContentWidth = 1.79769313e308;
    v5 = v3;
  }

  return v4;
}

- (CGRect)contentRectForCell:(id)a3 forState:(unint64_t)a4 rowWidth:(double)a5
{
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  objc_super v33;
  CGRect result;

  v33.receiver = self;
  v33.super_class = (Class)CenteringCellLayoutManager;
  v8 = a3;
  -[CenteringCellLayoutManager contentRectForCell:forState:rowWidth:](&v33, "contentRectForCell:forState:rowWidth:", v8, a4, a5);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  -[CenteringCellLayoutManager accessoryEndingRectForCell:forNewEditingState:showingDeleteConfirmation:](self, "accessoryEndingRectForCell:forNewEditingState:showingDeleteConfirmation:", v8, objc_msgSend(v8, "isEditing"), objc_msgSend(v8, "showingDeleteConfirmation"));
  -[CenteringCellLayoutManager _adjustedContentViewFrame:cell:rowWidth:accessoryViewFrame:](self, "_adjustedContentViewFrame:cell:rowWidth:accessoryViewFrame:", v8, v10, v12, v14, v16, a5, v17, v18, v19, v20, v33.receiver, v33.super_class);
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;

  v29 = v22;
  v30 = v24;
  v31 = v26;
  v32 = v28;
  result.size.height = v32;
  result.size.width = v31;
  result.origin.y = v30;
  result.origin.x = v29;
  return result;
}

- (CGRect)contentStartingRectForCell:(id)a3 forNewEditingState:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  objc_super v35;
  CGRect v36;
  CGRect result;

  v4 = a4;
  v35.receiver = self;
  v35.super_class = (Class)CenteringCellLayoutManager;
  v6 = a3;
  -[CenteringCellLayoutManager contentStartingRectForCell:forNewEditingState:](&v35, "contentStartingRectForCell:forNewEditingState:", v6, v4);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[CenteringCellLayoutManager accessoryStartingRectForCell:forNewEditingState:showingDeleteConfirmation:](self, "accessoryStartingRectForCell:forNewEditingState:showingDeleteConfirmation:", v6, v4, objc_msgSend(v6, "showingDeleteConfirmation"));
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  objc_msgSend(v6, "bounds");
  -[CenteringCellLayoutManager _adjustedContentViewFrame:cell:rowWidth:accessoryViewFrame:](self, "_adjustedContentViewFrame:cell:rowWidth:accessoryViewFrame:", v6, v8, v10, v12, v14, CGRectGetWidth(v36), v16, v18, v20, v22, v35.receiver, v35.super_class);
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v30 = v29;

  v31 = v24;
  v32 = v26;
  v33 = v28;
  v34 = v30;
  result.size.height = v34;
  result.size.width = v33;
  result.origin.y = v32;
  result.origin.x = v31;
  return result;
}

- (CGRect)contentEndingRectForCell:(id)a3 forNewEditingState:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  objc_super v35;
  CGRect v36;
  CGRect result;

  v4 = a4;
  v35.receiver = self;
  v35.super_class = (Class)CenteringCellLayoutManager;
  v6 = a3;
  -[CenteringCellLayoutManager contentEndingRectForCell:forNewEditingState:](&v35, "contentEndingRectForCell:forNewEditingState:", v6, v4);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[CenteringCellLayoutManager accessoryEndingRectForCell:forNewEditingState:showingDeleteConfirmation:](self, "accessoryEndingRectForCell:forNewEditingState:showingDeleteConfirmation:", v6, v4, objc_msgSend(v6, "showingDeleteConfirmation"));
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  objc_msgSend(v6, "bounds");
  -[CenteringCellLayoutManager _adjustedContentViewFrame:cell:rowWidth:accessoryViewFrame:](self, "_adjustedContentViewFrame:cell:rowWidth:accessoryViewFrame:", v6, v8, v10, v12, v14, CGRectGetWidth(v36), v16, v18, v20, v22, v35.receiver, v35.super_class);
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v30 = v29;

  v31 = v24;
  v32 = v26;
  v33 = v28;
  v34 = v30;
  result.size.height = v34;
  result.size.width = v33;
  result.origin.y = v32;
  result.origin.x = v31;
  return result;
}

- (CGRect)_adjustedContentViewFrame:(CGRect)a3 cell:(id)a4 rowWidth:(double)a5 accessoryViewFrame:(CGRect)a6
{
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;
  UIUserInterfaceLayoutDirection v14;
  double v15;
  double v16;
  CGFloat v17;
  CGFloat v18;
  double MaxX;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGFloat y;
  CGFloat height;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect result;

  y = a3.origin.y;
  height = a3.size.height;
  v8 = a4;
  -[CenteringCellLayoutManager _marginForRowWith:](self, "_marginForRowWith:", a5);
  v10 = v9;
  v12 = v11;
  v13 = objc_msgSend(v8, "semanticContentAttribute");

  v14 = +[UIView userInterfaceLayoutDirectionForSemanticContentAttribute:](UIView, "userInterfaceLayoutDirectionForSemanticContentAttribute:", v13);
  if (v14 == UIUserInterfaceLayoutDirectionRightToLeft)
    v15 = v12;
  else
    v15 = v10;
  v16 = a5 - (v10 + v12);
  v31.origin.x = CGRectZero.origin.x;
  v31.origin.y = CGRectZero.origin.y;
  v31.size.width = CGRectZero.size.width;
  v31.size.height = CGRectZero.size.height;
  if (CGRectEqualToRect(v31, a6))
  {
    v18 = y;
    v17 = height;
  }
  else if (v14 == UIUserInterfaceLayoutDirectionRightToLeft)
  {
    MaxX = CGRectGetMaxX(a6);
    v32.origin.x = v12;
    v18 = y;
    v17 = height;
    v32.origin.y = y;
    v32.size.width = v16;
    v32.size.height = height;
    v20 = MaxX - CGRectGetMinX(v32);
    -[CenteringCellLayoutManager minimumHorizontalMargins](self, "minimumHorizontalMargins");
    v16 = v16 - (v20 + v21);
    v15 = v12 + v20 + v21;
  }
  else
  {
    v33.origin.x = v10;
    v33.origin.y = y;
    v33.size.width = v16;
    v33.size.height = height;
    v28 = CGRectGetMaxX(v33);
    v18 = y;
    v17 = height;
    v22 = v28 - CGRectGetMinX(a6);
    -[CenteringCellLayoutManager minimumHorizontalMargins](self, "minimumHorizontalMargins");
    v16 = v16 - (v22 + v23);
    v15 = v10;
  }
  v24 = v15;
  v25 = v18;
  v26 = v16;
  v27 = v17;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (CGRect)accessoryStartingRectForCell:(id)a3 forNewEditingState:(BOOL)a4 showingDeleteConfirmation:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  objc_super v21;
  CGRect result;

  v5 = a5;
  v6 = a4;
  v21.receiver = self;
  v21.super_class = (Class)CenteringCellLayoutManager;
  v8 = a3;
  -[CenteringCellLayoutManager accessoryStartingRectForCell:forNewEditingState:showingDeleteConfirmation:](&v21, "accessoryStartingRectForCell:forNewEditingState:showingDeleteConfirmation:", v8, v6, v5);
  -[CenteringCellLayoutManager _offsetAccessoryViewFrame:forCell:](self, "_offsetAccessoryViewFrame:forCell:", v8, v21.receiver, v21.super_class);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  v17 = v10;
  v18 = v12;
  v19 = v14;
  v20 = v16;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (CGRect)accessoryEndingRectForCell:(id)a3 forNewEditingState:(BOOL)a4 showingDeleteConfirmation:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  objc_super v21;
  CGRect result;

  v5 = a5;
  v6 = a4;
  v21.receiver = self;
  v21.super_class = (Class)CenteringCellLayoutManager;
  v8 = a3;
  -[CenteringCellLayoutManager accessoryEndingRectForCell:forNewEditingState:showingDeleteConfirmation:](&v21, "accessoryEndingRectForCell:forNewEditingState:showingDeleteConfirmation:", v8, v6, v5);
  -[CenteringCellLayoutManager _offsetAccessoryViewFrame:forCell:](self, "_offsetAccessoryViewFrame:forCell:", v8, v21.receiver, v21.super_class);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  v17 = v10;
  v18 = v12;
  v19 = v14;
  v20 = v16;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (CGRect)_offsetAccessoryViewFrame:(CGRect)a3 forCell:(id)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v9;
  double v10;
  double v11;
  double MaxX;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;
  CGRect result;
  CGRect v22;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v17.origin.x = CGRectZero.origin.x;
  v17.origin.y = CGRectZero.origin.y;
  v17.size.width = CGRectZero.size.width;
  v17.size.height = CGRectZero.size.height;
  v22.origin.x = x;
  v22.origin.y = y;
  v22.size.width = width;
  v22.size.height = height;
  v10 = x;
  if (!CGRectEqualToRect(v17, v22))
  {
    objc_msgSend(v9, "bounds");
    -[CenteringCellLayoutManager _marginForRowWith:](self, "_marginForRowWith:", CGRectGetWidth(v18));
    v10 = v11;
    if ((id)+[UIView userInterfaceLayoutDirectionForSemanticContentAttribute:](UIView, "userInterfaceLayoutDirectionForSemanticContentAttribute:", objc_msgSend(v9, "semanticContentAttribute")) != (id)1)
    {
      objc_msgSend(v9, "bounds");
      MaxX = CGRectGetMaxX(v19);
      v20.origin.x = x;
      v20.origin.y = y;
      v20.size.width = width;
      v20.size.height = height;
      v10 = MaxX - CGRectGetWidth(v20) - v10;
    }
  }

  v13 = v10;
  v14 = y;
  v15 = width;
  v16 = height;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (UIEdgeInsets)_marginForRowWith:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  UIEdgeInsets result;

  -[CenteringCellLayoutManager maximumCellContentWidth](self, "maximumCellContentWidth");
  v6 = a3 - v5;
  -[CenteringCellLayoutManager minimumHorizontalMargins](self, "minimumHorizontalMargins");
  v8 = v7;
  -[CenteringCellLayoutManager minimumHorizontalMargins](self, "minimumHorizontalMargins");
  if (v6 <= v8 + v9)
  {
    -[CenteringCellLayoutManager minimumHorizontalMargins](self, "minimumHorizontalMargins");
  }
  else
  {
    v10 = v6 * 0.5;
    v11 = 0.0;
    v12 = v6 * 0.5;
    v13 = 0.0;
  }
  result.right = v12;
  result.bottom = v13;
  result.left = v10;
  result.top = v11;
  return result;
}

- (double)maximumCellContentWidth
{
  return self->_maximumCellContentWidth;
}

- (void)setMaximumCellContentWidth:(double)a3
{
  self->_maximumCellContentWidth = a3;
}

- (UIEdgeInsets)minimumHorizontalMargins
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_minimumHorizontalMargins.top;
  left = self->_minimumHorizontalMargins.left;
  bottom = self->_minimumHorizontalMargins.bottom;
  right = self->_minimumHorizontalMargins.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setMinimumHorizontalMargins:(UIEdgeInsets)a3
{
  self->_minimumHorizontalMargins = a3;
}

@end
