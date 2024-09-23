@implementation SystemContactPicker.SystemContactPickerViewController

- (_TtCV9SnippetUI19SystemContactPicker33SystemContactPickerViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_21EE21D78();
}

- (void)viewDidLoad
{
  _TtCV9SnippetUI19SystemContactPicker33SystemContactPickerViewController *v2;

  v2 = self;
  sub_21EE21E18();

}

- (void)contactPickerDidCancel:(id)a3
{
  id v4;
  _TtCV9SnippetUI19SystemContactPicker33SystemContactPickerViewController *v5;

  v4 = a3;
  v5 = self;
  sub_21EE21F18();

}

- (void)contactPicker:(id)a3 didSelectContact:(id)a4
{
  id v6;
  id v7;
  _TtCV9SnippetUI19SystemContactPicker33SystemContactPickerViewController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_21EE21FE8((uint64_t)v8, (uint64_t)v7);

}

- (_TtCV9SnippetUI19SystemContactPicker33SystemContactPickerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    sub_21F11369C();
  v5 = a4;
  sub_21EE220F8();
}

- (void).cxx_destruct
{
  id v2;

  v2 = *(UITabBarItem **)((char *)&self->super._tabBarItem
                        + OBJC_IVAR____TtCV9SnippetUI19SystemContactPicker33SystemContactPickerViewController_container);
  swift_release();
  swift_release();
  swift_release();

}

@end
