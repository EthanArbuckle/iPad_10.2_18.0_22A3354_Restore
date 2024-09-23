@implementation PKDrawingCoherence

- (PKDrawingCoherence)init
{
  return (PKDrawingCoherence *)PKDrawingCoherence.init()();
}

- (PKDrawingCoherence)initWithData:(id)a3 error:(id *)a4
{
  id v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  PKDrawingCoherence *v8;

  v4 = a3;
  v5 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  v7 = v6;

  v8 = (PKDrawingCoherence *)specialized PKDrawingCoherence.init(data:)();
  outlined consume of Data._Representation(v5, v7);
  return v8;
}

- (PKDrawingCoherence)initWithStrokes:(id)a3 fromDrawing:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  PKDrawingCoherence *v13;
  uint64_t v14;
  PKDrawingCoherence *v15;
  uint64_t v17;
  _BYTE v18[32];

  v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for PKDrawing?);
  MEMORY[0x1E0C80A78](v6, v7);
  v9 = v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0) + 16;
  swift_unknownObjectRetain();
  v10 = a4;
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  if (v10)
  {
    static PKDrawing._unconditionallyBridgeFromObjectiveC(_:)();

    v11 = type metadata accessor for PKDrawing();
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v9, 0, 1, v11);
  }
  else
  {
    v12 = type metadata accessor for PKDrawing();
    (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  }
  v13 = -[PKDrawingCoherence init](self, sel_init);
  MEMORY[0x1E0C80A78](v13, v14);
  *(&v17 - 2) = (uint64_t)v18;
  *(&v17 - 1) = (uint64_t)v9;
  swift_beginAccess();
  v15 = v13;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Capsule<PKDrawingStruct>);
  Capsule.mutate<A>(_:)();
  swift_endAccess();

  outlined destroy of StocksKitCurrencyCache.Provider?((uint64_t)v9, &demangling cache variable for type metadata for PKDrawing?);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
  return v15;
}

- (PKDrawingCoherence)initWithDrawing:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  uint64_t v10;

  v4 = type metadata accessor for PKDrawing();
  MEMORY[0x1E0C80A78](v4, v5);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = a3;
  static PKDrawing._unconditionallyBridgeFromObjectiveC(_:)();

  return (PKDrawingCoherence *)PKDrawingCoherence.init(drawing:)((uint64_t)v7);
}

- (PKDrawingCoherence)initWithData:(id)a3 loadNonInkingStrokes:(BOOL)a4 error:(id *)a5
{
  id v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;

  v5 = a3;
  v6 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = v7;

  return (PKDrawingCoherence *)specialized PKDrawingCoherence.init(data:loadNonInkingStrokes:)(v6, v8);
}

