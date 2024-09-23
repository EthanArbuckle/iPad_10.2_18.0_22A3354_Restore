@implementation SRSmartRepliesSuggestionRequest

- (_TtC12SmartReplies31SRSmartRepliesSuggestionRequest)initWithType:(int64_t)a3 receivedMessages:(id)a4
{
  uint64_t v5;

  type metadata accessor for SRSmartRepliesMessage();
  v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  return (_TtC12SmartReplies31SRSmartRepliesSuggestionRequest *)SRSmartRepliesSuggestionRequest.init(type:receivedMessages:)(a3, v5);
}

- (_TtC12SmartReplies31SRSmartRepliesSuggestionRequest)initWithCoder:(id)a3
{
  return (_TtC12SmartReplies31SRSmartRepliesSuggestionRequest *)SRSmartRepliesSuggestionRequest.init(coder:)(a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(void *)a3
{
  _TtC12SmartReplies31SRSmartRepliesSuggestionRequest *v3;
  void *v4;
  _QWORD v6[4];

  v3 = self;
  SRSmartRepliesSuggestionRequest.copy(with:)(v6);

  __swift_project_boxed_opaque_existential_0(v6, v6[3]);
  v4 = (void *)_bridgeAnythingToObjectiveC<A>(_:)();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v6);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC12SmartReplies31SRSmartRepliesSuggestionRequest *v5;

  v4 = a3;
  v5 = self;
  SRSmartRepliesSuggestionRequest.encode(with:)((NSCoder)v4);

}

- (int64_t)hash
{
  _TtC12SmartReplies31SRSmartRepliesSuggestionRequest *v2;
  Swift::Int v3;

  v2 = self;
  v3 = SRSmartRepliesSuggestionRequest.hash.getter();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  _TtC12SmartReplies31SRSmartRepliesSuggestionRequest *v4;
  _TtC12SmartReplies31SRSmartRepliesSuggestionRequest *v5;
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
  v6 = SRSmartRepliesSuggestionRequest.isEqual(_:)((uint64_t)v8);

  outlined destroy of Any?((uint64_t)v8, (uint64_t *)&demangling cache variable for type metadata for Any?);
  return v6 & 1;
}

- (int64_t)type
{
  int64_t *v2;

  v2 = (int64_t *)((char *)self + OBJC_IVAR____TtC12SmartReplies31SRSmartRepliesSuggestionRequest_type);
  swift_beginAccess();
  return *v2;
}

- (void)setType:(int64_t)a3
{
  int64_t *v4;

  v4 = (int64_t *)((char *)self + OBJC_IVAR____TtC12SmartReplies31SRSmartRepliesSuggestionRequest_type);
  swift_beginAccess();
  *v4 = a3;
}

- (NSArray)receivedMessages
{
  Class isa;

  swift_beginAccess();
  type metadata accessor for SRSmartRepliesMessage();
  swift_bridgeObjectRetain();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return (NSArray *)isa;
}

- (void)setReceivedMessages:(id)a3
{
  uint64_t v4;
  uint64_t *v5;

  type metadata accessor for SRSmartRepliesMessage();
  v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC12SmartReplies31SRSmartRepliesSuggestionRequest_receivedMessages);
  swift_beginAccess();
  *v5 = v4;
  swift_bridgeObjectRelease();
}

- (BOOL)includeLowConfidenceSuggestions
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR____TtC12SmartReplies31SRSmartRepliesSuggestionRequest_includeLowConfidenceSuggestions;
  swift_beginAccess();
  return *v2;
}

- (void)setIncludeLowConfidenceSuggestions:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR____TtC12SmartReplies31SRSmartRepliesSuggestionRequest_includeLowConfidenceSuggestions;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)skipPopulatingMetadata
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR____TtC12SmartReplies31SRSmartRepliesSuggestionRequest_skipPopulatingMetadata;
  swift_beginAccess();
  return *v2;
}

- (void)setSkipPopulatingMetadata:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR____TtC12SmartReplies31SRSmartRepliesSuggestionRequest_skipPopulatingMetadata;
  swift_beginAccess();
  *v4 = a3;
}

- (NSArray)senderMessages
{
  _QWORD *v2;
  Class isa;

  v2 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtC12SmartReplies31SRSmartRepliesSuggestionRequest_senderMessages);
  swift_beginAccess();
  if (!*v2)
    return (NSArray *)0;
  type metadata accessor for SRSmartRepliesMessage();
  swift_bridgeObjectRetain();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return (NSArray *)isa;
}

