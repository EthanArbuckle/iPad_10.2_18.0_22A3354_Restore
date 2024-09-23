@implementation CanvasElementResizeView

- (void)didMoveToWindow
{
  _TtC8PaperKit23CanvasElementResizeView *v2;

  v2 = self;
  CanvasElementResizeView.didMoveToWindow()();

}

- (_TtC8PaperKit23CanvasElementResizeView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  specialized CanvasElementResizeView.init(coder:)();
}

- (void)layoutSubviews
{
  char *v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CanvasElementResizeView();
  v2 = (char *)v3.receiver;
  -[ResizeView layoutSubviews](&v3, sel_layoutSubviews);
  if (*(_QWORD *)&v2[OBJC_IVAR____TtC8PaperKit23CanvasElementResizeView_miniMenuController])
  {
    swift_retain();
    MiniMenuController.update()();

    swift_release();
  }
  else
  {

  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  id v8;
  _TtC8PaperKit23CanvasElementResizeView *v9;
  UIView_optional *v10;
  void *v11;
  void *v12;
  UIEvent_optional v14;

  y = a3.y;
  x = a3.x;
  v8 = a4;
  v9 = self;
  v14.value.super.isa = (Class)a4;
  CanvasElementResizeView.hitTest(_:with:)(v10, (CGPoint)__PAIR128__(*(unint64_t *)&y, *(unint64_t *)&x), v14);
  v12 = v11;

  return v12;
}

- (void)controlHandleMoved:(id)a3
{
  UIPanGestureRecognizer *v4;
  _TtC8PaperKit23CanvasElementResizeView *v5;

  v4 = (UIPanGestureRecognizer *)a3;
  v5 = self;
  CanvasElementResizeView.controlHandleMoved(_:)(v4);

}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  UIGestureRecognizer *v4;
  _TtC8PaperKit23CanvasElementResizeView *v5;

  v4 = (UIGestureRecognizer *)a3;
  v5 = self;
  LOBYTE(self) = CanvasElementResizeView.gestureRecognizerShouldBegin(_:)(v4);

  return self & 1;
}

- (void)tapped:(id)a3
{
  UITapGestureRecognizer *v4;
  _TtC8PaperKit23CanvasElementResizeView *v5;

  v4 = (UITapGestureRecognizer *)a3;
  v5 = self;
  CanvasElementResizeView.tapped(_:)(v4);

}

- (void)doubleTapped:(id)a3
{
  UITapGestureRecognizer *v4;
  _TtC8PaperKit23CanvasElementResizeView *v5;

  v4 = (UITapGestureRecognizer *)a3;
  v5 = self;
  CanvasElementResizeView.doubleTapped(_:)(v4);

}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  CGFloat y;
  CGFloat x;
  id v7;
  _TtC8PaperKit23CanvasElementResizeView *v8;
  void *v9;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  v8 = self;
  v9 = (void *)CanvasElementResizeView.contextMenuInteraction(_:configurationForMenuAtLocation:)((UIContextMenuInteraction)v7, (CGPoint)__PAIR128__(*(unint64_t *)&y, *(unint64_t *)&x));

  return v9;
}

- (id)contextMenuInteraction:(id)a3 previewForHighlightingMenuWithConfiguration:(id)a4
{
  id v6;
  id v7;
  _TtC8PaperKit23CanvasElementResizeView *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = (void *)CanvasElementResizeView.contextMenuInteraction(_:previewForHighlightingMenuWithConfiguration:)((UIContextMenuInteraction)v6, (UIContextMenuConfiguration)v7);

  return v9;
}

