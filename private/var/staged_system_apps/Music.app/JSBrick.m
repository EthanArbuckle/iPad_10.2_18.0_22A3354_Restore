@implementation JSBrick

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  v3 = (char *)self + OBJC_IVAR____TtC11MusicJSCore7JSBrick__items;
  v4 = sub_100007E8C(&qword_1011EA3D0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