- (PKDrawingCoherence)initWithCoder:(id)a3
{
  PKDrawingCoherence *result;

  result = (PKDrawingCoherence *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

+ (NSString)fileType
{
  uint64_t v2;
  void *v3;

  v2 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v3 = (void *)MEMORY[0x1DF0E41AC](v2);
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (Class)strokeClass
{
  type metadata accessor for PKStrokeCoherence(0);
  return (Class)swift_getObjCClassFromMetadata();
}

- (id)newStroke
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  PKDrawingCoherence *v9;
  id v10;
  Class isa;
  uint64_t v13;

  v3 = type metadata accessor for PKStroke();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3, v5);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = objc_allocWithZone((Class)type metadata accessor for PKStrokeCoherence(0));
  v9 = self;
  v10 = objc_msgSend(v8, sel_init);
  static PKStroke._unconditionallyBridgeFromObjectiveC(_:)();

  isa = PKStroke._bridgeToObjectiveC()().super.isa;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  return isa;
}

- (Class)strokeSelectionClass
{
  type metadata accessor for NSObject(0, (unint64_t *)&lazy cache variable for type metadata for PKStrokeSelectionCoherence);
  return (Class)swift_getObjCClassFromMetadata();
}

- (id)dataRepresentation
{
  PKDrawingCoherence *v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  Class isa;

  v2 = self;
  v3 = PKDrawingCoherence.dataRepresentation()();
  v5 = v4;

  isa = Data._bridgeToObjectiveC()().super.isa;
  outlined consume of Data._Representation(v3, v5);
  return isa;
}

- (id)serializeWithVersion:(int64_t)a3
{
  PKDrawingCoherence *v4;
  PKDrawing *v5;
  void *v6;
  void *v7;
  Class isa;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;

  v4 = self;
  PKDrawingCoherence.concreteDrawing()(v5);
  v7 = v6;
  isa = (Class)objc_msgSend(v6, sel_serializeWithVersion_, a3);

  if (isa)
  {
    v9 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    v11 = v10;

    isa = Data._bridgeToObjectiveC()().super.isa;
    outlined consume of Data._Representation(v9, v11);
  }
  else
  {

  }
  return isa;
}

- (id)serializeTransiently
{
  PKDrawingCoherence *v2;
  PKDrawing *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  Class isa;

  v2 = self;
  PKDrawingCoherence.concreteDrawing()(v3);
  v5 = v4;
  v6 = objc_msgSend(v4, sel_serializeTransiently);

  v7 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  v9 = v8;

  isa = Data._bridgeToObjectiveC()().super.isa;
  outlined consume of Data._Representation(v7, v9);
  return isa;
}

- (PKDrawingVersion)version
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  PKDrawingCoherence *v14;
  objc_class *v15;
  id v16;
  PKDrawingCoherence *v17;
  uint64_t v19;
  objc_super v20;

  v3 = type metadata accessor for UUID();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3, v5);
  v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Capsule<PKDrawingStruct>);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8, v10);
  v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = (char *)self + OBJC_IVAR___PKDrawingCoherence_model;
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v12, v13, v8);
  v14 = self;
  Capsule.versionUUID.getter();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
  v15 = (objc_class *)type metadata accessor for PKDrawingCoherenceVersion(0);
  v16 = objc_allocWithZone(v15);
  (*(void (**)(uint64_t, char *, uint64_t))(v4 + 16))((uint64_t)v16 + OBJC_IVAR___PKDrawingCoherenceVersion_versionUUID, v7, v3);
  v20.receiver = v16;
  v20.super_class = v15;
  v17 = -[PKDrawingCoherence init](&v20, sel_init);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);

  return (PKDrawingVersion *)v17;
}

- (int64_t)requiredContentVersion
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  void (*v17)(char *, char *, uint64_t);
  PKDrawingCoherence *v18;
  void (*v19)(char *, uint64_t);
  int64_t v20;
  uint64_t v22;

  v3 = type metadata accessor for PKDrawingStruct();
  MEMORY[0x1E0C80A78](v3, v4);
  v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Capsule<PKDrawingStruct>);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7, v9);
  v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v12, v13);
  v15 = (char *)&v22 - v14;
  v16 = (char *)self + OBJC_IVAR___PKDrawingCoherence_model;
  swift_beginAccess();
  v17 = *(void (**)(char *, char *, uint64_t))(v8 + 16);
  v17(v15, v16, v7);
  lazy protocol witness table accessor for type NSAttributedStringKey and conformance NSAttributedStringKey((unint64_t *)&lazy protocol witness table cache variable for type PKDrawingStruct and conformance PKDrawingStruct, (uint64_t (*)(uint64_t))type metadata accessor for PKDrawingStruct, (uint64_t)&protocol conformance descriptor for PKDrawingStruct);
  v18 = self;
  Capsule<>.root.getter();
  v19 = *(void (**)(char *, uint64_t))(v8 + 8);
  v19(v15, v7);
  v17(v11, v16, v7);
  v20 = specialized PKDrawingStruct.requiredContentVersion<A>(in:)((uint64_t)v11);
  v19(v11, v7);
  outlined destroy of PKStrokeProperties((uint64_t)v6, (uint64_t (*)(_QWORD))type metadata accessor for PKDrawingStruct);

  return v20;
}

