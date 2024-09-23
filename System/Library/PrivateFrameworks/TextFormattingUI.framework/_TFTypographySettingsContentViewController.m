@implementation _TFTypographySettingsContentViewController

- (_TFTypographySettingsContentViewController)init
{
  return (_TFTypographySettingsContentViewController *)sub_247F8A8E4();
}

- (_TFTypographySettingsContentViewController)initWithCoder:(id)a3
{
  id v4;
  _TFTypographySettingsContentViewController *result;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TFTypographySettingsContentViewController_delegate) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TFTypographySettingsContentViewController__delegate) = 0;
  v4 = a3;

  result = (_TFTypographySettingsContentViewController *)sub_247F8F678();
  __break(1u);
  return result;
}

- (void)hide
{
  -[_TFTypographySettingsContentViewController dismissViewControllerAnimated:completion:](self, sel_dismissViewControllerAnimated_completion_, 1, 0);
}

- (void)loadView
{
  _TFTypographySettingsContentViewController *v2;

  v2 = self;
  _TFTypographySettingsContentViewController.loadView()();

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  objc_super v9;

  v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)swift_getObjectType();
  v4 = v9.receiver;
  -[_TFTypographySettingsContentViewController viewWillAppear:](&v9, sel_viewWillAppear_, v3);
  v5 = objc_msgSend(v4, sel_view, v9.receiver, v9.super_class);
  if (v5)
  {
    v6 = v5;
    v7 = objc_msgSend(v5, sel_superview);

    if (v7)
    {
      v8 = objc_msgSend((id)objc_opt_self(), sel_systemGroupedBackgroundColor);
      objc_msgSend(v7, sel_setBackgroundColor_, v8);

      v4 = v8;
    }

  }
  else
  {
    __break(1u);
  }
}

- (TypographyPanelDelegate)delegate
{
  return (TypographyPanelDelegate *)(id)swift_unknownObjectRetain();
}

- (void)setDelegate:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TFTypographySettingsContentViewController_delegate) = (Class)a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (void)setSelectedFont:(id)a3
{
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TFTypographySettingsContentViewController__typographyPanel), sel_setSelectedFont_, a3);
}

- (void)typographyPanelDidUpdateWithFont:(id)a3
{
  id *v4;

  v4 = (id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TFTypographySettingsContentViewController__delegate);
  swift_beginAccess();
  if (*v4)
    objc_msgSend(*v4, sel__typographySettingsViewControllerDidUpdateFont_, a3);
}

- (__TFTypographySettingsContentViewControllerDelegate)_delegate
{
  swift_beginAccess();
  return (__TFTypographySettingsContentViewControllerDelegate *)(id)swift_unknownObjectRetain();
}

- (void)set_delegate:(id)a3
{
  id *v4;

  v4 = (id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TFTypographySettingsContentViewController__delegate);
  swift_beginAccess();
  *v4 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (void)_setSelectedFont:(id)a3
{
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TFTypographySettingsContentViewController__typographyPanel), sel_setSelectedFont_, a3);
}

- (_TFTypographySettingsContentViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TFTypographySettingsContentViewController *result;

  v4 = a4;
  result = (_TFTypographySettingsContentViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TFTypographySettingsContentViewController__typographyPanel));
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

@end
