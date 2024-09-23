@implementation PlayerTimeControl

- (_TtC16MusicApplication17PlayerTimeControl)init
{
  _TtC16MusicApplication17PlayerTimeControl *result;

  sub_662CBC();
  return result;
}

- (_TtC16MusicApplication17PlayerTimeControl)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_666894();
}

- (void)dealloc
{
  void *v2;
  _TtC16MusicApplication17PlayerTimeControl *v3;
  objc_super v4;

  v2 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC16MusicApplication17PlayerTimeControl_displayLink);
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
  sub_CD0E0(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication17PlayerTimeControl_scrubbingDidChangeHandler), *(_QWORD *)&self->scrubbingDidChangeHandler[OBJC_IVAR____TtC16MusicApplication17PlayerTimeControl_scrubbingDidChangeHandler]);
  sub_CD0E0(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication17PlayerTimeControl_timeDidChangeHandler), *(_QWORD *)&self->scrubbingDidChangeHandler[OBJC_IVAR____TtC16MusicApplication17PlayerTimeControl_timeDidChangeHandler]);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication17PlayerTimeControl_elapsedTrackColor));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication17PlayerTimeControl_remainingTrackColor));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication17PlayerTimeControl_slider));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication17PlayerTimeControl_elapsedTimeLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication17PlayerTimeControl_remainingTimeLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication17PlayerTimeControl_liveLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication17PlayerTimeControl_liveTrack));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication17PlayerTimeControl_trackingTintColor));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication17PlayerTimeControl_liveLabelTextColor));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication17PlayerTimeControl_timeLabelTextColor));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication17PlayerTimeControl_backgroundObserver));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication17PlayerTimeControl_foregroundObserver));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication17PlayerTimeControl_displayLink));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication17PlayerTimeControl_elapsedTimeFormatter));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication17PlayerTimeControl_remainingTimeFormatter));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication17PlayerTimeControl_timeLabelFont));
}

- (UILabel)liveLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                            + OBJC_IVAR____TtC16MusicApplication17PlayerTimeControl_liveLabel));
}

- (BOOL)isHidden
{
  return sub_664CF0(self, (uint64_t)a2, (SEL *)&selRef_isHidden);
}

- (void)setHidden:(BOOL)a3
{
  _BOOL8 v3;
  objc_class *v5;
  _TtC16MusicApplication17PlayerTimeControl *v6;
  char v7;
  objc_super v8;
  objc_super v9;

  v3 = a3;
  v5 = (objc_class *)type metadata accessor for PlayerTimeControl();
  v9.receiver = self;
  v9.super_class = v5;
  v6 = self;
  v7 = -[PlayerTimeControl isHidden](&v9, "isHidden");
  v8.receiver = v6;
  v8.super_class = v5;
  -[PlayerTimeControl setHidden:](&v8, "setHidden:", v3);
  sub_6645D0(v7);

}

- (double)alpha
{
  double result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PlayerTimeControl();
  -[PlayerTimeControl alpha](&v3, "alpha");
  return result;
}

- (void)setAlpha:(double)a3
{
  objc_class *v5;
  _TtC16MusicApplication17PlayerTimeControl *v6;
  double v7;
  double v8;
  objc_super v9;
  objc_super v10;

  v5 = (objc_class *)type metadata accessor for PlayerTimeControl();
  v10.receiver = self;
  v10.super_class = v5;
  v6 = self;
  -[PlayerTimeControl alpha](&v10, "alpha");
  v8 = v7;
  v9.receiver = v6;
  v9.super_class = v5;
  -[PlayerTimeControl setAlpha:](&v9, "setAlpha:", a3);
  sub_6647FC(v8);

}

- (void)layoutSubviews
{
  _TtC16MusicApplication17PlayerTimeControl *v2;

  v2 = self;
  sub_664970();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for PlayerTimeControl();
  v4 = a3;
  v5 = v6.receiver;
  -[PlayerTimeControl traitCollectionDidChange:](&v6, "traitCollectionDidChange:", v4);
  sub_665710();

}

- (void)didMoveToWindow
{
  _TtC16MusicApplication17PlayerTimeControl *v2;

  v2 = self;
  sub_664B58();

}

- (void)tintColorDidChange
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PlayerTimeControl();
  v2 = v3.receiver;
  -[PlayerTimeControl tintColorDidChange](&v3, "tintColorDidChange");
  sub_664F38();

}

- (BOOL)isEnabled
{
  return sub_664CF0(self, (uint64_t)a2, (SEL *)&selRef_isEnabled);
}

- (void)setEnabled:(BOOL)a3
{
  _TtC16MusicApplication17PlayerTimeControl *v4;

  v4 = self;
  sub_664D6C(a3);

}

- (double)accessibilityTotalDuration
{
  double result;

  result = 0.0;
  if (self->elapsedTrackColor[OBJC_IVAR____TtC16MusicApplication17PlayerTimeControl_durationSnapshot] != 2)
    return *(double *)&self->timeDidChangeHandler[OBJC_IVAR____TtC16MusicApplication17PlayerTimeControl_durationSnapshot];
  return result;
}

- (double)accessibilityElapsedDuration
{
  char *v2;
  uint64_t v3;
  double ElapsedTimeForCurrentTime;
  uint64_t v5;
  uint64_t v6;
  _TtC16MusicApplication17PlayerTimeControl *v7;
  double v8;
  __int128 v10;
  __int128 v11;
  _OWORD v12[2];
  uint64_t v13;
  uint64_t v14;
  __int16 v15;
  char v16;

  v2 = (char *)self + OBJC_IVAR____TtC16MusicApplication17PlayerTimeControl_durationSnapshot;
  v3 = *(_QWORD *)&self->elapsedTrackColor[OBJC_IVAR____TtC16MusicApplication17PlayerTimeControl_durationSnapshot];
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
  void (*v3)(uint64_t, double);
  uint64_t v5;
  uint64_t v6;
  _TtC16MusicApplication17PlayerTimeControl *v7;

  v3 = *(void (**)(uint64_t, double))((char *)&self->super.super.super.super.isa
                                              + OBJC_IVAR____TtC16MusicApplication17PlayerTimeControl_timeDidChangeHandler);
  if (v3)
  {
    v5 = *(_QWORD *)&self->scrubbingDidChangeHandler[OBJC_IVAR____TtC16MusicApplication17PlayerTimeControl_timeDidChangeHandler];
    v6 = *((unsigned __int8 *)&self->super.super.super.super.isa
         + OBJC_IVAR____TtC16MusicApplication17PlayerTimeControl__tracking);
    v7 = self;
    sub_A9DEC((uint64_t)v3, v5);
    v3(v6, a3);
    sub_CD0E0((uint64_t)v3, v5);

  }
}

- (BOOL)accessibilityIsLiveContent
{
  return (self->elapsedTrackColor[OBJC_IVAR____TtC16MusicApplication17PlayerTimeControl_durationSnapshot] != 2) & self->elapsedTrackColor[OBJC_IVAR____TtC16MusicApplication17PlayerTimeControl_durationSnapshot];
}

- (_TtC16MusicApplication17PlayerTimeControl)initWithFrame:(CGRect)a3
{
  _TtC16MusicApplication17PlayerTimeControl *result;

  result = (_TtC16MusicApplication17PlayerTimeControl *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.PlayerTimeControl", 34, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

@end
