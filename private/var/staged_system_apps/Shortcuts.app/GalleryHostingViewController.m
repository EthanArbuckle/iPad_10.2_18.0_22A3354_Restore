@implementation GalleryHostingViewController

- (id)contentScrollViewForEdge:(unint64_t)a3
{
  _TtC9ShortcutsP33_5A6DD2238BCF5ED8887E2D852EDD3B1F28GalleryHostingViewController *v4;
  id v5;

  v4 = self;
  v5 = sub_100024D74(a3);

  return v5;
}

- (_TtC9ShortcutsP33_5A6DD2238BCF5ED8887E2D852EDD3B1F28GalleryHostingViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1000245F8();
}

- (void)viewDidLoad
{
  _TtC9ShortcutsP33_5A6DD2238BCF5ED8887E2D852EDD3B1F28GalleryHostingViewController *v2;

  v2 = self;
  sub_1000246E8();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC9ShortcutsP33_5A6DD2238BCF5ED8887E2D852EDD3B1F28GalleryHostingViewController *v4;

  v4 = self;
  sub_1000248B0(a3);

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC9ShortcutsP33_5A6DD2238BCF5ED8887E2D852EDD3B1F28GalleryHostingViewController *v4;

  v4 = self;
  sub_100024954(a3);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC9ShortcutsP33_5A6DD2238BCF5ED8887E2D852EDD3B1F28GalleryHostingViewController *v6;

  v5 = a3;
  v6 = self;
  sub_100024CB8((uint64_t)a3);

}

- (_TtC9ShortcutsP33_5A6DD2238BCF5ED8887E2D852EDD3B1F28GalleryHostingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v5 = a4;
  sub_100024E38();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9ShortcutsP33_5A6DD2238BCF5ED8887E2D852EDD3B1F28GalleryHostingViewController_searchController));
  v3 = (char *)self
     + OBJC_IVAR____TtC9ShortcutsP33_5A6DD2238BCF5ED8887E2D852EDD3B1F28GalleryHostingViewController_destination;
  v4 = type metadata accessor for GalleryNavigationDestination(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9ShortcutsP33_5A6DD2238BCF5ED8887E2D852EDD3B1F28GalleryHostingViewController_hostingController));
  sub_100014CFC((uint64_t)self+ OBJC_IVAR____TtC9ShortcutsP33_5A6DD2238BCF5ED8887E2D852EDD3B1F28GalleryHostingViewController_rootNavigator);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC9ShortcutsP33_5A6DD2238BCF5ED8887E2D852EDD3B1F28GalleryHostingViewController_userInterface));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC9ShortcutsP33_5A6DD2238BCF5ED8887E2D852EDD3B1F28GalleryHostingViewController_searchManager));
  sub_10001222C((uint64_t)self+ OBJC_IVAR____TtC9ShortcutsP33_5A6DD2238BCF5ED8887E2D852EDD3B1F28GalleryHostingViewController_pendingTest, &qword_1000D1088);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9ShortcutsP33_5A6DD2238BCF5ED8887E2D852EDD3B1F28GalleryHostingViewController_pendingPresentation));
}

@end