- (NSArray)_rootStrokes
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  char *v13;
  PKDrawingCoherence *v14;
  Class isa;
  _BYTE v17[16];
  PKDrawingCoherence *v18;

  v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for CROrderedSet<Ref<CRRegister<SharedTagged_2<TaggedStroke>>>>);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3, v5);
  v7 = &v17[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Capsule<PKDrawingStruct>);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8, v10);
  v12 = &v17[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v13 = (char *)self + OBJC_IVAR___PKDrawingCoherence_model;
  swift_beginAccess();
  (*(void (**)(_BYTE *, char *, uint64_t))(v9 + 16))(v12, v13, v8);
  swift_getKeyPath();
  lazy protocol witness table accessor for type NSAttributedStringKey and conformance NSAttributedStringKey((unint64_t *)&lazy protocol witness table cache variable for type PKDrawingStruct and conformance PKDrawingStruct, (uint64_t (*)(uint64_t))type metadata accessor for PKDrawingStruct, (uint64_t)&protocol conformance descriptor for PKDrawingStruct);
  v14 = self;
  Capsule<>.subscript.getter();
  swift_release();
  (*(void (**)(_BYTE *, uint64_t))(v9 + 8))(v12, v8);
  v18 = v14;
  type metadata accessor for PKStroke();
  CROrderedSet.map<A>(_:)();
  (*(void (**)(_BYTE *, uint64_t))(v4 + 8))(v7, v3);

  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return (NSArray *)isa;
}

- (int64_t)_rootStrokesCount
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  PKDrawingCoherence *v14;
  int64_t v15;
  uint64_t v17;

  v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for CROrderedSet<Ref<CRRegister<SharedTagged_2<TaggedStroke>>>>);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3, v5);
  v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Capsule<PKDrawingStruct>);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8, v10);
  v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = (char *)self + OBJC_IVAR___PKDrawingCoherence_model;
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v12, v13, v8);
  swift_getKeyPath();
  lazy protocol witness table accessor for type NSAttributedStringKey and conformance NSAttributedStringKey((unint64_t *)&lazy protocol witness table cache variable for type PKDrawingStruct and conformance PKDrawingStruct, (uint64_t (*)(uint64_t))type metadata accessor for PKDrawingStruct, (uint64_t)&protocol conformance descriptor for PKDrawingStruct);
  v14 = self;
  Capsule<>.subscript.getter();
  swift_release();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
  v15 = CROrderedSet.count.getter();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);

  return v15;
}

- (id)copyWithoutInternalStrokes
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  PKDrawingCoherence *v8;
  PKDrawing *v9;
  void *v10;
  void *v11;
  uint64_t v13;

  v3 = type metadata accessor for PKDrawing();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3, v5);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = self;
  static PKDrawing._unconditionallyBridgeFromObjectiveC(_:)();

  PKDrawing._bridgeToObjectiveC()(v9);
  v11 = v10;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  return v11;
}

- (CGRect)bounds
{
  PKDrawingCoherence *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGRect result;

  v2 = self;
  v3 = PKDrawingCoherence.bounds.getter();
  v5 = v4;
  v7 = v6;
  v9 = v8;

  v10 = v3;
  v11 = v5;
  v12 = v7;
  v13 = v9;
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (PKDrawingUUID)uuid
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  PKDrawingCoherence *v14;
  objc_class *v15;
  id v16;
  PKDrawingCoherence *v17;
  uint64_t v19;
  objc_super v20;

  v3 = type metadata accessor for CRKeyPath();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3, v5);
  v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Capsule<PKDrawingStruct>);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8, v10);
  v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = (char *)self + OBJC_IVAR___PKDrawingCoherence_model;
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v12, v13, v8);
  lazy protocol witness table accessor for type NSAttributedStringKey and conformance NSAttributedStringKey((unint64_t *)&lazy protocol witness table cache variable for type PKDrawingStruct and conformance PKDrawingStruct, (uint64_t (*)(uint64_t))type metadata accessor for PKDrawingStruct, (uint64_t)&protocol conformance descriptor for PKDrawingStruct);
  v14 = self;
  Capsule<>.rootID.getter();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
  v15 = (objc_class *)type metadata accessor for PKDrawingUUIDKeyPath();
  v16 = objc_allocWithZone(v15);
  (*(void (**)(uint64_t, char *, uint64_t))(v4 + 16))((uint64_t)v16 + OBJC_IVAR____TtC8PaperKit20PKDrawingUUIDKeyPath_keypath, v7, v3);
  v20.receiver = v16;
  v20.super_class = v15;
  v17 = -[PKDrawingCoherence init](&v20, sel_init);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);

  return (PKDrawingUUID *)v17;
}

