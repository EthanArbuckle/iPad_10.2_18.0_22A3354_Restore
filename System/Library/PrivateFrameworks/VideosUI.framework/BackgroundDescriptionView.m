@implementation BackgroundDescriptionView

- (_TtC8VideosUI25BackgroundDescriptionView)initWithFrame:(CGRect)a3
{
  _TtC8VideosUI25BackgroundDescriptionView *result;

  sub_1D9EDFCFC();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (_TtC8VideosUI25BackgroundDescriptionView)initWithCoder:(id)a3
{
  OUTLINED_FUNCTION_34_5((uint64_t)self, (uint64_t)a2, a3);
  sub_1D9EDFE48();
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  void *v4;
  id v5;
  id v6;
  void *v7;

  v5 = a3;
  v6 = OUTLINED_FUNCTION_4_11();
  v7 = sub_1D9EDFEF0((uint64_t)v4);

  return OUTLINED_FUNCTION_15_14(v7);
}

- (id)contextMenuInteraction:(id)a3 previewForHighlightingMenuWithConfiguration:(id)a4
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;

  OUTLINED_FUNCTION_34_5((uint64_t)self, (uint64_t)a2, a3);
  v6 = OUTLINED_FUNCTION_4_11();
  v7 = v4;
  sub_1D9EE005C();
  v9 = v8;

  return OUTLINED_FUNCTION_15_14(v9);
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  id v8;
  id v9;
  _TtC8VideosUI25BackgroundDescriptionView *v10;

  v8 = a3;
  v9 = a4;
  swift_unknownObjectRetain();
  v10 = self;
  sub_1D9EE0104((uint64_t)v10, v9, a5);

  swift_unknownObjectRelease();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI25BackgroundDescriptionView_contextMenuInteraction));
  swift_release();
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI25BackgroundDescriptionView_contextMenuInteractor);
  sub_1D97BDBFC((uint64_t)self + OBJC_IVAR____TtC8VideosUI25BackgroundDescriptionView_contextMenuInteractorDelegate);
}

@end
