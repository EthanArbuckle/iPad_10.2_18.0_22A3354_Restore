@implementation StaticImageViewController

- (_TtC17SequoiaTranslator25StaticImageViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100182CB4();
}

- (void)viewDidLoad
{
  id v2;
  void *v3;
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for StaticImageViewController();
  v2 = v5.receiver;
  -[StaticImageViewController viewDidLoad](&v5, "viewDidLoad");
  sub_10017AFF0();
  sub_10017B6F4();
  v3 = (void *)objc_opt_self(NSNotificationCenter);
  v4 = objc_msgSend(v3, "defaultCenter", v5.receiver, v5.super_class);
  objc_msgSend(v4, "addObserver:selector:name:object:", v2, "handleKeyboardDidShowWithKeyboardShowNotification:", UIKeyboardDidShowNotification, 0);

}

- (void)viewDidLayoutSubviews
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for StaticImageViewController();
  v2 = v3.receiver;
  -[StaticImageViewController viewDidLayoutSubviews](&v3, "viewDidLayoutSubviews");
  sub_10017AE88();

}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v6;
  _TtC17SequoiaTranslator25StaticImageViewController *v7;

  v6 = a3;
  swift_unknownObjectRetain(a4);
  v7 = self;
  sub_100182DE0(v6);

  swift_unknownObjectRelease(a4);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  _TtC17SequoiaTranslator25StaticImageViewController *v8;

  height = a3.height;
  width = a3.width;
  swift_unknownObjectRetain(a4);
  v8 = self;
  sub_10017A970(a4, width, height);

  swift_unknownObjectRelease(a4);
}

- (void)applicationWillSuspend
{
  char *v2;
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for StaticImageViewController();
  v2 = (char *)v9.receiver;
  -[StaticImageViewController applicationWillSuspend](&v9, "applicationWillSuspend");
  v3 = *(_QWORD *)&v2[OBJC_IVAR____TtC17SequoiaTranslator25StaticImageViewController_context];
  KeyPath = swift_getKeyPath(&unk_1001F5438);
  v5 = swift_getKeyPath(&unk_1001F5460);
  static Published.subscript.getter(&v7, v3, KeyPath);
  swift_release(v5);
  swift_release(KeyPath);
  v6 = v8;
  if (v8 != 5)
  {
    sub_1000484FC(v7, v8);
    if (v6 == 1)
      sub_10017FC90();
  }

}

- (void)handleKeyboardDidShowWithKeyboardShowNotification:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC17SequoiaTranslator25StaticImageViewController *v9;
  uint64_t v10;

  v5 = type metadata accessor for Notification(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  sub_10017F9E4();

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (_TtC17SequoiaTranslator25StaticImageViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC17SequoiaTranslator25StaticImageViewController *result;

  v4 = a4;
  result = (_TtC17SequoiaTranslator25StaticImageViewController *)_swift_stdlib_reportUnimplementedInitializer("SequoiaTranslator.StaticImageViewController", 43, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3;

  sub_1000E05B8(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC17SequoiaTranslator25StaticImageViewController_image), self->image[OBJC_IVAR____TtC17SequoiaTranslator25StaticImageViewController_image]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator25StaticImageViewController_conversation));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC17SequoiaTranslator25StaticImageViewController_context));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator25StaticImageViewController_favoritesImporter));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC17SequoiaTranslator25StaticImageViewController_configuration));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator25StaticImageViewController_scrollView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator25StaticImageViewController_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator25StaticImageViewController_currentTranslationView));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC17SequoiaTranslator25StaticImageViewController_retranslateSubscription));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC17SequoiaTranslator25StaticImageViewController_visualTranslationLocaleSubscription));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC17SequoiaTranslator25StaticImageViewController_targetLocaleSubscription));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC17SequoiaTranslator25StaticImageViewController_availabilitySubscription));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator25StaticImageViewController_materialView));
  sub_100011194((uint64_t)self + OBJC_IVAR____TtC17SequoiaTranslator25StaticImageViewController_delegate);
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC17SequoiaTranslator25StaticImageViewController_translationOverlayModel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator25StaticImageViewController_translationHostingController));
  v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC17SequoiaTranslator25StaticImageViewController__hasTranslatedText);
  swift_release(*(_QWORD *)&self->image[OBJC_IVAR____TtC17SequoiaTranslator25StaticImageViewController__hasTranslatedText]);
  swift_release(v3);
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC17SequoiaTranslator25StaticImageViewController_selfLoggingInvocation));
}

- (id)viewForZoomingInScrollView:(id)a3
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                 + OBJC_IVAR____TtC17SequoiaTranslator25StaticImageViewController_imageView));
}

- (void)scrollViewDidZoom:(id)a3
{
  id v4;
  _TtC17SequoiaTranslator25StaticImageViewController *v5;

  v4 = a3;
  v5 = self;
  sub_10017AE88();

}

@end
