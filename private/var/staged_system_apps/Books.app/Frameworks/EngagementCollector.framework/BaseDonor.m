@implementation BaseDonor

- (NSString)type
{
  char *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;
  _BYTE v7[24];

  v2 = (char *)self + OBJC_IVAR____TtC19EngagementCollector9BaseDonor_type;
  swift_beginAccess((char *)self + OBJC_IVAR____TtC19EngagementCollector9BaseDonor_type, v7, 0, 0);
  v3 = *((_QWORD *)v2 + 1);
  swift_bridgeObjectRetain(v3, v4);
  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v3);
  return (NSString *)v5;
}

- (void)setType:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9[24];

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3, a2);
  v6 = v5;
  v7 = (uint64_t *)((char *)self + OBJC_IVAR____TtC19EngagementCollector9BaseDonor_type);
  swift_beginAccess(v7, v9, 1, 0);
  v8 = v7[1];
  *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease(v8);
}

- (NSArray)eventConfigurations
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  Class isa;
  _BYTE v7[24];

  v2 = (uint64_t *)((char *)self + OBJC_IVAR____TtC19EngagementCollector9BaseDonor_eventConfigurations);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC19EngagementCollector9BaseDonor_eventConfigurations, v7, 0, 0);
  v3 = *v2;
  type metadata accessor for BasePropertyConfiguration();
  swift_bridgeObjectRetain(v3, v4);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return (NSArray *)isa;
}

- (void)setEventConfigurations:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9[24];

  v5 = type metadata accessor for BasePropertyConfiguration();
  v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v5);
  v7 = (uint64_t *)((char *)self + OBJC_IVAR____TtC19EngagementCollector9BaseDonor_eventConfigurations);
  swift_beginAccess(v7, v9, 1, 0);
  v8 = *v7;
  *v7 = v6;
  swift_bridgeObjectRelease(v8);
}

- (_TtC19EngagementCollector9BaseDonor)initWithType:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3, a2);
  return (_TtC19EngagementCollector9BaseDonor *)BaseDonor.init(type:)(v3, v4);
}

- (void)donateWithConfiguration:(id)a3 context:(id)a4 donationCompleteBlock:(id)a5
{
  void *v7;
  id v8;
  _TtC19EngagementCollector9BaseDonor *v9;

  v7 = _Block_copy(a5);
  v8 = a3;
  v9 = self;
  _Block_release(v7);
  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD00000000000002CLL, 0x8000000000033820, "EngagementCollector/Donor.swift", 31, 2, 26, 0);
  __break(1u);
}

- (void)propertyDidChange:(id)a3 propertyConfiguration:(id)a4
{
  id v7;
  _TtC19EngagementCollector9BaseDonor *v8;

  swift_unknownObjectRetain(a3);
  v7 = a4;
  v8 = self;
  sub_249C4((uint64_t)a3, v7);

  swift_unknownObjectRelease(a3);
}

- (_TtC19EngagementCollector9BaseDonor)init
{
  _TtC19EngagementCollector9BaseDonor *result;

  result = (_TtC19EngagementCollector9BaseDonor *)_swift_stdlib_reportUnimplementedInitializer("EngagementCollector.BaseDonor", 29, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->type[OBJC_IVAR____TtC19EngagementCollector9BaseDonor_type]);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC19EngagementCollector9BaseDonor_eventConfigurations));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC19EngagementCollector9BaseDonor_observations));

}

- (void)addDonorObserver:(id)a3
{
  sub_2571C(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))BaseDonor.add(_:));
}

- (void)removeDonorObserver:(id)a3
{
  sub_2571C(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))BaseDonor.remove(_:));
}

- (BOOL)isObservedBy:(id)a3
{
  _TtC19EngagementCollector9BaseDonor *v5;
  char v6;

  swift_unknownObjectRetain(a3);
  v5 = self;
  v6 = BaseDonor.isObserved(by:)((uint64_t)a3);
  swift_unknownObjectRelease(a3);

  return v6 & 1;
}

@end
