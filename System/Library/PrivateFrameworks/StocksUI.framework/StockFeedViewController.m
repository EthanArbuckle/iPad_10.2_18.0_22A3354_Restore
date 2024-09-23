@implementation StockFeedViewController

- (_TtC8StocksUI23StockFeedViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1DC20CDE4();
}

- (_TtC8StocksUI23StockFeedViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC8StocksUI23StockFeedViewController *result;

  v4 = a4;
  result = (_TtC8StocksUI23StockFeedViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8StocksUI23StockFeedViewController_styler);
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8StocksUI23StockFeedViewController_blueprintViewController));
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8StocksUI23StockFeedViewController_sceneProvider);
  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC8StocksUI23StockFeedViewController_stock;
  v4 = sub_1DC4010E4();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8StocksUI23StockFeedViewController_cardViewScrollViewCoordinator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8StocksUI23StockFeedViewController_statusBarView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8StocksUI23StockFeedViewController_stockFeedTitleView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8StocksUI23StockFeedViewController_overlayView));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8StocksUI23StockFeedViewController_keyboardInputMonitor);
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  sub_1DC0926D8((uint64_t)self + OBJC_IVAR____TtC8StocksUI23StockFeedViewController_latestQuote, (uint64_t (*)(_QWORD))sub_1DC0FED34);
  sub_1DC0926D8((uint64_t)self + OBJC_IVAR____TtC8StocksUI23StockFeedViewController_earnings, (uint64_t (*)(_QWORD))sub_1DC19E000);
}

- (void)viewDidLoad
{
  _TtC8StocksUI23StockFeedViewController *v2;

  v2 = self;
  sub_1DC2058DC();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC8StocksUI23StockFeedViewController *v4;

  v4 = self;
  sub_1DC206BCC(a3);

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC8StocksUI23StockFeedViewController *v4;

  v4 = self;
  sub_1DC206DA4(a3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v4 = v5.receiver;
  -[StockFeedViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, v3);
  sub_1DC206ED0();

}

- (void)viewWillLayoutSubviews
{
  _TtC8StocksUI23StockFeedViewController *v2;

  v2 = self;
  sub_1DC207014();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC8StocksUI23StockFeedViewController *v6;

  v5 = a3;
  v6 = self;
  sub_1DC207198((uint64_t)a3);

}

- (int64_t)preferredStatusBarStyle
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  __n128 v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  _TtC8StocksUI23StockFeedViewController *v13;
  int64_t v14;
  uint64_t v16;

  v3 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8StocksUI23StockFeedViewController_styler);
  swift_beginAccess();
  v4 = v3[3];
  v5 = v3[4];
  v6 = __swift_project_boxed_opaque_existential_1(v3, v4);
  v7 = *(_QWORD *)(v4 - 8);
  v8 = MEMORY[0x1E0C80A78](v6);
  v10 = (char *)&v16 - v9;
  (*(void (**)(char *, __n128))(v7 + 16))((char *)&v16 - v9, v8);
  v11 = *(_QWORD *)(v5 + 16);
  v12 = *(uint64_t (**)(uint64_t, uint64_t))(v11 + 8);
  v13 = self;
  v14 = v12(v4, v11);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v4);

  return v14;
}

- (void)didMoveToParentViewController:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  v4 = a3;
  v5 = v6.receiver;
  -[StockFeedViewController didMoveToParentViewController:](&v6, sel_didMoveToParentViewController_, v4);
  sub_1DC404048();

}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  _TtC8StocksUI23StockFeedViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1DC20938C(v4);

}

- (BOOL)scrollViewShouldScrollToTop:(id)a3
{
  id v4;
  _TtC8StocksUI23StockFeedViewController *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_1DC20CF74();

  return self & 1;
}

- (void)eventEditViewController:(id)a3 didCompleteWithAction:(int64_t)a4
{
  id v6;
  _TtC8StocksUI23StockFeedViewController *v7;

  v6 = a3;
  v7 = self;
  sub_1DC20B128(v6, a4);

}

@end
