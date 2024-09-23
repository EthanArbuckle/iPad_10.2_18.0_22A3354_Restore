@implementation CanvasViewSelectionInteractionDelegate

- (BOOL)selectionInteraction:(id)a3 handleLassoSelection:(id)a4 strokes:(id)a5 inAttachment:(id)a6
{
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  _TtC8PaperKit38CanvasViewSelectionInteractionDelegate *v14;

  type metadata accessor for UUID();
  lazy protocol witness table accessor for type NSAttributedStringKey and conformance NSAttributedStringKey((unint64_t *)&lazy protocol witness table cache variable for type UUID and conformance UUID, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], MEMORY[0x1E0CB09C8]);
  v10 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  v11 = a3;
  v12 = a4;
  v13 = a6;
  v14 = self;
  LOBYTE(a4) = specialized CanvasViewSelectionInteractionDelegate.selectionInteraction(_:handleLassoSelection:strokes:inAttachment:)(a4, v10);

  swift_bridgeObjectRelease();
  return a4 & 1;
}

- (BOOL)selectionInteractionShouldBegin:(id)a3 atPoint:(CGPoint)a4 forEvent:(id)a5 orGestureRecognizer:(id)a6
{
  double y;
  double x;
  id v11;
  id v12;
  id v13;
  _TtC8PaperKit38CanvasViewSelectionInteractionDelegate *v14;
  char v15;

  y = a4.y;
  x = a4.x;
  v11 = a3;
  v12 = a5;
  v13 = a6;
  v14 = self;
  CanvasViewSelectionInteractionDelegate.selectionInteractionShouldBegin(_:at:for:orGestureRecognizer:)(v11, (unint64_t)a5, (unint64_t)a6, x, y);
  LOBYTE(a6) = v15;

  return a6 & 1;
}

- (BOOL)selectionInteractionShouldForwardToElements:(id)a3 atPoint:(CGPoint)a4 forEvent:(id)a5
{
  double y;
  double x;
  id v9;
  id v10;
  _TtC8PaperKit38CanvasViewSelectionInteractionDelegate *v11;

  y = a4.y;
  x = a4.x;
  v9 = a3;
  v10 = a5;
  v11 = self;
  LOBYTE(a5) = CanvasViewSelectionInteractionDelegate.selectionInteractionShouldForwardToElements(_:at:for:)(v9, a5, x, y);

  return a5 & 1;
}

- (id)selectionInteraction:(id)a3 requestElementsInRect:(CGRect)a4 inAttachment:(id)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v11;
  id v12;
  _TtC8PaperKit38CanvasViewSelectionInteractionDelegate *v13;
  uint64_t v14;
  NSArray v15;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v11 = a3;
  v12 = a5;
  v13 = self;
  v14 = specialized CanvasViewSelectionInteractionDelegate.selectionInteraction(_:requestElementsIn:inAttachment:)(x, y, width, height);

  if (v14)
  {
    v15.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v15.super.isa = 0;
  }
  return v15.super.isa;
}

- (id)selectionInteraction:(id)a3 requestElementsInPath:(id)a4 inAttachment:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC8PaperKit38CanvasViewSelectionInteractionDelegate *v11;
  uint64_t v12;
  NSArray v13;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  v12 = specialized CanvasViewSelectionInteractionDelegate.selectionInteraction(_:requestElementsIn:inAttachment:)(v9);

  if (v12)
  {
    v13.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v13.super.isa = 0;
  }
  return v13.super.isa;
}

