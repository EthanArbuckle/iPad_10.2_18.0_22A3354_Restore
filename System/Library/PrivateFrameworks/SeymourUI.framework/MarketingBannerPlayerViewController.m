@implementation MarketingBannerPlayerViewController

- (unint64_t)supportedInterfaceOrientations
{
  return 30;
}

- (_TtC9SeymourUI35MarketingBannerPlayerViewController)initWithCoder:(id)a3
{
  _TtC9SeymourUI35MarketingBannerPlayerViewController *result;

  result = (_TtC9SeymourUI35MarketingBannerPlayerViewController *)sub_22BA815D0();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC9SeymourUI35MarketingBannerPlayerViewController *v2;

  v2 = self;
  sub_22B66D254();

}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC9SeymourUI35MarketingBannerPlayerViewController *v4;

  v4 = self;
  sub_22B66D3E4(a3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC9SeymourUI35MarketingBannerPlayerViewController *v4;

  v4 = self;
  sub_22B66D988(a3);

}

- (void)playerFinished:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC9SeymourUI35MarketingBannerPlayerViewController *v8;
  _TtC9SeymourUI35MarketingBannerPlayerViewController *v9;
  _TtC9SeymourUI35MarketingBannerPlayerViewController *v10;
  uint64_t v11;

  v4 = sub_22BA79344();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22BA79320();
  v8 = self;
  v9 = (_TtC9SeymourUI35MarketingBannerPlayerViewController *)-[MarketingBannerPlayerViewController presentingViewController](v8, sel_presentingViewController);
  if (v9)
  {
    v10 = v9;
    -[MarketingBannerPlayerViewController dismissViewControllerAnimated:completion:](v9, sel_dismissViewControllerAnimated_completion_, 1, 0);

    v8 = v10;
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (_TtC9SeymourUI35MarketingBannerPlayerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC9SeymourUI35MarketingBannerPlayerViewController *result;

  v4 = a4;
  result = (_TtC9SeymourUI35MarketingBannerPlayerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC9SeymourUI35MarketingBannerPlayerViewController)initWithPlayerLayerView:(id)a3
{
  id v3;
  _TtC9SeymourUI35MarketingBannerPlayerViewController *result;

  v3 = a3;
  result = (_TtC9SeymourUI35MarketingBannerPlayerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_release();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC9SeymourUI35MarketingBannerPlayerViewController_metricPage;
  v4 = sub_22BA79CF8();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
}

@end
