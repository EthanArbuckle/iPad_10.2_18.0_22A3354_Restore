@implementation _STKStickerUIStickerRepresentation

- (NSData)data
{
  uint64_t v2;
  unint64_t v3;
  void *v4;

  v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____STKStickerUIStickerRepresentation_data);
  v3 = *(_QWORD *)&self->data[OBJC_IVAR____STKStickerUIStickerRepresentation_data];
  sub_2479D9370(v2, v3);
  v4 = (void *)sub_247A1ABB4();
  sub_2479D969C(v2, v3);
  return (NSData *)v4;
}

- (NSString)type
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_247A1AEC0();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (CGSize)size
{
  double v2;
  double v3;
  CGSize result;

  v2 = *(double *)((char *)&self->super.isa + OBJC_IVAR____STKStickerUIStickerRepresentation_size);
  v3 = *(double *)&self->data[OBJC_IVAR____STKStickerUIStickerRepresentation_size];
  result.height = v3;
  result.width = v2;
  return result;
}

- (NSString)role
{
  return (NSString *)sub_2479D35C8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____STKStickerUIStickerRepresentation_role);
}

- (_STKStickerUIStickerRepresentation)initWithData:(id)a3 type:(id)a4 size:(CGSize)a5 role:(id)a6
{
  CGFloat height;
  CGFloat width;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t *v25;
  CGFloat *v26;
  objc_super v28;

  height = a5.height;
  width = a5.width;
  v11 = a3;
  v12 = a4;
  v13 = a6;
  v14 = sub_247A1ABCC();
  v16 = v15;

  v17 = sub_247A1AEE4();
  v19 = v18;

  if (v13)
  {
    v20 = sub_247A1AEE4();
    v22 = v21;

  }
  else
  {
    v20 = 0;
    v22 = 0;
  }
  v23 = (uint64_t *)((char *)self + OBJC_IVAR____STKStickerUIStickerRepresentation_data);
  *v23 = v14;
  v23[1] = v16;
  v24 = (uint64_t *)((char *)self + OBJC_IVAR____STKStickerUIStickerRepresentation_type);
  *v24 = v17;
  v24[1] = v19;
  v25 = (uint64_t *)((char *)self + OBJC_IVAR____STKStickerUIStickerRepresentation_role);
  *v25 = v20;
  v25[1] = v22;
  v26 = (CGFloat *)((char *)self + OBJC_IVAR____STKStickerUIStickerRepresentation_size);
  *v26 = width;
  v26[1] = height;
  v28.receiver = self;
  v28.super_class = (Class)type metadata accessor for _STKStickerUIStickerRepresentation();
  return -[_STKStickerUIStickerRepresentation init](&v28, sel_init);
}

- (NSString)description
{
  return (NSString *)sub_2479D475C(self, (uint64_t)a2, sub_2479ED1B0);
}

- (_STKStickerUIStickerRepresentation)init
{
  _STKStickerUIStickerRepresentation *result;

  result = (_STKStickerUIStickerRepresentation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_2479D969C(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____STKStickerUIStickerRepresentation_data), *(_QWORD *)&self->data[OBJC_IVAR____STKStickerUIStickerRepresentation_data]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
