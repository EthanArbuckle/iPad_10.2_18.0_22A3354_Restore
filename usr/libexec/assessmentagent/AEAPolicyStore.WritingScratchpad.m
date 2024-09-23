@implementation AEAPolicyStore.WritingScratchpad

- (void)setNumber:(id)a3 forKey:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _BYTE v10[24];
  _QWORD v11[4];

  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v8 = v7;
  v11[3] = sub_10000622C();
  v11[0] = a3;
  swift_beginAccess(&self->_TtCs12_SwiftObject_opaque[OBJC_IVAR____TtCC15assessmentagent14AEAPolicyStore17WritingScratchpad_backing], v10, 33, 0);
  v9 = a3;
  swift_retain(self);
  swift_bridgeObjectRetain(v8);
  sub_10002BEB4((uint64_t)v11, v6, v8);
  swift_endAccess(v10);

  swift_release(self);
  swift_bridgeObjectRelease(v8);
}

- (void)setString:(id)a3 forKey:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE v12[24];
  _QWORD v13[4];

  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v8 = v7;
  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = v10;
  v13[3] = &type metadata for String;
  v13[0] = v6;
  v13[1] = v8;
  swift_beginAccess(&self->_TtCs12_SwiftObject_opaque[OBJC_IVAR____TtCC15assessmentagent14AEAPolicyStore17WritingScratchpad_backing], v12, 33, 0);
  swift_retain(self);
  swift_bridgeObjectRetain(v11);
  swift_bridgeObjectRetain(v8);
  sub_10002BEB4((uint64_t)v13, v9, v11);
  swift_endAccess(v12);
  swift_release(self);
  swift_bridgeObjectRelease(v8);
  swift_bridgeObjectRelease(v11);
}

- (void)setArray:(id)a3 forKey:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE v10[24];
  _QWORD v11[4];

  v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, (char *)&type metadata for Any + 8);
  v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v9 = v8;
  v11[3] = sub_100004D20(&qword_10008F510);
  v11[0] = v6;
  swift_beginAccess(&self->_TtCs12_SwiftObject_opaque[OBJC_IVAR____TtCC15assessmentagent14AEAPolicyStore17WritingScratchpad_backing], v10, 33, 0);
  swift_retain(self);
  swift_bridgeObjectRetain(v9);
  swift_bridgeObjectRetain(v6);
  sub_10002BEB4((uint64_t)v11, v7, v9);
  swift_endAccess(v10);
  swift_release(self);
  swift_bridgeObjectRelease(v6);
  swift_bridgeObjectRelease(v9);
}

- (BOOL)persistWithError:(id *)a3
{
  swift_retain(self);
  sub_100005C50();
  swift_release(self);
  return 1;
}

@end
