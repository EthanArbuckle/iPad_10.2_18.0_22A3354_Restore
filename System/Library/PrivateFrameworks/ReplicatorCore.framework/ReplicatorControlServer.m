@implementation ReplicatorControlServer

- (_TtC14ReplicatorCore23ReplicatorControlServer)init
{
  _TtC14ReplicatorCore23ReplicatorControlServer *result;

  result = (_TtC14ReplicatorCore23ReplicatorControlServer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)self + OBJC_IVAR____TtC14ReplicatorCore23ReplicatorControlServer_replicator);
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)self + OBJC_IVAR____TtC14ReplicatorCore23ReplicatorControlServer_notificationPoster);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)self + OBJC_IVAR____TtC14ReplicatorCore23ReplicatorControlServer_clientSettingsStore);

}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v7;
  id v8;
  _TtC14ReplicatorCore23ReplicatorControlServer *v9;

  v7 = a3;
  v8 = a4;
  swift_unknownObjectRetain();
  v9 = self;
  sub_24520EDC4(v8);

  swift_unknownObjectRelease();
}

@end
