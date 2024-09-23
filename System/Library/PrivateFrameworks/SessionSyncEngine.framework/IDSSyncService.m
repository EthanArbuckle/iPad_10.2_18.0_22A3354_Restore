@implementation IDSSyncService

- (void)dealloc
{
  void *v3;
  _TtC17SessionSyncEngine14IDSSyncService *v4;
  id v5;
  int *v6;
  objc_super v7;

  v3 = (void *)objc_opt_self();
  v4 = self;
  v5 = objc_msgSend(v3, sel_defaultCenter);
  objc_msgSend(v5, sel_removeObserver_, v4);

  v6 = (int *)((char *)v4 + OBJC_IVAR____TtC17SessionSyncEngine14IDSSyncService_pairedDeviceNotificationToken);
  swift_beginAccess();
  notify_cancel(*v6);
  v7.receiver = v4;
  v7.super_class = (Class)type metadata accessor for IDSSyncService();
  -[IDSSyncService dealloc](&v7, sel_dealloc);
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (_TtC17SessionSyncEngine14IDSSyncService)init
{
  _TtC17SessionSyncEngine14IDSSyncService *result;

  result = (_TtC17SessionSyncEngine14IDSSyncService *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)pairedDeviceStateChangedWithNotification:(id)a3
{
  id v4;
  _TtC17SessionSyncEngine14IDSSyncService *v5;

  v4 = a3;
  v5 = self;
  sub_1C1292A6C((uint64_t)&unk_1E7A7E5E0, (uint64_t)sub_1C1292C50, (uint64_t)&block_descriptor_18);

}

@end
