@implementation SDBoopAtADistanceTransaction

- (NSUUID)identifier
{
  return (NSUUID *)sub_10026905C(self, (uint64_t)a2, (uint64_t (*)(_QWORD))&type metadata accessor for UUID, (void (*)(void))&SFAirDropClient.BoopAtADistance.Transaction.identifier.getter, (uint64_t (*)(void))&UUID._bridgeToObjectiveC());
}

- (NSDate)connectionDate
{
  return (NSDate *)sub_10026905C(self, (uint64_t)a2, (uint64_t (*)(_QWORD))&type metadata accessor for Date, (void (*)(void))&SFAirDropClient.BoopAtADistance.Transaction.connectionDate.getter, (uint64_t (*)(void))&Date._bridgeToObjectiveC());
}

- (NSError)error
{
  return (NSError *)0;
}

- (BOOL)isInitiator
{
  _TtC16DaemoniOSLibrary28SDBoopAtADistanceTransaction *v2;
  char v3;

  v2 = self;
  v3 = SFAirDropClient.BoopAtADistance.Transaction.isInitiator.getter();

  return v3 & 1;
}

- (_TtC16DaemoniOSLibrary28SDBoopAtADistanceTransaction)init
{
  _TtC16DaemoniOSLibrary28SDBoopAtADistanceTransaction *result;

  result = (_TtC16DaemoniOSLibrary28SDBoopAtADistanceTransaction *)_swift_stdlib_reportUnimplementedInitializer("DaemoniOSLibrary.SDBoopAtADistanceTransaction", 45, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR____TtC16DaemoniOSLibrary28SDBoopAtADistanceTransaction_inner;
  v3 = type metadata accessor for SFAirDropClient.BoopAtADistance.Transaction(0, a2);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

@end
