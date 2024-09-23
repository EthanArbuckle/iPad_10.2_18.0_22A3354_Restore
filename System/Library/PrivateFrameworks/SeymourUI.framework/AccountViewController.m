@implementation AccountViewController

- (CGSize)preferredContentSize
{
  _TtC9SeymourUI21AccountViewController *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  objc_super v10;
  CGSize result;

  v2 = self;
  v3 = sub_22BA7D46C();
  if (v3 == sub_22BA7D46C())
  {

    v4 = 0x4082400000000000;
    v5 = 0x4082200000000000;
  }
  else
  {
    v10.receiver = v2;
    v10.super_class = (Class)type metadata accessor for AccountViewController();
    -[AccountViewController preferredContentSize](&v10, sel_preferredContentSize);
    v5 = v6;
    v4 = v7;

  }
  v8 = *(double *)&v5;
  v9 = *(double *)&v4;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)setPreferredContentSize:(CGSize)a3
{
  double height;
  double width;
  objc_super v5;

  height = a3.height;
  width = a3.width;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for AccountViewController();
  -[AccountViewController setPreferredContentSize:](&v5, sel_setPreferredContentSize_, width, height);
}

- (_TtC9SeymourUI21AccountViewController)initWithCoder:(id)a3
{
  id v4;
  _TtC9SeymourUI21AccountViewController *result;

  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI21AccountViewController_visibility) = 1;
  v4 = a3;

  result = (_TtC9SeymourUI21AccountViewController *)sub_22BA815D0();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC9SeymourUI21AccountViewController *v2;

  v2 = self;
  sub_22B5BF7A0();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC9SeymourUI21AccountViewController *v4;

  v4 = self;
  sub_22B5BFB18(a3);

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for AccountViewController();
  v4 = v5.receiver;
  -[AccountViewController viewDidAppear:](&v5, sel_viewDidAppear_, v3);
  sub_22B5C0A1C();
  sub_22BA7DC94();

}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC9SeymourUI21AccountViewController *v4;

  v4 = self;
  sub_22B5C017C(a3);

}

- (void)doneButtonTapped:(id)a3
{
  -[AccountViewController dismissViewControllerAnimated:completion:](self, sel_dismissViewControllerAnimated_completion_, 1, 0);
}

- (_TtC9SeymourUI21AccountViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC9SeymourUI21AccountViewController *result;

  v4 = a4;
  result = (_TtC9SeymourUI21AccountViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC9SeymourUI21AccountViewController_metricPage;
  v4 = sub_22BA79CF8();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI21AccountViewController_pageNavigator);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI21AccountViewController_storefrontLocalizer);
}

@end
