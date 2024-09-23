@implementation CanvasCollaborationStateView

- (_TtC8PaperKit28CanvasCollaborationStateView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v8;
  _TtC8PaperKit28CanvasCollaborationStateView *v9;
  _TtC8PaperKit28CanvasCollaborationStateView *v10;
  objc_super v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  swift_unknownObjectWeakInit();
  v8 = OBJC_IVAR____TtC8PaperKit28CanvasCollaborationStateView_selectionCursors;
  v9 = self;
  *(Class *)((char *)&self->super.super.super.isa + v8) = (Class)specialized Dictionary.init(dictionaryLiteral:)(MEMORY[0x1E0DEE9D8]);

  v12.receiver = v9;
  v12.super_class = (Class)type metadata accessor for CanvasCollaborationStateView();
  v10 = -[CanvasCollaborationStateView initWithFrame:](&v12, sel_initWithFrame_, x, y, width, height);
  -[CanvasCollaborationStateView setUserInteractionEnabled:](v10, sel_setUserInteractionEnabled_, 0);
  return v10;
}

- (_TtC8PaperKit28CanvasCollaborationStateView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  _TtC8PaperKit28CanvasCollaborationStateView *result;

  swift_unknownObjectWeakInit();
  v5 = OBJC_IVAR____TtC8PaperKit28CanvasCollaborationStateView_selectionCursors;
  v6 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)specialized Dictionary.init(dictionaryLiteral:)(MEMORY[0x1E0DEE9D8]);

  result = (_TtC8PaperKit28CanvasCollaborationStateView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  id v8;
  _TtC8PaperKit28CanvasCollaborationStateView *v9;
  UIView_optional *v10;
  void *v11;
  void *v12;
  UIEvent_optional v14;

  y = a3.y;
  x = a3.x;
  v8 = a4;
  v9 = self;
  v14.value.super.isa = (Class)a4;
  CanvasCollaborationStateView.hitTest(_:with:)(v10, (CGPoint)__PAIR128__(*(unint64_t *)&y, *(unint64_t *)&x), v14);
  v12 = v11;

  return v12;
}

- (void)layoutSubviews
{
  _TtC8PaperKit28CanvasCollaborationStateView *v2;

  v2 = self;
  CanvasCollaborationStateView.layoutSubviews()();

}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_bridgeObjectRelease();
}

@end
