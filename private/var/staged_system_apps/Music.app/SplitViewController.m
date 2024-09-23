@implementation SplitViewController

- (_TtC5Music19SplitViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100360010();
}

- (void)viewDidLoad
{
  _TtC5Music19SplitViewController *v2;

  v2 = self;
  sub_100353580();

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  uint64_t v5;
  char v6;
  objc_super v7;
  _QWORD v8[15];

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for SplitViewController(0);
  v4 = v7.receiver;
  -[SplitViewController viewWillAppear:](&v7, "viewWillAppear:", v3);
  static ApplicationCapabilities.shared.getter((uint64_t)v8);
  v5 = v8[3];
  swift_bridgeObjectRetain();
  sub_100065184(v8);
  v6 = sub_10075BDAC(0xAu, v5);
  swift_bridgeObjectRelease(v5);
  if ((v6 & 1) != 0)
  {
    if (qword_10119BE90 != -1)
      swift_once(&qword_10119BE90, sub_100328EB0);
    if (*(_BYTE *)(qword_10124CDA8 + OBJC_IVAR____TtCO5Music3MLI8Observer_didReceiveError) == 1)
      sub_10032DF74(0);
  }

}

- (void)viewDidLayoutSubviews
{
  _TtC5Music19SplitViewController *v2;

  v2 = self;
  sub_100354290();

}

- (void)viewLayoutMarginsDidChange
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SplitViewController(0);
  v2 = v3.receiver;
  -[SplitViewController viewLayoutMarginsDidChange](&v3, "viewLayoutMarginsDidChange");
  sub_100355608();
  sub_1003554B8();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for SplitViewController(0);
  v4 = a3;
  v5 = v8.receiver;
  -[SplitViewController traitCollectionDidChange:](&v8, "traitCollectionDidChange:", v4);
  v6 = objc_msgSend(v5, "traitCollection", v8.receiver, v8.super_class);
  v7 = objc_msgSend(v6, "horizontalSizeClass");

  sub_1008C6518(v7 == (id)2);
}

- (void)setViewController:(id)a3 forColumn:(int64_t)a4
{
  id v6;
  id v7;
  Swift::Int v8;
  id v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for SplitViewController(0);
  v6 = a3;
  v7 = v10.receiver;
  -[SplitViewController setViewController:forColumn:](&v10, "setViewController:forColumn:", v6, a4);
  v8 = sub_100048C10((uint64_t)&off_1010ABCC0);
  v9 = v7;
  sub_10035F88C(v8, v9);

  swift_bridgeObjectRelease(v8);
}

- (NSString)playActivityFeatureName
{
  _TtC5Music19SplitViewController *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  sub_100354C10();
  v4 = v3;

  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

- (_TtC5Music19SplitViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  sub_10035A2A8((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)"Music.SplitViewController", 25);
}

- (_TtC5Music19SplitViewController)initWithStyle:(int64_t)a3
{
  _TtC5Music19SplitViewController *result;

  result = (_TtC5Music19SplitViewController *)_swift_stdlib_reportUnimplementedInitializer("Music.SplitViewController", 25, "init(style:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10004FF60((uint64_t)self + OBJC_IVAR____TtC5Music19SplitViewController_libraryImportViewModel, (uint64_t *)&unk_1011BC820);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music19SplitViewController_tabsViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music19SplitViewController_bottomPlayerViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music19SplitViewController_sidebarMenuViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music19SplitViewController_contentViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music19SplitViewController_miniPlayerPaletteInteraction));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music19SplitViewController_sidebarViewController));
  swift_release();
  sub_10005B748((uint64_t)self + OBJC_IVAR____TtC5Music19SplitViewController_navigationStacks, type metadata accessor for SplitViewController.NavigationStacks);
  sub_1003608CC(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC5Music19SplitViewController_keyboardObserver), *(_QWORD *)&self->libraryImportViewModelObserver[OBJC_IVAR____TtC5Music19SplitViewController_keyboardObserver], *(_QWORD *)&self->shouldShowLibraryImportViewObserver[OBJC_IVAR____TtC5Music19SplitViewController_keyboardObserver], *(_QWORD *)&self->mliInProgressObserver[OBJC_IVAR____TtC5Music19SplitViewController_keyboardObserver]);
  sub_10004BA30(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC5Music19SplitViewController_ppt_onContentIsReady), *(_QWORD *)&self->libraryImportViewModelObserver[OBJC_IVAR____TtC5Music19SplitViewController_ppt_onContentIsReady]);
}

- (void)splitViewController:(id)a3 willChangeToDisplayMode:(int64_t)a4
{
  id v5;
  _TtC5Music19SplitViewController *v6;

  v5 = a3;
  v6 = self;
  sub_10036024C();

}

@end
