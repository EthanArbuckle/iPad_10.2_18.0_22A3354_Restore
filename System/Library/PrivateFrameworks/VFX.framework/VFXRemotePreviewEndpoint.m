@implementation VFXRemotePreviewEndpoint

- (VFXWorld)world
{
  return (VFXWorld *)(id)MEMORY[0x1B5E240CC]((char *)self+ OBJC_IVAR____TtC3VFX24VFXRemotePreviewEndpoint_world, a2);
}

- (void)setWorld:(id)a3
{
  swift_unknownObjectWeakAssign();
}

- (NSString)name
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_1B2228728();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (void)setName:(id)a3
{
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;

  v4 = sub_1B222874C();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC3VFX24VFXRemotePreviewEndpoint_name);
  *v5 = v4;
  v5[1] = v6;
  swift_bridgeObjectRelease();
}

- (_TtC3VFX24VFXRemotePreviewEndpoint)initWithName:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  objc_super v9;

  v4 = sub_1B222874C();
  v6 = v5;
  swift_unknownObjectWeakInit();
  v7 = (uint64_t *)((char *)self + OBJC_IVAR____TtC3VFX24VFXRemotePreviewEndpoint_name);
  *v7 = v4;
  v7[1] = v6;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for VFXRemotePreviewEndpoint();
  return -[VFXRemotePreviewEndpoint init](&v9, sel_init);
}

- (_TtC3VFX24VFXRemotePreviewEndpoint)init
{
  _TtC3VFX24VFXRemotePreviewEndpoint *result;

  result = (_TtC3VFX24VFXRemotePreviewEndpoint *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_bridgeObjectRelease();
}

@end
