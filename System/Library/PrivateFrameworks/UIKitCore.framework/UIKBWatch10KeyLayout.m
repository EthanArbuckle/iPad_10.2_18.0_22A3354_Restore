@implementation UIKBWatch10KeyLayout

- (UIKBWatch10KeyLayout)initWithFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  UIKBWatch10KeyLayout *v7;
  UIKBWatch10KeyLayout *v8;
  objc_super v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)UIKBWatch10KeyLayout;
  v7 = -[UIKBWatch10KeyLayout init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_frame.origin.x = x;
    v7->_frame.origin.y = y;
    v7->_frame.size.width = width;
    v7->_frame.size.height = height;
    -[UIKBWatch10KeyLayout setLeftControlKeys:](v7, "setLeftControlKeys:", 1);
    -[UIKBWatch10KeyLayout setRightControlKeys:](v8, "setRightControlKeys:", 1);
    -[UIKBWatch10KeyLayout setGridRows:](v8, "setGridRows:", 1);
    -[UIKBWatch10KeyLayout setGridColumns:](v8, "setGridColumns:", 1);
    -[UIKBWatch10KeyLayout setControlKeyWidthRatio:](v8, "setControlKeyWidthRatio:", 1.0);
  }
  return v8;
}

- (CGRect)frameForLeftControlKeyAt:(int64_t)a3
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  -[NSArray objectAtIndexedSubscript:](self->_leftControlKeyFrames, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rectValue");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (CGRect)frameForRightControlKeyAt:(int64_t)a3
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  -[NSArray objectAtIndexedSubscript:](self->_rightControlKeyFrames, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rectValue");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (CGRect)frameForGridKeyAt:(int64_t)a3 inRow:(int64_t)a4
{
  void *v5;
  void *v6;
  double v7;
  double v8;
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
  CGRect result;

  -[NSMutableArray objectAtIndexedSubscript:](self->_gridKeyFrames, "objectAtIndexedSubscript:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rectValue");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v15 = v8;
  v16 = v10;
  v17 = v12;
  v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (void)layout
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double y;
  double x;
  double height;
  double v12;
  double v13;
  double v14;
  double v15;
  NSArray *v16;
  NSArray *leftControlKeyFrames;
  double v18;
  NSMutableArray *v19;
  NSMutableArray *gridKeyFrames;
  void *v21;
  double v22;
  double v23;
  int64_t v24;
  void *v25;
  uint64_t v26;
  CGFloat v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  NSArray *v35;
  NSArray *rightControlKeyFrames;
  _QWORD v37[4];

  -[UIKBWatch10KeyLayout controlKeyWidthRatio](self, "controlKeyWidthRatio");
  -[UIKBWatch10KeyLayout gridColumns](self, "gridColumns");
  +[UIScreen mainScreen](UIScreen, "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  UIRoundToScreenScale(v3);
  v5 = v4;

  -[UIKBWatch10KeyLayout controlKeyWidthRatio](self, "controlKeyWidthRatio");
  +[UIScreen mainScreen](UIScreen, "mainScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  UIRoundToScreenScale(v6);
  v8 = v7;

  x = self->_frame.origin.x;
  y = self->_frame.origin.y;
  height = self->_frame.size.height;
  -[UIKBWatch10KeyLayout leftControlKeysInsets](self, "leftControlKeysInsets");
  -[UIKBWatch10KeyLayout layoutControlKeys:in:](self, "layoutControlKeys:in:", -[UIKBWatch10KeyLayout leftControlKeys](self, "leftControlKeys"), x + v12, y + v13, v8 - (v12 + v14), height - (v13 + v15));
  v16 = (NSArray *)objc_claimAutoreleasedReturnValue();
  leftControlKeyFrames = self->_leftControlKeyFrames;
  self->_leftControlKeyFrames = v16;

  v18 = v8 + x;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[UIKBWatch10KeyLayout gridColumns](self, "gridColumns"));
  v19 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  gridKeyFrames = self->_gridKeyFrames;
  self->_gridKeyFrames = v19;

  -[UIKBWatch10KeyLayout gridRows](self, "gridRows");
  +[UIScreen mainScreen](UIScreen, "mainScreen");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  UIRoundToScreenScale(v21);
  v23 = v22;

  if (-[UIKBWatch10KeyLayout gridColumns](self, "gridColumns") >= 1)
  {
    v24 = 0;
    do
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[UIKBWatch10KeyLayout gridColumns](self, "gridColumns"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[UIKBWatch10KeyLayout gridRows](self, "gridRows") >= 1)
      {
        v26 = 0;
        do
        {
          v27 = self->_frame.origin.y + v23 * (double)v26;
          *(double *)v37 = v18;
          *(CGFloat *)&v37[1] = v27;
          *(double *)&v37[2] = v5;
          *(double *)&v37[3] = v23;
          objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v37, "{CGRect={CGPoint=dd}{CGSize=dd}}");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "addObject:", v28);

          ++v26;
        }
        while (v26 < -[UIKBWatch10KeyLayout gridRows](self, "gridRows"));
      }
      -[NSMutableArray addObject:](self->_gridKeyFrames, "addObject:", v25);
      v18 = v5 + v18;

      ++v24;
    }
    while (v24 < -[UIKBWatch10KeyLayout gridColumns](self, "gridColumns"));
  }
  v29 = self->_frame.origin.y;
  v30 = self->_frame.size.height;
  -[UIKBWatch10KeyLayout rightControlKeysInsets](self, "rightControlKeysInsets");
  -[UIKBWatch10KeyLayout layoutControlKeys:in:](self, "layoutControlKeys:in:", -[UIKBWatch10KeyLayout rightControlKeys](self, "rightControlKeys"), v18 + v31, v29 + v32, v8 - (v31 + v33), v30 - (v32 + v34));
  v35 = (NSArray *)objc_claimAutoreleasedReturnValue();
  rightControlKeyFrames = self->_rightControlKeyFrames;
  self->_rightControlKeyFrames = v35;

}

