@implementation JSFlowcase

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR____TtC11MusicJSCore10JSFlowcase__items;
  v3 = sub_100007E8C(&qword_1011EB120);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

@end
