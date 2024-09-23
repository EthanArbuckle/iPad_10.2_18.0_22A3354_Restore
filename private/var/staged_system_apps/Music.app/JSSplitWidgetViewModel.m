@implementation JSSplitWidgetViewModel

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  void (*v5)(char *, uint64_t);
  char *v6;
  uint64_t v7;

  v3 = (char *)self + OBJC_IVAR____TtC11MusicJSCore22JSSplitWidgetViewModel__leftViewModelKind;
  v4 = sub_100007E8C(&qword_1011EADA0);
  v5 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR____TtC11MusicJSCore22JSSplitWidgetViewModel__rightViewModelKind, v4);
  v6 = (char *)self + OBJC_IVAR____TtC11MusicJSCore22JSSplitWidgetViewModel__displayStyle;
  v7 = sub_100007E8C(&qword_1011EADB8);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
}

@end
