@implementation ICFolderComposerViewController

- (ICFolderComposerViewController)initWithAccount:(id)a3 folderTitle:(id)a4 smartFolderQuery:(id)a5 completion:(id)a6
{
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;

  v9 = _Block_copy(a6);
  if (a4)
  {
    a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v11 = v10;
  }
  else
  {
    v11 = 0;
  }
  v12 = swift_allocObject(&unk_1005641A0, 24, 7);
  *(_QWORD *)(v12 + 16) = v9;
  v13 = a3;
  v14 = a5;
  return (ICFolderComposerViewController *)sub_10028B6C0(v13, (uint64_t)a4, v11, a5, (uint64_t)sub_10028D1B0, v12);
}

- (ICFolderComposerViewController)initWithCoder:(id)a3
{
  sub_10028C008(a3);
}

- (void)viewDidLoad
{
  ICFolderComposerViewController *v2;

  v2 = self;
  sub_10028C0F8();

}

- (void)doneActionWithSender:(id)a3
{
  id v4;
  ICFolderComposerViewController *v5;

  v4 = a3;
  v5 = self;
  sub_10028CDF4();

}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  ICFolderComposerViewController *v12;
  id v13;
  uint64_t v15;
  uint64_t v16;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  v13 = sub_10012B880();
  dispatch thunk of UICollectionViewDiffableDataSource.itemIdentifier(for:)(&v16);

  LOBYTE(v13) = v16;
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v13 & 1;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  ICFolderComposerViewController *v12;
  uint64_t v13;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_10028CED4();

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  id v14;
  ICFolderComposerViewController *v15;
  uint64_t v16;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v13 = a3;
  v14 = a4;
  v15 = self;
  sub_10028CFFC(v14);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (ICFolderComposerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  ICFolderComposerViewController *result;

  v4 = a4;
  result = (ICFolderComposerViewController *)_swift_stdlib_reportUnimplementedInitializer("MobileNotes.FolderComposerViewController", 40, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___ICFolderComposerViewController_smartFolderQuery));
  swift_release(*(_QWORD *)&self->super.initialFilterSelection[OBJC_IVAR___ICFolderComposerViewController_completion]);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___ICFolderComposerViewController_collectionView));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR___ICFolderComposerViewController_folderComposerDataSource));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___ICFolderComposerViewController_filterViewController));
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  ICFolderComposerViewController *v4;
  ICFolderComposerViewController *v5;
  ICFolderComposerViewController *v6;
  ICFolderComposerViewController *v7;

  v4 = (ICFolderComposerViewController *)a3;
  v7 = self;
  v5 = (ICFolderComposerViewController *)sub_10012B48C();
  if (v5)
  {
    v6 = v5;
    -[ICFolderComposerViewController endEditing:](v5, "endEditing:", 0);

    v4 = v7;
    v7 = v6;
  }

}

@end
