@implementation CRLInsertEditURLAlert

- (void)dealloc
{
  _TtC8Freeform21CRLInsertEditURLAlert *v2;

  v2 = self;
  sub_10078FC10();
}

- (void).cxx_destruct
{
  sub_1004CBB0C((uint64_t)self + OBJC_IVAR____TtC8Freeform21CRLInsertEditURLAlert_delegate);
  sub_1004CB800((uint64_t)self + OBJC_IVAR____TtC8Freeform21CRLInsertEditURLAlert_initialURL, &qword_1013E04D0);

}

- (_TtC8Freeform21CRLInsertEditURLAlert)init
{
  _TtC8Freeform21CRLInsertEditURLAlert *result;

  result = (_TtC8Freeform21CRLInsertEditURLAlert *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLInsertEditURLAlert", 30, "init()", 6, 0);
  __break(1u);
  return result;
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  id v12;
  _TtC8Freeform21CRLInsertEditURLAlert *v13;

  length = a4.length;
  location = a4.location;
  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v11 = v10;
  v12 = a3;
  v13 = self;
  sub_10079142C(v12, location, length, v9, v11);

  swift_bridgeObjectRelease();
  return 1;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v4;
  _TtC8Freeform21CRLInsertEditURLAlert *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_1007916BC(v4);

  return self & 1;
}

@end