- (const)selectionInteraction:(id)a3 pathForElement:(id)a4 inAttachment:(id)a5
{
  id v7;
  _TtC8PaperKit38CanvasViewSelectionInteractionDelegate *v8;
  _TtC8PaperKit38CanvasViewSelectionInteractionDelegate *v9;
  _TtC8PaperKit38CanvasViewSelectionInteractionDelegate *v10;
  _TtC8PaperKit38CanvasViewSelectionInteractionDelegate *v11;
  CGPathRef v12;
  char v14[24];
  ValueMetadata *v15;
  unint64_t v16;
  _BYTE v17[32];
  CGRect v18;

  v7 = a3;
  swift_unknownObjectRetain();
  v8 = (_TtC8PaperKit38CanvasViewSelectionInteractionDelegate *)a5;
  v9 = self;
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  v15 = &type metadata for PencilAndPaperFeatureFlags;
  v16 = lazy protocol witness table accessor for type PencilAndPaperFeatureFlags and conformance PencilAndPaperFeatureFlags();
  v14[0] = 0;
  LOBYTE(a5) = isFeatureEnabled(_:)();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
  if ((a5 & 1) != 0
    || (v10 = (_TtC8PaperKit38CanvasViewSelectionInteractionDelegate *)CanvasViewSelectionInteractionDelegate.view(for:)((uint64_t)v17)) == 0)
  {
    v18.origin.x = 0.0;
    v18.origin.y = 0.0;
    v18.size.width = 0.0;
    v18.size.height = 0.0;
    v12 = CGPathCreateWithRect(v18, 0);
  }
  else
  {
    v11 = v10;
    v12 = (CGPathRef)(*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & (uint64_t)v10->super.isa) + 0x1D8))();

    v8 = v9;
    v9 = v11;
  }

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v17);
  return v12;
}

- (void)selectionInteraction:(id)a3 didSelectElements:(id)a4 inAttachment:(id)a5
{
  uint64_t v8;
  id v9;
  id v10;
  _TtC8PaperKit38CanvasViewSelectionInteractionDelegate *v11;

  v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v9 = a3;
  v10 = a5;
  v11 = self;
  specialized CanvasViewSelectionInteractionDelegate.selectionInteraction(_:didSelectElements:inAttachment:)(v9, v8);

  swift_bridgeObjectRelease();
}

- (void)selectionInteraction:(id)a3 didDragElements:(id)a4 withTransform:(CGAffineTransform *)a5 inAttachment:(id)a6
{
  __int128 v9;
  uint64_t v10;
  id v11;
  id v12;
  _TtC8PaperKit38CanvasViewSelectionInteractionDelegate *v13;
  _OWORD v14[3];

  v9 = *(_OWORD *)&a5->c;
  v14[0] = *(_OWORD *)&a5->a;
  v14[1] = v9;
  v14[2] = *(_OWORD *)&a5->tx;
  v10 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v11 = a3;
  v12 = a6;
  v13 = self;
  specialized CanvasViewSelectionInteractionDelegate.selectionInteraction(_:didDragElements:with:inAttachment:)(v10, (CGFloat *)v14);

  swift_bridgeObjectRelease();
}

- (void)selectionInteraction:(id)a3 didEndDraggingElements:(id)a4 inAttachment:(id)a5
{
  @objc CanvasViewSelectionInteractionDelegate.selectionInteraction(_:didEndDraggingElements:inAttachment:)(self, (uint64_t)a2, a3, (uint64_t)a4, a5, specialized CanvasViewSelectionInteractionDelegate.selectionInteraction(_:didEndDraggingElements:inAttachment:));
}

- (void)selectionInteraction:(id)a3 willBeginInsertSpaceInAttachment:(id)a4
{
  _QWORD *v7;
  void *v8;
  _QWORD *v9;
  _TtC8PaperKit38CanvasViewSelectionInteractionDelegate *v10;
  _TtC8PaperKit38CanvasViewSelectionInteractionDelegate *v11;
  _TtC8PaperKit38CanvasViewSelectionInteractionDelegate *v12;
  _TtC8PaperKit38CanvasViewSelectionInteractionDelegate *v13;

  v7 = (_QWORD *)MEMORY[0x1DF0E666C]((char *)self + OBJC_IVAR____TtC8PaperKit38CanvasViewSelectionInteractionDelegate_containerView, a2);
  if (v7)
  {
    v8 = v7;
    v9 = (_QWORD *)MEMORY[0x1E0DEEDD8];
    v10 = (_TtC8PaperKit38CanvasViewSelectionInteractionDelegate *)(*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v7)
                                                                                        + 0x88))();
    v11 = (_TtC8PaperKit38CanvasViewSelectionInteractionDelegate *)a3;
    v12 = (_TtC8PaperKit38CanvasViewSelectionInteractionDelegate *)a4;
    v13 = self;

    if (v10)
    {
      (*(void (**)(void))((*v9 & (uint64_t)v10->super.isa) + 0x588))();

      v11 = v12;
      v12 = v13;
      v13 = v10;
    }

  }
}

