@implementation TVShowEpisodeDetailView

- (_TtC16MusicApplication23TVShowEpisodeDetailView)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication23TVShowEpisodeDetailView *)sub_543984(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication23TVShowEpisodeDetailView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_547E10();
}

- (CGRect)frame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  sub_188BF8(self, (uint64_t)a2, (SEL *)&selRef_frame);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC16MusicApplication23TVShowEpisodeDetailView *v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  sub_545238((SEL *)&selRef_frame, (SEL *)&selRef_setFrame_, x, y, width, height);

}

- (CGRect)bounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  sub_188BF8(self, (uint64_t)a2, (SEL *)&selRef_bounds);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC16MusicApplication23TVShowEpisodeDetailView *v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  sub_545238((SEL *)&selRef_bounds, (SEL *)&selRef_setBounds_, x, y, width, height);

}

- (void)layoutSubviews
{
  _TtC16MusicApplication23TVShowEpisodeDetailView *v2;

  v2 = self;
  sub_545364();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  id v5;
  id v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  v4 = a3;
  v5 = v7.receiver;
  -[TVShowEpisodeDetailView traitCollectionDidChange:](&v7, "traitCollectionDidChange:", v4);
  v6 = objc_msgSend(v5, "traitCollection", v7.receiver, v7.super_class);
  if (objc_msgSend(v6, "horizontalSizeClass"))
    sub_544ABC(v6);

}

- (UIControl)accessibilityContextualActionsButton
{
  return (UIControl *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                              + OBJC_IVAR____TtC16MusicApplication23TVShowEpisodeDetailView_contextualActionsButton));
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->headline[OBJC_IVAR____TtC16MusicApplication23TVShowEpisodeDetailView_headline]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->headline[OBJC_IVAR____TtC16MusicApplication23TVShowEpisodeDetailView_title]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->headline[OBJC_IVAR____TtC16MusicApplication23TVShowEpisodeDetailView_showName]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->headline[OBJC_IVAR____TtC16MusicApplication23TVShowEpisodeDetailView_descriptionText]);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC16MusicApplication23TVShowEpisodeDetailView_episodeInformationItems));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication23TVShowEpisodeDetailView_lockupImageArtworkCatalog));
  sub_9AFF4(*(void **)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication23TVShowEpisodeDetailView_artworkPlaceholder), *(void **)&self->headline[OBJC_IVAR____TtC16MusicApplication23TVShowEpisodeDetailView_artworkPlaceholder], *(void **)&self->headline[OBJC_IVAR____TtC16MusicApplication23TVShowEpisodeDetailView_artworkPlaceholder + 8], *(void **)&self->title[OBJC_IVAR____TtC16MusicApplication23TVShowEpisodeDetailView_artworkPlaceholder]);
  sub_5C198(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication23TVShowEpisodeDetailView_playButtonHandler), *(_QWORD *)&self->headline[OBJC_IVAR____TtC16MusicApplication23TVShowEpisodeDetailView_playButtonHandler]);
  sub_5C198(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication23TVShowEpisodeDetailView_showNameButtonHandler), *(_QWORD *)&self->headline[OBJC_IVAR____TtC16MusicApplication23TVShowEpisodeDetailView_showNameButtonHandler]);
  sub_5C198(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication23TVShowEpisodeDetailView_buildMenu), *(_QWORD *)&self->headline[OBJC_IVAR____TtC16MusicApplication23TVShowEpisodeDetailView_buildMenu]);
  sub_5C198(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication23TVShowEpisodeDetailView_layoutInvalidationHandler), *(_QWORD *)&self->headline[OBJC_IVAR____TtC16MusicApplication23TVShowEpisodeDetailView_layoutInvalidationHandler]);
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication23TVShowEpisodeDetailView_artworkCachingReference));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication23TVShowEpisodeDetailView_libraryAddKeepLocalStatusObserver));
  sub_64880((uint64_t)self+ OBJC_IVAR____TtC16MusicApplication23TVShowEpisodeDetailView_libraryAddKeepLocalStatusControllableDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication23TVShowEpisodeDetailView_headerLockupView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication23TVShowEpisodeDetailView_headlineLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication23TVShowEpisodeDetailView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication23TVShowEpisodeDetailView____lazy_storage___showNameButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication23TVShowEpisodeDetailView_descriptionTextView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication23TVShowEpisodeDetailView____lazy_storage___episodeInformationBadgingView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication23TVShowEpisodeDetailView_libraryAddKeepLocalControl));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication23TVShowEpisodeDetailView_contextualActionsButton));
}

@end
