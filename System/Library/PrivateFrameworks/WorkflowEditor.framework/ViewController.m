@implementation ViewController

- (int64_t)overrideUserInterfaceStyle
{
  _TtC14WorkflowEditorP33_4F6B3E8D8EDFB1AA2880F20B202F8EFE14ViewController *v2;
  id v3;

  v2 = self;
  v3 = sub_2267BC3B8();

  return (int64_t)v3;
}

- (void)setOverrideUserInterfaceStyle:(int64_t)a3
{
  _TtC14WorkflowEditorP33_4F6B3E8D8EDFB1AA2880F20B202F8EFE14ViewController *v4;

  v4 = self;
  sub_2267BC42C(a3);

}

- (_TtC14WorkflowEditorP33_4F6B3E8D8EDFB1AA2880F20B202F8EFE14ViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = sub_22688E220();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC14WorkflowEditorP33_4F6B3E8D8EDFB1AA2880F20B202F8EFE14ViewController *)sub_2267BC4E0(v5, v7, a4);
}

- (_TtC14WorkflowEditorP33_4F6B3E8D8EDFB1AA2880F20B202F8EFE14ViewController)initWithCoder:(id)a3
{
  return (_TtC14WorkflowEditorP33_4F6B3E8D8EDFB1AA2880F20B202F8EFE14ViewController *)sub_2267BC5BC(a3);
}

@end
