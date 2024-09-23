@implementation LibrarySidebarItem

- (BOOL)isEqual:(id)a3
{
  _TtC8VideosUI18LibrarySidebarItem *v4;
  _TtC8VideosUI18LibrarySidebarItem *v5;
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
  sub_1D9AB2C00((uint64_t)v7);

  sub_1D975077C((uint64_t)v7);
  OUTLINED_FUNCTION_6();
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_unknownObjectWeakDestroy();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  OUTLINED_FUNCTION_15_2();
  OUTLINED_FUNCTION_15_2();
  OUTLINED_FUNCTION_15_2();
  swift_bridgeObjectRelease();
}

@end
