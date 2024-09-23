@implementation MessageIndicatorView

- (_TtC11TelephonyUI20MessageIndicatorView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1BCFDC6A4();
}

- (void)layoutSubviews
{
  _TtC11TelephonyUI20MessageIndicatorView *v2;

  v2 = self;
  sub_1BCFDAD00();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v5;
  _TtC11TelephonyUI20MessageIndicatorView *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC11TelephonyUI20MessageIndicatorView_titleLabel);
  v6 = self;
  objc_msgSend(v5, sel_sizeThatFits_, width, height);
  v8 = v7;
  v9 = *(double *)((char *)&v6->super.super.super.isa + OBJC_IVAR____TtC11TelephonyUI20MessageIndicatorView_textPadding);

  v10 = v8 + v9 + v9;
  v11 = width;
  result.height = v10;
  result.width = v11;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC11TelephonyUI20MessageIndicatorView *v6;

  v5 = a3;
  v6 = self;
  sub_1BCFDB1B0(a3);

}

- (void)handleTapGesture
{
  _TtC11TelephonyUI20MessageIndicatorView *v2;

  v2 = self;
  sub_1BCFDBA8C();

}

- (_TtC11TelephonyUI20MessageIndicatorView)initWithFrame:(CGRect)a3
{
  _TtC11TelephonyUI20MessageIndicatorView *result;

  result = (_TtC11TelephonyUI20MessageIndicatorView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11TelephonyUI20MessageIndicatorView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11TelephonyUI20MessageIndicatorView_durationLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11TelephonyUI20MessageIndicatorView_recordImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11TelephonyUI20MessageIndicatorView____lazy_storage___backgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11TelephonyUI20MessageIndicatorView_viewModel));
  sub_1BCFDA32C(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC11TelephonyUI20MessageIndicatorView_tapHandler));
}

@end
