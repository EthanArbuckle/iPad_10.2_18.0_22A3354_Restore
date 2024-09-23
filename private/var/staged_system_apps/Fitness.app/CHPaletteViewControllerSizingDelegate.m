@implementation CHPaletteViewControllerSizingDelegate

- (UIView)view
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                           + OBJC_IVAR___CHPaletteViewControllerSizingDelegate_view));
}

- (void)setView:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___CHPaletteViewControllerSizingDelegate_view);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CHPaletteViewControllerSizingDelegate_view) = (Class)a3;
  v3 = a3;

}

- (CGRect)bounds
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___CHPaletteViewControllerSizingDelegate_view);
  if (v2)
  {
    objc_msgSend(v2, "bounds");
  }
  else
  {
    v5 = 0.0;
    v6 = 0.0;
    v3 = 0.0;
    v4 = 0.0;
  }
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGSize)size
{
  void *v2;
  double v3;
  double v4;
  CGSize result;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___CHPaletteViewControllerSizingDelegate_view);
  if (v2)
  {
    objc_msgSend(v2, "size");
  }
  else
  {
    v4 = 0.0;
    v3 = 0.0;
  }
  result.height = v4;
  result.width = v3;
  return result;
}

- (CHPaletteViewControllerSizingDelegate)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CHPaletteViewControllerSizingDelegate_view) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PaletteViewControllerSizingDelegate();
  return -[CHPaletteViewControllerSizingDelegate init](&v3, "init");
}

- (void).cxx_destruct
{

}

@end
