@implementation BottomPlayerTabViewController

- (void)viewDidLoad
{
  _TtC16MusicApplication29BottomPlayerTabViewController *v2;

  v2 = self;
  sub_7835EC();

}

- (_TtC16MusicApplication29BottomPlayerTabViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _TtC16MusicApplication29BottomPlayerTabViewController *v9;

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
  v9 = (_TtC16MusicApplication29BottomPlayerTabViewController *)sub_78718C(v5, v7, (uint64_t)a4);

  return v9;
}

- (_TtC16MusicApplication29BottomPlayerTabViewController)initWithCoder:(id)a3
{
  id v3;
  _TtC16MusicApplication29BottomPlayerTabViewController *v4;

  v3 = a3;
  v4 = (_TtC16MusicApplication29BottomPlayerTabViewController *)sub_7872A0((uint64_t)v3);

  return v4;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication29BottomPlayerTabViewController_collectionView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication29BottomPlayerTabViewController_dataSource));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication29BottomPlayerTabViewController_queuesSubscription));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication29BottomPlayerTabViewController_orthogonalScrollView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication29BottomPlayerTabViewController_currentQueue));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication29BottomPlayerTabViewController_manager));
}

- (void)_collectionView:(id)a3 orthogonalScrollViewDidScroll:(id)a4 section:(int64_t)a5
{
  id v7;
  id v8;
  _TtC16MusicApplication29BottomPlayerTabViewController *v9;
  id v10;
  id v11;

  if (*(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16MusicApplication29BottomPlayerTabViewController_orthogonalScrollView))
  {
    v7 = a4;
    v8 = a3;
    v9 = self;
  }
  else
  {
    *(Class *)((char *)&self->super.super.super.isa
             + OBJC_IVAR____TtC16MusicApplication29BottomPlayerTabViewController_orthogonalScrollView) = (Class)a4;
    v10 = a4;
    v11 = a3;
    objc_msgSend(v10, "_addScrollViewScrollObserver:", self);
  }
  sub_7857C4();

}

- (void)_observeScrollViewDidEndDecelerating:(id)a3
{
  id v4;
  _TtC16MusicApplication29BottomPlayerTabViewController *v5;

  v4 = a3;
  v5 = self;
  sub_786488(v4);

}

@end
