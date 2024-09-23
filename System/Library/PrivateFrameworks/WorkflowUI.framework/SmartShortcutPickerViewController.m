@implementation SmartShortcutPickerViewController

- (_TtC10WorkflowUI33SmartShortcutPickerViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  SmartShortcutPickerViewController.init(coder:)();
}

- (void)dealloc
{
  _TtC10WorkflowUI33SmartShortcutPickerViewController *v2;

  v2 = self;
  SmartShortcutPickerViewController.__deallocating_deinit();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10WorkflowUI33SmartShortcutPickerViewController_progressiveView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10WorkflowUI33SmartShortcutPickerViewController_searchBar));
}

- (void)viewDidLoad
{
  _TtC10WorkflowUI33SmartShortcutPickerViewController *v2;

  v2 = self;
  sub_220219D94();

}

- (void)viewIsAppearing:(BOOL)a3
{
  _TtC10WorkflowUI33SmartShortcutPickerViewController *v3;

  v3 = self;
  sub_22021A468();

}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC10WorkflowUI33SmartShortcutPickerViewController *v3;

  v3 = self;
  sub_22021A4E0();

}

- (void)viewDidLayoutSubviews
{
  _TtC10WorkflowUI33SmartShortcutPickerViewController *v2;

  v2 = self;
  sub_22021A584();

}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC10WorkflowUI33SmartShortcutPickerViewController *v11;
  uint64_t v12;

  v6 = sub_220304758();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22030471C();
  v10 = a3;
  v11 = self;
  sub_22021A81C(v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)keyboardWillShow:(id)a3
{
  id v4;
  _TtC10WorkflowUI33SmartShortcutPickerViewController *v5;

  v4 = a3;
  v5 = self;
  sub_22021B9F0(v4);

}

- (void)keyboardWillHide:(id)a3
{
  id v4;
  _TtC10WorkflowUI33SmartShortcutPickerViewController *v5;

  v4 = a3;
  v5 = self;
  sub_22021BB20();

}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  _TtC10WorkflowUI33SmartShortcutPickerViewController *v10;
  Swift::String v11;

  v6 = _sSo32WFShortcutConcerningReportReasona10WorkflowUIE2idSSvg_0();
  v8 = v7;
  v9 = a3;
  v10 = self;
  v11._countAndFlagsBits = v6;
  v11._object = v8;
  SmartShortcutPickerViewController.searchBar(_:textDidChange:)((WFSearchBar *)v10, v11);

  swift_bridgeObjectRelease();
}

@end
