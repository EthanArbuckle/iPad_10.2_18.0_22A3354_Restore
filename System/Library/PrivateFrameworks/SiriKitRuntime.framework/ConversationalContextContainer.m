@implementation ConversationalContextContainer

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC14SiriKitRuntime30ConversationalContextContainer *v5;

  v4 = a3;
  v5 = self;
  ConversationalContextContainer.encode(with:)((NSCoder)v4);

}

- (_TtC14SiriKitRuntime30ConversationalContextContainer)initWithCoder:(id)a3
{
  return (_TtC14SiriKitRuntime30ConversationalContextContainer *)ConversationalContextContainer.init(coder:)(a3);
}

- (_TtC14SiriKitRuntime30ConversationalContextContainer)initWithSerializedBackingStore:(id)a3
{
  uint64_t v4;

  swift_unknownObjectRetain();
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  return (_TtC14SiriKitRuntime30ConversationalContextContainer *)ConversationalContextContainer.init(serializedBackingStore:)((uint64_t)&v4);
}

- (id)serializedBackingStore
{
  _TtC14SiriKitRuntime30ConversationalContextContainer *v2;
  void *v3;
  uint64_t v5[4];

  v2 = self;
  ConversationalContextContainer.serializedBackingStore()(v5);

  __swift_project_boxed_opaque_existential_1(v5, v5[3]);
  v3 = (void *)_bridgeAnythingToObjectiveC<A>(_:)();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v5);
  return v3;
}

- (_TtC14SiriKitRuntime30ConversationalContextContainer)init
{
  _TtC14SiriKitRuntime30ConversationalContextContainer *result;

  result = (_TtC14SiriKitRuntime30ConversationalContextContainer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
