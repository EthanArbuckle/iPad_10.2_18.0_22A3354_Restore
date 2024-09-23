@implementation ThemeIDProvider

- (NSString)books_themeID
{
  uint64_t v2;
  uint64_t v3;
  NSString v4;

  sub_100204CF0();
  if (v2)
  {
    v3 = v2;
    v4 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v3);
  }
  else
  {
    v4 = 0;
  }
  return (NSString *)v4;
}

- (_TtC5Books15ThemeIDProvider)init
{
  _TtC5Books15ThemeIDProvider *result;

  result = (_TtC5Books15ThemeIDProvider *)_swift_stdlib_reportUnimplementedInitializer("Books.ThemeIDProvider", 21, "init()", 6, 0);
  __break(1u);
  return result;
}

@end
