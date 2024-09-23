@implementation FMTrustedLocationDetailView

- (_TtC6FindMy27FMTrustedLocationDetailView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1002CBCC4();
}

- (void)editLocationRowTapWithSender:(id)a3
{
  id v4;
  _TtC6FindMy27FMTrustedLocationDetailView *v5;

  v4 = a3;
  v5 = self;
  sub_1002C5E1C(v4);

}

- (void)deleteRowTapWithSender:(id)a3
{
  id v4;
  _TtC6FindMy27FMTrustedLocationDetailView *v5;

  v4 = a3;
  v5 = self;
  sub_1002C63FC(v4);

}

- (void)meRowTapWithSender:(id)a3
{
  id v4;
  _TtC6FindMy27FMTrustedLocationDetailView *v5;

  v4 = a3;
  v5 = self;
  sub_1002CBE08();

}

- (void)dismissPresentedVCWithSender:(id)a3
{
  _TtC6FindMy27FMTrustedLocationDetailView *v5;
  _QWORD v6[4];

  swift_unknownObjectRetain(a3);
  v5 = self;
  _bridgeAnyObjectToAny(_:)(v6, a3);
  swift_unknownObjectRelease(a3);
  sub_1002C738C();

  sub_100029574(v6);
}

- (void)handleAction
{
  _TtC6FindMy27FMTrustedLocationDetailView *v2;

  v2 = self;
  sub_1002C74E4();

}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC6FindMy27FMTrustedLocationDetailView_locationsRow));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC6FindMy27FMTrustedLocationDetailView_safeLocations));
  sub_10005E190((uint64_t)self + OBJC_IVAR____TtC6FindMy27FMTrustedLocationDetailView_delegate);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC6FindMy27FMTrustedLocationDetailView_snapshotMemoryCache));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC6FindMy27FMTrustedLocationDetailView_mapSnapshotter));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC6FindMy27FMTrustedLocationDetailView_mediator));
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.sectionLabel[OBJC_IVAR____TtC6FindMy27FMTrustedLocationDetailView_beaconUUID]);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC6FindMy27FMTrustedLocationDetailView_groupBeaconUUIDs));
  sub_1000051EC((uint64_t)self + OBJC_IVAR____TtC6FindMy27FMTrustedLocationDetailView_editingSafeLocation, (uint64_t *)&unk_1005E2270);
}

@end
