@implementation CanvasElementDrawingView

- (_TtC8PaperKit24CanvasElementDrawingView)initWithFrame:(CGRect)a3 drawing:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  uint64_t v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = type metadata accessor for PKDrawing();
  MEMORY[0x1E0C80A78](v9, v10);
  v12 = (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = a4;
  static PKDrawing._unconditionallyBridgeFromObjectiveC(_:)();

  return (_TtC8PaperKit24CanvasElementDrawingView *)CanvasElementDrawingView.init(frame:drawing:)((uint64_t)v12, x, y, width, height);
}

- (_TtC8PaperKit24CanvasElementDrawingView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  specialized CanvasElementDrawingView.init(coder:)();
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  id v8;
  _TtC8PaperKit24CanvasElementDrawingView *v9;
  UIView_optional *v10;
  void *v11;
  void *v12;
  UIEvent_optional v14;

  y = a3.y;
  x = a3.x;
  v8 = a4;
  v9 = self;
  v14.value.super.isa = (Class)a4;
  CanvasElementDrawingView.hitTest(_:with:)(v10, (CGPoint)__PAIR128__(*(unint64_t *)&y, *(unint64_t *)&x), v14);
  v12 = v11;

  return v12;
}

- (void)didMoveToWindow
{
  _TtC8PaperKit24CanvasElementDrawingView *v2;

  v2 = self;
  CanvasElementDrawingView.didMoveToWindow()();

}

- (void)layoutSubviews
{
  _TtC8PaperKit24CanvasElementDrawingView *v2;

  v2 = self;
  CanvasElementDrawingView.layoutSubviews()();

}

- (BOOL)_handleSingleTapAtDrawingLocation:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  _TtC8PaperKit24CanvasElementDrawingView *v5;
  Swift::Bool v6;

  y = a3.y;
  x = a3.x;
  v5 = self;
  v6 = CanvasElementDrawingView._handleSingleTap(atDrawingLocation:)((CGPoint)__PAIR128__(*(unint64_t *)&y, *(unint64_t *)&x));

  return v6;
}

- (void)eraserMovedToLocation:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  _TtC8PaperKit24CanvasElementDrawingView *v5;

  y = a3.y;
  x = a3.x;
  v5 = self;
  CanvasElementDrawingView.eraserMoved(toLocation:)((CGPoint)__PAIR128__(*(unint64_t *)&y, *(unint64_t *)&x));

}

- (NSArray)additionalStrokes
{
  id v2;
  NSArray *v3;
  NSArray *v4;
  Class isa;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for CanvasElementDrawingView();
  v2 = v7.receiver;
  v3 = -[PKAttachmentView additionalStrokes](&v7, sel_additionalStrokes);
  if (v3)
  {
    v4 = v3;
    type metadata accessor for PKStroke();
    static Array._unconditionallyBridgeFromObjectiveC(_:)();

    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    return (NSArray *)isa;
  }
  else
  {

    return (NSArray *)0;
  }
}

- (void)setAdditionalStrokes:(id)a3
{
  void *isa;
  _TtC8PaperKit24CanvasElementDrawingView *v5;
  _TtC8PaperKit24CanvasElementDrawingView *v6;
  objc_super v7;

  isa = a3;
  if (a3)
  {
    type metadata accessor for PKStroke();
    static Array._unconditionallyBridgeFromObjectiveC(_:)();
    v5 = self;
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = self;
  }
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for CanvasElementDrawingView();
  -[PKAttachmentView setAdditionalStrokes:](&v7, sel_setAdditionalStrokes_, isa);

  CanvasElementDrawingView.additionalStrokes.didset();
}

- (BOOL)canBecomeFirstResponder
{
  _QWORD *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _TtC8PaperKit24CanvasElementDrawingView *v7;
  unsigned __int8 v8;

  v3 = (_QWORD *)MEMORY[0x1DF0E666C]((char *)self + OBJC_IVAR____TtC8PaperKit24CanvasElementDrawingView_canvasElementView, a2);
  if (!v3)
    return 0;
  v4 = v3;
  v5 = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v3) + 0x88))();
  if (v5)
  {
    v6 = (void *)v5;
    v7 = self;
    v8 = objc_msgSend(v6, sel_canBecomeFirstResponder);

    v4 = v6;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)becomeFirstResponder
{
  _TtC8PaperKit24CanvasElementDrawingView *v2;

  v2 = self;
  CanvasElementDrawingView.becomeFirstResponder()((uint64_t)&unk_1EA840868, (uint64_t)partial apply for closure #1 in CanvasElementDrawingView.becomeFirstResponder(), (uint64_t)&block_descriptor_6_0);

  return 0;
}

- (BOOL)resignFirstResponder
{
  _TtC8PaperKit24CanvasElementDrawingView *v2;

  v2 = self;
  CanvasElementDrawingView.becomeFirstResponder()((uint64_t)&unk_1EA840818, (uint64_t)partial apply for closure #1 in CanvasElementDrawingView.resignFirstResponder(), (uint64_t)&block_descriptor_9);

  return 0;
}

- (PKTiledView)tiledView
{
  _QWORD *v3;
  void *v4;
  _QWORD *v5;
  _QWORD *v6;
  _TtC8PaperKit24CanvasElementDrawingView *v7;

  v3 = (_QWORD *)MEMORY[0x1DF0E666C]((char *)self + OBJC_IVAR____TtC8PaperKit24CanvasElementDrawingView_canvasElementView, a2);
  v4 = v3;
  if (v3)
  {
    v5 = (_QWORD *)MEMORY[0x1E0DEEDD8];
    v6 = (_QWORD *)(*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v3) + 0x88))();
    v7 = self;

    if (v6)
    {
      v4 = (void *)(*(uint64_t (**)(void))((*v5 & *v6) + 0x320))();

    }
    else
    {

      v4 = 0;
    }
  }
  return (PKTiledView *)v4;
}

