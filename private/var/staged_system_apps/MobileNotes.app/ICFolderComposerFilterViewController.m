@implementation ICFolderComposerFilterViewController

- (ICFolderComposerFilterViewController)initWithAccount:(id)a3
{
  return (ICFolderComposerFilterViewController *)sub_1002270D8((uint64_t)a3);
}

- (ICFolderComposerFilterViewController)initWithCoder:(id)a3
{
  sub_1002271A4(a3);
}

- (void)viewDidLoad
{
  ICFolderComposerFilterViewController *v2;

  v2 = self;
  sub_100227270();

}

- (void)viewWillAppear:(BOOL)a3
{
  ICFolderComposerFilterViewController *v4;

  v4 = self;
  sub_100227718(a3);

}

- (void)doneActionWithSender:(id)a3
{
  id v4;
  ICFolderComposerFilterViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1002288A4();

}

- (void)splitViewWillTransitionToSizeWithNotification:(id)a3
{
  id v4;
  ICFolderComposerFilterViewController *v5;

  v4 = a3;
  v5 = self;
  sub_10022840C(v4);

}

- (ICFolderComposerFilterViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  ICFolderComposerFilterViewController *result;

  v4 = a4;
  result = (ICFolderComposerFilterViewController *)_swift_stdlib_reportUnimplementedInitializer("MobileNotes.FolderComposerFilterViewController", 46, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100012C50(*(uint64_t *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___ICFolderComposerFilterViewController_completion), *(_QWORD *)&self->super.initialFilterSelection[OBJC_IVAR___ICFolderComposerFilterViewController_completion]);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___ICFolderComposerFilterViewController_account));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___ICFolderComposerFilterViewController_filterSelectionObservation));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___ICFolderComposerFilterViewController____lazy_storage___folderComposerFilterDataSource));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___ICFolderComposerFilterViewController____lazy_storage___collectionView));
}

@end