- (void)selectionInteraction:(id)a3 insertSpaceDidMove:(double)a4 inAttachment:(id)a5
{
  _QWORD *v9;
  void *v10;
  _QWORD *v11;
  _TtC8PaperKit38CanvasViewSelectionInteractionDelegate *v12;
  _TtC8PaperKit38CanvasViewSelectionInteractionDelegate *v13;
  _TtC8PaperKit38CanvasViewSelectionInteractionDelegate *v14;
  _TtC8PaperKit38CanvasViewSelectionInteractionDelegate *v15;

  v9 = (_QWORD *)MEMORY[0x1DF0E666C]((char *)self + OBJC_IVAR____TtC8PaperKit38CanvasViewSelectionInteractionDelegate_containerView, a2);
  if (v9)
  {
    v10 = v9;
    v11 = (_QWORD *)MEMORY[0x1E0DEEDD8];
    v12 = (_TtC8PaperKit38CanvasViewSelectionInteractionDelegate *)(*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v9)
                                                                                        + 0x88))();
    v13 = (_TtC8PaperKit38CanvasViewSelectionInteractionDelegate *)a3;
    v14 = (_TtC8PaperKit38CanvasViewSelectionInteractionDelegate *)a5;
    v15 = self;

    if (v12)
    {
      (*(void (**)(double))((*v11 & (uint64_t)v12->super.isa) + 0x590))(a4);

      v13 = v14;
      v14 = v15;
      v15 = v12;
    }

  }
}

- (void)selectionInteraction:(id)a3 didEndInsertSpaceInAttachment:(id)a4
{
  _QWORD *v7;
  void *v8;
  _QWORD *v9;
  _TtC8PaperKit38CanvasViewSelectionInteractionDelegate *v10;
  _TtC8PaperKit38CanvasViewSelectionInteractionDelegate *v11;
  _TtC8PaperKit38CanvasViewSelectionInteractionDelegate *v12;
  _TtC8PaperKit38CanvasViewSelectionInteractionDelegate *v13;

  v7 = (_QWORD *)MEMORY[0x1DF0E666C]((char *)self + OBJC_IVAR____TtC8PaperKit38CanvasViewSelectionInteractionDelegate_containerView, a2);
  if (v7)
  {
    v8 = v7;
    v9 = (_QWORD *)MEMORY[0x1E0DEEDD8];
    v10 = (_TtC8PaperKit38CanvasViewSelectionInteractionDelegate *)(*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v7)
                                                                                        + 0x88))();
    v11 = (_TtC8PaperKit38CanvasViewSelectionInteractionDelegate *)a3;
    v12 = (_TtC8PaperKit38CanvasViewSelectionInteractionDelegate *)a4;
    v13 = self;

    if (v10)
    {
      (*(void (**)(_QWORD))((*v9 & (uint64_t)v10->super.isa) + 0x598))(0);

      v11 = v12;
      v12 = v13;
      v13 = v10;
    }

  }
}

- (void)selectionInteraction:(id)a3 didClearSelectionForElements:(id)a4 inAttachment:(id)a5
{
  id v7;
  id v8;
  _TtC8PaperKit38CanvasViewSelectionInteractionDelegate *v9;

  v7 = a3;
  v8 = a5;
  v9 = self;
  specialized CanvasViewSelectionInteractionDelegate.selectionInteraction(_:didClearSelectionForElements:inAttachment:)();

}

- (BOOL)selectionInteraction:(id)a3 canPerformAction:(SEL)a4 withSender:(id)a5 inAttachment:(id)a6
{
  id v8;
  id v9;
  _TtC8PaperKit38CanvasViewSelectionInteractionDelegate *v10;
  char v11;
  uint64_t v13;

  v8 = a3;
  swift_unknownObjectRetain();
  v9 = a6;
  v10 = self;
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  v11 = specialized CanvasViewSelectionInteractionDelegate.selectionInteraction(_:canPerformAction:withSender:inAttachment:)();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v13);
  return v11 & 1;
}

