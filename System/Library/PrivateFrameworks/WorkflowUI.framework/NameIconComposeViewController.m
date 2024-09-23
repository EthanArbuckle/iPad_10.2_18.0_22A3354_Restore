@implementation NameIconComposeViewController

- (_TtC10WorkflowUI29NameIconComposeViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_2202098E0();
}

- (void)viewDidLoad
{
  _TtC10WorkflowUI29NameIconComposeViewController *v2;

  v2 = self;
  sub_220209A50();

}

- (void)updateIsModalInPresentation
{
  _TtC10WorkflowUI29NameIconComposeViewController *v2;

  v2 = self;
  sub_220209F88();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC10WorkflowUI29NameIconComposeViewController *v4;

  v4 = self;
  sub_22020A024(a3);

}

- (void)keyboardWillChange:(id)a3
{
  id v4;
  _TtC10WorkflowUI29NameIconComposeViewController *v5;

  v4 = a3;
  v5 = self;
  sub_22020A0F4();

}

- (void)cancel
{
  _TtC10WorkflowUI29NameIconComposeViewController *v2;

  v2 = self;
  sub_22020ABA4();

}

- (void)done
{
  _TtC10WorkflowUI29NameIconComposeViewController *v2;

  v2 = self;
  sub_22020AC48();

}

- (void)presentationControllerDidAttemptToDismiss:(id)a3
{
  id v4;
  _TtC10WorkflowUI29NameIconComposeViewController *v5;

  v4 = a3;
  v5 = self;
  sub_22020ADAC();

}

- (_TtC10WorkflowUI29NameIconComposeViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    _sSo32WFShortcutConcerningReportReasona10WorkflowUIE2idSSvg_0();
  v5 = a4;
  NameIconComposeViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  sub_22020B630(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC10WorkflowUI29NameIconComposeViewController_mode), *((_BYTE *)&self->super.super._responderFlags + OBJC_IVAR____TtC10WorkflowUI29NameIconComposeViewController_mode));
  sub_2200A0118((uint64_t)self + OBJC_IVAR____TtC10WorkflowUI29NameIconComposeViewController_delegate);
  OUTLINED_FUNCTION_202_0(OBJC_IVAR____TtC10WorkflowUI29NameIconComposeViewController____lazy_storage___scrollViewBottomConstraint);
  OUTLINED_FUNCTION_202_0(OBJC_IVAR____TtC10WorkflowUI29NameIconComposeViewController____lazy_storage___glyphPickerHeightConstraint);
  OUTLINED_FUNCTION_202_0(OBJC_IVAR____TtC10WorkflowUI29NameIconComposeViewController____lazy_storage___contentViewScrollViewEqualHeightConstraint);
  OUTLINED_FUNCTION_202_0(OBJC_IVAR____TtC10WorkflowUI29NameIconComposeViewController____lazy_storage___contentViewViewEqualHeightConstraint);
  OUTLINED_FUNCTION_202_0(OBJC_IVAR____TtC10WorkflowUI29NameIconComposeViewController____lazy_storage___scrollView);
  OUTLINED_FUNCTION_202_0(OBJC_IVAR____TtC10WorkflowUI29NameIconComposeViewController____lazy_storage___contentView);
  OUTLINED_FUNCTION_202_0(OBJC_IVAR____TtC10WorkflowUI29NameIconComposeViewController____lazy_storage___iconTextFieldOuterContainer);
  OUTLINED_FUNCTION_202_0(OBJC_IVAR____TtC10WorkflowUI29NameIconComposeViewController____lazy_storage___iconTextFieldInnerContainer);
  OUTLINED_FUNCTION_202_0(OBJC_IVAR____TtC10WorkflowUI29NameIconComposeViewController____lazy_storage___iconView);
  OUTLINED_FUNCTION_202_0(OBJC_IVAR____TtC10WorkflowUI29NameIconComposeViewController____lazy_storage___textField);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10WorkflowUI29NameIconComposeViewController____lazy_storage___glyphPicker));
}

- (void)glyphPicker:(id)a3 didSelectGlyphWithCharacter:(unsigned __int16)a4
{
  id v6;
  _TtC10WorkflowUI29NameIconComposeViewController *v7;

  v6 = a3;
  v7 = self;
  NameIconComposeViewController.glyphPicker(_:didSelectGlyphWith:)((uint64_t)v7, a4);

}

- (BOOL)textFieldShouldReturn:(id)a3
{
  UITextField *v4;
  _TtC10WorkflowUI29NameIconComposeViewController *v5;

  v4 = (UITextField *)a3;
  v5 = self;
  NameIconComposeViewController.textFieldShouldReturn(_:)(v4);

  return 1;
}

@end
