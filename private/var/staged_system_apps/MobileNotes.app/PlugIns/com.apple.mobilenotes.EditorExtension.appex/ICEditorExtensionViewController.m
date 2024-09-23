@implementation ICEditorExtensionViewController

- (ICEditorExtensionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3, a2);
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (ICEditorExtensionViewController *)sub_100005EB0(v5, v7, a4);
}

- (ICEditorExtensionViewController)initWithCoder:(id)a3
{
  return (ICEditorExtensionViewController *)sub_100006094(a3);
}

- (void)dealloc
{
  void *v2;
  ICEditorExtensionViewController *v3;
  objc_super v4;

  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___ICEditorExtensionViewController_analyticsController);
  v3 = self;
  objc_msgSend(v2, "appSessionDidTerminate");
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for EditorExtensionViewController();
  -[ICEditorExtensionViewController dealloc](&v4, "dealloc");
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___ICEditorExtensionViewController_analyticsController));

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR___ICEditorExtensionViewController_imageData));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR___ICEditorExtensionViewController_webURLs));

  swift_bridgeObjectRelease(*(_QWORD *)&self->analyticsController[OBJC_IVAR___ICEditorExtensionViewController_hostBundleIdentifier]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___ICEditorExtensionViewController_feedbackGenerator));
}

- (void)viewDidLoad
{
  ICEditorExtensionViewController *v2;

  v2 = self;
  sub_100006348();

}

- (void)viewWillLayoutSubviews
{
  ICEditorExtensionViewController *v2;

  v2 = self;
  sub_100006F3C();

}

- (void)viewDidAppear:(BOOL)a3
{
  ICEditorExtensionViewController *v4;

  v4 = self;
  sub_1000071BC(a3);

}

- (void)motionBegan:(int64_t)a3 withEvent:(id)a4
{
  id v5;
  ICEditorExtensionViewController *v6;

  v5 = a4;
  v6 = self;
  sub_10000C5C8();

}

- (void)motionEnded:(int64_t)a3 withEvent:(id)a4
{
  id v5;
  ICEditorExtensionViewController *v6;

  v5 = a4;
  v6 = self;
  sub_10000C680();

}

- (void)motionCancelled:(int64_t)a3 withEvent:(id)a4
{
  void *v4;

  v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___ICEditorExtensionViewController_feedbackGenerator);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___ICEditorExtensionViewController_feedbackGenerator) = 0;

}

- (BOOL)presentationControllerShouldDismiss:(id)a3
{
  void *v3;
  ICEditorExtensionViewController *v4;
  ICEditorExtensionViewController *v5;
  ICEditorExtensionViewController *v6;
  ICEditorExtensionViewController *v7;
  ICEditorExtensionViewController *v8;
  unsigned __int8 v9;

  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___ICEditorExtensionViewController_noteEditor);
  if (v3)
  {
    v4 = self;
    v5 = (ICEditorExtensionViewController *)a3;
    v6 = v4;
    v7 = (ICEditorExtensionViewController *)objc_msgSend(v3, "note");
    if (v7)
    {
      v8 = v7;
      v9 = -[ICEditorExtensionViewController isEmpty](v7, "isEmpty");

      v5 = v6;
      v6 = v8;
    }
    else
    {
      v9 = 1;
    }

    LOBYTE(self) = v9;
  }
  else
  {
    __break(1u);
  }
  return (char)self;
}

- (void)presentationControllerDidAttemptToDismiss:(id)a3
{
  void *v4;

  v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___ICEditorExtensionViewController_noteEditor);
  if (v4)
    objc_msgSend(v4, "cancelFromSystemPaperCard:", self);
}

- (BOOL)shouldAcceptXPCConnection:(id)a3
{
  id v4;
  ICEditorExtensionViewController *v5;

  v4 = a3;
  v5 = self;
  sub_10000AB00(v4);

  return 1;
}

- (void)checkInWithReply:(id)a3
{
  _QWORD *v4;
  void (*v5)(_QWORD *);
  ICEditorExtensionViewController *v6;

  v4 = _Block_copy(a3);
  v5 = (void (*)(_QWORD *))v4[2];
  v6 = self;
  v5(v4);
  _Block_release(v4);

}

- (void)addUserActivityData:(id)a3
{
  id v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  ICEditorExtensionViewController *v9;

  v5 = a3;
  v9 = self;
  v6 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v8 = v7;

  sub_10000B32C(v6, v8);
  sub_10000CD44(v6, v8);

}

- (void)noteEditorRequestsDismissal:(id)a3 cancelled:(BOOL)a4
{
  id v6;
  ICEditorExtensionViewController *v7;

  v6 = a3;
  v7 = self;
  sub_10000CC58(a4);

}

@end