- (id)selectionInteraction:(id)a3 pasteboardRepresentationsForElements:(id)a4 strokes:(id)a5 inAttachment:(id)a6
{
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  _TtC8PaperKit38CanvasViewSelectionInteractionDelegate *v13;
  uint64_t v14;
  NSArray v15;

  v9 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  type metadata accessor for UUID();
  lazy protocol witness table accessor for type NSAttributedStringKey and conformance NSAttributedStringKey((unint64_t *)&lazy protocol witness table cache variable for type UUID and conformance UUID, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], MEMORY[0x1E0CB09C8]);
  v10 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  v11 = a3;
  v12 = a6;
  v13 = self;
  v14 = specialized CanvasViewSelectionInteractionDelegate.selectionInteraction(_:pasteboardRepresentationsForElements:strokes:inAttachment:)(v9, v10);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v14)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : Any]);
    v15.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v15.super.isa = 0;
  }
  return v15.super.isa;
}

- (void)selectionInteractionDidPaste:(id)a3 atPoint:(CGPoint)a4 inAttachment:(id)a5
{
  double y;
  double x;
  id v9;
  id v10;
  _TtC8PaperKit38CanvasViewSelectionInteractionDelegate *v11;

  y = a4.y;
  x = a4.x;
  v9 = a3;
  v10 = a5;
  v11 = self;
  specialized CanvasViewSelectionInteractionDelegate.selectionInteractionDidPaste(_:at:in:)(x, y);

}

- (void)selectionInteraction:(id)a3 didDeleteElements:(id)a4 inAttachment:(id)a5
{
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t ObjectType;
  id v13;
  id v14;
  _TtC8PaperKit38CanvasViewSelectionInteractionDelegate *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;

  v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v9 = (char *)self + OBJC_IVAR____TtC8PaperKit38CanvasViewSelectionInteractionDelegate_containerView;
  v10 = MEMORY[0x1DF0E666C]((char *)self + OBJC_IVAR____TtC8PaperKit38CanvasViewSelectionInteractionDelegate_containerView);
  if (v10)
  {
    v11 = *((_QWORD *)v9 + 1);
    v19 = (id)v10;
    ObjectType = swift_getObjectType();
    v13 = a3;
    v14 = a5;
    v15 = self;
    v16 = specialized _arrayForceCast<A, B>(_:)(v8);
    v17 = specialized Set.init<A>(_:)(v16);
    swift_bridgeObjectRelease();
    v18 = specialized Set.init<A>(_:)(MEMORY[0x1E0DEE9D8]);
    (*(void (**)(uint64_t, uint64_t, uint64_t, _QWORD, uint64_t, uint64_t))(v11 + 88))(v17, v18, 6, 0, ObjectType, v11);

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

  }
  else
  {
    swift_bridgeObjectRelease();
  }
}

- (id)selectionInteraction:(id)a3 didDuplicateElements:(id)a4 inAttachment:(id)a5
{
  uint64_t v8;
  id v9;
  id v10;
  _TtC8PaperKit38CanvasViewSelectionInteractionDelegate *v11;
  uint64_t v12;
  NSArray v13;

  v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v9 = a3;
  v10 = a5;
  v11 = self;
  v12 = specialized CanvasViewSelectionInteractionDelegate.selectionInteraction(_:didDuplicateElements:inAttachment:)(v8);

  swift_bridgeObjectRelease();
  if (v12)
  {
    v13.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v13.super.isa = 0;
  }
  return v13.super.isa;
}

- (id)selectionInteraction:(id)a3 elementsForSpaceInsertedAtPoint:(CGPoint)a4 inAttachment:(id)a5
{
  CGFloat y;
  CGFloat x;
  id v9;
  id v10;
  _TtC8PaperKit38CanvasViewSelectionInteractionDelegate *v11;
  uint64_t v12;
  NSArray v13;

  y = a4.y;
  x = a4.x;
  v9 = a3;
  v10 = a5;
  v11 = self;
  v12 = specialized CanvasViewSelectionInteractionDelegate.selectionInteraction(_:elementsForSpaceInsertedAt:inAttachment:)(x, y);

  if (v12)
  {
    v13.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v13.super.isa = 0;
  }
  return v13.super.isa;
}

