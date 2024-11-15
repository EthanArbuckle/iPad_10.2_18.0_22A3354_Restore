@implementation PBFFocusPosterMastheadConfiguration

- (UIColor)keyColor
{
  return (UIColor *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                            + OBJC_IVAR____TtC11PosterBoard35PBFFocusPosterMastheadConfiguration_keyColor));
}

- (NSString)symbolImageName
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_1CBB824A8();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (_TtC11PosterBoard35PBFFocusPosterMastheadConfiguration)initWithKeyColor:(id)a3 symbolImageName:(id)a4
{
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  id v9;
  objc_super v11;

  v6 = sub_1CBB824CC();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11PosterBoard35PBFFocusPosterMastheadConfiguration_keyColor) = (Class)a3;
  v7 = (uint64_t *)((char *)self + OBJC_IVAR____TtC11PosterBoard35PBFFocusPosterMastheadConfiguration_symbolImageName);
  *v7 = v6;
  v7[1] = v8;
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for PBFFocusPosterMastheadConfiguration();
  v9 = a3;
  return -[PBFFocusPosterMastheadConfiguration init](&v11, sel_init);
}

- (BOOL)isEqual:(id)a3
{
  _TtC11PosterBoard35PBFFocusPosterMastheadConfiguration *v4;
  _TtC11PosterBoard35PBFFocusPosterMastheadConfiguration *v5;
  char v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1CBB82958();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = PBFFocusPosterMastheadConfiguration.isEqual(_:)((uint64_t)v8);

  sub_1CBB29B50((uint64_t)v8);
  return v6 & 1;
}

- (_TtC11PosterBoard35PBFFocusPosterMastheadConfiguration)init
{
  _TtC11PosterBoard35PBFFocusPosterMastheadConfiguration *result;

  result = (_TtC11PosterBoard35PBFFocusPosterMastheadConfiguration *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11PosterBoard35PBFFocusPosterMastheadConfiguration_keyColor));
  swift_bridgeObjectRelease();
}

@end
