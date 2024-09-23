@implementation PopoverTipViewController

- (_TtC8ShelfKit24PopoverTipViewController)initWithCoder:(id)a3
{
  _TtC8ShelfKit24PopoverTipViewController *result;

  result = (_TtC8ShelfKit24PopoverTipViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000000030B670, "ShelfKit/TipViewControllerProvider.swift", 40, 2, 54, 0);
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PopoverTipViewController(0);
  v2 = v3.receiver;
  -[PopoverTipViewController viewDidLoad](&v3, "viewDidLoad");
  objc_msgSend(v2, "setDelegate:", v2, v3.receiver, v3.super_class);
  sub_105C88();

}

- (_TtC8ShelfKit24PopoverTipViewController)initWithRequest:(id)a3
{
  id v3;
  _TtC8ShelfKit24PopoverTipViewController *result;

  v3 = a3;
  result = (_TtC8ShelfKit24PopoverTipViewController *)_swift_stdlib_reportUnimplementedInitializer("ShelfKit.PopoverTipViewController", 33, "init(request:)", 14, 0);
  __break(1u);
  return result;
}

- (_TtC8ShelfKit24PopoverTipViewController)initWithRequest:(id)a3 bag:(id)a4 account:(id)a5
{
  id v7;
  id v8;
  _TtC8ShelfKit24PopoverTipViewController *result;

  v7 = a3;
  swift_unknownObjectRetain(a4);
  v8 = a5;
  result = (_TtC8ShelfKit24PopoverTipViewController *)_swift_stdlib_reportUnimplementedInitializer("ShelfKit.PopoverTipViewController", 33, "init(request:bag:account:)", 26, 0);
  __break(1u);
  return result;
}

- (_TtC8ShelfKit24PopoverTipViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC8ShelfKit24PopoverTipViewController *result;

  v4 = a4;
  result = (_TtC8ShelfKit24PopoverTipViewController *)_swift_stdlib_reportUnimplementedInitializer("ShelfKit.PopoverTipViewController", 33, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_57698((uint64_t)self + OBJC_IVAR____TtC8ShelfKit24PopoverTipViewController_tipType);
  swift_release(*(_QWORD *)((char *)self + OBJC_IVAR____TtC8ShelfKit24PopoverTipViewController_metricsController));
}

- (void)messageViewController:(id)a3 didSelectActionWithDialogResult:(id)a4
{
  id v6;
  id v7;
  _TtC8ShelfKit24PopoverTipViewController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  _s8ShelfKit24PopoverTipViewControllerC07messageeF0_19didSelectActionWithySo012AMSUIMessageeF0_So06UIViewF0CXc_So15AMSDialogResultCtF_0(v6, v7);

}

@end
