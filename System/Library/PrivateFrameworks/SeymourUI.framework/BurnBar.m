@implementation BurnBar

- (_TtC9SeymourUI7BurnBar)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI7BurnBar *)sub_22B2C908C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI7BurnBar)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B2CB258();
}

- (void)layoutSubviews
{
  _TtC9SeymourUI7BurnBar *v2;

  v2 = self;
  sub_22B2C9A54();

}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC9SeymourUI7BurnBar__circleCenterX;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255B8D108);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
