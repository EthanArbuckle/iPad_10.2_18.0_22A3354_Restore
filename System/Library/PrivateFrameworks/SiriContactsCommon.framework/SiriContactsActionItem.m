@implementation SiriContactsActionItem

- (NSString)description
{
  _TtC18SiriContactsCommon22SiriContactsActionItem *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = self;
  v3 = SiriContactsActionItem.description.getter();
  v5 = v4;

  v6 = (void *)MEMORY[0x249552728](v3, v5);
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

- (int64_t)hash
{
  _TtC18SiriContactsCommon22SiriContactsActionItem *v2;
  Swift::Int v3;

  v2 = self;
  v3 = SiriContactsActionItem.hash.getter();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  _TtC18SiriContactsCommon22SiriContactsActionItem *v4;
  _TtC18SiriContactsCommon22SiriContactsActionItem *v5;
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
  v6 = SiriContactsActionItem.isEqual(_:)((uint64_t)v8);

  outlined destroy of URL?((uint64_t)v8, &demangling cache variable for type metadata for Any?);
  return v6 & 1;
}

- (_TtC18SiriContactsCommon22SiriContactsActionItem)init
{
  SiriContactsActionItem.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_6_1();
  outlined destroy of URL?((uint64_t)self + OBJC_IVAR____TtC18SiriContactsCommon22SiriContactsActionItem_url, &demangling cache variable for type metadata for URL?);
  swift_bridgeObjectRelease();
}

@end
