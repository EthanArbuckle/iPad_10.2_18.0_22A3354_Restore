@implementation EpisodeStateControlsStackView

- (void)layoutSubviews
{
  char *v2;
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)swift_getObjectType();
  v2 = (char *)v15.receiver;
  -[EpisodeStateControlsStackView layoutSubviews](&v15, "layoutSubviews");
  objc_msgSend(v2, "bounds", v15.receiver, v15.super_class);
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC23ShelfKitCollectionViews29EpisodeStateControlsStackView_moreButton], "frame");
  sub_2B618C(v4, v6, v8, v10, v11, v12, v13, v14);

}

- (_TtC23ShelfKitCollectionViews29EpisodeStateControlsStackView)initWithFrame:(CGRect)a3
{
  sub_2B72F4(0x800000000030B270, 122);
}

- (_TtC23ShelfKitCollectionViews29EpisodeStateControlsStackView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_2B72F4(0x8000000000307D10, 127);
}

- (_TtC23ShelfKitCollectionViews13BookmarkBadge)accessibilityBookmarkBadge
{
  return (_TtC23ShelfKitCollectionViews13BookmarkBadge *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                                                 + OBJC_IVAR____TtC23ShelfKitCollectionViews29EpisodeStateControlsStackView_bookmarkBadge));
}

- (_TtC23ShelfKitCollectionViews14DownloadButton)accessibilityDownloadBadge
{
  return (_TtC23ShelfKitCollectionViews14DownloadButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                                                  + OBJC_IVAR____TtC23ShelfKitCollectionViews29EpisodeStateControlsStackView_downloadBadge));
}

- (_TtC23ShelfKitCollectionViews24DynamicContextMenuButton)accessibilityMoreButton
{
  return (_TtC23ShelfKitCollectionViews24DynamicContextMenuButton *)*(id *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews29EpisodeStateControlsStackView_moreButton);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews29EpisodeStateControlsStackView_bookmarkBadge));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews29EpisodeStateControlsStackView_downloadBadge));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews29EpisodeStateControlsStackView_moreButton));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC23ShelfKitCollectionViews29EpisodeStateControlsStackView_currentVisibilities));
  sub_FA4C((uint64_t)self + OBJC_IVAR____TtC23ShelfKitCollectionViews29EpisodeStateControlsStackView_iconsSet, type metadata accessor for PlayControlsIconsSet);
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews29EpisodeStateControlsStackView_episodeStateControlsPresenter));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews29EpisodeStateControlsStackView_objectGraph));
}

@end
