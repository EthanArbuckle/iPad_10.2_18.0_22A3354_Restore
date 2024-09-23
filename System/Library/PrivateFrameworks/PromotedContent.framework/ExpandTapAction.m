@implementation ExpandTapAction

- (_TtC15PromotedContent15ExpandTapAction)initWithActionType:(int64_t)a3 confirmedClickInterval:(double)a4
{
  _TtC15PromotedContent15ExpandTapAction *result;

  result = (_TtC15PromotedContent15ExpandTapAction *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC15PromotedContent15ExpandTapAction_expandedDestinationURL;
  v4 = sub_1B1289584();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_1B121CA90((uint64_t)self + OBJC_IVAR____TtC15PromotedContent15ExpandTapAction_delegate);
}

@end
