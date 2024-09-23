@implementation CRLiOSPencilMediator

- (_TtC8Freeform20CRLiOSPencilMediator)initWithInteractiveCanvasController:(id)a3
{
  return (_TtC8Freeform20CRLiOSPencilMediator *)CRLiOSPencilMediator.init(interactiveCanvasController:)(a3);
}

- (_TtC8Freeform20CRLiOSPencilMediator)init
{
  sub_10066C414();
}

- (void)teardown
{
  _TtC8Freeform20CRLiOSPencilMediator *v2;

  v2 = self;
  CRLiOSPencilMediator.teardown()();

}

- (void)dealloc
{
  objc_class *ObjectType;
  char v4;
  _TtC8Freeform20CRLiOSPencilMediator *v5;
  objc_super v6;

  ObjectType = (objc_class *)swift_getObjectType(self);
  v4 = *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform20CRLiOSPencilMediator_wasTeardownCalled);
  v5 = self;
  if ((v4 & 1) == 0)
  {
    sub_100757E04(&_mh_execute_header, (uint64_t)"deinit", 6, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLiOSPencilMediator.swift", 91, 2, 54, "Must call teardown() before CRLiOSPencilMediator is deinitialized.", 66, 2u, (uint64_t)_swiftEmptyArrayStorage);
    sub_1004F5394((uint64_t)_swiftEmptyArrayStorage, (uint64_t)"deinit", 6, 2u, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLiOSPencilMediator.swift", 91, 2u, 54, (uint64_t)"Must call teardown() before CRLiOSPencilMediator is deinitialized.", 66, 2u);
  }
  v6.receiver = v5;
  v6.super_class = ObjectType;
  -[CRLiOSPencilMediator dealloc](&v6, "dealloc");
}

- (void).cxx_destruct
{
  swift_unknownObjectUnownedDestroy((char *)self + OBJC_IVAR____TtC8Freeform20CRLiOSPencilMediator_icc, a2);
  swift_bridgeObjectRelease(*(_QWORD *)&self->icc[OBJC_IVAR____TtC8Freeform20CRLiOSPencilMediator_prefersPencilOnlyDrawingKeyPath]);
}

- (BOOL)prefersPencilOnlyDrawing
{
  return objc_msgSend((id)objc_opt_self(UIPencilInteraction), "prefersPencilOnlyDrawing");
}

- (void)setCurrentPencilModeType:(unint64_t)a3
{
  _TtC8Freeform20CRLiOSPencilMediator *v4;

  v4 = self;
  CRLiOSPencilMediator.setCurrentPencilModeType(_:)(a3);

}

- (void)setNextPencilModeType:(unint64_t)a3
{
  _TtC8Freeform20CRLiOSPencilMediator *v4;

  v4 = self;
  if (a3)
  {
    sub_10066CAA8(a3);
  }
  else
  {
    sub_100757E04(&_mh_execute_header, (uint64_t)"setNextPencilModeType(_:)", 25, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLiOSPencilMediator.swift", 91, 2, 113, "Should not call setNextPencilModeType() with modeType none.", 59, 2u, (uint64_t)_swiftEmptyArrayStorage);
    sub_1004F5394((uint64_t)_swiftEmptyArrayStorage, (uint64_t)"setNextPencilModeType(_:)", 25, 2u, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLiOSPencilMediator.swift", 91, 2u, 113, (uint64_t)"Should not call setNextPencilModeType() with modeType none.", 59, 2u);
  }

}

- (void)markPencilUsedForMode:(unint64_t)a3
{
  _TtC8Freeform20CRLiOSPencilMediator *v4;

  v4 = self;
  CRLiOSPencilMediator.markPencilUsed(for:)(a3);

}

- (void)fingerUsedForFreehandDrawingMode
{
  _TtC8Freeform20CRLiOSPencilMediator *v2;

  v2 = self;
  CRLiOSPencilMediator.fingerUsedForFreehandDrawingMode()();

}

- (void)indirectTouchUsedForFreehandDrawingMode
{
  _TtC8Freeform20CRLiOSPencilMediator *v2;

  v2 = self;
  CRLiOSPencilMediator.indirectTouchUsedForFreehandDrawingMode()();

}

- (unint64_t)pencilModeToBeginFromToolbarItem
{
  _TtC8Freeform20CRLiOSPencilMediator *v2;
  unint64_t v3;

  v2 = self;
  v3 = CRLiOSPencilMediator.pencilModeToBeginFromToolbarItem.getter();

  return v3;
}

- (unint64_t)pencilBehaviorOutsideModesAtUnscaledPoint:(CGPoint)a3
{
  _TtC8Freeform20CRLiOSPencilMediator *v3;
  unint64_t v4;
  unint64_t v5;

  v3 = self;
  CRLiOSPencilMediator.pencilBehaviorOutsideModes(at:)();
  v5 = v4;

  return v5;
}

- (BOOL)shouldAllowPencilKitHoverPreviewAtUnscaledPoint:(CGPoint)a3
{
  _TtC8Freeform20CRLiOSPencilMediator *v3;
  BOOL v4;

  v3 = self;
  v4 = CRLiOSPencilMediator.shouldAllowPencilKitHoverPreview(at:)();

  return v4;
}

- (BOOL)shouldAllowNativeHoverPreviewAtUnscaledPoint:(CGPoint)a3
{
  _TtC8Freeform20CRLiOSPencilMediator *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = self;
  sub_10066D658();
  v5 = v4;

  return (unint64_t)(v5 - 1) < 2;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  _TtC8Freeform20CRLiOSPencilMediator *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  objc_class *v18;
  id v19;
  _TtC8Freeform20CRLiOSPencilMediator *v20;
  _OWORD v21[2];

  if (a3)
  {
    v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v12 = v11;
    if (a4)
      goto LABEL_3;
LABEL_6:
    memset(v21, 0, sizeof(v21));
    v19 = a5;
    v20 = self;
    if (a5)
      goto LABEL_4;
LABEL_7:
    v18 = 0;
    goto LABEL_8;
  }
  v10 = 0;
  v12 = 0;
  if (!a4)
    goto LABEL_6;
LABEL_3:
  swift_unknownObjectRetain(a4);
  v13 = a5;
  v14 = self;
  _bridgeAnyObjectToAny(_:)(v21, a4);
  swift_unknownObjectRelease(a4);
  if (!a5)
    goto LABEL_7;
LABEL_4:
  type metadata accessor for NSKeyValueChangeKey(0);
  v16 = v15;
  v17 = sub_10066E23C();
  v18 = (objc_class *)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a5, v16, (char *)&type metadata for Any + 8, v17);

LABEL_8:
  CRLiOSPencilMediator.observeValue(forKeyPath:of:change:context:)(v10, v12, (uint64_t)v21, v18, (uint64_t)a6);

  swift_bridgeObjectRelease(v18);
  swift_bridgeObjectRelease(v12);
  sub_1004D28EC((uint64_t)v21);
}

@end
