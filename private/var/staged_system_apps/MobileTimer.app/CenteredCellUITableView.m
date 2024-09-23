@implementation CenteredCellUITableView

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  double height;
  _BOOL4 IsEmpty;
  double v19;
  double v20;
  double v21;
  double left;
  double bottom;
  double right;
  double v25;
  float v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  BOOL v32;
  BOOL v33;
  objc_super v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;

  v34.receiver = self;
  v34.super_class = (Class)CenteredCellUITableView;
  -[CenteredCellUITableView layoutSubviews](&v34, "layoutSubviews");
  -[CenteredCellUITableView rowHeight](self, "rowHeight");
  v4 = v3;
  -[CenteredCellUITableView sectionHeaderHeight](self, "sectionHeaderHeight");
  v6 = v4 + v5;
  -[CenteredCellUITableView sectionFooterHeight](self, "sectionFooterHeight");
  v8 = v6 + v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CenteredCellUITableView window](self, "window"));
  -[CenteredCellUITableView bounds](self, "bounds");
  objc_msgSend(v9, "convertRect:fromView:", self);
  v37.origin.x = v10;
  v37.origin.y = v11;
  v37.size.width = v12;
  v37.size.height = v13;
  v35 = CGRectIntersection(self->_keyboardFrame, v37);
  x = v35.origin.x;
  y = v35.origin.y;
  width = v35.size.width;
  height = v35.size.height;

  v36.origin.x = x;
  v36.origin.y = y;
  v36.size.width = width;
  v36.size.height = height;
  IsEmpty = CGRectIsEmpty(v36);
  v19 = 20.0;
  if (!IsEmpty)
    v19 = height;
  v20 = v8 + v19;
  if (height <= 0.0)
    v21 = 0.0;
  else
    v21 = v8;
  left = UIEdgeInsetsZero.left;
  bottom = UIEdgeInsetsZero.bottom;
  right = UIEdgeInsetsZero.right;
  -[CenteredCellUITableView bounds](self, "bounds");
  v26 = (v25 - v20) * 0.5 - v21;
  v27 = floorf(v26);
  -[CenteredCellUITableView contentInset](self, "contentInset");
  if (left != v31 || (v28 == v27 ? (v32 = right == v30) : (v32 = 0), v32 ? (v33 = bottom == v29) : (v33 = 0), !v33))
    -[CenteredCellUITableView setContentInset:](self, "setContentInset:", v27, left, bottom, right);
}

- (CGRect)keyboardFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_keyboardFrame.origin.x;
  y = self->_keyboardFrame.origin.y;
  width = self->_keyboardFrame.size.width;
  height = self->_keyboardFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setKeyboardFrame:(CGRect)a3
{
  self->_keyboardFrame = a3;
}

@end
