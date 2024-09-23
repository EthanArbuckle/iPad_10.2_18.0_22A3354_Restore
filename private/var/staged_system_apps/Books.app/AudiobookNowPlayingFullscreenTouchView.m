@implementation AudiobookNowPlayingFullscreenTouchView

- (_TtC5Books38AudiobookNowPlayingFullscreenTouchView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100352588();
}

- (void)dealloc
{
  objc_class *v3;
  _TtC5Books38AudiobookNowPlayingFullscreenTouchView *v4;
  objc_super v5;
  _QWORD v6[4];

  v3 = (objc_class *)type metadata accessor for AudiobookNowPlayingFullscreenTouchView(0);
  v6[3] = v3;
  v6[0] = self;
  v4 = self;
  static UIAccessibility.removeAccessibilityStatusChangeObserver(_:)(v6);
  _s5Books15CurrentPageViewVwxx_0(v6);
  v5.receiver = v4;
  v5.super_class = v3;
  -[AudiobookNowPlayingFullscreenTouchView dealloc](&v5, "dealloc");
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  sub_1001FE9A0((uint64_t)self + OBJC_IVAR____TtC5Books38AudiobookNowPlayingFullscreenTouchView_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books38AudiobookNowPlayingFullscreenTouchView_viewModel));
  v3 = (char *)self + OBJC_IVAR____TtC5Books38AudiobookNowPlayingFullscreenTouchView_logger;
  v4 = type metadata accessor for Logger(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books38AudiobookNowPlayingFullscreenTouchView_playImage));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books38AudiobookNowPlayingFullscreenTouchView_pauseImage));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books38AudiobookNowPlayingFullscreenTouchView_scrubberImpactBehavior));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books38AudiobookNowPlayingFullscreenTouchView____lazy_storage___backgroundImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books38AudiobookNowPlayingFullscreenTouchView_artworkImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books38AudiobookNowPlayingFullscreenTouchView_artworkImageShadowView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books38AudiobookNowPlayingFullscreenTouchView_bottomToolbarContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books38AudiobookNowPlayingFullscreenTouchView_dismissButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books38AudiobookNowPlayingFullscreenTouchView_downloadIndicator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books38AudiobookNowPlayingFullscreenTouchView_downloadSpinner));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books38AudiobookNowPlayingFullscreenTouchView_downloadButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books38AudiobookNowPlayingFullscreenTouchView_grabberView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books38AudiobookNowPlayingFullscreenTouchView_hudTrack));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books38AudiobookNowPlayingFullscreenTouchView_loadingSpinner));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books38AudiobookNowPlayingFullscreenTouchView_overflowButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books38AudiobookNowPlayingFullscreenTouchView_played));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books38AudiobookNowPlayingFullscreenTouchView_progressSlider));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books38AudiobookNowPlayingFullscreenTouchView_playbackSpeed));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books38AudiobookNowPlayingFullscreenTouchView_primaryTitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books38AudiobookNowPlayingFullscreenTouchView_primaryTitleMarqueeView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books38AudiobookNowPlayingFullscreenTouchView_secondaryTitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books38AudiobookNowPlayingFullscreenTouchView_secondaryTitleMarqueeView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books38AudiobookNowPlayingFullscreenTouchView_sleepButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books38AudiobookNowPlayingFullscreenTouchView_toPlay));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books38AudiobookNowPlayingFullscreenTouchView_titlesContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books38AudiobookNowPlayingFullscreenTouchView_tocButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books38AudiobookNowPlayingFullscreenTouchView_transportContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books38AudiobookNowPlayingFullscreenTouchView_backgroundGradientLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books38AudiobookNowPlayingFullscreenTouchView_lowerHalfGradientLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books38AudiobookNowPlayingFullscreenTouchView__playPause));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books38AudiobookNowPlayingFullscreenTouchView__playPauseVibrancyEffectContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books38AudiobookNowPlayingFullscreenTouchView__skipForwardButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books38AudiobookNowPlayingFullscreenTouchView__skipForwardVibrancyEffectContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books38AudiobookNowPlayingFullscreenTouchView__skipBackwardButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books38AudiobookNowPlayingFullscreenTouchView__skipBackwardVibrancyEffectContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books38AudiobookNowPlayingFullscreenTouchView__toPlayInAudiobook));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books38AudiobookNowPlayingFullscreenTouchView__mainViewContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books38AudiobookNowPlayingFullscreenTouchView__transportSubcontainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books38AudiobookNowPlayingFullscreenTouchView__volumeContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books38AudiobookNowPlayingFullscreenTouchView__volumeMaxImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books38AudiobookNowPlayingFullscreenTouchView__volumeMinImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books38AudiobookNowPlayingFullscreenTouchView_buyButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books38AudiobookNowPlayingFullscreenTouchView__routeView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books38AudiobookNowPlayingFullscreenTouchView__volumeView));
  swift_bridgeObjectRelease(*(_QWORD *)&self->delegate[OBJC_IVAR____TtC5Books38AudiobookNowPlayingFullscreenTouchView_toPlayInAudiobookTextLong]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->delegate[OBJC_IVAR____TtC5Books38AudiobookNowPlayingFullscreenTouchView_toPlayInAudiobookTextShort]);
}

