@implementation MoveToFolderViewController

- (_TtC10WorkflowUI26MoveToFolderViewController)initWithDatabase:(id)a3 shortcutsToMove:(id)a4
{
  uint64_t v5;
  _TtC10WorkflowUI26MoveToFolderViewController *result;

  sub_220083D98(0, &qword_2540A2EF0);
  v5 = sub_220307164();
  MoveToFolderViewController.init(database:shortcutsToMove:)(a3, v5);
  return result;
}

- (_TtC10WorkflowUI26MoveToFolderViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_220125764();
}

- (void)viewDidLoad
{
  _TtC10WorkflowUI26MoveToFolderViewController *v2;

  v2 = self;
  sub_220125828();

}

- (void)cancel
{
  self;
  sub_220125920();
}

- (_TtC10WorkflowUI26MoveToFolderViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    _sSo32WFShortcutConcerningReportReasona10WorkflowUIE2idSSvg_0();
  v5 = a4;
  MoveToFolderViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  sub_2200A0118((uint64_t)self + OBJC_IVAR____TtC10WorkflowUI26MoveToFolderViewController_delegate);
  OUTLINED_FUNCTION_41_7();
  OUTLINED_FUNCTION_41_7();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_41_7();
  OUTLINED_FUNCTION_202_0(OBJC_IVAR____TtC10WorkflowUI26MoveToFolderViewController____lazy_storage___layout);
  OUTLINED_FUNCTION_202_0(OBJC_IVAR____TtC10WorkflowUI26MoveToFolderViewController____lazy_storage___collectionView);
  OUTLINED_FUNCTION_202_0(OBJC_IVAR____TtC10WorkflowUI26MoveToFolderViewController____lazy_storage___dataSource);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10WorkflowUI26MoveToFolderViewController_iconImage));
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC10WorkflowUI26MoveToFolderViewController *v11;
  uint64_t v12;

  v6 = sub_220304758();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22030471C();
  v10 = a3;
  v11 = self;
  MoveToFolderViewController.collectionView(_:didSelectItemAt:)();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

@end
