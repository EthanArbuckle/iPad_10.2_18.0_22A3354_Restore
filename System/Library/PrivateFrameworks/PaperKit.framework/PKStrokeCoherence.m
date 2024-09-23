@implementation PKStrokeCoherence

- (PKStrokeCoherence)init
{
  return (PKStrokeCoherence *)PKStrokeCoherence.init()();
}

- (PKStrokeCoherence)initWithInk:(id)a3 strokePath:(id)a4 transform:(CGAffineTransform *)a5 mask:(id)a6
{
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  id v18;
  id v19;
  id v20;
  __int128 v22[3];

  v9 = *(_OWORD *)&a5->c;
  v22[0] = *(_OWORD *)&a5->a;
  v22[1] = v9;
  v22[2] = *(_OWORD *)&a5->tx;
  v10 = type metadata accessor for PKStrokePath();
  MEMORY[0x1E0C80A78](v10, v11);
  v13 = (char *)v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for PKInk();
  MEMORY[0x1E0C80A78](v14, v15);
  v17 = (char *)v22 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = a3;
  v19 = a4;
  v20 = a6;
  static PKInk._unconditionallyBridgeFromObjectiveC(_:)();

  static PKStrokePath._unconditionallyBridgeFromObjectiveC(_:)();
  return (PKStrokeCoherence *)PKStrokeCoherence.init(ink:strokePath:transform:mask:)((uint64_t)v17, (uint64_t)v13, v22, a6);
}

- (id)parentStrokeForInsertionInDrawing:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  id v15;
  PKStrokeCoherence *v16;
  Class isa;
  uint64_t v19;

  v5 = type metadata accessor for PKDrawing();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5, v7);
  v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for PKStroke();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10, v12);
  v14 = (char *)&v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = a3;
  v16 = self;
  static PKDrawing._unconditionallyBridgeFromObjectiveC(_:)();

  PKStrokeCoherence.parentStrokeForInsertion(in:)();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  isa = PKStroke._bridgeToObjectiveC()().super.isa;
  (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v10);
  return isa;
}

- (id)mutableCopyWithZone:(void *)a3
{
  PKStrokeCoherence *v3;
  void *v4;
  _QWORD v6[4];

  v3 = self;
  PKStrokeCoherence.mutableCopy(with:)(v6);

  __swift_project_boxed_opaque_existential_1(v6, v6[3]);
  v4 = (void *)_bridgeAnythingToObjectiveC<A>(_:)();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);
  return v4;
}

- (id)copyForMutation
{
  return @objc PKStrokeCoherence.copyForMutation()(self, (uint64_t)a2, (void (*)(void))PKStrokeCoherence.copyForMutation());
}

- (id)copyForSubstroke
{
  return @objc PKStrokeCoherence.copyForMutation()(self, (uint64_t)a2, (void (*)(void))PKStrokeCoherence.copyForSubstroke());
}

- (id)sliceIdentifierForTStart:(double)a3 tEnd:(double)a4
{
  PKStrokeCoherence *v6;
  id v7;

  v6 = self;
  v7 = PKStrokeCoherence.sliceIdentifier(forTStart:tEnd:)(a3, a4);

  return v7;
}

