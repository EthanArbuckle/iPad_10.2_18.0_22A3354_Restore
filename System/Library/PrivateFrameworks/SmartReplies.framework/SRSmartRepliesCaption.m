@implementation SRSmartRepliesCaption

- (_TtC12SmartReplies21SRSmartRepliesCaption)initWithCaption:(id)a3 type:(int64_t)a4
{
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  objc_super v10;

  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v7 = (uint64_t *)((char *)self + OBJC_IVAR____TtC12SmartReplies21SRSmartRepliesCaption_caption);
  *v7 = v6;
  v7[1] = v8;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12SmartReplies21SRSmartRepliesCaption_type) = (Class)a4;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for SRSmartRepliesCaption();
  return -[SRSmartRepliesCaption init](&v10, sel_init);
}

- (_TtC12SmartReplies21SRSmartRepliesCaption)initWithCoder:(id)a3
{
  return (_TtC12SmartReplies21SRSmartRepliesCaption *)SRSmartRepliesCaption.init(coder:)(a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(void *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  objc_class *v6;
  char *v7;
  char *v8;
  objc_super v10;

  v4 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC12SmartReplies21SRSmartRepliesCaption_caption);
  v3 = *(_QWORD *)&self->caption[OBJC_IVAR____TtC12SmartReplies21SRSmartRepliesCaption_caption];
  v5 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC12SmartReplies21SRSmartRepliesCaption_type);
  v6 = (objc_class *)type metadata accessor for SRSmartRepliesCaption();
  v7 = (char *)objc_allocWithZone(v6);
  v8 = &v7[OBJC_IVAR____TtC12SmartReplies21SRSmartRepliesCaption_caption];
  *(_QWORD *)v8 = v4;
  *((_QWORD *)v8 + 1) = v3;
  *(_QWORD *)&v7[OBJC_IVAR____TtC12SmartReplies21SRSmartRepliesCaption_type] = v5;
  v10.receiver = v7;
  v10.super_class = v6;
  swift_bridgeObjectRetain();
  return -[SRSmartRepliesCaption init](&v10, sel_init);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC12SmartReplies21SRSmartRepliesCaption *v5;

  v4 = a3;
  v5 = self;
  SRSmartRepliesCaption.encode(with:)((NSCoder)v4);

}

- (int64_t)hash
{
  _TtC12SmartReplies21SRSmartRepliesCaption *v3;
  Swift::Int v4;

  Hasher.init()();
  v3 = self;
  swift_bridgeObjectRetain();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  Hasher._combine(_:)(*(Swift::UInt *)((char *)&v3->super.isa
                                     + OBJC_IVAR____TtC12SmartReplies21SRSmartRepliesCaption_type));
  v4 = Hasher.finalize()();

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  _TtC12SmartReplies21SRSmartRepliesCaption *v4;
  _TtC12SmartReplies21SRSmartRepliesCaption *v5;
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
  v6 = SRSmartRepliesCaption.isEqual(_:)((uint64_t)v8);

  outlined destroy of Any?((uint64_t)v8);
  return v6 & 1;
}

- (NSString)caption
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC12SmartReplies21SRSmartRepliesCaption_caption);
  v3 = *(_QWORD *)&self->caption[OBJC_IVAR____TtC12SmartReplies21SRSmartRepliesCaption_caption];
  swift_bridgeObjectRetain();
  v4 = (void *)MEMORY[0x24957DF1C](v2, v3);
  swift_bridgeObjectRelease();
  return (NSString *)v4;
}

- (int64_t)type
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC12SmartReplies21SRSmartRepliesCaption_type);
}

- (_TtC12SmartReplies21SRSmartRepliesCaption)init
{
  _TtC12SmartReplies21SRSmartRepliesCaption *result;

  result = (_TtC12SmartReplies21SRSmartRepliesCaption *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
