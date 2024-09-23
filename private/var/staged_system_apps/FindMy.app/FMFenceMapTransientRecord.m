@implementation FMFenceMapTransientRecord

- (NSString)description
{
  _TtC6FindMy25FMFenceMapTransientRecord *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  sub_10027899C();
  v4 = v3;

  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

- (_TtC6FindMy25FMFenceMapTransientRecord)init
{
  _TtC6FindMy25FMFenceMapTransientRecord *result;

  result = (_TtC6FindMy25FMFenceMapTransientRecord *)_swift_stdlib_reportUnimplementedInitializer("FindMy.FMFenceMapTransientRecord", 32, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->identifier[OBJC_IVAR____TtC6FindMy25FMFenceMapTransientRecord_identifier]);
  sub_1000051EC((uint64_t)self + OBJC_IVAR____TtC6FindMy25FMFenceMapTransientRecord_location, (uint64_t *)&unk_1005D3350);
  sub_1000051EC((uint64_t)self + OBJC_IVAR____TtC6FindMy25FMFenceMapTransientRecord_labelledLocation, (uint64_t *)&unk_1005DD820);

  swift_bridgeObjectRelease(*(_QWORD *)&self->identifier[OBJC_IVAR____TtC6FindMy25FMFenceMapTransientRecord_title]);
  sub_1000051EC((uint64_t)self + OBJC_IVAR____TtC6FindMy25FMFenceMapTransientRecord_addressType, &qword_1005D3418);
  swift_bridgeObjectRelease(*(_QWORD *)&self->identifier[OBJC_IVAR____TtC6FindMy25FMFenceMapTransientRecord_displayAddress]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->identifier[OBJC_IVAR____TtC6FindMy25FMFenceMapTransientRecord_labelLocalizedValue]);
  sub_1000051EC((uint64_t)self + OBJC_IVAR____TtC6FindMy25FMFenceMapTransientRecord_fmfPlacemark, &qword_1005D3370);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC6FindMy25FMFenceMapTransientRecord_completedGeoWorkGroup));
}

@end
