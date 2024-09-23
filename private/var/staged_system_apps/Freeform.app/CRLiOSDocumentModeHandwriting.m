@implementation CRLiOSDocumentModeHandwriting

- (_TtC8Freeform29CRLiOSDocumentModeHandwriting)initWithBoardViewController:(id)a3
{
  id v4;
  _TtC8Freeform29CRLiOSDocumentModeHandwriting *result;

  *((_BYTE *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform29CRLiOSDocumentModeHandwriting_currentlyChangingModes) = 0;
  *((_BYTE *)&self->super.super.isa
  + OBJC_IVAR____TtC8Freeform29CRLiOSDocumentModeHandwriting_stayInHandwritingModeForSelectionChange) = 0;
  *((_BYTE *)&self->super.super.isa
  + OBJC_IVAR____TtC8Freeform29CRLiOSDocumentModeHandwriting_endModeCheckQueuedAfterTextGestures) = 0;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform29CRLiOSDocumentModeHandwriting_subscriptions) = (Class)&_swiftEmptySetSingleton;
  v4 = a3;

  result = (_TtC8Freeform29CRLiOSDocumentModeHandwriting *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD00000000000006FLL, 0x8000000100FAF640, "Freeform/CRLiOSDocumentModeHandwriting.swift", 44, 2, 27, 0);
  __break(1u);
  return result;
}

- (BOOL)isEqual:(id)a3
{
  _TtC8Freeform29CRLiOSDocumentModeHandwriting *v5;
  uint64_t v6;
  _TtC8Freeform29CRLiOSDocumentModeHandwriting *v7;
  BOOL v8;
  _OWORD v10[2];

  if (a3)
  {
    v5 = self;
    v6 = swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v10, v6);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    v7 = self;
  }
  v8 = CRLiOSDocumentModeHandwriting.isEqual(_:)((uint64_t)v10);

  sub_1004D28EC((uint64_t)v10);
  return v8;
}

- (unint64_t)hash
{
  return 23;
}

- (unint64_t)pencilModeType
{
  return 2;
}

- (CRLiOSToolTrayProviding)toolTray
{
  _TtC8Freeform29CRLiOSDocumentModeHandwriting *v2;
  char *v3;

  v2 = self;
  v3 = CRLiOSDocumentModeHandwriting.toolTray.getter();

  return (CRLiOSToolTrayProviding *)v3;
}

- (BOOL)wantsDoneButtonInCompact
{
  return 1;
}

- (void)modeWillBeginFromMode:(id)a3 forced:(BOOL)a4
{
  _BOOL8 v4;
  objc_class *v6;
  _TtC8Freeform29CRLiOSDocumentModeHandwriting *v7;
  char v8;
  CRLiOSDocumentMode v9;
  _TtC8Freeform29CRLiOSDocumentModeHandwriting *v10;

  v4 = a4;
  v6 = (objc_class *)a3;
  v7 = self;
  v8 = (char)v7;
  v10 = v7;
  v9.super.isa = v6;
  v9._boardViewController = (_TtC8Freeform25CRLiOSBoardViewController *)v4;
  CRLiOSDocumentModeHandwriting.modeWillBegin(from:forced:)(v9, v8);

}

- (void)modeDidBeginFromMode:(id)a3 forced:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  objc_super v8;

  v4 = a4;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for CRLiOSDocumentModeHandwriting();
  v6 = a3;
  v7 = v8.receiver;
  -[CRLiOSDocumentMode modeDidBeginFromMode:forced:](&v8, "modeDidBeginFromMode:forced:", v6, v4);
  sub_1004F40F4();

}

- (void)modeWillEndForMode:(id)a3 forced:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t *v7;
  uint64_t v8;
  id v9;
  _TtC8Freeform29CRLiOSDocumentModeHandwriting *v10;
  _TtC8Freeform25CRLiOSBoardViewController *v11;
  _TtC8Freeform25CRLiOSBoardViewController *v12;
  id v13;
  objc_super v14;
  char v15[24];

  v4 = a4;
  v7 = (uint64_t *)((char *)self + OBJC_IVAR____TtC8Freeform29CRLiOSDocumentModeHandwriting_subscriptions);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC8Freeform29CRLiOSDocumentModeHandwriting_subscriptions, v15, 1, 0);
  v8 = *v7;
  *v7 = (uint64_t)&_swiftEmptySetSingleton;
  v9 = a3;
  v10 = self;
  v11 = -[CRLiOSDocumentMode boardViewController](v10, "boardViewController", swift_bridgeObjectRelease(v8).n128_f64[0]);
  if (v11)
  {
    v12 = v11;
    v13 = sub_100C1CAE8();

    objc_msgSend(v13, "removeModeObserver:", v10);
    v14.receiver = v10;
    v14.super_class = (Class)type metadata accessor for CRLiOSDocumentModeHandwriting();
    -[CRLiOSDocumentMode modeWillEndForMode:forced:](&v14, "modeWillEndForMode:forced:", v9, v4);

  }
  else
  {
    __break(1u);
  }
}

