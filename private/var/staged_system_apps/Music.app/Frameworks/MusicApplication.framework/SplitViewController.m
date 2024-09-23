@implementation SplitViewController

- (_TtC16MusicApplication19SplitViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_45DE90();
}

- (void)viewDidLoad
{
  _TtC16MusicApplication19SplitViewController *v2;

  v2 = self;
  sub_454450();

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
  sub_A9008(v8);
  v6 = sub_A31E08(0xAu, v5);
  swift_bridgeObjectRelease(v5);
  if ((v6 & 1) != 0)
  {
    if (qword_14AB398 != -1)
      swift_once(&qword_14AB398, sub_517A9C);
    if (*(_BYTE *)(qword_15807B8 + OBJC_IVAR____TtCO16MusicApplication3MLI8Observer_didReceiveError) == 1)
      sub_51CD8C(0);
  }

}

- (void)viewDidLayoutSubviews
{
  _TtC16MusicApplication19SplitViewController *v2;

  v2 = self;
  sub_455158();

}

- (void)viewLayoutMarginsDidChange
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SplitViewController(0);
  v2 = v3.receiver;
  -[SplitViewController viewLayoutMarginsDidChange](&v3, "viewLayoutMarginsDidChange");
  sub_4564C0();
  sub_456370();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  id v5;
  id v6;
  char *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for SplitViewController(0);
  v4 = a3;
  v5 = v8.receiver;
  -[SplitViewController traitCollectionDidChange:](&v8, "traitCollectionDidChange:", v4);
  v6 = objc_msgSend(v5, "traitCollection", v8.receiver, v8.super_class);
  v7 = (char *)objc_msgSend(v6, "horizontalSizeClass");

  sub_3E492C(v7 == (_BYTE *)&dword_0 + 2);
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
  v8 = sub_4D5BC((uint64_t)&off_133D320);
  v9 = v7;
  sub_45D0A0(v8, v9);

  swift_bridgeObjectRelease(v8);
}

- (NSString)playActivityFeatureName
{
  _TtC16MusicApplication19SplitViewController *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  sub_455AF8();
  v4 = v3;

  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

- (_TtC16MusicApplication19SplitViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  sub_662EC((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)"MusicApplication.SplitViewController", 36);
}

- (_TtC16MusicApplication19SplitViewController)initWithStyle:(int64_t)a3
{
  _TtC16MusicApplication19SplitViewController *result;

  result = (_TtC16MusicApplication19SplitViewController *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.SplitViewController", 36, "init(style:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_56024((uint64_t)self + OBJC_IVAR____TtC16MusicApplication19SplitViewController_libraryImportViewModel, &qword_14BC270);
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication19SplitViewController_libraryImportViewModelObserver));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication19SplitViewController_shouldShowLibraryImportViewObserver));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication19SplitViewController_mliInProgressObserver));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication19SplitViewController_mliEnabledDidChangeObserver));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication19SplitViewController_tabsViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication19SplitViewController_bottomPlayerViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication19SplitViewController_sidebarMenuViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication19SplitViewController_contentViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication19SplitViewController_miniPlayerPaletteInteraction));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication19SplitViewController_sidebarViewController));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication19SplitViewController_sceneBinding));
  sub_5C0DC((uint64_t)self + OBJC_IVAR____TtC16MusicApplication19SplitViewController_navigationStacks, type metadata accessor for SplitViewController.NavigationStacks);
  sub_45E79C(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication19SplitViewController_keyboardObserver), *(_QWORD *)&self->libraryImportViewModelObserver[OBJC_IVAR____TtC16MusicApplication19SplitViewController_keyboardObserver], *(_QWORD *)&self->shouldShowLibraryImportViewObserver[OBJC_IVAR____TtC16MusicApplication19SplitViewController_keyboardObserver], *(_QWORD *)&self->mliInProgressObserver[OBJC_IVAR____TtC16MusicApplication19SplitViewController_keyboardObserver]);
  sub_5C198(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication19SplitViewController_ppt_onContentIsReady), *(_QWORD *)&self->libraryImportViewModelObserver[OBJC_IVAR____TtC16MusicApplication19SplitViewController_ppt_onContentIsReady]);
}

- (void)splitViewController:(id)a3 willChangeToDisplayMode:(int64_t)a4
{
  id v5;
  _TtC16MusicApplication19SplitViewController *v6;

  v5 = a3;
  v6 = self;
  sub_45E00C();

}

@end
