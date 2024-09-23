@implementation SchedulePickerCell

- (_TtC9SeymourUI18SchedulePickerCell)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI18SchedulePickerCell *)sub_22B6F39D0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI18SchedulePickerCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B6F5F20();
}

- (void)prepareForReuse
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  objc_class *v6;
  _TtC9SeymourUI18SchedulePickerCell *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v11;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_255B861D0);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (objc_class *)type metadata accessor for SchedulePickerCell();
  v11.receiver = self;
  v11.super_class = v6;
  v7 = self;
  -[SchedulePickerCell prepareForReuse](&v11, sel_prepareForReuse);
  v8 = type metadata accessor for ShelfCellItemInfo();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v5, 1, 1, v8);
  v9 = (uint64_t)v7 + OBJC_IVAR____TtC9SeymourUI18SchedulePickerCell_itemInfo;
  swift_beginAccess();
  sub_22B16882C((uint64_t)v5, v9);
  swift_endAccess();

}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height;
  double width;
  _TtC9SeymourUI18SchedulePickerCell *v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v9 = self;
  v10 = -[SchedulePickerCell contentView](v9, sel_contentView);
  *(float *)&v11 = a4;
  *(float *)&v12 = a5;
  objc_msgSend(v10, sel_systemLayoutSizeFittingSize_withHorizontalFittingPriority_verticalFittingPriority_, width, height, v11, v12);
  v14 = v13;
  v16 = v15;

  v17 = v14;
  v18 = v16;
  result.height = v18;
  result.width = v17;
  return result;
}

- (void).cxx_destruct
{
  sub_22B119BC0((uint64_t)self + OBJC_IVAR____TtC9SeymourUI18SchedulePickerCell_delegate);
  sub_22B0FB1DC((uint64_t)self + OBJC_IVAR____TtC9SeymourUI18SchedulePickerCell_itemInfo, &qword_255B861D0);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI18SchedulePickerCell_lengthPickerButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI18SchedulePickerCell_lengthPickerTitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI18SchedulePickerCell_timePickerButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI18SchedulePickerCell_timePickerTitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI18SchedulePickerCell_weekdayPickerView));
}

- (void)timePickerPressed
{
  uint64_t v3;
  __n128 v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _TtC9SeymourUI18SchedulePickerCell *v10;
  uint64_t v11;

  v3 = type metadata accessor for ShelfItemAction();
  v4 = MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x22E2F3FFC]((char *)self + OBJC_IVAR____TtC9SeymourUI18SchedulePickerCell_delegate, v4);
  if (v7)
  {
    v8 = v7;
    v9 = swift_storeEnumTagMultiPayload();
    MEMORY[0x24BDAC7A8](v9);
    *(&v11 - 4) = 0;
    *((_BYTE *)&v11 - 24) = 1;
    *(&v11 - 2) = (uint64_t)v6;
    *(&v11 - 1) = v8;
    v10 = self;
    sub_22B174F8C(v10, sub_22B1688BC, &v11 - 6, v8);
    swift_unknownObjectRelease();
    sub_22B1688C0((uint64_t)v6);

  }
}

@end
