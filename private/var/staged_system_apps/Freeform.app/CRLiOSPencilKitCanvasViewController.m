@implementation CRLiOSPencilKitCanvasViewController

- (_TtC8Freeform35CRLiOSPencilKitCanvasViewController)initWithDelegate:(id)a3
{
  objc_super v6;

  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC8Freeform35CRLiOSPencilKitCanvasViewController_observedToolkit);
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC8Freeform35CRLiOSPencilKitCanvasViewController_isTornDown) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8Freeform35CRLiOSPencilKitCanvasViewController_smartSelectionManager) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8Freeform35CRLiOSPencilKitCanvasViewController_smartSelectionView) = 0;
  swift_unknownObjectUnownedInit((char *)self + OBJC_IVAR____TtC8Freeform35CRLiOSPencilKitCanvasViewController_delegate, a3);
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for CRLiOSPencilKitCanvasViewController();
  return -[CRLiOSPencilKitCanvasViewController initWithNibName:bundle:](&v6, "initWithNibName:bundle:", 0, 0);
}

- (_TtC8Freeform35CRLiOSPencilKitCanvasViewController)initWithCoder:(id)a3
{
  id v5;
  _TtC8Freeform35CRLiOSPencilKitCanvasViewController *result;

  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC8Freeform35CRLiOSPencilKitCanvasViewController_observedToolkit, 0);
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC8Freeform35CRLiOSPencilKitCanvasViewController_isTornDown) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8Freeform35CRLiOSPencilKitCanvasViewController_smartSelectionManager) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8Freeform35CRLiOSPencilKitCanvasViewController_smartSelectionView) = 0;
  v5 = a3;

  result = (_TtC8Freeform35CRLiOSPencilKitCanvasViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100FAD6F0, "Freeform/CRLiOSPencilKitCanvasViewController.swift", 50, 2, 86, 0);
  __break(1u);
  return result;
}

- (void)tearDown
{
  _TtC8Freeform35CRLiOSPencilKitCanvasViewController *v2;

  v2 = self;
  sub_1006F05A4();

}

- (void)dealloc
{
  char v2;
  _TtC8Freeform35CRLiOSPencilKitCanvasViewController *v3;
  objc_super v4;

  v2 = *((_BYTE *)&self->super.super.super.isa
       + OBJC_IVAR____TtC8Freeform35CRLiOSPencilKitCanvasViewController_isTornDown);
  v3 = self;
  if ((v2 & 1) == 0)
  {
    sub_100757E04(&_mh_execute_header, (uint64_t)"deinit", 6, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSPencilKitCanvasViewController.swift", 105, 2, 105, "CRLiOSPencilKitCanvasViewController must be torn down before deinit.", 68, 2u, (uint64_t)_swiftEmptyArrayStorage);
    sub_1004F5394((uint64_t)_swiftEmptyArrayStorage, (uint64_t)"deinit", 6, 2u, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSPencilKitCanvasViewController.swift", 105, 2u, 105, (uint64_t)"CRLiOSPencilKitCanvasViewController must be torn down before deinit.", 68, 2u);
  }
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for CRLiOSPencilKitCanvasViewController();
  -[CRLiOSPencilKitCanvasViewController dealloc](&v4, "dealloc");
}

- (void).cxx_destruct
{
  sub_1006F2BD4((uint64_t)self + OBJC_IVAR____TtC8Freeform35CRLiOSPencilKitCanvasViewController_delegate, (uint64_t)a2);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC8Freeform35CRLiOSPencilKitCanvasViewController_observedToolkit);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform35CRLiOSPencilKitCanvasViewController_smartSelectionManager));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform35CRLiOSPencilKitCanvasViewController_smartSelectionView));
}

