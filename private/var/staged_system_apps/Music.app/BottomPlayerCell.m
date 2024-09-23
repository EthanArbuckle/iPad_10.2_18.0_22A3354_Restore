@implementation BottomPlayerCell

- (_TtC5Music16BottomPlayerCell)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _QWORD *v8;
  _QWORD *v9;
  _TtC5Music16BottomPlayerCell *result;

  v5 = OBJC_IVAR____TtC5Music16BottomPlayerCell_viewController;
  v6 = objc_allocWithZone((Class)type metadata accessor for BottomPlayerViewController());
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, "init");
  *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC5Music16BottomPlayerCell_queue) = 0;
  v8 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC5Music16BottomPlayerCell_handoffToAction);
  *v8 = 0;
  v8[1] = 0;
  v9 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC5Music16BottomPlayerCell_handoffFromAction);
  *v9 = 0;
  v9[1] = 0;

  result = (_TtC5Music16BottomPlayerCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100E2B820, "Music/BottomPlayerCell.swift", 28, 2, 35, 0);
  __break(1u);
  return result;
}

- (_TtC5Music16BottomPlayerCell)initWithFrame:(CGRect)a3
{
  return (_TtC5Music16BottomPlayerCell *)sub_100450438(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music16BottomPlayerCell_viewController));

  sub_10004BA30(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC5Music16BottomPlayerCell_handoffToAction), *(_QWORD *)&self->viewController[OBJC_IVAR____TtC5Music16BottomPlayerCell_handoffToAction]);
  sub_10004BA30(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC5Music16BottomPlayerCell_handoffFromAction), *(_QWORD *)&self->viewController[OBJC_IVAR____TtC5Music16BottomPlayerCell_handoffFromAction]);
}

@end
