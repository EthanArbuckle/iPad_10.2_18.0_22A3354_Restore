@implementation SRSmartRepliesActionSuggestion

- (_TtC12SmartReplies30SRSmartRepliesActionSuggestion)initWithType:(int64_t)a3 title:(id)a4 attribution:(id)a5 isRichSuggestion:(BOOL)a6 metadata:(id)a7
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t *v18;
  id v19;
  objc_super v21;

  v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v14 = v13;
  if (a5)
  {
    v15 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else
  {
    v15 = 0;
    v16 = 0;
  }
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC12SmartReplies30SRSmartRepliesActionSuggestion_type) = (Class)a3;
  v17 = (uint64_t *)((char *)self + OBJC_IVAR____TtC12SmartReplies30SRSmartRepliesActionSuggestion_attribution);
  *v17 = v15;
  v17[1] = v16;
  *((_BYTE *)&self->super.super.isa + OBJC_IVAR____TtC12SmartReplies30SRSmartRepliesActionSuggestion_isRichSuggestion) = a6;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC12SmartReplies30SRSmartRepliesActionSuggestion_metadata) = (Class)a7;
  v18 = (uint64_t *)((char *)self + OBJC_IVAR____TtC12SmartReplies24SRSmartRepliesSuggestion_title);
  *v18 = v12;
  v18[1] = v14;
  *((_BYTE *)&self->super.super.isa + OBJC_IVAR____TtC12SmartReplies24SRSmartRepliesSuggestion_isDynamicSuggestion) = 1;
  v21.receiver = self;
  v21.super_class = (Class)type metadata accessor for SRSmartRepliesSuggestion();
  v19 = a7;
  return -[SRSmartRepliesSuggestion init](&v21, sel_init);
}

- (_TtC12SmartReplies30SRSmartRepliesActionSuggestion)initWithCoder:(id)a3
{
  return (_TtC12SmartReplies30SRSmartRepliesActionSuggestion *)SRSmartRepliesActionSuggestion.init(coder:)(a3);
}

- (id)copyWithZone:(void *)a3
{
  _TtC12SmartReplies30SRSmartRepliesActionSuggestion *v3;
  void *v4;
  _QWORD v6[4];

  v3 = self;
  SRSmartRepliesActionSuggestion.copy(with:)(v6);

  __swift_project_boxed_opaque_existential_0(v6, v6[3]);
  v4 = (void *)_bridgeAnythingToObjectiveC<A>(_:)();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v6);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC12SmartReplies30SRSmartRepliesActionSuggestion *v5;

  v4 = a3;
  v5 = self;
  SRSmartRepliesActionSuggestion.encode(with:)((NSCoder)v4);

}

- (BOOL)isEqual:(id)a3
{
  _TtC12SmartReplies30SRSmartRepliesActionSuggestion *v4;
  _TtC12SmartReplies30SRSmartRepliesActionSuggestion *v5;
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
  v6 = SRSmartRepliesActionSuggestion.isEqual(_:)((uint64_t)v8);

  outlined destroy of Any?((uint64_t)v8);
  return v6 & 1;
}

- (NSString)attribution
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = *(_QWORD *)&self->super.title[OBJC_IVAR____TtC12SmartReplies30SRSmartRepliesActionSuggestion_attribution];
  if (v2)
  {
    v3 = *(uint64_t *)((char *)&self->super.super.isa
                    + OBJC_IVAR____TtC12SmartReplies30SRSmartRepliesActionSuggestion_attribution);
    swift_bridgeObjectRetain();
    v4 = (void *)MEMORY[0x24957DF1C](v3, v2);
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return (NSString *)v4;
}

- (int64_t)type
{
  return *(int64_t *)((char *)&self->super.super.isa
                           + OBJC_IVAR____TtC12SmartReplies30SRSmartRepliesActionSuggestion_type);
}

- (BOOL)isRichSuggestion
{
  return *((_BYTE *)&self->super.super.isa
         + OBJC_IVAR____TtC12SmartReplies30SRSmartRepliesActionSuggestion_isRichSuggestion);
}

- (_TtC12SmartReplies28SRSmartRepliesActionMetadata)metadata
{
  return (_TtC12SmartReplies28SRSmartRepliesActionMetadata *)*(id *)((char *)&self->super.super.isa + OBJC_IVAR____TtC12SmartReplies30SRSmartRepliesActionSuggestion_metadata);
}

- (_TtC12SmartReplies30SRSmartRepliesActionSuggestion)initWithTitle:(id)a3 isDynamicSuggestion:(BOOL)a4
{
  _TtC12SmartReplies30SRSmartRepliesActionSuggestion *result;

  result = (_TtC12SmartReplies30SRSmartRepliesActionSuggestion *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC12SmartReplies30SRSmartRepliesActionSuggestion_metadata));
}

@end
