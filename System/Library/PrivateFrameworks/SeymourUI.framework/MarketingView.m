@implementation MarketingView

- (UIImageView)logoImageView
{
  return (UIImageView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                + OBJC_IVAR____TtC9SeymourUI13MarketingView_logoImageView));
}

- (_TtC9SeymourUI13MarketingView)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI13MarketingView *)sub_22B7BAADC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI13MarketingView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B7BF4C4();
}

- (void)layoutSubviews
{
  _TtC9SeymourUI13MarketingView *v2;

  v2 = self;
  sub_22B7BB82C();

}

- (void)actionItemButtonTapped:(id)a3
{
  id v4;
  _TtC9SeymourUI13MarketingView *v5;

  v4 = a3;
  v5 = self;
  sub_22B7BCED8(v4);

}

- (void)dismissButtonTapped:(id)a3
{
  id v4;
  _TtC9SeymourUI13MarketingView *v5;

  v4 = a3;
  v5 = self;
  sub_22B7BF7D8();

}

- (void).cxx_destruct
{
  sub_22B119BC0((uint64_t)self + OBJC_IVAR____TtC9SeymourUI13MarketingView_delegate);
  sub_22B0FAA68(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI13MarketingView_onElementAppearance));
  sub_22B0FAA68(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI13MarketingView_onElementDisappearance));
  sub_22B0FAA68(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI13MarketingView_onVisibleBoundsChange));
  sub_22B0FAA68(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI13MarketingView_onImpressionableBoundsChange));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI13MarketingView_backgroundImageView));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI13MarketingView_supportingTextLabel));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_22B0FB1DC((uint64_t)self + OBJC_IVAR____TtC9SeymourUI13MarketingView_offer, (uint64_t *)&unk_255B84380);
  sub_22B0FB1DC((uint64_t)self + OBJC_IVAR____TtC9SeymourUI13MarketingView_pendingOffer, (uint64_t *)&unk_255B84380);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI13MarketingView_lastTappedActionItemButton));
}

@end
