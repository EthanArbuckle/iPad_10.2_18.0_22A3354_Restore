@implementation AddToHomeScreenCollectionViewController

- (_TtC10WorkflowUI39AddToHomeScreenCollectionViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_220107F34();
}

- (void)dealloc
{
  _TtC10WorkflowUI39AddToHomeScreenCollectionViewController *v2;

  v2 = self;
  AddToHomeScreenCollectionViewController.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_release();
  OUTLINED_FUNCTION_44_4();
  sub_22010AD30(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC10WorkflowUI39AddToHomeScreenCollectionViewController____lazy_storage___characterBinding), *(_QWORD *)((char *)&self->super.super.super._responderFlags+ OBJC_IVAR____TtC10WorkflowUI39AddToHomeScreenCollectionViewController____lazy_storage___characterBinding));
  sub_2200888B0((uint64_t)self+ OBJC_IVAR____TtC10WorkflowUI39AddToHomeScreenCollectionViewController____lazy_storage___colorSchemeBinding, &qword_2555A8858);
  OUTLINED_FUNCTION_44_4();
  OUTLINED_FUNCTION_44_4();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10WorkflowUI39AddToHomeScreenCollectionViewController_dataSource));
  swift_unknownObjectWeakDestroy();
  swift_release();
}

- (_TtC10WorkflowUI39AddToHomeScreenCollectionViewController)initWithCollectionViewLayout:(id)a3
{
  id v3;

  v3 = a3;
  AddToHomeScreenCollectionViewController.init(collectionViewLayout:)();
}

- (_TtC10WorkflowUI39AddToHomeScreenCollectionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    _sSo32WFShortcutConcerningReportReasona10WorkflowUIE2idSSvg_0();
  v5 = a4;
  AddToHomeScreenCollectionViewController.init(nibName:bundle:)();
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC10WorkflowUI39AddToHomeScreenCollectionViewController *v11;
  uint64_t v12;

  v6 = sub_220304758();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22030471C();
  v10 = a3;
  v11 = self;
  AddToHomeScreenCollectionViewController.collectionView(_:didSelectItemAt:)();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  id v13;
  _TtC10WorkflowUI39AddToHomeScreenCollectionViewController *v14;
  uint64_t v15;

  v8 = sub_220304758();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22030471C();
  v12 = a3;
  v13 = a4;
  v14 = self;
  AddToHomeScreenCollectionViewController.collectionView(_:willDisplay:forItemAt:)((int)v14, v13);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)scrollViewDidScroll:(id)a3
{
  UIScrollView *v4;
  _TtC10WorkflowUI39AddToHomeScreenCollectionViewController *v5;

  v4 = (UIScrollView *)a3;
  v5 = self;
  AddToHomeScreenCollectionViewController.scrollViewDidScroll(_:)(v4);

}

@end