- (CGRect)_canvasBounds
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char *v8;
  PKDrawingCoherence *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  _QWORD v14[5];
  CGRect result;

  v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Capsule<PKDrawingStruct>);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3, v5);
  v7 = (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = (char *)self + OBJC_IVAR___PKDrawingCoherence_model;
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v7, v8, v3);
  swift_getKeyPath();
  lazy protocol witness table accessor for type NSAttributedStringKey and conformance NSAttributedStringKey((unint64_t *)&lazy protocol witness table cache variable for type PKDrawingStruct and conformance PKDrawingStruct, (uint64_t (*)(uint64_t))type metadata accessor for PKDrawingStruct, (uint64_t)&protocol conformance descriptor for PKDrawingStruct);
  v9 = self;
  Capsule<>.subscript.getter();
  swift_release();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);

  v10 = *(double *)&v14[1];
  v11 = *(double *)&v14[2];
  v12 = *(double *)&v14[3];
  v13 = *(double *)&v14[4];
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (void)set_canvasBounds:(CGRect)a3
{
  PKDrawingCoherence *v4;

  swift_beginAccess();
  v4 = self;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Capsule<PKDrawingStruct>);
  Capsule.mutate<A>(_:)();
  swift_endAccess();

}

- (id)visibleStrokeForInsertingStroke:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  id v14;
  PKDrawingCoherence *v15;
  Class isa;
  id v17;
  void (*v18)(char *, uint64_t);
  Class v19;
  uint64_t v21;

  v5 = type metadata accessor for PKStroke();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5, v7);
  v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v10, v11);
  v13 = (char *)&v21 - v12;
  v14 = a3;
  v15 = self;
  static PKStroke._unconditionallyBridgeFromObjectiveC(_:)();

  isa = PKStroke._bridgeToObjectiveC()().super.isa;
  v17 = -[objc_class copyForMutation](isa, sel_copyForMutation);

  static PKStroke._unconditionallyBridgeFromObjectiveC(_:)();
  v18 = *(void (**)(char *, uint64_t))(v6 + 8);
  v18(v9, v5);
  v19 = PKStroke._bridgeToObjectiveC()().super.isa;
  v18(v13, v5);
  return v19;
}

- (void)addNewStroke:(id)a3
{
  @objc PKCoherenceUndoCommand.apply(to:)(self, (uint64_t)a2, a3, (uint64_t (*)(_QWORD))MEMORY[0x1E0CD10B8], (void (*)(void *))MEMORY[0x1E0CD1090], (void (*)(char *))PKDrawingCoherence.addNewStroke(_:));
}

- (id)setStroke:(id)a3 hidden:(BOOL)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  id v15;
  PKDrawingCoherence *v16;
  void (*v17)(char *, uint64_t);
  Class isa;
  uint64_t v20;

  v6 = type metadata accessor for PKStroke();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6, v8);
  v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v11, v12);
  v14 = (char *)&v20 - v13;
  v15 = a3;
  v16 = self;
  static PKStroke._unconditionallyBridgeFromObjectiveC(_:)();

  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v14, v10, v6);
  v17 = *(void (**)(char *, uint64_t))(v7 + 8);
  v17(v10, v6);
  isa = PKStroke._bridgeToObjectiveC()().super.isa;
  v17(v14, v6);
  return isa;
}

- (void)setStrokes:(id)a3 hidden:(BOOL)a4
{
  _BOOL4 v4;
  PKDrawingCoherence *v6;
  Class isa;

  v4 = a4;
  type metadata accessor for PKStroke();
  static Array._unconditionallyBridgeFromObjectiveC(_:)();
  if (v4)
  {
    v6 = self;
    isa = Array._bridgeToObjectiveC()().super.isa;
    -[PKDrawingCoherence deleteStrokes:](v6, sel_deleteStrokes_, isa);

    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
}

- (id)undoableAddNewStrokes:(id)a3
{
  uint64_t v4;
  PKDrawingCoherence *v5;
  PKUndoCommand_optional *v6;
  void *v7;
  void *v8;

  type metadata accessor for PKStroke();
  v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = self;
  PKDrawingCoherence.undoableAddNewStrokes(_:)(v6, (Swift::OpaquePointer)v4);
  v8 = v7;

  swift_bridgeObjectRelease();
  return v8;
}

- (id)undoableAddNewStrokes:(id)a3 replacingOldStrokes:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  PKDrawingCoherence *v7;
  PKUndoCommand_optional *v8;
  void *v9;
  void *v10;

  type metadata accessor for PKStroke();
  v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v7 = self;
  PKDrawingCoherence.undoableAddNewStrokes(_:replacingOldStrokes:)(v8, (Swift::OpaquePointer)v5, (Swift::OpaquePointer)v6);
  v10 = v9;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v10;
}

