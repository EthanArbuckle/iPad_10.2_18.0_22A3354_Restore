@implementation SGGeometryPropertyDefinition

- (NSString)name
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___SGGeometryPropertyDefinition_name);
  v3 = *(_QWORD *)&self->name[OBJC_IVAR___SGGeometryPropertyDefinition_name];
  swift_bridgeObjectRetain();
  v4 = (void *)MEMORY[0x24954AF98](v2, v3);
  swift_bridgeObjectRelease();
  return (NSString *)v4;
}

+ (id)geometryPropertyWithName:(id)a3 mappingTo:(id)a4
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v4 = a4;
  if (!a3)
  {
    v5 = 0;
    v7 = 0;
    if (a4)
      goto LABEL_3;
LABEL_5:
    v8 = 0;
    goto LABEL_6;
  }
  v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v7 = v6;
  if (!v4)
    goto LABEL_5;
LABEL_3:
  v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v4 = v9;
LABEL_6:
  swift_getObjCClassMetadata();
  v10 = (void *)static SGGeometryPropertyDefinition.create(name:mappingTo:)(v5, v7, v8, (uint64_t)v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v10;
}

- (SGGeometryPropertyDefinition)init
{
  SGGeometryPropertyDefinition *result;

  result = (SGGeometryPropertyDefinition *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (NSString)description
{
  SGGeometryPropertyDefinition *v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = self;
  v3 = SGGeometryPropertyDefinition.description.getter();
  v5 = v4;

  v6 = (void *)MEMORY[0x24954AF98](v3, v5);
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
