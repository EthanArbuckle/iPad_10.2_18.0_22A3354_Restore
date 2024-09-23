@implementation EpisodeView

- (_TtC23ShelfKitCollectionViews35LegacyArtworkWithPlaybackStatusView)artworkViewWithPlayback
{
  return (_TtC23ShelfKitCollectionViews35LegacyArtworkWithPlaybackStatusView *)*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews11EpisodeView_artworkViewWithPlayback);
}

- (_TtC23ShelfKitCollectionViews21ButtonWithTouchInsets)summaryButton
{
  _TtC23ShelfKitCollectionViews11EpisodeView *v2;
  char *v3;

  v2 = self;
  v3 = sub_2C51AC();

  return (_TtC23ShelfKitCollectionViews21ButtonWithTouchInsets *)v3;
}

- (void)setSummaryButton:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC23ShelfKitCollectionViews11EpisodeView____lazy_storage___summaryButton);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews11EpisodeView____lazy_storage___summaryButton) = (Class)a3;
  v3 = a3;

}

- (void)moreButtonTapWithSender:(id)a3
{
  id v4;
  _TtC23ShelfKitCollectionViews11EpisodeView *v5;

  v4 = a3;
  v5 = self;
  sub_2C78CC((uint64_t)v4);

}

- (_TtC23ShelfKitCollectionViews11EpisodeView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_2CE57C();
}

- (void)tintColorDidChange
{
  _TtC23ShelfKitCollectionViews11EpisodeView *v2;

  v2 = self;
  sub_2C7A50();

}

- (void)titleTapped
{
  _TtC23ShelfKitCollectionViews11EpisodeView *v2;

  v2 = self;
  sub_2C7D2C();

}

- (void)layoutMarginsDidChange
{
  -[EpisodeView setNeedsLayout](self, "setNeedsLayout");
}

- (void)layoutSubviews
{
  _TtC23ShelfKitCollectionViews11EpisodeView *v2;

  v2 = self;
  sub_2C9598();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  _TtC23ShelfKitCollectionViews11EpisodeView *v5;

  v4 = a3;
  v5 = self;
  sub_2CF2DC();

}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6;
  _TtC23ShelfKitCollectionViews11EpisodeView *v7;
  _TtC23ShelfKitCollectionViews11EpisodeView *v8;
  _TtC23ShelfKitCollectionViews11EpisodeView *v9;
  _TtC23ShelfKitCollectionViews11EpisodeView *v10;
  uint64_t v11;
  char v12;

  v6 = a3;
  v7 = (_TtC23ShelfKitCollectionViews11EpisodeView *)a4;
  v8 = self;
  v9 = (_TtC23ShelfKitCollectionViews11EpisodeView *)-[EpisodeView view](v7, "view");
  if (v9)
  {
    v10 = v9;
    v11 = objc_opt_self(UIControl);
    v12 = swift_dynamicCastObjCClass(v10, v11) == 0;

    v7 = v8;
    v8 = v10;
  }
  else
  {
    v12 = 1;
  }

  return v12;
}

- (_TtC23ShelfKitCollectionViews19EpisodeCaptionLabel)accessibilityCaptionLabel
{
  return (_TtC23ShelfKitCollectionViews19EpisodeCaptionLabel *)*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews11EpisodeView_captionLabel);
}

- (_TtC23ShelfKitCollectionViews16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC23ShelfKitCollectionViews16DynamicTypeLabel *)*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews11EpisodeView_titleLabel);
}

- (UIView)accessibilitySummaryLabel
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                           + OBJC_IVAR____TtC23ShelfKitCollectionViews11EpisodeView_summaryLabel));
}

- (UIView)accessibilitySecondSummaryLabel
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                           + OBJC_IVAR____TtC23ShelfKitCollectionViews11EpisodeView_secondSummaryLabel));
}

- (_TtC23ShelfKitCollectionViews18PlaybackStatusView)accessibilityPlaybackView
{
  return (_TtC23ShelfKitCollectionViews18PlaybackStatusView *)*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews11EpisodeView_playbackView);
}

- (_TtC23ShelfKitCollectionViews21ButtonWithTouchInsets)accessibilitySummaryButton
{
  _TtC23ShelfKitCollectionViews11EpisodeView *v2;
  char *v3;

  v2 = self;
  v3 = sub_2C51AC();

  return (_TtC23ShelfKitCollectionViews21ButtonWithTouchInsets *)v3;
}

- (_TtC23ShelfKitCollectionViews16DynamicTypeLabel)accessibilityDurationLabel
{
  return (_TtC23ShelfKitCollectionViews16DynamicTypeLabel *)*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews11EpisodeView_durationLabel);
}

- (_TtC23ShelfKitCollectionViews11ArtworkView)accessibilityArtworkView
{
  return (_TtC23ShelfKitCollectionViews11ArtworkView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                               + OBJC_IVAR____TtC23ShelfKitCollectionViews11EpisodeView_artworkViewWithPlayback));
}

- (BOOL)accessibilityIsPlaying
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  _TtC23ShelfKitCollectionViews11EpisodeView *v7;
  _BYTE v10[24];

  v3 = type metadata accessor for EpisodePlayState(0);
  __chkstk_darwin(v3);
  v5 = &v10[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v6 = (uint64_t)self + OBJC_IVAR____TtC23ShelfKitCollectionViews11EpisodeView_playState;
  swift_beginAccess((char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews11EpisodeView_playState, v10, 0, 0);
  sub_19C4C(v6, (uint64_t)v5, (uint64_t (*)(_QWORD))&type metadata accessor for EpisodePlayState);
  v7 = self;
  LOBYTE(v6) = EpisodePlayState.isEpisodePlaying.getter(v7);
  sub_FA4C((uint64_t)v5, (uint64_t (*)(_QWORD))&type metadata accessor for EpisodePlayState);

  return v6 & 1;
}

- (UIButton)accessibilityContextButton
{
  return (UIButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                             + OBJC_IVAR____TtC23ShelfKitCollectionViews11EpisodeView_contextButton));
}

