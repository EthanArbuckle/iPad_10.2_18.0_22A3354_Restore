@implementation AsyncOperation

- (BOOL)isAsynchronous
{
  return 1;
}

- (BOOL)isExecuting
{
  char v2;
  unint64_t v3;
  uint64_t v4;

  if (!*((_BYTE *)&self->super.super.isa + OBJC_IVAR____TtC13appleaccountd14AsyncOperation_state))
  {
    v3 = 0xE500000000000000;
    v4 = 0x7964616572;
LABEL_6:
    v2 = _stringCompareWithSmolCheck(_:_:expecting:)(v4, v3, 0x6E69747563657865, 0xE900000000000067, 0);
    goto LABEL_7;
  }
  if (*((_BYTE *)&self->super.super.isa + OBJC_IVAR____TtC13appleaccountd14AsyncOperation_state) != 1)
  {
    v3 = 0xE800000000000000;
    v4 = 0x64656873696E6966;
    goto LABEL_6;
  }
  v2 = 1;
  v3 = 0xE900000000000067;
LABEL_7:
  swift_bridgeObjectRelease(v3);
  return v2 & 1;
}

- (BOOL)isFinished
{
  _TtC13appleaccountd14AsyncOperation *v2;
  char v3;

  v2 = self;
  v3 = sub_10002518C();

  return v3 & 1;
}

- (void)start
{
  _TtC13appleaccountd14AsyncOperation *v2;

  v2 = self;
  sub_1000252D4();

}

- (_TtC13appleaccountd14AsyncOperation)init
{
  _TtC13appleaccountd14AsyncOperation *result;

  result = (_TtC13appleaccountd14AsyncOperation *)_swift_stdlib_reportUnimplementedInitializer("appleaccountd.AsyncOperation", 28, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(_QWORD *)&self->workBlock[OBJC_IVAR____TtC13appleaccountd14AsyncOperation_workBlock]);
}

@end
