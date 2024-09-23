@implementation SGMaterialConfiguration

- (SGMaterialConfiguration)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR___SGMaterialConfiguration_customGeometryProperties) = (Class)MEMORY[0x24BEE4AF8];
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SGMaterialConfiguration();
  return -[SGMaterialConfiguration init](&v3, sel_init);
}

- (NSArray)customGeometryProperties
{
  Class isa;

  swift_beginAccess();
  type metadata accessor for SGGeometryPropertyDefinition();
  swift_bridgeObjectRetain();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return (NSArray *)isa;
}

- (void)setCustomGeometryProperties:(id)a3
{
  uint64_t v4;
  uint64_t *v5;

  type metadata accessor for SGGeometryPropertyDefinition();
  v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR___SGMaterialConfiguration_customGeometryProperties);
  swift_beginAccess();
  *v5 = v4;
  swift_bridgeObjectRelease();
}

- (BOOL)isEqual:(id)a3
{
  SGMaterialConfiguration *v4;
  SGMaterialConfiguration *v5;
  char v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = SGMaterialConfiguration.isEqual(_:)((uint64_t)v8);

  outlined destroy of Any?((uint64_t)v8);
  return v6 & 1;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
