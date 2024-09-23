@implementation AssertionClient

- (_TtC16SessionAssertion15AssertionClient)init
{
  return (_TtC16SessionAssertion15AssertionClient *)AssertionClient.init()();
}

- (void).cxx_destruct
{

  sub_1B40AA76C((uint64_t)self + OBJC_IVAR____TtC16SessionAssertion15AssertionClient_delegate);
}

- (void)didInvalidate:(id)a3
{
  id v4;
  _TtC16SessionAssertion15AssertionClient *v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;

  v4 = a3;
  v5 = self;
  v6 = sub_1B40BC8DC();
  v8 = v7;

  v9 = (void *)sub_1B40BC8D0();
  sub_1B40BC840();
  swift_allocObject();
  sub_1B40BC834();
  v10 = sub_1B40BC8DC();
  v12 = v11;
  sub_1B40A9CC0();
  sub_1B40BC828();
  sub_1B40A3A80(v10, v12);

  swift_release();
  AssertionClient.didInvalidate(invalidationMessage:)((uint64_t)&v13);
  swift_bridgeObjectRelease();
  sub_1B40A3A80(v6, v8);

}

- (void)didConnect
{
  _TtC16SessionAssertion15AssertionClient *v2;

  v2 = self;
  AssertionClient.didConnect()();

}

@end
