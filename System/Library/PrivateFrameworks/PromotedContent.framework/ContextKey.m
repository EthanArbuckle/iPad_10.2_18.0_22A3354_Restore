@implementation ContextKey

- (BOOL)isEqual:(id)a3
{
  _TtC15PromotedContent10ContextKey *v4;
  _TtC15PromotedContent10ContextKey *v5;
  BOOL v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1B1289B48();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = sub_1B11ECD8C((uint64_t)v8);

  sub_1B11ECD4C((uint64_t)v8);
  return v6;
}

- (int64_t)hash
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC15PromotedContent10ContextKey_key);
}

- (_TtC15PromotedContent10ContextKey)init
{
  _TtC15PromotedContent10ContextKey *result;

  result = (_TtC15PromotedContent10ContextKey *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
