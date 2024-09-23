@implementation FMStewieSettingsView

- (void)handleButtonRowAction
{
  uint64_t Strong;
  uint64_t v4;
  _TtC6FindMy20FMStewieSettingsView *v5;

  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC6FindMy20FMStewieSettingsView_delegate);
  if (Strong)
  {
    v4 = Strong;
    v5 = self;
    sub_100071ECC(1);

    swift_unknownObjectRelease(v4);
  }
}

- (_TtC6FindMy20FMStewieSettingsView)init
{
  return (_TtC6FindMy20FMStewieSettingsView *)sub_100375AC0();
}

- (_TtC6FindMy20FMStewieSettingsView)initWithCoder:(id)a3
{
  return (_TtC6FindMy20FMStewieSettingsView *)sub_100375D90(a3);
}

- (void).cxx_destruct
{
  sub_10005E190((uint64_t)self + OBJC_IVAR____TtC6FindMy20FMStewieSettingsView_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy20FMStewieSettingsView_headerRow));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy20FMStewieSettingsView_statusRow));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy20FMStewieSettingsView_learnMoreRow));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy20FMStewieSettingsView_updateLocationButton));
}

@end
