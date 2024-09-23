@implementation StockSearchViewController

- (_TtC8StocksUI25StockSearchViewController)initWithCoder:(id)a3
{
  uint64_t v5;
  Class v6;
  id v7;
  id v8;
  char *v9;
  uint64_t v10;
  _TtC8StocksUI25StockSearchViewController *result;

  *(_QWORD *)((char *)&self->super.super._responderFlags + OBJC_IVAR____TtC8StocksUI25StockSearchViewController_delegate) = 0;
  swift_unknownObjectWeakInit();
  v5 = OBJC_IVAR____TtC8StocksUI25StockSearchViewController_searchAction;
  sub_1DC12F234();
  v7 = objc_allocWithZone(v6);
  v8 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v7, sel_init);
  v9 = (char *)self + OBJC_IVAR____TtC8StocksUI25StockSearchViewController_stockSearchMode;
  v10 = sub_1DC40124C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v9, 1, 1, v10);
  swift_unknownObjectWeakInit();

  result = (_TtC8StocksUI25StockSearchViewController *)sub_1DC409838();
  __break(1u);
  return result;
}

- (_TtC8StocksUI25StockSearchViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC8StocksUI25StockSearchViewController *result;

  v4 = a4;
  result = (_TtC8StocksUI25StockSearchViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1DC148A20((uint64_t)self + OBJC_IVAR____TtC8StocksUI25StockSearchViewController_delegate);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8StocksUI25StockSearchViewController_styler);
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8StocksUI25StockSearchViewController_blueprintViewController));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8StocksUI25StockSearchViewController_searchAction));
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8StocksUI25StockSearchViewController_keyboardInputMonitor);
  swift_release();
  sub_1DC0926D8((uint64_t)self + OBJC_IVAR____TtC8StocksUI25StockSearchViewController_stockSearchMode, type metadata accessor for StockSearchMode);
  swift_unknownObjectWeakDestroy();
}

- (void)viewDidLoad
{
  _TtC8StocksUI25StockSearchViewController *v2;

  v2 = self;
  sub_1DC1F107C();

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
  -[StockSearchViewController viewWillLayoutSubviews](&v15, sel_viewWillLayoutSubviews);
  v3 = objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC8StocksUI25StockSearchViewController_blueprintViewController], sel_view, v15.receiver, v15.super_class);
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
  -[StockSearchViewController traitCollectionDidChange:](&v7, sel_traitCollectionDidChange_, v4);
  v6 = objc_msgSend(v5, sel_traitCollection, v7.receiver, v7.super_class);
  sub_1DC1F1398((uint64_t)v6);

}

- (UISplitViewController)splitViewController
{
  _TtC8StocksUI25StockSearchViewController *v2;
  id v3;
  id v4;

  v2 = self;
  v3 = -[StockSearchViewController presentingViewController](v2, sel_presentingViewController);
  v4 = objc_msgSend(v3, sel_splitViewController);

  return (UISplitViewController *)v4;
}

- (void)didPresentSearchController:(id)a3
{
  id v4;
  _TtC8StocksUI25StockSearchViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1DC1F38B0();

}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  id v5;
  _TtC8StocksUI25StockSearchViewController *v6;
  double v7;
  id v8;

  v5 = a3;
  v6 = self;
  MEMORY[0x1DF0C70E8]();
  sub_1DC4055CC();
  v8 = (id)sub_1DC405074();
  swift_release();
  objc_msgSend(v8, sel_adjustedContentInset);
  objc_msgSend(v8, sel_setContentOffset_animated_, 0, 0.0, -v7);
  -[StockSearchViewController setContentScrollView:forEdge:](v6, sel_setContentScrollView_forEdge_, v8, 15);

}

- (void)searchBarCancelButtonClicked:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  id v9;
  _TtC8StocksUI25StockSearchViewController *v10;
  uint64_t v11;

  v5 = type metadata accessor for StockSearchMode(0);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1DC40124C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 1, 1, v8);
  v9 = a3;
  v10 = self;
  sub_1DC1F17A0((uint64_t)v7);
  sub_1DC0926D8((uint64_t)v7, type metadata accessor for StockSearchMode);

}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4;
  _TtC8StocksUI25StockSearchViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1DC1F39F8();

}

@end