- (void)updateStroke:(id)a3 indexHint:(int64_t)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  PKDrawingCoherence *v12;
  uint64_t v13;

  v6 = type metadata accessor for PKStroke();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6, v8);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = a3;
  v12 = self;
  static PKStroke._unconditionallyBridgeFromObjectiveC(_:)();

  specialized PKDrawingCoherence.updateStroke(_:indexHint:)((uint64_t)v10);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
}

- (void)transformStrokes:(id)a3 withTransform:(CGAffineTransform *)a4 concat:(BOOL)a5
{
  _BOOL4 v5;
  CGFloat b;
  CGFloat c;
  CGFloat d;
  CGFloat tx;
  CGFloat ty;
  _BOOL8 IsIdentity;
  uint64_t v13;
  PKDrawingCoherence *v14;
  CGAffineTransform v15;
  CGFloat a;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;

  v5 = a5;
  b = a4->b;
  c = a4->c;
  d = a4->d;
  tx = a4->tx;
  ty = a4->ty;
  a = a4->a;
  v17 = b;
  v18 = c;
  v19 = d;
  v20 = tx;
  v21 = ty;
  type metadata accessor for PKStroke();
  static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v15.a = a;
  v15.b = b;
  v15.c = c;
  v15.d = d;
  v15.tx = tx;
  v15.ty = ty;
  IsIdentity = CGAffineTransformIsIdentity(&v15);
  if (!IsIdentity || !v5)
  {
    MEMORY[0x1E0C80A78](IsIdentity, v13);
    swift_beginAccess();
    v14 = self;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Capsule<PKDrawingStruct>);
    Capsule.callAsFunction<A>(_:)();
    swift_endAccess();
    -[PKDrawingCoherence invalidateVisibleStrokes](v14, sel_invalidateVisibleStrokes);

  }
  swift_bridgeObjectRelease();
}

- (void)deleteStrokes:(id)a3
{
  PKDrawingCoherence *v4;

  type metadata accessor for PKStroke();
  static Array._unconditionallyBridgeFromObjectiveC(_:)();
  swift_beginAccess();
  v4 = self;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Capsule<PKDrawingStruct>);
  Capsule.callAsFunction<A>(_:)();
  swift_endAccess();
  -[PKDrawingCoherence invalidateVisibleStrokes](v4, sel_invalidateVisibleStrokes);

  swift_bridgeObjectRelease();
}

- (id)undoableDeleteStrokes:(id)a3
{
  uint64_t v4;
  PKDrawingCoherence *v5;
  Swift::String v6;
  Swift::String_optional v7;
  Swift::String v8;
  Swift::String v9;
  void (**v10)(char *, uint64_t);
  id v11;
  Swift::String v13;

  type metadata accessor for PKStroke();
  static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v4 = one-time initialization token for paperKitBundle;
  v5 = self;
  if (v4 != -1)
    swift_once();
  v13._object = (void *)0x80000001DDF55B00;
  v6._countAndFlagsBits = 0x6573617245;
  v6._object = (void *)0xE500000000000000;
  v7.value._countAndFlagsBits = 0x617A696C61636F4CLL;
  v7.value._object = (void *)0xEB00000000656C62;
  v8._countAndFlagsBits = 0;
  v8._object = (void *)0xE000000000000000;
  v13._countAndFlagsBits = 0xD000000000000019;
  v9 = NSLocalizedString(_:tableName:bundle:value:comment:)(v6, v7, paperKitBundle, v8, v13);
  v10 = v5;
  swift_bridgeObjectRetain();
  v11 = specialized PKDrawingCoherence.undoable(actionName:clearCachedVisibleStrokes:changesVisibleStrokes:_:)(v9._countAndFlagsBits, (uint64_t)v9._object, 1, 1, v10, v10);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease_n();
  return v11;
}