- (PKInk)ink
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
  char *v12;
  PKStrokeCoherence *v13;
  void *v14;
  PKInk *result;
  Class isa;
  void *v17;

  v3 = type metadata accessor for PKStrokeInheritedProperties(0);
  MEMORY[0x1E0C80A78](v3, v4);
  v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for PKInk();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7, v9);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = (char *)self + OBJC_IVAR___PKStrokeCoherence_resolvedProperties;
  swift_beginAccess();
  outlined init with copy of PKStrokeProperties((uint64_t)v12, (uint64_t)v6, type metadata accessor for PKStrokeInheritedProperties);
  v13 = self;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CRRegister<PKInk?>);
  CRRegister.wrappedValue.getter();
  v14 = v17;
  result = (PKInk *)outlined destroy of PKStrokeProperties((uint64_t)v6, type metadata accessor for PKStrokeInheritedProperties);
  if (v14)
  {
    static PKInk._unconditionallyBridgeFromObjectiveC(_:)();

    isa = PKInk._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
    return (PKInk *)isa;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (void)setInk:(id)a3
{
  @objc PKStrokeCoherence.ink.setter(self, (uint64_t)a2, a3, (uint64_t (*)(_QWORD))MEMORY[0x1E0CD1058], (void (*)(void *))MEMORY[0x1E0CD1048], (void (*)(char *))PKStrokeCoherence.ink.setter);
}

- (CGAffineTransform)_inkTransform
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  PKStrokeCoherence *v14;
  char *v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGAffineTransform *result;
  uint64_t v23;

  v5 = type metadata accessor for PKStrokeProperties(0);
  MEMORY[0x1E0C80A78](v5, v6);
  v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for PKStrokeStruct(0);
  MEMORY[0x1E0C80A78](v9, v10);
  v12 = (char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = (char *)self + OBJC_IVAR___PKStrokeCoherence_model;
  swift_beginAccess();
  outlined init with copy of PKStrokeProperties((uint64_t)v13, (uint64_t)v12, type metadata accessor for PKStrokeStruct);
  v14 = self;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CRRegister<PKStrokeProperties>);
  CRRegister.wrappedValue.getter();
  outlined destroy of PKStrokeProperties((uint64_t)v12, type metadata accessor for PKStrokeStruct);
  v15 = &v8[*(int *)(v5 + 44)];
  if ((v15[48] & 1) != 0)
  {
    v16 = 1.0;
    v17 = 0.0;
    v18 = 0.0;
    v19 = 0.0;
    v20 = 0.0;
    v21 = 1.0;
  }
  else
  {
    v18 = *((double *)v15 + 4);
    v17 = *((double *)v15 + 5);
    v19 = *((double *)v15 + 2);
    v16 = *((double *)v15 + 3);
    v21 = *(double *)v15;
    v20 = *((double *)v15 + 1);
  }
  outlined destroy of PKStrokeProperties((uint64_t)v8, type metadata accessor for PKStrokeProperties);

  retstr->a = v21;
  retstr->b = v20;
  retstr->c = v19;
  retstr->d = v16;
  retstr->tx = v18;
  retstr->ty = v17;
  return result;
}

- (PKStrokePath)path
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
  char *v12;
  Class isa;
  uint64_t v15;

  v3 = type metadata accessor for PKStrokePathStruct(0);
  MEMORY[0x1E0C80A78](v3, v4);
  v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for PKStrokePath();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7, v9);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = (char *)self + OBJC_IVAR___PKStrokeCoherence__path;
  swift_beginAccess();
  outlined init with copy of PKStrokeProperties((uint64_t)v12, (uint64_t)v6, type metadata accessor for PKStrokePathStruct);
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v11, v6, v7);
  isa = PKStrokePath._bridgeToObjectiveC()().super.isa;
  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
  return (PKStrokePath *)isa;
}

- (void)setPath:(id)a3
{
  @objc PKStrokeCoherence.ink.setter(self, (uint64_t)a2, a3, (uint64_t (*)(_QWORD))MEMORY[0x1E0CD0FB0], (void (*)(void *))MEMORY[0x1E0CD0FA0], (void (*)(char *))PKStrokeCoherence.path.setter);
}

- ($81D623D50AF946787EE57879EB0E918D)_flags
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  PKStrokeCoherence *v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  $81D623D50AF946787EE57879EB0E918D result;

  v3 = type metadata accessor for PKStrokeProperties(0);
  MEMORY[0x1E0C80A78](v3, v4);
  v6 = (unint64_t *)((char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  v7 = type metadata accessor for PKStrokeStruct(0);
  MEMORY[0x1E0C80A78](v7, v8);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = (char *)self + OBJC_IVAR___PKStrokeCoherence_model;
  swift_beginAccess();
  outlined init with copy of PKStrokeProperties((uint64_t)v11, (uint64_t)v10, type metadata accessor for PKStrokeStruct);
  v12 = self;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CRRegister<PKStrokeProperties>);
  CRRegister.wrappedValue.getter();
  outlined destroy of PKStrokeProperties((uint64_t)v10, type metadata accessor for PKStrokeStruct);
  v13 = *v6;
  outlined destroy of PKStrokeProperties((uint64_t)v6, type metadata accessor for PKStrokeProperties);

  v15 = v13;
  *(&result.var0.var1 + 1) = v14;
  result.var0.var1 = v15;
  return result;
}

