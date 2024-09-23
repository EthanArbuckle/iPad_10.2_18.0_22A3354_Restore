@implementation CanvasElementPDFAnnotationAppearanceStreamView

- (_TtC8PaperKit46CanvasElementPDFAnnotationAppearanceStreamView)initWithCoder:(id)a3
{
  id v5;
  _TtC8PaperKit46CanvasElementPDFAnnotationAppearanceStreamView *result;

  swift_unknownObjectWeakInit();
  v5 = a3;

  result = (_TtC8PaperKit46CanvasElementPDFAnnotationAppearanceStreamView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  _TtC8PaperKit46CanvasElementPDFAnnotationAppearanceStreamView *v7;
  __C::CGRect v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  v8.origin.x = x;
  v8.origin.y = y;
  v8.size.width = width;
  v8.size.height = height;
  CanvasElementPDFAnnotationAppearanceStreamView.draw(_:)(v8);

}

- (_TtC8PaperKit46CanvasElementPDFAnnotationAppearanceStreamView)initWithFrame:(CGRect)a3
{
  _TtC8PaperKit46CanvasElementPDFAnnotationAppearanceStreamView *result;

  result = (_TtC8PaperKit46CanvasElementPDFAnnotationAppearanceStreamView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
}

@end