- (BOOL)selectionInteraction:(id)a3 selectionContainsPoint:(CGPoint)a4 inAttachment:(id)a5
{
  CGFloat y;
  CGFloat x;
  id v9;
  id v10;
  _TtC8PaperKit38CanvasViewSelectionInteractionDelegate *v11;
  char v12;

  y = a4.y;
  x = a4.x;
  v9 = a3;
  v10 = a5;
  v11 = self;
  v12 = specialized CanvasViewSelectionInteractionDelegate.selectionInteraction(_:selectionContains:inAttachment:)(x, y);

  return v12 & 1;
}

- (id)selectionInteraction:(id)a3 elementsInAttachment:(id)a4
{
  return @objc CanvasViewSelectionInteractionDelegate.selectionInteraction(_:elementsInAttachment:)(self, (uint64_t)a2, a3, a4, (uint64_t (*)(void))specialized CanvasViewSelectionInteractionDelegate.selectionInteraction(_:elementsInAttachment:));
}

- (id)selectionInteraction:(id)a3 selectedElementsInAttachment:(id)a4
{
  return @objc CanvasViewSelectionInteractionDelegate.selectionInteraction(_:elementsInAttachment:)(self, (uint64_t)a2, a3, a4, (uint64_t (*)(void))specialized CanvasViewSelectionInteractionDelegate.selectionInteraction(_:selectedElementsInAttachment:));
}

- (void)selectionInteraction:(id)a3 didSelectStrokes:(id)a4 selectionType:(int64_t)a5 inAttachment:(id)a6
{
  uint64_t v10;
  id v11;
  id v12;
  _TtC8PaperKit38CanvasViewSelectionInteractionDelegate *v13;

  type metadata accessor for PKStroke();
  v10 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v11 = a3;
  v12 = a6;
  v13 = self;
  specialized CanvasViewSelectionInteractionDelegate.selectionInteraction(_:didSelect:selectionType:inAttachment:)(v10, a5);

  swift_bridgeObjectRelease();
}

- (void)selectionInteraction:(id)a3 renderPreviewForElements:(id)a4 inContext:(CGContext *)a5 withConfig:(id)a6 inAttachment:(id)a7 withCompletion:(id)a8
{
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  CGContext *v17;
  id v18;
  id v19;
  _TtC8PaperKit38CanvasViewSelectionInteractionDelegate *v20;

  v13 = _Block_copy(a8);
  v14 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = v13;
  v16 = a3;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = self;
  specialized CanvasViewSelectionInteractionDelegate.selectionInteraction(_:renderPreviewForElements:in:with:inAttachment:withCompletion:)(v14, v17, v18, (uint64_t)partial apply for thunk for @escaping @callee_unowned @convention(block) () -> (), v15);

  swift_bridgeObjectRelease();
  swift_release();
}

- (void)selectionInteraction:(id)a3 dragInteractionWillBeginForElements:(id)a4 inAttachment:(id)a5
{
  @objc CanvasViewSelectionInteractionDelegate.selectionInteraction(_:didEndDraggingElements:inAttachment:)(self, (uint64_t)a2, a3, (uint64_t)a4, a5, (void (*)(uint64_t))specialized CanvasViewSelectionInteractionDelegate.selectionInteraction(_:dragInteractionWillBeginForElements:inAttachment:));
}

- (void)selectionInteraction:(id)a3 dragInteractionWillEndForElements:(id)a4 withOperation:(unint64_t)a5 inAttachment:(id)a6
{
  uint64_t v10;
  id v11;
  id v12;
  _TtC8PaperKit38CanvasViewSelectionInteractionDelegate *v13;

  v10 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v11 = a3;
  v12 = a6;
  v13 = self;
  specialized CanvasViewSelectionInteractionDelegate.selectionInteraction(_:dragInteractionWillEndForElements:with:inAttachment:)(v10, a5);

  swift_bridgeObjectRelease();
}

