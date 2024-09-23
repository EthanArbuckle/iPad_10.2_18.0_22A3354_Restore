@implementation VUIBaseView

- (void)layoutSubviews
{
  double v3;
  double v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VUIBaseView;
  -[VUIBaseView layoutSubviews](&v5, sel_layoutSubviews);
  -[VUIBaseView bounds](self, "bounds");
  -[VUIBaseView vui_layoutSubviews:computationOnly:](self, "vui_layoutSubviews:computationOnly:", 0, v3, v4);
}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VUIBaseView;
  -[VUIBaseView didMoveToWindow](&v3, sel_didMoveToWindow);
  -[VUIBaseView vui_didMoveToWindow](self, "vui_didMoveToWindow");
}

- (void)willMoveToWindow:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VUIBaseView;
  v4 = a3;
  -[VUIBaseView willMoveToWindow:](&v5, sel_willMoveToWindow_, v4);
  -[VUIBaseView vui_willMoveToWindow:](self, "vui_willMoveToWindow:", v4, v5.receiver, v5.super_class);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[VUIBaseView vui_layoutSubviews:computationOnly:](self, "vui_layoutSubviews:computationOnly:", 1, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

@end
