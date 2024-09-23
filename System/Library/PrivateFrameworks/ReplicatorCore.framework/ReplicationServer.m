@implementation ReplicationServer

- (_TtC14ReplicatorCore17ReplicationServer)init
{
  _TtC14ReplicatorCore17ReplicationServer *result;

  result = (_TtC14ReplicatorCore17ReplicationServer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)self + OBJC_IVAR____TtC14ReplicatorCore17ReplicationServer_replicator);
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)self + OBJC_IVAR____TtC14ReplicatorCore17ReplicationServer_recordDataStore);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)self + OBJC_IVAR____TtC14ReplicatorCore17ReplicationServer_clientDescriptorStore);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)self + OBJC_IVAR____TtC14ReplicatorCore17ReplicationServer_clientSettingsStore);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)self + OBJC_IVAR____TtC14ReplicatorCore17ReplicationServer_allowedClientVerifier);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)self + OBJC_IVAR____TtC14ReplicatorCore17ReplicationServer_notificationPoster);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v7;
  id v8;
  _TtC14ReplicatorCore17ReplicationServer *v9;

  v7 = a3;
  v8 = a4;
  swift_unknownObjectRetain();
  v9 = self;
  sub_2451E9958(v8);

  swift_unknownObjectRelease();
}

@end