- (void)accessibilityPerformPlayPauseAction
{
  void *v3;
  _TtC23ShelfKitCollectionViews11EpisodeView *v4;
  id v5;

  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC23ShelfKitCollectionViews11EpisodeView_playButton);
  v5 = v3;
  v4 = self;
  sub_2C7464(v3);

}

- (_TtC23ShelfKitCollectionViews11EpisodeView)initWithFrame:(CGRect)a3
{
  _TtC23ShelfKitCollectionViews11EpisodeView *result;

  result = (_TtC23ShelfKitCollectionViews11EpisodeView *)_swift_stdlib_reportUnimplementedInitializer("ShelfKitCollectionViews.EpisodeView", 35, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_D1D4((uint64_t)self + OBJC_IVAR____TtC23ShelfKitCollectionViews11EpisodeView_libraryActionController, &qword_3DECA8);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews11EpisodeView_artworkContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews11EpisodeView_artworkViewWithPlayback));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews11EpisodeView_labelContainerMask));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews11EpisodeView_captionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews11EpisodeView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews11EpisodeView_summaryLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews11EpisodeView_secondSummaryLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews11EpisodeView_ordinalLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews11EpisodeView_durationLabel));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC23ShelfKitCollectionViews11EpisodeView_viewStylings));
  sub_2CDB20(*(uint64_t *)((char *)&self->super.super.super.isa
                        + OBJC_IVAR____TtC23ShelfKitCollectionViews11EpisodeView____lazy_storage___inlineNowPlayingIndicatorLayout));
  sub_14788(*(id *)&self->libraryActionController[OBJC_IVAR____TtC23ShelfKitCollectionViews11EpisodeView_detailToPlaybackViewSpacing+ 16], *(_QWORD *)&self->libraryActionController[OBJC_IVAR____TtC23ShelfKitCollectionViews11EpisodeView_detailToPlaybackViewSpacing+ 24], *(_QWORD *)&self->libraryActionController[OBJC_IVAR____TtC23ShelfKitCollectionViews11EpisodeView_detailToPlaybackViewSpacing+ 32], *(_QWORD *)&self->style[OBJC_IVAR____TtC23ShelfKitCollectionViews11EpisodeView_detailToPlaybackViewSpacing], *(_QWORD *)&self->artworkContainer[OBJC_IVAR____TtC23ShelfKitCollectionViews11EpisodeView_detailToPlaybackViewSpacing+ 4], *(_QWORD *)&self->artworkViewWithPlayback[OBJC_IVAR____TtC23ShelfKitCollectionViews11EpisodeView_detailToPlaybackViewSpacing+ 4], *(void **)&self->labelContainerMask[OBJC_IVAR____TtC23ShelfKitCollectionViews11EpisodeView_detailToPlaybackViewSpacing+ 4], *(_QWORD *)&self->captionLabel[OBJC_IVAR____TtC23ShelfKitCollectionViews11EpisodeView_detailToPlaybackViewSpacing+ 4], *(_QWORD *)&self->titleLabel[OBJC_IVAR____TtC23ShelfKitCollectionViews11EpisodeView_detailToPlaybackViewSpacing + 4], *(_QWORD *)&self->summaryLabel[OBJC_IVAR____TtC23ShelfKitCollectionViews11EpisodeView_detailToPlaybackViewSpacing+ 4], *(_QWORD *)&self->summaryLabel[OBJC_IVAR____TtC23ShelfKitCollectionViews11EpisodeView_detailToPlaybackViewSpacing
                                 + 12],
    *(_WORD *)&self->secondSummaryLabel[OBJC_IVAR____TtC23ShelfKitCollectionViews11EpisodeView_detailToPlaybackViewSpacing
                                      + 4]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews11EpisodeView_playbackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews11EpisodeView____lazy_storage___summaryButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews11EpisodeView_playButton));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews11EpisodeView_playAction));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews11EpisodeView_contextButton));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews11EpisodeView_contextAction));
  sub_1D618(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC23ShelfKitCollectionViews11EpisodeView_contentSizeChangeHandler), *(_QWORD *)&self->libraryActionController[OBJC_IVAR____TtC23ShelfKitCollectionViews11EpisodeView_contentSizeChangeHandler]);
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews11EpisodeView_titleAction));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews11EpisodeView_summaryAction));
  sub_FA4C((uint64_t)self + OBJC_IVAR____TtC23ShelfKitCollectionViews11EpisodeView_playState, (uint64_t (*)(_QWORD))&type metadata accessor for EpisodePlayState);
  swift_bridgeObjectRelease(*(_QWORD *)&self->libraryActionController[OBJC_IVAR____TtC23ShelfKitCollectionViews11EpisodeView_usedByPodcastUuid]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews11EpisodeView_backgroundView));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC23ShelfKitCollectionViews11EpisodeView_neighborsWithBackgrounds));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews11EpisodeView_selectableCellStorage));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews11EpisodeView_objectGraph));
}

@end
