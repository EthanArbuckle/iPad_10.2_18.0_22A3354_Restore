@implementation MigrationClient

- (_TtC14ReplicatorCore15MigrationClient)init
{
  _TtC14ReplicatorCore15MigrationClient *result;

  result = (_TtC14ReplicatorCore15MigrationClient *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)self + OBJC_IVAR____TtC14ReplicatorCore15MigrationClient_recordMetadataStore);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)self + OBJC_IVAR____TtC14ReplicatorCore15MigrationClient_recordStore);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)self + OBJC_IVAR____TtC14ReplicatorCore15MigrationClient_clientDescriptorStore);
  v3 = (char *)self + OBJC_IVAR____TtC14ReplicatorCore15MigrationClient_url;
  v4 = sub_245243790();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

}

@end
