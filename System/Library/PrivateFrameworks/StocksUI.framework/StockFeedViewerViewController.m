@implementation StockFeedViewerViewController

- (_TtC8StocksUI29StockFeedViewerViewController)initWithCoder:(id)a3
{
  _TtC8StocksUI29StockFeedViewerViewController *result;

  result = (_TtC8StocksUI29StockFeedViewerViewController *)sub_1DC409838();
  __break(1u);
  return result;
}

- (_TtC8StocksUI29StockFeedViewerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC8StocksUI29StockFeedViewerViewController *result;

  v4 = a4;
  result = (_TtC8StocksUI29StockFeedViewerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8StocksUI29StockFeedViewerViewController_styler);
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8StocksUI29StockFeedViewerViewController_blueprintPageViewController));
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8StocksUI29StockFeedViewerViewController_shareMenuItemManager);
}

- (void)viewDidLoad
{
  _TtC8StocksUI29StockFeedViewerViewController *v2;

  v2 = self;
  sub_1DC19FEC0();

}

- (void)viewWillLayoutSubviews
{
  char *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)swift_getObjectType();
  v2 = (char *)v15.receiver;
  -[StockFeedViewerViewController viewWillLayoutSubviews](&v15, sel_viewWillLayoutSubviews);
  v3 = objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC8StocksUI29StockFeedViewerViewController_blueprintPageViewController], sel_view, v15.receiver, v15.super_class);
  if (v3)
  {
    v4 = v3;
    v5 = objc_msgSend(v2, sel_view);
    if (v5)
    {
      v6 = v5;
      objc_msgSend(v5, sel_bounds);
      v8 = v7;
      v10 = v9;
      v12 = v11;
      v14 = v13;

      objc_msgSend(v4, sel_setFrame_, v8, v10, v12, v14);
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC8StocksUI29StockFeedViewerViewController *v4;

  v4 = self;
  sub_1DC1A0348(a3);

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  uint64_t v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  v4 = (char *)v6.receiver;
  -[StockFeedViewerViewController viewDidAppear:](&v6, sel_viewDidAppear_, v3);
  __swift_project_boxed_opaque_existential_1(&v4[OBJC_IVAR____TtC8StocksUI29StockFeedViewerViewController_shareMenuItemManager], *(_QWORD *)&v4[OBJC_IVAR____TtC8StocksUI29StockFeedViewerViewController_shareMenuItemManager + 24]);
  if (qword_1EDB2AAB8 != -1)
    swift_once();
  v5 = sub_1DC406B8C();
  __swift_project_value_buffer(v5, (uint64_t)qword_1EDB5DE48);
  sub_1DC4058FC();

}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC8StocksUI29StockFeedViewerViewController *v4;

  v4 = self;
  sub_1DC1A0580(a3);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  id v5;
  id v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  v4 = a3;
  v5 = v7.receiver;
  -[StockFeedViewerViewController traitCollectionDidChange:](&v7, sel_traitCollectionDidChange_, v4);
  v6 = objc_msgSend(v5, sel_traitCollection, v7.receiver, v7.super_class);
  sub_1DC19FFBC((uint64_t)v6);

}

- (void)didMoveToParentViewController:(id)a3
{
  id v5;
  _TtC8StocksUI29StockFeedViewerViewController *v6;

  v5 = a3;
  v6 = self;
  sub_1DC1A0754((uint64_t)a3);

}

@end