- (void)_setFlags:(id)a3
{
  unint64_t var1;
  PKStrokeCoherence *v5;
  void (*v6)(_BYTE *, _QWORD);
  unint64_t *v7;
  _BYTE v8[32];

  var1 = a3.var0.var1;
  swift_beginAccess();
  type metadata accessor for PKStrokeStruct(0);
  v5 = self;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CRRegister<PKStrokeProperties>);
  v6 = (void (*)(_BYTE *, _QWORD))CRRegister.wrappedValue.modify();
  *v7 = var1;
  v6(v8, 0);
  swift_endAccess();

}

- (NSUUID)_groupID
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  PKStrokeCoherence *v16;
  uint64_t v17;
  uint64_t v18;
  Class isa;
  uint64_t v21;

  v3 = type metadata accessor for PKStrokeProperties(0);
  MEMORY[0x1E0C80A78](v3, v4);
  v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for PKStrokeStruct(0);
  MEMORY[0x1E0C80A78](v7, v8);
  v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?);
  MEMORY[0x1E0C80A78](v11, v12);
  v14 = (char *)&v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = (char *)self + OBJC_IVAR___PKStrokeCoherence_model;
  swift_beginAccess();
  outlined init with copy of PKStrokeProperties((uint64_t)v15, (uint64_t)v10, type metadata accessor for PKStrokeStruct);
  v16 = self;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CRRegister<PKStrokeProperties>);
  CRRegister.wrappedValue.getter();
  outlined destroy of PKStrokeProperties((uint64_t)v10, type metadata accessor for PKStrokeStruct);
  outlined init with copy of Ref<PKStrokeInheritedProperties>?((uint64_t)&v6[*(int *)(v3 + 20)], (uint64_t)v14, &demangling cache variable for type metadata for UUID?);
  outlined destroy of PKStrokeProperties((uint64_t)v6, type metadata accessor for PKStrokeProperties);

  v17 = type metadata accessor for UUID();
  v18 = *(_QWORD *)(v17 - 8);
  isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v14, 1, v17) != 1)
  {
    isa = UUID._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v18 + 8))(v14, v17);
  }
  return (NSUUID *)isa;
}

- (void)_setGroupID:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  PKStrokeCoherence *v11;
  void (*v12)(_BYTE *, _QWORD);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE v17[32];

  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?);
  MEMORY[0x1E0C80A78](v5, v6);
  v8 = &v17[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  if (a3)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();
    v9 = type metadata accessor for UUID();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v8, 0, 1, v9);
  }
  else
  {
    v10 = type metadata accessor for UUID();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v8, 1, 1, v10);
  }
  swift_beginAccess();
  type metadata accessor for PKStrokeStruct(0);
  v11 = self;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CRRegister<PKStrokeProperties>);
  v12 = (void (*)(_BYTE *, _QWORD))CRRegister.wrappedValue.modify();
  v14 = v13;
  v15 = type metadata accessor for PKStrokeProperties(0);
  outlined assign with copy of UUID?((uint64_t)v8, v14 + *(int *)(v15 + 20));
  v12(v17, 0);
  swift_endAccess();
  outlined destroy of StocksKitCurrencyCache.Provider?((uint64_t)v8, &demangling cache variable for type metadata for UUID?);

}

- (NSUUID)_renderGroupID
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  PKStrokeCoherence *v16;
  uint64_t v17;
  uint64_t v18;
  Class isa;
  uint64_t v21;

  v3 = type metadata accessor for PKStrokeProperties(0);
  MEMORY[0x1E0C80A78](v3, v4);
  v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for PKStrokeStruct(0);
  MEMORY[0x1E0C80A78](v7, v8);
  v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?);
  MEMORY[0x1E0C80A78](v11, v12);
  v14 = (char *)&v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = (char *)self + OBJC_IVAR___PKStrokeCoherence_model;
  swift_beginAccess();
  outlined init with copy of PKStrokeProperties((uint64_t)v15, (uint64_t)v10, type metadata accessor for PKStrokeStruct);
  v16 = self;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CRRegister<PKStrokeProperties>);
  CRRegister.wrappedValue.getter();
  outlined destroy of PKStrokeProperties((uint64_t)v10, type metadata accessor for PKStrokeStruct);
  outlined init with copy of Ref<PKStrokeInheritedProperties>?((uint64_t)&v6[*(int *)(v3 + 24)], (uint64_t)v14, &demangling cache variable for type metadata for UUID?);
  outlined destroy of PKStrokeProperties((uint64_t)v6, type metadata accessor for PKStrokeProperties);

  v17 = type metadata accessor for UUID();
  v18 = *(_QWORD *)(v17 - 8);
  isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v14, 1, v17) != 1)
  {
    isa = UUID._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v18 + 8))(v14, v17);
  }
  return (NSUUID *)isa;
}

