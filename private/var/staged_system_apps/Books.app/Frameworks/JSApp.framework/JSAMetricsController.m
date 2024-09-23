@implementation JSAMetricsController

- (JSAMetricsController)init
{
  return (JSAMetricsController *)MetricsController.init()();
}

- (void)dealloc
{
  JSAMetricsController *v2;

  v2 = self;
  MetricsController.__deallocating_deinit();
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___JSAMetricsController_experienceEvents));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___JSAMetricsController__performanceEvents));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR___JSAMetricsController_acknowledgementObservation));

  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR___JSAMetricsController_isSuspended));
}

- (void)startSubmissionIfAllowed
{
  JSAMetricsController *v2;

  v2 = self;
  sub_5DA00();

}

- (id)newSuspensionAssertion
{
  id result;

  result = *(Class *)((char *)&self->super.isa + OBJC_IVAR___JSAMetricsController_suspensionAssertionProvider);
  if (result)
    return objc_msgSend(result, "newAssertion");
  __break(1u);
  return result;
}

+ (id)shared
{
  if (qword_B81A8 != -1)
    swift_once(&qword_B81A8, sub_5CDE4);
  return (id)qword_B94B0;
}

- (void)recordEvent:(id)a3 :(id)a4
{
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  char v10;
  JSAMetricsController *v11;

  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v8 = v7;
  v9 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a4, &type metadata for String, (char *)&type metadata for Swift.AnyObject + 8, &protocol witness table for String);
  if (v6 == 0xD000000000000010 && v8 == 0x800000000008AA70)
    v10 = 1;
  else
    v10 = _stringCompareWithSmolCheck(_:_:expecting:)(v6, v8, 0xD000000000000010, 0x800000000008AA70, 0);
  v11 = self;
  sub_5DC94(v9, v6, v8, v10 & 1);

  swift_bridgeObjectRelease(v8);
  swift_bridgeObjectRelease(v9);
}

- (void)recordPersonalizedEvent:(id)a3 :(id)a4
{
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  JSAMetricsController *v10;

  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v8 = v7;
  v9 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a4, &type metadata for String, (char *)&type metadata for Swift.AnyObject + 8, &protocol witness table for String);
  v10 = self;
  sub_5DC94(v9, v6, v8, 1);

  swift_bridgeObjectRelease(v8);
  swift_bridgeObjectRelease(v9);
}

- (void)flushUnreportedEvents
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  JSAMetricsController *v9;
  uint64_t v10;
  uint64_t v11;

  v3 = sub_29EF0(&qword_B8B00);
  __chkstk_darwin(v3);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v7 = swift_allocObject(&unk_A1A10, 24, 7);
  swift_unknownObjectWeakInit(v7 + 16);
  v8 = (_QWORD *)swift_allocObject(&unk_A1AB8, 40, 7);
  v8[2] = 0;
  v8[3] = 0;
  v8[4] = v7;
  v9 = self;
  v10 = sub_3B71C((uint64_t)v5, (uint64_t)&unk_B96D8, (uint64_t)v8);
  swift_release(v10);
  sub_5F984((uint64_t)v5);

}

- (void)countingAssertProviderTransitionToNonZero:(id)a3
{
  id v4;
  JSAMetricsController *v5;

  v4 = a3;
  v5 = self;
  _s5JSApp17MetricsControllerC32countingAssertProviderTransition9toNonZeroySo019BUCountingAssertionF0C_tF_0();

}

- (void)countingAssertProviderTransitionToZero:(id)a3
{
  id v4;
  JSAMetricsController *v5;

  v4 = a3;
  v5 = self;
  _s5JSApp17MetricsControllerC32countingAssertProviderTransition6toZeroySo019BUCountingAssertionF0C_tF_0();

}

+ (NSString)JSAPrivacyAcknowledgementDidChange
{
  uint64_t v2;
  uint64_t v3;
  NSString v4;

  if (qword_B81B0 != -1)
    swift_once(&qword_B81B0, sub_5F768);
  static String._unconditionallyBridgeFromObjectiveC(_:)(qword_B94B8);
  v3 = v2;
  v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v3);
  return (NSString *)v4;
}

@end
