@implementation MessagingSessionDelegateTrampoline

- (void)sessionStarted:(id)a3
{
  id v4;
  _TtC12searchpartyd34MessagingSessionDelegateTrampoline *v5;

  v4 = a3;
  v5 = self;
  sub_100D46D6C();

}

- (void)sessionEnded:(id)a3 withReason:(unsigned int)a4 error:(id)a5
{
  uint64_t v6;
  id v8;
  _TtC12searchpartyd34MessagingSessionDelegateTrampoline *v9;
  id v10;

  v6 = *(_QWORD *)&a4;
  v8 = a3;
  v9 = self;
  v10 = a5;
  sub_100D46F70(v6, (uint64_t)a5);

}

- (_TtC12searchpartyd34MessagingSessionDelegateTrampoline)init
{
  _TtC12searchpartyd34MessagingSessionDelegateTrampoline *result;

  result = (_TtC12searchpartyd34MessagingSessionDelegateTrampoline *)_swift_stdlib_reportUnimplementedInitializer("searchpartyd.MessagingSessionDelegateTrampoline", 47, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1002EB2D8((uint64_t)self + OBJC_IVAR____TtC12searchpartyd34MessagingSessionDelegateTrampoline_delegate);
}

@end
