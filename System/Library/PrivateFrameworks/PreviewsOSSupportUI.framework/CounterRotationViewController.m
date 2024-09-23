@implementation CounterRotationViewController

- (_TtC19PreviewsOSSupportUI29CounterRotationViewController)initWithCoder:(id)a3
{
  _TtC19PreviewsOSSupportUI29CounterRotationViewController *result;

  result = (_TtC19PreviewsOSSupportUI29CounterRotationViewController *)sub_22C683754();
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
  v5.super_class = (Class)swift_getObjectType();
  v2 = (char *)v5.receiver;
  -[CounterRotationViewController viewDidLoad](&v5, sel_viewDidLoad);
  v3 = objc_msgSend(v2, sel_view, v5.receiver, v5.super_class);
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, sel_addSubview_, *(_QWORD *)&v2[OBJC_IVAR____TtC19PreviewsOSSupportUI29CounterRotationViewController_contentView]);

  }
  else
  {
    __break(1u);
  }
}

- (void)viewWillLayoutSubviews
{
  char *v2;
  void *v3;
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)swift_getObjectType();
  v2 = (char *)v14.receiver;
  -[CounterRotationViewController viewWillLayoutSubviews](&v14, sel_viewWillLayoutSubviews);
  v3 = *(void **)&v2[OBJC_IVAR____TtC19PreviewsOSSupportUI29CounterRotationViewController_contentView];
  v4 = objc_msgSend(v2, sel_view, v14.receiver, v14.super_class);
  if (v4)
  {
    v5 = v4;
    objc_msgSend(v4, sel_bounds);
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;

    objc_msgSend(v3, sel_setFrame_, v7, v9, v11, v13);
  }
  else
  {
    __break(1u);
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  _TtC19PreviewsOSSupportUI29CounterRotationViewController *v6;

  swift_unknownObjectRetain();
  v6 = self;
  _s19PreviewsOSSupportUI29CounterRotationViewControllerC18viewWillTransition2to4withySo6CGSizeV_So06UIViewgJ11Coordinator_ptF_0(a4);
  swift_unknownObjectRelease();

}

- (_TtC19PreviewsOSSupportUI29CounterRotationViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC19PreviewsOSSupportUI29CounterRotationViewController *result;

  v4 = a4;
  result = (_TtC19PreviewsOSSupportUI29CounterRotationViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19PreviewsOSSupportUI29CounterRotationViewController_contentView));
}

@end
