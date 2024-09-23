@implementation _UILabelViewTextAttachment

- (_UILabelViewTextAttachment)initWithViewProvider:(id)a3
{
  id v4;
  _UILabelViewTextAttachment *v5;
  uint64_t v6;
  id viewProvider;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UILabelViewTextAttachment;
  v5 = -[_UILabelViewTextAttachment initWithData:ofType:](&v9, sel_initWithData_ofType_, 0, 0);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    viewProvider = v5->_viewProvider;
    v5->_viewProvider = (id)v6;

  }
  return v5;
}

- (UIView)view
{
  UIView *view;
  void (**v4)(void);
  UIView *v5;
  UIView *v6;

  view = self->_view;
  if (!view)
  {
    -[_UILabelViewTextAttachment viewProvider](self, "viewProvider");
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v4[2]();
    v5 = (UIView *)objc_claimAutoreleasedReturnValue();
    v6 = self->_view;
    self->_view = v5;

    view = self->_view;
  }
  return view;
}

- (void)_drawInAlignedRect:(CGRect)a3 attributes:(id)a4 location:(id)a5 textContainer:(id)a6 applicationFrameworkContext:(int64_t)a7
{
  double height;
  double width;
  double y;
  double x;
  void *v12;
  void (**v13)(double, double, double, double);

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[_UILabelViewTextAttachment layoutInRect](self, "layoutInRect", a4, a5, a6, a7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[_UILabelViewTextAttachment layoutInRect](self, "layoutInRect");
    v13 = (void (**)(double, double, double, double))objc_claimAutoreleasedReturnValue();
    v13[2](floor(x + 0.5), floor(y - height + 0.5), width, height);

  }
}

- (id)viewProvider
{
  return self->_viewProvider;
}

- (void)setViewProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (id)layoutInRect
{
  return self->_layoutInRect;
}

- (void)setLayoutInRect:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_layoutInRect, 0);
  objc_storeStrong(&self->_viewProvider, 0);
  objc_storeStrong((id *)&self->_view, 0);
}

@end
