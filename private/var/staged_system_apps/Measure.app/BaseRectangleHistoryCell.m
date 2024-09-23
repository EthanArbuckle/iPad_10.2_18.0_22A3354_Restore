@implementation BaseRectangleHistoryCell

- (_TtC7Measure24BaseRectangleHistoryCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t v5;
  uint64_t v6;

  if (a4)
  {
    a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }
  return (_TtC7Measure24BaseRectangleHistoryCell *)sub_1001C130C(a3, (uint64_t)a4, v6);
}

- (_TtC7Measure24BaseRectangleHistoryCell)initWithCoder:(id)a3
{
  return (_TtC7Measure24BaseRectangleHistoryCell *)sub_1001C1558(a3);
}

- (void)prepareForReuse
{
  _TtC7Measure24BaseRectangleHistoryCell *v2;

  v2 = self;
  sub_1001C174C();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Measure24BaseRectangleHistoryCell_sketchView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Measure24BaseRectangleHistoryCell_cellTitle));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Measure24BaseRectangleHistoryCell_lengthLabels));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Measure24BaseRectangleHistoryCell_widthLabels));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Measure24BaseRectangleHistoryCell_accessibleCellTitle));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Measure24BaseRectangleHistoryCell_accessibleLengthLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Measure24BaseRectangleHistoryCell_accessibleWidthLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Measure24BaseRectangleHistoryCell_bottomContentAnchor));
}

@end
