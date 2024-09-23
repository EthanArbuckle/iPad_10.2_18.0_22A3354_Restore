@implementation WFShortcutIconEditorViewController

- (BOOL)showsDoneButton
{
  return sub_220169AA4() & 1;
}

- (void)setShowsDoneButton:(BOOL)a3
{
  sub_220169AD8(a3);
}

- (WFShortcutIconEditorViewControllerDelegate)delegate
{
  ShortcutIconEditorViewController.delegate.getter();
}

- (void)setDelegate:(id)a3
{
  WFShortcutIconEditorViewController *v4;

  swift_unknownObjectRetain();
  v4 = self;
  ShortcutIconEditorViewController.delegate.setter();

}

- (WFShortcutIconEditorViewController)initWithWorkflow:(id)a3
{
  return (WFShortcutIconEditorViewController *)sub_220169D4C((uint64_t)a3);
}

- (WFShortcutIconEditorViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_220169DE8();
}

- (void)viewDidLoad
{
  WFShortcutIconEditorViewController *v2;

  v2 = self;
  ShortcutIconEditorViewController.viewDidLoad()();

}

- (void)viewWillDisappear:(BOOL)a3
{
  self;
  ShortcutIconEditorViewController.viewWillDisappear(_:)(a3);
}

- (WFShortcutIconEditorViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    _sSo32WFShortcutConcerningReportReasona10WorkflowUIE2idSSvg_0();
  v5 = a4;
  ShortcutIconEditorViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{

  sub_2200A0118((uint64_t)self + OBJC_IVAR___WFShortcutIconEditorViewController_delegate);
}

@end
