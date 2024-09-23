@implementation FMAccessoryDetailView

- (_TtC6FindMy21FMAccessoryDetailView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10027415C();
}

- (void)handleAction
{
  _TtC6FindMy21FMAccessoryDetailView *v2;

  v2 = self;
  sub_1002738B8();

}

- (void)handleFirmwareUpdate
{
  uint64_t Strong;
  uint64_t v4;
  uint64_t v5;
  _TtC6FindMy21FMAccessoryDetailView *v6;

  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC6FindMy21FMAccessoryDetailView_delegate);
  if (Strong)
  {
    v4 = Strong;
    v5 = swift_allocObject(&unk_100554238, 24, 7);
    *(_QWORD *)(v5 + 16) = v4;
    v6 = self;
    swift_unknownObjectRetain(v4);
    sub_10031B6A0((uint64_t)sub_100274154, v5);

    swift_unknownObjectRelease(v4);
    swift_release(v5);
  }
}

- (void)handleSerialReveal
{
  _TtC6FindMy21FMAccessoryDetailView *v2;

  v2 = self;
  sub_100273AC4();

}

- (void).cxx_destruct
{
  sub_10005E190((uint64_t)self + OBJC_IVAR____TtC6FindMy21FMAccessoryDetailView_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy21FMAccessoryDetailView_manufacturerLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy21FMAccessoryDetailView_serialNumber));

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy21FMAccessoryDetailView_firmware));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy21FMAccessoryDetailView_firmwareUpdate));
}

@end
