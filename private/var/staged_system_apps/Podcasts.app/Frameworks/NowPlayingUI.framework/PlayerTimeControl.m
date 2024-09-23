@implementation PlayerTimeControl

- (UIView)elapsedTrack
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                           + OBJC_IVAR____TtC12NowPlayingUI17PlayerTimeControl_elapsedTrack));
}

- (UIView)bufferTrack
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                           + OBJC_IVAR____TtC12NowPlayingUI17PlayerTimeControl_bufferTrack));
}

- (UIView)remainingTrack
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                           + OBJC_IVAR____TtC12NowPlayingUI17PlayerTimeControl_remainingTrack));
}

- (_TtC12NowPlayingUI17PlayerTimeControl)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_4AE58();
}

- (void)dealloc
{
  void *v2;
  _TtC12NowPlayingUI17PlayerTimeControl *v3;
  objc_super v4;

  v2 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC12NowPlayingUI17PlayerTimeControl_displayLink);
  if (v2)
  {
    v3 = self;
    objc_msgSend(v2, "invalidate");
    v4.receiver = v3;
    v4.super_class = (Class)type metadata accessor for PlayerTimeControl();
    -[PlayerTimeControl dealloc](&v4, "dealloc");
  }
  else
  {
    __break(1u);
  }
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI17PlayerTimeControl_trackLayoutGuide));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI17PlayerTimeControl_elapsedTrack));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI17PlayerTimeControl_bufferUnselectedColor));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI17PlayerTimeControl_bufferSelectedColor));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI17PlayerTimeControl_bufferTrack));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI17PlayerTimeControl_remainingTrack));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI17PlayerTimeControl_knobView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI17PlayerTimeControl_knobKnockoutView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI17PlayerTimeControl_elapsedTimeActivityIndicator));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI17PlayerTimeControl_elapsedTimeLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI17PlayerTimeControl_remainingTimeLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI17PlayerTimeControl_liveLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI17PlayerTimeControl_liveBackground));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI17PlayerTimeControl_bufferingIndicator));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC12NowPlayingUI17PlayerTimeControl_defaultConstraints));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC12NowPlayingUI17PlayerTimeControl_trackingConstraints));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI17PlayerTimeControl_elapsedTimeLabelBottomAnchorConstraint));
  __swift_destroy_boxed_opaque_existential_0((Class *)((char *)&self->super.super.super.super.isa
                                                     + OBJC_IVAR____TtC12NowPlayingUI17PlayerTimeControl_metrics));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI17PlayerTimeControl_remainingTrackLeadingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI17PlayerTimeControl_scrubController));
  sub_145A0(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC12NowPlayingUI17PlayerTimeControl_scrubbingDidChangeHandler), *(_QWORD *)&self->trackLayoutGuide[OBJC_IVAR____TtC12NowPlayingUI17PlayerTimeControl_scrubbingDidChangeHandler]);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI17PlayerTimeControl_knobViewXConstraint));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC12NowPlayingUI17PlayerTimeControl_nextItemObserver));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC12NowPlayingUI17PlayerTimeControl_backgroundObserver));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC12NowPlayingUI17PlayerTimeControl_foregroundObserver));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC12NowPlayingUI17PlayerTimeControl_loadedDurationObserver));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI17PlayerTimeControl_displayLink));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI17PlayerTimeControl_elapsedTimeFormatter));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI17PlayerTimeControl_remainingTimeFormatter));
}

- (void)layoutSubviews
{
  _TtC12NowPlayingUI17PlayerTimeControl *v2;

  v2 = self;
  sub_46C7C();

}

- (void)didMoveToWindow
{
  _TtC12NowPlayingUI17PlayerTimeControl *v2;

  v2 = self;
  sub_46DA4();

}

