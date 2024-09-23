@implementation SearchUITableViewCellDragSource

- (id)dragParametersForPreviewView:(id)a3
{
  id v4;
  void *v5;
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
  double v16;
  double v17;
  void *v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)SearchUITableViewCellDragSource;
  v4 = a3;
  -[SearchUIDragSource dragParametersForPreviewView:](&v20, sel_dragParametersForPreviewView_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUITableViewCellDragSource customEdgeInsets](self, "customEdgeInsets", v20.receiver, v20.super_class);
  v7 = v6;
  -[SearchUITableViewCellDragSource customEdgeInsets](self, "customEdgeInsets");
  v9 = v8;
  objc_msgSend(v4, "bounds");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRoundedRect:cornerRadius:", v11 + 0.0, v7 + v13, v15, v17 - (v7 + v9), 20.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setVisiblePath:", v18);

  return v5;
}

- (UIEdgeInsets)customEdgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_customEdgeInsets.top;
  left = self->_customEdgeInsets.left;
  bottom = self->_customEdgeInsets.bottom;
  right = self->_customEdgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setCustomEdgeInsets:(UIEdgeInsets)a3
{
  self->_customEdgeInsets = a3;
}

@end