- (id)layoutControlKeys:(int64_t)a3 in:(CGRect)a4
{
  CGFloat width;
  double y;
  CGFloat x;
  void *v8;
  void *v9;
  double v10;
  double v11;
  uint64_t v12;
  void *v13;
  _QWORD v15[4];

  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIScreen mainScreen](UIScreen, "mainScreen");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  UIRoundToScreenScale(v9);
  v11 = v10;

  if (a3 >= 1)
  {
    v12 = 0;
    do
    {
      *(CGFloat *)v15 = x;
      *(double *)&v15[1] = y + v11 * (double)v12;
      *(CGFloat *)&v15[2] = width;
      *(double *)&v15[3] = v11;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v15, "{CGRect={CGPoint=dd}{CGSize=dd}}");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v13);

      ++v12;
    }
    while (a3 != v12);
  }
  return v8;
}

- (int64_t)leftControlKeys
{
  return self->_leftControlKeys;
}

- (void)setLeftControlKeys:(int64_t)a3
{
  self->_leftControlKeys = a3;
}

- (UIEdgeInsets)leftControlKeysInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_leftControlKeysInsets.top;
  left = self->_leftControlKeysInsets.left;
  bottom = self->_leftControlKeysInsets.bottom;
  right = self->_leftControlKeysInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setLeftControlKeysInsets:(UIEdgeInsets)a3
{
  self->_leftControlKeysInsets = a3;
}

- (int64_t)gridRows
{
  return self->_gridRows;
}

- (void)setGridRows:(int64_t)a3
{
  self->_gridRows = a3;
}

- (int64_t)gridColumns
{
  return self->_gridColumns;
}

- (void)setGridColumns:(int64_t)a3
{
  self->_gridColumns = a3;
}

- (int64_t)rightControlKeys
{
  return self->_rightControlKeys;
}

- (void)setRightControlKeys:(int64_t)a3
{
  self->_rightControlKeys = a3;
}

- (UIEdgeInsets)rightControlKeysInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_rightControlKeysInsets.top;
  left = self->_rightControlKeysInsets.left;
  bottom = self->_rightControlKeysInsets.bottom;
  right = self->_rightControlKeysInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setRightControlKeysInsets:(UIEdgeInsets)a3
{
  self->_rightControlKeysInsets = a3;
}

- (double)controlKeyWidthRatio
{
  return self->_controlKeyWidthRatio;
}

- (void)setControlKeyWidthRatio:(double)a3
{
  self->_controlKeyWidthRatio = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gridKeyFrames, 0);
  objc_storeStrong((id *)&self->_rightControlKeyFrames, 0);
  objc_storeStrong((id *)&self->_leftControlKeyFrames, 0);
}

@end
