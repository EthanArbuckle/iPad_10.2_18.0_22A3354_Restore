@implementation ShaderGraphService

- (ShaderGraphService)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[ShaderGraphService init](&v3, sel_init);
}

+ (NSArray)builtInGeometryPropertyNames
{
  uint64_t v2;
  Class isa;

  if (one-time initialization token for shared != -1)
    swift_once();
  v2 = swift_bridgeObjectRetain();
  specialized _copyCollectionToContiguousArray<A>(_:)(v2);
  swift_bridgeObjectRelease();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_release();
  return (NSArray *)isa;
}

+ (id)materialFromGraph:(id)a3 configuration:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  uint8_t *v9;

  v7 = a3;
  v8 = a4;
  v9 = specialized static ShaderGraphService.createMaterial(from:config:)((uint8_t *)a3, a4);

  return v9;
}

+ (id)materialFromGraph:(id)a3 error:(id *)a4
{
  id v5;
  uint8_t *v6;

  v5 = a3;
  v6 = specialized static ShaderGraphService.createMaterial(from:)((uint8_t *)a3);

  return v6;
}

+ (id)archiveMaterial:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  Class isa;

  v5 = a3;
  specialized static ShaderGraphService.archiveMaterial(_:)(a3);
  v7 = v6;
  v9 = v8;

  isa = Data._bridgeToObjectiveC()().super.isa;
  outlined consume of Data._Representation(v7, v9);
  return isa;
}

+ (id)materialWithArchiveData:(id)a3 error:(id *)a4
{
  uint64_t v4;
  id v5;
  unint64_t v6;
  unint64_t v7;
  NSObject *v8;

  v4 = (uint64_t)a3;
  if (a3)
  {
    v5 = a3;
    v4 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    v7 = v6;

  }
  else
  {
    v7 = 0xF000000000000000;
  }
  v8 = specialized static ShaderGraphService.createMaterialFromArchive(data:)(v4, v7);
  outlined consume of Data?(v4, v7);
  return v8;
}

+ (id)metalLibraryFromMaterial:(id)a3 forDevice:(id)a4 options:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  char *v11;

  v9 = a3;
  swift_unknownObjectRetain();
  v10 = a5;
  v11 = specialized static ShaderGraphService.createLibrary(from:device:options:)((unsigned __int8 *)a3, a4, (uint64_t)v10);

  swift_unknownObjectRelease();
  return v11;
}

+ (id)metalLibraryFromMaterial:(id)a3 forDevice:(id)a4 error:(id *)a5
{
  objc_class *v7;
  _BYTE *v8;
  id v9;
  id v10;
  char *v11;
  objc_super v13;

  v7 = (objc_class *)type metadata accessor for SGREMaterialCompilationOptions();
  v8 = objc_allocWithZone(v7);
  v8[OBJC_IVAR___SGREMaterialCompilationOptions_enableFailedCompileMaterial] = 1;
  v8[OBJC_IVAR___SGREMaterialCompilationOptions_forceEnableTier1FallbackSupport] = 0;
  *(_QWORD *)&v8[OBJC_IVAR___SGREMaterialCompilationOptions_workingColorSpace] = 0;
  v13.receiver = v8;
  v13.super_class = v7;
  v9 = a3;
  swift_unknownObjectRetain();
  v10 = objc_msgSendSuper2(&v13, sel_init);
  v11 = specialized static ShaderGraphService.createLibrary(from:device:options:)((unsigned __int8 *)a3, a4, (uint64_t)v10);
  swift_unknownObjectRelease();

  return v11;
}

@end
