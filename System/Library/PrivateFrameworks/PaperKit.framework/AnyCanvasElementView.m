@implementation AnyCanvasElementView

- (_TtC8PaperKit20AnyCanvasElementView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  specialized AnyCanvasElementView.init(coder:)();
}

- (_TtC8PaperKit20AnyCanvasElementView)initWithFrame:(CGRect)a3
{
  _TtC8PaperKit20AnyCanvasElementView *result;

  result = (_TtC8PaperKit20AnyCanvasElementView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  return 0;
}

- (id)contextMenuInteraction:(id)a3 previewForHighlightingMenuWithConfiguration:(id)a4
{
  return objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3D90]), sel_initWithView_, self);
}

- (void)contextMenuInteraction:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  objc_msgSend(a5, sel_setPreferredCommitStyle_, 1, a4);
}

- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5
{
  @objc AnyCanvasElementView.contextMenuInteraction(_:willDisplayMenuFor:animator:)(self, (uint64_t)a2, a3, a4, (uint64_t)a5, specialized AnyCanvasElementView.contextMenuInteraction(_:willDisplayMenuFor:animator:));
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  @objc AnyCanvasElementView.contextMenuInteraction(_:willDisplayMenuFor:animator:)(self, (uint64_t)a2, a3, a4, (uint64_t)a5, specialized AnyCanvasElementView.contextMenuInteraction(_:willEndFor:animator:));
}

- (CGRect)textBoxViewActiveTextBoxFrame:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v3 = 0.0;
  v4 = 0.0;
  v5 = 0.0;
  v6 = 0.0;
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

@end