- (id)undoableTransformStrokes:(id)a3 withTransform:(CGAffineTransform *)a4 concat:(BOOL)a5
{
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  PKDrawingCoherence *v10;
  Swift::String v11;
  Swift::String_optional v12;
  Swift::String v13;
  Swift::String v14;
  void (**v15)(char *, uint64_t);
  id v16;
  __int128 v18[3];
  Swift::String v19;

  v7 = *(_OWORD *)&a4->c;
  v18[0] = *(_OWORD *)&a4->a;
  v18[1] = v7;
  v18[2] = *(_OWORD *)&a4->tx;
  type metadata accessor for PKStroke();
  v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v9 = one-time initialization token for paperKitBundle;
  v10 = self;
  if (v9 != -1)
    swift_once();
  v19._countAndFlagsBits = 0xD00000000000001DLL;
  v19._object = (void *)0x80000001DDF55B40;
  v11._object = (void *)0x80000001DDF55B20;
  v11._countAndFlagsBits = 0xD000000000000011;
  v12.value._countAndFlagsBits = 0x617A696C61636F4CLL;
  v12.value._object = (void *)0xEB00000000656C62;
  v13._countAndFlagsBits = 0;
  v13._object = (void *)0xE000000000000000;
  v14 = NSLocalizedString(_:tableName:bundle:value:comment:)(v11, v12, paperKitBundle, v13, v19);
  v15 = v10;
  swift_bridgeObjectRetain();
  v16 = specialized PKDrawingCoherence.undoable(actionName:clearCachedVisibleStrokes:changesVisibleStrokes:_:)(v14._countAndFlagsBits, (uint64_t)v14._object, 1, 1, v15, v15, v8, v18, a5);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease_n();
  return v16;
}

- (id)transformStrokes:(id)a3 paths:(id)a4 masks:(id)a5
{
  uint64_t v6;
  uint64_t (*v7)(uint64_t);
  uint64_t v8;
  uint64_t v9;
  PKDrawingCoherence *v10;
  Class isa;

  type metadata accessor for PKStroke();
  v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  type metadata accessor for UUID();
  v7 = (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998];
  type metadata accessor for PKStrokePath();
  lazy protocol witness table accessor for type NSAttributedStringKey and conformance NSAttributedStringKey((unint64_t *)&lazy protocol witness table cache variable for type UUID and conformance UUID, v7, MEMORY[0x1E0CB09C8]);
  v8 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  type metadata accessor for NSObject(0, &lazy cache variable for type metadata for PKStrokeMask);
  v9 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  v10 = self;
  PKDrawingCoherence.transformStrokes(_:paths:masks:)(v6, v8, v9);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  type metadata accessor for NSObject(0, &lazy cache variable for type metadata for PKUndoCommand);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return isa;
}

- (BOOL)shouldClearSelectionAfterStraightening
{
  return 0;
}

- (void)setStrokes:(id)a3 inks:(id)a4
{
  PKDrawingCoherence *v5;

  type metadata accessor for PKStroke();
  static Array._unconditionallyBridgeFromObjectiveC(_:)();
  type metadata accessor for PKInk();
  static Array._unconditionallyBridgeFromObjectiveC(_:)();
  swift_beginAccess();
  v5 = self;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Capsule<PKDrawingStruct>);
  Capsule.mutate<A>(_:)();
  swift_endAccess();
  -[PKDrawingCoherence invalidateVisibleStrokes](v5, sel_invalidateVisibleStrokes);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (id)undoableSetStrokes:(id)a3 inks:(id)a4
{
  uint64_t v5;
  PKDrawingCoherence *v6;
  Swift::String v7;
  Swift::String_optional v8;
  Swift::String v9;
  Swift::String v10;
  char *v11;
  id v12;
  Swift::String v14;

  type metadata accessor for PKStroke();
  static Array._unconditionallyBridgeFromObjectiveC(_:)();
  type metadata accessor for PKInk();
  static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = one-time initialization token for paperKitBundle;
  v6 = self;
  if (v5 != -1)
    swift_once();
  v14._object = (void *)0x80000001DDF55B80;
  v7._countAndFlagsBits = 0x736B6E4920746553;
  v7._object = (void *)0xE800000000000000;
  v8.value._countAndFlagsBits = 0x617A696C61636F4CLL;
  v8.value._object = (void *)0xEB00000000656C62;
  v9._countAndFlagsBits = 0;
  v9._object = (void *)0xE000000000000000;
  v14._countAndFlagsBits = 0xD000000000000014;
  v10 = NSLocalizedString(_:tableName:bundle:value:comment:)(v7, v8, paperKitBundle, v9, v14);
  v11 = v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v12 = specialized PKDrawingCoherence.undoable(actionName:clearCachedVisibleStrokes:changesVisibleStrokes:_:)(v10._countAndFlagsBits, (uint64_t)v10._object, 1, 1, v11, v11);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease_n();
  return v12;
}

