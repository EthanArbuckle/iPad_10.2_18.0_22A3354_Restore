@implementation ContextMenuButton

- (_TtC8VideosUI17ContextMenuButton)initWithType:(unint64_t)a3 interfaceStyle:(unint64_t)a4
{
  _TtC8VideosUI17ContextMenuButton *result;

  sub_1D9B61D50(a3, a4);
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (_TtC8VideosUI17ContextMenuButton)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D9B621D0();
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  void *v4;
  double y;
  double x;
  id v8;
  _TtC8VideosUI17ContextMenuButton *v9;
  uint64_t v10;
  void *v11;

  y = a4.y;
  x = a4.x;
  v8 = a3;
  v9 = self;
  v10 = OUTLINED_FUNCTION_183_0();
  v11 = sub_1D9B62668(v10, x, y);

  return v11;
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  id v8;
  id v9;
  _TtC8VideosUI17ContextMenuButton *v10;

  v8 = a3;
  v9 = a4;
  swift_unknownObjectRetain();
  v10 = self;
  sub_1D9B629C0((uint64_t)v8, v9, a5);

  swift_unknownObjectRelease();
}

- (_TtC8VideosUI17ContextMenuButton)initWithFrame:(CGRect)a3
{
  sub_1D9B62EA8();
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI17ContextMenuButton_contextMenuInteractor));
  sub_1D97BDBFC((uint64_t)self + OBJC_IVAR____TtC8VideosUI17ContextMenuButton_contextMenuInteractorDelegate);
}

@end
