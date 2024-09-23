@implementation TVShowsAndMoviesViewController

- (_TtC16MusicApplication30TVShowsAndMoviesViewController)init
{
  return (_TtC16MusicApplication30TVShowsAndMoviesViewController *)sub_18E104();
}

- (_TtC16MusicApplication30TVShowsAndMoviesViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1900B4();
}

- (void)viewDidLoad
{
  _TtC16MusicApplication30TVShowsAndMoviesViewController *v2;

  v2 = self;
  sub_18E280();

}

- (void)viewDidLayoutSubviews
{
  _TtC16MusicApplication30TVShowsAndMoviesViewController *v2;

  v2 = self;
  sub_18EA78();

}

- (id)contentScrollView
{
  return objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication30TVShowsAndMoviesViewController_selectedViewController), "contentScrollView");
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for TVShowsAndMoviesViewController();
  v4 = a3;
  v5 = v11.receiver;
  -[TVShowsAndMoviesViewController traitCollectionDidChange:](&v11, "traitCollectionDidChange:", v4);
  v6 = objc_msgSend(v5, "navigationItem", v11.receiver, v11.super_class);
  v7 = objc_msgSend(v5, "traitCollection");
  v8 = sub_693AE4();
  v10 = v9;

  sub_8149EC(v8, v10);
}

- (_TtC16MusicApplication30TVShowsAndMoviesViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC16MusicApplication30TVShowsAndMoviesViewController *result;

  v4 = a4;
  result = (_TtC16MusicApplication30TVShowsAndMoviesViewController *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.TVShowsAndMoviesViewController", 47, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication30TVShowsAndMoviesViewController_showsViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication30TVShowsAndMoviesViewController_moviesViewController));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication30TVShowsAndMoviesViewController____lazy_storage___contentFilteringController));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC16MusicApplication30TVShowsAndMoviesViewController_viewControllers));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication30TVShowsAndMoviesViewController_selectedViewController));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication30TVShowsAndMoviesViewController_barButtonItemsBinding));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication30TVShowsAndMoviesViewController_contentOffsetObserver));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication30TVShowsAndMoviesViewController____lazy_storage___segmentedControlContainerView));
}

@end
