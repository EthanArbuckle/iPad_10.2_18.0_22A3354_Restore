@implementation MFMessageInfoSectionBackgroundDecorationView

- (MFMessageInfoSectionBackgroundDecorationView)initWithFrame:(CGRect)a3
{
  MFMessageInfoSectionBackgroundDecorationView *v4;
  void *v5;
  void *v6;
  objc_super v8;
  CGRect v9;
  CGRect v10;

  -[MFMessageInfoSectionBackgroundDecorationView bounds](self, "bounds", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v10 = CGRectInset(v9, 20.0, 20.0);
  v8.receiver = self;
  v8.super_class = (Class)MFMessageInfoSectionBackgroundDecorationView;
  v4 = -[MFMessageInfoSectionBackgroundDecorationView initWithFrame:](&v8, "initWithFrame:", v10.origin.x, v10.origin.y, v10.size.width, v10.size.height);
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tableCellGroupedBackgroundColor](UIColor, "tableCellGroupedBackgroundColor"));
    -[MFMessageInfoSectionBackgroundDecorationView setBackgroundColor:](v4, "setBackgroundColor:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageInfoSectionBackgroundDecorationView layer](v4, "layer"));
    objc_msgSend(v6, "setCornerRadius:", 10.0);

  }
  return v4;
}

@end
