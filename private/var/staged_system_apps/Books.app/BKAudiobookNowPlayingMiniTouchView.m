@implementation BKAudiobookNowPlayingMiniTouchView

- (void)willMoveToWindow:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  double v8;
  id v9;
  double v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for AudiobookNowPlayingMiniTouchView();
  v4 = v11.receiver;
  v5 = a3;
  -[BKAudiobookNowPlayingMiniTouchView willMoveToWindow:](&v11, "willMoveToWindow:", v5);
  v6 = sub_1005197B8();
  v7 = objc_msgSend(v6, "layer", v11.receiver, v11.super_class);

  v8 = 1.0;
  if (v5)
  {
    v9 = objc_msgSend(v5, "screen");
    objc_msgSend(v9, "scale");
    v8 = v10;

  }
  objc_msgSend(v7, "setBorderWidth:", 1.0 / v8);

}

- (void)_traitCollectionDidChangeWithSender:(id)a3 previousTraitCollection:(id)a4
{
  id v7;
  BKAudiobookNowPlayingMiniTouchView *v8;
  void *Strong;
  _QWORD v10[4];

  swift_unknownObjectRetain(a3);
  v7 = a4;
  v8 = self;
  _bridgeAnyObjectToAny(_:)(a3);
  objc_msgSend(*(id *)((char *)&v8->super.super.super.isa + OBJC_IVAR___BKAudiobookNowPlayingMiniTouchView_titleLabel), "invalidateIntrinsicContentSize", swift_unknownObjectRelease(a3).n128_f64[0]);
  objc_msgSend(*(id *)((char *)&v8->super.super.super.isa + OBJC_IVAR___BKAudiobookNowPlayingMiniTouchView_subtitleLabel), "invalidateIntrinsicContentSize");
  Strong = (void *)swift_unknownObjectWeakLoadStrong((char *)v8 + OBJC_IVAR___BKAudiobookNowPlayingMiniTouchView_buyButtonView);
  objc_msgSend(Strong, "invalidateIntrinsicContentSize");

  sub_10051D2C4();
  _s5Books15CurrentPageViewVwxx_0(v10);
}

- (BKAudiobookNowPlayingMiniTouchView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10051EC64();
}

- (void)skipBackwardStart
{
  sub_10051BCDC((char *)self, (uint64_t)a2, (SEL *)&selRef_startSkipBackwardWithActionSource_);
}

- (void)skipBackwardEnd
{
  sub_10051BD68((char *)self, (uint64_t)a2, (SEL *)&selRef_endSkipBackward);
}

- (void)togglePlaying
{
  sub_10051BD68((char *)self, (uint64_t)a2, (SEL *)&selRef_togglePlayPause);
}

- (void)skipForwardStart
{
  sub_10051BCDC((char *)self, (uint64_t)a2, (SEL *)&selRef_startSkipForwardWithActionSource_);
}

- (void)skipForwardEnd
{
  sub_10051BD68((char *)self, (uint64_t)a2, (SEL *)&selRef_endSkipForward);
}

- (NSString)accessibilityLabel
{
  id v2;
  NSString *v3;
  NSString *v4;
  uint64_t v5;
  uint64_t v6;
  NSString v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for AudiobookNowPlayingMiniTouchView();
  v2 = v9.receiver;
  v3 = -[BKAudiobookNowPlayingMiniTouchView accessibilityLabel](&v9, "accessibilityLabel");
  if (v3)
  {
    v4 = v3;
    static String._unconditionallyBridgeFromObjectiveC(_:)(v3);
    v6 = v5;

  }
  else
  {
    if (qword_1009CE7C8 != -1)
      swift_once(&qword_1009CE7C8, sub_10051CCCC);
    v6 = unk_1009E9840;
    swift_bridgeObjectRetain(unk_1009E9840);

  }
  v7 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v6);
  return (NSString *)v7;
}

- (void)setAccessibilityLabel:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  BKAudiobookNowPlayingMiniTouchView *v6;
  NSString v7;
  BKAudiobookNowPlayingMiniTouchView *v8;
  objc_super v9;

  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v5 = v4;
    v6 = self;
    v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v5);
  }
  else
  {
    v8 = self;
    v7 = 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for AudiobookNowPlayingMiniTouchView();
  -[BKAudiobookNowPlayingMiniTouchView setAccessibilityLabel:](&v9, "setAccessibilityLabel:", v7);

}

- (NSArray)accessibilityElements
{
  BKAudiobookNowPlayingMiniTouchView *v2;
  uint64_t v3;
  uint64_t v4;
  NSArray v5;

  v2 = self;
  sub_10051D058();
  v4 = v3;

  if (v4)
  {
    v5.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v4);
  }
  else
  {
    v5.super.isa = 0;
  }
  return (NSArray *)v5.super.isa;
}

