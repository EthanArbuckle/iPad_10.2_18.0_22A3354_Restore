@implementation _UIIndexBarScrollAccessoryContainerAdapterView

- (_UIIndexBarScrollAccessoryContainerAdapterView)initWithContents:(id)a3 delegatingToView:(id)a4
{
  id v6;
  id v7;
  _UIIndexBarScrollAccessoryContainerAdapterView *v8;
  _UIIndexBarScrollAccessoryContainerAdapterView *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_UIIndexBarScrollAccessoryContainerAdapterView;
  v8 = -[UIView initWithFrame:](&v11, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_delegatedView, a4);
    -[UIView addSubview:](v9, "addSubview:", v6);
    objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 1);
    -[UIView bounds](v9, "bounds");
    objc_msgSend(v6, "setFrame:");
    objc_msgSend(v6, "setAutoresizingMask:", 18);
  }

  return v9;
}

- (UIScrollView)scrollView
{
  return (UIScrollView *)-[UIScrollAccessory scrollView](self->_delegatedView, "scrollView");
}

- (void)setScrollView:(id)a3
{
  -[UIScrollAccessory setScrollView:](self->_delegatedView, "setScrollView:", a3);
}

- (int64_t)edge
{
  return -[UIScrollAccessory edge](self->_delegatedView, "edge");
}

- (void)setEdge:(int64_t)a3
{
  -[UIScrollAccessory setEdge:](self->_delegatedView, "setEdge:", a3);
}

- (BOOL)overlay
{
  return -[UIScrollAccessory overlay](self->_delegatedView, "overlay");
}

- (void)update
{
  -[UIScrollAccessory update](self->_delegatedView, "update");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[UIScrollAccessory sizeThatFits:](self->_delegatedView, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegatedView, 0);
}

@end
