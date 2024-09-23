@implementation WebViewController

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  _TtC23ShelfKitCollectionViews17WebViewController *v5;
  id v6;
  id v7;

  v4 = (void *)objc_opt_self(NSNotificationCenter);
  v5 = self;
  v6 = objc_msgSend(v4, "defaultCenter");
  v7 = v6;
  if (qword_3CFE00 != -1)
  {
    swift_once(&qword_3CFE00, sub_2C15F8);
    v6 = v7;
  }
  objc_msgSend(v6, "postNotificationName:object:", qword_3E1118, 0);

}

- (_TtC23ShelfKitCollectionViews17WebViewController)initWithCoder:(id)a3
{
  _TtC23ShelfKitCollectionViews17WebViewController *result;

  result = (_TtC23ShelfKitCollectionViews17WebViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000000307D10, "ShelfKitCollectionViews/WebViewController.swift", 47, 2, 118, 0);
  __break(1u);
  return result;
}

- (_TtC23ShelfKitCollectionViews17WebViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC23ShelfKitCollectionViews17WebViewController *result;

  v4 = a4;
  result = (_TtC23ShelfKitCollectionViews17WebViewController *)_swift_stdlib_reportUnimplementedInitializer("ShelfKitCollectionViews.WebViewController", 41, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_E8C08((uint64_t)self + OBJC_IVAR____TtC23ShelfKitCollectionViews17WebViewController_url);
}

@end