- (PKCanvasView)pencilKitCanvasView
{
  _TtC8Freeform35CRLiOSPencilKitCanvasViewController *v2;
  PKCanvasView *result;
  PKCanvasView *v4;
  uint64_t v5;

  v2 = self;
  result = (PKCanvasView *)-[CRLiOSPencilKitCanvasViewController view](v2, "view");
  if (result)
  {
    v4 = result;

    v5 = objc_opt_self(PKCanvasView);
    return (PKCanvasView *)(id)swift_dynamicCastObjCClassUnconditional(v4, v5, 0, 0, 0);
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (CRLFreehandDrawingPKSelectionManager)smartSelectionManager
{
  return (CRLFreehandDrawingPKSelectionManager *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                         + OBJC_IVAR____TtC8Freeform35CRLiOSPencilKitCanvasViewController_smartSelectionManager));
}

- (void)setSmartSelectionManager:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8Freeform35CRLiOSPencilKitCanvasViewController_smartSelectionManager);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8Freeform35CRLiOSPencilKitCanvasViewController_smartSelectionManager) = (Class)a3;
  v3 = a3;

}

- (UIView)smartSelectionView
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                           + OBJC_IVAR____TtC8Freeform35CRLiOSPencilKitCanvasViewController_smartSelectionView));
}

- (void)setSmartSelectionView:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8Freeform35CRLiOSPencilKitCanvasViewController_smartSelectionView);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8Freeform35CRLiOSPencilKitCanvasViewController_smartSelectionView) = (Class)a3;
  v3 = a3;

}

- (void)loadView
{
  _TtC8Freeform35CRLiOSPencilKitCanvasViewController *v2;

  v2 = self;
  CRLiOSPencilKitCanvasViewController.loadView()();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC8Freeform35CRLiOSPencilKitCanvasViewController *v4;

  v4 = self;
  CRLiOSPencilKitCanvasViewController.viewWillAppear(_:)(a3);

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC8Freeform35CRLiOSPencilKitCanvasViewController *v4;

  v4 = self;
  CRLiOSPencilKitCanvasViewController.viewDidAppear(_:)(a3);

}

- (id)rulerEdgePathInUnscaledSpaceForTopOfRuler:(BOOL)a3
{
  _TtC8Freeform35CRLiOSPencilKitCanvasViewController *v4;
  id v5;

  v4 = self;
  v5 = sub_1006F107C(a3);

  return v5;
}

- (CRLBezierPath)unscaledRulerBezierPath
{
  _TtC8Freeform35CRLiOSPencilKitCanvasViewController *v2;
  id v3;

  v2 = self;
  v3 = sub_1006F124C();

  return (CRLBezierPath *)v3;
}

- (_TtC8Freeform35CRLiOSPencilKitCanvasViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC8Freeform35CRLiOSPencilKitCanvasViewController *result;

  v4 = a4;
  result = (_TtC8Freeform35CRLiOSPencilKitCanvasViewController *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLiOSPencilKitCanvasViewController", 44, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void)_canvasView:(id)a3 didChangeHiddenState:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  _TtC8Freeform35CRLiOSPencilKitCanvasViewController *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *Strong;

  v4 = a4;
  v6 = a3;
  v7 = self;
  v8 = -[CRLiOSPencilKitCanvasViewController view](v7, "view");
  if (v8)
  {
    v9 = v8;
    objc_msgSend(v8, "setHidden:", v4);

    Strong = (void *)swift_unknownObjectUnownedLoadStrong((char *)v7 + OBJC_IVAR____TtC8Freeform35CRLiOSPencilKitCanvasViewController_delegate, v10);
    objc_msgSend(Strong, "pencilKitViewWantsSuppressedFreehandContent:forPencilKitCanvasViewController:", v4 ^ 1, v7);

    swift_unknownObjectRelease(Strong);
  }
  else
  {
    __break(1u);
  }
}

- (id)_canvasViewRulerHostingView:(id)a3
{
  return sub_1006F24C4((char *)self, (uint64_t)a2, a3, (SEL *)&selRef_pencilKitRulerHostingViewForPencilKitCanvasViewController_);
}

- (void)_canvasView:(id)a3 beganStroke:(id)a4
{
  sub_1006F1C9C(self, (uint64_t)a2, a3, a4, (SEL *)&selRef_prepareForPencilKitBeganStroke_);
}

- (void)_canvasView:(id)a3 endedStroke:(id)a4 shapeStrokes:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  id v14;
  _TtC8Freeform35CRLiOSPencilKitCanvasViewController *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *Strong;
  uint64_t v20;

  v9 = type metadata accessor for PKStroke(0, a2);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = a3;
  v14 = a4;
  v15 = self;
  v16 = a5;
  static PKStroke._unconditionallyBridgeFromObjectiveC(_:)(a4);

  if (v16)
  {
    v18 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v16, v9);

  }
  else
  {
    v18 = 0;
  }
  Strong = (void *)swift_unknownObjectUnownedLoadStrong((char *)v15 + OBJC_IVAR____TtC8Freeform35CRLiOSPencilKitCanvasViewController_delegate, v17);
  objc_msgSend(Strong, "prepareForPencilKitEndingOrCancellingStroke:", v15);

  swift_bridgeObjectRelease(v18);
  swift_unknownObjectRelease(Strong);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void)_canvasView:(id)a3 cancelledStroke:(id)a4
{
  sub_1006F1C9C(self, (uint64_t)a2, a3, a4, (SEL *)&selRef_prepareForPencilKitEndingOrCancellingStroke_);
}

