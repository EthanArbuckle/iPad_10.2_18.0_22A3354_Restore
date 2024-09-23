@implementation DOCServiceInfoViewController

- (_TtC5Files28DOCServiceInfoViewController)initWithConfiguration:(id)a3 actionReporting:(id)a4 nodes:(id)a5 showTagsOnly:(BOOL)a6
{
  uint64_t v10;
  uint64_t v11;
  id v12;
  _TtC5Files28DOCServiceInfoViewController *v13;

  v10 = sub_10006922C((uint64_t *)&unk_1006424B0);
  v11 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a5, v10);
  v12 = a3;
  swift_unknownObjectRetain(a4);
  v13 = (_TtC5Files28DOCServiceInfoViewController *)sub_100314790(v12, (uint64_t)a4, v11, a6);

  swift_unknownObjectRelease(a4);
  return v13;
}

- (void)viewDidLoad
{
  _TtC5Files28DOCServiceInfoViewController *v2;

  v2 = self;
  sub_100313D08();

}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  _TtC5Files28DOCServiceInfoViewController *v5;

  swift_unknownObjectRetain(a3);
  v5 = self;
  sub_1003140AC(a3, (uint64_t)v5);
  swift_unknownObjectRelease(a3);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC5Files28DOCServiceInfoViewController *v6;

  v5 = a3;
  v6 = self;
  sub_1003141DC((uint64_t)a3);

}

- (void)doneButtonTapped:(id)a3
{
  _TtC5Files28DOCServiceInfoViewController *v5;
  uint64_t v6;
  double v7;
  _TtC5Files28DOCServiceInfoViewController *v8;
  __int128 v9;
  __int128 v10;

  if (a3)
  {
    v5 = self;
    v6 = swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(&v9, v6);
    *(_QWORD *)&v7 = swift_unknownObjectRelease(a3).n128_u64[0];
  }
  else
  {
    v9 = 0u;
    v10 = 0u;
    v8 = self;
  }
  -[DOCServiceInfoViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0, v7, v9, v10);

  sub_10007EB54((uint64_t)&v9);
}

- (int64_t)modalPresentationStyle
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType(self, a2);
  return -[DOCServiceInfoViewController modalPresentationStyle](&v3, "modalPresentationStyle");
}

- (void)setModalPresentationStyle:(int64_t)a3
{
  _TtC5Files28DOCServiceInfoViewController *v4;

  v4 = self;
  sub_1003143CC(a3, (uint64_t)v4);

}

- (_TtC5Files28DOCServiceInfoViewController)init
{
  _TtC5Files28DOCServiceInfoViewController *result;

  result = (_TtC5Files28DOCServiceInfoViewController *)_swift_stdlib_reportUnimplementedInitializer("Files.DOCServiceInfoViewController", 34, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files28DOCServiceInfoViewController_configuration));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files28DOCServiceInfoViewController_infoViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files28DOCServiceInfoViewController_infoNavigationController));
}

- (void)doc_startPreheatIfNecessary
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _TtC5Files28DOCServiceInfoViewController *v7;
  _QWORD v8[5];
  uint64_t v9;

  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC5Files28DOCServiceInfoViewController_infoViewController);
  v4 = swift_allocObject(&unk_1005DCFF0, 24, 7);
  *(_QWORD *)(v4 + 16) = self;
  v8[4] = sub_100314AEC;
  v9 = v4;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 1107296256;
  v8[2] = sub_10004A82C;
  v8[3] = &unk_1005DD008;
  v5 = _Block_copy(v8);
  v6 = v9;
  v7 = self;
  objc_msgSend(v3, "objc_doc_preheatForPresentingWithCompletion:", v5, swift_release(v6).n128_f64[0]);
  _Block_release(v5);

}

- (void)presentationController:(id)a3 willPresentWithAdaptiveStyle:(int64_t)a4 transitionCoordinator:(id)a5
{
  id v8;
  _TtC5Files28DOCServiceInfoViewController *v9;

  v8 = a3;
  swift_unknownObjectRetain(a5);
  v9 = self;
  sub_100314A5C((void *)a4);

  swift_unknownObjectRelease(a5);
}

- (void)presentationControllerWillDismiss:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _TtC5Files28DOCServiceInfoViewController *v10;
  _QWORD *v11;
  uint64_t KeyPath;
  _QWORD v13[2];

  v5 = objc_opt_self(UIPopoverPresentationController);
  v6 = swift_dynamicCastObjCClass(a3, v5);
  if (v6)
  {
    v7 = v6;
    sub_10006922C(&qword_100646110);
    v8 = qword_100640D40;
    v9 = a3;
    v10 = self;
    if (v8 != -1)
      swift_once(&qword_100640D40, sub_10011EE48);
    v11 = (_QWORD *)static DOCAssociatedObjectStorage.attachedTo(_:storageKey:)(v7);
    KeyPath = swift_getKeyPath(&unk_1004E2468);
    v13[0] = 0;
    v13[1] = 0;
    (*(void (**)(_QWORD *, uint64_t))((swift_isaMask & *v11) + 0x80))(v13, KeyPath);

  }
}

@end