- (void)drawingDidChangeVisibleStrokes:(BOOL)a3
{
  _TtC8PaperKit24CanvasElementDrawingView *v4;

  v4 = self;
  CanvasElementDrawingView.drawingDidChangeVisibleStrokes(_:)(a3);

}

- (id)inlineViewAtPoint:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  _TtC8PaperKit24CanvasElementDrawingView *v5;
  UIView_optional *v6;
  void *v7;
  void *v8;

  y = a3.y;
  x = a3.x;
  v5 = self;
  CanvasElementDrawingView.inlineView(at:)(v6, (CGPoint)__PAIR128__(*(unint64_t *)&y, *(unint64_t *)&x));
  v8 = v7;

  return v8;
}

- (CGAffineTransform)drawingTransform
{
  _TtC8PaperKit24CanvasElementDrawingView *v4;
  CGAffineTransform *result;
  __int128 v6;
  __int128 v7;
  __int128 v8[3];

  v4 = self;
  CanvasElementDrawingView.drawingTransform.getter(v8);

  v6 = v8[1];
  v7 = v8[2];
  *(_OWORD *)&retstr->a = v8[0];
  *(_OWORD *)&retstr->c = v6;
  *(_OWORD *)&retstr->tx = v7;
  return result;
}

- (void)didBeginDrawing
{
  _TtC8PaperKit24CanvasElementDrawingView *v2;

  v2 = self;
  CanvasElementDrawingView.didBeginDrawing()();

}

- (void)didEndDrawing
{
  char *v2;
  char *v3;
  uint64_t v4;
  char *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for CanvasElementDrawingView();
  v2 = (char *)v6.receiver;
  -[PKAttachmentView didEndDrawing](&v6, sel_didEndDrawing);
  v3 = (char *)MEMORY[0x1DF0E666C](&v2[OBJC_IVAR____TtC8PaperKit24CanvasElementDrawingView_canvasElementView]);
  if (v3)
  {
    v5 = v3;
    (*(void (**)(char *, uint64_t))((*MEMORY[0x1E0DEEDD8] & *(_QWORD *)v3) + 0x2C8))(v3, v4);

    v2 = v5;
  }

}

- (void)beganStroke:(id)a3
{
  @objc CanvasElementDrawingView.beganStroke(_:)(self, (uint64_t)a2, a3, (void (*)(char *))CanvasElementDrawingView.beganStroke(_:));
}

- (void)cancelledStroke:(id)a3
{
  @objc CanvasElementDrawingView.beganStroke(_:)(self, (uint64_t)a2, a3, (void (*)(char *))CanvasElementDrawingView.cancelledStroke(_:));
}

- (void)displayLinkUpdateLiveDrawing
{
  _TtC8PaperKit24CanvasElementDrawingView *v2;

  v2 = self;
  CanvasElementDrawingView.displayLinkUpdateLiveDrawing()();

}

- (void)drawingDidEraseStrokes:(id)a3
{
  uint64_t v4;
  _TtC8PaperKit24CanvasElementDrawingView *v5;

  type metadata accessor for PKStroke();
  v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = self;
  CanvasElementDrawingView.drawingDidEraseStrokes(_:)((Swift::OpaquePointer)v4);

  swift_bridgeObjectRelease();
}

- (void)endedStroke:(id)a3
{
  @objc CanvasElementDrawingView.beganStroke(_:)(self, (uint64_t)a2, a3, (void (*)(char *))CanvasElementDrawingView.endedStroke(_:));
}

- (void)selectionDidChange
{
  _QWORD *v3;
  void (*v4)(void);
  _TtC8PaperKit24CanvasElementDrawingView *v5;
  id v6;

  v3 = (_QWORD *)MEMORY[0x1DF0E666C]((char *)self + OBJC_IVAR____TtC8PaperKit24CanvasElementDrawingView_canvasElementView, a2);
  if (v3)
  {
    v4 = *(void (**)(void))((*MEMORY[0x1E0DEEDD8] & *v3) + 0x2B8);
    v6 = v3;
    v5 = self;
    v4();

  }
}

