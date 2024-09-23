@implementation TrackCellView

- (NSString)title
{
  return (NSString *)sub_10001DBE0((char *)self, (uint64_t)a2, &OBJC_IVAR____TtC16MusicMessagesApp13TrackCellView__titleLabel);
}

- (void)setTitle:(id)a3
{
  sub_10001DC7C(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_10001DB24);
}

- (BOOL)isExplicit
{
  return objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa+ OBJC_IVAR____TtC16MusicMessagesApp13TrackCellView__explicitLabel), "isHidden") ^ 1;
}

- (void)setIsExplicit:(BOOL)a3
{
  int v3;
  void *v4;
  _TtC16MusicMessagesApp13TrackCellView *v5;

  v3 = a3;
  v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC16MusicMessagesApp13TrackCellView__explicitLabel);
  v5 = self;
  if (objc_msgSend(v4, "isHidden") == v3)
  {
    objc_msgSend(v4, "setHidden:", v3 ^ 1u);
    -[TrackCellView setNeedsLayout](v5, "setNeedsLayout");
  }

}

- (NSString)artist
{
  return (NSString *)sub_10001DBE0((char *)self, (uint64_t)a2, &OBJC_IVAR____TtC16MusicMessagesApp13TrackCellView__artistLabel);
}

- (void)setArtist:(id)a3
{
  sub_10001DC7C(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_10001DCDC);
}

- (BOOL)isNowPlaying
{
  return objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa+ OBJC_IVAR____TtC16MusicMessagesApp13TrackCellView__nowPlayingLabel), "isHidden") ^ 1;
}

- (void)setIsNowPlaying:(BOOL)a3
{
  void *v3;
  _BOOL8 v4;
  _TtC16MusicMessagesApp13TrackCellView *v5;

  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC16MusicMessagesApp13TrackCellView__nowPlayingLabel);
  v4 = !a3;
  v5 = self;
  objc_msgSend(v3, "setHidden:", v4);
  objc_msgSend(*(id *)((char *)&v5->super.super.super.super.super.super.isa+ OBJC_IVAR____TtC16MusicMessagesApp13TrackCellView__nowPlayingIndicatorDimmingView), "setHidden:", v4);
  objc_msgSend(*(id *)((char *)&v5->super.super.super.super.super.super.isa+ OBJC_IVAR____TtC16MusicMessagesApp13TrackCellView__nowPlayingIndicatorView), "setHidden:", v4);
  -[TrackCellView setNeedsLayout](v5, "setNeedsLayout");

}

- (_TtC16MusicMessagesApp13TrackCellView)initWithFrame:(CGRect)a3
{
  _TtC16MusicMessagesApp13TrackCellView *result;

  sub_10001DEEC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return result;
}

- (_TtC16MusicMessagesApp13TrackCellView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10001FC50();
}

- (void)dealloc
{
  void *v3;
  _TtC16MusicMessagesApp13TrackCellView *v4;
  id v5;
  objc_super v6;

  v3 = (void *)objc_opt_self(NSNotificationCenter);
  v4 = self;
  v5 = objc_msgSend(v3, "defaultCenter");
  objc_msgSend(v5, "removeObserver:", v4);

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for TrackCellView();
  -[TrackCellView dealloc](&v6, "dealloc");
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                         + OBJC_IVAR____TtC16MusicMessagesApp13TrackCellView_artworkComponent));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicMessagesApp13TrackCellView__explicitLabel));
  sub_10000DCF8(*(uint64_t *)((char *)&self->super.super.super.super.super.super.isa+ OBJC_IVAR____TtC16MusicMessagesApp13TrackCellView_layoutInvalidationHandler), *(_QWORD *)&self->super.platterView[OBJC_IVAR____TtC16MusicMessagesApp13TrackCellView_layoutInvalidationHandler]);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicMessagesApp13TrackCellView__artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicMessagesApp13TrackCellView__nowPlayingIndicatorView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicMessagesApp13TrackCellView__nowPlayingIndicatorDimmingView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicMessagesApp13TrackCellView__nowPlayingLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicMessagesApp13TrackCellView__titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicMessagesApp13TrackCellView__artistLabel));
}

- (void)prepareForReuse
{
  _TtC16MusicMessagesApp13TrackCellView *v2;

  v2 = self;
  sub_10001EF54();

}

- (void)layoutSubviews
{
  _TtC16MusicMessagesApp13TrackCellView *v2;

  v2 = self;
  sub_10001F118();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC16MusicMessagesApp13TrackCellView *v6;

  v5 = a3;
  v6 = self;
  sub_10001F920(a3);

}

@end
