@implementation CameraPreviewViewController

- (_TtC17SequoiaTranslator27CameraPreviewViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10011DA48(0xD000000000000025, 0x80000001001F88D0, 190);
}

- (_TtC17SequoiaTranslator27CameraPreviewViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;

  v4 = a4;
  sub_10011DA48(0xD00000000000002ELL, 0x80000001001FDF80, 195);
}

- (void)viewDidLoad
{
  _TtC17SequoiaTranslator27CameraPreviewViewController *v2;

  v2 = self;
  sub_10011603C();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC17SequoiaTranslator27CameraPreviewViewController *v3;

  v3 = self;
  sub_10011DB68();

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  _TtC17SequoiaTranslator27CameraPreviewViewController *v8;

  height = a3.height;
  width = a3.width;
  swift_unknownObjectRetain(a4);
  v8 = self;
  sub_100116454((uint64_t)a4, width, height);

  swift_unknownObjectRelease(a4);
}

- (void)applicationWillSuspend
{
  _TtC17SequoiaTranslator27CameraPreviewViewController *v2;

  v2 = self;
  sub_100116564();

}

- (void)applicationDidResume
{
  _TtC17SequoiaTranslator27CameraPreviewViewController *v2;

  v2 = self;
  sub_100116684();

}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC17SequoiaTranslator27CameraPreviewViewController *v3;

  v3 = self;
  sub_10011DC1C();

}

- (void)debugTapInteractionWithRecognizer:(id)a3
{
  void *v3;
  id v5;
  _TtC17SequoiaTranslator27CameraPreviewViewController *v6;
  id v7;

  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC17SequoiaTranslator27CameraPreviewViewController_translationBridge);
  if (v3)
  {
    v5 = a3;
    v6 = self;
    v7 = v3;
    VisualTranslationViewBridge.showDebugMenu()();

  }
}

- (void).cxx_destruct
{
  uint64_t v3;
  void *v4;
  char v5;
  char *v6;
  uint64_t v7;

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator27CameraPreviewViewController_conversation));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC17SequoiaTranslator27CameraPreviewViewController_context));
  sub_100011194((uint64_t)self + OBJC_IVAR____TtC17SequoiaTranslator27CameraPreviewViewController_delegate);
  v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC17SequoiaTranslator27CameraPreviewViewController__staticImage);
  v4 = *(void **)&self->context[OBJC_IVAR____TtC17SequoiaTranslator27CameraPreviewViewController__staticImage];
  v5 = self->delegate[OBJC_IVAR____TtC17SequoiaTranslator27CameraPreviewViewController__staticImage];
  swift_release(*(_QWORD *)&self->conversation[OBJC_IVAR____TtC17SequoiaTranslator27CameraPreviewViewController__staticImage]);
  swift_release(v3);
  sub_1000E05B8(v4, v5);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator27CameraPreviewViewController_dataScannerVC));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator27CameraPreviewViewController_translationBridge));
  sub_10000A020((uint64_t)self + OBJC_IVAR____TtC17SequoiaTranslator27CameraPreviewViewController_contextObserver, (uint64_t *)&unk_10028C0B0);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC17SequoiaTranslator27CameraPreviewViewController_observationTasks));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC17SequoiaTranslator27CameraPreviewViewController_availabilitySubscription));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator27CameraPreviewViewController_noTextFoundTimer));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC17SequoiaTranslator27CameraPreviewViewController_visualTranslationLocaleSubscription));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator27CameraPreviewViewController_materialView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator27CameraPreviewViewController_topReflectionView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator27CameraPreviewViewController_bottomReflectionView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator27CameraPreviewViewController_topConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator27CameraPreviewViewController_bottomConstraint));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC17SequoiaTranslator27CameraPreviewViewController_selfLoggingInvocation));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator27CameraPreviewViewController_launchPrerequisitesDebounceTimer));
  v6 = (char *)self + OBJC_IVAR____TtC17SequoiaTranslator27CameraPreviewViewController__viewportHasText;
  v7 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC17SequoiaTranslator27CameraPreviewViewController__viewportHasText);
  swift_release(*((_QWORD *)v6 + 1));
  swift_release(v7);
}

@end
