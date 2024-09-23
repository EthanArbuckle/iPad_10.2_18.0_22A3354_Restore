@implementation IntentSession

- (void)nearOwnerBeaconNotObserved
{
  uint64_t v3;
  _QWORD v4[6];

  v3 = swift_allocObject(&unk_101086700, 24, 7);
  swift_weakInit(v3 + 16, self);
  type metadata accessor for Transaction(0);
  v4[2] = self;
  v4[3] = sub_100686380;
  v4[4] = v3;
  swift_retain();
  swift_retain();
  static Transaction.named<A>(_:with:)("IntentSession.intentAsync", 25, 2, sub_10068642C, v4, &type metadata for () + 1);
  swift_release();
  swift_release_n(v3, 2);
}

- (void)intentTimerFiredWithTimer:(id)a3
{
  uint64_t v5;
  id v6;
  _QWORD v7[6];

  v5 = swift_allocObject(&unk_101086700, 24, 7);
  swift_weakInit(v5 + 16, self);
  type metadata accessor for Transaction(0);
  v7[2] = self;
  v7[3] = sub_1006863F4;
  v7[4] = v5;
  v6 = a3;
  swift_retain();
  swift_retain();
  static Transaction.named<A>(_:with:)("IntentSession.intentAsync", 25, 2, sub_10068642C, v7, &type metadata for () + 1);

  swift_release();
  swift_release_n(v5, 2);
}

@end
