@implementation VideoHeaderLockupView

- (_TtC16MusicApplication21VideoHeaderLockupView)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication21VideoHeaderLockupView *)sub_5A01FC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication21VideoHeaderLockupView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_5A27F8();
}

- (void)layoutSubviews
{
  _TtC16MusicApplication21VideoHeaderLockupView *v2;

  v2 = self;
  sub_5A1214();

}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  sub_5A1A94(self, (uint64_t)a2, a3, a4, (SEL *)&selRef_touchesBegan_withEvent_, 1, 2);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  sub_5A1A94(self, (uint64_t)a2, a3, a4, (SEL *)&selRef_touchesEnded_withEvent_, 0, 0);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  sub_5A1A94(self, (uint64_t)a2, a3, a4, (SEL *)&selRef_touchesCancelled_withEvent_, 0, 0);
}

- (_TtC16MusicApplication12ProgressView)accessibilityProgressView
{
  return (_TtC16MusicApplication12ProgressView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                         + OBJC_IVAR____TtC16MusicApplication21VideoHeaderLockupView_progressView));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication21VideoHeaderLockupView_lockupImageArtworkCatalog));
  sub_18A2AC((uint64_t)self + OBJC_IVAR____TtC16MusicApplication21VideoHeaderLockupView_artworkCornerTreatment);
  sub_9AFF4(*(void **)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication21VideoHeaderLockupView_artworkPlaceholder), *(void **)&self->lockupImageArtworkCatalog[OBJC_IVAR____TtC16MusicApplication21VideoHeaderLockupView_artworkPlaceholder], *(void **)&self->artworkPlaceholder[OBJC_IVAR____TtC16MusicApplication21VideoHeaderLockupView_artworkPlaceholder], *(void **)&self->artworkPlaceholder[OBJC_IVAR____TtC16MusicApplication21VideoHeaderLockupView_artworkPlaceholder + 8]);
  sub_5C198(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication21VideoHeaderLockupView_playButtonHandler), *(_QWORD *)&self->lockupImageArtworkCatalog[OBJC_IVAR____TtC16MusicApplication21VideoHeaderLockupView_playButtonHandler]);
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication21VideoHeaderLockupView_artworkComponent));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication21VideoHeaderLockupView_artworkCachingReference));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication21VideoHeaderLockupView_textDrawingCache));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication21VideoHeaderLockupView_playButton));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication21VideoHeaderLockupView_textComponents));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication21VideoHeaderLockupView_durationTextStackView));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication21VideoHeaderLockupView_tapGestureRecognizerHandler));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication21VideoHeaderLockupView_gradientView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication21VideoHeaderLockupView_progressView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication21VideoHeaderLockupView_checkmarkImageView));
}

@end