- (UIEdgeInsets)alignmentRectInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = -6.0;
  v3 = 0.0;
  v4 = -1.0;
  v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (CGRect)bounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  objc_super v6;
  CGRect result;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for PlayerTimeControl();
  -[PlayerTimeControl bounds](&v6, "bounds");
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
  objc_class *v8;
  _TtC12NowPlayingUI17PlayerTimeControl *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  objc_super v18;
  objc_super v19;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (objc_class *)type metadata accessor for PlayerTimeControl();
  v19.receiver = self;
  v19.super_class = v8;
  v9 = self;
  -[PlayerTimeControl bounds](&v19, "bounds");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v18.receiver = v9;
  v18.super_class = v8;
  -[PlayerTimeControl setBounds:](&v18, "setBounds:", x, y, width, height);
  sub_46FD0(v11, v13, v15, v17);

}

- (id)viewForBaselineLayout
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                 + OBJC_IVAR____TtC12NowPlayingUI17PlayerTimeControl_elapsedTimeLabel));
}

- (CGSize)intrinsicContentSize
{
  _TtC12NowPlayingUI17PlayerTimeControl *v2;
  CGFloat v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  v2 = self;
  v3 = sub_4710C();
  v5 = v4;

  v6 = v3;
  v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (void)tintColorDidChange
{
  _TtC12NowPlayingUI17PlayerTimeControl *v2;

  v2 = self;
  sub_471EC();

}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  uint64_t v4;
  CGFloat y;
  CGFloat x;
  id v8;
  _TtC12NowPlayingUI17PlayerTimeControl *v9;

  v4 = (uint64_t)a4;
  y = a3.y;
  x = a3.x;
  v8 = a4;
  v9 = self;
  LOBYTE(v4) = sub_473DC(v4, x, y);

  return v4 & 1;
}

- (BOOL)isEnabled
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PlayerTimeControl();
  return -[PlayerTimeControl isEnabled](&v3, "isEnabled");
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  objc_class *v5;
  _TtC12NowPlayingUI17PlayerTimeControl *v6;
  char v7;
  objc_super v8;
  objc_super v9;

  v3 = a3;
  v5 = (objc_class *)type metadata accessor for PlayerTimeControl();
  v9.receiver = self;
  v9.super_class = v5;
  v6 = self;
  v7 = -[PlayerTimeControl isEnabled](&v9, "isEnabled");
  v8.receiver = v6;
  v8.super_class = v5;
  -[PlayerTimeControl setEnabled:](&v8, "setEnabled:", v3);
  sub_47680(v7);

}

- (void)panGestureRecognized:(id)a3
{
  id v4;
  _TtC12NowPlayingUI17PlayerTimeControl *v5;

  v4 = a3;
  v5 = self;
  sub_478E0(v4);

}

- (void)preferredContentSizeDidChangeWithNewContentSizeCategory:(id)a3
{
  id v4;
  _TtC12NowPlayingUI17PlayerTimeControl *v5;

  v4 = a3;
  v5 = self;
  sub_4B4B4();

}

