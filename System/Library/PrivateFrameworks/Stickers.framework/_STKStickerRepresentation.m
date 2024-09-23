@implementation _STKStickerRepresentation

- (NSUUID)identifier
{
  return (NSUUID *)(id)sub_247A1AC50();
}

- (NSUUID)stickerIdentifier
{
  return (NSUUID *)(id)sub_247A1AC50();
}

- (NSData)data
{
  uint64_t v2;
  unint64_t v3;
  void *v4;

  v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____STKStickerRepresentation_data);
  v3 = *(_QWORD *)&self->_anon_0[OBJC_IVAR____STKStickerRepresentation_data];
  sub_2479D9370(v2, v3);
  v4 = (void *)sub_247A1ABB4();
  sub_2479D969C(v2, v3);
  return (NSData *)v4;
}

- (UTType)uti
{
  return (UTType *)(id)sub_247A1ACF8();
}

- (NSString)role
{
  return (NSString *)sub_2479D3FA4();
}

- (CGSize)size
{
  double v2;
  double v3;
  CGSize result;

  v2 = *(double *)((char *)&self->super.isa + OBJC_IVAR____STKStickerRepresentation_size);
  v3 = *(double *)&self->_anon_0[OBJC_IVAR____STKStickerRepresentation_size];
  result.height = v3;
  result.width = v2;
  return result;
}

- (_STKStickerEffect)effect
{
  return (_STKStickerEffect *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                      + OBJC_IVAR____STKStickerRepresentation_effect));
}

+ (_STKStickerRepresentationRole)roles
{
  if (qword_2576D2888 != -1)
    swift_once();
  return (_STKStickerRepresentationRole *)(id)qword_2576D2B48;
}

- (NSString)description
{
  return (NSString *)sub_2479D475C(self, (uint64_t)a2, sub_2479D40E8);
}

- (_STKStickerRepresentation)init
{
  _STKStickerRepresentation *result;

  result = (_STKStickerRepresentation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  void (*v5)(char *, uint64_t);
  char *v6;
  uint64_t v7;

  v3 = (char *)self + OBJC_IVAR____STKStickerRepresentation_identifier;
  v4 = sub_247A1AC8C();
  v5 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR____STKStickerRepresentation_stickerIdentifier, v4);
  sub_2479D969C(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____STKStickerRepresentation_data), *(_QWORD *)&self->_anon_0[OBJC_IVAR____STKStickerRepresentation_data]);
  v6 = (char *)self + OBJC_IVAR____STKStickerRepresentation_uti;
  v7 = sub_247A1AD04();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  swift_bridgeObjectRelease();

}

@end
