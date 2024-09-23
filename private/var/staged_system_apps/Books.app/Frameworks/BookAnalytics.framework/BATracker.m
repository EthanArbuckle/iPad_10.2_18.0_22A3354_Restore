@implementation BATracker

- (void)popOrientationData
{
  uint64_t v2;
  SEL v3;
  id v4;
  id v5;
  int64_t v6;
  id v7;
  BOOL v8;
  id v9;
  unint64_t v10;
  _TtC13BookAnalytics9BATracker *v11;

  v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC13BookAnalytics9BATracker_operationHistory);
  v11 = self;
  swift_retain(v2);
  os_unfair_lock_lock((os_unfair_lock_t)(v2 + 24));
  sub_10E81C((BAEventReporter **)(v2 + 16));
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 24));
  swift_release((BAEventReporter *)v2, v3, v4, v5, v6, v7, v8, v9);
  v10 = sub_10E8F4();
  Tracker.pop<A>(type:)(&type metadata for OrientationData, &type metadata for OrientationData, v10);

}

- (void)popSessionListeningData
{
  uint64_t v2;
  SEL v3;
  id v4;
  id v5;
  int64_t v6;
  id v7;
  BOOL v8;
  id v9;
  unint64_t v10;
  _TtC13BookAnalytics9BATracker *v11;

  v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC13BookAnalytics9BATracker_operationHistory);
  v11 = self;
  swift_retain(v2);
  os_unfair_lock_lock((os_unfair_lock_t)(v2 + 24));
  sub_10E938((BAEventReporter **)(v2 + 16));
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 24));
  swift_release((BAEventReporter *)v2, v3, v4, v5, v6, v7, v8, v9);
  v10 = sub_10EA10();
  Tracker.pop<A>(type:)(&type metadata for SessionListeningData, &type metadata for SessionListeningData, v10);

}

- (void)popSessionReadingData
{
  uint64_t v2;
  SEL v3;
  id v4;
  id v5;
  int64_t v6;
  id v7;
  BOOL v8;
  id v9;
  unint64_t v10;
  _TtC13BookAnalytics9BATracker *v11;

  v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC13BookAnalytics9BATracker_operationHistory);
  v11 = self;
  swift_retain(v2);
  os_unfair_lock_lock((os_unfair_lock_t)(v2 + 24));
  sub_10EA54((BAEventReporter **)(v2 + 16));
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 24));
  swift_release((BAEventReporter *)v2, v3, v4, v5, v6, v7, v8, v9);
  v10 = sub_10EB2C();
  Tracker.pop<A>(type:)(&type metadata for SessionReadingData, &type metadata for SessionReadingData, v10);

}

- (void)pushLinkData:(id)a3 file:(id)a4 line:(int64_t)a5
{
  sub_10E27C(self, (uint64_t)a2, a3, (uint64_t)a4, a5, (void (*)(id, uint64_t, uint64_t, uint64_t))BATracker.pushLinkData(_:file:line:));
}

- (void)pushOrientationDataFromFile:(id)a3 line:(int64_t)a4
{
  uint64_t v6;
  BAEventReporter *v7;
  BAEventReporter *v8;
  _TtC13BookAnalytics9BATracker *v9;
  Swift::String v10;
  SEL v11;
  id v12;
  id v13;
  id v14;
  int64_t v15;
  int64_t v16;
  id v17;

  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3, a2);
  v8 = v7;
  v9 = self;
  v10._countAndFlagsBits = v6;
  v10._object = v8;
  BATracker.pushOrientationData(file:line:)(v10, a4);

  swift_bridgeObjectRelease(v8, v11, v12, v13, v14, v15, v16, v17);
}

- (void)pushSessionEndReasonDataWithReason:(int64_t)a3 file:(id)a4 line:(int64_t)a5
{
  sub_10E40C(self, (uint64_t)a2, a3, (uint64_t)a4, a5, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))BATracker.pushSessionEndReasonData(with:file:line:));
}

- (void)pushSessionListeningData:(id)a3 file:(id)a4 line:(int64_t)a5
{
  sub_10E27C(self, (uint64_t)a2, a3, (uint64_t)a4, a5, (void (*)(id, uint64_t, uint64_t, uint64_t))BATracker.pushSessionListeningData(_:file:line:));
}

- (void)pushSessionReadingData:(id)a3 file:(id)a4 line:(int64_t)a5
{
  sub_10E27C(self, (uint64_t)a2, a3, (uint64_t)a4, a5, (void (*)(id, uint64_t, uint64_t, uint64_t))BATracker.pushSessionReadingData(_:file:line:));
}

- (void)pushTabDataWithType:(int64_t)a3 file:(id)a4 line:(int64_t)a5
{
  sub_10E40C(self, (uint64_t)a2, a3, (uint64_t)a4, a5, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))BATracker.pushTabData(with:file:line:));
}

