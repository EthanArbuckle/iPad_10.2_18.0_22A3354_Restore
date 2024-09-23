@implementation FolderComposerFolderViewController

- (_TtC11MobileNotes34FolderComposerFolderViewController)initWithCoder:(id)a3
{
  _TtC11MobileNotes34FolderComposerFolderViewController *result;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC11MobileNotes34FolderComposerFolderViewController____lazy_storage___folderSelectionDataSource) = 0;

  result = (_TtC11MobileNotes34FolderComposerFolderViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001004796E0, "MobileNotes/FolderComposerFolderSelectionViewController.swift", 61, 2, 27, 0);
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC11MobileNotes34FolderComposerFolderViewController *v2;

  v2 = self;
  sub_1002ADA64();

}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC11MobileNotes34FolderComposerFolderViewController *v12;
  uint64_t v13;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_1002ADFC0();

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (_TtC11MobileNotes34FolderComposerFolderViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC11MobileNotes34FolderComposerFolderViewController *result;

  v4 = a4;
  result = (_TtC11MobileNotes34FolderComposerFolderViewController *)_swift_stdlib_reportUnimplementedInitializer("MobileNotes.FolderComposerFolderViewController", 46, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes34FolderComposerFolderViewController_accountObjectID));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes34FolderComposerFolderViewController_folderSelection));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes34FolderComposerFolderViewController____lazy_storage___folderSelectionDataSource));
}

@end
