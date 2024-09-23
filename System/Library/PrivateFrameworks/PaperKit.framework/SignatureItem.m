@implementation SignatureItem

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC8PaperKit13SignatureItem)initWithCoder:(id)a3
{
  return (_TtC8PaperKit13SignatureItem *)SignatureItem.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC8PaperKit13SignatureItem *v5;

  v4 = a3;
  v5 = self;
  SignatureItem.encode(with:)((NSCoder)v4);

}

- (_TtC8PaperKit13SignatureItem)init
{
  _TtC8PaperKit13SignatureItem *result;

  result = (_TtC8PaperKit13SignatureItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC8PaperKit13SignatureItem_uniqueID;
  v4 = type metadata accessor for UUID();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  outlined destroy of StocksKitCurrencyCache.Provider?((uint64_t)self + OBJC_IVAR____TtC8PaperKit13SignatureItem_creationDate, &demangling cache variable for type metadata for Date?);
  outlined consume of SignatureDescription(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8PaperKit13SignatureItem_signatureDescription), *(_QWORD *)&self->_anon_0[OBJC_IVAR____TtC8PaperKit13SignatureItem_signatureDescription]);

  outlined destroy of StocksKitCurrencyCache.Provider?((uint64_t)self + OBJC_IVAR____TtC8PaperKit13SignatureItem_drawing, &demangling cache variable for type metadata for PKDrawing?);
}

@end