- (void)selectionInteraction:(id)a3 didDropItemProvider:(id)a4 inAttachment:(id)a5 withCompletion:(id)a6
{
  void *v10;
  id v11;
  id v12;
  id v13;
  _TtC8PaperKit38CanvasViewSelectionInteractionDelegate *v14;

  v10 = _Block_copy(a6);
  _Block_copy(v10);
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = self;
  specialized CanvasViewSelectionInteractionDelegate.selectionInteraction(_:didDrop:inAttachment:withCompletion:)(a4, (uint64_t)v14, (void (**)(_QWORD, _QWORD))v10);
  _Block_release(v10);
  _Block_release(v10);

}

- (void)selectionInteraction:(id)a3 didTapElement:(id)a4 withGesture:(id)a5 inAttachment:(id)a6
{
  id v9;
  id v10;
  id v11;
  _TtC8PaperKit38CanvasViewSelectionInteractionDelegate *v12;
  _BYTE v13[32];

  v9 = a3;
  swift_unknownObjectRetain();
  v10 = a5;
  v11 = a6;
  v12 = self;
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  specialized CanvasViewSelectionInteractionDelegate.selectionInteraction(_:didTapElement:withGesture:inAttachment:)((uint64_t)v13, v10);

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
}

- (BOOL)selectionInteraction:(id)a3 didLongPressElement:(id)a4 withGesture:(id)a5 inAttachment:(id)a6
{
  id v9;
  id v10;
  id v11;
  _TtC8PaperKit38CanvasViewSelectionInteractionDelegate *v12;
  char v13;
  _BYTE v15[32];

  v9 = a3;
  swift_unknownObjectRetain();
  v10 = a5;
  v11 = a6;
  v12 = self;
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  v13 = specialized CanvasViewSelectionInteractionDelegate.selectionInteraction(_:didLongPressElement:withGesture:inAttachment:)((uint64_t)v15, v10);

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
  return v13 & 1;
}

- (id)selectionInteraction:(id)a3 contextMenuInteraction:(id)a4 configurationForElement:(id)a5 inAttachment:(id)a6
{
  id v9;
  id v10;
  id v11;
  _TtC8PaperKit38CanvasViewSelectionInteractionDelegate *v12;
  id v13;
  _BYTE v15[32];

  v9 = a3;
  v10 = a4;
  swift_unknownObjectRetain();
  v11 = a6;
  v12 = self;
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  v13 = specialized CanvasViewSelectionInteractionDelegate.selectionInteraction(_:contextMenuInteraction:configurationForElement:inAttachment:)((uint64_t)v10, (uint64_t)v15);

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
  return v13;
}

- (id)selectionInteraction:(id)a3 contextMenuInteraction:(id)a4 previewForHighlightingMenuWithConfiguration:(id)a5 forElement:(id)a6 inAttachment:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  _TtC8PaperKit38CanvasViewSelectionInteractionDelegate *v15;
  id v16;
  _BYTE v18[32];

  v11 = a3;
  v12 = a4;
  v13 = a5;
  swift_unknownObjectRetain();
  v14 = a7;
  v15 = self;
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  v16 = specialized CanvasViewSelectionInteractionDelegate.selectionInteraction(_:contextMenuInteraction:previewForHighlightingMenuWith:forElement:inAttachment:)((uint64_t)v12, (uint64_t)v13, (uint64_t)v18);

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
  return v16;
}

- (void)selectionInteraction:(id)a3 contextMenuInteraction:(id)a4 willDisplayMenuForConfiguration:(id)a5 animator:(id)a6 forElement:(id)a7 inAttachment:(id)a8
{
  @objc CanvasViewSelectionInteractionDelegate.selectionInteraction(_:contextMenuInteraction:willDisplayMenuFor:animator:forElement:inAttachment:)(self, (uint64_t)a2, a3, a4, a5, (uint64_t)a6, (uint64_t)a7, a8, (SEL *)&selRef_contextMenuInteraction_willDisplayMenuForConfiguration_animator_);
}

