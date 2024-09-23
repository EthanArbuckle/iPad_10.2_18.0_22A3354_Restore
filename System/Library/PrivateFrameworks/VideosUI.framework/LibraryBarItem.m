@implementation LibraryBarItem

- (BOOL)isEqual:(id)a3
{
  _TtC8VideosUI14LibraryBarItem *v4;
  _TtC8VideosUI14LibraryBarItem *v5;
  BOOL result;
  _OWORD v7[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1DA144B7C();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v7, 0, sizeof(v7));
    v5 = self;
  }
  sub_1D9E00F20((uint64_t)v7);

  sub_1D975077C((uint64_t)v7);
  OUTLINED_FUNCTION_6();
  return result;
}

- (NSString)description
{
  _TtC8VideosUI14LibraryBarItem *v2;
  void *v3;

  v2 = self;
  sub_1D9E0112C();

  v3 = (void *)sub_1DA143E50();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtC8VideosUI14LibraryBarItem)init
{
  sub_1D9E011A4();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_43_6();
  swift_release();
  OUTLINED_FUNCTION_43_6();
  OUTLINED_FUNCTION_43_6();
  swift_bridgeObjectRelease();
}

@end