- (void)submitAppSessionStartEvent
{
  uint64_t started;
  uint64_t v4;
  _TtC13BookAnalytics9BATracker *v5;

  started = type metadata accessor for AppSessionStartEvent(0);
  v4 = sub_7E10(&qword_29F010, type metadata accessor for AppSessionStartEvent, (uint64_t)&protocol conformance descriptor for AppSessionStartEvent);
  v5 = self;
  Tracker.submit<A>(_:onlyIfTimed:completion:)(started, 0, 0, 0, started, v4);

}

- (void)timeAppSessionEndEvent
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  _TtC13BookAnalytics9BATracker *v7;
  uint64_t v8;

  v3 = sub_71B4(&qword_29F018);
  __chkstk_darwin(v3);
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for Date(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v7 = self;
  sub_10E5F8((uint64_t)v5);
  sub_10ECD0((uint64_t)v5);

}

- (id)chainWithName:(id)a3
{
  uint64_t v4;
  BAEventReporter *v5;
  BAEventReporter *v6;
  _TtC13BookAnalytics9BATracker *v7;
  id v8;
  SEL v9;
  id v10;
  id v11;
  id v12;
  int64_t v13;
  int64_t v14;
  id v15;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3, a2);
  v6 = v5;
  v7 = self;
  v8 = BATracker.chain(with:)(v4, (uint64_t)v6);

  swift_bridgeObjectRelease(v6, v9, v10, v11, v12, v13, v14, v15);
  return v8;
}

- (void)onSessionChangeWithBlock:(id)a3
{
  objc_class *v4;
  BAEventReporter *v5;
  BAEventReporter *v6;
  _TtC13BookAnalytics9BATracker *v7;
  BAEventReporter *v8;
  SEL v9;
  id v10;
  id v11;
  int64_t v12;
  id v13;
  BOOL v14;
  id v15;
  SEL v16;
  id v17;
  id v18;
  int64_t v19;
  id v20;
  BOOL v21;
  id v22;
  SEL v23;
  id v24;
  id v25;
  int64_t v26;
  id v27;
  BOOL v28;
  id v29;

  v4 = (objc_class *)_Block_copy(a3);
  v5 = (BAEventReporter *)swift_allocObject(&unk_28C9A8, 24, 7);
  v5[1].super.isa = v4;
  v6 = (BAEventReporter *)swift_allocObject(&unk_28C9D0, 32, 7);
  v6[1].super.isa = (Class)sub_1E46B8;
  *(_QWORD *)v6[1].dataProviders = v5;
  v7 = self;
  swift_retain(v5);
  v8 = (BAEventReporter *)Tracker.onSessionChange(block:)(sub_1E4704, v6);

  swift_release(v5, v9, v10, v11, v12, v13, v14, v15);
  swift_release(v8, v16, v17, v18, v19, v20, v21, v22);
  swift_release(v6, v23, v24, v25, v26, v27, v28, v29);
}

- (_TtC13BookAnalytics9BATracker)init
{
  _TtC13BookAnalytics9BATracker *result;

  result = (_TtC13BookAnalytics9BATracker *)_swift_stdlib_reportUnimplementedInitializer("BookAnalytics.BATracker", 23, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  void *v2;
  void *v3;
  int64_t v4;
  void *v5;
  BOOL v6;
  void *v7;
  SEL v9;
  id v10;
  id v11;
  int64_t v12;
  id v13;
  BOOL v14;
  id v15;

  swift_release(*(BAEventReporter **)((char *)&self->super.isa + OBJC_IVAR____TtC13BookAnalytics9BATracker_aaTracker), a2, v2, v3, v4, v5, v6, v7);
  swift_release(*(BAEventReporter **)((char *)&self->super.isa + OBJC_IVAR____TtC13BookAnalytics9BATracker_operationHistory), v9, v10, v11, v12, v13, v14, v15);
  sub_130DE8((uint64_t)self + OBJC_IVAR____TtC13BookAnalytics9BATracker_sessionOperationDelegate);
}

- (NSString)name
{
  _TtC13BookAnalytics9BATracker *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  NSString v6;

  v2 = self;
  v3 = (void *)Tracker.bridgedTracker.getter();
  BridgedTracker.name.getter();
  v5 = v4;

  v6 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v5);
  return (NSString *)v6;
}

- (BOOL)optedIn
{
  void *v3;
  _TtC13BookAnalytics9BATracker *v4;
  id v5;
  void *v6;
  unsigned __int8 v7;

  v3 = (void *)objc_opt_self(MCProfileConnection);
  v4 = self;
  v5 = objc_msgSend(v3, "sharedConnection");
  if (v5)
  {
    v6 = v5;
    v7 = objc_msgSend(v5, "isDiagnosticSubmissionAllowed");

    LOBYTE(v5) = v7;
  }
  else
  {
    __break(1u);
  }
  return (char)v5;
}

