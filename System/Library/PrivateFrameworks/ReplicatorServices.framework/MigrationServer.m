@implementation MigrationServer

- (_TtC18ReplicatorServices15MigrationServer)init
{
  return (_TtC18ReplicatorServices15MigrationServer *)MigrationServer.init()();
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();

  sub_2453F79C8(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC18ReplicatorServices15MigrationServer_localDeviceIDProvider));
  sub_2453F79C8(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC18ReplicatorServices15MigrationServer_recordProvider));
  sub_2453F79C8(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC18ReplicatorServices15MigrationServer_deviceProvider));
  sub_2453F79C8(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC18ReplicatorServices15MigrationServer_clientDescriptorProvider));
  sub_2453F79C8(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC18ReplicatorServices15MigrationServer_eraseHandler));

}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v7;
  id v8;
  _TtC18ReplicatorServices15MigrationServer *v9;

  v7 = a3;
  v8 = a4;
  swift_unknownObjectRetain();
  v9 = self;
  sub_245429D24(v8);

  swift_unknownObjectRelease();
}

@end
