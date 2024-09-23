@implementation BottomPlayerTabViewController

- (void)viewDidLoad
{
  _TtC5Music29BottomPlayerTabViewController *v2;

  v2 = self;
  sub_10024F064();

}

- (_TtC5Music29BottomPlayerTabViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC5Music29BottomPlayerTabViewController *)sub_100251CCC(v5, v7, a4);
}

- (_TtC5Music29BottomPlayerTabViewController)initWithCoder:(id)a3
{
  return (_TtC5Music29BottomPlayerTabViewController *)sub_100251E40(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music29BottomPlayerTabViewController_collectionView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music29BottomPlayerTabViewController_dataSource));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC5Music29BottomPlayerTabViewController_queuesSubscription));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music29BottomPlayerTabViewController_orthogonalScrollView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music29BottomPlayerTabViewController_currentQueue));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music29BottomPlayerTabViewController_manager));
}

- (void)_collectionView:(id)a3 orthogonalScrollViewDidScroll:(id)a4 section:(int64_t)a5
{
  id v7;
  id v8;
  _TtC5Music29BottomPlayerTabViewController *v9;
  id v10;
  id v11;

  if (*(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC5Music29BottomPlayerTabViewController_orthogonalScrollView))
  {
    v7 = a4;
    v8 = a3;
    v9 = self;
  }
  else
  {
    *(Class *)((char *)&self->super.super.super.isa
             + OBJC_IVAR____TtC5Music29BottomPlayerTabViewController_orthogonalScrollView) = (Class)a4;
    v10 = a4;
    v11 = a3;
    objc_msgSend(v10, "_addScrollViewScrollObserver:", self);
  }
  sub_100251240();

}

- (void)_observeScrollViewDidEndDecelerating:(id)a3
{
  id v4;
  _TtC5Music29BottomPlayerTabViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1002520AC(v4);

}

@end
