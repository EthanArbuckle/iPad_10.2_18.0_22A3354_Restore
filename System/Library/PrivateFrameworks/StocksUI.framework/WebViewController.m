@implementation WebViewController

- (void)viewDidLoad
{
  id v2;
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  v2 = v4.receiver;
  -[WebViewController viewDidLoad](&v4, sel_viewDidLoad);
  v3 = objc_msgSend(v2, sel_traitCollection, v4.receiver, v4.super_class);
  sub_1DC2D2CB0((uint64_t)v3);

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC8StocksUI17WebViewController *v4;

  v4 = self;
  sub_1DC2D2EB8(a3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC8StocksUI17WebViewController *v4;

  v4 = self;
  sub_1DC2D31D4(a3);

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
  -[WebViewController traitCollectionDidChange:](&v7, sel_traitCollectionDidChange_, v4);
  v6 = objc_msgSend(v5, sel_traitCollection, v7.receiver, v7.super_class);
  sub_1DC2D2CB0((uint64_t)v6);

}

- (_TtC8StocksUI17WebViewController)initWithURL:(id)a3 configuration:(id)a4
{
  uint64_t v5;
  id v6;
  _TtC8StocksUI17WebViewController *result;

  v5 = sub_1DC3FFDD0();
  MEMORY[0x1E0C80A78](v5);
  sub_1DC3FFD94();
  v6 = a4;
  result = (_TtC8StocksUI17WebViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC8StocksUI17WebViewController)initWithURL:(id)a3 entersReaderIfAvailable:(BOOL)a4
{
  uint64_t v4;
  _TtC8StocksUI17WebViewController *result;

  v4 = sub_1DC3FFDD0();
  MEMORY[0x1E0C80A78](v4);
  sub_1DC3FFD94();
  result = (_TtC8StocksUI17WebViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8StocksUI17WebViewController_styler);
  sub_1DC17C7C8((uint64_t)self + OBJC_IVAR____TtC8StocksUI17WebViewController_webViewCoordinator, (unint64_t *)&qword_1F034C050, &qword_1F034F350);
  swift_release();
  sub_1DC2D4168((uint64_t)self + OBJC_IVAR____TtC8StocksUI17WebViewController_session);
}

@end