- (void)selectionInteraction:(id)a3 contextMenuInteraction:(id)a4 willEndForConfiguration:(id)a5 animator:(id)a6 forElement:(id)a7 inAttachment:(id)a8
{
  @objc CanvasViewSelectionInteractionDelegate.selectionInteraction(_:contextMenuInteraction:willDisplayMenuFor:animator:forElement:inAttachment:)(self, (uint64_t)a2, a3, a4, a5, (uint64_t)a6, (uint64_t)a7, a8, (SEL *)&selRef_contextMenuInteraction_willEndForConfiguration_animator_);
}

- (void)selectionInteraction:(id)a3 handleDeleteForTextStrokes:(id)a4 inAttachment:(id)a5
{
  void *v8;
  id v9;
  id v10;
  _TtC8PaperKit38CanvasViewSelectionInteractionDelegate *v11;
  Swift::OpaquePointer v12;

  type metadata accessor for PKStroke();
  v8 = (void *)static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v9 = a3;
  v10 = a5;
  v11 = self;
  v12._rawValue = v8;
  specialized CanvasViewSelectionInteractionDelegate.selectionInteraction(_:handleDeleteForTextStrokes:inAttachment:)(v12);

  swift_bridgeObjectRelease();
}

- (void)selectionInteraction:(id)a3 handleGenerationToolForSelectedStrokes:(id)a4 inBounds:(CGRect)a5 inAttachment:(id)a6
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  _TtC8PaperKit38CanvasViewSelectionInteractionDelegate *v15;
  id v16;
  id v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x1E0C80A78](v9, v10);
  v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for PKStroke();
  v13 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v14 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v12, 1, 1, v14);
  type metadata accessor for MainActor();
  v15 = self;
  v16 = a3;
  v17 = a6;
  swift_bridgeObjectRetain();
  v18 = static MainActor.shared.getter();
  v19 = (_QWORD *)swift_allocObject();
  v20 = MEMORY[0x1E0DF06E8];
  v19[2] = v18;
  v19[3] = v20;
  v19[4] = v15;
  v19[5] = v13;
  _sScTss5NeverORs_rlE8detached8priority9operationScTyxABGScPSg_xyYaYAcntFZyt_Tgm5((uint64_t)v12, (uint64_t)&async function pointer to partial apply for closure #1 in CanvasViewSelectionInteractionDelegate.selectionInteraction(_:handleGenerationToolForSelectedStrokes:inBounds:inAttachment:), (uint64_t)v19);
  swift_release();
  outlined destroy of StocksKitCurrencyCache.Provider?((uint64_t)v12, &demangling cache variable for type metadata for TaskPriority?);

  swift_bridgeObjectRelease();
}

- (void)selectionInteraction:(id)a3 replaceStrokes:(id)a4 withString:(id)a5 inBounds:(CGRect)a6 inAttachment:(id)a7
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  id v19;
  _TtC8PaperKit38CanvasViewSelectionInteractionDelegate *v20;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  type metadata accessor for PKStroke();
  v14 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v15 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v17 = v16;
  v18 = a3;
  v19 = a7;
  v20 = self;
  specialized CanvasViewSelectionInteractionDelegate.selectionInteraction(_:replace:with:in:in:)(v14, v15, v17, v19, x, y, width, height);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (BOOL)selectionInteraction:(id)a3 handleTapOnCanvasAtLocation:(CGPoint)a4 inAttachment:(id)a5
{
  double y;
  double x;
  id v9;
  id v10;
  _TtC8PaperKit38CanvasViewSelectionInteractionDelegate *v11;
  char v12;

  y = a4.y;
  x = a4.x;
  v9 = a3;
  v10 = a5;
  v11 = self;
  v12 = specialized CanvasViewSelectionInteractionDelegate.selectionInteraction(_:handleTapOnCanvasAtLocation:inAttachment:)(x, y);

  return v12 & 1;
}

- (_TtC8PaperKit38CanvasViewSelectionInteractionDelegate)init
{
  _TtC8PaperKit38CanvasViewSelectionInteractionDelegate *result;

  result = (_TtC8PaperKit38CanvasViewSelectionInteractionDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  outlined destroy of weak AnyContainerCanvasElementView?((uint64_t)self + OBJC_IVAR____TtC8PaperKit38CanvasViewSelectionInteractionDelegate_containerView);
}

@end
