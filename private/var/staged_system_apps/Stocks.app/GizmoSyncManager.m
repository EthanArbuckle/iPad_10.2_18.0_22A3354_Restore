@implementation GizmoSyncManager

- (void)dealloc
{
  objc_class *ObjectType;
  _TtC9StocksApp16GizmoSyncManager *v4;
  __CFNotificationCenter *v5;
  __CFNotificationCenter *v6;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType(self);
  v4 = self;
  v5 = CFNotificationCenterGetDarwinNotifyCenter();
  if (qword_100047880 != -1)
    swift_once(&qword_100047880, sub_1000254C0);
  CFNotificationCenterRemoveObserver(v5, v4, (CFNotificationName)qword_10004A9E8, 0);

  v6 = CFNotificationCenterGetDarwinNotifyCenter();
  if (qword_100047888 != -1)
    swift_once(&qword_100047888, sub_100025518);
  CFNotificationCenterRemoveObserver(v6, v4, (CFNotificationName)qword_10004A9F0, 0);

  v7.receiver = v4;
  v7.super_class = ObjectType;
  -[GizmoSyncManager dealloc](&v7, "dealloc");
}

- (void).cxx_destruct
{
  sub_10000778C((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9StocksApp16GizmoSyncManager_watchlistManager));
  sub_10000778C((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9StocksApp16GizmoSyncManager_stockMetadataManager));

  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9StocksApp16GizmoSyncManager_syncDeduper));
}

- (_TtC9StocksApp16GizmoSyncManager)init
{
  _TtC9StocksApp16GizmoSyncManager *result;

  result = (_TtC9StocksApp16GizmoSyncManager *)_swift_stdlib_reportUnimplementedInitializer("StocksApp.GizmoSyncManager", 26, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void)sessionDidDeactivate:(id)a3
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  _TtC9StocksApp16GizmoSyncManager *v11;

  v4 = qword_100047898;
  v5 = a3;
  v11 = self;
  if (v4 != -1)
    swift_once(&qword_100047898, sub_100025634);
  v6 = type metadata accessor for Logger(0);
  v7 = sub_100025750(v6, (uint64_t)qword_10004A9F8);
  v8 = Logger.logObject.getter(v7);
  v9 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "session did deactivate, so reactivating", v10, 2u);
    swift_slowDealloc(v10, -1, -1);
  }

  objc_msgSend(v5, "activateSession");
}

- (void)session:(id)a3 activationDidCompleteWithState:(int64_t)a4 error:(id)a5
{
  id v8;
  _TtC9StocksApp16GizmoSyncManager *v9;
  id v10;

  v8 = a3;
  v9 = self;
  v10 = a5;
  sub_100027280(a4, (uint64_t)a5);

}

- (void)session:(id)a3 didReceiveMessage:(id)a4
{
  uint64_t v6;
  id v7;
  _TtC9StocksApp16GizmoSyncManager *v8;

  v6 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a4, &type metadata for String, (char *)&type metadata for Any + 8, &protocol witness table for String);
  v7 = a3;
  v8 = self;
  sub_100027590(v6);

  swift_bridgeObjectRelease(v6);
}

- (void)sessionDidBecomeInactive:(id)a3
{
  uint64_t v4;
  _TtC9StocksApp16GizmoSyncManager *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  id v11;

  v4 = qword_100047898;
  v11 = a3;
  v5 = self;
  if (v4 != -1)
    swift_once(&qword_100047898, sub_100025634);
  v6 = type metadata accessor for Logger(0);
  v7 = sub_100025750(v6, (uint64_t)qword_10004A9F8);
  v8 = Logger.logObject.getter(v7);
  v9 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "session did become inactive", v10, 2u);
    swift_slowDealloc(v10, -1, -1);
  }

}

@end
