@implementation FMLocationSettingsView

- (_TtC6FindMy22FMLocationSettingsView)init
{
  return (_TtC6FindMy22FMLocationSettingsView *)sub_10027B0BC();
}

- (_TtC6FindMy22FMLocationSettingsView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10027CB10();
}

- (void)handleChangeMeDevice
{
  uint64_t Strong;
  uint64_t v4;
  _TtC6FindMy22FMLocationSettingsView *v5;

  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC6FindMy22FMLocationSettingsView_delegate);
  if (Strong)
  {
    v4 = Strong;
    v5 = self;
    sub_100072738();

    swift_unknownObjectRelease(v4);
  }
}

- (void)handleEditLocationName
{
  uint64_t Strong;
  uint64_t v4;
  _TtC6FindMy22FMLocationSettingsView *v5;

  if ((*(_BYTE **)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC6FindMy22FMLocationSettingsView_locationRow))[OBJC_IVAR____TtC6FindMy22FMSettingSingleRowView_isSelectable] == 1)
  {
    Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC6FindMy22FMLocationSettingsView_delegate);
    if (Strong)
    {
      v4 = Strong;
      v5 = self;
      sub_10007274C();

      swift_unknownObjectRelease(v4);
    }
  }
}

- (void).cxx_destruct
{
  sub_10005E190((uint64_t)self + OBJC_IVAR____TtC6FindMy22FMLocationSettingsView_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy22FMLocationSettingsView_meDeviceRow));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy22FMLocationSettingsView_locationRow));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy22FMLocationSettingsView_fromRow));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy22FMLocationSettingsView_changeMeDeviceButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy22FMLocationSettingsView_shareLocationSwitch));
  sub_1000051EC((uint64_t)self + OBJC_IVAR____TtC6FindMy22FMLocationSettingsView_meLocation, (uint64_t *)&unk_1005D3350);
}

@end
