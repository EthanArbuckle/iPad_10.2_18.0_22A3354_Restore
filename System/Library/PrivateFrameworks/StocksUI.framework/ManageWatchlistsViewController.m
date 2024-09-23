@implementation ManageWatchlistsViewController

- (_TtC8StocksUI30ManageWatchlistsViewController)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC8StocksUI30ManageWatchlistsViewController *result;

  v5 = OBJC_IVAR____TtC8StocksUI30ManageWatchlistsViewController_descriptionLabel;
  v6 = objc_allocWithZone(MEMORY[0x1E0DC3990]);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);

  result = (_TtC8StocksUI30ManageWatchlistsViewController *)sub_1DC409838();
  __break(1u);
  return result;
}

- (_TtC8StocksUI30ManageWatchlistsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC8StocksUI30ManageWatchlistsViewController *result;

  v4 = a4;
  result = (_TtC8StocksUI30ManageWatchlistsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8StocksUI30ManageWatchlistsViewController_styler);
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8StocksUI30ManageWatchlistsViewController_blueprintViewController));
  sub_1DC0926D8((uint64_t)self + OBJC_IVAR____TtC8StocksUI30ManageWatchlistsViewController_contentMode, type metadata accessor for ManageWatchlistsContentMode);
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8StocksUI30ManageWatchlistsViewController_descriptionLabel));
}

- (void)viewDidLoad
{
  _TtC8StocksUI30ManageWatchlistsViewController *v2;

  v2 = self;
  sub_1DC2B0048();

}

- (void)viewWillLayoutSubviews
{
  _TtC8StocksUI30ManageWatchlistsViewController *v2;

  v2 = self;
  sub_1DC2B0A48();

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
  -[ManageWatchlistsViewController traitCollectionDidChange:](&v7, sel_traitCollectionDidChange_, v4);
  v6 = objc_msgSend(v5, sel_traitCollection, v7.receiver, v7.super_class);
  sub_1DC2B1E14();

}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  objc_super v10;

  v4 = a4;
  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)swift_getObjectType();
  v6 = v10.receiver;
  -[ManageWatchlistsViewController setEditing:animated:](&v10, sel_setEditing_animated_, v5, v4);
  sub_1DC4055C0();
  sub_1DC4055CC();
  v7 = (void *)sub_1DC405074();
  swift_release();
  v8 = v5 ^ 1;
  objc_msgSend(v7, sel_setDragInteractionEnabled_, v8, v10.receiver, v10.super_class);

  sub_1DC4055CC();
  v9 = (void *)sub_1DC405074();
  swift_release();
  objc_msgSend(v9, sel_setAllowsMultipleSelection_, v8);

}

- (void)handleDone
{
  _TtC8StocksUI30ManageWatchlistsViewController *v2;
  _TtC8StocksUI30ManageWatchlistsViewController *v3;
  _TtC8StocksUI30ManageWatchlistsViewController *v4;
  _TtC8StocksUI30ManageWatchlistsViewController *v5;

  v5 = self;
  v2 = (_TtC8StocksUI30ManageWatchlistsViewController *)-[ManageWatchlistsViewController navigationController](v5, sel_navigationController);
  if (v2)
  {
    v3 = v2;
    -[ManageWatchlistsViewController dismissViewControllerAnimated:completion:](v2, sel_dismissViewControllerAnimated_completion_, 1, 0);

    v4 = v3;
  }
  else
  {
    v4 = v5;
  }

}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  id v6;
  id v7;
  _TtC8StocksUI30ManageWatchlistsViewController *v8;
  int64_t v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_1DC2B1FEC(v6, v7);

  return v9;
}

- (void)presentationController:(id)a3 prepareAdaptivePresentationController:(id)a4
{
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  _TtC8StocksUI30ManageWatchlistsViewController *v12;
  void *v13;
  id v14;

  objc_opt_self();
  v7 = swift_dynamicCastObjCClass();
  if (v7)
  {
    v8 = (void *)v7;
    sub_1DC0E7820();
    v9 = swift_allocObject();
    *(_OWORD *)(v9 + 16) = xmmword_1DC40FA60;
    v10 = (void *)objc_opt_self();
    v14 = a4;
    v11 = a3;
    v12 = self;
    *(_QWORD *)(v9 + 32) = objc_msgSend(v10, sel_largeDetent);
    sub_1DC408CF8();
    sub_1DC2B1DD8();
    v13 = (void *)sub_1DC408CC8();
    swift_bridgeObjectRelease();
    objc_msgSend(v8, sel_setDetents_, v13);

    objc_msgSend(v8, sel_setPrefersEdgeAttachedInCompactHeight_, 0);
  }
}

@end
