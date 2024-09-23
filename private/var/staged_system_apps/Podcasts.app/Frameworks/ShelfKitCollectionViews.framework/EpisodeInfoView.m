@implementation EpisodeInfoView

- (_TtC23ShelfKitCollectionViews15EpisodeInfoView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1BD538();
}

- (void)willMoveToWindow:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  v4 = v6.receiver;
  v5 = a3;
  -[EpisodeInfoView willMoveToWindow:](&v6, "willMoveToWindow:", v5);
  if (v5)
  {
    EpisodeInfoView.beginUpdates()();

  }
}

- (void)didMoveToWindow
{
  _TtC23ShelfKitCollectionViews15EpisodeInfoView *v2;

  v2 = self;
  EpisodeInfoView.didMoveToWindow()();

}

- (BOOL)accessibilityIsNowPlayingIndicatorVisible
{
  return *((_BYTE *)&self->super.super.super.super.isa
         + OBJC_IVAR____TtC23ShelfKitCollectionViews15EpisodeInfoView_accessibilityIsNowPlayingIndicatorVisible);
}

- (void)setAccessibilityIsNowPlayingIndicatorVisible:(BOOL)a3
{
  *((_BYTE *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC23ShelfKitCollectionViews15EpisodeInfoView_accessibilityIsNowPlayingIndicatorVisible) = a3;
}

- (_TtC23ShelfKitCollectionViews15EpisodeInfoView)initWithFrame:(CGRect)a3
{
  _TtC23ShelfKitCollectionViews15EpisodeInfoView *result;

  result = (_TtC23ShelfKitCollectionViews15EpisodeInfoView *)_swift_stdlib_reportUnimplementedInitializer("ShelfKitCollectionViews.EpisodeInfoView", 39, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC23ShelfKitCollectionViews15EpisodeInfoView_capabilities));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews15EpisodeInfoView_titleAction));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews15EpisodeInfoView_playbackStatusObservance));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews15EpisodeInfoView_nowPlayingIndicator));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews15EpisodeInfoView_nowPlayingIndicatorHeight));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews15EpisodeInfoView_eyebrowPlayedCheckmark));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews15EpisodeInfoView_eyebrowLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews15EpisodeInfoView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews15EpisodeInfoView_descriptionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews15EpisodeInfoView_footerLabel));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews15EpisodeInfoView_playStatePublisher));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews15EpisodeInfoView____lazy_storage___headerStack));
  sub_10DBC8((uint64_t)self + OBJC_IVAR____TtC23ShelfKitCollectionViews15EpisodeInfoView_delegate);
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews15EpisodeInfoView_explicitContentPresenter));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC23ShelfKitCollectionViews15EpisodeInfoView_eyebrowBuilderCancellables));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews15EpisodeInfoView_eyebrowBuilder));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews15EpisodeInfoView_footerBuilder));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews15EpisodeInfoView_objectGraph));
}

- (_TtC23ShelfKitCollectionViews16DynamicTypeLabel)accessibilityEyebrowLabel
{
  return (_TtC23ShelfKitCollectionViews16DynamicTypeLabel *)*(id *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews15EpisodeInfoView_eyebrowLabel);
}

- (_TtC23ShelfKitCollectionViews16DynamicTypeLabel)accessibilityTitleLabel
{
  id *v2;
  _BYTE v4[24];

  v2 = (id *)((char *)&self->super.super.super.super.isa
            + OBJC_IVAR____TtC23ShelfKitCollectionViews15EpisodeInfoView_titleLabel);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews15EpisodeInfoView_titleLabel, v4, 0, 0);
  return (_TtC23ShelfKitCollectionViews16DynamicTypeLabel *)*v2;
}

- (_TtC23ShelfKitCollectionViews16DynamicTypeLabel)accessibilityDescriptionLabel
{
  return (_TtC23ShelfKitCollectionViews16DynamicTypeLabel *)*(id *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews15EpisodeInfoView_descriptionLabel);
}

- (_TtC23ShelfKitCollectionViews16DynamicTypeLabel)accessibilityFooterLabel
{
  return (_TtC23ShelfKitCollectionViews16DynamicTypeLabel *)*(id *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews15EpisodeInfoView_footerLabel);
}

- (void)titleTapped
{
  _TtC23ShelfKitCollectionViews15EpisodeInfoView *v2;

  v2 = self;
  sub_1BB1DC();

}

@end
