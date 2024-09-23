@implementation FaceToFaceViewController

- (_TtC17SequoiaTranslator24FaceToFaceViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1000BD498();
}

- (void)viewDidLoad
{
  _TtC17SequoiaTranslator24FaceToFaceViewController *v2;

  v2 = self;
  sub_1000BA3AC();

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  _QWORD v10[5];
  uint64_t v11;
  objc_super v12;

  v3 = a3;
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for FaceToFaceViewController();
  v4 = v12.receiver;
  -[FaceToFaceViewController viewWillAppear:](&v12, "viewWillAppear:", v3);
  v5 = (void *)objc_opt_self(UIView);
  v6 = swift_allocObject(&unk_100269018, 24, 7);
  *(_QWORD *)(v6 + 16) = v4;
  v10[4] = sub_1000BD47C;
  v11 = v6;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 1107296256;
  v10[2] = sub_100075908;
  v10[3] = &unk_100269030;
  v7 = _Block_copy(v10);
  v8 = v11;
  v9 = v4;
  swift_release(v8);
  objc_msgSend(v5, "animateWithDuration:animations:", v7, 0.25);
  _Block_release(v7);

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  _TtC17SequoiaTranslator24FaceToFaceViewController *v8;

  height = a3.height;
  width = a3.width;
  swift_unknownObjectRetain(a4);
  v8 = self;
  sub_1000BA55C(a4, width, height);
  swift_unknownObjectRelease(a4);

}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  _TtC17SequoiaTranslator24FaceToFaceViewController *v2;
  id v3;
  id v4;

  v2 = self;
  v3 = -[FaceToFaceViewController traitCollection](v2, "traitCollection");
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4)
    return 30;
  else
    return 2;
}

- (void)closeButtonPressed
{
  _TtC17SequoiaTranslator24FaceToFaceViewController *v2;

  v2 = self;
  sub_1000BD070();

}

- (_TtC17SequoiaTranslator24FaceToFaceViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC17SequoiaTranslator24FaceToFaceViewController *result;

  v4 = a4;
  result = (_TtC17SequoiaTranslator24FaceToFaceViewController *)_swift_stdlib_reportUnimplementedInitializer("SequoiaTranslator.FaceToFaceViewController", 42, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator24FaceToFaceViewController_viewModel));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC17SequoiaTranslator24FaceToFaceViewController_conversationContext));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC17SequoiaTranslator24FaceToFaceViewController_sceneContext));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator24FaceToFaceViewController_sourceWindow));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator24FaceToFaceViewController_targetWindow));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator24FaceToFaceViewController_sourceViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator24FaceToFaceViewController_targetViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator24FaceToFaceViewController____lazy_storage___closeButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator24FaceToFaceViewController_closeBottomConstraint));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC17SequoiaTranslator24FaceToFaceViewController_subscriptions));
  sub_10002BA44(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC17SequoiaTranslator24FaceToFaceViewController_onCloseTap), *(_QWORD *)&self->viewModel[OBJC_IVAR____TtC17SequoiaTranslator24FaceToFaceViewController_onCloseTap]);
}

@end
