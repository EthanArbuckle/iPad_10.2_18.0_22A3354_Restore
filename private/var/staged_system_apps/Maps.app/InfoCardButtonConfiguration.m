@implementation InfoCardButtonConfiguration

- (unint64_t)type
{
  return *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps27InfoCardButtonConfiguration_type);
}

- (BOOL)shouldBlur
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC4Maps27InfoCardButtonConfiguration_shouldBlur);
}

- (UIColor)tintColor
{
  return (UIColor *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                            + OBJC_IVAR____TtC4Maps27InfoCardButtonConfiguration_tintColor));
}

- (int64_t)visibility
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps27InfoCardButtonConfiguration_visibility);
}

- (_TtC4Maps27InfoCardButtonConfiguration)initWithType:(unint64_t)a3 shouldBlur:(BOOL)a4 tintColor:(id)a5 visibility:(int64_t)a6
{
  objc_class *ObjectType;
  id v12;
  objc_super v14;

  ObjectType = (objc_class *)swift_getObjectType(self);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps27InfoCardButtonConfiguration_type) = (Class)a3;
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC4Maps27InfoCardButtonConfiguration_shouldBlur) = a4;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps27InfoCardButtonConfiguration_tintColor) = (Class)a5;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps27InfoCardButtonConfiguration_visibility) = (Class)a6;
  v14.receiver = self;
  v14.super_class = ObjectType;
  v12 = a5;
  return -[InfoCardButtonConfiguration init](&v14, "init");
}

- (BOOL)isEqual:(id)a3
{
  _TtC4Maps27InfoCardButtonConfiguration *v5;
  _TtC4Maps27InfoCardButtonConfiguration *v6;
  char v7;
  _OWORD v9[2];

  if (a3)
  {
    v5 = self;
    swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v9);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v9, 0, sizeof(v9));
    v6 = self;
  }
  v7 = InfoCardButtonConfiguration.isEqual(_:)((uint64_t)v9);

  sub_10000C180((uint64_t)v9);
  return v7 & 1;
}

- (_TtC4Maps27InfoCardButtonConfiguration)init
{
  _TtC4Maps27InfoCardButtonConfiguration *result;

  result = (_TtC4Maps27InfoCardButtonConfiguration *)_swift_stdlib_reportUnimplementedInitializer("Maps.InfoCardButtonConfiguration", 32, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