- (NSString)path
{
  _TtC13BookAnalytics9BATracker *v2;
  uint64_t v3;
  uint64_t v4;
  BAEventReporter *v5;
  BAEventReporter *v6;
  SEL v7;
  id v8;
  id v9;
  id v10;
  int64_t v11;
  int64_t v12;
  id v13;
  NSString v14;
  SEL v15;
  id v16;
  id v17;
  id v18;
  int64_t v19;
  int64_t v20;
  id v21;
  BAEventReporter *v23;

  v2 = self;
  v23 = (BAEventReporter *)Tracker.path.getter();
  v3 = sub_71B4(&qword_299618);
  v4 = sub_F7668(&qword_2A75E8, &qword_299618, (const char *)&protocol conformance descriptor for [A]);
  BidirectionalCollection<>.joined(separator:)(47, 0xE100000000000000, v3, v4);
  v6 = v5;

  swift_bridgeObjectRelease(v23, v7, v8, v9, v10, v11, v12, v13);
  v14 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v6, v15, v16, v17, v18, v19, v20, v21);
  return (NSString *)v14;
}

- (void)timeRawEvent:(id)a3 :(id)a4 :(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC13BookAnalytics9BATracker *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  BATracker.timeRawEvent(eventNameValue:propertiesValue:startTimeValue:)((JSValue)v8, (JSValue)v9, (JSValue)v10);

}

- (void)submitRawEvent:(id)a3 :(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  BAEventReporter *v12;
  BAEventReporter *v13;
  uint64_t v14;
  BAEventReporter *v15;
  uint64_t v16;
  _TtC13BookAnalytics9BATracker *v17;
  SEL v18;
  id v19;
  id v20;
  id v21;
  int64_t v22;
  int64_t v23;
  id v24;
  SEL v25;
  id v26;
  id v27;
  id v28;
  int64_t v29;
  int64_t v30;
  id v31;
  uint64_t v32;

  v7 = sub_71B4(&qword_29F018);
  __chkstk_darwin(v7);
  v9 = (char *)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3, v10);
  v13 = v12;
  v14 = sub_71B4(&qword_2A38C8);
  v15 = (BAEventReporter *)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a4, &type metadata for String, v14, &protocol witness table for String);
  v16 = type metadata accessor for Date(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v9, 1, 1, v16);
  v17 = self;
  BATracker.submitRawEvent(_:properties:endTime:)(v11, (unint64_t)v13, (uint64_t)v15, (uint64_t)v9);
  sub_88F50((uint64_t)v9, &qword_29F018);

  swift_bridgeObjectRelease(v13, v18, v19, v20, v21, v22, v23, v24);
  swift_bridgeObjectRelease(v15, v25, v26, v27, v28, v29, v30, v31);
}

- (void)submitRawEventEndTime:(id)a3 :(id)a4 :(id)a5
{
  uint64_t v8;
  BAEventReporter *v9;
  BAEventReporter *v10;
  uint64_t v11;
  BAEventReporter *v12;
  id v13;
  _TtC13BookAnalytics9BATracker *v14;
  Swift::String v15;
  SEL v16;
  id v17;
  id v18;
  id v19;
  int64_t v20;
  int64_t v21;
  id v22;
  SEL v23;
  id v24;
  id v25;
  id v26;
  int64_t v27;
  int64_t v28;
  id v29;
  JSValue_optional v30;

  v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3, a2);
  v10 = v9;
  v11 = sub_71B4(&qword_2A38C8);
  v12 = (BAEventReporter *)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a4, &type metadata for String, v11, &protocol witness table for String);
  v13 = a5;
  v14 = self;
  v15._countAndFlagsBits = v8;
  v15._object = v10;
  v30.value.super.isa = (Class)a5;
  BATracker.submitRawEvent(_:properties:endTimeValue:)(v15, (Swift::OpaquePointer)v12, v30);

  swift_bridgeObjectRelease(v10, v16, v17, v18, v19, v20, v21, v22);
  swift_bridgeObjectRelease(v12, v23, v24, v25, v26, v27, v28, v29);
}

