@implementation JSComponentController

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  void (*v9)(char *, uint64_t);
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;

  v3 = (char *)self + OBJC_IVAR____TtC11MusicJSCore21JSComponentController__headerItem;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1514288);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

  v5 = (char *)self + OBJC_IVAR____TtC11MusicJSCore21JSComponentController__viewModelKind;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1512FD0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  v7 = (char *)self + OBJC_IVAR____TtC11MusicJSCore21JSComponentController__pageIdentifier;
  v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_14DD040);
  v9 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v8 - 8) + 8);
  v9(v7, v8);
  v9((char *)self + OBJC_IVAR____TtC11MusicJSCore21JSComponentController__pageType, v8);
  v10 = (char *)self + OBJC_IVAR____TtC11MusicJSCore21JSComponentController__pageURL;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1511A58);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(v10, v11);
  v12 = (char *)self + OBJC_IVAR____TtC11MusicJSCore21JSComponentController__pageDetails;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1514228);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v13 - 8) + 8))(v12, v13);
  sub_64880((uint64_t)self + OBJC_IVAR____TtC11MusicJSCore21JSComponentController_delegate);
  swift_release();
  sub_56024((uint64_t)self + OBJC_IVAR____TtC11MusicJSCore21JSComponentController____lazy_storage___signpost, (uint64_t *)&unk_14B1190);
}

@end