- (BOOL)_canvasView:(id)a3 hoverShouldBeActiveAt:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  _TtC8Freeform35CRLiOSPencilKitCanvasViewController *v8;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  v8 = self;
  LOBYTE(self) = CRLiOSPencilKitCanvasViewController._canvasView(_:hoverShouldBeActiveAt:)(v7, x, y);

  return self & 1;
}

- (void)_canvasViewWillCreateSnapshot:(id)a3
{
  id v4;
  _TtC8Freeform35CRLiOSPencilKitCanvasViewController *v5;

  v4 = a3;
  v5 = self;
  _s8Freeform35CRLiOSPencilKitCanvasViewControllerC07_canvasF18WillCreateSnapshotyySo08PKCanvasF0CF_0();

}

- (void)toolkitDidUpdateCurrentToolSelection
{
  _TtC8Freeform35CRLiOSPencilKitCanvasViewController *v2;

  v2 = self;
  CRLiOSPencilKitCanvasViewController.toolkitDidUpdateCurrentToolSelection()();

}

- (void)installSmartSelectionView:(id)a3 forPKSelectionManager:(id)a4
{
  id v7;
  id v8;
  _TtC8Freeform35CRLiOSPencilKitCanvasViewController *v9;

  v7 = a3;
  v8 = a4;
  v9 = self;
  _s8Freeform35CRLiOSPencilKitCanvasViewControllerC021installSmartSelectionF0_3forySo6UIViewCSg_So36CRLFreehandDrawingPKSelectionManagerCtF_0(a3);

}

- (id)pencilKitCanvasViewForPKSelectionManager:(id)a3
{
  id v4;
  _TtC8Freeform35CRLiOSPencilKitCanvasViewController *v5;
  id result;
  id v7;
  uint64_t v8;

  v4 = a3;
  v5 = self;
  result = -[CRLiOSPencilKitCanvasViewController view](v5, "view");
  if (result)
  {
    v7 = result;

    v8 = objc_opt_self(PKCanvasView);
    return (id)swift_dynamicCastObjCClassUnconditional(v7, v8, 0, 0, 0);
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (id)interactiveCanvasControllerForPKSelectionManager:(id)a3
{
  return sub_1006F24C4((char *)self, (uint64_t)a2, a3, (SEL *)&selRef_interactiveCanvasControllerForPencilKitCanvasViewController_);
}

- (id)currentDocumentModeForPKSelectionManager:(id)a3
{
  id v4;
  _TtC8Freeform35CRLiOSPencilKitCanvasViewController *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = _s8Freeform35CRLiOSPencilKitCanvasViewControllerC19currentDocumentMode3forSo0b10OSDocumentJ0CSgSo36CRLFreehandDrawingPKSelectionManagerC_tF_0();

  return v6;
}

- (void)removeSmartSelectionViewIfNecessary
{
  uint64_t v2;
  void *v3;
  _TtC8Freeform35CRLiOSPencilKitCanvasViewController *v5;
  id v6;

  v2 = OBJC_IVAR____TtC8Freeform35CRLiOSPencilKitCanvasViewController_smartSelectionView;
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8Freeform35CRLiOSPencilKitCanvasViewController_smartSelectionView);
  if (v3)
  {
    v5 = self;
    objc_msgSend(v3, "removeFromSuperview");
    v6 = *(Class *)((char *)&self->super.super.super.isa + v2);
    *(Class *)((char *)&self->super.super.super.isa + v2) = 0;

  }
}

@end
