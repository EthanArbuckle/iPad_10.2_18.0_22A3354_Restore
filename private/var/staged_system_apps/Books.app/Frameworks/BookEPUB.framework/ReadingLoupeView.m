@implementation ReadingLoupeView

- (_TtC8BookEPUB16ReadingLoupeView)initWithFrame:(CGRect)a3
{
  return (_TtC8BookEPUB16ReadingLoupeView *)ReadingLoupeView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8BookEPUB16ReadingLoupeView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_4C26C();
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  return 0;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8BookEPUB16ReadingLoupeView_readingLoupeViewShadowView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8BookEPUB16ReadingLoupeView_readingLoupeViewGradientLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8BookEPUB16ReadingLoupeView_readingLoupeViewInnerStrokeLayer));
}

@end
