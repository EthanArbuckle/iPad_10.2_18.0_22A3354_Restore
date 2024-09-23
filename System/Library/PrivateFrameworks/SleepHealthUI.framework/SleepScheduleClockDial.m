@implementation SleepScheduleClockDial

- (_TtC13SleepHealthUI22SleepScheduleClockDial)initWithCoder:(id)a3
{
  _TtC13SleepHealthUI22SleepScheduleClockDial *result;

  result = (_TtC13SleepHealthUI22SleepScheduleClockDial *)sub_1A9CE8A84();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC13SleepHealthUI22SleepScheduleClockDial *v2;

  v2 = self;
  sub_1A9C3E72C();

}

- (void)drawRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC13SleepHealthUI22SleepScheduleClockDial *v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  sub_1A9C3E99C(x, y, width, height);

}

- (_TtC13SleepHealthUI22SleepScheduleClockDial)initWithFrame:(CGRect)a3
{
  _TtC13SleepHealthUI22SleepScheduleClockDial *result;

  result = (_TtC13SleepHealthUI22SleepScheduleClockDial *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  _OWORD v8[12];

  v2 = *(_OWORD *)((char *)&self->super._minimumSafeAreaInsets.left
                 + OBJC_IVAR____TtC13SleepHealthUI22SleepScheduleClockDial_configuration);
  v8[8] = *(_OWORD *)((char *)&self->super._viewFlags
                    + OBJC_IVAR____TtC13SleepHealthUI22SleepScheduleClockDial_configuration
                    + 24);
  v8[9] = v2;
  v3 = *(_OWORD *)((char *)&self->super._viewBackingAux
                 + OBJC_IVAR____TtC13SleepHealthUI22SleepScheduleClockDial_configuration);
  v8[10] = *(_OWORD *)((char *)&self->super._minimumSafeAreaInsets.right
                     + OBJC_IVAR____TtC13SleepHealthUI22SleepScheduleClockDial_configuration);
  v8[11] = v3;
  v4 = *(_OWORD *)((char *)&self->super._window + OBJC_IVAR____TtC13SleepHealthUI22SleepScheduleClockDial_configuration);
  v8[4] = *(_OWORD *)((char *)&self->super._layerRetained
                    + OBJC_IVAR____TtC13SleepHealthUI22SleepScheduleClockDial_configuration);
  v8[5] = v4;
  v5 = *(_OWORD *)((char *)&self->super._viewFlags
                 + OBJC_IVAR____TtC13SleepHealthUI22SleepScheduleClockDial_configuration
                 + 8);
  v8[6] = *(_OWORD *)((char *)&self->super._viewDelegate
                    + OBJC_IVAR____TtC13SleepHealthUI22SleepScheduleClockDial_configuration);
  v8[7] = v5;
  v6 = *(_OWORD *)((char *)&self->super.super.__layeringSceneIdentity
                 + OBJC_IVAR____TtC13SleepHealthUI22SleepScheduleClockDial_configuration);
  v8[0] = *(_OWORD *)((char *)&self->super.super.super.isa
                    + OBJC_IVAR____TtC13SleepHealthUI22SleepScheduleClockDial_configuration);
  v8[1] = v6;
  v7 = *(_OWORD *)((char *)&self->super._swiftAnimationInfo
                 + OBJC_IVAR____TtC13SleepHealthUI22SleepScheduleClockDial_configuration);
  v8[2] = *(_OWORD *)((char *)&self->super._cachedTraitCollection
                    + OBJC_IVAR____TtC13SleepHealthUI22SleepScheduleClockDial_configuration);
  v8[3] = v7;
  sub_1A9BD7CE4((uint64_t)v8);
}

@end
