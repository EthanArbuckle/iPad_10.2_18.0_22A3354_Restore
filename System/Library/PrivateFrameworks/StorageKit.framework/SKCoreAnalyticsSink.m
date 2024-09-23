@implementation SKCoreAnalyticsSink

- (void)sendEventWithName:(id)a3 eventPayloadBuilder:(id)a4
{
  void *v5;
  uint64_t v6;
  _TtC10StorageKit19SKCoreAnalyticsSink *v7;
  void *v8;
  void *v9;
  _QWORD v10[6];

  v5 = _Block_copy(a4);
  sub_22FE7A1C8();
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = v5;
  v7 = self;
  v8 = (void *)sub_22FE7A1BC();
  v10[4] = sub_22FE7A084;
  v10[5] = v6;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 1107296256;
  v10[2] = sub_22FE798A8;
  v10[3] = &block_descriptor_8;
  v9 = _Block_copy(v10);
  swift_retain();
  swift_release();
  AnalyticsSendEventLazy();
  _Block_release(v9);

  swift_bridgeObjectRelease();
  swift_release();

}

- (_TtC10StorageKit19SKCoreAnalyticsSink)init
{
  return (_TtC10StorageKit19SKCoreAnalyticsSink *)sub_22FE79D7C(self, (uint64_t)a2, type metadata accessor for SKCoreAnalyticsSink);
}

@end