- (void)submitRawEventOnlyIfTimed:(id)a3 :(id)a4 :(BOOL)a5
{
  _BOOL8 v5;
  uint64_t v8;
  BAEventReporter *v9;
  BAEventReporter *v10;
  uint64_t v11;
  BAEventReporter *v12;
  _TtC13BookAnalytics9BATracker *v13;
  void *v14;
  SEL v15;
  id v16;
  id v17;
  id v18;
  int64_t v19;
  int64_t v20;
  id v21;
  SEL v22;
  id v23;
  id v24;
  id v25;
  int64_t v26;
  int64_t v27;
  id v28;
  id v29;

  v5 = a5;
  v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3, a2);
  v10 = v9;
  v11 = sub_71B4(&qword_2A38C8);
  v12 = (BAEventReporter *)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a4, &type metadata for String, v11, &protocol witness table for String);
  v13 = self;
  v14 = (void *)sub_1E3D1C(v8, (uint64_t)v10, (uint64_t)v12);
  v29 = (id)Tracker.bridgedTracker.getter(v14);
  objc_msgSend(v29, "submitRawEvent:onlyIfTimed:", v14, v5);

  swift_bridgeObjectRelease(v10, v15, v16, v17, v18, v19, v20, v21);
  swift_bridgeObjectRelease(v12, v22, v23, v24, v25, v26, v27, v28);

}

- (void)pushRawDataEventWithNameData:(id)a3 :(id)a4 :(id)a5
{
  uint64_t v8;
  BAEventReporter *v9;
  BAEventReporter *v10;
  BAEventReporter *v11;
  BAEventReporter *v12;
  _TtC13BookAnalytics9BATracker *v13;
  Swift::String v14;
  SEL v15;
  id v16;
  id v17;
  id v18;
  int64_t v19;
  int64_t v20;
  id v21;
  SEL v22;
  id v23;
  id v24;
  id v25;
  int64_t v26;
  int64_t v27;
  id v28;
  SEL v29;
  id v30;
  id v31;
  id v32;
  int64_t v33;
  int64_t v34;
  id v35;

  v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3, a2);
  v10 = v9;
  v11 = (BAEventReporter *)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a4, &type metadata for String, (char *)&type metadata for Any + 8, &protocol witness table for String);
  v12 = (BAEventReporter *)static Array._unconditionallyBridgeFromObjectiveC(_:)(a5, &type metadata for String);
  v13 = self;
  v14._countAndFlagsBits = v8;
  v14._object = v10;
  BATracker.pushRawDataEvent(with:data:traitValues:)(v14, (Swift::OpaquePointer)v11, (Swift::OpaquePointer)v12);

  swift_bridgeObjectRelease(v10, v15, v16, v17, v18, v19, v20, v21);
  swift_bridgeObjectRelease(v11, v22, v23, v24, v25, v26, v27, v28);
  swift_bridgeObjectRelease(v12, v29, v30, v31, v32, v33, v34, v35);
}

- (void)popRawDataEventWithName:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  _TtC13BookAnalytics9BATracker *v6;
  void *v7;
  NSString v8;

  static String._unconditionallyBridgeFromObjectiveC(_:)(a3, a2);
  v5 = v4;
  v6 = self;
  v7 = (void *)Tracker.bridgedTracker.getter();
  v8 = String._bridgeToObjectiveC()();
  objc_msgSend(v7, "popDataEventByName:", v8);

  swift_bridgeObjectRelease(v5);
}

- (NSDate)sessionStartTime
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  _TtC13BookAnalytics9BATracker *v6;
  uint64_t v7;
  uint64_t v8;
  Class isa;
  uint64_t v11;

  v3 = sub_71B4(&qword_29F018);
  __chkstk_darwin(v3);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = self;
  BATracker.sessionStartTime.getter((uint64_t)v5);

  v7 = type metadata accessor for Date(0);
  v8 = *(_QWORD *)(v7 - 8);
  isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
  {
    isa = Date._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }
  return (NSDate *)isa;
}

- (id)contentPrivateIDForContentID:(id)a3
{
  return sub_12C75C(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))BATracker.contentPrivateID(for:));
}

- (id)contentUserIDForContentID:(id)a3
{
  return sub_12C75C(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))BATracker.contentUserID(for:));
}

- (void)performAfterPrivateDataFetchedWithCompletionHandler:(id)a3
{
  objc_class *v4;
  BAEventReporter *v5;
  _TtC13BookAnalytics9BATracker *v6;
  SEL v7;
  id v8;
  id v9;
  int64_t v10;
  id v11;
  BOOL v12;
  id v13;

  v4 = (objc_class *)_Block_copy(a3);
  v5 = (BAEventReporter *)swift_allocObject(&unk_28C980, 24, 7);
  v5[1].super.isa = v4;
  v6 = self;
  BATracker.performAfterPrivateDataFetched(completionHandler:)((uint64_t)sub_1E46AC, v5);

  swift_release(v5, v7, v8, v9, v10, v11, v12, v13);
}

- (id)newSessionAssertion
{
  return sub_1E3AB8((char *)self, (uint64_t)a2, (SEL *)&selRef_newSessionAssertion);
}

- (id)newSessionExtendingAssertion
{
  return sub_1E3AB8((char *)self, (uint64_t)a2, (SEL *)&selRef_newSessionExtendingAssertion);
}

@end
