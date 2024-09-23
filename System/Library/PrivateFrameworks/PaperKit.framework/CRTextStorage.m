@implementation CRTextStorage

- (_TtC8PaperKit13CRTextStorage)init
{
  return (_TtC8PaperKit13CRTextStorage *)CRTextStorage.init()();
}

- (_TtC8PaperKit13CRTextStorage)initWithCoder:(id)a3
{
  id v4;
  _TtC8PaperKit13CRTextStorage *result;

  *((_BYTE *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC8PaperKit13CRTextStorage_darkMode) = 0;
  *((_BYTE *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC8PaperKit13CRTextStorage_isFixingAttributes) = 0;
  v4 = a3;

  result = (_TtC8PaperKit13CRTextStorage *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (_TtC8PaperKit13CRTextStorage)initWithItemProviderData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  _TtC8PaperKit13CRTextStorage *result;

  v7 = a3;
  v8 = a4;
  static Data._unconditionallyBridgeFromObjectiveC(_:)();

  *((_BYTE *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC8PaperKit13CRTextStorage_darkMode) = 0;
  *((_BYTE *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC8PaperKit13CRTextStorage_isFixingAttributes) = 0;

  result = (_TtC8PaperKit13CRTextStorage *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (id)mutableAttributedString
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                 + OBJC_IVAR____TtC8PaperKit13CRTextStorage_viewAttributedString));
}

- (void)replaceCharactersInRange:(_NSRange)a3 withString:(id)a4
{
  Swift::Int length;
  Swift::Int location;
  uint64_t v7;
  void *v8;
  void *v9;
  _TtC8PaperKit13CRTextStorage *v10;
  __C::_NSRange v11;
  Swift::String v12;

  length = a3.length;
  location = a3.location;
  v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v9 = v8;
  v10 = self;
  v11.location = location;
  v11.length = length;
  v12._countAndFlagsBits = v7;
  v12._object = v9;
  CRTextStorage.replaceCharacters(in:with:)(v11, v12);

  swift_bridgeObjectRelease();
}

- (void)setAttributes:(id)a3 range:(_NSRange)a4
{
  Swift::Int length;
  char location;
  void *v6;
  _TtC8PaperKit13CRTextStorage *v8;
  __C::_NSRange v9;
  Swift::OpaquePointer_optional v10;

  length = a4.length;
  location = a4.location;
  v6 = a3;
  if (a3)
  {
    type metadata accessor for NSAttributedStringKey(0);
    lazy protocol witness table accessor for type NSAttributedStringKey and conformance NSAttributedStringKey();
    v6 = (void *)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  v8 = self;
  v10.value._rawValue = v6;
  v10.is_nil = location;
  v9.location = length;
  CRTextStorage.setAttributes(_:range:)(v10, v9);

  swift_bridgeObjectRelease();
}

- (void)fixAttributesInRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  objc_class *ObjectType;
  uint64_t v7;
  _TtC8PaperKit13CRTextStorage *v8;
  objc_super v9;

  length = a3.length;
  location = a3.location;
  ObjectType = (objc_class *)swift_getObjectType();
  v7 = OBJC_IVAR____TtC8PaperKit13CRTextStorage_isFixingAttributes;
  *((_BYTE *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC8PaperKit13CRTextStorage_isFixingAttributes) = 1;
  v9.receiver = self;
  v9.super_class = ObjectType;
  v8 = self;
  -[CRTextStorage fixAttributesInRange:](&v9, sel_fixAttributesInRange_, location, length);
  *((_BYTE *)&self->super.super.super.super.super.isa + v7) = 0;

}

- (_TtC8PaperKit13CRTextStorage)initWithFileURL:(id)a3 options:(id)a4 documentAttributes:(id *)a5 error:(id *)a6
{
  @objc CRTextStorage.init(fileURL:options:documentAttributes:)();
}

- (_TtC8PaperKit13CRTextStorage)initWithURL:(id)a3 options:(id)a4 documentAttributes:(id *)a5 error:(id *)a6
{
  @objc CRTextStorage.init(fileURL:options:documentAttributes:)();
}

- (_TtC8PaperKit13CRTextStorage)initWithData:(id)a3 options:(id)a4 documentAttributes:(id *)a5 error:(id *)a6
{
  id v7;
  id v8;
  _TtC8PaperKit13CRTextStorage *result;

  v7 = a3;
  v8 = a4;
  static Data._unconditionallyBridgeFromObjectiveC(_:)();

  result = (_TtC8PaperKit13CRTextStorage *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC8PaperKit13CRTextStorage)initWithContentsOfMarkdownFileAtURL:(id)a3 options:(id)a4 baseURL:(id)a5 error:(id *)a6
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  _TtC8PaperKit13CRTextStorage *result;
  uint64_t v18;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  MEMORY[0x1E0C80A78](v8, v9);
  v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for URL();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x1E0C80A78](v12, v14);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  if (a5)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)();
    v15 = 0;
  }
  else
  {
    v15 = 1;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v11, v15, 1, v12);
  v16 = a4;
  result = (_TtC8PaperKit13CRTextStorage *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC8PaperKit13CRTextStorage)initWithMarkdown:(id)a3 options:(id)a4 baseURL:(id)a5 error:(id *)a6
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  _TtC8PaperKit13CRTextStorage *result;
  uint64_t v19;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  MEMORY[0x1E0C80A78](v9, v10);
  v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = a3;
  v14 = a4;
  v15 = a5;
  static Data._unconditionallyBridgeFromObjectiveC(_:)();

  if (v15)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)();

    v16 = type metadata accessor for URL();
    v17 = 0;
  }
  else
  {
    v16 = type metadata accessor for URL();
    v17 = 1;
  }
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v12, v17, 1);
  result = (_TtC8PaperKit13CRTextStorage *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC8PaperKit13CRTextStorage)initWithMarkdownString:(id)a3 options:(id)a4 baseURL:(id)a5 error:(id *)a6
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  _TtC8PaperKit13CRTextStorage *result;
  uint64_t v16;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  MEMORY[0x1E0C80A78](v8, v9);
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a5)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)();
    v12 = type metadata accessor for URL();
    v13 = 0;
  }
  else
  {
    v12 = type metadata accessor for URL();
    v13 = 1;
  }
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v11, v13, 1);
  v14 = a4;
  result = (_TtC8PaperKit13CRTextStorage *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC8PaperKit13CRTextStorage)initWithString:(id)a3
{
  _TtC8PaperKit13CRTextStorage *result;

  result = (_TtC8PaperKit13CRTextStorage *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC8PaperKit13CRTextStorage)initWithString:(id)a3 attributes:(id)a4
{
  _TtC8PaperKit13CRTextStorage *result;

  result = (_TtC8PaperKit13CRTextStorage *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC8PaperKit13CRTextStorage)initWithAttributedString:(id)a3
{
  id v3;
  _TtC8PaperKit13CRTextStorage *result;

  v3 = a3;
  result = (_TtC8PaperKit13CRTextStorage *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC8PaperKit13CRTextStorage)initWithAttachment:(id)a3 attributes:(id)a4
{
  id v4;
  _TtC8PaperKit13CRTextStorage *result;

  v4 = a3;
  result = (_TtC8PaperKit13CRTextStorage *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit13CRTextStorage_viewAttributedString));
  v3 = (char *)self + OBJC_IVAR____TtC8PaperKit13CRTextStorage_mergeableString;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CRAttributedString<TextAttributeScope>);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
