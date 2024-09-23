@implementation SGREMaterial

- (NSString)name
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = (uint64_t *)(*(char **)((char *)&self->super.isa + OBJC_IVAR___SGREMaterial_graph) + OBJC_IVAR___SGGraph_name);
  v3 = *v2;
  v4 = v2[1];
  swift_bridgeObjectRetain();
  v5 = (void *)MEMORY[0x24954AF98](v3, v4);
  swift_bridgeObjectRelease();
  return (NSString *)v5;
}

- (NSString)surfaceShaderFunctionName
{
  return (NSString *)@objc SGREMaterial.surfaceShaderFunctionName.getter((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___SGREMaterial_surfaceShaderFunctionName);
}

- (NSString)geometryModifierFunctionName
{
  return (NSString *)@objc SGREMaterial.surfaceShaderFunctionName.getter((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___SGREMaterial_geometryModifierFunctionName);
}

- (NSArray)uniforms
{
  return (NSArray *)@objc SGREMaterial.uniforms.getter((uint64_t)self, (uint64_t)a2, (uint64_t)&OBJC_IVAR___SGREMaterial_uniforms, 0, (void (*)(uint64_t))type metadata accessor for SGInput);
}

- (NSDictionary)textures
{
  Class isa;

  swift_beginAccess();
  swift_bridgeObjectRetain();
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return (NSDictionary *)isa;
}

- (void)setTextures:(id)a3
{
  uint64_t v4;
  uint64_t *v5;

  v4 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR___SGREMaterial_textures);
  swift_beginAccess();
  *v5 = v4;
  swift_bridgeObjectRelease();
}

- (unint64_t)lightingModel
{
  return *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR___SGREMaterial_lightingModel);
}

- (unint64_t)blending
{
  return *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR___SGREMaterial_blending);
}

- (BOOL)hasPremultipliedAlpha
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___SGREMaterial_hasPremultipliedAlpha);
}

- (BOOL)matchUnlitColor
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___SGREMaterial_matchUnlitColor);
}

- (NSArray)warnings
{
  uint64_t v2;

  return (NSArray *)@objc SGREMaterial.uniforms.getter((uint64_t)self, (uint64_t)a2, (uint64_t)&OBJC_IVAR___SGREMaterial_warnings, v2, (void (*)(uint64_t))type metadata accessor for SGWarning);
}

- (BOOL)hasSurfaceShaderUniforms
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___SGREMaterial_hasSurfaceShaderUniforms);
}

- (BOOL)hasGeometryModifierUniforms
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___SGREMaterial_hasGeometryModifierUniforms);
}

- (BOOL)hasConnectedLightSpillNodes
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___SGREMaterial_hasConnectedLightSpillNodes);
}

- (BOOL)hasBackgroundBlur
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___SGREMaterial_hasBackgroundBlur);
}

- (BOOL)hasGeometryModifierOffset
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___SGREMaterial_hasGeometryModifierOffset);
}

- (SGTypeDescription)customUniformsType
{
  return (SGTypeDescription *)objc_retainAutoreleaseReturnValue(*(id *)(*(char **)((char *)&self->super.isa
                                                                                 + OBJC_IVAR___SGREMaterial_customUniformsType)
                                                                      + OBJC_IVAR___SGPropertyDescription_type));
}

- (int64_t)hash
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___SGREMaterial_operationalHash);
}

- (SGREMaterial)init
{
  SGREMaterial *result;

  result = (SGREMaterial *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR___SGREMaterial_edgeDigest;
  v4 = type metadata accessor for SHA512Digest();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

- (BOOL)isEqual:(id)a3
{
  SGREMaterial *v4;
  SGREMaterial *v5;
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
  v6 = SGREMaterial.isEqual(_:)((uint64_t)v8);

  outlined destroy of (input: Input, fNode: MetalFunctionNode?)((uint64_t)v8, &demangling cache variable for type metadata for Any?);
  return v6 & 1;
}

@end
