@implementation PKStrokeCoherenceSubstrokes

- (int64_t)_pointsCount
{
  return 0;
}

- (BOOL)_isHidden
{
  return !-[PKStrokeCoherenceSubstrokes hasSubstrokes](self, sel_hasSubstrokes);
}

- (void)_setHidden:(BOOL)a3
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

- (PKInk)ink
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  PKStrokeCoherenceSubstrokes *v9;
  uint64_t v10;
  Class isa;
  uint64_t v13;

  v3 = type metadata accessor for PKInk();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3, v5);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = one-time initialization token for substrokesInkType;
  v9 = self;
  if (v8 != -1)
    swift_once();
  v10 = __swift_project_value_buffer(v3, (uint64_t)static PKStrokeCoherenceSubstrokes.substrokesInkType);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v7, v10, v3);

  isa = PKInk._bridgeToObjectiveC()().super.isa;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  return (PKInk *)isa;
}

- (void)setInk:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  PKStrokeCoherenceSubstrokes *v8;

  v5 = type metadata accessor for PKInk();
  MEMORY[0x1E0C80A78](v5, v6);
  v7 = a3;
  v8 = self;
  static PKInk._unconditionallyBridgeFromObjectiveC(_:)();

  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

- (CGRect)_bounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = *MEMORY[0x1E0C9D628];
  v3 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v4 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v5 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)set_bounds:(CGRect)a3
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

- ($81D623D50AF946787EE57879EB0E918D)_flags
{
  unint64_t v2;
  $81D623D50AF946787EE57879EB0E918D result;

  v2 = 0;
  *(&result.var0.var1 + 1) = (unint64_t)a2;
  result.var0.var1 = v2;
  return result;
}

- (BOOL)hasSubstrokes
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  char *v8;
  PKStrokeCoherenceSubstrokes *v9;
  uint64_t v10;
  uint64_t v12;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CRSequence<Ref<CRRegister<SharedTagged_2<TaggedStroke>>>>);
  v4 = *(_QWORD *)(v3 - 8);
  v6 = MEMORY[0x1E0C80A78](v3, v5);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, char *, uint64_t, double))(v4 + 16))(v8, (char *)self + OBJC_IVAR___PKStrokeCoherenceSubstrokes_substrokes, v3, v6);
  v9 = self;
  v10 = CRSequence.count.getter();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v8, v3);

  return v10 > 0;
}

- (PKStrokeMask)_strokeMask
{
  return (PKStrokeMask *)0;
}

- (void)_setStrokeMask:(id)a3
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

- (void)_setStrokeUUID:(id)a3
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
  char *v13;
  void (*v14)(char *, char *, uint64_t);
  PKStrokeCoherenceSubstrokes *v15;
  uint64_t v16;

  v4 = type metadata accessor for UUID();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4, v6);
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v9, v10);
  v12 = (char *)&v16 - v11;
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v8, v12, v4);
  v13 = (char *)self + OBJC_IVAR___PKStrokeCoherenceBase_identity;
  swift_beginAccess();
  v14 = *(void (**)(char *, char *, uint64_t))(v5 + 40);
  v15 = self;
  v14(v13, v8, v4);
  swift_endAccess();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v12, v4);

}

- (id)_substrokesInDrawing:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  PKStrokeCoherenceSubstrokes *v11;
  Class isa;
  uint64_t v14;

  v5 = type metadata accessor for PKDrawing();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5, v7);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = a3;
  v11 = self;
  static PKDrawing._unconditionallyBridgeFromObjectiveC(_:)();

  PKStrokeCoherenceSubstrokes._substrokes(in:)((uint64_t)v9);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  type metadata accessor for PKStroke();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return isa;
}

- (id)descriptionAtDepth:(int64_t)a3
{
  PKStrokeCoherenceSubstrokes *v4;
  Swift::String v5;
  void *v6;

  v4 = self;
  v5 = PKStrokeCoherenceSubstrokes.description(atDepth:)(a3);

  v6 = (void *)MEMORY[0x1DF0E41AC](v5._countAndFlagsBits, v5._object);
  swift_bridgeObjectRelease();
  return v6;
}

- (PKStrokeCoherenceSubstrokes)init
{
  PKStrokeCoherenceSubstrokes *result;

  result = (PKStrokeCoherenceSubstrokes *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR___PKStrokeCoherenceSubstrokes_substrokes;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CRSequence<Ref<CRRegister<SharedTagged_2<TaggedStroke>>>>);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

@end
