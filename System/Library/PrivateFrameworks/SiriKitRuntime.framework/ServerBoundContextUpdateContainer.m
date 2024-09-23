@implementation ServerBoundContextUpdateContainer

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC14SiriKitRuntime33ServerBoundContextUpdateContainer)initWithCoder:(id)a3
{
  return (_TtC14SiriKitRuntime33ServerBoundContextUpdateContainer *)ServerBoundContextUpdateContainer.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v4;
  id v5;
  _TtC14SiriKitRuntime33ServerBoundContextUpdateContainer *v6;
  id v7;

  v4 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC14SiriKitRuntime33ServerBoundContextUpdateContainer_contextUpdate);
  v5 = a3;
  v6 = self;
  v7 = (id)MEMORY[0x1B5E432E8](0xD00000000000001ALL, 0x80000001B4EF4590);
  objc_msgSend(v5, sel_encodeObject_forKey_, v4, v7);

}

- (_TtC14SiriKitRuntime33ServerBoundContextUpdateContainer)initWithSerializedBackingStore:(id)a3
{
  uint64_t v4;

  swift_unknownObjectRetain();
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  return (_TtC14SiriKitRuntime33ServerBoundContextUpdateContainer *)ServerBoundContextUpdateContainer.init(serializedBackingStore:)((uint64_t)&v4);
}

- (id)serializedBackingStore
{
  _TtC14SiriKitRuntime33ServerBoundContextUpdateContainer *v2;
  void *v3;
  uint64_t v5[4];

  v2 = self;
  ServerBoundContextUpdateContainer.serializedBackingStore()(v5);

  __swift_project_boxed_opaque_existential_1(v5, v5[3]);
  v3 = (void *)_bridgeAnythingToObjectiveC<A>(_:)();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v5);
  return v3;
}

- (_TtC14SiriKitRuntime33ServerBoundContextUpdateContainer)init
{
  _TtC14SiriKitRuntime33ServerBoundContextUpdateContainer *result;

  result = (_TtC14SiriKitRuntime33ServerBoundContextUpdateContainer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14SiriKitRuntime33ServerBoundContextUpdateContainer_contextUpdate));
}

@end
