@implementation TTRContainerWrappingView

- (CGSize)calculateArrangedSizeFittingSize:(CGSize)a3
{
  double height;
  double width;
  _TtC15RemindersUICore24TTRContainerWrappingView *v5;
  double v6;
  double v7;
  RemindersUICore::TTRWrappingArrangement::Layout v8;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  TTRContainerWrappingView.makeWrappingArrangement(bounds:)(0.0, 0.0, width, height);
  TTRWrappingArrangement.computeLayout()(&v8);
  swift_release();
  sub_1B4790B0C((uint64_t)&v8);

  v6 = v8.usedRect.size.width;
  v7 = v8.usedRect.size.height;
  result.height = v7;
  result.width = v6;
  return result;
}

- (void)layoutArrangedSubviewsInBounds:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  _TtC15RemindersUICore24TTRContainerWrappingView *v7;
  __C::CGRect v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  v8.origin.x = x;
  v8.origin.y = y;
  v8.size.width = width;
  v8.size.height = height;
  TTRContainerWrappingView.layoutArrangedSubviews(inBounds:)(v8);

}

- (BOOL)isLayoutSizeDependentOnPerpendicularAxis
{
  return 1;
}

- (_TtC15RemindersUICore24TTRContainerWrappingView)initWithFrame:(CGRect)a3
{
  return (_TtC15RemindersUICore24TTRContainerWrappingView *)TTRContainerWrappingView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC15RemindersUICore24TTRContainerWrappingView)initWithArrangedSubviews:(id)a3
{
  uint64_t v3;

  if (a3)
  {
    sub_1B43BE384();
    v3 = sub_1B4906DAC();
  }
  else
  {
    v3 = 0;
  }
  return (_TtC15RemindersUICore24TTRContainerWrappingView *)TTRContainerWrappingView.init(arrangedSubviews:)(v3);
}

- (_TtC15RemindersUICore24TTRContainerWrappingView)initWithCoder:(id)a3
{
  return (_TtC15RemindersUICore24TTRContainerWrappingView *)TTRContainerWrappingView.init(coder:)(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore24TTRContainerWrappingView_viewsRequiringNewRows));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore24TTRContainerWrappingView_customSpacingByView));
}

@end
