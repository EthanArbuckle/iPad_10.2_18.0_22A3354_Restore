@implementation FolderComposerFilterCellTagsExpandCollapse

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC11MobileNotes42FolderComposerFilterCellTagsExpandCollapse *v9;
  uint64_t v10;

  v5 = type metadata accessor for UICellConfigurationState(0, a2);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UICellConfigurationState._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  sub_1001F78A4((uint64_t)v8);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (_TtC11MobileNotes42FolderComposerFilterCellTagsExpandCollapse)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC11MobileNotes42FolderComposerFilterCellTagsExpandCollapse_hiddenTagCount) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for FolderComposerFilterCellTagsExpandCollapse();
  return -[FolderComposerFilterCellTagsExpandCollapse initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC11MobileNotes42FolderComposerFilterCellTagsExpandCollapse)initWithCoder:(id)a3
{
  objc_super v5;

  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC11MobileNotes42FolderComposerFilterCellTagsExpandCollapse_hiddenTagCount) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FolderComposerFilterCellTagsExpandCollapse();
  return -[FolderComposerFilterCellTagsExpandCollapse initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
