@implementation PKStrokeCoherenceBase

- (PKStrokeCoherenceBase)init
{
  PKStrokeCoherenceBase *result;

  result = (PKStrokeCoherenceBase *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (PKStrokeCoherenceBase)initWithInk:(id)a3 strokePath:(id)a4 transform:(CGAffineTransform *)a5 mask:(id)a6
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  PKStrokeCoherenceBase *result;

  v9 = type metadata accessor for PKStrokePath();
  MEMORY[0x1E0C80A78](v9, v10);
  v11 = type metadata accessor for PKInk();
  MEMORY[0x1E0C80A78](v11, v12);
  v13 = a3;
  v14 = a4;
  v15 = a6;
  static PKInk._unconditionallyBridgeFromObjectiveC(_:)();

  static PKStrokePath._unconditionallyBridgeFromObjectiveC(_:)();
  result = (PKStrokeCoherenceBase *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (id)_newStrokeWithSubstrokes:(id)a3 inDrawing:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  id v17;
  PKStrokeCoherenceBase *v18;
  Class isa;
  uint64_t v21;

  v6 = type metadata accessor for PKDrawing();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6, v8);
  v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for PKStroke();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x1E0C80A78](v11, v13);
  v15 = (char *)&v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v17 = a4;
  v18 = self;
  static PKDrawing._unconditionallyBridgeFromObjectiveC(_:)();

  PKStrokeCoherenceBase._newStroke(withSubstrokes:in:)(v16, (uint64_t)v15);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  isa = PKStroke._bridgeToObjectiveC()().super.isa;
  (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v11);
  return isa;
}

- (PKStrokeCoherenceBase)initWithInk:(id)a3 strokePath:(id)a4 transform:(CGAffineTransform *)a5 mask:(id)a6 randomSeed:(unsigned int)a7
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  PKStrokeCoherenceBase *result;

  v10 = type metadata accessor for PKStrokePath();
  MEMORY[0x1E0C80A78](v10, v11);
  v12 = type metadata accessor for PKInk();
  MEMORY[0x1E0C80A78](v12, v13);
  v14 = a3;
  v15 = a4;
  v16 = a6;
  static PKInk._unconditionallyBridgeFromObjectiveC(_:)();

  static PKStrokePath._unconditionallyBridgeFromObjectiveC(_:)();
  result = (PKStrokeCoherenceBase *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (PKStrokeCoherenceBase)initWithData:(id)a3 id:(id)a4 flags:(id)a5 ink:(id)a6 transform:(CGAffineTransform *)a7 substrokes:(id)a8
{
  void *v9;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  CGAffineTransform *v21;
  PKStrokeCoherenceBase *result;

  v9 = (void *)*(&a5.var0.var1 + 1);
  v12 = type metadata accessor for PKInk();
  MEMORY[0x1E0C80A78](v12, v13);
  v14 = type metadata accessor for UUID();
  MEMORY[0x1E0C80A78](v14, v15);
  v16 = type metadata accessor for PKStrokePath();
  MEMORY[0x1E0C80A78](v16, v17);
  v18 = a3;
  v19 = a4;
  v20 = v9;
  v21 = a7;
  static PKStrokePath._unconditionallyBridgeFromObjectiveC(_:)();

  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  static PKInk._unconditionallyBridgeFromObjectiveC(_:)();

  result = (PKStrokeCoherenceBase *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  v3 = (char *)self + OBJC_IVAR___PKStrokeCoherenceBase_strokeNode;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CRRegister<SharedTagged_2<TaggedStroke>>);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR___PKStrokeCoherenceBase_identity;
  v6 = type metadata accessor for UUID();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
}

@end