- (void)setStrokes:(id)a3 groupID:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  PKDrawingCoherence *v15;
  uint64_t v16;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?);
  MEMORY[0x1E0C80A78](v6, v7);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for PKStroke();
  v10 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  if (a4)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();
    v11 = type metadata accessor for UUID();
    v12 = (*(uint64_t (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v9, 0, 1, v11);
  }
  else
  {
    v14 = type metadata accessor for UUID();
    v12 = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v9, 1, 1, v14);
  }
  MEMORY[0x1E0C80A78](v12, v13);
  *(&v16 - 2) = v10;
  *(&v16 - 1) = (uint64_t)v9;
  swift_beginAccess();
  v15 = self;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Capsule<PKDrawingStruct>);
  Capsule.mutate<A>(_:)();
  swift_endAccess();

  swift_bridgeObjectRelease();
  outlined destroy of StocksKitCurrencyCache.Provider?((uint64_t)v9, &demangling cache variable for type metadata for UUID?);
}

- (id)undoableSetStrokes:(id)a3 groupID:(id)a4 actionName:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  PKDrawingCoherence *v17;
  id v18;
  uint64_t v20;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?);
  MEMORY[0x1E0C80A78](v7, v8);
  v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for PKStroke();
  v11 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  if (a4)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();
    v12 = type metadata accessor for UUID();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v10, 0, 1, v12);
  }
  else
  {
    v13 = type metadata accessor for UUID();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v10, 1, 1, v13);
  }
  v14 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v16 = v15;
  MEMORY[0x1E0C80A78](v14, v15);
  *(&v20 - 4) = (uint64_t)self;
  *(&v20 - 3) = v11;
  *(&v20 - 2) = (uint64_t)v10;
  v17 = self;
  v18 = PKDrawingCoherence.undoable(actionName:clearCachedVisibleStrokes:changesVisibleStrokes:_:)(v14, v16, 1, 0, (void (*)(uint64_t))closure #1 in PKDrawingCoherence.undoableSetStrokes(_:groupID:actionName:)partial apply, (uint64_t)(&v20 - 6));

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined destroy of StocksKitCurrencyCache.Provider?((uint64_t)v10, &demangling cache variable for type metadata for UUID?);
  return v18;
}

- (id)updateFromSlicedIntersectingIndexes:(int64_t *)a3 resultNewRoots:(const void *)a4 resultUpdatedStrokes:(const void *)a5 count:(int64_t)a6
{
  PKDrawingCoherence *v10;
  id v11;

  v10 = self;
  v11 = PKDrawingCoherence.update(fromSlicedIntersectingIndexes:resultNewRoots:resultUpdatedStrokes:count:)((uint64_t)a3, (uint64_t)a4, (void (**)(char *, uint64_t))a5, (void (*)(char *, uint64_t))a6);

  return v11;
}

- (id)drawingByApplyingTransform:(CGAffineTransform *)a3
{
  __int128 v4;
  CGFloat tx;
  CGFloat ty;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  PKDrawingCoherence *v12;
  id v13;
  PKDrawing *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  _OWORD v20[2];
  CGFloat v21;
  CGFloat v22;

  v4 = *(_OWORD *)&a3->a;
  v18 = *(_OWORD *)&a3->c;
  v19 = v4;
  tx = a3->tx;
  ty = a3->ty;
  v7 = type metadata accessor for PKDrawing();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7, v9);
  v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = self;
  v20[0] = v19;
  v20[1] = v18;
  v21 = tx;
  v22 = ty;
  v13 = -[PKDrawingCoherence drawingByApplyingTransform:transformInk:](v12, sel_drawingByApplyingTransform_transformInk_, v20, 1);
  static PKDrawing._unconditionallyBridgeFromObjectiveC(_:)();

  PKDrawing._bridgeToObjectiveC()(v14);
  v16 = v15;
  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
  return v16;
}

