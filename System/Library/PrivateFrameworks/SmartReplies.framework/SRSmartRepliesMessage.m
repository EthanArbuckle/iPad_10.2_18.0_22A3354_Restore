@implementation SRSmartRepliesMessage

- (_TtC12SmartReplies21SRSmartRepliesMessage)initWithCoder:(id)a3
{
  return (_TtC12SmartReplies21SRSmartRepliesMessage *)SRSmartRepliesMessage.init(coder:)(a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(void *)a3
{
  _TtC12SmartReplies21SRSmartRepliesMessage *v3;
  void *v4;
  _QWORD v6[4];

  v3 = self;
  SRSmartRepliesMessage.copy(with:)(v6);

  __swift_project_boxed_opaque_existential_0(v6, v6[3]);
  v4 = (void *)_bridgeAnythingToObjectiveC<A>(_:)();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v6);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC12SmartReplies21SRSmartRepliesMessage *v5;

  v4 = a3;
  v5 = self;
  SRSmartRepliesMessage.encode(with:)((NSCoder)v4);

}

- (int64_t)hash
{
  _TtC12SmartReplies21SRSmartRepliesMessage *v2;
  Swift::Int v3;

  v2 = self;
  v3 = SRSmartRepliesMessage.hash.getter();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  _TtC12SmartReplies21SRSmartRepliesMessage *v4;
  _TtC12SmartReplies21SRSmartRepliesMessage *v5;
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
  v6 = SRSmartRepliesMessage.isEqual(_:)((uint64_t)v8);

  outlined destroy of Any?((uint64_t)v8, (uint64_t *)&demangling cache variable for type metadata for Any?);
  return v6 & 1;
}

- (NSString)title
{
  return (NSString *)@objc SRSmartRepliesSuggestionRequest.context.getter((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC12SmartReplies21SRSmartRepliesMessage_title);
}

- (void)setTitle:(id)a3
{
  @objc SRSmartRepliesSuggestionRequest.context.setter((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC12SmartReplies21SRSmartRepliesMessage_title);
}

- (NSString)senderIdentifier
{
  return (NSString *)@objc SRSmartRepliesSuggestionRequest.context.getter((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC12SmartReplies21SRSmartRepliesMessage_senderIdentifier);
}

- (void)setSenderIdentifier:(id)a3
{
  @objc SRSmartRepliesSuggestionRequest.context.setter((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC12SmartReplies21SRSmartRepliesMessage_senderIdentifier);
}

- (NSString)summary
{
  return (NSString *)@objc SRSmartRepliesSuggestionRequest.context.getter((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC12SmartReplies21SRSmartRepliesMessage_summary);
}

- (void)setSummary:(id)a3
{
  @objc SRSmartRepliesSuggestionRequest.context.setter((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC12SmartReplies21SRSmartRepliesMessage_summary);
}

- (BOOL)isTapBack
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR____TtC12SmartReplies21SRSmartRepliesMessage_isTapBack;
  swift_beginAccess();
  return *v2;
}

- (void)setIsTapBack:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR____TtC12SmartReplies21SRSmartRepliesMessage_isTapBack;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)isEmote
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR____TtC12SmartReplies21SRSmartRepliesMessage_isEmote;
  swift_beginAccess();
  return *v2;
}

- (void)setIsEmote:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR____TtC12SmartReplies21SRSmartRepliesMessage_isEmote;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)isRead
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR____TtC12SmartReplies21SRSmartRepliesMessage_isRead;
  swift_beginAccess();
  return *v2;
}

- (void)setIsRead:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR____TtC12SmartReplies21SRSmartRepliesMessage_isRead;
  swift_beginAccess();
  *v4 = a3;
}

- (NSDate)dateSent
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  Class isa;
  uint64_t v11;

  v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Date?);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (char *)self + OBJC_IVAR____TtC12SmartReplies21SRSmartRepliesMessage_dateSent;
  swift_beginAccess();
  outlined init with copy of Date?((uint64_t)v6, (uint64_t)v5, (uint64_t *)&demangling cache variable for type metadata for Date?);
  v7 = type metadata accessor for Date();
  v8 = *(_QWORD *)(v7 - 8);
  isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
  {
    isa = Date._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }
  return (NSDate *)isa;
}

- (void)setDateSent:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  _TtC12SmartReplies21SRSmartRepliesMessage *v11;
  uint64_t v12;

  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Date?);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    static Date._unconditionallyBridgeFromObjectiveC(_:)();
    v8 = type metadata accessor for Date();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 0, 1, v8);
  }
  else
  {
    v9 = type metadata accessor for Date();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v7, 1, 1, v9);
  }
  v10 = (char *)self + OBJC_IVAR____TtC12SmartReplies21SRSmartRepliesMessage_dateSent;
  swift_beginAccess();
  v11 = self;
  outlined assign with take of Date?((uint64_t)v7, (uint64_t)v10);
  swift_endAccess();

}

- (_TtC12SmartReplies21SRSmartRepliesMessage)init
{
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  char *v6;
  uint64_t v7;
  objc_super v9;

  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12SmartReplies21SRSmartRepliesMessage_title);
  *v3 = 0;
  v3[1] = 0;
  v4 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12SmartReplies21SRSmartRepliesMessage_senderIdentifier);
  *v4 = 0;
  v4[1] = 0;
  v5 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12SmartReplies21SRSmartRepliesMessage_summary);
  *v5 = 0;
  v5[1] = 0;
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC12SmartReplies21SRSmartRepliesMessage_isTapBack) = 0;
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC12SmartReplies21SRSmartRepliesMessage_isEmote) = 0;
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC12SmartReplies21SRSmartRepliesMessage_isRead) = 0;
  v6 = (char *)self + OBJC_IVAR____TtC12SmartReplies21SRSmartRepliesMessage_dateSent;
  v7 = type metadata accessor for Date();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v6, 1, 1, v7);
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for SRSmartRepliesMessage();
  return -[SRSmartRepliesMessage init](&v9, sel_init);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined destroy of Any?((uint64_t)self + OBJC_IVAR____TtC12SmartReplies21SRSmartRepliesMessage_dateSent, (uint64_t *)&demangling cache variable for type metadata for Date?);
}

@end
