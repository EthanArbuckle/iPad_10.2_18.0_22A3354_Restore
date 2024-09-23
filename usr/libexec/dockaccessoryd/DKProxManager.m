@implementation DKProxManager

- (_TtC14dockaccessoryd13DKProxManager)init
{
  _TtC14dockaccessoryd13DKProxManager *result;

  result = (_TtC14dockaccessoryd13DKProxManager *)_swift_stdlib_reportUnimplementedInitializer("dockaccessoryd.DKProxManager", 28, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14dockaccessoryd13DKProxManager_proxCard));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14dockaccessoryd13DKProxManager_discoveryTxn));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14dockaccessoryd13DKProxManager_primaryToken));
  sub_1000EEA20((uint64_t)self + OBJC_IVAR____TtC14dockaccessoryd13DKProxManager_delegate);
}

- (void)remoteAlertHandleDidActivate:(id)a3
{
  id v4;
  _TtC14dockaccessoryd13DKProxManager *v5;

  v4 = a3;
  v5 = self;
  sub_1000EEAA8(v4);

}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  id v4;
  _TtC14dockaccessoryd13DKProxManager *v5;

  v4 = a3;
  v5 = self;
  sub_1000EE4B4(v4);

}

- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4
{
  id v6;
  _TtC14dockaccessoryd13DKProxManager *v7;
  id v8;

  v6 = a3;
  v7 = self;
  v8 = a4;
  sub_1000EEC58(v6, (uint64_t)a4);

}

@end
