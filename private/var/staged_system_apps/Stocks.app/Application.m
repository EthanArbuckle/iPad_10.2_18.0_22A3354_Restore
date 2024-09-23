@implementation Application

- (_TtC9StocksApp11Application)init
{
  objc_class *ObjectType;
  char *v4;
  objc_super v6;

  ObjectType = (objc_class *)swift_getObjectType(self);
  v4 = (char *)self + OBJC_IVAR____TtC9StocksApp11Application_keyboardInputMonitor;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_QWORD *)v4 + 4) = 0;
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC9StocksApp11Application_shouldChangeWindowFrameSize) = 0;
  v6.receiver = self;
  v6.super_class = ObjectType;
  return -[Application init](&v6, "init");
}

- (id)_extendLaunchTest
{
  return String._bridgeToObjectiveC()();
}

- (BOOL)shouldChangeWindowFrameSize
{
  return *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC9StocksApp11Application_shouldChangeWindowFrameSize);
}

- (void)setShouldChangeWindowFrameSize:(BOOL)a3
{
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC9StocksApp11Application_shouldChangeWindowFrameSize) = a3;
}

- (void)sendEvent:(id)a3
{
  id v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[3];
  uint64_t v10;
  uint64_t v11;
  _BYTE v12[24];
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)swift_getObjectType(self);
  v4 = a3;
  v5 = (char *)v13.receiver;
  -[Application sendEvent:](&v13, "sendEvent:", v4);
  v6 = (uint64_t)&v5[OBJC_IVAR____TtC9StocksApp11Application_keyboardInputMonitor];
  swift_beginAccess(&v5[OBJC_IVAR____TtC9StocksApp11Application_keyboardInputMonitor], v12, 0, 0);
  if (*(_QWORD *)(v6 + 24))
  {
    sub_100010534(v6, (uint64_t)v9);
    v7 = v10;
    v8 = v11;
    sub_10000C1E8(v9, v10);
    dispatch thunk of KeyboardInputMonitorType.handle(_:)(v4, v7, v8);
    sub_10000778C(v9);
  }

}

- (BOOL)shouldRecordExtendedLaunchTime
{
  return 1;
}

- (void).cxx_destruct
{
  sub_10001C170((uint64_t)self + OBJC_IVAR____TtC9StocksApp11Application_keyboardInputMonitor);
}

@end
