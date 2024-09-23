@implementation BottomPlayerCell

- (_TtC16MusicApplication16BottomPlayerCell)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _QWORD *v8;
  _QWORD *v9;
  _TtC16MusicApplication16BottomPlayerCell *result;

  v5 = OBJC_IVAR____TtC16MusicApplication16BottomPlayerCell_viewController;
  v6 = objc_allocWithZone((Class)type metadata accessor for BottomPlayerViewController());
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, "init");
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication16BottomPlayerCell_queue) = 0;
  v8 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC16MusicApplication16BottomPlayerCell_handoffToAction);
  *v8 = 0;
  v8[1] = 0;
  v9 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC16MusicApplication16BottomPlayerCell_handoffFromAction);
  *v9 = 0;
  v9[1] = 0;

  result = (_TtC16MusicApplication16BottomPlayerCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000000010C4100, "MusicApplication/BottomPlayerCell.swift", 39, 2, 35, 0);
  __break(1u);
  return result;
}

- (_TtC16MusicApplication16BottomPlayerCell)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication16BottomPlayerCell *)sub_320A38(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication16BottomPlayerCell_viewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication16BottomPlayerCell_queue));
  sub_5C198(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication16BottomPlayerCell_handoffToAction), *(_QWORD *)&self->viewController[OBJC_IVAR____TtC16MusicApplication16BottomPlayerCell_handoffToAction]);
  sub_5C198(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication16BottomPlayerCell_handoffFromAction), *(_QWORD *)&self->viewController[OBJC_IVAR____TtC16MusicApplication16BottomPlayerCell_handoffFromAction]);
}

@end