- (float)value
{
  void *v2;
  _TtC12NowPlayingUI17PlayerTimeControl *v3;
  double v4;
  double v5;
  double Width;
  float result;
  CGRect v8;

  v2 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC12NowPlayingUI17PlayerTimeControl_knobViewXConstraint);
  if (v2)
  {
    v3 = self;
    objc_msgSend(v2, "constant");
    v5 = v4;
    -[PlayerTimeControl bounds](v3, "bounds");
    Width = CGRectGetWidth(v8);

    return v5 / Width;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (float)minimumValue
{
  return 0.0;
}

- (float)maximumValue
{
  return 1.0;
}

- (CGRect)thumbHitRect
{
  _TtC12NowPlayingUI17PlayerTimeControl *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGRect result;

  v2 = self;
  v3 = sub_47D88();
  v5 = v4;
  v7 = v6;
  v9 = v8;

  v10 = v3;
  v11 = v5;
  v12 = v7;
  v13 = v9;
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (void)detailScrubController:(id)a3 didChangeValue:(float)a4
{
  id v6;
  _TtC12NowPlayingUI17PlayerTimeControl *v7;

  v6 = a3;
  v7 = self;
  sub_4B93C(a4);

}

- (void)detailScrubController:(id)a3 didChangeScrubSpeed:(int64_t)a4
{
  id v6;
  _TtC12NowPlayingUI17PlayerTimeControl *v7;

  v6 = a3;
  v7 = self;
  sub_4BBF8(a4);

}

- (void)detailScrubControllerDidBeginScrubbing:(id)a3
{
  id v4;
  _TtC12NowPlayingUI17PlayerTimeControl *v5;

  v4 = a3;
  v5 = self;
  sub_4BCF0();

}

- (void)detailScrubControllerDidEndScrubbing:(id)a3
{
  id v4;
  _TtC12NowPlayingUI17PlayerTimeControl *v5;

  v4 = a3;
  v5 = self;
  sub_4BDFC();

}

- (double)accessibilityTotalDuration
{
  double result;

  result = 0.0;
  if (self->remainingTrack[OBJC_IVAR____TtC12NowPlayingUI17PlayerTimeControl_durationSnapshot] != 2)
    return *(double *)&self->bufferUnselectedColor[OBJC_IVAR____TtC12NowPlayingUI17PlayerTimeControl_durationSnapshot];
  return result;
}

- (double)accessibilityElapsedDuration
{
  char *v2;
  uint64_t v3;
  double ElapsedTimeForCurrentTime;
  uint64_t v5;
  uint64_t v6;
  _TtC12NowPlayingUI17PlayerTimeControl *v7;
  double v8;
  __int128 v10;
  __int128 v11;
  _OWORD v12[2];
  uint64_t v13;
  uint64_t v14;
  __int16 v15;
  char v16;

  v2 = (char *)self + OBJC_IVAR____TtC12NowPlayingUI17PlayerTimeControl_durationSnapshot;
  v3 = *(_QWORD *)&self->remainingTrack[OBJC_IVAR____TtC12NowPlayingUI17PlayerTimeControl_durationSnapshot];
  ElapsedTimeForCurrentTime = 0.0;
  if (v3 != 2)
  {
    v5 = *((_QWORD *)v2 + 5);
    v6 = *((_QWORD *)v2 + 4);
    v10 = *(_OWORD *)v2;
    v11 = *((_OWORD *)v2 + 1);
    v7 = self;
    v8 = static Date.timeIntervalSinceReferenceDate.getter(v7);
    v12[0] = v10;
    v12[1] = v11;
    v13 = v6;
    v14 = v5;
    v15 = v3 & 0x101;
    v16 = BYTE2(v3) & 1;
    ElapsedTimeForCurrentTime = MPCPlayerItemDurationSnapshotGetElapsedTimeForCurrentTime((uint64_t)v12, v8);

  }
  return ElapsedTimeForCurrentTime;
}

- (void)accessibilityUpdateWithElapsedDuration:(double)a3
{
  _TtC12NowPlayingUI17PlayerTimeControl *v4;

  v4 = self;
  sub_497F4(a3);

}

- (BOOL)accessibilityIsLiveContent
{
  return (self->remainingTrack[OBJC_IVAR____TtC12NowPlayingUI17PlayerTimeControl_durationSnapshot] != 2) & self->remainingTrack[OBJC_IVAR____TtC12NowPlayingUI17PlayerTimeControl_durationSnapshot];
}

- (UIView)accessibilityKnobView
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                           + OBJC_IVAR____TtC12NowPlayingUI17PlayerTimeControl_knobView));
}

- (UILabel)accessibilityLiveLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                            + OBJC_IVAR____TtC12NowPlayingUI17PlayerTimeControl_liveLabel));
}

- (_TtC12NowPlayingUI17PlayerTimeControl)initWithFrame:(CGRect)a3
{
  _TtC12NowPlayingUI17PlayerTimeControl *result;

  result = (_TtC12NowPlayingUI17PlayerTimeControl *)_swift_stdlib_reportUnimplementedInitializer("NowPlayingUI.PlayerTimeControl", 30, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

@end
