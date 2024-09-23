@implementation SegmentedOptionPickerCell

- (_TtC9SeymourUI25SegmentedOptionPickerCell)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI25SegmentedOptionPickerCell *)sub_22B34CF2C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI25SegmentedOptionPickerCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B34E080();
}

- (void)prepareForReuse
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  objc_class *v6;
  _TtC9SeymourUI25SegmentedOptionPickerCell *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v11;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_255B861D0);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (objc_class *)type metadata accessor for SegmentedOptionPickerCell();
  v11.receiver = self;
  v11.super_class = v6;
  v7 = self;
  -[SegmentedOptionPickerCell prepareForReuse](&v11, sel_prepareForReuse);
  v8 = type metadata accessor for ShelfCellItemInfo();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v5, 1, 1, v8);
  v9 = (uint64_t)v7 + OBJC_IVAR____TtC9SeymourUI25SegmentedOptionPickerCell_itemInfo;
  swift_beginAccess();
  sub_22B16882C((uint64_t)v5, v9);
  swift_endAccess();

}

- (void)layoutSubviews
{
  _TtC9SeymourUI25SegmentedOptionPickerCell *v2;

  v2 = self;
  sub_22B34D47C();

}

- (void)segmentedControlTapped:(id)a3
{
  id v4;
  _TtC9SeymourUI25SegmentedOptionPickerCell *v5;

  v4 = a3;
  v5 = self;
  sub_22B34D668(v4);

}

- (void).cxx_destruct
{
  sub_22B119BC0((uint64_t)self + OBJC_IVAR____TtC9SeymourUI25SegmentedOptionPickerCell_delegate);
  sub_22B168AF8((uint64_t)self + OBJC_IVAR____TtC9SeymourUI25SegmentedOptionPickerCell_itemInfo);
  sub_22B0FAA68(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI25SegmentedOptionPickerCell_onElementAppearance));
  sub_22B0FAA68(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI25SegmentedOptionPickerCell_onElementDisappearance));
  sub_22B0FAA68(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI25SegmentedOptionPickerCell_onImpressionableBoundsChange));
  sub_22B0FAA68(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI25SegmentedOptionPickerCell_onVisibleBoundsChange));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI25SegmentedOptionPickerCell_segmentedControl));
}

@end
