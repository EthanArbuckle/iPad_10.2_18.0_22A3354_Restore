@implementation PXNoContentGadgetView

- (PXNoContentGadgetView)initWithFrame:(CGRect)a3
{
  PXNoContentGadgetView *v3;
  PXNoContentGadgetView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXNoContentGadgetView;
  v3 = -[_UIContentUnavailableView initWithFrame:title:style:](&v6, sel_initWithFrame_title_style_, &stru_1E5149688, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[PXNoContentGadgetView setBackgroundColor:](v3, "setBackgroundColor:", 0);
  return v4;
}

@end
