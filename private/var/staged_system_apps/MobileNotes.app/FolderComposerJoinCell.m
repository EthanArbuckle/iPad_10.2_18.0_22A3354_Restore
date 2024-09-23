@implementation FolderComposerJoinCell

- (_TtC11MobileNotes22FolderComposerJoinCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  char *v7;
  _TtC11MobileNotes22FolderComposerJoinCell *v8;
  _TtC11MobileNotes22FolderComposerJoinCell *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  objc_super v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = (char *)self + OBJC_IVAR____TtC11MobileNotes22FolderComposerJoinCell____lazy_storage___buttonHorizontalMargin;
  *(_QWORD *)v7 = 0;
  v7[8] = 1;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC11MobileNotes22FolderComposerJoinCell____lazy_storage___textView) = 0;
  v14.receiver = self;
  v14.super_class = (Class)type metadata accessor for FolderComposerJoinCell();
  v8 = -[FolderComposerJoinCell initWithFrame:](&v14, "initWithFrame:", x, y, width, height);
  sub_1000163BC(0, (unint64_t *)&qword_1005CFF40, UITraitCollection_ptr);
  v9 = v8;
  v10 = static UITraitCollection.traitsAffectingSizeAndColor.getter();
  v11 = UIView.registerForTraitChanges(_:action:)(v10, "setNeedsUpdateConfiguration");

  swift_unknownObjectRelease(v11, v12);
  swift_bridgeObjectRelease(v10);
  return v9;
}

- (_TtC11MobileNotes22FolderComposerJoinCell)initWithCoder:(id)a3
{
  return (_TtC11MobileNotes22FolderComposerJoinCell *)sub_1001D4AC0(a3);
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC11MobileNotes22FolderComposerJoinCell *v9;
  uint64_t v10;

  v5 = type metadata accessor for UICellConfigurationState(0, a2);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UICellConfigurationState._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  sub_1001D4BC4();

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes22FolderComposerJoinCell____lazy_storage___textView));
}

@end
