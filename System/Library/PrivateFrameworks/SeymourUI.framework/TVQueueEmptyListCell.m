@implementation TVQueueEmptyListCell

- (_TtC9SeymourUI20TVQueueEmptyListCell)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI20TVQueueEmptyListCell *)sub_22B566654(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI20TVQueueEmptyListCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B5674DC();
}

- (void).cxx_destruct
{
  sub_22B119BC0((uint64_t)self + OBJC_IVAR____TtC9SeymourUI20TVQueueEmptyListCell_delegate);
  sub_22B168AF8((uint64_t)self + OBJC_IVAR____TtC9SeymourUI20TVQueueEmptyListCell_itemInfo);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI20TVQueueEmptyListCell_primaryLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI20TVQueueEmptyListCell_secondaryLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI20TVQueueEmptyListCell_separator));
}

@end