- (void)contextMenuInteraction:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v8;
  id v9;
  _TtC8PaperKit23CanvasElementResizeView *v10;

  v8 = a3;
  v9 = a4;
  swift_unknownObjectRetain();
  v10 = self;
  specialized CanvasElementResizeView.contextMenuInteraction(_:willPerformPreviewActionForMenuWith:animator:)(a5);

  swift_unknownObjectRelease();
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit23CanvasElementResizeView_moreButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit23CanvasElementResizeView_contextMenuInteraction));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit23CanvasElementResizeView_tapGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit23CanvasElementResizeView_doubleTapGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit23CanvasElementResizeView_draggedImage));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (int64_t)_dragInteraction:(id)a3 dataOwnerForSession:(id)a4
{
  _TtC8PaperKit23CanvasElementResizeView *v6;
  _TtC8PaperKit23CanvasElementResizeView *v7;
  id v8;
  id v9;

  v6 = (_TtC8PaperKit23CanvasElementResizeView *)MEMORY[0x1DF0E666C]((char *)self + OBJC_IVAR____TtC8PaperKit10ResizeView_canvas, a2);
  if (!v6)
    v6 = self;
  v7 = self;
  v8 = a3;
  swift_unknownObjectRetain();
  v9 = -[CanvasElementResizeView _dragDataOwner](v6, sel__dragDataOwner);

  swift_unknownObjectRelease();
  return (int64_t)v9;
}

- (int64_t)_dragInteraction:(id)a3 dataOwnerForAddingToSession:(id)a4 withTouchAtPoint:(CGPoint)a5
{
  _TtC8PaperKit23CanvasElementResizeView *v7;
  _TtC8PaperKit23CanvasElementResizeView *v8;
  id v9;
  id v10;

  v7 = (_TtC8PaperKit23CanvasElementResizeView *)MEMORY[0x1DF0E666C]((char *)self + OBJC_IVAR____TtC8PaperKit10ResizeView_canvas, a2, (__n128)a5, *(__n128 *)&a5.y);
  if (!v7)
    v7 = self;
  v8 = self;
  v9 = a3;
  swift_unknownObjectRetain();
  v10 = -[CanvasElementResizeView _dragDataOwner](v7, sel__dragDataOwner);

  swift_unknownObjectRelease();
  return (int64_t)v10;
}

- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5
{
  id v8;
  id v9;
  _TtC8PaperKit23CanvasElementResizeView *v10;
  void *v11;

  v8 = a3;
  v9 = a4;
  swift_unknownObjectRetain();
  v10 = self;
  v11 = (void *)specialized CanvasElementResizeView.dragInteraction(_:previewForLifting:session:)((uint64_t)v9, (uint64_t)a5);

  swift_unknownObjectRelease();
  return v11;
}

- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4
{
  id v6;
  _TtC8PaperKit23CanvasElementResizeView *v7;
  Class isa;

  v6 = a3;
  swift_unknownObjectRetain();
  v7 = self;
  specialized CanvasElementResizeView.dragInteraction(_:itemsForBeginning:)(a4);

  swift_unknownObjectRelease();
  type metadata accessor for NSObject(0, (unint64_t *)&lazy cache variable for type metadata for UIDragItem);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return isa;
}

- (void)dragInteraction:(id)a3 sessionWillBegin:(id)a4
{
  id v5;
  _TtC8PaperKit23CanvasElementResizeView *v6;

  v5 = a3;
  swift_unknownObjectRetain();
  v6 = self;
  specialized CanvasElementResizeView.dragInteraction(_:sessionWillBegin:)();

  swift_unknownObjectRelease();
}

- (id)dragInteraction:(id)a3 previewForCancellingItem:(id)a4 withDefault:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC8PaperKit23CanvasElementResizeView *v11;
  void *v12;
  void *v13;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  specialized CanvasElementResizeView.dragInteraction(_:previewForCancelling:withDefault:)(v10);
  v13 = v12;

  return v13;
}

- (void)dragInteraction:(id)a3 session:(id)a4 didEndWithOperation:(unint64_t)a5
{
  id v8;
  _TtC8PaperKit23CanvasElementResizeView *v9;

  v8 = a3;
  swift_unknownObjectRetain();
  v9 = self;
  specialized CanvasElementResizeView.dragInteraction(_:session:didEndWith:)(a4, a5);

  swift_unknownObjectRelease();
}

@end
