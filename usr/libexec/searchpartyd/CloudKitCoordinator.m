@implementation CloudKitCoordinator

- (void)accountDidChange:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = type metadata accessor for Notification(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = swift_retain();
  v10 = static os_log_type_t.default.getter(v9);
  if (qword_1010EA260 != -1)
    swift_once(&qword_1010EA260, sub_100B5DA30);
  os_log(_:dso:log:_:_:)(v10, &_mh_execute_header, qword_1011B7D40, "CKAccountChanged notification received", 38, 2, _swiftEmptyArrayStorage);
  type metadata accessor for Transaction(0);
  static Transaction.named<A>(_:with:)("com.apple.icloud.searchpartyd.CloudKitCoordinator.AccountDidChange", 66, 2, sub_100BD49F0, self, &type metadata for () + 1);
  swift_release();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

@end
