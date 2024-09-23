@implementation STKStickerRepresentation

- (NSUUID)identifier
{
  return (NSUUID *)(id)sub_247A1AC50();
}

- (NSData)data
{
  uint64_t *v2;
  unint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = (uint64_t *)((char *)self + OBJC_IVAR___STKStickerRepresentation_data);
  swift_beginAccess();
  v4 = *v2;
  v3 = v2[1];
  sub_2479D9370(v4, v3);
  v5 = (void *)sub_247A1ABB4();
  sub_2479D969C(v4, v3);
  return (NSData *)v5;
}

- (void)setData:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  STKStickerRepresentation *v8;

  v4 = a3;
  v8 = self;
  v5 = sub_247A1ABCC();
  v7 = v6;

  sub_247A0C260(v5, v7);
}

- (UTType)uti
{
  return (UTType *)(id)sub_247A1ACF8();
}

- (int64_t)byteCount
{
  int64_t *v2;

  v2 = (int64_t *)((char *)self + OBJC_IVAR___STKStickerRepresentation_byteCount);
  swift_beginAccess();
  return *v2;
}

- (void)setByteCount:(int64_t)a3
{
  int64_t *v4;

  v4 = (int64_t *)((char *)self + OBJC_IVAR___STKStickerRepresentation_byteCount);
  swift_beginAccess();
  *v4 = a3;
}

- (CGSize)size
{
  double v2;
  double v3;
  CGSize result;

  v2 = *(double *)((char *)&self->super.isa + OBJC_IVAR___STKStickerRepresentation_size);
  v3 = *(double *)&self->_anon_0[OBJC_IVAR___STKStickerRepresentation_size];
  result.height = v3;
  result.width = v2;
  return result;
}

- (NSString)role
{
  void *v2;

  swift_beginAccess();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_247A1AEC0();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (void)setRole:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;

  v4 = sub_247A1AEE4();
  v6 = v5;
  v7 = (uint64_t *)((char *)self + OBJC_IVAR___STKStickerRepresentation_role);
  swift_beginAccess();
  *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (BOOL)isPreferred
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___STKStickerRepresentation_isPreferred;
  swift_beginAccess();
  return *v2;
}

- (void)setIsPreferred:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___STKStickerRepresentation_isPreferred;
  swift_beginAccess();
  *v4 = a3;
}

- (int64_t)version
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___STKStickerRepresentation_version);
}

- (BOOL)isEqual:(id)a3
{
  STKStickerRepresentation *v4;
  STKStickerRepresentation *v5;
  BOOL v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_247A1B244();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = sub_247A0CA8C((uint64_t)v8);

  sub_2479D045C((uint64_t)v8, &qword_254450C30);
  return v6;
}

- (int64_t)hash
{
  STKStickerRepresentation *v2;
  int64_t v3;

  v2 = self;
  v3 = sub_247A1AC74();

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (STKStickerRepresentation)initWithCoder:(id)a3
{
  return (STKStickerRepresentation *)Sticker.Representation.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  STKStickerRepresentation *v5;

  v4 = a3;
  v5 = self;
  sub_247A0D4F0(v4);

}

- (NSString)description
{
  STKStickerRepresentation *v2;
  void *v3;

  v2 = self;
  sub_247A0D8B8();

  v3 = (void *)sub_247A1AEC0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (STKStickerRepresentation)init
{
  STKStickerRepresentation *result;

  result = (STKStickerRepresentation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  v3 = (char *)self + OBJC_IVAR___STKStickerRepresentation_identifier;
  v4 = sub_247A1AC8C();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_2479D969C(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___STKStickerRepresentation_data), *(_QWORD *)&self->_anon_0[OBJC_IVAR___STKStickerRepresentation_data]);
  v5 = (char *)self + OBJC_IVAR___STKStickerRepresentation_uti;
  v6 = sub_247A1AD04();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  swift_bridgeObjectRelease();
}

@end
