@implementation VolumeSlider

- (_TtC16MusicApplication12VolumeSlider)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication12VolumeSlider *)sub_7C40B4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication12VolumeSlider)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_7C5544();
}

- (void)didMoveToWindow
{
  _TtC16MusicApplication12VolumeSlider *v2;

  v2 = self;
  sub_7C48F4();

}

- (void)sliderDidChangeValue:(id)a3
{
  id v4;
  _TtC16MusicApplication12VolumeSlider *v5;

  v4 = a3;
  v5 = self;
  sub_7C4AC0(v4);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication12VolumeSlider_volumeController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication12VolumeSlider_elapsedTrackColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication12VolumeSlider_remainingTrackColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication12VolumeSlider_trackingColor));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication12VolumeSlider_trackLayoutGuide));

  sub_5C198(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication12VolumeSlider_volumeChangeHandler), *(_QWORD *)&self->volumeController[OBJC_IVAR____TtC16MusicApplication12VolumeSlider_volumeChangeHandler]);
}

- (void)volumeController:(id)a3 volumeControlAvailableDidChange:(BOOL)a4
{
  id v5;
  _TtC16MusicApplication12VolumeSlider *v6;

  v5 = a3;
  v6 = self;
  sub_7C49D4(1);

}

- (void)volumeController:(id)a3 volumeValueDidChange:(float)a4
{
  void *v5;
  id v6;
  void (*v7)(__n128);
  uint64_t v8;
  __n128 v9;
  _TtC16MusicApplication12VolumeSlider *v10;

  v5 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC16MusicApplication12VolumeSlider_slider);
  v6 = a3;
  v10 = self;
  if ((objc_msgSend(v5, "isTracking") & 1) == 0)
  {
    sub_7C49D4(1);
    v7 = *(void (**)(__n128))((char *)&v10->super.super.super.isa
                                       + OBJC_IVAR____TtC16MusicApplication12VolumeSlider_volumeChangeHandler);
    if (v7)
    {
      v8 = *(_QWORD *)&v10->volumeController[OBJC_IVAR____TtC16MusicApplication12VolumeSlider_volumeChangeHandler];
      v9 = swift_retain(v8);
      v7(v9);
      sub_5C198((uint64_t)v7, v8);
    }
  }

}

- (UIWindowScene)windowSceneForVolumeDisplay
{
  _TtC16MusicApplication12VolumeSlider *v2;
  id v3;
  id v4;

  v2 = self;
  v3 = -[VolumeSlider window](v2, "window");
  v4 = objc_msgSend(v3, "windowScene");

  return (UIWindowScene *)v4;
}

- (NSString)volumeAudioCategory
{
  void *v2;
  _TtC16MusicApplication12VolumeSlider *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSString v8;

  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16MusicApplication12VolumeSlider_volumeController);
  v3 = self;
  v4 = objc_msgSend(v2, "dataSource");
  v5 = objc_msgSend(v4, "volumeAudioCategory");
  static String._unconditionallyBridgeFromObjectiveC(_:)(v5);
  v7 = v6;

  swift_unknownObjectRelease(v4);
  v8 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v7);
  return (NSString *)v8;
}

- (BOOL)isOnScreenForVolumeDisplay
{
  _TtC16MusicApplication12VolumeSlider *v2;
  double v4;
  double v5;

  v2 = self;
  if (-[VolumeSlider isHidden](v2, "isHidden"))
  {

    return 0;
  }
  else
  {
    -[VolumeSlider alpha](v2, "alpha");
    v5 = v4;

    return v5 > 0.0;
  }
}

- (void)_sliderFluidInteractionWillBegin:(id)a3 withLocation:(CGPoint)a4
{
  id v5;
  _TtC16MusicApplication12VolumeSlider *v6;

  v5 = a3;
  v6 = self;
  sub_7C56F4();

}

- (void)_sliderFluidInteractionWillContinue:(id)a3 withLocation:(CGPoint)a4
{
  void (*v4)(uint64_t);
  uint64_t v6;
  id v7;
  uint64_t v8;
  _TtC16MusicApplication12VolumeSlider *v9;

  v4 = *(void (**)(uint64_t))((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC16MusicApplication12VolumeSlider_volumeChangeHandler);
  if (v4)
  {
    v6 = *(_QWORD *)&self->volumeController[OBJC_IVAR____TtC16MusicApplication12VolumeSlider_volumeChangeHandler];
    v7 = a3;
    v9 = self;
    v8 = sub_A9DEC((uint64_t)v4, v6);
    v4(v8);
    sub_5C198((uint64_t)v4, v6);

  }
}

- (void)_sliderFluidInteractionWillExtend:(id)a3 insets:(UIEdgeInsets)a4
{
  void (*v4)(uint64_t);
  uint64_t v6;
  id v7;
  uint64_t v8;
  _TtC16MusicApplication12VolumeSlider *v9;

  v4 = *(void (**)(uint64_t))((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC16MusicApplication12VolumeSlider_volumeChangeHandler);
  if (v4)
  {
    v6 = *(_QWORD *)&self->volumeController[OBJC_IVAR____TtC16MusicApplication12VolumeSlider_volumeChangeHandler];
    v7 = a3;
    v9 = self;
    v8 = sub_A9DEC((uint64_t)v4, v6);
    v4(v8);
    sub_5C198((uint64_t)v4, v6);

  }
}

- (void)_sliderFluidInteractionWillEnd:(id)a3
{
  id v4;
  _TtC16MusicApplication12VolumeSlider *v5;

  v4 = a3;
  v5 = self;
  sub_7C51F0(v4);

}

- (float)accessibilityCurrentValue
{
  float result;

  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC16MusicApplication12VolumeSlider_slider), "value");
  return result;
}

- (void)accessibilityUpdateWithVolume:(float)a3
{
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC16MusicApplication12VolumeSlider_volumeController), "setVolumeValue:");
}

@end
