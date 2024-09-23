@implementation TPLCDTextViewScrollingView

- (TPLCDTextViewScrollingView)initWithFrame:(CGRect)a3 owner:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  TPLCDTextViewScrollingView *v11;
  TPLCDTextViewScrollingView *v12;
  objc_super v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)TPLCDTextViewScrollingView;
  v11 = -[TPLCDTextViewScrollingView initWithFrame:](&v14, sel_initWithFrame_, x, y, width, height);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_owner, a4);
    -[TPLCDTextViewScrollingView setOpaque:](v12, "setOpaque:", 0);
  }

  return v12;
}

- (void)setOwner:(id)a3
{
  objc_storeStrong((id *)&self->_owner, a3);
}

- (void)drawRect:(CGRect)a3
{
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

  -[TPLCDTextViewScrollingView bounds](self, "bounds", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[TPLCDTextView bounds](self->_owner, "bounds");
  v13 = v12;
  v14 = v9 - (v12 + 30.0);
  -[TPLCDTextView _drawTextInRect:verticallyOffset:](self->_owner, "_drawTextInRect:verticallyOffset:", 0, v5, v7, v14, v11);
  -[TPLCDTextView _drawTextInRect:verticallyOffset:](self->_owner, "_drawTextInRect:verticallyOffset:", 0, v5 + v14 + 30.0, v7, v13, v11);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_owner, 0);
}

@end
