@implementation StockChartViewController

- (_TtC8StocksUI24StockChartViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  _s8StocksUI24StockChartViewControllerC5coderACSgSo7NSCoderC_tcfc_0();
}

- (_TtC8StocksUI24StockChartViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC8StocksUI24StockChartViewController *result;

  v4 = a4;
  result = (_TtC8StocksUI24StockChartViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC8StocksUI24StockChartViewController_stock;
  v4 = sub_1DC4010E4();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8StocksUI24StockChartViewController_topDateRangePickerSeparator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8StocksUI24StockChartViewController_dateRangePicker));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8StocksUI24StockChartViewController_lineChartViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8StocksUI24StockChartViewController_columnChartViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8StocksUI24StockChartViewController_interactionDisplayView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8StocksUI24StockChartViewController_activityIndicator));
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8StocksUI24StockChartViewController_calloutViewProvider);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8StocksUI24StockChartViewController_rangeCalloutViewProvider);
  sub_1DC14DB5C(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC8StocksUI24StockChartViewController_activeCallout));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8StocksUI24StockChartViewController_styler);
  swift_unknownObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8StocksUI24StockChartViewController_stateMachine));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8StocksUI24StockChartViewController_errorView));
}

- (void)viewDidLoad
{
  _TtC8StocksUI24StockChartViewController *v2;

  v2 = self;
  StockChartViewController.viewDidLoad()();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC8StocksUI24StockChartViewController *v6;
  _TtC8StocksUI24StockChartViewController *v7;
  UITraitCollection_optional v8;

  v5 = a3;
  v6 = self;
  v8.is_nil = (char)v6;
  v7 = v6;
  v8.value.super.isa = (Class)a3;
  StockChartViewController.traitCollectionDidChange(_:)(v8);

}

- (void)viewDidLayoutSubviews
{
  _TtC8StocksUI24StockChartViewController *v2;

  v2 = self;
  StockChartViewController.viewDidLayoutSubviews()();

}

@end
