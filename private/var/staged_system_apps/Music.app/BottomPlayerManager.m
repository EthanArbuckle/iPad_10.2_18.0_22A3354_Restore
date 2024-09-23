@implementation BottomPlayerManager

- (_TtC5Music19BottomPlayerManager)init
{
  return (_TtC5Music19BottomPlayerManager *)sub_1008A1744();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  v3 = (char *)self + OBJC_IVAR____TtC5Music19BottomPlayerManager__queues;
  v4 = sub_100007E8C((uint64_t *)&unk_1011CE7D0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
}

- (void)routingControllerAvailableRoutesDidChange:(id)a3
{
  id v4;
  _TtC5Music19BottomPlayerManager *v5;

  v4 = a3;
  v5 = self;
  sub_1008A463C(v4);

}

@end
