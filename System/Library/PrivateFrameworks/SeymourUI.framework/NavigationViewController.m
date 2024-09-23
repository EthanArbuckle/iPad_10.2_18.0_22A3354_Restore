@implementation NavigationViewController

- (_TtC9SeymourUI24NavigationViewController)init
{
  char *v3;
  _TtC9SeymourUI24NavigationViewController *v4;

  v3 = (char *)objc_msgSend(objc_allocWithZone((Class)type metadata accessor for PlaceholderViewController()), sel_init);
  objc_msgSend(*(id *)&v3[OBJC_IVAR____TtC9SeymourUI25PlaceholderViewController_activityIndicator], sel_startAnimating);
  v4 = -[NavigationViewController initWithRootViewController:](self, sel_initWithRootViewController_, v3);

  return v4;
}

- (_TtC9SeymourUI24NavigationViewController)initWithRootViewController:(id)a3
{
  return (_TtC9SeymourUI24NavigationViewController *)NavigationViewController.init(rootViewController:)(a3);
}

- (_TtC9SeymourUI24NavigationViewController)initWithCoder:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  id v6;
  _TtC9SeymourUI24NavigationViewController *result;

  v4 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC9SeymourUI24NavigationViewController_onShouldBeginRecognizing);
  *v4 = 0;
  v4[1] = 0;
  v5 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC9SeymourUI24NavigationViewController_onMenuTapped);
  *v5 = 0;
  v5[1] = 0;
  v6 = a3;

  result = (_TtC9SeymourUI24NavigationViewController *)sub_22BA815D0();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  char *v2;
  id v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for NavigationViewController();
  v2 = (char *)v5.receiver;
  -[NavigationViewController viewDidLoad](&v5, sel_viewDidLoad);
  v3 = objc_msgSend(v2, sel_view, v5.receiver, v5.super_class);
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, sel_addGestureRecognizer_, *(_QWORD *)&v2[OBJC_IVAR____TtC9SeymourUI24NavigationViewController_menuGestureRecognizer]);

  }
  else
  {
    __break(1u);
  }
}

- (void)menuButtonTapped
{
  void (*v2)(uint64_t);
  uint64_t v3;
  _TtC9SeymourUI24NavigationViewController *v4;

  v2 = *(void (**)(uint64_t))((char *)&self->super.super.super.super.isa
                                      + OBJC_IVAR____TtC9SeymourUI24NavigationViewController_onMenuTapped);
  if (v2)
  {
    v4 = self;
    v3 = sub_22B0FAA58((uint64_t)v2);
    v2(v3);
    sub_22B0FAA68((uint64_t)v2);

  }
}

- (_TtC9SeymourUI24NavigationViewController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  _TtC9SeymourUI24NavigationViewController *result;

  result = (_TtC9SeymourUI24NavigationViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC9SeymourUI24NavigationViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC9SeymourUI24NavigationViewController *result;

  v4 = a4;
  result = (_TtC9SeymourUI24NavigationViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI24NavigationViewController_rootViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI24NavigationViewController_menuGestureRecognizer));
  sub_22B0FAA68(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI24NavigationViewController_onShouldBeginRecognizing));
  sub_22B0FAA68(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI24NavigationViewController_onMenuTapped));
  swift_bridgeObjectRelease();
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  uint64_t (*v3)(_TtC9SeymourUI24NavigationViewController *, id);
  id v5;
  _TtC9SeymourUI24NavigationViewController *v6;
  char v7;

  v3 = *(uint64_t (**)(_TtC9SeymourUI24NavigationViewController *, id))((char *)&self->super.super.super.super.isa
                                                                                + OBJC_IVAR____TtC9SeymourUI24NavigationViewController_onShouldBeginRecognizing);
  if (v3)
  {
    v5 = a3;
    v6 = self;
    sub_22B0FAA58((uint64_t)v3);
    v7 = v3(v6, v5);
    sub_22B0FAA68((uint64_t)v3);

  }
  else
  {
    v7 = 1;
  }
  return v7 & 1;
}

- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5
{
  id v7;
  id v8;
  _TtC9SeymourUI24NavigationViewController *v9;

  v7 = a3;
  v8 = a4;
  v9 = self;
  sub_22B38EA20(v8);

}

@end
