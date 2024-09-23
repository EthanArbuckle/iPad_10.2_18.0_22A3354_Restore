@implementation SKAnalyticsHub

+ (void)addSink:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  v3 = qword_253E88100;
  swift_unknownObjectRetain();
  if (v3 != -1)
    swift_once();
  swift_beginAccess();
  v4 = swift_unknownObjectRetain();
  MEMORY[0x2348AEB10](v4);
  if (*(_QWORD *)((qword_253E880F8 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((qword_253E880F8 & 0xFFFFFFFFFFFFFF8)
                                                                                + 0x18) >> 1)
    sub_22FE7A1EC();
  sub_22FE7A1F8();
  sub_22FE7A1E0();
  swift_endAccess();
  swift_unknownObjectRelease();
}

+ (void)sendEventWithName:(id)a3 eventPayloadBuilder:(id)a4
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = _Block_copy(a4);
  v5 = sub_22FE7A1C8();
  v7 = v6;
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = v4;
  _s10StorageKit14SKAnalyticsHubC9sendEvent4name19eventPayloadBuilderySS_SDySSSo8NSObjectCGSgyctFZ_0(v5, v7, (uint64_t)sub_22FE7A030, v8);
  swift_bridgeObjectRelease();
  swift_release();
}

- (_TtC10StorageKit14SKAnalyticsHub)init
{
  return (_TtC10StorageKit14SKAnalyticsHub *)sub_22FE79D7C(self, (uint64_t)a2, type metadata accessor for SKAnalyticsHub);
}

@end
