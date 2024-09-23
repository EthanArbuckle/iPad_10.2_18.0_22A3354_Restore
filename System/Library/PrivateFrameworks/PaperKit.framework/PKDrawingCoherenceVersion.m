@implementation PKDrawingCoherenceVersion

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  PKDrawingCoherenceVersion *v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  Class isa;

  v4 = a3;
  v5 = self;
  v6 = UUID.data()();
  v8 = v7;
  isa = Data._bridgeToObjectiveC()().super.isa;
  outlined consume of Data._Representation(v6, v8);
  objc_msgSend(v4, sel_encodeDataObject_, isa);

}

- (PKDrawingCoherenceVersion)initWithCoder:(id)a3
{
  return (PKDrawingCoherenceVersion *)PKDrawingCoherenceVersion.init(coder:)(a3);
}

- (BOOL)isEqual:(id)a3
{
  return @objc CalculateDocumentProvider.isEqual(_:)(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))PKDrawingCoherenceVersion.isEqual(_:));
}

- (PKDrawingCoherenceVersion)init
{
  PKDrawingCoherenceVersion *result;

  result = (PKDrawingCoherenceVersion *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  @objc PKDrawingCoherenceVersion.__ivar_destroyer((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___PKDrawingCoherenceVersion_versionUUID, (uint64_t (*)(_QWORD))MEMORY[0x1E0CB0998]);
}

@end
