@implementation CanvasElementResizeViewMoreButton

- (_TtC8PaperKit33CanvasElementResizeViewMoreButton)init
{
  _TtC8PaperKit33CanvasElementResizeViewMoreButton *result;

  CanvasElementResizeViewMoreButton.init()();
  return result;
}

- (void)didMoveToWindow
{
  _TtC8PaperKit33CanvasElementResizeViewMoreButton *v2;

  v2 = self;
  CanvasElementResizeViewMoreButton.didMoveToWindow()();

}

- (_TtC8PaperKit33CanvasElementResizeViewMoreButton)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  specialized CanvasElementResizeViewMoreButton.init(coder:)();
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  double y;
  double x;
  uint64_t v8;
  void *v9;
  id v10;
  _TtC8PaperKit33CanvasElementResizeViewMoreButton *v11;
  id v12;

  y = a4.y;
  x = a4.x;
  v8 = MEMORY[0x1DF0E666C]((char *)self + OBJC_IVAR____TtC8PaperKit33CanvasElementResizeViewMoreButton_delegate, a2);
  if (v8)
  {
    v9 = (void *)v8;
    v10 = a3;
    v11 = self;
    v12 = objc_msgSend(v9, sel_contextMenuInteraction_configurationForMenuAtLocation_, v10, x, y);

    swift_unknownObjectRelease();
  }
  else
  {
    v12 = 0;
  }
  return v12;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  return a5;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v6;
  id v7;
  _TtC8PaperKit33CanvasElementResizeViewMoreButton *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = (void *)specialized CanvasElementResizeViewMoreButton.pointerInteraction(_:styleFor:)(v6);

  return v9;
}

- (_TtC8PaperKit33CanvasElementResizeViewMoreButton)initWithFrame:(CGRect)a3
{
  _TtC8PaperKit33CanvasElementResizeViewMoreButton *result;

  result = (_TtC8PaperKit33CanvasElementResizeViewMoreButton *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  outlined destroy of weak AnyContainerCanvasElementView?((uint64_t)self + OBJC_IVAR____TtC8PaperKit33CanvasElementResizeViewMoreButton_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit33CanvasElementResizeViewMoreButton_imageView));
}

@end