- (void)_setRenderGroupID:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  PKStrokeCoherence *v11;
  void (*v12)(_BYTE *, _QWORD);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE v17[32];

  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?);
  MEMORY[0x1E0C80A78](v5, v6);
  v8 = &v17[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  if (a3)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();
    v9 = type metadata accessor for UUID();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v8, 0, 1, v9);
  }
  else
  {
    v10 = type metadata accessor for UUID();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v8, 1, 1, v10);
  }
  swift_beginAccess();
  type metadata accessor for PKStrokeStruct(0);
  v11 = self;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CRRegister<PKStrokeProperties>);
  v12 = (void (*)(_BYTE *, _QWORD))CRRegister.wrappedValue.modify();
  v14 = v13;
  v15 = type metadata accessor for PKStrokeProperties(0);
  outlined assign with copy of UUID?((uint64_t)v8, v14 + *(int *)(v15 + 24));
  v12(v17, 0);
  swift_endAccess();
  outlined destroy of StocksKitCurrencyCache.Provider?((uint64_t)v8, &demangling cache variable for type metadata for UUID?);

}

- (int64_t)_shapeType
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  PKStrokeCoherence *v12;
  int64_t v13;
  uint64_t v15;

  v3 = type metadata accessor for PKStrokeProperties(0);
  MEMORY[0x1E0C80A78](v3, v4);
  v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for PKStrokeStruct(0);
  MEMORY[0x1E0C80A78](v7, v8);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = (char *)self + OBJC_IVAR___PKStrokeCoherence_model;
  swift_beginAccess();
  outlined init with copy of PKStrokeProperties((uint64_t)v11, (uint64_t)v10, type metadata accessor for PKStrokeStruct);
  v12 = self;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CRRegister<PKStrokeProperties>);
  CRRegister.wrappedValue.getter();
  outlined destroy of PKStrokeProperties((uint64_t)v10, type metadata accessor for PKStrokeStruct);
  v13 = *(_QWORD *)&v6[*(int *)(v3 + 28)];
  outlined destroy of PKStrokeProperties((uint64_t)v6, type metadata accessor for PKStrokeProperties);

  return v13;
}

- (void)_setShapeType:(int64_t)a3
{
  PKStrokeCoherence *v5;
  void (*v6)(_BYTE *, _QWORD);
  uint64_t v7;
  _BYTE v8[32];

  swift_beginAccess();
  type metadata accessor for PKStrokeStruct(0);
  v5 = self;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CRRegister<PKStrokeProperties>);
  v6 = (void (*)(_BYTE *, _QWORD))CRRegister.wrappedValue.modify();
  *(_QWORD *)(v7 + *(int *)(type metadata accessor for PKStrokeProperties(0) + 28)) = a3;
  v6(v8, 0);
  swift_endAccess();

}

- (PKStrokeMask)_strokeMask
{
  PKStrokeCoherence *v2;
  id v3;

  v2 = self;
  v3 = PKStrokeCoherence._strokeMask.getter();

  return (PKStrokeMask *)v3;
}

- (void)_setStrokeMask:(id)a3
{
  PKStrokeCoherence *v5;
  id v6;

  v6 = a3;
  v5 = self;
  specialized PKStrokeCoherence._strokeMask.setter(a3);

}

- (BOOL)hasSubstrokes
{
  return 0;
}

- (void)_setStrokeUUID:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  PKStrokeCoherence *v8;
  uint64_t v9;

  v4 = type metadata accessor for UUID();
  MEMORY[0x1E0C80A78](v4, v5);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = self;
  PKStrokeCoherence._strokeUUID.setter((uint64_t)v7);

}

- (BOOL)isEqual:(id)a3
{
  return @objc CalculateDocumentProvider.isEqual(_:)(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))PKStrokeCoherence.isEqual(_:));
}

