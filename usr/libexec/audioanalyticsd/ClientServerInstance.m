@implementation ClientServerInstance

- (void)setWithServiceType:(unsigned __int16)a3 for:(int64_t)a4
{
  swift_retain(self);
  sub_1000055F8(a3, a4);
  swift_release(self);
}

- (void)setWithConfiguration:(id)a3 for:(int64_t)a4
{
  uint64_t v6;

  v6 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String, (char *)&type metadata for Any + 8, &protocol witness table for String);
  swift_retain(self);
  sub_100006384(v6, a4);
  swift_release(self);
  swift_bridgeObjectRelease(v6);
}

- (void)createSessionWith:(int64_t)a3
{
  sub_1000065AC((uint64_t)self, (uint64_t)a2, a3, (uint64_t)&unk_1000397F0, (uint64_t)sub_100007818, (uint64_t)&unk_100039808);
}

- (void)startSessionFor:(int64_t)a3
{
  sub_1000065AC((uint64_t)self, (uint64_t)a2, a3, (uint64_t)&unk_100039520, (uint64_t)sub_10000FA04, (uint64_t)&unk_100039538);
}

- (void)getServiceNameFor:(int64_t)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject(&unk_1000396B0, 24, 7);
  *(_QWORD *)(v7 + 16) = v6;
  swift_retain(self);
  sub_1000109F0(a3, (uint64_t)sub_100013264, v7, (uint64_t)&unk_1000396D8, (uint64_t)sub_1000132C0, (uint64_t)&unk_1000396F0);
  swift_release(self);
  swift_release(v7);
}

- (void)validateFor:(int64_t)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject(&unk_100039570, 24, 7);
  *(_QWORD *)(v7 + 16) = v6;
  swift_retain(self);
  sub_1000109F0(a3, (uint64_t)sub_1000131D8, v7, (uint64_t)&unk_100039598, (uint64_t)sub_1000131F0, (uint64_t)&unk_1000395B0);
  swift_release(self);
  swift_release(v7);
}

- (void)sendWithMessage:(id)a3 with:(unsigned int)a4 and:(unsigned __int16)a5 for:(int64_t)a6
{
  uint64_t v10;

  v10 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String, (char *)&type metadata for Any + 8, &protocol witness table for String);
  swift_retain(self);
  sub_100011074(v10, a4, a5, a6);
  swift_release(self);
  swift_bridgeObjectRelease(v10);
}

- (void)stopSessionFor:(int64_t)a3
{
  sub_1000065AC((uint64_t)self, (uint64_t)a2, a3, (uint64_t)&unk_100039430, (uint64_t)sub_100013194, (uint64_t)&unk_100039448);
}

- (void)destroySessionFor:(int64_t)a3
{
  sub_1000065AC((uint64_t)self, (uint64_t)a2, a3, (uint64_t)&unk_1000392F0, (uint64_t)sub_1000130D0, (uint64_t)&unk_100039308);
}

- (void)requestMessageFor:(int64_t)a3 category:(unsigned int)a4 type:(unsigned __int16)a5 reply:(id)a6
{
  void *v10;
  uint64_t v11;

  v10 = _Block_copy(a6);
  v11 = swift_allocObject(&unk_1000393B8, 24, 7);
  *(_QWORD *)(v11 + 16) = v10;
  swift_retain(self);
  sub_1000121D4(a3, a4, a5, (uint64_t)sub_100013168, v11);
  swift_release(self);
  swift_release(v11);
}

- (void)getTailspinSessionIDFor:(int64_t)a3 reply:(id)a4
{
  void *v6;
  uint64_t v7;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject(&unk_100039340, 24, 7);
  *(_QWORD *)(v7 + 16) = v6;
  swift_retain(self);
  sub_100012860(a3, (uint64_t)sub_100013144, v7);
  swift_release(self);
  swift_release(v7);
}

@end