- (BOOL)wantsCanvasInRestrictedGestureMode
{
  return 1;
}

- (BOOL)shouldAllowTextGesturesInRestrictedGestureMode
{
  return 1;
}

- (BOOL)wantsToEndForNonPopoverPresentations
{
  return 1;
}

- (BOOL)wantsToEndForDragAndDropInteractions
{
  return 1;
}

- (BOOL)shouldSuppressKeyboard
{
  void *Strong;
  _TtC8Freeform29CRLiOSDocumentModeHandwriting *v5;
  unsigned __int8 v6;

  if ((*((_BYTE *)&self->super.super.isa
        + OBJC_IVAR____TtC8Freeform29CRLiOSDocumentModeHandwriting_currentlyChangingModes) & 1) != 0)
    return 1;
  Strong = (void *)swift_unknownObjectUnownedLoadStrong((char *)self + OBJC_IVAR____TtC8Freeform29CRLiOSDocumentModeHandwriting_icc, a2);
  v5 = self;
  v6 = objc_msgSend(Strong, "textGesturesInFlight");

  return v6;
}

- (BOOL)allowGestureInRestrictedGestureMode:(id)a3
{
  id v4;
  _TtC8Freeform29CRLiOSDocumentModeHandwriting *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = CRLiOSDocumentModeHandwriting.restrictedGestureModeShouldAllowGesture(_:)((UIGestureRecognizer)v4);

  return self & 1;
}

- (BOOL)allowedToEnterQuickSelectModeForCanvasViewController:(id)a3
{
  return 0;
}

- (void)didSetDocumentToMode:(id)a3 fromMode:(id)a4 animated:(BOOL)a5
{
  *((_BYTE *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform29CRLiOSDocumentModeHandwriting_currentlyChangingModes) = 0;
}

- (void)willSetDocumentToMode:(id)a3 fromMode:(id)a4 animated:(BOOL)a5
{
  *((_BYTE *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform29CRLiOSDocumentModeHandwriting_currentlyChangingModes) = 1;
}

- (void)performBlockIgnoringSelectionChangesToExitHandwritingMode:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  void (*v6)(_QWORD *);
  _TtC8Freeform29CRLiOSDocumentModeHandwriting *v7;

  v4 = _Block_copy(a3);
  v5 = OBJC_IVAR____TtC8Freeform29CRLiOSDocumentModeHandwriting_stayInHandwritingModeForSelectionChange;
  *((_BYTE *)&self->super.super.isa
  + OBJC_IVAR____TtC8Freeform29CRLiOSDocumentModeHandwriting_stayInHandwritingModeForSelectionChange) = 1;
  v6 = (void (*)(_QWORD *))v4[2];
  v7 = self;
  v6(v4);
  *((_BYTE *)&self->super.super.isa + v5) = 0;
  _Block_release(v4);

}

- (BOOL)handleTapOnCanvasBackgroundAtUnscaledPoint:(CGPoint)a3
{
  _TtC8Freeform29CRLiOSDocumentModeHandwriting *v3;
  _TtC8Freeform25CRLiOSBoardViewController *v4;
  _TtC8Freeform25CRLiOSBoardViewController *v5;
  id v6;

  v3 = self;
  v4 = -[CRLiOSDocumentMode boardViewController](v3, "boardViewController");
  if (v4)
  {
    v5 = v4;
    v6 = sub_100C1CAE8();

    objc_msgSend(v6, "resetToDefaultModeAnimated:", 1);
    LOBYTE(v4) = 0;
  }
  else
  {
    __break(1u);
  }
  return (char)v4;
}

- (void).cxx_destruct
{
  swift_unknownObjectUnownedDestroy((char *)self + OBJC_IVAR____TtC8Freeform29CRLiOSDocumentModeHandwriting_icc, a2);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.isa
                                     + OBJC_IVAR____TtC8Freeform29CRLiOSDocumentModeHandwriting_subscriptions));
}

@end
