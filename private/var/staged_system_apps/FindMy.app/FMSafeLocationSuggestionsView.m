@implementation FMSafeLocationSuggestionsView

- (_TtC6FindMy29FMSafeLocationSuggestionsView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10042B68C();
}

- (void)locationRowTapWithSender:(id)a3
{
  id v4;
  _TtC6FindMy29FMSafeLocationSuggestionsView *v5;

  v4 = a3;
  v5 = self;
  sub_10042959C(v4);

}

- (_TtC6FindMy29FMSafeLocationSuggestionsView)init
{
  _TtC6FindMy29FMSafeLocationSuggestionsView *result;

  result = (_TtC6FindMy29FMSafeLocationSuggestionsView *)_swift_stdlib_reportUnimplementedInitializer("FindMy.FMSafeLocationSuggestionsView", 36, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC6FindMy29FMSafeLocationSuggestionsView_locationsRow));
  sub_10005E190((uint64_t)self + OBJC_IVAR____TtC6FindMy29FMSafeLocationSuggestionsView_delegate);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC6FindMy29FMSafeLocationSuggestionsView_safeLocations));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC6FindMy29FMSafeLocationSuggestionsView_snapshotMemoryCache));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC6FindMy29FMSafeLocationSuggestionsView_mapSnapshotter));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC6FindMy29FMSafeLocationSuggestionsView_mediator));
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.sectionLabel[OBJC_IVAR____TtC6FindMy29FMSafeLocationSuggestionsView_beaconUUID]);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC6FindMy29FMSafeLocationSuggestionsView_groupBeaconUUIDs));
}

@end
