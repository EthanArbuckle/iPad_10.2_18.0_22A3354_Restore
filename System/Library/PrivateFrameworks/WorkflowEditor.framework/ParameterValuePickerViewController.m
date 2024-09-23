@implementation ParameterValuePickerViewController

- (_TtP14WorkflowEditor42ParameterValuePickerViewControllerDelegate_)delegate
{
  sub_2266B5B10();
}

- (void)setDelegate:(id)a3
{
  _TtC14WorkflowEditor34ParameterValuePickerViewController *v4;

  swift_unknownObjectRetain();
  v4 = self;
  sub_2266B5B68();

}

- (WFVariableProvider)variableProvider
{
  sub_2266B5B94();
}

- (void)setVariableProvider:(id)a3
{
  _TtC14WorkflowEditor34ParameterValuePickerViewController *v4;

  swift_unknownObjectRetain();
  v4 = self;
  sub_2266B5BEC();

}

- (WFVariableUIDelegate)variableUIDelegate
{
  sub_2266B5C18();
}

- (void)setVariableUIDelegate:(id)a3
{
  _TtC14WorkflowEditor34ParameterValuePickerViewController *v4;

  swift_unknownObjectRetain();
  v4 = self;
  sub_2266B5C70();

}

- (_TtC14WorkflowEditor34ParameterValuePickerViewController)initWithParameter:(id)a3 allowsVariables:(BOOL)a4 allowsMultipleSelection:(BOOL)a5 initialCollection:(id)a6 currentState:(id)a7
{
  id v9;
  id v10;
  id v11;

  v9 = a3;
  v10 = a6;
  v11 = a7;
  return (_TtC14WorkflowEditor34ParameterValuePickerViewController *)ParameterValuePickerViewController.init(parameter:allowsVariables:allowsMultipleSelection:initialCollection:currentState:)();
}

- (_TtC14WorkflowEditor34ParameterValuePickerViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_2266B5EF8();
}

- (void)loadView
{
  _TtC14WorkflowEditor34ParameterValuePickerViewController *v2;

  v2 = self;
  sub_2266B5F9C();

}

- (_TtC14WorkflowEditor34ParameterValuePickerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    sub_22688E220();
  v5 = a4;
  ParameterValuePickerViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14WorkflowEditor34ParameterValuePickerViewController_parameter));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14WorkflowEditor34ParameterValuePickerViewController_currentState));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14WorkflowEditor34ParameterValuePickerViewController_initialValue));
  OUTLINED_FUNCTION_67_1(OBJC_IVAR____TtC14WorkflowEditor34ParameterValuePickerViewController_delegate);
  OUTLINED_FUNCTION_67_1(OBJC_IVAR____TtC14WorkflowEditor34ParameterValuePickerViewController_variableProvider);
  OUTLINED_FUNCTION_67_1(OBJC_IVAR____TtC14WorkflowEditor34ParameterValuePickerViewController_variableUIDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14WorkflowEditor34ParameterValuePickerViewController_hostingViewController));
}

@end
