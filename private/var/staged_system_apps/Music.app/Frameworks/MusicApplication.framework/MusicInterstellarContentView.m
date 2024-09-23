@implementation MusicInterstellarContentView

- (_TtC16MusicApplication9BadgeView)badgeView
{
  return (_TtC16MusicApplication9BadgeView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                     + OBJC_IVAR___MusicInterstellarContentView_badgeView));
}

- (void)setBadgeView:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___MusicInterstellarContentView_badgeView);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___MusicInterstellarContentView_badgeView) = (Class)a3;
  v3 = a3;

}

- (UILabel)titleLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                            + OBJC_IVAR___MusicInterstellarContentView_titleLabel));
}

- (UILabel)subtitleLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                            + OBJC_IVAR___MusicInterstellarContentView_subtitleLabel));
}

- (SLAttributionView)pill
{
  return (SLAttributionView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                      + OBJC_IVAR___MusicInterstellarContentView_pill));
}

- (void)setPill:(id)a3
{
  MusicInterstellarContentView *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_63041C(a3);

}

- (MusicInterstellarContentView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_63048C();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  MusicInterstellarContentView *v4;
  id v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  width = a3.width;
  v4 = self;
  v5 = -[MusicInterstellarContentView traitCollection](v4, "traitCollection");
  v6 = objc_msgSend((id)objc_opt_self(UIFontMetrics), "defaultMetrics");
  v7 = (void *)static UIContentSizeCategory.default.getter();
  v8 = UIFontMetrics.scaledValue(for:traitCollection:noSmallerThan:noLargerThan:where:)(v5, v7, 118.0);

  v9 = width;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)layoutSubviews
{
  MusicInterstellarContentView *v2;

  v2 = self;
  sub_627C04();

}

- (MusicInterstellarContentView)initWithFrame:(CGRect)a3
{
  MusicInterstellarContentView *result;

  result = (MusicInterstellarContentView *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.ContentView", 28, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_5C0DC((uint64_t)self + OBJC_IVAR___MusicInterstellarContentView_typedConfiguration, _s17CellConfigurationVMa);

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicInterstellarContentView____lazy_storage___mediaPickerAddButton));
}

@end
