@implementation JSBarButtonItem

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  sub_64880((uint64_t)self + OBJC_IVAR____TtC11MusicJSCore15JSBarButtonItem_barButtonItemDelegate);
  v3 = (char *)self + OBJC_IVAR____TtC11MusicJSCore15JSBarButtonItem__title;
  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_14DD040);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC11MusicJSCore15JSBarButtonItem__menu;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1510358);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
}

@end