- (_PKStrokeClipPlane)_clipPlane
{
  PKStrokeCoherence *v2;
  id v3;

  v2 = self;
  v3 = PKStrokeCoherence._clipPlane.getter();

  return (_PKStrokeClipPlane *)v3;
}

- (void)_setClipPlane:(id)a3
{
  id v5;
  PKStrokeCoherence *v6;

  v5 = a3;
  v6 = self;
  PKStrokeCoherence._clipPlane.setter(a3);

}

- (CGAffineTransform)_transform
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  PKStrokeCoherence *v10;
  CGFloat v11;
  CGFloat v12;
  CGAffineTransform *result;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  double v19;
  double v20;

  v5 = type metadata accessor for PKStrokeInheritedProperties(0);
  MEMORY[0x1E0C80A78](v5, v6);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = (char *)self + OBJC_IVAR___PKStrokeCoherence_resolvedProperties;
  swift_beginAccess();
  outlined init with copy of PKStrokeProperties((uint64_t)v9, (uint64_t)v8, type metadata accessor for PKStrokeInheritedProperties);
  v10 = self;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CRRegister<CGAffineTransform>);
  CRRegister.wrappedValue.getter();
  v15 = v18;
  v16 = v17;
  v11 = v19;
  v12 = v20;
  outlined destroy of PKStrokeProperties((uint64_t)v8, type metadata accessor for PKStrokeInheritedProperties);

  v14 = v15;
  *(_OWORD *)&retstr->a = v16;
  *(_OWORD *)&retstr->c = v14;
  retstr->tx = v11;
  retstr->ty = v12;
  return result;
}

- (void)set_transform:(CGAffineTransform *)a3
{
  __int128 v3;
  PKStrokeCoherence *v4;
  __int128 v5[3];

  v3 = *(_OWORD *)&a3->c;
  v5[0] = *(_OWORD *)&a3->a;
  v5[1] = v3;
  v5[2] = *(_OWORD *)&a3->tx;
  v4 = self;
  PKStrokeCoherence._transform.setter(v5);

}

- (void)_setTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  _OWORD v4[3];

  v3 = *(_OWORD *)&a3->c;
  v4[0] = *(_OWORD *)&a3->a;
  v4[1] = v3;
  v4[2] = *(_OWORD *)&a3->tx;
  -[PKStrokeCoherence set_transform:](self, sel_set_transform_, v4);
}

- (id)_substrokesInDrawing:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  PKStrokeCoherence *v11;
  uint64_t v13;

  v5 = type metadata accessor for PKDrawing();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5, v7);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = a3;
  v11 = self;
  static PKDrawing._unconditionallyBridgeFromObjectiveC(_:)();

  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  type metadata accessor for PKStroke();
  return Array._bridgeToObjectiveC()().super.isa;
}

- (CGRect)_bounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[PKStrokeCoherence renderBounds](self, sel_renderBounds);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)set_bounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  PKStrokeCoherence *v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  PKStrokeCoherence._bounds.setter(x, y, width, height);

}

- (CGRect)renderBounds
{
  PKStrokeCoherence *v2;
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
  v3 = PKStrokeCoherence.renderBounds.getter();
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

- (int64_t)compareToStroke:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  PKStrokeCoherence *v11;
  int64_t v12;
  uint64_t v14;

  v5 = type metadata accessor for PKStroke();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5, v7);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = a3;
  v11 = self;
  static PKStroke._unconditionallyBridgeFromObjectiveC(_:)();

  v12 = PKStrokeCoherence.compare(to:)();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  return v12;
}

- (void).cxx_destruct
{
  outlined destroy of PKStrokeProperties((uint64_t)self + OBJC_IVAR___PKStrokeCoherence_model, type metadata accessor for PKStrokeStruct);
  outlined destroy of PKStrokeProperties((uint64_t)self + OBJC_IVAR___PKStrokeCoherence__path, type metadata accessor for PKStrokePathStruct);
  outlined destroy of PKStrokeProperties((uint64_t)self + OBJC_IVAR___PKStrokeCoherence_resolvedProperties, type metadata accessor for PKStrokeInheritedProperties);
  outlined destroy of PKStrokeProperties((uint64_t)self + OBJC_IVAR___PKStrokeCoherence_inheritedProperties, type metadata accessor for PKStrokeInheritedProperties);
}

@end
