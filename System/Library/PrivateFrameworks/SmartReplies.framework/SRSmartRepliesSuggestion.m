@implementation SRSmartRepliesSuggestion

- (_TtC12SmartReplies24SRSmartRepliesSuggestion)initWithTitle:(id)a3 isDynamicSuggestion:(BOOL)a4
{
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  objc_super v10;

  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v7 = (uint64_t *)((char *)self + OBJC_IVAR____TtC12SmartReplies24SRSmartRepliesSuggestion_title);
  *v7 = v6;
  v7[1] = v8;
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC12SmartReplies24SRSmartRepliesSuggestion_isDynamicSuggestion) = a4;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for SRSmartRepliesSuggestion();
  return -[SRSmartRepliesSuggestion init](&v10, sel_init);
}

- (_TtC12SmartReplies24SRSmartRepliesSuggestion)initWithCoder:(id)a3
{
  return (_TtC12SmartReplies24SRSmartRepliesSuggestion *)SRSmartRepliesSuggestion.init(coder:)(a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(void *)a3
{
  uint64_t v3;
  uint64_t v4;
  char v5;
  objc_class *v6;
  _BYTE *v7;
  _QWORD *v8;
  objc_super v10;

  v4 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC12SmartReplies24SRSmartRepliesSuggestion_title);
  v3 = *(_QWORD *)&self->title[OBJC_IVAR____TtC12SmartReplies24SRSmartRepliesSuggestion_title];
  v5 = *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC12SmartReplies24SRSmartRepliesSuggestion_isDynamicSuggestion);
  v6 = (objc_class *)type metadata accessor for SRSmartRepliesSuggestion();
  v7 = objc_allocWithZone(v6);
  v8 = &v7[OBJC_IVAR____TtC12SmartReplies24SRSmartRepliesSuggestion_title];
  *v8 = v4;
  v8[1] = v3;
  v7[OBJC_IVAR____TtC12SmartReplies24SRSmartRepliesSuggestion_isDynamicSuggestion] = v5;
  v10.receiver = v7;
  v10.super_class = v6;
  swift_bridgeObjectRetain();
  return -[SRSmartRepliesSuggestion init](&v10, sel_init);
}

- (int64_t)hash
{
  _TtC12SmartReplies24SRSmartRepliesSuggestion *v3;
  Swift::Int v4;

  Hasher.init()();
  v3 = self;
  swift_bridgeObjectRetain();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  Hasher._combine(_:)(*((_BYTE *)&v3->super.isa
                      + OBJC_IVAR____TtC12SmartReplies24SRSmartRepliesSuggestion_isDynamicSuggestion));
  v4 = Hasher.finalize()();

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC12SmartReplies24SRSmartRepliesSuggestion *v5;

  v4 = a3;
  v5 = self;
  SRSmartRepliesSuggestion.encode(with:)((NSCoder)v4);

}

- (BOOL)isEqual:(id)a3
{
  _TtC12SmartReplies24SRSmartRepliesSuggestion *v4;
  _TtC12SmartReplies24SRSmartRepliesSuggestion *v5;
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
  v6 = SRSmartRepliesSuggestion.isEqual(_:)((uint64_t)v8);

  outlined destroy of Any?((uint64_t)v8);
  return v6 & 1;
}

- (NSString)description
{
  _TtC12SmartReplies24SRSmartRepliesSuggestion *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = self;
  v3 = SRSmartRepliesSuggestion.description.getter();
  v5 = v4;

  v6 = (void *)MEMORY[0x24957DF1C](v3, v5);
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

- (NSString)title
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC12SmartReplies24SRSmartRepliesSuggestion_title);
  v3 = *(_QWORD *)&self->title[OBJC_IVAR____TtC12SmartReplies24SRSmartRepliesSuggestion_title];
  swift_bridgeObjectRetain();
  v4 = (void *)MEMORY[0x24957DF1C](v2, v3);
  swift_bridgeObjectRelease();
  return (NSString *)v4;
}

- (BOOL)isDynamicSuggestion
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC12SmartReplies24SRSmartRepliesSuggestion_isDynamicSuggestion);
}

- (_TtC12SmartReplies24SRSmartRepliesSuggestion)init
{
  _TtC12SmartReplies24SRSmartRepliesSuggestion *result;

  result = (_TtC12SmartReplies24SRSmartRepliesSuggestion *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
