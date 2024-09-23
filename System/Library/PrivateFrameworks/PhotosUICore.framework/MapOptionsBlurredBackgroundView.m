@implementation MapOptionsBlurredBackgroundView

- (_TtC12PhotosUICore31MapOptionsBlurredBackgroundView)init
{
  return (_TtC12PhotosUICore31MapOptionsBlurredBackgroundView *)sub_1A6F9423C();
}

- (_TtC12PhotosUICore31MapOptionsBlurredBackgroundView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC12PhotosUICore31MapOptionsBlurredBackgroundView *result;

  v5 = OBJC_IVAR____TtC12PhotosUICore31MapOptionsBlurredBackgroundView_backdropView;
  v6 = objc_allocWithZone(MEMORY[0x1E0DC4498]);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);

  result = (_TtC12PhotosUICore31MapOptionsBlurredBackgroundView *)sub_1A7AE4AFC();
  __break(1u);
  return result;
}

- (_TtC12PhotosUICore31MapOptionsBlurredBackgroundView)initWithEffect:(id)a3
{
  id v3;
  _TtC12PhotosUICore31MapOptionsBlurredBackgroundView *result;

  v3 = a3;
  result = (_TtC12PhotosUICore31MapOptionsBlurredBackgroundView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12PhotosUICore31MapOptionsBlurredBackgroundView_backdropView));
}

@end
