@implementation SpatialSceneDebugRepresentationWrapper

- (_TtC22libViewDebuggerSupport38SpatialSceneDebugRepresentationWrapper)init
{
  _TtC22libViewDebuggerSupport38SpatialSceneDebugRepresentationWrapper *result;

  result = (_TtC22libViewDebuggerSupport38SpatialSceneDebugRepresentationWrapper *)_swift_stdlib_reportUnimplementedInitializer("libViewDebuggerSupport.SpatialSceneDebugRepresentationWrapper", 61, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC22libViewDebuggerSupport38SpatialSceneDebugRepresentationWrapper_sceneDebugRepresentation));
}

- (int64_t)fallback_debugHierarchyVisibility
{
  return 1;
}

+ (id)fallback_debugHierarchyPropertyDescriptions
{
  uint64_t v2;
  uint64_t v3;
  NSArray v4;

  v2 = specialized static SpatialSceneDebugRepresentationWrapper.fallback_debugHierarchyPropertyDescriptions()();
  if (v2)
  {
    v3 = v2;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : Any]);
    v4.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v3);
  }
  else
  {
    v4.super.isa = 0;
  }
  return v4.super.isa;
}

+ (id)fallback_debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 outOptions:(id *)a5 outError:(id *)a6
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  void *v13;
  _QWORD v15[4];
  uint64_t v16[3];
  uint64_t v17;

  v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3, a2);
  v9 = v8;
  v10 = swift_unknownObjectRetain(a4);
  _bridgeAnyObjectToAny(_:)(v15, v10);
  swift_unknownObjectRelease(a4);
  static SpatialSceneDebugRepresentationWrapper.fallback_debugHierarchyValueForProperty(withName:on:outOptions:)(v7, v9, (uint64_t)v15, v16);
  __swift_destroy_boxed_opaque_existential_0(v15);
  swift_bridgeObjectRelease(v9);
  v11 = v17;
  v12 = __swift_project_boxed_opaque_existential_0(v16, v17);
  v13 = (void *)_bridgeAnythingToObjectiveC<A>(_:)(v12, v11);
  __swift_destroy_boxed_opaque_existential_0(v16);
  return v13;
}

@end
