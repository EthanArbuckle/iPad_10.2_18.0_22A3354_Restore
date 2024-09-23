@implementation UIDebuggingZoomLineView

- (void)updateLabelFrame
{
  unint64_t v3;
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
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  id v34;

  v3 = -[UIDebuggingZoomLineView direction](self, "direction");
  if (v3 == 1)
  {
    -[UIDebuggingZoomLineView start](self, "start");
    v21 = v20;
    -[UIDebuggingZoomLineView end](self, "end");
    v23 = v22;
    -[UIDebuggingZoomLineView start](self, "start");
    v25 = v21 + (v23 - v24) * 0.5 + -25.0;
    -[UIDebuggingZoomLineView start](self, "start");
    v27 = v26 + 2.0;
    if (v25 < 0.0)
      v25 = 2.0;
    if (v27 >= 0.0)
      v28 = v27;
    else
      v28 = 2.0;
    -[UIDebuggingZoomLineView lineLabel](self, "lineLabel");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setFrame:", v25, v28, 50.0, 20.0);

    v15 = (void *)MEMORY[0x1E0CB3940];
    -[UIDebuggingZoomLineView end](self, "end");
    v31 = v30;
    -[UIDebuggingZoomLineView start](self, "start");
    v19 = v31 - v32;
  }
  else
  {
    if (v3)
      return;
    -[UIDebuggingZoomLineView start](self, "start");
    v5 = v4 + 2.0;
    -[UIDebuggingZoomLineView start](self, "start");
    v7 = v6;
    -[UIDebuggingZoomLineView end](self, "end");
    v9 = v8;
    -[UIDebuggingZoomLineView start](self, "start");
    v11 = v7 + (v9 - v10) * 0.5 + -10.0;
    if (v5 >= 0.0)
      v12 = v5;
    else
      v12 = 2.0;
    if (v11 >= 0.0)
      v13 = v11;
    else
      v13 = 2.0;
    -[UIDebuggingZoomLineView lineLabel](self, "lineLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setFrame:", v12, v13, 50.0, 20.0);

    v15 = (void *)MEMORY[0x1E0CB3940];
    -[UIDebuggingZoomLineView end](self, "end");
    v17 = v16;
    -[UIDebuggingZoomLineView start](self, "start");
    v19 = v17 - v18;
  }
  objc_msgSend(v15, "stringWithFormat:", CFSTR("%.1f"), *(_QWORD *)&v19);
  v34 = (id)objc_claimAutoreleasedReturnValue();
  -[UIDebuggingZoomLineView lineLabel](self, "lineLabel");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setText:", v34);

}

- (void)setStart:(CGPoint)a3
{
  self->_start = a3;
  -[UIView setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)setEnd:(CGPoint)a3
{
  self->_end = a3;
  -[UIView setNeedsDisplay](self, "setNeedsDisplay");
}

- (UIDebuggingZoomLineView)initWithFrame:(CGRect)a3
{
  UIDebuggingZoomLineView *v3;
  void *v4;
  UILabel *v5;
  void *v6;
  UILabel *lineLabel;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)UIDebuggingZoomLineView;
  v3 = -[UIView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    +[UIColor clearColor](UIColor, "clearColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    -[UIView setOpaque:](v3, "setOpaque:", 0);
    v5 = objc_alloc_init(UILabel);
    -[UIDebuggingZoomLineView setLineLabel:](v3, "setLineLabel:", v5);

    +[UIColor redColor](UIColor, "redColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v3->_lineLabel, "setTextColor:", v6);

    -[UILabel setTextAlignment:](v3->_lineLabel, "setTextAlignment:", 0);
    lineLabel = v3->_lineLabel;
    objc_msgSend(off_1E167A828, "systemFontOfSize:", 9.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](lineLabel, "setFont:", v8);

    -[UIView addSubview:](v3, "addSubview:", v3->_lineLabel);
    -[UIDebuggingZoomLineView setRect:](v3, "setRect:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  }
  return v3;
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v8;
  _QWORD *ContextStack;
  CGContext *v10;
  double v11;
  CGFloat v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  CGFloat v16;
  CGRect v17;
  CGRect v18;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIDebuggingZoomLineView updateLabelFrame](self, "updateLabelFrame");
  +[UIColor redColor](UIColor, "redColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "set");

  ContextStack = GetContextStack(0);
  if (*(int *)ContextStack < 1)
    v10 = 0;
  else
    v10 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
  v17.origin.x = x;
  v17.origin.y = y;
  v17.size.width = width;
  v17.size.height = height;
  CGContextClearRect(v10, v17);
  CGContextSetLineWidth(v10, 0.5);
  -[UIDebuggingZoomLineView start](self, "start");
  v12 = v11;
  -[UIDebuggingZoomLineView start](self, "start");
  CGContextMoveToPoint(v10, v12, v13);
  -[UIDebuggingZoomLineView end](self, "end");
  v15 = v14;
  -[UIDebuggingZoomLineView end](self, "end");
  CGContextAddLineToPoint(v10, v15, v16);
  CGContextStrokePath(v10);
  -[UIDebuggingZoomLineView rect](self, "rect");
  CGContextStrokeRect(v10, v18);
}

- (CGPoint)start
{
  double x;
  double y;
  CGPoint result;

  x = self->_start.x;
  y = self->_start.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGPoint)end
{
  double x;
  double y;
  CGPoint result;

  x = self->_end.x;
  y = self->_end.y;
  result.y = y;
  result.x = x;
  return result;
}

- (unint64_t)direction
{
  return self->_direction;
}

- (void)setDirection:(unint64_t)a3
{
  self->_direction = a3;
}

- (CGRect)rect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_rect.origin.x;
  y = self->_rect.origin.y;
  width = self->_rect.size.width;
  height = self->_rect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setRect:(CGRect)a3
{
  self->_rect = a3;
}

- (UILabel)lineLabel
{
  return self->_lineLabel;
}

- (void)setLineLabel:(id)a3
{
  objc_storeStrong((id *)&self->_lineLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lineLabel, 0);
}

@end
