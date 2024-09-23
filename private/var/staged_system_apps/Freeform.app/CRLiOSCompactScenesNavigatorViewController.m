@implementation CRLiOSCompactScenesNavigatorViewController

- (_TtC8Freeform42CRLiOSCompactScenesNavigatorViewController)initWithCoder:(id)a3
{
  _QWORD *v4;
  id v5;
  _TtC8Freeform42CRLiOSCompactScenesNavigatorViewController *result;

  v4 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC8Freeform42CRLiOSCompactScenesNavigatorViewController_contentViewSize);
  *v4 = 0;
  v4[1] = 0;
  v5 = a3;

  result = (_TtC8Freeform42CRLiOSCompactScenesNavigatorViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100FAD6F0, "Freeform/CRLiOSCompactScenesNavigatorViewController.swift", 57, 2, 36, 0);
  __break(1u);
  return result;
}

- (void)teardown
{
  void *v3;
  _TtC8Freeform42CRLiOSCompactScenesNavigatorViewController *v4;
  id v5;

  v3 = (void *)objc_opt_self(NSNotificationCenter);
  v4 = self;
  v5 = objc_msgSend(v3, "defaultCenter");
  objc_msgSend(v5, "removeObserver:", v4);

}

- (void)viewDidLoad
{
  _TtC8Freeform42CRLiOSCompactScenesNavigatorViewController *v2;

  v2 = self;
  sub_1007B95F0();

}

- (void)viewDidLayoutSubviews
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CRLiOSCompactScenesNavigatorViewController();
  v2 = v3.receiver;
  -[CRLiOSCompactScenesNavigatorViewController viewDidLayoutSubviews](&v3, "viewDidLayoutSubviews");
  sub_1007B9F10();

}

+ (BOOL)scenesNavigatorHasFixedPositionWith:(id)a3
{
  void *v4;
  id v5;
  unsigned __int8 v6;

  v4 = (void *)objc_opt_self(UIDevice);
  v5 = a3;
  if ((objc_msgSend(v4, "crl_phoneUI") & 1) != 0)
    v6 = 1;
  else
    v6 = objc_msgSend(v5, "crl_isCompactWidth");

  return v6;
}

- (void)dismiss
{
  id v2;
  void *v3;
  _TtC8Freeform42CRLiOSCompactScenesNavigatorViewController *v4;

  v4 = self;
  v2 = -[CRLiOSCompactScenesNavigatorViewController view](v4, "view");
  if (v2)
  {
    v3 = v2;
    objc_msgSend(v2, "removeFromSuperview");

    -[CRLiOSCompactScenesNavigatorViewController removeFromParentViewController](v4, "removeFromParentViewController");
  }
  else
  {
    __break(1u);
  }
}

- (_TtC8Freeform42CRLiOSCompactScenesNavigatorViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC8Freeform42CRLiOSCompactScenesNavigatorViewController *result;

  v4 = a4;
  result = (_TtC8Freeform42CRLiOSCompactScenesNavigatorViewController *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLiOSCompactScenesNavigatorViewController", 51, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform42CRLiOSCompactScenesNavigatorViewController_hostingController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform42CRLiOSCompactScenesNavigatorViewController_editorController));
}

- (void)selectionPathDidChangeWithNotification:(id)a3
{
  id v4;
  _TtC8Freeform42CRLiOSCompactScenesNavigatorViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1007BA2D4(v4);

}

@end
