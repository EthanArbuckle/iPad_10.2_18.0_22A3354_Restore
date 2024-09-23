@implementation PRXCardContentContainerView

- (PRXCardContentContainerView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  PRXCardContentContainerView *v7;
  objc_super v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9.receiver = self;
  v9.super_class = (Class)PRXCardContentContainerView;
  v7 = -[PRXCardContentContainerView initWithFrame:](&v9, sel_initWithFrame_);
  -[PRXCardContentContainerView setOriginalFrame:](v7, "setOriginalFrame:", x, y, width, height);
  return v7;
}

- (void)layoutSubviews
{
  void *v3;
  uint64_t v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)PRXCardContentContainerView;
  -[PRXCardContentContainerView layoutSubviews](&v18, sel_layoutSubviews);
  -[PRXCardContentContainerView subviews](self, "subviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4 == 1)
  {
    -[PRXCardContentContainerView frame](self, "frame");
    v6 = v5;
    -[PRXCardContentContainerView subviews](self, "subviews");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "frame");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;
    -[PRXCardContentContainerView originalFrame](self, "originalFrame");
    if (v6 < v17 || v16 < v6)
      objc_msgSend(v8, "setFrame:", v10, v12, v14, v6);

  }
}

- (CGRect)originalFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_originalFrame.origin.x;
  y = self->_originalFrame.origin.y;
  width = self->_originalFrame.size.width;
  height = self->_originalFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setOriginalFrame:(CGRect)a3
{
  self->_originalFrame = a3;
}

@end
