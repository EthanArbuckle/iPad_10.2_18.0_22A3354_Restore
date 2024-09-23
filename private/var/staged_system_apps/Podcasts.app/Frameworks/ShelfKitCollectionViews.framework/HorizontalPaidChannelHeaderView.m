@implementation HorizontalPaidChannelHeaderView

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC23ShelfKitCollectionViews31HorizontalPaidChannelHeaderView *v6;

  v5 = a3;
  v6 = self;
  sub_460E0(a3);

}

- (_TtC23ShelfKitCollectionViews31HorizontalPaidChannelHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC23ShelfKitCollectionViews31HorizontalPaidChannelHeaderView *)sub_46250(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC23ShelfKitCollectionViews31HorizontalPaidChannelHeaderView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_49BFC();
}

- (void)buttonCaptionLabelTapped
{
  _TtC23ShelfKitCollectionViews31HorizontalPaidChannelHeaderView *v2;

  v2 = self;
  sub_487EC();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews31HorizontalPaidChannelHeaderView_logoView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews31HorizontalPaidChannelHeaderView____lazy_storage___leftVerticalStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews31HorizontalPaidChannelHeaderView____lazy_storage___rightVerticalStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews31HorizontalPaidChannelHeaderView_rightView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews31HorizontalPaidChannelHeaderView_lastColumnWidth));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews31HorizontalPaidChannelHeaderView____lazy_storage___subscribeButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews31HorizontalPaidChannelHeaderView____lazy_storage___descriptionLabelContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews31HorizontalPaidChannelHeaderView____lazy_storage___buttonCaptionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews31HorizontalPaidChannelHeaderView____lazy_storage___subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews31HorizontalPaidChannelHeaderView_benefitsTextLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews31HorizontalPaidChannelHeaderView_separatorView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews31HorizontalPaidChannelHeaderView_blurView));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews31HorizontalPaidChannelHeaderView_bannerModel));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews31HorizontalPaidChannelHeaderView_objectGraph));
}

@end