- (void)updateFrameForTextContainer
{
  _TtC8PaperKit24CanvasElementDrawingView *v2;

  v2 = self;
  CanvasElementDrawingView.updateFrameForTextContainer()();

}

- (BOOL)isAtEndOfDocument
{
  _TtC8PaperKit24CanvasElementDrawingView *v2;
  char v3;

  v2 = self;
  v3 = CanvasElementDrawingView.isAtEndOfDocument.getter();

  return v3 & 1;
}

- (BOOL)hitByTouchLocation:(CGPoint)a3 bounds:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v8;
  CGFloat v9;
  _TtC8PaperKit24CanvasElementDrawingView *v10;
  Swift::Bool v11;
  __C::CGRect v13;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3.y;
  v9 = a3.x;
  v10 = self;
  v13.origin.x = x;
  v13.origin.y = y;
  v13.size.width = width;
  v13.size.height = height;
  v11 = CanvasElementDrawingView.hit(byTouchLocation:bounds:)((CGPoint)__PAIR128__(*(unint64_t *)&v8, *(unint64_t *)&v9), v13);

  return v11;
}

- (BOOL)updateHeightAfterDrawing
{
  return 0;
}

- (double)heightFromDrawing:(id)a3 delta:(double)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  _TtC8PaperKit24CanvasElementDrawingView *v13;
  double v14;
  double v15;
  uint64_t v17;

  v7 = type metadata accessor for PKDrawing();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7, v9);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = a3;
  v13 = self;
  static PKDrawing._unconditionallyBridgeFromObjectiveC(_:)();

  CanvasElementDrawingView.height(from:delta:)(a4);
  v15 = v14;

  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
  return v15;
}

- (void)updateDrawingHeight:(double)a3
{
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  void (*v9)(double);
  _TtC8PaperKit24CanvasElementDrawingView *v10;
  void *v11;
  id v12;

  v5 = (_QWORD *)MEMORY[0x1DF0E666C]((char *)self + OBJC_IVAR____TtC8PaperKit24CanvasElementDrawingView_canvasElementView, a2);
  if (v5)
  {
    v6 = (_QWORD *)MEMORY[0x1E0DEEDD8];
    v12 = v5;
    v7 = (_QWORD *)(*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v5) + 0x88))();
    if (v7)
    {
      v8 = v7;
      v9 = *(void (**)(double))((*v6 & *v7) + 0x5A0);
      v10 = self;
      v9(a3);

      v11 = v8;
    }
    else
    {
      v11 = v12;
    }

  }
}

- (UIView)attachmentContainerView
{
  _TtC8PaperKit24CanvasElementDrawingView *v2;
  id v3;

  v2 = self;
  v3 = CanvasElementDrawingView.attachmentContainerView.getter();

  return (UIView *)v3;
}

- (id)hitMiniMenu:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  _TtC8PaperKit24CanvasElementDrawingView *v5;
  UIView_optional *v6;
  void *v7;
  void *v8;

  y = a3.y;
  x = a3.x;
  v5 = self;
  CanvasElementDrawingView.hitMiniMenu(_:)(v6, (CGPoint)__PAIR128__(*(unint64_t *)&y, *(unint64_t *)&x));
  v8 = v7;

  return v8;
}

- (BOOL)hitChrome:(CGPoint)a3 isStylus:(BOOL)a4
{
  CGFloat y;
  CGFloat x;
  _TtC8PaperKit24CanvasElementDrawingView *v7;
  Swift::Bool v8;

  y = a3.y;
  x = a3.x;
  v7 = self;
  v8 = CanvasElementDrawingView.hitChrome(_:isStylus:)((CGPoint)__PAIR128__(*(unint64_t *)&y, *(unint64_t *)&x), a4);

  return v8;
}

- (void)setAttachmentChromeVisible:(BOOL)a3 animated:(BOOL)a4 highlightBackground:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  _BOOL8 v7;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  _QWORD *v12;
  void (*v13)(_BOOL8, _BOOL8, _BOOL8);
  _TtC8PaperKit24CanvasElementDrawingView *v14;
  void *v15;
  id v16;

  v5 = a5;
  v6 = a4;
  v7 = a3;
  v9 = (_QWORD *)MEMORY[0x1DF0E666C]((char *)self + OBJC_IVAR____TtC8PaperKit24CanvasElementDrawingView_canvasElementView, a2);
  if (v9)
  {
    v10 = (_QWORD *)MEMORY[0x1E0DEEDD8];
    v16 = v9;
    v11 = (_QWORD *)(*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v9) + 0x88))();
    if (v11)
    {
      v12 = v11;
      v13 = *(void (**)(_BOOL8, _BOOL8, _BOOL8))((*v10 & *v11) + 0x600);
      v14 = self;
      v13(v7, v6, v5);

      v15 = v12;
    }
    else
    {
      v15 = v16;
    }

  }
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit24CanvasElementDrawingView_liveStreamingDisplayLink));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit24CanvasElementDrawingView_liveErasingDrawing));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit24CanvasElementDrawingView_mathRecognitionDelegate));
}

@end
