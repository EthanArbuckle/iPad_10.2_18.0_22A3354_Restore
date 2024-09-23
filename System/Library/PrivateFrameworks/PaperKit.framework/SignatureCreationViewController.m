@implementation SignatureCreationViewController

- (_TtC8PaperKit31SignatureCreationViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;

  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }
  return (_TtC8PaperKit31SignatureCreationViewController *)SignatureCreationViewController.init(nibName:bundle:)((uint64_t)a4, v6, a4);
}

- (_TtC8PaperKit31SignatureCreationViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  specialized SignatureCreationViewController.init(coder:)();
}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  _TtC8PaperKit31SignatureCreationViewController *v2;

  v2 = self;
  SignatureCreationViewController.viewDidLoad()();

}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (BOOL)becomeFirstResponder
{
  _TtC8PaperKit31SignatureCreationViewController *v2;
  Swift::Bool v3;

  v2 = self;
  v3 = SignatureCreationViewController.becomeFirstResponder()();

  return v3;
}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC8PaperKit31SignatureCreationViewController *v4;

  v4 = self;
  SignatureCreationViewController.viewDidAppear(_:)(a3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC8PaperKit31SignatureCreationViewController *v4;

  v4 = self;
  SignatureCreationViewController.viewDidDisappear(_:)(a3);

}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for SignatureCreationViewController();
  v6 = a3;
  swift_unknownObjectRetain();
  v7 = v10.receiver;
  -[SignatureCreationViewController willTransitionToTraitCollection:withTransitionCoordinator:](&v10, sel_willTransitionToTraitCollection_withTransitionCoordinator_, v6, a4);
  v8 = objc_msgSend(v7, sel_traitCollection, v10.receiver, v10.super_class);
  v9 = objc_msgSend(v8, sel_horizontalSizeClass);

  if (v9 != objc_msgSend(v6, sel_horizontalSizeClass))
    SignatureCreationViewController.clearSignature(with:)(a4);
  swift_unknownObjectRelease();

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  id v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  objc_super v15;

  height = a3.height;
  width = a3.width;
  v15.receiver = self;
  v15.super_class = (Class)type metadata accessor for SignatureCreationViewController();
  swift_unknownObjectRetain();
  v7 = v15.receiver;
  -[SignatureCreationViewController viewWillTransitionToSize:withTransitionCoordinator:](&v15, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, width, height);
  v8 = objc_msgSend(v7, sel_view, v15.receiver, v15.super_class);
  if (v8)
  {
    v9 = v8;
    objc_msgSend(v8, sel_bounds);
    v11 = v10;
    v13 = v12;

    if (width != v11 || height != v13)
      SignatureCreationViewController.clearSignature(with:)(a4);
    swift_unknownObjectRelease();

  }
  else
  {
    __break(1u);
  }
}

- (void)doneAction:(id)a3
{
  id v4;
  _TtC8PaperKit31SignatureCreationViewController *v5;

  v4 = a3;
  v5 = self;
  specialized SignatureCreationViewController.doneAction(_:)();

}

- (void)cancelAction:(id)a3
{
  id v4;
  _TtC8PaperKit31SignatureCreationViewController *v5;

  v4 = a3;
  v5 = self;
  specialized SignatureCreationViewController.cancelAction(_:)();

}

- (void)clearAction
{
  _TtC8PaperKit31SignatureCreationViewController *v2;

  v2 = self;
  SignatureCreationViewController.clearAction()();

}

- (void)descriptionAction
{
  _TtC8PaperKit31SignatureCreationViewController *v2;

  v2 = self;
  SignatureCreationViewController.descriptionAction()();

}

- (void)updateDoneButtonState:(id)a3
{
  UITextField *v4;
  _TtC8PaperKit31SignatureCreationViewController *v5;

  v4 = (UITextField *)a3;
  v5 = self;
  SignatureCreationViewController.updateDoneButtonState(_:)(v4);

}

- (void)canvasViewDrawingDidChange:(id)a3
{
  id v4;
  _TtC8PaperKit31SignatureCreationViewController *v5;

  v4 = a3;
  v5 = self;
  specialized SignatureCreationViewController.canvasViewDrawingDidChange(_:)();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit31SignatureCreationViewController_signatureLineColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit31SignatureCreationViewController_buttonImageConfiguration));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit31SignatureCreationViewController_xmarkImageConfiguration));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit31SignatureCreationViewController_navigationBar));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit31SignatureCreationViewController_signatureView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit31SignatureCreationViewController_signatureLineView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit31SignatureCreationViewController_doneItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit31SignatureCreationViewController_clearButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit31SignatureCreationViewController_savedFirstResponder));
  outlined consume of SignatureDescription(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC8PaperKit31SignatureCreationViewController_signatureDescription), *(_QWORD *)((char *)&self->super.super._responderFlags+ OBJC_IVAR____TtC8PaperKit31SignatureCreationViewController_signatureDescription));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit31SignatureCreationViewController_customLabelDoneAction));
}

@end