- (BKAudiobookNowPlayingMiniTouchView)initWithFrame:(CGRect)a3
{
  BKAudiobookNowPlayingMiniTouchView *result;

  result = (BKAudiobookNowPlayingMiniTouchView *)_swift_stdlib_reportUnimplementedInitializer("Books.AudiobookNowPlayingMiniTouchView", 38, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  void *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___BKAudiobookNowPlayingMiniTouchView_state);
  v4 = *(_QWORD *)&self->state[OBJC_IVAR___BKAudiobookNowPlayingMiniTouchView_state + 8];
  v5 = *(_QWORD *)&self->state[OBJC_IVAR___BKAudiobookNowPlayingMiniTouchView_state + 24];
  swift_bridgeObjectRelease(*(_QWORD *)&self->state[OBJC_IVAR___BKAudiobookNowPlayingMiniTouchView_state + 40]);
  swift_bridgeObjectRelease(v5);
  swift_bridgeObjectRelease(v4);

  sub_1001FE9A0((uint64_t)self + OBJC_IVAR___BKAudiobookNowPlayingMiniTouchView_delegate);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR___BKAudiobookNowPlayingMiniTouchView_buyButtonView);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___BKAudiobookNowPlayingMiniTouchView_artworkWrapperView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___BKAudiobookNowPlayingMiniTouchView____lazy_storage___artworkImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___BKAudiobookNowPlayingMiniTouchView_titleContainer));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___BKAudiobookNowPlayingMiniTouchView_subtitleContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___BKAudiobookNowPlayingMiniTouchView_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___BKAudiobookNowPlayingMiniTouchView_skipBackwardButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___BKAudiobookNowPlayingMiniTouchView_skipBackwardVibrancyContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___BKAudiobookNowPlayingMiniTouchView_togglePlayingButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___BKAudiobookNowPlayingMiniTouchView_togglePlayingVibrancyContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___BKAudiobookNowPlayingMiniTouchView_skipForwardButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___BKAudiobookNowPlayingMiniTouchView_skipForwardVibrancyContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___BKAudiobookNowPlayingMiniTouchView_buyButtonGuide));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___BKAudiobookNowPlayingMiniTouchView_contentLeadingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___BKAudiobookNowPlayingMiniTouchView_contentTrailingConstraint));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR___BKAudiobookNowPlayingMiniTouchView_subtitleVisibleConstraints));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR___BKAudiobookNowPlayingMiniTouchView_subtitleHiddenConstraints));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___BKAudiobookNowPlayingMiniTouchView_controlHeightConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___BKAudiobookNowPlayingMiniTouchView_buyButtonHeightConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___BKAudiobookNowPlayingMiniTouchView_buyButtonTrailingConstraint));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR___BKAudiobookNowPlayingMiniTouchView_buyButtonHiddenConstraints));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___BKAudiobookNowPlayingMiniTouchView_skipForwardLeadingConstraint));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR___BKAudiobookNowPlayingMiniTouchView_skipForwardVisibleConstraints));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR___BKAudiobookNowPlayingMiniTouchView_skipForwardHiddenConstraints));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___BKAudiobookNowPlayingMiniTouchView_skipBackwardTrailingConstraint));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR___BKAudiobookNowPlayingMiniTouchView_skipBackwardVisibleConstraints));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR___BKAudiobookNowPlayingMiniTouchView_skipBackwardHiddenConstraints));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___BKAudiobookNowPlayingMiniTouchView_cachedGroupedLabelsAXElement));
}

- (CGRect)transitionCoverFrame
{
  BKAudiobookNowPlayingMiniTouchView *v2;
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;
  id v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGRect result;

  v2 = self;
  v3 = sub_1005197B8();
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = sub_1005197B8();
  v13 = objc_msgSend(v12, "superview");

  -[BKAudiobookNowPlayingMiniTouchView convertRect:fromView:](v2, "convertRect:fromView:", v13, v5, v7, v9, v11);
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  v22 = v15;
  v23 = v17;
  v24 = v19;
  v25 = v21;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (id)transitionCurrentCoverImage
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                 + OBJC_IVAR___BKAudiobookNowPlayingMiniTouchView_state));
}

- (id)transitionBackgroundImageView
{
  return 0;
}

- (id)transitionToolbarViews
{
  return Array._bridgeToObjectiveC()().super.isa;
}

- (id)transitionControlsViews
{
  uint64_t v2;
  Class isa;

  v2 = sub_10051E0FC();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v2);
  return isa;
}

- (BOOL)transitionHasCustomArtwork
{
  return 0;
}

- (double)transitionToolbarAlpha
{
  return 1.0;
}

- (id)transitionCoverViews
{
  uint64_t v3;
  uint64_t v4;
  BKAudiobookNowPlayingMiniTouchView *v5;
  id v6;
  Class isa;

  v3 = sub_10004CFD4(&qword_1009D4B80);
  v4 = swift_allocObject(v3, 64, 7);
  *(_OWORD *)(v4 + 16) = xmmword_10070CCA0;
  v5 = self;
  v6 = sub_1005197B8();
  *(_QWORD *)(v4 + 56) = sub_100009E04(0, &qword_1009D4BA0, UIImageView_ptr);
  *(_QWORD *)(v4 + 32) = v6;

  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v4);
  return isa;
}

- (double)coverCornerRadius
{
  BKAudiobookNowPlayingMiniTouchView *v2;
  id v3;
  id v4;
  double v5;
  double v6;

  v2 = self;
  v3 = sub_1005197B8();
  v4 = objc_msgSend(v3, "layer");

  objc_msgSend(v4, "cornerRadius");
  v6 = v5;

  return v6;
}

- (int64_t)coverContentMode
{
  BKAudiobookNowPlayingMiniTouchView *v2;
  id v3;
  id v4;

  v2 = self;
  v3 = sub_1005197B8();
  v4 = objc_msgSend(v3, "contentMode");

  return (int64_t)v4;
}

- (double)transitionCoverImagePlayControlShadowOpacityValue
{
  return 1.0;
}

- (id)transitionCoverImagePlayControl
{
  return 0;
}

- (id)transitionContentView
{
  return 0;
}

@end