- (void)_traitCollectionDidChangeWithSender:(id)a3 previousTraitCollection:(id)a4
{
  id v7;
  _TtC5Books38AudiobookNowPlayingFullscreenTouchView *v8;
  _QWORD v9[4];

  swift_unknownObjectRetain(a3);
  v7 = a4;
  v8 = self;
  _bridgeAnyObjectToAny(_:)(a3);
  swift_unknownObjectRelease(a3);
  sub_100349240(a4);

  _s5Books15CurrentPageViewVwxx_0(v9);
}

- (void)layoutSubviews
{
  _TtC5Books38AudiobookNowPlayingFullscreenTouchView *v2;

  v2 = self;
  sub_10034A210();
  sub_10034AD4C();

}

- (void)relayoutSubviews
{
  -[AudiobookNowPlayingFullscreenTouchView setNeedsLayout](self, "setNeedsLayout");
}

- (_TtC5Books38AudiobookNowPlayingFullscreenTouchView)initWithFrame:(CGRect)a3
{
  _TtC5Books38AudiobookNowPlayingFullscreenTouchView *result;

  result = (_TtC5Books38AudiobookNowPlayingFullscreenTouchView *)_swift_stdlib_reportUnimplementedInitializer("Books.AudiobookNowPlayingFullscreenTouchView", 44, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void)cancelDownload:(id)a3
{
  sub_1003521A8((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_cancelDownload);
}

- (void)onClose:(id)a3
{
  uint64_t Strong;
  void *v6;
  _TtC5Books38AudiobookNowPlayingFullscreenTouchView *v7;

  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC5Books38AudiobookNowPlayingFullscreenTouchView_delegate);
  if (Strong)
  {
    v6 = (void *)Strong;
    swift_unknownObjectRetain(a3);
    v7 = self;
    objc_msgSend(v6, "close:", 1);
    swift_unknownObjectRelease(a3);

    swift_unknownObjectRelease(v6);
  }
}

- (void)onPlayPause:(id)a3
{
  sub_1003521A8((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_togglePlayPause);
}

- (void)onNarrationSpeed:(id)a3
{
  sub_100351ED8((char *)self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_10025836C);
}

- (void)onTOC:(id)a3
{
  sub_100351ED8((char *)self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_100258220);
}

- (void)setChapterProgress:(id)a3
{
  _TtC5Books38AudiobookNowPlayingFullscreenTouchView *v5;

  swift_unknownObjectRetain(a3);
  v5 = self;
  sub_100351F8C((uint64_t)a3);
  swift_unknownObjectRelease(a3);

}

- (void)skipBackwardTouchCancel:(id)a3
{
  sub_1003521A8((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_endSkipBackward);
}

- (void)skipBackwardStart:(id)a3
{
  sub_100352078(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_startSkipBackwardWithActionSource_);
}

- (void)skipBackwardTouchUpInside:(id)a3
{
  sub_1003521A8((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_endSkipBackward);
}

- (void)skipForwardTouchCancel:(id)a3
{
  sub_1003521A8((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_endSkipForward);
}

- (void)skipForwardStart:(id)a3
{
  sub_100352078(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_startSkipForwardWithActionSource_);
}

- (void)skipForwardTouchUpInside:(id)a3
{
  sub_1003521A8((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_endSkipForward);
}

- (void)startDownload:(id)a3
{
  sub_1003521A8((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_startDownload);
}

@end
