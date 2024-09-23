@implementation SmartShortcutPickerBaseViewController

- (_TtC10WorkflowUI37SmartShortcutPickerBaseViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  SmartShortcutPickerBaseViewController.init(coder:)();
}

- (void)dealloc
{
  _TtC10WorkflowUI37SmartShortcutPickerBaseViewController *v2;

  v2 = self;
  SmartShortcutPickerBaseViewController.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_release();
  sub_2201118B4(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC10WorkflowUI37SmartShortcutPickerBaseViewController_style), *(_QWORD *)((char *)&self->super.super._responderFlags+ OBJC_IVAR____TtC10WorkflowUI37SmartShortcutPickerBaseViewController_style), *(uint64_t *)((char *)&self->super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC10WorkflowUI37SmartShortcutPickerBaseViewController_style), *(uint64_t *)((char *)&self->super._overrideTransitioningDelegate+ OBJC_IVAR____TtC10WorkflowUI37SmartShortcutPickerBaseViewController_style), *(uint64_t *)((char *)&self->super._view + OBJC_IVAR____TtC10WorkflowUI37SmartShortcutPickerBaseViewController_style), *(uint64_t *)((char *)&self->super._tabBarItem+ OBJC_IVAR____TtC10WorkflowUI37SmartShortcutPickerBaseViewController_style), *(uint64_t *)((char *)&self->super._tab + OBJC_IVAR____TtC10WorkflowUI37SmartShortcutPickerBaseViewController_style), *(uint64_t *)((char *)&self->super._tabElement+ OBJC_IVAR____TtC10WorkflowUI37SmartShortcutPickerBaseViewController_style), *(uint64_t *)((char *)&self->super._navigationItem+ OBJC_IVAR____TtC10WorkflowUI37SmartShortcutPickerBaseViewController_style), *(uint64_t *)((char *)&self->super._toolbarItems+ OBJC_IVAR____TtC10WorkflowUI37SmartShortcutPickerBaseViewController_style), *(uint64_t *)((char *)&self->super._title + OBJC_IVAR____TtC10WorkflowUI37SmartShortcutPickerBaseViewController_style),
    *((_BYTE *)&self->super._nibName + OBJC_IVAR____TtC10WorkflowUI37SmartShortcutPickerBaseViewController_style));
  OUTLINED_FUNCTION_44_4();
  OUTLINED_FUNCTION_44_4();
  OUTLINED_FUNCTION_44_4();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10WorkflowUI37SmartShortcutPickerBaseViewController_collectionView));
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;

  v4 = sub_220304758();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v8 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22030471C();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)viewDidLayoutSubviews
{
  _TtC10WorkflowUI37SmartShortcutPickerBaseViewController *v2;

  v2 = self;
  sub_220120AB4();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC10WorkflowUI37SmartShortcutPickerBaseViewController *v6;

  v5 = a3;
  v6 = self;
  sub_220120C54(a3);

}

- (int64_t)preferredUserInterfaceStyle
{
  return sub_220123750();
}

- (_TtC10WorkflowUI37SmartShortcutPickerBaseViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    _sSo32WFShortcutConcerningReportReasona10WorkflowUIE2idSSvg_0();
  v5 = a4;
  SmartShortcutPickerBaseViewController.init(nibName:bundle:)();
}

@end
