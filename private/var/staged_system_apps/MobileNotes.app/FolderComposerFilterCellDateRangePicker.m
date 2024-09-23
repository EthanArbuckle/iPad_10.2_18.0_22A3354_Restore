@implementation FolderComposerFilterCellDateRangePicker

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC11MobileNotes39FolderComposerFilterCellDateRangePicker *v9;
  uint64_t v10;

  v5 = type metadata accessor for UICellConfigurationState(0, a2);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UICellConfigurationState._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  sub_100334A6C();

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (_TtC11MobileNotes39FolderComposerFilterCellDateRangePicker)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  char *v8;
  char *v9;
  _QWORD *v10;
  objc_class *v11;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (char *)self + OBJC_IVAR____TtC11MobileNotes39FolderComposerFilterCellDateRangePicker_amount;
  *(_QWORD *)v8 = 0;
  v8[8] = 1;
  v9 = (char *)self + OBJC_IVAR____TtC11MobileNotes39FolderComposerFilterCellDateRangePicker_rangeType;
  *(_QWORD *)v9 = 0;
  v9[8] = 1;
  v10 = (Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC11MobileNotes39FolderComposerFilterCellDateRangePicker_rangeSelectionChanged);
  v11 = (objc_class *)type metadata accessor for FolderComposerFilterCellDateRangePicker();
  *v10 = 0;
  v10[1] = 0;
  v13.receiver = self;
  v13.super_class = v11;
  return -[FolderComposerFilterCellDateRangePicker initWithFrame:](&v13, "initWithFrame:", x, y, width, height);
}

- (_TtC11MobileNotes39FolderComposerFilterCellDateRangePicker)initWithCoder:(id)a3
{
  char *v5;
  char *v6;
  _QWORD *v7;
  objc_class *v8;
  objc_super v10;

  v5 = (char *)self + OBJC_IVAR____TtC11MobileNotes39FolderComposerFilterCellDateRangePicker_amount;
  *(_QWORD *)v5 = 0;
  v5[8] = 1;
  v6 = (char *)self + OBJC_IVAR____TtC11MobileNotes39FolderComposerFilterCellDateRangePicker_rangeType;
  *(_QWORD *)v6 = 0;
  v6[8] = 1;
  v7 = (Class *)((char *)&self->super.super.super.super.super.super.isa
               + OBJC_IVAR____TtC11MobileNotes39FolderComposerFilterCellDateRangePicker_rangeSelectionChanged);
  v8 = (objc_class *)type metadata accessor for FolderComposerFilterCellDateRangePicker();
  *v7 = 0;
  v7[1] = 0;
  v10.receiver = self;
  v10.super_class = v8;
  return -[FolderComposerFilterCellDateRangePicker initWithCoder:](&v10, "initWithCoder:", a3);
}

- (void).cxx_destruct
{
  sub_100012C50(*(uint64_t *)((char *)&self->super.super.super.super.super.super.isa+ OBJC_IVAR____TtC11MobileNotes39FolderComposerFilterCellDateRangePicker_rangeSelectionChanged), *(_QWORD *)&self->amount[OBJC_IVAR____TtC11MobileNotes39FolderComposerFilterCellDateRangePicker_rangeSelectionChanged]);
}

@end
