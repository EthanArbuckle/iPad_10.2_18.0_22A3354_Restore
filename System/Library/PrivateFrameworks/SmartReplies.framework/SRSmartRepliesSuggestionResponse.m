@implementation SRSmartRepliesSuggestionResponse

- (_TtC12SmartReplies32SRSmartRepliesSuggestionResponse)initWithSuggestions:(id)a3
{
  objc_class *v4;
  objc_super v6;

  if (a3)
  {
    type metadata accessor for SRSmartRepliesSuggestion();
    v4 = (objc_class *)static Array._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else
  {
    v4 = 0;
  }
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12SmartReplies32SRSmartRepliesSuggestionResponse_suggestions) = v4;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for SRSmartRepliesSuggestionResponse();
  return -[SRSmartRepliesSuggestionResponse init](&v6, sel_init);
}

- (_TtC12SmartReplies32SRSmartRepliesSuggestionResponse)initWithCoder:(id)a3
{
  return (_TtC12SmartReplies32SRSmartRepliesSuggestionResponse *)SRSmartRepliesSuggestionResponse.init(coder:)(a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(void *)a3
{
  uint64_t v3;
  objc_class *v4;
  char *v5;
  objc_super v7;

  v3 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC12SmartReplies32SRSmartRepliesSuggestionResponse_suggestions);
  v4 = (objc_class *)type metadata accessor for SRSmartRepliesSuggestionResponse();
  v5 = (char *)objc_allocWithZone(v4);
  *(_QWORD *)&v5[OBJC_IVAR____TtC12SmartReplies32SRSmartRepliesSuggestionResponse_suggestions] = v3;
  v7.receiver = v5;
  v7.super_class = v4;
  swift_bridgeObjectRetain();
  return -[SRSmartRepliesSuggestionResponse init](&v7, sel_init);
}

- (void)encodeWithCoder:(id)a3
{
  Class isa;
  id v6;
  _TtC12SmartReplies32SRSmartRepliesSuggestionResponse *v7;
  id v8;
  _TtC12SmartReplies32SRSmartRepliesSuggestionResponse *v9;
  id v10;

  isa = *(Class *)((char *)&self->super.isa
                 + OBJC_IVAR____TtC12SmartReplies32SRSmartRepliesSuggestionResponse_suggestions);
  if (isa)
  {
    type metadata accessor for SRSmartRepliesSuggestion();
    v6 = a3;
    v7 = self;
    isa = Array._bridgeToObjectiveC()().super.isa;
  }
  else
  {
    v8 = a3;
    v9 = self;
  }
  v10 = (id)MEMORY[0x24957DF1C](0x6974736567677573, 0xEB00000000736E6FLL);
  objc_msgSend(a3, sel_encodeObject_forKey_, isa, v10);

  swift_unknownObjectRelease();
}

- (BOOL)isEqual:(id)a3
{
  _TtC12SmartReplies32SRSmartRepliesSuggestionResponse *v4;
  _TtC12SmartReplies32SRSmartRepliesSuggestionResponse *v5;
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
  v6 = SRSmartRepliesSuggestionResponse.isEqual(_:)((uint64_t)v8);

  outlined destroy of Any?((uint64_t)v8);
  return v6 & 1;
}

- (NSArray)suggestions
{
  NSArray v2;

  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12SmartReplies32SRSmartRepliesSuggestionResponse_suggestions))
  {
    type metadata accessor for SRSmartRepliesSuggestion();
    swift_bridgeObjectRetain();
    v2.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v2.super.isa = 0;
  }
  return (NSArray *)v2.super.isa;
}

- (_TtC12SmartReplies32SRSmartRepliesSuggestionResponse)init
{
  _TtC12SmartReplies32SRSmartRepliesSuggestionResponse *result;

  result = (_TtC12SmartReplies32SRSmartRepliesSuggestionResponse *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
