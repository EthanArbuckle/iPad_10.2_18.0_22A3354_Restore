@implementation AirplayAndSettingsControlsView

- (_TtC9SeymourUI30AirplayAndSettingsControlsView)init
{
  return (_TtC9SeymourUI30AirplayAndSettingsControlsView *)sub_22B32CADC();
}

- (_TtC9SeymourUI30AirplayAndSettingsControlsView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B32D804();
}

- (void)airplayTouchUpInside:(id)a3
{
  sub_22B32D69C((char *)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC9SeymourUI30AirplayAndSettingsControlsView_onTapAirplay);
}

- (void)settingsTouchUpInside:(id)a3
{
  sub_22B32D69C((char *)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC9SeymourUI30AirplayAndSettingsControlsView_onTapSettings);
}

- (_TtC9SeymourUI30AirplayAndSettingsControlsView)initWithFrame:(CGRect)a3
{
  _TtC9SeymourUI30AirplayAndSettingsControlsView *result;

  result = (_TtC9SeymourUI30AirplayAndSettingsControlsView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_22B0FAA68(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI30AirplayAndSettingsControlsView_onTapAirplay));
  sub_22B0FAA68(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI30AirplayAndSettingsControlsView_onTapSettings));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30AirplayAndSettingsControlsView_airplayButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30AirplayAndSettingsControlsView_settingsButton));
}

@end
