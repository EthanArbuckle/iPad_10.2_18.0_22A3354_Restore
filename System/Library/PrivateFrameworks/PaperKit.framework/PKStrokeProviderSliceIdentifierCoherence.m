@implementation PKStrokeProviderSliceIdentifierCoherence

- (BOOL)isEqual:(id)a3
{
  return @objc CalculateDocumentProvider.isEqual(_:)(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))PKStrokeProviderSliceIdentifierCoherence.isEqual(_:));
}

- (int64_t)hash
{
  PKStrokeProviderSliceIdentifierCoherence *v2;
  Swift::Int v3;

  v2 = self;
  v3 = PKStrokeProviderSliceIdentifierCoherence.hash.getter();

  return v3;
}

- (NSString)description
{
  PKStrokeProviderSliceIdentifierCoherence *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = self;
  v3 = PKStrokeProviderSliceIdentifierCoherence.description.getter();
  v5 = v4;

  v6 = (void *)MEMORY[0x1DF0E41AC](v3, v5);
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  PKStrokeProviderSliceIdentifierCoherence *v5;

  v4 = a3;
  v5 = self;
  PKStrokeProviderSliceIdentifierCoherence.encode(with:)((NSCoder)v4);

}

- (PKStrokeProviderSliceIdentifierCoherence)initWithCoder:(id)a3
{
  return (PKStrokeProviderSliceIdentifierCoherence *)PKStrokeProviderSliceIdentifierCoherence.init(coder:)(a3);
}

- (PKStrokeProviderSliceIdentifierCoherence)initWithUUID:(id)a3 tStart:(double)a4 tEnd:(double)a5
{
  uint64_t v5;
  uint64_t v6;
  PKStrokeProviderSliceIdentifierCoherence *result;

  v5 = type metadata accessor for UUID();
  MEMORY[0x1E0C80A78](v5, v6);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  result = (PKStrokeProviderSliceIdentifierCoherence *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (PKStrokeProviderSliceIdentifierCoherence)init
{
  PKStrokeProviderSliceIdentifierCoherence *result;

  result = (PKStrokeProviderSliceIdentifierCoherence *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR___PKStrokeProviderSliceIdentifierCoherence_transformTimestamp;
  v4 = type metadata accessor for FinalizedTimestamp();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  outlined destroy of StocksKitCurrencyCache.Provider?((uint64_t)self + OBJC_IVAR___PKStrokeProviderSliceIdentifierCoherence_strokeDataUUID, &demangling cache variable for type metadata for UUID?);
}

@end
