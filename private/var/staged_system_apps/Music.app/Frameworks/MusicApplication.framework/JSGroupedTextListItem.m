@implementation JSGroupedTextListItem

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC11MusicJSCore21JSGroupedTextListItem__items;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1512798);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
