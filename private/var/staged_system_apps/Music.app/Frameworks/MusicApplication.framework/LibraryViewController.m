@implementation LibraryViewController

- (_TtC16MusicApplication21LibraryViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_261F5C();
}

- (void)dealloc
{
  _TtC16MusicApplication21LibraryViewController *v2;

  v2 = self;
  sub_25D4C8();
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication21LibraryViewController_libraryRecommendationUserOptInDidChangeObserver));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication21LibraryViewController_sceneDidActivateNotificationObserver));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication21LibraryViewController____lazy_storage___accountButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication21LibraryViewController_menuTableViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication21LibraryViewController_recentlyAddedViewController));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication21LibraryViewController_cloudLibraryStatusObserver));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication21LibraryViewController_libraryRecommendationCoordinator));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication21LibraryViewController_mliEnabledDidChangeObserver));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication21LibraryViewController_webViewDismissedObserver));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication21LibraryViewController_shouldShowLibraryImportViewObserver));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication21LibraryViewController_libraryImportViewModelObserver));
  sub_56024((uint64_t)self + OBJC_IVAR____TtC16MusicApplication21LibraryViewController_libraryImportViewModel, &qword_14BC270);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication21LibraryViewController_libraryImportViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication21LibraryViewController____lazy_storage___glideController));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication21LibraryViewController_dragDropController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication21LibraryViewController____lazy_storage___dropIndicationView));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication21LibraryViewController_inlineBubbleTipSubscription));
  sub_AAE88(*(id *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC16MusicApplication21LibraryViewController_inlineBubbleTipState));
}

- (void)viewDidLoad
{
  _TtC16MusicApplication21LibraryViewController *v2;

  v2 = self;
  sub_25D76C();

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  _BYTE *v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for LibraryViewController(0);
  v4 = v5.receiver;
  -[VerticalStackViewController viewDidAppear:](&v5, "viewDidAppear:", v3);
  sub_2614B4();
  sub_25EC4C();
  if (v4[OBJC_IVAR____TtC16MusicApplication21LibraryViewController_shouldRecordPageMetrics] == 1)
    sub_260DF8();

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
  v7.super_class = (Class)type metadata accessor for LibraryViewController(0);
  v4 = v7.receiver;
  -[VerticalStackViewController viewWillAppear:](&v7, "viewWillAppear:", v3);
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
  _TtC16MusicApplication21LibraryViewController *v2;

  v2 = self;
  sub_25E620();

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  _BYTE *v4;
  uint64_t v5;
  char v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for LibraryViewController(0);
  v4 = v7.receiver;
  -[VerticalStackViewController viewWillDisappear:](&v7, "viewWillDisappear:", v3);
  v5 = OBJC_IVAR____TtC16MusicApplication21LibraryViewController_shouldSkipRecordingPageMetricsForEditingStateChange;
  v6 = v4[OBJC_IVAR____TtC16MusicApplication21LibraryViewController_shouldSkipRecordingPageMetricsForEditingStateChange];
  v4[OBJC_IVAR____TtC16MusicApplication21LibraryViewController_shouldSkipRecordingPageMetricsForEditingStateChange] = 1;
  objc_msgSend(v4, "setEditing:animated:", 0, 0, v7.receiver, v7.super_class);
  v4[v5] = v6;

}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _TtC16MusicApplication21LibraryViewController *v6;

  v6 = self;
  sub_25E780(a3, a4);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for LibraryViewController(0);
  v4 = a3;
  v5 = v6.receiver;
  -[LibraryViewController traitCollectionDidChange:](&v6, "traitCollectionDidChange:", v4);
  sub_25EDB8();
  sub_25FD94(0);
  sub_260898();

}

- (void)presentRazzmatazz:(id)a3
{
  id v4;
  _TtC16MusicApplication21LibraryViewController *v5;

  v4 = a3;
  v5 = self;
  sub_260B40(v4);

}

@end
