@implementation TickerViewController

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
  -[TickerViewController traitCollectionDidChange:](&v7, sel_traitCollectionDidChange_, v4);
  v6 = objc_msgSend(v5, sel_traitCollection, v7.receiver, v7.super_class);
  sub_1DC0C7410((uint64_t)v6);

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
  -[TickerViewController viewWillLayoutSubviews](&v15, sel_viewWillLayoutSubviews);
  v3 = objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC8StocksUI20TickerViewController_blueprintViewController], sel_view, v15.receiver, v15.super_class);
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

- (void)viewDidLoad
{
  _TtC8StocksUI20TickerViewController *v2;

  v2 = self;
  sub_1DC09F320();

}

- (_TtC8StocksUI20TickerViewController)initWithCoder:(id)a3
{
  id v4;
  _TtC8StocksUI20TickerViewController *result;

  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC8StocksUI20TickerViewController_autoScrolling) = 0;
  v4 = a3;

  result = (_TtC8StocksUI20TickerViewController *)sub_1DC409838();
  __break(1u);
  return result;
}

- (_TtC8StocksUI20TickerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC8StocksUI20TickerViewController *result;

  v4 = a4;
  result = (_TtC8StocksUI20TickerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8StocksUI20TickerViewController_styler);
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8StocksUI20TickerViewController_blueprintViewController));
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4;
  _TtC8StocksUI20TickerViewController *v5;
  id v6;

  v4 = a3;
  v5 = self;
  sub_1DC4055CC();
  v6 = (id)sub_1DC405074();
  swift_release();
  type metadata accessor for TickerCollectionView();
  *(_BYTE *)(swift_dynamicCastClassUnconditional() + OBJC_IVAR____TtC8StocksUI20TickerCollectionView_autoScrolling) = 0;
  sub_1DC3309FC();

}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v4;
  _TtC8StocksUI20TickerViewController *v5;
  id v6;

  v4 = a3;
  v5 = self;
  sub_1DC4055CC();
  v6 = (id)sub_1DC405074();
  swift_release();
  type metadata accessor for TickerCollectionView();
  *(_BYTE *)(swift_dynamicCastClassUnconditional() + OBJC_IVAR____TtC8StocksUI20TickerCollectionView_autoScrolling) = 1;
  sub_1DC3309FC();

}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  id v5;
  _TtC8StocksUI20TickerViewController *v6;
  id v7;

  if (!a4)
  {
    v5 = a3;
    v6 = self;
    sub_1DC4055CC();
    v7 = (id)sub_1DC405074();
    swift_release();
    type metadata accessor for TickerCollectionView();
    *(_BYTE *)(swift_dynamicCastClassUnconditional() + OBJC_IVAR____TtC8StocksUI20TickerCollectionView_autoScrolling) = 1;
    sub_1DC3309FC();

  }
}

- (void)collectionView:(id)a3 didHighlightItemAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC8StocksUI20TickerViewController *v11;
  void *v12;
  uint64_t v13;

  v6 = sub_1DC400280();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DC400238();
  v10 = a3;
  v11 = self;
  sub_1DC4055CC();
  v12 = (void *)sub_1DC405074();
  swift_release();
  type metadata accessor for TickerCollectionView();
  *(_BYTE *)(swift_dynamicCastClassUnconditional() + OBJC_IVAR____TtC8StocksUI20TickerCollectionView_autoScrolling) = 0;
  sub_1DC3309FC();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)collectionView:(id)a3 didUnhighlightItemAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC8StocksUI20TickerViewController *v11;
  void *v12;
  uint64_t v13;

  v6 = sub_1DC400280();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DC400238();
  v10 = a3;
  v11 = self;
  sub_1DC4055CC();
  v12 = (void *)sub_1DC405074();
  swift_release();
  type metadata accessor for TickerCollectionView();
  *(_BYTE *)(swift_dynamicCastClassUnconditional() + OBJC_IVAR____TtC8StocksUI20TickerCollectionView_autoScrolling) = 1;
  sub_1DC3309FC();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

@end
