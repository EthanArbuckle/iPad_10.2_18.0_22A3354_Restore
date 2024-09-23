@implementation TabBarItemsInfo

- (_TtC8VideosUI15TabBarItemsInfo)init
{
  _TtC8VideosUI15TabBarItemsInfo *result;

  sub_1D9DE27BC();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC8VideosUI15TabBarItemsInfo__selectedIndex;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F021D530);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_1D97B50A8(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8VideosUI15TabBarItemsInfo_selectedIndexDidChange));
  swift_bridgeObjectRelease();
  swift_unknownObjectWeakDestroy();
  swift_release();
  swift_release();
  sub_1D97B50A8(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8VideosUI15TabBarItemsInfo_debugUIGestureHandler));
}

@end