- (id)drawingByApplyingTransform:(CGAffineTransform *)a3 transformInk:(BOOL)a4
{
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  PKDrawingCoherence *v12;
  id v13;
  PKDrawing *v14;
  void *v15;
  void *v16;
  _OWORD v18[3];

  v6 = *(_OWORD *)&a3->c;
  v18[0] = *(_OWORD *)&a3->a;
  v18[1] = v6;
  v18[2] = *(_OWORD *)&a3->tx;
  v7 = type metadata accessor for PKDrawing();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7, v9);
  v11 = (char *)v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = self;
  v13 = PKDrawingCoherence.applyTransform(_:transformInk:)((uint64_t)v18, a4);
  static PKDrawing._unconditionallyBridgeFromObjectiveC(_:)();

  PKDrawing._bridgeToObjectiveC()(v14);
  v16 = v15;
  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
  return v16;
}

- (void)invalidateVisibleStrokes
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  objc_class *v17;
  PKDrawingCoherence *v18;
  char *v19;
  void (*v20)(char *, char *, uint64_t);
  void (*v21)(char *, uint64_t);
  uint64_t v22;
  objc_super v23;

  v3 = type metadata accessor for CRKeyPath();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3, v5);
  v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Capsule<PKDrawingStruct>);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8, v10);
  v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v13, v14);
  v16 = (char *)&v22 - v15;
  v17 = (objc_class *)type metadata accessor for PKDrawingCoherence(0);
  v23.receiver = self;
  v23.super_class = v17;
  v18 = self;
  -[PKDrawingCoherence invalidateVisibleStrokes](&v23, sel_invalidateVisibleStrokes);
  v19 = (char *)v18 + OBJC_IVAR___PKDrawingCoherence_model;
  swift_beginAccess();
  v20 = *(void (**)(char *, char *, uint64_t))(v9 + 16);
  v20(v16, v19, v8);
  v20(v12, v19, v8);
  lazy protocol witness table accessor for type NSAttributedStringKey and conformance NSAttributedStringKey((unint64_t *)&lazy protocol witness table cache variable for type PKDrawingStruct and conformance PKDrawingStruct, (uint64_t (*)(uint64_t))type metadata accessor for PKDrawingStruct, (uint64_t)&protocol conformance descriptor for PKDrawingStruct);
  Capsule<>.rootID.getter();
  v21 = *(void (**)(char *, uint64_t))(v9 + 8);
  v21(v12, v8);
  Capsule.clearCachedValue(forKey:)();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  v21(v16, v8);

}

- (unint64_t)mergeWithDrawing:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  PKDrawingCoherence *v11;
  unint64_t v12;
  uint64_t v14;

  v5 = type metadata accessor for PKDrawing();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5, v7);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = a3;
  v11 = self;
  static PKDrawing._unconditionallyBridgeFromObjectiveC(_:)();

  v12 = PKDrawingCoherence.merge(with:)((uint64_t)v9);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  return v12;
}

- (id)undoableMergeWithDrawing:(id)a3
{
  return @objc PKCoherenceUndoCommand.apply(toDrawingReturnInverted:)(self, (uint64_t)a2, a3, (uint64_t (*)(char *))PKDrawingCoherence.undoableMerge(with:));
}

- (int64_t)hash
{
  PKDrawingCoherence *v2;
  Swift::Int v3;

  v2 = self;
  v3 = PKDrawingCoherence.hash.getter();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  return @objc CalculateDocumentProvider.isEqual(_:)(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))PKDrawingCoherence.isEqual(_:));
}

- (id)_strokeForIdentifier:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  PKDrawingCoherence *v13;
  uint64_t v14;
  uint64_t v15;
  Class isa;
  uint64_t v18;

  v4 = type metadata accessor for UUID();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4, v6);
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for PKStroke?);
  MEMORY[0x1E0C80A78](v9, v10);
  v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  v13 = self;
  PKDrawingCoherence._stroke(forIdentifier:)((uint64_t)v8, (uint64_t)v12);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  v14 = type metadata accessor for PKStroke();
  v15 = *(_QWORD *)(v14 - 8);
  isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v12, 1, v14) != 1)
  {
    isa = PKStroke._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v15 + 8))(v12, v14);
  }
  return isa;
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR___PKDrawingCoherence_model;
  v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Capsule<PKDrawingStruct>);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

@end