- (void)setSenderMessages:(id)a3
{
  uint64_t v3;
  uint64_t *v5;

  v3 = (uint64_t)a3;
  if (a3)
  {
    type metadata accessor for SRSmartRepliesMessage();
    v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  }
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC12SmartReplies31SRSmartRepliesSuggestionRequest_senderMessages);
  swift_beginAccess();
  *v5 = v3;
  swift_bridgeObjectRelease();
}

- (NSString)context
{
  return (NSString *)@objc SRSmartRepliesSuggestionRequest.context.getter((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC12SmartReplies31SRSmartRepliesSuggestionRequest_context);
}

- (void)setContext:(id)a3
{
  @objc SRSmartRepliesSuggestionRequest.context.setter((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC12SmartReplies31SRSmartRepliesSuggestionRequest_context);
}

- (NSString)languageCode
{
  return (NSString *)@objc SRSmartRepliesSuggestionRequest.context.getter((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC12SmartReplies31SRSmartRepliesSuggestionRequest_languageCode);
}

- (void)setLanguageCode:(id)a3
{
  @objc SRSmartRepliesSuggestionRequest.context.setter((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC12SmartReplies31SRSmartRepliesSuggestionRequest_languageCode);
}

- (NSDate)languageLastChangedDate
{
  return (NSDate *)@objc SRSmartRepliesSuggestionRequest.languageLastChangedDate.getter((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC12SmartReplies31SRSmartRepliesSuggestionRequest_languageLastChangedDate);
}

- (void)setLanguageLastChangedDate:(id)a3
{
  @objc SRSmartRepliesSuggestionRequest.languageLastChangedDate.setter(self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC12SmartReplies31SRSmartRepliesSuggestionRequest_languageLastChangedDate);
}

- (BOOL)includesDynamicSuggestions
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR____TtC12SmartReplies31SRSmartRepliesSuggestionRequest_includesDynamicSuggestions;
  swift_beginAccess();
  return *v2;
}

- (void)setIncludesDynamicSuggestions:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR____TtC12SmartReplies31SRSmartRepliesSuggestionRequest_includesDynamicSuggestions;
  swift_beginAccess();
  *v4 = a3;
}

- (NSDate)requestDate
{
  return (NSDate *)@objc SRSmartRepliesSuggestionRequest.languageLastChangedDate.getter((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC12SmartReplies31SRSmartRepliesSuggestionRequest_requestDate);
}

- (void)setRequestDate:(id)a3
{
  @objc SRSmartRepliesSuggestionRequest.languageLastChangedDate.setter(self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC12SmartReplies31SRSmartRepliesSuggestionRequest_requestDate);
}

- (NSArray)recipients
{
  _QWORD *v2;
  Class isa;

  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12SmartReplies31SRSmartRepliesSuggestionRequest_recipients);
  swift_beginAccess();
  if (!*v2)
    return (NSArray *)0;
  swift_bridgeObjectRetain();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return (NSArray *)isa;
}

- (void)setRecipients:(id)a3
{
  uint64_t v4;
  uint64_t *v5;

  if (a3)
    v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  else
    v4 = 0;
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC12SmartReplies31SRSmartRepliesSuggestionRequest_recipients);
  swift_beginAccess();
  *v5 = v4;
  swift_bridgeObjectRelease();
}

- (NSString)preferredLocale
{
  return (NSString *)@objc SRSmartRepliesSuggestionRequest.preferredLocale.getter(self, (uint64_t)a2, (uint64_t (*)(void))SRSmartRepliesSuggestionRequest.preferredLocale.getter);
}

- (void)setPreferredLocale:(id)a3
{
  @objc SRSmartRepliesSuggestionRequest.preferredLocale.setter((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC12SmartReplies31SRSmartRepliesSuggestionRequest____lazy_storage___preferredLocale);
}

- (NSString)preferredLanguage
{
  return (NSString *)@objc SRSmartRepliesSuggestionRequest.preferredLocale.getter(self, (uint64_t)a2, SRSmartRepliesSuggestionRequest.preferredLanguage.getter);
}

- (void)setPreferredLanguage:(id)a3
{
  @objc SRSmartRepliesSuggestionRequest.preferredLocale.setter((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC12SmartReplies31SRSmartRepliesSuggestionRequest____lazy_storage___preferredLanguage);
}

- (NSString)concatenatedReceivedText
{
  _TtC12SmartReplies31SRSmartRepliesSuggestionRequest *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = self;
  v3 = SRSmartRepliesSuggestionRequest.concatenatedReceivedText.getter();
  v5 = v4;

  v6 = (void *)MEMORY[0x24957DF1C](v3, v5);
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

- (void)setConcatenatedReceivedText:(id)a3
{
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = (uint64_t *)((char *)self
                 + OBJC_IVAR____TtC12SmartReplies31SRSmartRepliesSuggestionRequest____lazy_storage___concatenatedReceivedText);
  *v5 = v4;
  v5[1] = v6;
  swift_bridgeObjectRelease();
}

- (_TtC12SmartReplies31SRSmartRepliesSuggestionRequest)modifiedRequestWithContactPlaceholder
{
  _TtC12SmartReplies31SRSmartRepliesSuggestionRequest *v2;
  _QWORD *v3;

  v2 = self;
  v3 = SRSmartRepliesSuggestionRequest.modifiedRequestWithContactPlaceholder.getter();

  return (_TtC12SmartReplies31SRSmartRepliesSuggestionRequest *)v3;
}

- (void)setModifiedRequestWithContactPlaceholder:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC12SmartReplies31SRSmartRepliesSuggestionRequest____lazy_storage___modifiedRequestWithContactPlaceholder);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC12SmartReplies31SRSmartRepliesSuggestionRequest____lazy_storage___modifiedRequestWithContactPlaceholder) = (Class)a3;
  v3 = a3;

}

- (_TtC12SmartReplies31SRSmartRepliesSuggestionRequest)init
{
  _TtC12SmartReplies31SRSmartRepliesSuggestionRequest *result;

  result = (_TtC12SmartReplies31SRSmartRepliesSuggestionRequest *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  char *v4;
  char *v5;
  char *v6;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined destroy of Any?((uint64_t)self + OBJC_IVAR____TtC12SmartReplies31SRSmartRepliesSuggestionRequest_languageLastChangedDate, (uint64_t *)&demangling cache variable for type metadata for Date?);
  outlined destroy of Any?((uint64_t)self + OBJC_IVAR____TtC12SmartReplies31SRSmartRepliesSuggestionRequest_requestDate, (uint64_t *)&demangling cache variable for type metadata for Date?);
  swift_bridgeObjectRelease();
  outlined consume of String??(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC12SmartReplies31SRSmartRepliesSuggestionRequest____lazy_storage___preferredLocale), *(_QWORD *)&self->type[OBJC_IVAR____TtC12SmartReplies31SRSmartRepliesSuggestionRequest____lazy_storage___preferredLocale]);
  outlined consume of String??(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC12SmartReplies31SRSmartRepliesSuggestionRequest____lazy_storage___preferredLanguage), *(_QWORD *)&self->type[OBJC_IVAR____TtC12SmartReplies31SRSmartRepliesSuggestionRequest____lazy_storage___preferredLanguage]);
  swift_bridgeObjectRelease();
  v3 = *(char **)((char *)&self->super.isa
                + OBJC_IVAR____TtC12SmartReplies31SRSmartRepliesSuggestionRequest____lazy_storage___modifiedRequestWithContactPlaceholder);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC12SmartReplies31SRSmartRepliesSuggestionRequest____lazy_storage___modifiedRequestWithContactPlaceholder) = 0;
  if (v3)
  {
    while (1)
    {
      v6 = v3;
      if (!swift_isUniquelyReferenced())
        break;
      v4 = *(char **)&v6[OBJC_IVAR____TtC12SmartReplies31SRSmartRepliesSuggestionRequest____lazy_storage___modifiedRequestWithContactPlaceholder];
      v5 = v4;

      v3 = v4;
      if (!v4)
        goto LABEL_6;
    }
    v3 = v6;
  }
LABEL_6:

}

- (id)senderMessagesAsStrings
{
  return @objc SRSmartRepliesSuggestionRequest.senderMessagesAsStrings()(self, (uint64_t)a2, (uint64_t (*)(void))SRSmartRepliesSuggestionRequest.senderMessagesAsStrings());
}

- (id)receivedMessagesAsStrings
{
  return @objc SRSmartRepliesSuggestionRequest.senderMessagesAsStrings()(self, (uint64_t)a2, (uint64_t (*)(void))SRSmartRepliesSuggestionRequest.receivedMessagesAsStrings());
}

- (BOOL)hasValidReceivedMessages
{
  _TtC12SmartReplies31SRSmartRepliesSuggestionRequest *v2;
  Swift::Bool valid;

  v2 = self;
  valid = SRSmartRepliesSuggestionRequest.hasValidReceivedMessages()();

  return valid;
}

@end
