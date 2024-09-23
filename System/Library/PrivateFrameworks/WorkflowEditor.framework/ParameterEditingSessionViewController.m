@implementation ParameterEditingSessionViewController

- (_TtC14WorkflowEditorP33_2752CA8C95F7CD441264E696EB76D2D537ParameterEditingSessionViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_226758700();
}

- (void)viewDidLoad
{
  _TtC14WorkflowEditorP33_2752CA8C95F7CD441264E696EB76D2D537ParameterEditingSessionViewController *v2;

  v2 = self;
  sub_2267587A4();

}

- (void)cancelEditing
{
  _TtC14WorkflowEditorP33_2752CA8C95F7CD441264E696EB76D2D537ParameterEditingSessionViewController *v2;

  v2 = self;
  sub_226758DB8();

}

- (void)finishEditingWithParameterState:(id)a3
{
  _TtC14WorkflowEditorP33_2752CA8C95F7CD441264E696EB76D2D537ParameterEditingSessionViewController *v4;

  swift_unknownObjectRetain();
  v4 = self;
  sub_226758E38();
  swift_unknownObjectRelease();

}

- (_TtC14WorkflowEditorP33_2752CA8C95F7CD441264E696EB76D2D537ParameterEditingSessionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    sub_22688E220();
  v5 = a4;
  sub_226758EEC();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14WorkflowEditorP33_2752CA8C95F7CD441264E696EB76D2D537ParameterEditingSessionViewController_parameter));
  swift_unknownObjectRelease();
  sub_22669DFD4((uint64_t)self+ OBJC_IVAR____TtC14WorkflowEditorP33_2752CA8C95F7CD441264E696EB76D2D537ParameterEditingSessionViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14WorkflowEditorP33_2752CA8C95F7CD441264E696EB76D2D537ParameterEditingSessionViewController_currentEditingController));
}

@end
