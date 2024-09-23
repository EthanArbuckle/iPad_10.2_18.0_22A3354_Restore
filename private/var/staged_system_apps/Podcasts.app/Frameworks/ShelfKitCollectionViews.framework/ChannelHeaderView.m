@implementation ChannelHeaderView

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC23ShelfKitCollectionViews17ChannelHeaderView *v6;

  v5 = a3;
  v6 = self;
  sub_29BB1C(a3);

}

- (_TtC23ShelfKitCollectionViews17ChannelHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC23ShelfKitCollectionViews17ChannelHeaderView *)sub_29BD10(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC23ShelfKitCollectionViews17ChannelHeaderView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_29F058();
}

- (void)buttonCaptionLabelTapped
{
  _TtC23ShelfKitCollectionViews17ChannelHeaderView *v2;

  v2 = self;
  sub_29EABC();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews17ChannelHeaderView_logoView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews17ChannelHeaderView_upsellBanner));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews17ChannelHeaderView_bannerModel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews17ChannelHeaderView_verticalStack));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews17ChannelHeaderView____lazy_storage___subscribeButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews17ChannelHeaderView____lazy_storage___buttonCaptionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews17ChannelHeaderView____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews17ChannelHeaderView____lazy_storage___subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews17ChannelHeaderView____lazy_storage___benefitsTextLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews17ChannelHeaderView_blurView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews17ChannelHeaderView_separatorView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews17ChannelHeaderView_entitlementBadge));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews17ChannelHeaderView_objectGraph));
}

@end
