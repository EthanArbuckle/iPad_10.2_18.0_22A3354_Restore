@implementation WeakPaperPageWrapper

- (BOOL)isEqual:(id)a3
{
  _TtC8PaperKitP33_F9BA2F3895C2005D59C823F72F32582820WeakPaperPageWrapper *v4;
  _TtC8PaperKitP33_F9BA2F3895C2005D59C823F72F32582820WeakPaperPageWrapper *v5;
  char v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = WeakPaperPageWrapper.isEqual(_:)((uint64_t)v8);

  outlined destroy of StocksKitCurrencyCache.Provider?((uint64_t)v8, &demangling cache variable for type metadata for Any?);
  return v6 & 1;
}

- (int64_t)hash
{
  _TtC8PaperKitP33_F9BA2F3895C2005D59C823F72F32582820WeakPaperPageWrapper *v3;
  Swift::Int v4;

  Hasher.init()();
  v3 = self;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for WeakTagged_3<TaggedPaperPage>);
  lazy protocol witness table accessor for type Ref<PKStrokePathStruct> and conformance Ref<A>((unint64_t *)&lazy protocol witness table cache variable for type WeakTagged_3<TaggedPaperPage> and conformance WeakTagged_3<A>, &demangling cache variable for type metadata for WeakTagged_3<TaggedPaperPage>, MEMORY[0x1E0D11E40]);
  dispatch thunk of Hashable.hash(into:)();
  v4 = Hasher.finalize()();

  return v4;
}

- (_TtC8PaperKitP33_F9BA2F3895C2005D59C823F72F32582820WeakPaperPageWrapper)init
{
  _TtC8PaperKitP33_F9BA2F3895C2005D59C823F72F32582820WeakPaperPageWrapper *result;

  result = (_TtC8PaperKitP33_F9BA2F3895C2005D59C823F72F32582820WeakPaperPageWrapper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR____TtC8PaperKitP33_F9BA2F3895C2005D59C823F72F32582820WeakPaperPageWrapper_ref;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for WeakTagged_3<TaggedPaperPage>);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

@end
