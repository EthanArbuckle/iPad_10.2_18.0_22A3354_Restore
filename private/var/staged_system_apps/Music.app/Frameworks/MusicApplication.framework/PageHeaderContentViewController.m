@implementation PageHeaderContentViewController

- (_TtC16MusicApplication31PageHeaderContentViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  char *v9;

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
  v9 = sub_76F278(v5, v7, (uint64_t)a4);

  return (_TtC16MusicApplication31PageHeaderContentViewController *)v9;
}

- (_TtC16MusicApplication31PageHeaderContentViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  _s16MusicApplication31PageHeaderContentViewControllerC5coderACSgSo7NSCoderC_tcfc_0();
}

- (void)loadView
{
  _TtC16MusicApplication31PageHeaderContentViewController *v2;

  v2 = self;
  PageHeaderContentViewController.loadView()();

}

- (void)viewDidLayoutSubviews
{
  _TtC16MusicApplication31PageHeaderContentViewController *v2;

  v2 = self;
  PageHeaderContentViewController.viewDidLayoutSubviews()();

}

- (void)viewDidLoad
{
  _TtC16MusicApplication31PageHeaderContentViewController *v2;

  v2 = self;
  PageHeaderContentViewController.viewDidLoad()();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC16MusicApplication31PageHeaderContentViewController *v6;
  _TtC16MusicApplication31PageHeaderContentViewController *v7;
  UITraitCollection_optional v8;

  v5 = a3;
  v6 = self;
  v8.is_nil = (char)v6;
  v7 = v6;
  v8.value.super.isa = (Class)a3;
  PageHeaderContentViewController.traitCollectionDidChange(_:)(v8);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication31PageHeaderContentViewController_pageHeaderContentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication31PageHeaderContentViewController_accessoryView));
  swift_bridgeObjectRelease(*(_QWORD *)&self->pageHeaderContentView[OBJC_IVAR____TtC16MusicApplication31PageHeaderContentViewController_pageTitle]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->pageHeaderContentView[OBJC_IVAR____TtC16MusicApplication31PageHeaderContentViewController_pageSubtitle]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->pageHeaderContentView[OBJC_IVAR____TtC16MusicApplication31PageHeaderContentViewController_pageSupertitle]);
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication31PageHeaderContentViewController_textDrawingCache));
}

@end
