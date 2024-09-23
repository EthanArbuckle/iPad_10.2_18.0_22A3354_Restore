@implementation PlayControlsStackView

- (_TtC23ShelfKitCollectionViews21PlayControlsStackView)initWithFrame:(CGRect)a3
{
  sub_10D670(0x800000000030B270, 94);
}

- (_TtC23ShelfKitCollectionViews21PlayControlsStackView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10D670(0x8000000000307D10, 99);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC23ShelfKitCollectionViews21PlayControlsStackView *v6;
  _TtC23ShelfKitCollectionViews21PlayControlsStackView *v7;
  UITraitCollection_optional v8;

  v5 = a3;
  v6 = self;
  v8.is_nil = (char)v6;
  v7 = v6;
  v8.value.super.isa = (Class)a3;
  PlayControlsStackView.traitCollectionDidChange(_:)(v8);

}

- (CGSize)intrinsicContentSize
{
  uint64_t v2;
  _TtC23ShelfKitCollectionViews21PlayControlsStackView *v3;
  uint64_t v4;
  double v5;
  double v6;
  CGSize result;

  v2 = qword_3CF348;
  v3 = self;
  if (v2 != -1)
    swift_once(&qword_3CF348, sub_10BB04);
  v4 = qword_3D6C90;

  v5 = UIViewNoIntrinsicMetric;
  v6 = *(double *)&v4;
  result.height = v6;
  result.width = v5;
  return result;
}

- (int64_t)accessibilityPlayButtonState
{
  return *(int64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC23ShelfKitCollectionViews21PlayControlsStackView_accessibilityPlayButtonState);
}

- (void)setAccessibilityPlayButtonState:(int64_t)a3
{
  uint64_t v4;
  _TtC23ShelfKitCollectionViews21PlayControlsStackView *v5;

  v4 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC23ShelfKitCollectionViews21PlayControlsStackView_accessibilityPlayButtonState);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews21PlayControlsStackView_accessibilityPlayButtonState) = (Class)a3;
  v5 = self;
  PlayButtonState.rawValue.getter(a3);
  PlayButtonState.rawValue.getter(v4);

}

- (void).cxx_destruct
{
  sub_D1D4((uint64_t)self + OBJC_IVAR____TtC23ShelfKitCollectionViews21PlayControlsStackView_playPauseAction, (uint64_t *)&unk_3D30D0);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews21PlayControlsStackView_playButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews21PlayControlsStackView_oldPlayPauseButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews21PlayControlsStackView_playbackStatusView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews21PlayControlsStackView_episodeStateControls));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews21PlayControlsStackView_infoLabel));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews21PlayControlsStackView_playControlsPresenter));
  sub_10DBC8((uint64_t)self + OBJC_IVAR____TtC23ShelfKitCollectionViews21PlayControlsStackView_delegate);
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews21PlayControlsStackView_objectGraph));
}

- (UIButton)accessibilityPlayPauseButton
{
  return (UIButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                             + OBJC_IVAR____TtC23ShelfKitCollectionViews21PlayControlsStackView_oldPlayPauseButton));
}

- (_TtC23ShelfKitCollectionViews10PlayButton)accessibilityNewPlayPauseButton
{
  return (_TtC23ShelfKitCollectionViews10PlayButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                                              + OBJC_IVAR____TtC23ShelfKitCollectionViews21PlayControlsStackView_playButton));
}

- (_TtC23ShelfKitCollectionViews18PlaybackStatusView)accessibilityPlaybackStatusView
{
  return (_TtC23ShelfKitCollectionViews18PlaybackStatusView *)*(id *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews21PlayControlsStackView_playbackStatusView);
}

- (_TtC23ShelfKitCollectionViews29EpisodeStateControlsStackView)accessibilityEpisodeStateControls
{
  return (_TtC23ShelfKitCollectionViews29EpisodeStateControlsStackView *)*(id *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews21PlayControlsStackView_episodeStateControls);
}

- (void)performPlayPauseAction
{
  _TtC23ShelfKitCollectionViews21PlayControlsStackView *v2;

  v2 = self;
  PlayControlsStackView.performPlayPauseAction()();

}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  _TtC23ShelfKitCollectionViews21PlayControlsStackView *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGPoint v22;
  CGRect v23;

  v4 = a3;
  v5 = self;
  objc_msgSend(v4, "locationInView:", v5);
  v7 = v6;
  v9 = v8;
  v10 = OBJC_IVAR____TtC23ShelfKitCollectionViews21PlayControlsStackView_episodeStateControls;
  objc_msgSend(*(id *)((char *)&v5->super.super.super.super.isa+ OBJC_IVAR____TtC23ShelfKitCollectionViews21PlayControlsStackView_episodeStateControls), "frame");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  objc_msgSend(*(id *)((char *)&v5->super.super.super.super.isa + v10), "hitTestInsets");
  v23.origin.x = UIEdgeInsetsInsetRect(v12, v14, v16, v18, v19, v20);
  v22.x = v7;
  v22.y = v9;
  LOBYTE(v10) = CGRectContainsPoint(v23, v22);

  return v10 ^ 1;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v6;
  id v7;
  _TtC23ShelfKitCollectionViews21PlayControlsStackView *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = (void *)_s23ShelfKitCollectionViews21PlayControlsStackViewC18pointerInteraction_8styleForSo14UIPointerStyleCSgSo0mJ0C_So0M6RegionCtF_0(v6);

  return v9;
}

- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5
{
  _BYTE *v8;
  char v9;
  uint64_t v10;
  id v11;
  id v12;
  _TtC23ShelfKitCollectionViews21PlayControlsStackView *v13;

  v8 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC23ShelfKitCollectionViews21PlayControlsStackView_playControlsPresenter);
  v8[57] = 1;
  v9 = v8[73];
  v10 = v8[72];
  v11 = a3;
  v12 = a4;
  swift_unknownObjectRetain(a5);
  v13 = self;
  sub_2B3510(v9, v10, 1);

  swift_unknownObjectRelease(a5);
}

- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5
{
  _BYTE *v8;
  char v9;
  uint64_t v10;
  id v11;
  id v12;
  _TtC23ShelfKitCollectionViews21PlayControlsStackView *v13;

  v8 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC23ShelfKitCollectionViews21PlayControlsStackView_playControlsPresenter);
  v8[57] = 0;
  v9 = v8[73];
  v10 = v8[72];
  v11 = a3;
  v12 = a4;
  swift_unknownObjectRetain(a5);
  v13 = self;
  sub_2B3510(v9, v10, 0);

  swift_unknownObjectRelease(a5);
}

@end
