@implementation SortButton

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  id v8;
  id v9;
  _TtC9SeymourUI10SortButton *v10;

  v8 = a3;
  v9 = a4;
  swift_unknownObjectRetain();
  v10 = self;
  sub_22B39D860((uint64_t)v8, (uint64_t)v9, (uint64_t)a5);

  swift_unknownObjectRelease();
}

- (_TtC9SeymourUI10SortButton)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  *(_QWORD *)((char *)&self->super.super.super.super._responderFlags + OBJC_IVAR____TtC9SeymourUI10SortButton_delegate) = 0;
  swift_unknownObjectWeakInit();
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for SortButton();
  return -[SortButton initWithFrame:](&v9, sel_initWithFrame_, x, y, width, height);
}

- (_TtC9SeymourUI10SortButton)initWithCoder:(id)a3
{
  objc_super v6;

  *(_QWORD *)((char *)&self->super.super.super.super._responderFlags + OBJC_IVAR____TtC9SeymourUI10SortButton_delegate) = 0;
  swift_unknownObjectWeakInit();
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for SortButton();
  return -[SortButton initWithCoder:](&v6, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  sub_22B119BC0((uint64_t)self + OBJC_IVAR____TtC9SeymourUI10SortButton_delegate);
}

@end
