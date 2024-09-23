@implementation LinkView

- (_TtC8PaperKit8LinkView)init
{
  objc_super v4;

  *(_QWORD *)((char *)&self->super.super._responderFlags + OBJC_IVAR____TtC8PaperKit8LinkView_delegate) = 0;
  swift_unknownObjectWeakInit();
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC8PaperKit8LinkView_isSelected) = 0;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for LinkView();
  return -[LinkView initWithFrame:](&v4, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
}

- (_TtC8PaperKit8LinkView)initWithCoder:(id)a3
{
  id v5;
  _TtC8PaperKit8LinkView *result;

  *(_QWORD *)((char *)&self->super.super._responderFlags + OBJC_IVAR____TtC8PaperKit8LinkView_delegate) = 0;
  swift_unknownObjectWeakInit();
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC8PaperKit8LinkView_isSelected) = 0;
  v5 = a3;

  result = (_TtC8PaperKit8LinkView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (_TtC8PaperKit8LinkView)initWithFrame:(CGRect)a3
{
  _TtC8PaperKit8LinkView *result;

  result = (_TtC8PaperKit8LinkView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  outlined destroy of weak AnyContainerCanvasElementView?((uint64_t)self + OBJC_IVAR____TtC8PaperKit8LinkView_delegate);
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  id v5;
  _TtC8PaperKit8LinkView *v6;
  id v7;

  v5 = a3;
  v6 = self;
  v7 = specialized LinkView.contextMenuInteraction(_:configurationForMenuAtLocation:)();

  return v7;
}

- (id)contextMenuInteraction:(id)a3 previewForHighlightingMenuWithConfiguration:(id)a4
{
  return objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3D90]), sel_initWithView_, self);
}

- (void)contextMenuInteraction:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  objc_msgSend(a5, sel_setPreferredCommitStyle_, 1, a4);
}

@end
