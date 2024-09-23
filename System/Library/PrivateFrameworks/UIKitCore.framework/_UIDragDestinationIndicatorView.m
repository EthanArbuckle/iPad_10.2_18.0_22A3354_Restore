@implementation _UIDragDestinationIndicatorView

- (_UIDragDestinationIndicatorView)initWithSourceListStyle:(BOOL)a3
{
  _UIDragDestinationIndicatorView *v4;
  _UIDragDestinationIndicatorView *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UIDragDestinationIndicatorView;
  v4 = -[UIView initWithFrame:](&v8, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v5 = v4;
  if (v4)
  {
    v4->_isSourceList = a3;
    v4->_scaleFactor = 1.0;
    +[UIColor clearColor](UIColor, "clearColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v5, "setBackgroundColor:", v6);

    -[UIView setContentMode:](v5, "setContentMode:", 3);
  }
  return v5;
}

- (void)positionVerticallyCenteredInFrame:(CGRect)a3
{
  CGFloat height;
  double width;
  CGFloat y;
  double x;
  double v8;
  double v9;
  double v10;
  CGRect v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[_UIDragDestinationIndicatorView scaleFactor](self, "scaleFactor");
  v9 = 10.0;
  if (!self->_isSourceList)
    v9 = 2.0;
  v10 = v8 * v9;
  v11.origin.x = x;
  v11.origin.y = y;
  v11.size.width = width;
  v11.size.height = height;
  -[UIView setFrame:](self, "setFrame:", x, CGRectGetMidY(v11) + v10 * -0.5, width, v10);
}

- (void)positionOnCellFrame:(CGRect)a3 above:(BOOL)a4
{
  double width;
  double x;
  double MinY;

  width = a3.size.width;
  x = a3.origin.x;
  if (a4)
    MinY = CGRectGetMinY(a3);
  else
    MinY = CGRectGetMaxY(a3);
  -[_UIDragDestinationIndicatorView positionVerticallyCenteredInFrame:](self, "positionVerticallyCenteredInFrame:", x, MinY, width, 0.0);
}

- (void)positionHorizontallyCenteredInFrame:(CGRect)a3
{
  double height;
  CGFloat width;
  double y;
  CGFloat x;
  double v8;
  double v9;
  CGRect v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[_UIDragDestinationIndicatorView scaleFactor](self, "scaleFactor");
  v9 = v8 + v8;
  v10.origin.x = x;
  v10.origin.y = y;
  v10.size.width = width;
  v10.size.height = height;
  -[UIView setFrame:](self, "setFrame:", CGRectGetMidX(v10) + v9 * -0.5, y, v9, height);
}

- (void)drawRect:(CGRect)a3
{
  double v4;
  double v5;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v10;
  double MinX;
  double MidY;
  double MaxX;
  double MaxY;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  id v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;

  -[_UIDragDestinationIndicatorView scaleFactor](self, "scaleFactor", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  -[UIView bounds](self, "bounds");
  x = v25.origin.x;
  y = v25.origin.y;
  width = v25.size.width;
  height = v25.size.height;
  v10 = CGRectGetHeight(v25);
  v26.origin.x = x;
  v26.origin.y = y;
  v26.size.width = width;
  v26.size.height = height;
  if (v10 <= CGRectGetWidth(v26))
  {
    v31.origin.x = x;
    v31.origin.y = y;
    v31.size.width = width;
    v31.size.height = height;
    MinX = CGRectGetMinX(v31);
    v32.origin.x = x;
    v32.origin.y = y;
    v32.size.width = width;
    v32.size.height = height;
    MidY = CGRectGetMidY(v32);
    v33.origin.x = x;
    v33.origin.y = y;
    v33.size.width = width;
    v33.size.height = height;
    MaxX = CGRectGetMaxX(v33);
    v34.origin.x = x;
    v34.origin.y = y;
    v34.size.width = width;
    v34.size.height = height;
    MaxY = CGRectGetMidY(v34);
  }
  else
  {
    v27.origin.x = x;
    v27.origin.y = y;
    v27.size.width = width;
    v27.size.height = height;
    MinX = CGRectGetMidX(v27);
    v28.origin.x = x;
    v28.origin.y = y;
    v28.size.width = width;
    v28.size.height = height;
    MidY = CGRectGetMinY(v28);
    v29.origin.x = x;
    v29.origin.y = y;
    v29.size.width = width;
    v29.size.height = height;
    MaxX = CGRectGetMidX(v29);
    v30.origin.x = x;
    v30.origin.y = y;
    v30.size.width = width;
    v30.size.height = height;
    MaxY = CGRectGetMaxY(v30);
  }
  v15 = MaxY;
  if (self->_isSourceList)
  {
    v16 = MaxX + v5 * -8.0;
    v17 = v5 + v5;
    if ((*((_DWORD *)&self->super._viewFlags + 4) & 0x80000) == 0)
      v16 = v5 + v5 + MinX;
    v18 = MidY + v5 * -3.0;
    v19 = v5 * 6.0;
    +[UIBezierPath bezierPathWithOvalInRect:](UIBezierPath, "bezierPathWithOvalInRect:", v16, v18, v19, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v19 + v17;
    v22 = -0.0;
    if ((*((_DWORD *)&self->super._viewFlags + 4) & 0x80000) == 0)
      v22 = v19 + v17;
    MinX = MinX + v22;
    if ((*((_DWORD *)&self->super._viewFlags + 4) & 0x80000) == 0)
      v21 = 0.0;
    MaxX = MaxX - v21;
  }
  else
  {
    +[UIBezierPath bezierPath](UIBezierPath, "bezierPath");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v5 + v5;
  }
  v24 = v20;
  objc_msgSend(v20, "moveToPoint:", MinX, MidY);
  objc_msgSend(v24, "addLineToPoint:", MaxX, v15);
  -[UIView tintColor](self, "tintColor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "set");

  objc_msgSend(v24, "setLineWidth:", v17);
  objc_msgSend(v24, "stroke");

}

- (NSIndexPath)currentIndexPath
{
  return self->_currentIndexPath;
}

- (void)setCurrentIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->_currentIndexPath, a3);
}

- (BOOL)isSourceList
{
  return self->_isSourceList;
}

- (void)setIsSourceList:(BOOL)a3
{
  self->_isSourceList = a3;
}

- (double)scaleFactor
{
  return self->_scaleFactor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentIndexPath, 0);
}

@end
